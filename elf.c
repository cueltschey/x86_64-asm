#define _POSIX_C_SOURCE 200809L
#include "elf.h"
#include "log.h"
#include "state.h"
#include <elf.h>
#include <string.h>

void buffer_init(asm_buf_t *buf) {
  buf->data = NULL;
  buf->size = 0;
  buf->capacity = 0;
}

void buffer_destroy(asm_buf_t *buf) {
  free(buf->data);
  buffer_init(buf); // Reset state
}

void buffer_append(asm_buf_t *buf, const void *data, size_t size) {
  buffer_ensure_capacity(buf, size);
  memcpy(buf->data + buf->size, data, size);
  buf->size += size;
}

void buffer_ensure_capacity(asm_buf_t *buf, size_t additional_needed) {
  if (buf->size + additional_needed > buf->capacity) {
    size_t new_capacity =
        (buf->capacity == 0) ? INITIAL_CAPACITY : buf->capacity * 2;
    while (new_capacity < buf->size + additional_needed) {
      new_capacity *= 2;
    }
    uint8_t *new_data = (uint8_t *)realloc(buf->data, new_capacity);
    if (!new_data) {
      perror("realloc failed for buffer");
      // In a real assembler, need more robust error handling than exit
      exit(EXIT_FAILURE);
    }
    buf->data = new_data;
    buf->capacity = new_capacity;
  }
}

elf_symbol_t *find_symbol(asm_state_t *state, const char *name) {
  if (!name) {
    ASM_ERROR("Error: find_symbol called with NULL name\n");
    return NULL;
  }

  elf_symbol_t *result = NULL;
  for (size_t i = 0; i < state->nof_symbols; i++) {
    if (strcmp(name, state->symbols[i].name) == 0) {
      result = &state->symbols[i];
      break;
    }
  }
  return result;
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
        return -1;
      }
      return i;
    }
  }

  if (state->nof_symbols >= MAX_SYMBOLS) {
    ASM_ERROR("Maximum number of symbols reached\n");
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

void add_section(asm_state_t *state, const char *name, Elf64_Word type,
                 Elf64_Xword flags, Elf64_Xword addralign,
                 Elf64_Xword entsize) {
  if (state->nof_sections >= MAX_SECTIONS) {
    ASM_ERROR("Error: Maximum number of sections reached (%d)\n", MAX_SECTIONS);
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
  else if (strcmp(name, ".rela.text") == 0)
    state->rela_text_idx = state->nof_sections;
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

void add_rela(asm_state_t *state, const char *rela_name, size_t offset,
              reloc_type_t type, int64_t addend) {
  elf_reloc_t rela;
  memset(&rela, 0, sizeof(elf_reloc_t));
  rela.addend = addend;
  rela.type = type;
  rela.offset = offset;
  rela.symbol = strdup(rela_name);
  state->relocations[state->nof_relocations++] = rela;
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

void build_elf_rela(asm_state_t *state) {
  elf_section_t *rela_sec = &state->sections[state->rela_text_idx];
  rela_sec->entsize = sizeof(Elf64_Rela);
  rela_sec->info = state->text_idx;
  rela_sec->link = state->symtab_idx;
  elf_section_t *text_sec = &state->sections[state->text_idx];
  for (size_t i = 0; i < state->nof_relocations; i++) {
    const elf_reloc_t *r = &state->relocations[i];
    Elf64_Rela rela;
    memset(&rela, 0, sizeof(rela));
    rela.r_offset = text_sec->addr + r->offset;
    uint32_t rel_type;
    switch (r->type) {
    case RELOC_ABSOLUTE:
      rel_type = R_X86_64_64;
      break;
    case RELOC_PC_RELATIVE:
      rel_type = R_X86_64_PC32;
      break;
    case RELOC_PLT:
      rel_type = R_X86_64_PLT32;
      break;
    default:
      ASM_ERROR("Unknown relocation type: %d\n", r->type);
    }

    // Find the symbols index
    size_t symbol_idx = 0;
    for (size_t j = 0; j < state->nof_symbols; j++) {
      if (strcmp(state->symbols[j].name, r->symbol) == 0) {
        symbol_idx = j;
        break;
      }
    }
    rela.r_info = ELF64_R_INFO(symbol_idx, rel_type);
    rela.r_addend = r->addend;
    buffer_append(&rela_sec->content, &rela, sizeof(Elf64_Rela));
  }
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
  build_elf_rela(state);

  Elf64_Ehdr elf_header;
  Elf64_Shdr *section_headers = calloc(state->nof_sections, sizeof(Elf64_Shdr));
  if (!section_headers) {
    perror("Failed to allocate memory for section header table");
    return false;
  }

  int fd = open(state->output_file, O_WRONLY | O_CREAT | O_TRUNC,
                S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH); // Permissions rw-r--r--
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
        ASM_ERROR("Error seeking for section %s\n", sec->name);
        free(section_headers); // Clean up allocated memory
        close(fd);
        return false;
      }
      // Use sec->size for write size, as content.size might differ for NOBITS
      if (write(fd, sec->content.data, sec->size) < 0) {
        perror("Failed to write ELF Sections");
        close(fd);
        return false;
      }
    }
  }

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
