	.file	"asm.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"[DEBUG] --- finished parsing .text ---\n"
	.align 8
.LC1:
	.string	"[DEBUG] current text size: %ld\n"
.LC2:
	.string	"[DEBUG] \n"
.LC3:
	.string	"[DEBUG] .rodata entries:\n"
	.align 8
.LC4:
	.string	"[DEBUG] \t(%zu) %s (offset: %zu)\n"
.LC5:
	.string	"[DEBUG] .text labels:\n"
.LC6:
	.string	"[DEBUG] \t(%zu) %s\n"
.LC7:
	.string	"[DEBUG] defined functions:\n"
.LC8:
	.string	"[DEBUG] \t(%ld) %s\n"
.LC9:
	.string	"global"
.LC10:
	.string	"local"
	.align 8
.LC11:
	.string	"[DEBUG] \t   binding: %s location: %ld size: %ld\n"
	.align 8
.LC12:
	.string	"[DEBUG] defined instructions:\n"
.LC13:
	.string	"[DEBUG]\t\t(%ld)"
.LC14:
	.string	" 0x%02x"
.LC15:
	.string	"[DEBUG] \t   COMPLETE\n"
	.align 8
.LC16:
	.string	"[DEBUG] \t   LEA_REQUIRES_OFFSET\n"
	.align 8
.LC17:
	.string	"[DEBUG] \t   JMP_REQUIRES_OFFSET\n"
.LC18:
	.string	"[DEBUG] \t   UNKNOWN\n"
	.text
	.globl	print_text_debug
	.type	print_text_debug, @function
print_text_debug:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L2
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$39, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.L2:
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L3
	movq	-72(%rbp), %rax
	movq	8(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L3:
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L4
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.L4:
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L5
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$25, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.L5:
	movq	-72(%rbp), %rax
	movq	1144(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	jmp	.L6
.L8:
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L7
	movq	stderr(%rip), %rax
	movq	-48(%rbp), %rsi
	movq	-56(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	%rsi, %r8
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L7:
	movq	-72(%rbp), %rax
	movq	-40(%rbp), %rdx
	addq	$2, %rdx
	movq	(%rax,%rdx,8), %rax
	addq	%rax, -56(%rbp)
	movq	-72(%rbp), %rax
	movq	-40(%rbp), %rdx
	addq	$2, %rdx
	movq	(%rax,%rdx,8), %rax
	addq	%rax, -48(%rbp)
	addq	$1, -40(%rbp)
.L6:
	movq	-72(%rbp), %rax
	movq	96(%rax), %rax
	cmpq	%rax, -40(%rbp)
	jb	.L8
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L9
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.L9:
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L10
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$22, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.L10:
	movq	$0, -32(%rbp)
	jmp	.L11
.L13:
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L12
	movq	-72(%rbp), %rax
	movq	-32(%rbp), %rdx
	addq	$6, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	addq	$8, %rax
	movq	(%rax), %rcx
	movq	stderr(%rip), %rax
	movq	-32(%rbp), %rdx
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L12:
	addq	$1, -32(%rbp)
.L11:
	movq	-72(%rbp), %rax
	movq	264(%rax), %rax
	cmpq	%rax, -32(%rbp)
	jb	.L13
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L14
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.L14:
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L15
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$27, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.L15:
	movq	$0, -24(%rbp)
	jmp	.L16
.L21:
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L17
	movq	-72(%rbp), %rax
	movq	-24(%rbp), %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	addq	$272, %rax
	movq	(%rax), %rcx
	movq	stderr(%rip), %rax
	movq	-24(%rbp), %rdx
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L17:
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L18
	movq	-72(%rbp), %rax
	movq	-24(%rbp), %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	addq	$280, %rax
	movq	(%rax), %rsi
	movq	-72(%rbp), %rax
	movq	-24(%rbp), %rdx
	addq	$9, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-72(%rbp), %rax
	movq	-24(%rbp), %rcx
	addq	$9, %rcx
	salq	$5, %rcx
	addq	%rcx, %rax
	addq	$10, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L19
	leaq	.LC9(%rip), %rax
	jmp	.L20
.L19:
	leaq	.LC10(%rip), %rax
.L20:
	movq	stderr(%rip), %rdi
	movq	%rsi, %r8
	movq	%rdx, %rcx
	movq	%rax, %rdx
	leaq	.LC11(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %eax
	call	fprintf@PLT
.L18:
	addq	$1, -24(%rbp)
.L16:
	movq	-72(%rbp), %rax
	movq	1104(%rax), %rax
	cmpq	%rax, -24(%rbp)
	jb	.L21
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L22
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.L22:
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L23
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$30, %edx
	movl	$1, %esi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.L23:
	movq	$0, -16(%rbp)
	jmp	.L24
.L37:
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L25
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	$0, -8(%rbp)
	jmp	.L26
.L27:
	movq	-72(%rbp), %rax
	movq	1112(%rax), %rcx
	movq	-16(%rbp), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$1, -8(%rbp)
.L26:
	movq	-72(%rbp), %rax
	movq	1112(%rax), %rcx
	movq	-16(%rbp), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rax
	cmpq	%rax, -8(%rbp)
	jb	.L27
	movl	$10, %edi
	call	putchar@PLT
.L25:
	movq	-72(%rbp), %rax
	movq	1112(%rax), %rcx
	movq	-16(%rbp), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	16(%rax), %eax
	cmpl	$2, %eax
	je	.L28
	cmpl	$2, %eax
	ja	.L29
	testl	%eax, %eax
	je	.L30
	cmpl	$1, %eax
	je	.L31
	jmp	.L29
.L30:
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L38
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	jmp	.L38
.L31:
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L39
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$32, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	jmp	.L39
.L28:
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L40
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$32, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	jmp	.L40
.L29:
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L41
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	jmp	.L41
.L38:
	nop
	jmp	.L33
.L39:
	nop
	jmp	.L33
.L40:
	nop
	jmp	.L33
.L41:
	nop
.L33:
	addq	$1, -16(%rbp)
.L24:
	movq	-72(%rbp), %rax
	movq	1120(%rax), %rax
	cmpq	%rax, -16(%rbp)
	jb	.L37
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	print_text_debug, .-print_text_debug
	.section	.rodata
.LC19:
	.string	"a.out"
.LC20:
	.string	""
.LC21:
	.string	".text"
.LC22:
	.string	".rela.text"
.LC23:
	.string	".rodata"
.LC24:
	.string	".note.GNU-stack"
.LC25:
	.string	".symtab"
.LC26:
	.string	".strtab"
.LC27:
	.string	".shstrtab"
.LC28:
	.string	""
	.string	""
	.text
	.globl	assembler_init
	.type	assembler_init, @function
assembler_init:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$27760, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-24(%rbp), %rax
	leaq	.LC19(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$0, line_num(%rip)
	movq	-24(%rbp), %rax
	movl	$0, 72(%rax)
	movq	-24(%rbp), %rax
	movq	$0, 1192(%rax)
	movq	-24(%rbp), %rax
	movq	$0, 168(%rax)
	movq	-24(%rbp), %rax
	movq	$0, 336(%rax)
	movq	-24(%rbp), %rax
	movq	$0, 1176(%rax)
	movq	-24(%rbp), %rax
	movq	$0, 80(%rax)
	movl	$1024, %edi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 1184(%rax)
	movq	-24(%rbp), %rax
	movq	$1024, 1200(%rax)
	movq	-24(%rbp), %rax
	movq	$-1, 16(%rax)
	movq	-24(%rbp), %rax
	movq	$-1, 24(%rax)
	movq	-24(%rbp), %rax
	movq	$-1, 32(%rax)
	movq	-24(%rbp), %rax
	movq	$-1, 40(%rax)
	movq	-24(%rbp), %rax
	movq	$-1, 48(%rax)
	movq	-24(%rbp), %rax
	movq	$-1, 56(%rax)
	movq	-24(%rbp), %rax
	movq	$-1, 64(%rax)
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	leaq	.LC20(%rip), %rsi
	movq	%rax, %rdi
	call	add_section@PLT
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$4, %r8d
	movl	$6, %ecx
	movl	$1, %edx
	leaq	.LC21(%rip), %rsi
	movq	%rax, %rdi
	call	add_section@PLT
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$4, %r8d
	movl	$64, %ecx
	movl	$4, %edx
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	call	add_section@PLT
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$4, %r8d
	movl	$2, %ecx
	movl	$1, %edx
	leaq	.LC23(%rip), %rsi
	movq	%rax, %rdi
	call	add_section@PLT
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$1, %r8d
	movl	$0, %ecx
	movl	$1, %edx
	leaq	.LC24(%rip), %rsi
	movq	%rax, %rdi
	call	add_section@PLT
	movq	-24(%rbp), %rax
	movl	$24, %r9d
	movl	$8, %r8d
	movl	$0, %ecx
	movl	$2, %edx
	leaq	.LC25(%rip), %rsi
	movq	%rax, %rdi
	call	add_section@PLT
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$1, %r8d
	movl	$0, %ecx
	movl	$3, %edx
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rdi
	call	add_section@PLT
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$1, %r8d
	movl	$0, %ecx
	movl	$3, %edx
	leaq	.LC27(%rip), %rsi
	movq	%rax, %rdi
	call	add_section@PLT
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	leaq	.LC20(%rip), %rsi
	movq	%rax, %rdi
	call	add_symbol@PLT
	movq	$0, -8(%rbp)
	jmp	.L43
.L44:
	movq	-8(%rbp), %rax
	salq	$7, %rax
	leaq	25920(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	buffer_init@PLT
	addq	$1, -8(%rbp)
.L43:
	movq	-24(%rbp), %rax
	movq	27104(%rax), %rax
	cmpq	%rax, -8(%rbp)
	jb	.L44
	movq	-24(%rbp), %rax
	movq	40(%rax), %rax
	salq	$7, %rax
	leaq	25920(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	$1, %edx
	leaq	.LC28(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	buffer_append@PLT
	movq	-24(%rbp), %rax
	movq	48(%rax), %rax
	salq	$7, %rax
	leaq	25920(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	$1, %edx
	leaq	.LC28(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	buffer_append@PLT
	movq	-24(%rbp), %rax
	movq	56(%rax), %rax
	salq	$7, %rax
	leaq	25920(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 1216(%rax)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 1224(%rax)
	movq	-24(%rbp), %rax
	movq	$0, 1232(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	assembler_init, .-assembler_init
	.section	.rodata
	.align 8
.LC29:
	.string	"[ERROR] jmp instruction lacks required information\n"
	.align 8
.LC30:
	.string	"[ERROR] no such text label %s\n"
	.align 8
.LC31:
	.string	"[ERROR] first byte of jmp instruction was incorrect 0x%02x\n"
	.text
	.globl	assembler_process_symbols
	.type	assembler_process_symbols, @function
assembler_process_symbols:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -120(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-120(%rbp), %rax
	movq	1208(%rax), %rsi
	movq	-120(%rbp), %rax
	movl	$0, %r9d
	movl	$4, %r8d
	movl	$0, %ecx
	movl	$65521, %edx
	movq	%rax, %rdi
	call	add_symbol@PLT
	movq	-120(%rbp), %rax
	movq	16(%rax), %rax
	movzwl	%ax, %edx
	movq	-120(%rbp), %rax
	movl	$0, %r9d
	movl	$3, %r8d
	movl	$0, %ecx
	leaq	.LC21(%rip), %rsi
	movq	%rax, %rdi
	call	add_symbol@PLT
	movq	-120(%rbp), %rax
	movq	168(%rax), %rax
	testq	%rax, %rax
	je	.L46
	movq	-120(%rbp), %rax
	movq	56(%rax), %rax
	movzwl	%ax, %edx
	movq	-120(%rbp), %rax
	movl	$0, %r9d
	movl	$3, %r8d
	movl	$0, %ecx
	leaq	.LC23(%rip), %rsi
	movq	%rax, %rdi
	call	add_symbol@PLT
.L46:
	movq	$0, -104(%rbp)
	jmp	.L47
.L49:
	movq	-104(%rbp), %rax
	salq	$5, %rax
	leaq	336(%rax), %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	addq	$8, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movzbl	26(%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L48
	movq	-16(%rbp), %rax
	movzbl	27(%rax), %eax
	movzbl	%al, %edi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rcx
	movq	-16(%rbp), %rax
	movzwl	24(%rax), %eax
	movzwl	%ax, %edx
	movq	-16(%rbp), %rax
	movq	(%rax), %rsi
	movq	-120(%rbp), %rax
	movl	$0, %r9d
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	add_symbol@PLT
	movq	-120(%rbp), %rax
	movq	25816(%rax), %rax
	leaq	-1(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-120(%rbp), %rsi
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	addq	%rsi, %rax
	addq	$1320, %rax
	movq	%rcx, (%rax)
.L48:
	addq	$1, -104(%rbp)
.L47:
	movq	-120(%rbp), %rax
	movq	1176(%rax), %rax
	cmpq	%rax, -104(%rbp)
	jb	.L49
	movq	$0, -96(%rbp)
	jmp	.L50
.L52:
	movq	-96(%rbp), %rax
	salq	$5, %rax
	leaq	336(%rax), %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	addq	$8, %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movzbl	26(%rax), %eax
	testb	%al, %al
	je	.L51
	movq	-24(%rbp), %rax
	movzbl	27(%rax), %eax
	movzbl	%al, %edi
	movq	-24(%rbp), %rax
	movq	16(%rax), %rcx
	movq	-24(%rbp), %rax
	movzwl	24(%rax), %eax
	movzwl	%ax, %edx
	movq	-24(%rbp), %rax
	movq	(%rax), %rsi
	movq	-120(%rbp), %rax
	movl	$1, %r9d
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	add_symbol@PLT
	movq	-120(%rbp), %rax
	movq	25816(%rax), %rax
	leaq	-1(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-120(%rbp), %rsi
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	addq	%rsi, %rax
	addq	$1320, %rax
	movq	%rcx, (%rax)
.L51:
	addq	$1, -96(%rbp)
.L50:
	movq	-120(%rbp), %rax
	movq	1176(%rax), %rax
	cmpq	%rax, -96(%rbp)
	jb	.L52
	movq	-120(%rbp), %rax
	movq	16(%rax), %rax
	salq	$7, %rax
	leaq	25920(%rax), %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -48(%rbp)
	movq	$0, -88(%rbp)
	jmp	.L53
.L69:
	movq	-120(%rbp), %rax
	movq	1184(%rax), %rcx
	movq	-88(%rbp), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	$2, %eax
	jne	.L54
	movq	-40(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L55
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$51, %edx
	movl	$1, %esi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L67
.L55:
	movq	$0, -80(%rbp)
	movq	$0, -72(%rbp)
	jmp	.L57
.L59:
	movq	-32(%rbp), %rax
	movq	(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	-72(%rbp), %rcx
	addq	$10, %rcx
	salq	$4, %rcx
	addq	%rcx, %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L58
	movq	-72(%rbp), %rax
	addq	$10, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	addq	$16, %rax
	movq	%rax, -80(%rbp)
.L58:
	addq	$1, -72(%rbp)
.L57:
	movq	-120(%rbp), %rax
	movq	336(%rax), %rax
	cmpq	%rax, -72(%rbp)
	jb	.L59
	cmpq	$0, -80(%rbp)
	jne	.L60
	movq	-32(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC30(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L67
.L60:
	movq	-80(%rbp), %rax
	movq	8(%rax), %rax
	movl	%eax, %ecx
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, -108(%rbp)
	movl	-108(%rbp), %eax
	cmpl	$-128, %eax
	jl	.L61
	movl	-108(%rbp), %eax
	cmpl	$127, %eax
	jg	.L61
	movl	-108(%rbp), %eax
	movl	%eax, %edx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movl	%eax, %ecx
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	subl	%ecx, %edx
	movb	%dl, (%rax)
	jmp	.L54
.L61:
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	$-21, %al
	jne	.L63
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movb	$-23, (%rax)
	movq	$1, -64(%rbp)
	movq	$3, -56(%rbp)
	jmp	.L64
.L63:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	$111, %al
	jbe	.L65
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jns	.L66
.L65:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movq	stderr(%rip), %rax
	leaq	.LC31(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L67
.L66:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	andl	$15, %eax
	orl	$-128, %eax
	movl	%eax, %edx
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	movb	%dl, (%rax)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movb	$15, (%rax)
	movq	$2, -64(%rbp)
	movq	$4, -56(%rbp)
.L64:
	movl	-108(%rbp), %eax
	movl	%eax, %ecx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, -108(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rax, %rdx
	movl	-108(%rbp), %eax
	movl	%eax, (%rdx)
	movq	-120(%rbp), %rax
	leaq	72(%rax), %rcx
	movq	-56(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	apply_text_shift@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L54
	movl	$0, %eax
	jmp	.L67
.L54:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	(%rax), %rcx
	movq	-48(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	buffer_append@PLT
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L68
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movl	16(%rax), %ecx
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movq	8(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movq	24(%rax), %rsi
	movq	-120(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	add_rela@PLT
.L68:
	addq	$1, -88(%rbp)
.L53:
	movq	-120(%rbp), %rax
	movq	1192(%rax), %rax
	cmpq	%rax, -88(%rbp)
	jb	.L69
	movl	$1, %eax
.L67:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L70
	call	__stack_chk_fail@PLT
.L70:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	assembler_process_symbols, .-assembler_process_symbols
	.section	.rodata
.LC32:
	.string	"[INFO ] Assembling file: %s\n"
.LC33:
	.string	"r"
.LC34:
	.string	"fopen failed"
	.align 8
.LC35:
	.string	"[ERROR] Error opening input file: %s\n"
	.align 8
.LC36:
	.string	"[ERROR] %s line %d: parsing failed\n"
	.align 8
.LC37:
	.string	"[ERROR] %s line %d: encountered unknown token %s\n"
	.align 8
.LC38:
	.string	"[ERROR] Symbol processing failed\n"
	.align 8
.LC39:
	.string	"[ERROR] Failed to write to ELF file %s\n"
	.text
	.globl	assemble_file
	.type	assemble_file, @function
assemble_file:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$27992, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -27992(%rbp)
	movq	%rsi, -28000(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	leaq	-27792(%rbp), %rax
	movq	%rax, %rdi
	call	assembler_init
	movq	-27992(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -27792(%rbp)
	movq	-28000(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -27784(%rbp)
	movl	log_level(%rip), %eax
	cmpl	$1, %eax
	jbe	.L72
	movq	-27792(%rbp), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC32(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L72:
	movq	-27792(%rbp), %rax
	leaq	.LC33(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, yyin(%rip)
	movq	yyin(%rip), %rax
	testq	%rax, %rax
	jne	.L73
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movq	-27792(%rbp), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC35(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L86
.L73:
	movl	$0, line_num(%rip)
	movb	$1, -27973(%rbp)
	movq	$0, -27800(%rbp)
	movq	$0, -27888(%rbp)
	jmp	.L75
.L83:
	cmpl	$999, -27972(%rbp)
	je	.L76
	cmpl	$999, -27972(%rbp)
	jg	.L77
	cmpl	$500, -27972(%rbp)
	je	.L88
	cmpl	$500, -27972(%rbp)
	jg	.L77
	cmpl	$408, -27972(%rbp)
	je	.L79
	cmpl	$408, -27972(%rbp)
	jg	.L77
	cmpl	$407, -27972(%rbp)
	je	.L75
	cmpl	$407, -27972(%rbp)
	jg	.L77
	cmpl	$405, -27972(%rbp)
	je	.L79
	cmpl	$405, -27972(%rbp)
	jg	.L77
	cmpl	$403, -27972(%rbp)
	jg	.L77
	cmpl	$401, -27972(%rbp)
	jge	.L79
	cmpl	$338, -27972(%rbp)
	jg	.L77
	cmpl	$336, -27972(%rbp)
	jge	.L79
	cmpl	$247, -27972(%rbp)
	jg	.L81
	cmpl	$246, -27972(%rbp)
	jge	.L79
	jmp	.L77
.L81:
	movl	-27972(%rbp), %eax
	subl	$330, %eax
	cmpl	$2, %eax
	ja	.L77
	jmp	.L79
.L76:
	leaq	-27968(%rbp), %rax
	leaq	-27792(%rbp), %rdx
	addq	$72, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	handle_line@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L82
	movl	line_num(%rip), %ecx
	movq	-27792(%rbp), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC36(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L86
.L82:
	movq	$0, -27888(%rbp)
	movq	$0, -27800(%rbp)
	jmp	.L75
.L79:
	movq	yytext(%rip), %rax
	movq	-27800(%rbp), %rbx
	leaq	1(%rbx), %rdx
	movq	%rdx, -27800(%rbp)
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	leaq	10(%rbx), %rax
	movq	%rdx, -27960(%rbp,%rax,8)
	jmp	.L77
.L88:
	movq	yytext(%rip), %rsi
	movl	line_num(%rip), %ecx
	movq	-27792(%rbp), %rdx
	movq	stderr(%rip), %rax
	movq	%rsi, %r8
	leaq	.LC37(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L86
.L77:
	movq	-27888(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -27888(%rbp)
	movl	-27972(%rbp), %edx
	movl	%edx, -27968(%rbp,%rax,4)
.L75:
	movl	$0, %eax
	call	yylex@PLT
	movl	%eax, -27972(%rbp)
	cmpl	$0, -27972(%rbp)
	jne	.L83
	leaq	-27792(%rbp), %rax
	addq	$72, %rax
	movq	%rax, %rdi
	call	print_text_debug
	leaq	-27792(%rbp), %rax
	movq	%rax, %rdi
	call	assembler_process_symbols
	xorl	$1, %eax
	testb	%al, %al
	je	.L84
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$33, %edx
	movl	$1, %esi
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L86
.L84:
	leaq	-27792(%rbp), %rax
	movq	%rax, %rdi
	call	write_elf_object_file@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L85
	movq	-27784(%rbp), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC39(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movb	$0, -27973(%rbp)
.L85:
	movzbl	-27973(%rbp), %eax
.L86:
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L87
	call	__stack_chk_fail@PLT
.L87:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	assemble_file, .-assemble_file
	.ident	"GCC: (GNU) 14.2.1 20250207"
	.section	.note.GNU-stack,"",@progbits
