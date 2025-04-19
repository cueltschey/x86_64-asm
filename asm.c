#define _POSIX_C_SOURCE 200809L
#include "asm.h"
#include "elf.h"
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void asm_error(asm_state_t *state, const char *err_msg) {
  fprintf(stderr, "Error occured in file %s line %ld: %s\n",
          state->input_files[state->current_file], state->current_line,
          err_msg);
}

int add_symbol(asm_state_t *state, const char *name, uint16_t shndx,
               Elf64_Addr value, uint8_t type, uint8_t binding) {
  for (size_t i = 0; i < state->nof_symbols; ++i) {
    if (strcmp(state->symbols[i].name, name) == 0) {
      if (!state->symbols[i].defined || binding == STB_GLOBAL) {
        if (shndx != SHN_UNDEF) { // Don't overwrite section if already defined
          state->symbols[i].shndx = shndx;
          state->symbols[i].value = value;
          state->symbols[i].defined = true;
        }
        if (binding == STB_GLOBAL) {
          uint8_t current_type = ELF64_ST_TYPE(state->symbols[i].info);
          state->symbols[i].info = ELF64_ST_INFO(binding, current_type);
          state->symbols[i].global = true;
        }
      } else if (state->symbols[i].defined && shndx != SHN_UNDEF &&
                 state->symbols[i].shndx != SHN_UNDEF) {
        char err_msg[128];
        snprintf(err_msg, sizeof(err_msg), "Symbol '%s' redefined", name);
        asm_error(state, err_msg);
        return -1;
      }
      return i;
    }
  }

  if (state->nof_symbols >= MAX_SYMBOLS) {
    asm_error(state, "Maximum number of symbols reached");
    return -1;
  }

  elf_symbol_t *sym = &state->symbols[state->nof_symbols];
  strncpy(sym->name, name, sizeof(sym->name) - 1);
  sym->name[sizeof(sym->name) - 1] = '\0'; // Ensure null-termination
  sym->value = value;
  sym->size = 0;
  sym->info = ELF64_ST_INFO(binding, type);
  sym->other = STV_DEFAULT;
  sym->shndx = shndx;
  sym->defined = (shndx != SHN_UNDEF);
  sym->global = (binding == STB_GLOBAL);
  sym->name_idx = 0;

  strncpy(sym->name, name, sizeof(sym->name));

  return state->nof_symbols++;
}

void build_elf_strtab_symtab(asm_state_t *state) {
  elf_section_t *symtab_sec = &state->sections[state->symtab_idx];
  elf_section_t *strtab_sec = &state->sections[state->strtab_idx];

  buffer_destroy(&symtab_sec->content);
  buffer_init(&symtab_sec->content);

  // The first symbol (index 0) is always the NULL symbol, add it explicitly
  Elf64_Sym null_sym;
  memset(&null_sym, 0, sizeof(Elf64_Sym));
  buffer_append(&symtab_sec->content, &null_sym, sizeof(Elf64_Sym));

  int first_global_idx = -1;

  for (size_t i = 1; i < state->nof_symbols; ++i) {
    elf_symbol_t *my_sym = &state->symbols[i];
    Elf64_Sym elf_sym;
    memset(&elf_sym, 0, sizeof(Elf64_Sym));

    if (strlen(my_sym->name) > 0) {
      size_t name_len = strlen(my_sym->name);
      my_sym->name_idx = strtab_sec->content.size;
      buffer_append(&strtab_sec->content, my_sym->name, name_len);
      buffer_append(&strtab_sec->content, "\0", 1);
    } else {
      my_sym->name_idx = 0;
    }

    // Populate the Elf64_Sym structure
    elf_sym.st_name = my_sym->name_idx;
    elf_sym.st_info = my_sym->info;
    elf_sym.st_other = my_sym->other;
    elf_sym.st_shndx = my_sym->shndx;
    elf_sym.st_value = my_sym->value;
    elf_sym.st_size = my_sym->size;

    buffer_append(&symtab_sec->content, &elf_sym, sizeof(Elf64_Sym));

    if (first_global_idx == -1 && ELF64_ST_BIND(elf_sym.st_info) != STB_LOCAL) {
      first_global_idx = i;
    }
  }
  strtab_sec->size = strtab_sec->content.size;

  symtab_sec->link = state->strtab_idx;
  symtab_sec->info =
      first_global_idx == -1 ? (int)state->nof_symbols : first_global_idx;
  symtab_sec->size = symtab_sec->content.size;
}

void add_section(asm_state_t *state, const char *name, Elf64_Word type,
                 Elf64_Xword flags, Elf64_Xword addralign,
                 Elf64_Xword entsize) {
  if (state->nof_sections >= MAX_SECTIONS) {
    fprintf(stderr, "Error: Maximum number of sections reached (%d)\n",
            MAX_SECTIONS);
    exit(EXIT_FAILURE); // Or handle more gracefully
  }
  elf_section_t *sec = &state->sections[state->nof_sections];
  strncpy(sec->name, name, sizeof(sec->name) - 1);
  sec->name[sizeof(sec->name) - 1] = '\0';
  sec->type = type;
  sec->flags = flags;
  sec->addr = 0;
  sec->offset = 0; // Will be calculated later
  sec->size = 0;   // Will be calculated later or based on content
  sec->link = 0;   // Set later if needed (e.g., symtab->strtab)
  sec->info = 0;   // Set later if needed (e.g., symtab)
  sec->addralign = addralign;
  sec->entsize = entsize;
  buffer_init(&sec->content);
  sec->allocated = true; // Assume we'll allocate content buffer

  if (strcmp(name, ".text") == 0)
    state->text_idx = state->nof_sections;
  else if (strcmp(name, ".note.GNU-stack") == 0)
    state->note_idx = state->nof_sections;
  else if (strcmp(name, ".symtab") == 0)
    state->symtab_idx = state->nof_sections;
  else if (strcmp(name, ".strtab") == 0)
    state->strtab_idx = state->nof_sections;
  else if (strcmp(name, ".shstrtab") == 0)
    state->shstrtab_idx = state->nof_sections;
  else if (strcmp(name, ".rodata") == 0)
    state->rodata_idx = state->nof_sections;

  state->nof_sections++;
}

void assembler_init(asm_state_t *state) {
  memset(state, 0, sizeof(asm_state_t));
  state->output_file = "a.out";
  state->current_file = 0;
  state->current_line = 0;
  state->parse_mode = TEXT;

  state->text_idx = -1;
  state->note_idx = -1;
  state->symtab_idx = -1;
  state->strtab_idx = -1;
  state->shstrtab_idx = -1;
  state->rodata_idx = -1;

  // Add mandatory NULL section
  add_section(state, "", SHT_NULL, 0, 0, 0); // Section 0 is always NULL

  add_section(state, ".text", SHT_PROGBITS, SHF_ALLOC | SHF_EXECINSTR, 4, 0);
  add_section(state, ".rodata", SHT_PROGBITS, SHF_ALLOC, 4, 0);
  add_section(state, ".note.GNU-stack", SHT_PROGBITS, 0, 1, 0);
  add_section(state, ".symtab", SHT_SYMTAB, 0, 8, sizeof(Elf64_Sym));
  add_section(state, ".strtab", SHT_STRTAB, 0, 1, 0);
  add_section(state, ".shstrtab", SHT_STRTAB, 0, 1, 0);

  // Symbol 0: NULL symbol
  add_symbol(state, "", SHN_UNDEF, 0, STT_NOTYPE, STB_LOCAL);

  // Initialize string tables with the required initial NULL byte
  buffer_append(&state->sections[state->strtab_idx].content, "\0", 1);
  buffer_append(&state->sections[state->shstrtab_idx].content, "\0", 1);

  state->nof_rodata_entries = 0;
}

void assembler_add_input_file(asm_state_t *state, const char *filename) {
  if (state->nof_input_files >= MAX_FILES) {
    fprintf(stderr, "Too many input files. Ignoring %s\n", filename);
    return;
  }
  state->input_files[state->nof_input_files++] = filename;
}
void assembler_set_output_file(asm_state_t *state, const char *filename) {
  state->output_file = filename;
}

bool write_elf_object_file(asm_state_t *state) {
  // Write all section names to shstrtab
  // Assign correct sh_name to each section
  size_t current_section_name = 1;
  for (size_t i = 0; i < state->nof_sections; i++) {
    state->sections[i].name_idx = current_section_name;
    buffer_append(&state->sections[state->shstrtab_idx].content,
                  state->sections[i].name, strlen(state->sections[i].name));
    buffer_append(&state->sections[state->shstrtab_idx].content, "\0", 1);
    current_section_name += strlen(state->sections[i].name) + 1;
  }

  buffer_append(&state->sections[state->shstrtab_idx].content, "\0", 1);

  // Add strtab and symtab data
  build_elf_strtab_symtab(state);

  Elf64_Ehdr elf_header;
  Elf64_Shdr *section_headers = calloc(state->nof_sections, sizeof(Elf64_Shdr));
  if (!section_headers) {
    perror("Failed to allocate memory for section header table");
    return false;
  }

  int fd = open(state->output_file, O_WRONLY | O_CREAT | O_TRUNC,
                S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH); // Permissions rw-r--r--
  printf("Opening file %s\n", state->output_file);
  if (fd < 0) {
    // asm_error(state, "Failed to open output file");
    return false;
  }

  memset(&elf_header, 0, sizeof(Elf64_Ehdr));
  // ELF magic
  elf_header.e_ident[EI_MAG0] = ELFMAG0;
  elf_header.e_ident[EI_MAG1] = ELFMAG1;
  elf_header.e_ident[EI_MAG2] = ELFMAG2;
  elf_header.e_ident[EI_MAG3] = ELFMAG3;
  // x86_64 declaration
  elf_header.e_ident[EI_CLASS] = ELFCLASS64;
  elf_header.e_ident[EI_DATA] = ELFDATA2LSB;
  elf_header.e_ident[EI_VERSION] = EV_CURRENT;
  elf_header.e_ident[EI_OSABI] = ELFOSABI_SYSV; // Or ELFOSABI_NONE
  elf_header.e_ident[EI_ABIVERSION] = 0;
  elf_header.e_type = ET_REL;
  elf_header.e_machine = EM_X86_64;
  elf_header.e_version = EV_CURRENT;
  elf_header.e_entry = 0;
  elf_header.e_phoff = 0;
  elf_header.e_shoff = 0;
  elf_header.e_flags = 0;
  elf_header.e_ehsize = sizeof(Elf64_Ehdr);
  elf_header.e_phentsize = 0;
  elf_header.e_phnum = 0;
  elf_header.e_shentsize = sizeof(Elf64_Shdr);
  elf_header.e_shnum = state->nof_sections;
  elf_header.e_shstrndx = state->shstrtab_idx; // Index of .shstrtab

  size_t current_offset = sizeof(Elf64_Ehdr);

  for (size_t i = 1; i < state->nof_sections; ++i) {
    elf_section_t *sec = &state->sections[i];

    if (sec->addralign > 1) {
      size_t align = sec->addralign;
      size_t mask = align - 1;
      size_t remainder = current_offset & mask;
      if (remainder != 0) {
        current_offset += (align - remainder);
      }
    }

    if (sec->content.size > 0 ||
        (sec->type != SHT_NULL && sec->type != SHT_NOBITS)) {
      sec->offset = current_offset;
    } else {
      sec->offset = current_offset;
    }

    if (sec->type != SHT_NOBITS) {
      sec->size = sec->content.size;
    } else {
      sec->size = 0; // NOBITS sections have zero size in the file
    }

    if (sec->type != SHT_NOBITS) {
      current_offset += sec->size;
    }
  }

  size_t shdr_table_align = 8;
  size_t mask = shdr_table_align - 1;
  size_t remainder = current_offset & mask;
  if (remainder != 0) {
    current_offset += (shdr_table_align - remainder);
  }
  elf_header.e_shoff = current_offset;

  for (size_t i = 0; i < state->nof_sections; ++i) {
    elf_section_t *my_sec = &state->sections[i];
    Elf64_Shdr *shdr = &section_headers[i];

    shdr->sh_name = my_sec->name_idx;
    shdr->sh_type = my_sec->type;
    shdr->sh_flags = my_sec->flags;
    shdr->sh_addr = my_sec->addr;
    shdr->sh_offset = my_sec->offset;
    shdr->sh_size = my_sec->size;
    shdr->sh_link = my_sec->link;
    shdr->sh_info = my_sec->info;
    shdr->sh_addralign = my_sec->addralign;
    shdr->sh_entsize = my_sec->entsize;
  }

  printf("Writing ELF Header (offset 0, size %zu)\n", sizeof(elf_header));
  if (write(fd, &elf_header, sizeof(elf_header)) < 0) {
    perror("Failed to write ELF Header");
  }

  for (size_t i = 1; i < state->nof_sections; ++i) { // Skip NULL section
    elf_section_t *sec = &state->sections[i];
    // Write section content if it has a non-zero size *in the file* (i.e., not
    // NOBITS) and a valid offset.
    if (sec->size > 0 && sec->offset > 0 && sec->type != SHT_NOBITS) {
      // Seek to the calculated offset (handles alignment padding)
      if (lseek(fd, sec->offset, SEEK_SET) == -1) {
        perror("lseek failed before writing section");
        fprintf(stderr, "Error seeking for section %s\n", sec->name);
        free(section_headers); // Clean up allocated memory
        close(fd);
        return false;
      }
      printf("Writing %s data (offset %llu, size %llu)\n", sec->name,
             (unsigned long long)sec->offset, (unsigned long long)sec->size);
      // Use sec->size for write size, as content.size might differ for NOBITS
      if (write(fd, sec->content.data, sec->size) < 0) {
        perror("Failed to write ELF Sections");
        close(fd);
        return false;
      }
    } else {
      printf(
          "Skipping write for section %s (type %u, size %llu, offset %llu)\n",
          sec->name, sec->type, (unsigned long long)sec->size,
          (unsigned long long)sec->offset);
    }
  }

  printf("Writing Section Header Table (offset %llu, size %zu)\n",
         (unsigned long long)elf_header.e_shoff,
         state->nof_sections * sizeof(Elf64_Shdr));
  if (lseek(fd, elf_header.e_shoff, SEEK_SET) == -1) {
    perror("lseek failed before writing SHT");
    free(section_headers); // Clean up allocated memory
    close(fd);
    return false;
  }
  if (write(fd, section_headers, state->nof_sections * sizeof(Elf64_Shdr)) <
      0) {
    perror("Failed to write section headers");
  }

  free(section_headers);
  close(fd);
  return true;
}

char *get_asm_state_info(const asm_state_t *state) {
  size_t bufsize = 8192;
  char *buffer = malloc(bufsize);
  if (!buffer)
    return NULL;

  size_t offset = 0;
  offset += snprintf(buffer + offset, bufsize - offset,
                     "ASM State:\n"
                     "  Output file: %s\n"
                     "  Number of input files: %zu\n",
                     state->output_file ? state->output_file : "(null)",
                     state->nof_input_files);

  for (size_t i = 0; i < state->nof_input_files && i < MAX_FILES; ++i) {
    offset +=
        snprintf(buffer + offset, bufsize - offset, "    Input file[%zu]: %s\n",
                 i, state->input_files[i] ? state->input_files[i] : "(null)");
  }

  offset += snprintf(buffer + offset, bufsize - offset,
                     "  Current text offset: %lu\n"
                     "  Current file index: %zu\n"
                     "  Current line: %zu\n"
                     "  Indexes:\n"
                     "    text_idx: %zu\n"
                     "    note_idx: %zu\n"
                     "    symtab_idx: %zu\n"
                     "    strtab_idx: %zu\n"
                     "    shstrtab_idx: %zu\n"
                     "  Symbols (%zu total):\n",
                     state->current_text_offset, state->current_file,
                     state->current_line, state->text_idx, state->note_idx,
                     state->symtab_idx, state->strtab_idx, state->shstrtab_idx,
                     state->nof_symbols);

  for (size_t i = 0; i < state->nof_symbols && i < MAX_SYMBOLS; ++i) {
    char symbol_buf[128];
    snprintf(symbol_buf, sizeof(symbol_buf), "  Symbol[%ld]: name=%s\n", i,
             state->symbols[i].name);
    ;
    offset += snprintf(buffer + offset, bufsize - offset, "%s", symbol_buf);
  }

  offset += snprintf(buffer + offset, bufsize - offset,
                     "  Sections (%zu total):\n", state->nof_sections);

  for (size_t i = 0; i < state->nof_sections && i < MAX_SECTIONS; ++i) {
    char section_buf[128];

    snprintf(section_buf, sizeof(section_buf),
             "  Section[%ld]: name=%s, content=%s\n", i,
             state->sections[i].name, (char *)state->sections[i].content.data);
    offset += snprintf(buffer + offset, bufsize - offset, "%s", section_buf);
  }

  return buffer;
}

bool assembler_run(asm_state_t *state) {
  if (state->nof_input_files == 0) {
    fprintf(stderr, "Error: No input files specified.\n");
    return false;
  }

  printf("Converting to Machine Code...\n");
  for (size_t i = 0; i < state->nof_input_files; i++) {
    if (!assemble_file(state, i)) {
      fprintf(stderr, "Translation failed in file %s line %ld.\n",
              state->input_files[state->current_file], state->current_line);
      return false;
    }
  }
  printf("Writing ELF file...\n");
  // add_symbol(&state, ".file", SHN_ABS, 0, STT_FILE, STB_LOCAL);
  if (!write_elf_object_file(state)) {
    fprintf(stderr, "Failed to write to ELF file %s\n", state->output_file);
    return false;
  }

  printf("Assembly successful.\n");
  return true;
}

bool assemble_file(asm_state_t *state, size_t file_idx) {
  FILE *infile = fopen(state->input_files[file_idx], "r");
  if (!infile) {
    perror("fopen failed");
    fprintf(stderr, "Error opening input file: %s\n",
            state->input_files[file_idx]);
    return false;
  }

  state->current_line = 0;
  bool ret = true;

  char line_buffer[MAX_LINE_SIZE];
  while (fgets(line_buffer, sizeof(line_buffer), infile)) {
    state->current_line++;
    line_buffer[strcspn(line_buffer, "\r\n")] = 0;
    if (!encode_instr(state, line_buffer)) {
      fprintf(stderr, "Failed to encode instruction: %s\n", line_buffer);
      ret = false;
      break;
    }
  }
  return ret;
}

bool tokenize_line(char *trimmed_line, char *tokens[10], size_t *nof_tokens) {
  *nof_tokens = 0;
  size_t line_len = strlen(trimmed_line);
  char *p = trimmed_line;
  char *word = trimmed_line;

  for (size_t char_idx = 0; char_idx < line_len; char_idx++) {
    if (*p == ' ' || *p == 9 || *p == ',') {
      *p = '\0';
      if (strlen(word) > 0)
        tokens[(*nof_tokens)++] = strdup(word);
      word = p + 1;
    }
    p++;
  }

  tokens[(*nof_tokens)++] = strdup(word);

  return *nof_tokens > 0;
}

bool encode_instr(asm_state_t *state, char line_buffer[MAX_LINE_SIZE]) {

  char *tokens[10];
  char *trimmed_line = line_buffer;
  char *label = NULL;

  while (isspace((unsigned char)*trimmed_line))
    trimmed_line++;

  if (*trimmed_line == '\0' || *trimmed_line == ';') {
    return true;
  }

  char *colon = strchr(trimmed_line, ':');
  if (colon) {
    *colon = '\0';
    label = trimmed_line;
    trimmed_line = colon + 1;
    while (isspace((unsigned char)*trimmed_line))
      trimmed_line++;
  }

  if (label) {
    switch (state->parse_mode) {
    case TEXT:
      add_symbol(state, label, state->text_idx, 0, STT_FUNC, STB_LOCAL);
      break;
    case RODATA: {
      rodata_label_t new_entry;
      new_entry.name = label;
      state->rodata_entries[state->nof_rodata_entries++] = new_entry;
      break;
    }
    default:
      break;
    }
    return true;
  }

  size_t nof_tokens = 0;
  if (!tokenize_line(trimmed_line, tokens, &nof_tokens)) {
    fprintf(stderr, "Tokenization failed: %s\n", trimmed_line);
    return false;
  }

  if (strcmp(tokens[0], ".file") == 0) {
    add_symbol(state, tokens[1], SHN_ABS, 0, STT_FILE, STB_LOCAL);
    return true;
  }

  if (strcmp(tokens[0], ".text") == 0) {
    state->parse_mode = TEXT;
    return true;
  }

  if (strcmp(tokens[0], ".section") == 0) {
    if (strcmp(tokens[1], ".rodata") == 0)
      state->parse_mode = RODATA;
    else if (strcmp(tokens[1], ".note.GNU-stack") == 0)
      state->parse_mode = GNU_STACK;
    else if (strcmp(tokens[1], ".text") == 0)
      state->parse_mode = TEXT;
    else {
      fprintf(stderr, "unknown .section directive: %s", tokens[1]);
      return false;
    }
    return true;
  }

  if (strcmp(tokens[0], ".string") == 0) {
    if (state->parse_mode != RODATA) {
      fprintf(stderr, "Encountered .string outside of rodata\n");
      return false;
    }
    char *string = tokens[1] + 1;
    // Combine all tokens
    for (size_t i = 2; i < nof_tokens; i++) {
      strcat(string, " ");
      strcat(string, tokens[i]);
    }

    size_t tok_len = strlen(string);
    string[tok_len - 1] = '\0';

    state->rodata_entries[state->nof_rodata_entries - 1].offset =
        state->sections[state->rodata_idx].size;
    buffer_append(&state->sections[state->rodata_idx].content, string, tok_len);

    return true;
  }

  return true;
}
