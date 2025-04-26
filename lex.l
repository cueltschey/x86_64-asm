%{
#include "lex.h"

int line_num = 0;
%}

%option noyywrap

%%

[ \t\r]+        ;

.cfi_startproc    ;
.cfi_def_cfa_offset[^\n]* ;
.cfi_offset[^\n]* ;
.cfi_def_cfa_register[^\n]* ;
.cfi_def_cfa[^\n]* ;
.cfi_endproc ;
".ident"[^\n]*                ;


\n        { line_num++; return TOK_NEWLINE; }

\%rax     { return TOK_REG_RAX; }
\%rbx     { return TOK_REG_RBX; }
\%rcx     { return TOK_REG_RCX; }
\%rdx     { return TOK_REG_RDX; }
\%rsi     { return TOK_REG_RSI; }
\%rdi     { return TOK_REG_RDI; }
\%rbp     { return TOK_REG_RBP; }
\%rsp     { return TOK_REG_RSP; }
\%r8      { return TOK_REG_R8; }
\%r9      { return TOK_REG_R9; }
\%r10     { return TOK_REG_R10; }
\%r11     { return TOK_REG_R11; }
\%r12     { return TOK_REG_R12; }
\%r13     { return TOK_REG_R13; }
\%r14     { return TOK_REG_R14; }
\%r15     { return TOK_REG_R15; }
\%eax     { return TOK_REG_EAX; }
\%ebx     { return TOK_REG_EBX; }
\%ecx     { return TOK_REG_ECX; }
\%edx     { return TOK_REG_EDX; }
\%esi     { return TOK_REG_ESI; }
\%edi     { return TOK_REG_EDI; }
\%ebp     { return TOK_REG_EBP; }
\%esp     { return TOK_REG_ESP; }
\%r8d     { return TOK_REG_R8D; }
\%r9d     { return TOK_REG_R9D; }
\%r10d    { return TOK_REG_R10D; }
\%r11d    { return TOK_REG_R11D; }
\%r12d    { return TOK_REG_R12D; }
\%r13d    { return TOK_REG_R13D; }
\%r14d    { return TOK_REG_R14D; }
\%r15d    { return TOK_REG_R15D; }

\%ax      { return TOK_REG_AX; }
\%bx      { return TOK_REG_BX; }
\%cx      { return TOK_REG_CX; }
\%dx      { return TOK_REG_DX; }
\%si      { return TOK_REG_SI; }
\%di      { return TOK_REG_DI; }
\%bp      { return TOK_REG_BP; }
\%sp      { return TOK_REG_SP; }
\%r8w     { return TOK_REG_R8W; }
\%r9w     { return TOK_REG_R9W; }
\%r10w    { return TOK_REG_R10W; }
\%r11w    { return TOK_REG_R11W; }
\%r12w    { return TOK_REG_R12W; }
\%r13w    { return TOK_REG_R13W; }
\%r14w    { return TOK_REG_R14W; }
\%r15w    { return TOK_REG_R15W; }

\%al      { return TOK_REG_AL; }
\%bl      { return TOK_REG_BL; }
\%cl      { return TOK_REG_CL; }
\%dl      { return TOK_REG_DL; }
\%sil     { return TOK_REG_SIL; }
\%dil     { return TOK_REG_DIL; }
\%bpl     { return TOK_REG_BPL; }
\%spl     { return TOK_REG_SPL; }
\%r8b     { return TOK_REG_R8B; }
\%r9b     { return TOK_REG_R9B; }
\%r10b    { return TOK_REG_R10B; }
\%r11b    { return TOK_REG_R11B; }
\%r12b    { return TOK_REG_R12B; }
\%r13b    { return TOK_REG_R13B; }
\%r14b    { return TOK_REG_R14B; }
\%r15b    { return TOK_REG_R15B; }

\%rip     { return TOK_REG_RIP; }

\%cs      { return TOK_REG_CS; }
\%ds      { return TOK_REG_DS; }
\%es      { return TOK_REG_ES; }
\%fs      { return TOK_REG_FS; }
\%gs      { return TOK_REG_GS; }
\%ss      { return TOK_REG_SS; }

push              { return OPCODE_PUSH; }
pushq             { return OPCODE_PUSH; }
popw              { return OPCODE_POP; }
popl              { return OPCODE_POP; }
popb              { return OPCODE_POP; }
popq              { return OPCODE_POP; }
call              { return OPCODE_CALL; }
ret               { return OPCODE_RET; }
jmp               { return OPCODE_JMP; }
je                { return OPCODE_JE; }
jne               { return OPCODE_JNE; }
jg                { return OPCODE_JG; }
jge               { return OPCODE_JGE; }
jl                { return OPCODE_JL; }
jle               { return OPCODE_JLE; }
movq              { return OPCODE_MOV; }
movl              { return OPCODE_MOV; }
movw              { return OPCODE_MOV; }
movb              { return OPCODE_MOVB; }
leaq              { return OPCODE_LEAQ; }
leal              { return OPCODE_LEAL; }
leaw              { return OPCODE_LEAW; }
addq              { return OPCODE_ADDQ; }
addl              { return OPCODE_ADDL; }
addw              { return OPCODE_ADDW; }
addb              { return OPCODE_ADDB; }
subq              { return OPCODE_SUBQ; }
subl              { return OPCODE_SUBL; }
subw              { return OPCODE_SUBW; }
subb              { return OPCODE_SUBB; }
mulq              { return OPCODE_MULQ; }
mull              { return OPCODE_MULL; }
mulw              { return OPCODE_MULW; }
mulb              { return OPCODE_MULB; }
imulq             { return OPCODE_IMULQ; }
imull             { return OPCODE_IMULL; }
imulw             { return OPCODE_IMULW; }
imulb             { return OPCODE_IMULB; }
divq              { return OPCODE_DIVQ; }
divl              { return OPCODE_DIVL; }
divw              { return OPCODE_DIVW; }
divb              { return OPCODE_DIVB; }
idivq             { return OPCODE_IDIVQ; }
idivl             { return OPCODE_IDIVL; }
idivw             { return OPCODE_IDIVW; }
idivb             { return OPCODE_IDIVB; }
andq              { return OPCODE_ANDQ; }
andl              { return OPCODE_ANDL; }
andw              { return OPCODE_ANDW; }
andb              { return OPCODE_ANDB; }
orq               { return OPCODE_ORQ; }
orl               { return OPCODE_ORL; }
orw               { return OPCODE_ORW; }
orb               { return OPCODE_ORB; }
xorq              { return OPCODE_XORQ; }
xorl              { return OPCODE_XORL; }
xorw              { return OPCODE_XORW; }
xorb              { return OPCODE_XORB; }
notq              { return OPCODE_NOTQ; }
notl              { return OPCODE_NOTL; }
notw              { return OPCODE_NOTW; }
notb              { return OPCODE_NOTB; }
negq              { return OPCODE_NEGQ; }
negl              { return OPCODE_NEGL; }
negw              { return OPCODE_NEGW; }
negb              { return OPCODE_NEGB; }
shlq              { return OPCODE_SHLQ; }
shll              { return OPCODE_SHLL; }
shlw              { return OPCODE_SHLW; }
shlb              { return OPCODE_SHLB; }
shrq              { return OPCODE_SHRQ; }
shrl              { return OPCODE_SHRL; }
shrw              { return OPCODE_SHRW; }
shrb              { return OPCODE_SHRB; }
sarq              { return OPCODE_SARQ; }
sarl              { return OPCODE_SARL; }
sarw              { return OPCODE_SARW; }
sarb              { return OPCODE_SARB; }
rolq              { return OPCODE_ROLQ; }
roll              { return OPCODE_ROLL; }
rolw              { return OPCODE_ROLW; }
rolb              { return OPCODE_ROLB; }
rorq              { return OPCODE_RORQ; }
rorl              { return OPCODE_RORL; }
rorw              { return OPCODE_RORW; }
rorb              { return OPCODE_RORB; }
cmpq              { return OPCODE_CMPQ; }
cmpl              { return OPCODE_CMPL; }
cmpw              { return OPCODE_CMPW; }
cmpb              { return OPCODE_CMPB; }
testq             { return OPCODE_TESTQ; }
testl             { return OPCODE_TESTL; }
testw             { return OPCODE_TESTW; }
testb             { return OPCODE_TESTB; }
nop               { return OPCODE_NOP; }
syscall           { return OPCODE_SYSCALL; }
leave             { return OPCODE_LEAVE; }


".file"           { return TOK_FILEHEADER; }
".section"        { return TOK_SECTION; }
".text"           { return TOK_SECTION_TEXT; }
".rodata"         { return TOK_SECTION_RODATA; }
".data"           { return TOK_SECTION_DATA; }
".bss"            { return TOK_SECTION_BSS; }
".note.GNU-stack" { return TOK_SECTION_GNUSTACK; }
".size"           { return TOK_SIZEDEF; }

".string"         { return TOK_STRINGDEF; }
".globl"          { return TOK_GLOBLDEF; }
".type"           { return TOK_TYPEDEF; }

".LC"[0-9]+:        { return TOK_RODATA_LABEL; }
".LFB"[0-9]+:       { return TOK_FUNC_START; }
".LFE"[0-9]+:       { return TOK_FUNC_END; }
".L"[0-9]+:         { return TOK_TEXT_LABEL; }

".LC"[0-9]+       { return TOK_RODATA_LABEL_REF; }
".L"[0-9]+        { return TOK_TEXT_LABEL_REF; }

"@function"       { return TOK_FUNCTION_TYPE; }
","               { return TOK_COMMA; }
"@PLT" { return TOK_PLT_FLAG; }

".-"[a-zA-Z_]* ;
"@progbits" ;



"-"               { return TOK_MINUS; }
"("               { return TOK_OPENPAREN; }
")"               { return TOK_CLOSEPAREN; }
\"[^\"]*\"        { return TOK_STRLIT; }
\'[^\']*\'        { return TOK_STRLIT; }
"0x"[0-9A-Fa-f]+  { return TOK_HEX; }
[0-9]+            { return TOK_NUM; }
\$[0-9]+          { return TOK_NUM; }
[a-zA-Z_][a-zA-Z0-9_]*":"  { return TOK_IDENT_TAG; }
[a-zA-Z_][a-zA-Z0-9_]*  { return TOK_IDENT; }
";"[^\n]*         ;
.                 { return TOK_UNKNOWN; }


%%
