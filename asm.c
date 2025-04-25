#define _POSIX_C_SOURCE 200809L
#include "asm.h"
#include "elf.h"
#include "lex.h"
#include "log.h"
#include "state.h"
#include "text.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void print_text_debug(text_state_t *state) {
  ASM_DEBUG("--- finished parsing .text ---");
  ASM_DEBUG("current text size: %ld", state->current_text_offset);
  ASM_DEBUG("");

  ASM_DEBUG(".rodata entries:");
  uint8_t *rodata_ptr = state->rodata_buffer->data;
  size_t current_offset = 0;
  for (size_t i = 0; i < state->nof_rodata_entries; i++) {
    ASM_DEBUG("\t(%zu) %s (offset: %zu)", i, (char *)(rodata_ptr),
              current_offset);
    rodata_ptr += state->rodata_entries[i];
    current_offset += state->rodata_entries[i];
  }
  ASM_DEBUG("");

  ASM_DEBUG(".text labels:");
  for (size_t i = 0; i < state->nof_text_labels; i++) {
    ASM_DEBUG("\t.L%ld", i);
  }
  ASM_DEBUG("");

  ASM_DEBUG("defined functions:");
  for (size_t i = 0; i < state->nof_functions; i++) {
    ASM_DEBUG("\t(%ld) %s", i, state->functions[i].name);
    ASM_DEBUG("\t   binding: %s location: %ld size: %ld",
              state->functions[i].is_global ? "global" : "local",
              state->functions[i].location, state->functions[i].size);
  }
  ASM_DEBUG("");

  ASM_DEBUG("defined instructions:");
  for (size_t i = 0; i < state->nof_instructions; i++) {
    if (log_level >= DEBUG) {
      printf("[DEBUG]\t\t(%ld)", i);
      for (size_t j = 0; j < state->instructions[i].machine_code_len; j++) {
        printf(" 0x%02x", state->instructions[i].machine_code[j]);
      }
      printf("\n");
    }
    switch (state->instructions[i].status) {
    case COMPLETE:
      ASM_DEBUG("\t   COMPLETE");
      break;
    case LEA_REQUIRES_OFFSET:
      ASM_DEBUG("\t   LEA_REQUIRES_OFFSET");
      break;
    case JMP_REQUIRES_OFFSET:
      ASM_DEBUG("\t   JMP_REQUIRES_OFFSET");
      break;
    default:
      ASM_DEBUG("\t   UNKNOWN");
      break;
    }
  }
}

void assembler_init(asm_state_t *state) {
  memset(state, 0, sizeof(asm_state_t));
  state->output_file = "a.out";
  line_num = 0;

  state->text_state.parse_mode = TEXT;
  state->text_state.nof_instructions = 0;
  state->text_state.nof_rodata_entries = 0;
  state->text_state.nof_text_labels = 0;
  state->text_state.nof_functions = 0;
  state->text_state.current_text_offset = 0;
  state->text_state.instructions = (inst_t *)malloc(INIT_INSTRUCTION_COUNT);
  state->text_state.inst_capacity = INIT_INSTRUCTION_COUNT;

  state->text_idx = -1;
  state->note_idx = -1;
  state->symtab_idx = -1;
  state->strtab_idx = -1;
  state->shstrtab_idx = -1;
  state->rodata_idx = -1;
  state->rela_text_idx = -1;

  // Add mandatory NULL section
  add_section(state, "", SHT_NULL, 0, 0, 0); // Section 0 is always NULL
  add_section(state, ".text", SHT_PROGBITS, SHF_ALLOC | SHF_EXECINSTR, 4, 0);
  add_section(state, ".rela.text", SHT_RELA, SHF_INFO_LINK, 4, 0);
  add_section(state, ".rodata", SHT_PROGBITS, SHF_ALLOC, 4, 0);
  add_section(state, ".note.GNU-stack", SHT_PROGBITS, 0, 1, 0);
  add_section(state, ".symtab", SHT_SYMTAB, 0, 8, sizeof(Elf64_Sym));
  add_section(state, ".strtab", SHT_STRTAB, 0, 1, 0);
  add_section(state, ".shstrtab", SHT_STRTAB, 0, 1, 0);

  // Symbol 0: NULL symbol
  add_symbol(state, "", SHN_UNDEF, 0, STT_NOTYPE, STB_LOCAL);

  for (size_t i = 0; i < state->nof_sections; i++)
    buffer_init(&state->sections[i].content);

  // Initialize string tables with the required initial NULL byte
  buffer_append(&state->sections[state->strtab_idx].content, "\0", 1);
  buffer_append(&state->sections[state->shstrtab_idx].content, "\0", 1);

  state->text_state.rodata_buffer = &state->sections[state->rodata_idx].content;
}

bool assemble_file(const char *input_file, const char *output_file) {
  asm_state_t state;
  assembler_init(&state);
  state.input_file = strdup(input_file);
  state.output_file = strdup(output_file);
  ASM_INFO("Assembling file: %s\n", state.input_file);
  yyin = fopen(state.input_file, "r");
  if (!yyin) {
    perror("fopen failed");
    ASM_ERROR("Error opening input file: %s\n", state.input_file);
    return false;
  }

  line_num = 0;
  bool ret = true;

  int current_token;
  line_info_t current_info;
  current_info.nof_input_strings = 0;
  current_info.nof_tokens = 0;

  while ((current_token = yylex())) {
    switch (current_token) {
    case TOK_NEWLINE: {
      if (!handle_line(&state.text_state, &current_info)) {
        ASM_ERROR("%s line %d: parsing failed\n", state.input_file, line_num);
        return false;
      }
      current_info.nof_tokens = 0;
      current_info.nof_input_strings = 0;
      continue;
    }
    case TOK_COMMA:
      continue; // ignore commas
    case TOK_STRLIT:
    case TOK_NUM:
    case TOK_RODATA_LABEL:
    case TOK_IDENT:
    case TOK_IDENT_TAG:
    case TOK_PLT_FLAG:
    case TOK_RODATA_LABEL_REF:
    case TOK_FUNC_END:
    case TOK_FUNC_START:
      current_info.input_strings[current_info.nof_input_strings++] =
          strdup(yytext);
      break;
    case TOK_UNKNOWN:
      ASM_ERROR("%s line %d: encountered unknown token %s\n", state.input_file,
                line_num, yytext);
      return false;
    }
    current_info.tokens[current_info.nof_tokens++] = current_token;
  }

  print_text_debug(&state.text_state);

  if (!write_elf_object_file(&state)) {
    ASM_ERROR("Failed to write to ELF file %s\n", state.output_file);
    ret = false;
  }

  return ret;
}
