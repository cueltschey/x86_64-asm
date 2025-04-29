	.file	"text.c"
	.text
	.globl	add_new_inst
	.type	add_new_inst, @function
add_new_inst:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movl	%ecx, -92(%rbp)
	movq	%r8, -104(%rbp)
	movq	%r9, -112(%rbp)
	movq	-72(%rbp), %rax
	movq	1120(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-72(%rbp), %rax
	movq	1128(%rax), %rax
	cmpq	%rdx, %rax
	jnb	.L2
	movq	-72(%rbp), %rax
	movq	1128(%rax), %rax
	leaq	(%rax,%rax), %rdx
	movq	-72(%rbp), %rax
	movq	1112(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	-72(%rbp), %rdx
	movq	%rax, 1112(%rdx)
.L2:
	movq	-80(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -56(%rbp)
	movl	-92(%rbp), %eax
	movl	%eax, -48(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-72(%rbp), %rax
	movq	1112(%rax), %rsi
	movq	-72(%rbp), %rax
	movq	1120(%rax), %rdx
	leaq	1(%rdx), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, 1120(%rax)
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rbx
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rbx
	movq	%rcx, 16(%rax)
	movq	%rbx, 24(%rax)
	movq	-32(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-72(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-88(%rbp), %rax
	addq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, 8(%rax)
	movl	$1, %eax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	add_new_inst, .-add_new_inst
	.section	.rodata
	.align 8
.LC0:
	.string	"[ERROR] text shift failed: no extra info for instruction %zu\n"
	.text
	.globl	apply_text_shift
	.type	apply_text_shift, @function
apply_text_shift:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-40(%rbp), %rax
	movq	1112(%rax), %rcx
	movq	-48(%rbp), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	32(%rax), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L5
	movq	stderr(%rip), %rax
	movq	-48(%rbp), %rdx
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L6
.L5:
	movq	$0, -32(%rbp)
	jmp	.L7
.L9:
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rdx
	addq	$6, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	addq	$16, %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L8
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rdx
	addq	$6, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	addq	$16, %rax
	movq	(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rcx
	addq	$6, %rcx
	salq	$4, %rcx
	addq	%rcx, %rax
	addq	$16, %rax
	movq	%rdx, (%rax)
.L8:
	addq	$1, -32(%rbp)
.L7:
	movq	-40(%rbp), %rax
	movq	264(%rax), %rax
	cmpq	%rax, -32(%rbp)
	jb	.L9
	movq	-48(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	jmp	.L10
.L12:
	movq	-40(%rbp), %rax
	movq	1112(%rax), %rcx
	movq	-24(%rbp), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L11
	movq	-40(%rbp), %rax
	movq	1112(%rax), %rcx
	movq	-24(%rbp), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
.L11:
	addq	$1, -24(%rbp)
.L10:
	movq	-40(%rbp), %rax
	movq	1120(%rax), %rax
	cmpq	%rax, -24(%rbp)
	jb	.L12
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 8(%rax)
	movl	$1, %eax
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	apply_text_shift, .-apply_text_shift
	.section	.rodata
.LC1:
	.string	"malloc failed"
	.text
	.globl	parse_cstring_escapes
	.type	parse_cstring_escapes, @function
parse_cstring_escapes:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L14
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L14:
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	jmp	.L15
.L29:
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$92, %al
	jne	.L16
	addq	$1, -32(%rbp)
	movq	-32(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jnb	.L31
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	cmpl	$116, %eax
	je	.L19
	cmpl	$116, %eax
	jg	.L20
	cmpl	$114, %eax
	je	.L21
	cmpl	$114, %eax
	jg	.L20
	cmpl	$110, %eax
	je	.L22
	cmpl	$110, %eax
	jg	.L20
	cmpl	$92, %eax
	je	.L23
	cmpl	$92, %eax
	jg	.L20
	cmpl	$48, %eax
	je	.L24
	cmpl	$48, %eax
	jg	.L20
	cmpl	$34, %eax
	je	.L25
	cmpl	$39, %eax
	je	.L26
	jmp	.L20
.L22:
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdx
	addq	%rdx, %rax
	movb	$10, (%rax)
	jmp	.L28
.L19:
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdx
	addq	%rdx, %rax
	movb	$9, (%rax)
	jmp	.L28
.L21:
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdx
	addq	%rdx, %rax
	movb	$13, (%rax)
	jmp	.L28
.L23:
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdx
	addq	%rdx, %rax
	movb	$92, (%rax)
	jmp	.L28
.L26:
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdx
	addq	%rdx, %rax
	movb	$39, (%rax)
	jmp	.L28
.L25:
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdx
	addq	%rdx, %rax
	movb	$34, (%rax)
	jmp	.L28
.L24:
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	jmp	.L28
.L20:
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	(%rcx), %eax
	movb	%al, (%rdx)
	jmp	.L28
.L16:
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	(%rcx), %eax
	movb	%al, (%rdx)
.L28:
	addq	$1, -32(%rbp)
.L15:
	movq	-32(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jb	.L29
	jmp	.L18
.L31:
	nop
.L18:
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	parse_cstring_escapes, .-parse_cstring_escapes
	.globl	tok_is_label
	.type	tok_is_label, @function
tok_is_label:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	cmpl	$330, -4(%rbp)
	je	.L33
	cmpl	$332, -4(%rbp)
	je	.L33
	cmpl	$331, -4(%rbp)
	je	.L33
	cmpl	$405, -4(%rbp)
	je	.L33
	cmpl	$337, -4(%rbp)
	jne	.L34
.L33:
	movl	$1, %eax
	jmp	.L35
.L34:
	movl	$0, %eax
.L35:
	andl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	tok_is_label, .-tok_is_label
	.globl	tok_is_directive
	.type	tok_is_directive, @function
tok_is_directive:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	cmpl	$299, -4(%rbp)
	jle	.L38
	cmpl	$320, -4(%rbp)
	jg	.L38
	movl	$1, %eax
	jmp	.L39
.L38:
	movl	$0, %eax
.L39:
	andl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	tok_is_directive, .-tok_is_directive
	.globl	tok_is_machine_code
	.type	tok_is_machine_code, @function
tok_is_machine_code:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jle	.L42
	cmpl	$247, -4(%rbp)
	jg	.L42
	movl	$1, %eax
	jmp	.L43
.L42:
	movl	$0, %eax
.L43:
	andl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	tok_is_machine_code, .-tok_is_machine_code
	.section	.rodata
	.align 8
.LC2:
	.string	"[ERROR] handle line: unexpected first token: %d\n"
	.text
	.globl	handle_line
	.type	handle_line, @function
handle_line:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	80(%rax), %rax
	testq	%rax, %rax
	jne	.L46
	movl	$1, %eax
	jmp	.L47
.L46:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	tok_is_label
	testb	%al, %al
	je	.L48
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	handle_label
	jmp	.L47
.L48:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	tok_is_directive
	testb	%al, %al
	je	.L49
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	handle_directive
	jmp	.L47
.L49:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	tok_is_machine_code
	testb	%al, %al
	je	.L50
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	handle_machine_code
	jmp	.L47
.L50:
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
.L47:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	handle_line, .-handle_line
	.section	.rodata
	.align 8
.LC3:
	.string	"[ERROR] Expected label name in .text\n"
.LC4:
	.string	"[DEBUG] Found function %zu\n"
	.align 8
.LC5:
	.string	"[ERROR] Got unexpected label in .text: %d\n"
	.align 8
.LC6:
	.string	"[ERROR] Expected rodata constant label but got: %s\n"
	.text
	.globl	handle_label
	.type	handle_label, @function
handle_label:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -76(%rbp)
	movq	$0, -72(%rbp)
	movq	-96(%rbp), %rax
	movq	168(%rax), %rax
	testq	%rax, %rax
	je	.L52
	movq	-96(%rbp), %rax
	movq	88(%rax), %rax
	movq	%rax, -72(%rbp)
.L52:
	movq	-88(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L53
	cmpl	$1, %eax
	je	.L54
	jmp	.L74
.L53:
	cmpq	$0, -72(%rbp)
	jne	.L56
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L57
.L56:
	cmpl	$405, -76(%rbp)
	jne	.L58
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	-1(%rax), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	pxor	%xmm0, %xmm0
	movaps	%xmm0, -32(%rbp)
	movaps	%xmm0, -16(%rbp)
	movq	-88(%rbp), %rax
	movq	1152(%rax), %rax
	movw	%ax, -8(%rbp)
	movb	$1, -6(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -32(%rbp)
	movb	$2, -5(%rbp)
	movb	$1, -4(%rbp)
	movq	-88(%rbp), %rax
	movq	1104(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-88(%rbp), %rdx
	movq	%rcx, 1104(%rdx)
	movq	-88(%rbp), %rdx
	salq	$5, %rax
	addq	%rdx, %rax
	leaq	272(%rax), %rcx
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, (%rcx)
	movq	%rdx, 8(%rcx)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rax, 16(%rcx)
	movq	%rdx, 24(%rcx)
	movl	$1, %eax
	jmp	.L57
.L58:
	cmpl	$331, -76(%rbp)
	jne	.L59
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	jmp	.L60
.L64:
	movq	-88(%rbp), %rax
	movq	-56(%rbp), %rdx
	addq	$9, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	addq	$12, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L61
	movq	-88(%rbp), %rax
	movq	1160(%rax), %rax
	cmpq	%rax, -64(%rbp)
	jne	.L62
	movq	-88(%rbp), %rax
	movq	8(%rax), %rax
	movq	-88(%rbp), %rdx
	movq	-56(%rbp), %rcx
	addq	$9, %rcx
	salq	$5, %rcx
	addq	%rcx, %rdx
	movq	%rax, (%rdx)
	jmp	.L63
.L62:
	addq	$1, -64(%rbp)
.L61:
	addq	$1, -56(%rbp)
.L60:
	movq	-88(%rbp), %rax
	movq	1104(%rax), %rax
	cmpq	%rax, -56(%rbp)
	jb	.L64
.L63:
	movl	$1, %eax
	jmp	.L57
.L59:
	cmpl	$332, -76(%rbp)
	jne	.L65
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	jmp	.L66
.L71:
	movq	-88(%rbp), %rax
	movq	-40(%rbp), %rdx
	addq	$9, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	addq	$12, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L67
	movq	-88(%rbp), %rax
	movq	1160(%rax), %rax
	cmpq	%rax, -48(%rbp)
	jne	.L68
	movq	-88(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-88(%rbp), %rax
	movq	-40(%rbp), %rcx
	addq	$9, %rcx
	salq	$5, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	subq	%rax, %rdx
	movq	-88(%rbp), %rax
	movq	-40(%rbp), %rcx
	salq	$5, %rcx
	addq	%rcx, %rax
	addq	$280, %rax
	movq	%rdx, (%rax)
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L75
	movq	-88(%rbp), %rax
	movq	1160(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L75
.L68:
	addq	$1, -48(%rbp)
.L67:
	addq	$1, -40(%rbp)
.L66:
	movq	-88(%rbp), %rax
	movq	1104(%rax), %rax
	cmpq	%rax, -40(%rbp)
	jb	.L71
	jmp	.L70
.L75:
	nop
.L70:
	movq	-88(%rbp), %rax
	movq	1160(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, 1160(%rax)
	movl	$1, %eax
	jmp	.L57
.L65:
	cmpl	$337, -76(%rbp)
	jne	.L72
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	-1(%rax), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -32(%rbp)
	movq	-88(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-88(%rbp), %rax
	movq	264(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-88(%rbp), %rdx
	movq	%rcx, 264(%rdx)
	movq	-88(%rbp), %rdx
	addq	$6, %rax
	salq	$4, %rax
	leaq	(%rdx,%rax), %rcx
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, 8(%rcx)
	movq	%rdx, 16(%rcx)
	movl	$1, %eax
	jmp	.L57
.L72:
	movq	stderr(%rip), %rax
	movl	-76(%rbp), %edx
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L57
.L54:
	cmpl	$330, -76(%rbp)
	je	.L73
	movq	stderr(%rip), %rax
	movq	-72(%rbp), %rdx
	leaq	.LC6(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L57
.L73:
	movq	-88(%rbp), %rax
	movq	96(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, 96(%rax)
	nop
.L74:
	movl	$1, %eax
.L57:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	handle_label, .-handle_label
	.section	.rodata
	.align 8
.LC7:
	.string	"[ERROR] .file directive requires string\n"
	.align 8
.LC8:
	.string	"[ERROR] Encountered .string outside of rodata\n"
	.align 8
.LC9:
	.string	"[ERROR] Encountered .globl outside of .text\n"
	.align 8
.LC10:
	.string	"[ERROR] .globl requires string\n"
.LC11:
	.string	"[ERROR] Unexpected directive\n"
	.align 8
.LC12:
	.string	"[ERROR] unknown .section directive: %s\n"
	.text
	.globl	handle_directive
	.type	handle_directive, @function
handle_directive:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-64(%rbp), %rax
	movq	80(%rax), %rax
	testq	%rax, %rax
	jne	.L77
	movl	$0, %eax
	jmp	.L78
.L77:
	movq	$0, -32(%rbp)
	movq	-64(%rbp), %rax
	movq	168(%rax), %rax
	testq	%rax, %rax
	je	.L79
	movq	-64(%rbp), %rax
	movq	88(%rax), %rax
	movq	%rax, -32(%rbp)
.L79:
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	subl	$300, %eax
	cmpl	$13, %eax
	ja	.L102
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L82(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L82(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L82:
	.long	.L88-.L82
	.long	.L103-.L82
	.long	.L86-.L82
	.long	.L102-.L82
	.long	.L102-.L82
	.long	.L102-.L82
	.long	.L102-.L82
	.long	.L102-.L82
	.long	.L102-.L82
	.long	.L102-.L82
	.long	.L85-.L82
	.long	.L84-.L82
	.long	.L83-.L82
	.long	.L81-.L82
	.text
.L88:
	cmpq	$0, -32(%rbp)
	jne	.L89
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$40, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L78
.L89:
	addq	$1, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	-1(%rax), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, 1136(%rax)
	movl	$1, %eax
	jmp	.L78
.L86:
	movq	-56(%rbp), %rax
	movl	$0, (%rax)
	movl	$1, %eax
	jmp	.L78
.L85:
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	je	.L90
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$46, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L78
.L90:
	addq	$1, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	-1(%rax), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	parse_cstring_escapes
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	-56(%rbp), %rdx
	movq	96(%rdx), %rdx
	subq	$1, %rdx
	leaq	1(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	$2, %rdx
	movq	%rcx, (%rax,%rdx,8)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	1144(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	buffer_append@PLT
	movb	$0, -33(%rbp)
	movq	-56(%rbp), %rax
	movq	1144(%rax), %rax
	leaq	-33(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	buffer_append@PLT
	movl	$1, %eax
	jmp	.L78
.L84:
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L92
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$44, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L78
.L92:
	cmpq	$0, -32(%rbp)
	jne	.L93
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L78
.L93:
	movq	$0, -24(%rbp)
	jmp	.L94
.L96:
	movq	-56(%rbp), %rax
	movq	-24(%rbp), %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	addq	$272, %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L95
	movq	-56(%rbp), %rax
	movq	-24(%rbp), %rdx
	addq	$9, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	addq	$10, %rax
	movb	$1, (%rax)
.L95:
	addq	$1, -24(%rbp)
.L94:
	movq	-56(%rbp), %rax
	movq	1104(%rax), %rax
	cmpq	%rax, -24(%rbp)
	jb	.L96
	movl	$1, %eax
	jmp	.L78
.L81:
	movl	$1, %eax
	jmp	.L78
.L83:
	movl	$1, %eax
	jmp	.L78
.L102:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$29, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L78
.L103:
	nop
	movq	-64(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	$320, %eax
	je	.L98
	cmpl	$320, %eax
	jg	.L99
	cmpl	$302, %eax
	je	.L100
	cmpl	$303, %eax
	jne	.L99
	movq	-56(%rbp), %rax
	movl	$1, (%rax)
	movl	$1, %eax
	jmp	.L78
.L98:
	movq	-56(%rbp), %rax
	movl	$2, (%rax)
	movl	$1, %eax
	jmp	.L78
.L100:
	movq	-56(%rbp), %rax
	movl	$0, (%rax)
	movl	$1, %eax
	jmp	.L78
.L99:
	movq	stderr(%rip), %rax
	movq	-32(%rbp), %rdx
	leaq	.LC12(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
.L78:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L101
	call	__stack_chk_fail@PLT
.L101:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	handle_directive, .-handle_directive
	.section	.rodata
	.align 8
.LC13:
	.string	"[WARN ] Encountered unknown instruction: 0x%02x\n"
	.text
	.globl	handle_machine_code
	.type	handle_machine_code, @function
handle_machine_code:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	80(%rax), %rax
	testq	%rax, %rax
	jne	.L105
	movl	$0, %eax
	jmp	.L106
.L105:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$247, %eax
	jg	.L107
	cmpl	$246, %eax
	jge	.L108
	cmpl	$233, %eax
	je	.L109
	cmpl	$233, %eax
	jg	.L107
	cmpl	$201, %eax
	jg	.L110
	cmpl	$40, %eax
	jl	.L107
	subl	$40, %eax
	cmpl	$161, %eax
	ja	.L107
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L112(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L112(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L112:
	.long	.L119-.L112
	.long	.L119-.L112
	.long	.L107-.L112
	.long	.L119-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L122-.L112
	.long	.L122-.L112
	.long	.L107-.L112
	.long	.L122-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L121-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L120-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L119-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L109-.L112
	.long	.L109-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L109-.L112
	.long	.L109-.L112
	.long	.L109-.L112
	.long	.L109-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L118-.L112
	.long	.L118-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L117-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L116-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L115-.L112
	.long	.L114-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L113-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L107-.L112
	.long	.L111-.L112
	.text
.L110:
	cmpl	$232, %eax
	je	.L123
	jmp	.L107
.L118:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	opcode_mov
	jmp	.L106
.L119:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	opcode_sub
	jmp	.L106
.L117:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	opcode_lea
	jmp	.L106
.L123:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	opcode_call
	jmp	.L106
.L121:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	opcode_push
	jmp	.L106
.L111:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	opcode_leave
	jmp	.L106
.L113:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	opcode_ret
	jmp	.L106
.L109:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	opcode_jmp
	jmp	.L106
.L122:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	opcode_cmp
	jmp	.L106
.L116:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	opcode_nop
	jmp	.L106
.L120:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	opcode_pop
	jmp	.L106
.L114:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	opcode_cqd
	jmp	.L106
.L115:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	opcode_cqo
	jmp	.L106
.L108:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	opcode_mul
	jmp	.L106
.L107:
	movl	log_level(%rip), %eax
	testl	%eax, %eax
	je	.L126
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L126:
	nop
	movl	$1, %eax
.L106:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	handle_machine_code, .-handle_machine_code
	.globl	opcode_leave
	.type	opcode_leave, @function
opcode_leave:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$1, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$-55, (%rax)
	movq	-8(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$1, %edx
	movq	%rax, %rdi
	call	add_new_inst
	movl	$1, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	opcode_leave, .-opcode_leave
	.globl	opcode_cqd
	.type	opcode_cqd, @function
opcode_cqd:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$1, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$-103, (%rax)
	movq	-8(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$1, %edx
	movq	%rax, %rdi
	call	add_new_inst
	movl	$1, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	opcode_cqd, .-opcode_cqd
	.globl	opcode_cqo
	.type	opcode_cqo, @function
opcode_cqo:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$2, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$72, (%rax)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$-103, (%rax)
	movq	-8(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$1, %edx
	movq	%rax, %rdi
	call	add_new_inst
	movl	$1, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	opcode_cqo, .-opcode_cqo
	.globl	opcode_nop
	.type	opcode_nop, @function
opcode_nop:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$1, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$-112, (%rax)
	movq	-8(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$1, %edx
	movq	%rax, %rdi
	call	add_new_inst
	movl	$1, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	opcode_nop, .-opcode_nop
	.globl	opcode_ret
	.type	opcode_ret, @function
opcode_ret:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$1, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$-61, (%rax)
	movq	-8(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$1, %edx
	movq	%rax, %rdi
	call	add_new_inst
	movl	$1, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	opcode_ret, .-opcode_ret
	.section	.rodata
	.align 8
.LC14:
	.string	"[ERROR] push encoding failed: expected 2 operands but got %ld\n"
	.align 8
.LC15:
	.string	"[ERROR] push encoding failed: unsupported operand token: %d\n"
	.text
	.globl	opcode_push
	.type	opcode_push, @function
opcode_push:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	80(%rax), %rax
	cmpq	$2, %rax
	je	.L138
	movq	-32(%rbp), %rax
	movq	80(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC14(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L139
.L138:
	movq	$0, -16(%rbp)
	movl	$2, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movl	4(%rax), %eax
	subl	$600, %eax
	cmpl	$15, %eax
	ja	.L159
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L142(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L142(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L142:
	.long	.L157-.L142
	.long	.L156-.L142
	.long	.L155-.L142
	.long	.L154-.L142
	.long	.L153-.L142
	.long	.L152-.L142
	.long	.L151-.L142
	.long	.L150-.L142
	.long	.L149-.L142
	.long	.L148-.L142
	.long	.L147-.L142
	.long	.L146-.L142
	.long	.L145-.L142
	.long	.L144-.L142
	.long	.L143-.L142
	.long	.L141-.L142
	.text
.L157:
	movq	-8(%rbp), %rax
	movb	$80, (%rax)
	movq	$1, -16(%rbp)
	jmp	.L158
.L155:
	movq	-8(%rbp), %rax
	movb	$81, (%rax)
	movq	$1, -16(%rbp)
	jmp	.L158
.L154:
	movq	-8(%rbp), %rax
	movb	$82, (%rax)
	movq	$1, -16(%rbp)
	jmp	.L158
.L156:
	movq	-8(%rbp), %rax
	movb	$83, (%rax)
	movq	$1, -16(%rbp)
	jmp	.L158
.L150:
	movq	-8(%rbp), %rax
	movb	$84, (%rax)
	movq	$1, -16(%rbp)
	jmp	.L158
.L151:
	movq	-8(%rbp), %rax
	movb	$85, (%rax)
	movq	$1, -16(%rbp)
	jmp	.L158
.L153:
	movq	-8(%rbp), %rax
	movb	$86, (%rax)
	movq	$1, -16(%rbp)
	jmp	.L158
.L152:
	movq	-8(%rbp), %rax
	movb	$87, (%rax)
	movq	$1, -16(%rbp)
	jmp	.L158
.L149:
	movq	-8(%rbp), %rax
	movb	$65, (%rax)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$80, (%rax)
	movq	$2, -16(%rbp)
	jmp	.L158
.L148:
	movq	-8(%rbp), %rax
	movb	$65, (%rax)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$81, (%rax)
	movq	$2, -16(%rbp)
	jmp	.L158
.L147:
	movq	-8(%rbp), %rax
	movb	$65, (%rax)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$82, (%rax)
	movq	$2, -16(%rbp)
	jmp	.L158
.L146:
	movq	-8(%rbp), %rax
	movb	$65, (%rax)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$83, (%rax)
	movq	$2, -16(%rbp)
	jmp	.L158
.L145:
	movq	-8(%rbp), %rax
	movb	$65, (%rax)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$84, (%rax)
	movq	$2, -16(%rbp)
	jmp	.L158
.L144:
	movq	-8(%rbp), %rax
	movb	$65, (%rax)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$85, (%rax)
	movq	$2, -16(%rbp)
	jmp	.L158
.L143:
	movq	-8(%rbp), %rax
	movb	$65, (%rax)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$86, (%rax)
	movq	$2, -16(%rbp)
	jmp	.L158
.L141:
	movq	-8(%rbp), %rax
	movb	$65, (%rax)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$87, (%rax)
	movq	$2, -16(%rbp)
	jmp	.L158
.L159:
	movq	-32(%rbp), %rax
	movl	4(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC15(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	jmp	.L139
.L158:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	add_new_inst
	movl	$1, %eax
.L139:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	opcode_push, .-opcode_push
	.globl	is_extended_reg
	.type	is_extended_reg, @function
is_extended_reg:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	cmpl	$607, -4(%rbp)
	jle	.L161
	cmpl	$615, -4(%rbp)
	jle	.L162
.L161:
	cmpl	$627, -4(%rbp)
	jle	.L163
	cmpl	$635, -4(%rbp)
	jle	.L162
.L163:
	cmpl	$647, -4(%rbp)
	jle	.L164
	cmpl	$655, -4(%rbp)
	jle	.L162
.L164:
	cmpl	$667, -4(%rbp)
	jle	.L165
	cmpl	$675, -4(%rbp)
	jg	.L165
.L162:
	movl	$1, %eax
	jmp	.L166
.L165:
	movl	$0, %eax
.L166:
	andl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	is_extended_reg, .-is_extended_reg
	.globl	is_rex_required_special
	.type	is_rex_required_special, @function
is_rex_required_special:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	cmpl	$664, -4(%rbp)
	je	.L169
	cmpl	$665, -4(%rbp)
	je	.L169
	cmpl	$666, -4(%rbp)
	je	.L169
	cmpl	$667, -4(%rbp)
	jne	.L170
.L169:
	movl	$1, %eax
	jmp	.L171
.L170:
	movl	$0, %eax
.L171:
	andl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	is_rex_required_special, .-is_rex_required_special
	.globl	is_token_64bit
	.type	is_token_64bit, @function
is_token_64bit:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	subl	$600, %eax
	cmpl	$15, %eax
	ja	.L174
	movl	$1, %eax
	jmp	.L175
.L174:
	movl	$0, %eax
.L175:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	is_token_64bit, .-is_token_64bit
	.globl	is_token_32bit
	.type	is_token_32bit, @function
is_token_32bit:
.LFB19:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	subl	$620, %eax
	cmpl	$15, %eax
	ja	.L177
	movl	$1, %eax
	jmp	.L178
.L177:
	movl	$0, %eax
.L178:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	is_token_32bit, .-is_token_32bit
	.globl	is_token_16bit
	.type	is_token_16bit, @function
is_token_16bit:
.LFB20:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	subl	$640, %eax
	cmpl	$15, %eax
	ja	.L180
	movl	$1, %eax
	jmp	.L181
.L180:
	movl	$0, %eax
.L181:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	is_token_16bit, .-is_token_16bit
	.globl	is_token_8bit
	.type	is_token_8bit, @function
is_token_8bit:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	subl	$660, %eax
	cmpl	$15, %eax
	ja	.L183
	movl	$1, %eax
	jmp	.L184
.L183:
	movl	$0, %eax
.L184:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	is_token_8bit, .-is_token_8bit
	.globl	get_rm_reg_bits_from_reg
	.type	get_rm_reg_bits_from_reg, @function
get_rm_reg_bits_from_reg:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	subl	$600, %eax
	cmpl	$75, %eax
	ja	.L186
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L188(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L188(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L188:
	.long	.L251-.L188
	.long	.L250-.L188
	.long	.L249-.L188
	.long	.L248-.L188
	.long	.L247-.L188
	.long	.L246-.L188
	.long	.L245-.L188
	.long	.L244-.L188
	.long	.L243-.L188
	.long	.L242-.L188
	.long	.L241-.L188
	.long	.L240-.L188
	.long	.L239-.L188
	.long	.L238-.L188
	.long	.L237-.L188
	.long	.L236-.L188
	.long	.L186-.L188
	.long	.L186-.L188
	.long	.L186-.L188
	.long	.L186-.L188
	.long	.L235-.L188
	.long	.L234-.L188
	.long	.L233-.L188
	.long	.L232-.L188
	.long	.L231-.L188
	.long	.L230-.L188
	.long	.L229-.L188
	.long	.L228-.L188
	.long	.L227-.L188
	.long	.L226-.L188
	.long	.L225-.L188
	.long	.L224-.L188
	.long	.L223-.L188
	.long	.L222-.L188
	.long	.L221-.L188
	.long	.L220-.L188
	.long	.L186-.L188
	.long	.L186-.L188
	.long	.L186-.L188
	.long	.L186-.L188
	.long	.L219-.L188
	.long	.L218-.L188
	.long	.L217-.L188
	.long	.L216-.L188
	.long	.L215-.L188
	.long	.L214-.L188
	.long	.L213-.L188
	.long	.L212-.L188
	.long	.L211-.L188
	.long	.L210-.L188
	.long	.L209-.L188
	.long	.L208-.L188
	.long	.L207-.L188
	.long	.L206-.L188
	.long	.L205-.L188
	.long	.L204-.L188
	.long	.L186-.L188
	.long	.L186-.L188
	.long	.L186-.L188
	.long	.L186-.L188
	.long	.L203-.L188
	.long	.L202-.L188
	.long	.L201-.L188
	.long	.L200-.L188
	.long	.L199-.L188
	.long	.L198-.L188
	.long	.L197-.L188
	.long	.L196-.L188
	.long	.L195-.L188
	.long	.L194-.L188
	.long	.L193-.L188
	.long	.L192-.L188
	.long	.L191-.L188
	.long	.L190-.L188
	.long	.L189-.L188
	.long	.L187-.L188
	.text
.L251:
	movl	$0, %eax
	jmp	.L252
.L249:
	movl	$1, %eax
	jmp	.L252
.L248:
	movl	$2, %eax
	jmp	.L252
.L250:
	movl	$3, %eax
	jmp	.L252
.L244:
	movl	$4, %eax
	jmp	.L252
.L245:
	movl	$5, %eax
	jmp	.L252
.L247:
	movl	$6, %eax
	jmp	.L252
.L246:
	movl	$7, %eax
	jmp	.L252
.L243:
	movl	$0, %eax
	jmp	.L252
.L242:
	movl	$1, %eax
	jmp	.L252
.L241:
	movl	$2, %eax
	jmp	.L252
.L240:
	movl	$3, %eax
	jmp	.L252
.L239:
	movl	$4, %eax
	jmp	.L252
.L238:
	movl	$5, %eax
	jmp	.L252
.L237:
	movl	$6, %eax
	jmp	.L252
.L236:
	movl	$7, %eax
	jmp	.L252
.L235:
	movl	$0, %eax
	jmp	.L252
.L233:
	movl	$1, %eax
	jmp	.L252
.L232:
	movl	$2, %eax
	jmp	.L252
.L234:
	movl	$3, %eax
	jmp	.L252
.L228:
	movl	$4, %eax
	jmp	.L252
.L229:
	movl	$5, %eax
	jmp	.L252
.L231:
	movl	$6, %eax
	jmp	.L252
.L230:
	movl	$7, %eax
	jmp	.L252
.L227:
	movl	$0, %eax
	jmp	.L252
.L226:
	movl	$1, %eax
	jmp	.L252
.L225:
	movl	$2, %eax
	jmp	.L252
.L224:
	movl	$3, %eax
	jmp	.L252
.L223:
	movl	$4, %eax
	jmp	.L252
.L222:
	movl	$5, %eax
	jmp	.L252
.L221:
	movl	$6, %eax
	jmp	.L252
.L220:
	movl	$7, %eax
	jmp	.L252
.L219:
	movl	$0, %eax
	jmp	.L252
.L217:
	movl	$1, %eax
	jmp	.L252
.L216:
	movl	$2, %eax
	jmp	.L252
.L218:
	movl	$3, %eax
	jmp	.L252
.L212:
	movl	$4, %eax
	jmp	.L252
.L213:
	movl	$5, %eax
	jmp	.L252
.L215:
	movl	$6, %eax
	jmp	.L252
.L214:
	movl	$7, %eax
	jmp	.L252
.L211:
	movl	$0, %eax
	jmp	.L252
.L210:
	movl	$1, %eax
	jmp	.L252
.L209:
	movl	$2, %eax
	jmp	.L252
.L208:
	movl	$3, %eax
	jmp	.L252
.L207:
	movl	$4, %eax
	jmp	.L252
.L206:
	movl	$5, %eax
	jmp	.L252
.L205:
	movl	$6, %eax
	jmp	.L252
.L204:
	movl	$7, %eax
	jmp	.L252
.L203:
	movl	$0, %eax
	jmp	.L252
.L201:
	movl	$1, %eax
	jmp	.L252
.L200:
	movl	$2, %eax
	jmp	.L252
.L202:
	movl	$3, %eax
	jmp	.L252
.L196:
	movl	$4, %eax
	jmp	.L252
.L197:
	movl	$5, %eax
	jmp	.L252
.L199:
	movl	$6, %eax
	jmp	.L252
.L198:
	movl	$7, %eax
	jmp	.L252
.L195:
	movl	$0, %eax
	jmp	.L252
.L194:
	movl	$1, %eax
	jmp	.L252
.L193:
	movl	$2, %eax
	jmp	.L252
.L192:
	movl	$3, %eax
	jmp	.L252
.L191:
	movl	$4, %eax
	jmp	.L252
.L190:
	movl	$5, %eax
	jmp	.L252
.L189:
	movl	$6, %eax
	jmp	.L252
.L187:
	movl	$7, %eax
	jmp	.L252
.L186:
	movl	$-1, %eax
.L252:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	get_rm_reg_bits_from_reg, .-get_rm_reg_bits_from_reg
	.section	.rodata
.LC16:
	.string	"[ERROR] expected )\n"
	.text
	.globl	parse_mov_operand
	.type	parse_mov_operand, @function
parse_mov_operand:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	%r9, -48(%rbp)
	movq	-48(%rbp), %rax
	movb	$0, (%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$333, %eax
	jne	.L254
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-40(%rbp), %rax
	movb	$1, (%rax)
.L254:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$401, %eax
	jne	.L255
	movq	-32(%rbp), %rax
	movl	$8, (%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$334, %eax
	jne	.L256
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-16(%rbp), %rdx
	movq	%rcx, (%rdx)
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-16(%rbp), %rdx
	movq	%rcx, (%rdx)
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$335, %eax
	je	.L257
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L258
.L257:
	movl	$1, %eax
	jmp	.L258
.L256:
	movq	-48(%rbp), %rax
	movb	$1, (%rax)
	movl	$1, %eax
	jmp	.L258
.L255:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-16(%rbp), %rdx
	movq	%rcx, (%rdx)
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movl	$1, %eax
.L258:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	parse_mov_operand, .-parse_mov_operand
	.globl	add_rex_if_required
	.type	add_rex_if_required, @function
add_rex_if_required:
.LFB24:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$40, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movq	%rdx, -32(%rbp)
	movq	%rcx, -40(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	is_token_64bit
	testb	%al, %al
	je	.L260
	movl	-24(%rbp), %eax
	movl	%eax, %edi
	call	is_token_64bit
	testb	%al, %al
	jne	.L261
.L260:
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	is_extended_reg
	testb	%al, %al
	jne	.L261
	movl	-24(%rbp), %eax
	movl	%eax, %edi
	call	is_extended_reg
	testb	%al, %al
	jne	.L261
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	is_rex_required_special
	testb	%al, %al
	jne	.L261
	movl	-24(%rbp), %eax
	movl	%eax, %edi
	call	is_rex_required_special
	testb	%al, %al
	je	.L268
.L261:
	movb	$64, -2(%rbp)
	movb	$1, -1(%rbp)
	cmpb	$0, -1(%rbp)
	je	.L263
	orb	$8, -2(%rbp)
.L263:
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	is_extended_reg
	testb	%al, %al
	je	.L264
	orb	$4, -2(%rbp)
.L264:
	movl	-24(%rbp), %eax
	movl	%eax, %edi
	call	is_extended_reg
	testb	%al, %al
	je	.L265
	orb	$1, -2(%rbp)
.L265:
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	is_rex_required_special
	testb	%al, %al
	jne	.L267
	movl	-24(%rbp), %eax
	movl	%eax, %edi
	call	is_rex_required_special
	testb	%al, %al
.L267:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-40(%rbp), %rdx
	movq	%rcx, (%rdx)
	movq	-32(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-2(%rbp), %eax
	movb	%al, (%rdx)
.L268:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	add_rex_if_required, .-add_rex_if_required
	.section	.rodata
	.align 8
.LC17:
	.string	"[ERROR] mov failed: not enough operands\n"
	.align 8
.LC18:
	.string	"[ERROR] mov failed: not enough input strings, needed %ld got %ld\n"
	.align 8
.LC19:
	.string	"[ERROR] mov failed: both operands have a displacement\n"
	.align 8
.LC20:
	.string	"[ERROR] mov failed: not enough bytes!\n"
	.align 8
.LC21:
	.string	"[ERROR] mov failed: could not get reg or rm bits from register\n"
	.text
	.globl	opcode_mov
	.type	opcode_mov, @function
opcode_mov:
.LFB25:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -120(%rbp)
	movq	%rsi, -128(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-128(%rbp), %rax
	movq	80(%rax), %rax
	cmpq	$2, %rax
	ja	.L270
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$40, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L301
.L270:
	movq	$0, -40(%rbp)
	movq	$0, -64(%rbp)
	movl	$10, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movl	$-1, -104(%rbp)
	movl	$-1, -100(%rbp)
	movb	$0, -110(%rbp)
	movb	$0, -109(%rbp)
	movl	$0, -96(%rbp)
	movl	$0, -92(%rbp)
	movb	$0, -108(%rbp)
	movb	$0, -107(%rbp)
	movq	$1, -56(%rbp)
	movq	-128(%rbp), %rax
	leaq	-108(%rbp), %r8
	leaq	-110(%rbp), %rdi
	leaq	-96(%rbp), %rcx
	leaq	-104(%rbp), %rdx
	leaq	-56(%rbp), %rsi
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	parse_mov_operand
	movl	-96(%rbp), %eax
	cmpl	$8, %eax
	jne	.L272
	movq	-128(%rbp), %rax
	movq	168(%rax), %rax
	cmpq	%rax, -40(%rbp)
	jb	.L273
	movq	-128(%rbp), %rax
	movq	168(%rax), %rcx
	movq	stderr(%rip), %rax
	movq	-40(%rbp), %rdx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L301
.L273:
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	movq	-128(%rbp), %rdx
	addq	$10, %rax
	movq	8(%rdx,%rax,8), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$36, %al
	jne	.L274
	addq	$1, -32(%rbp)
.L274:
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -84(%rbp)
	movl	-84(%rbp), %eax
	movl	%eax, -96(%rbp)
.L272:
	movq	-128(%rbp), %rax
	leaq	-107(%rbp), %r8
	leaq	-109(%rbp), %rdi
	leaq	-92(%rbp), %rcx
	leaq	-100(%rbp), %rdx
	leaq	-56(%rbp), %rsi
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	parse_mov_operand
	movl	-92(%rbp), %eax
	cmpl	$8, %eax
	jne	.L275
	movq	-128(%rbp), %rax
	movq	168(%rax), %rax
	cmpq	%rax, -40(%rbp)
	jb	.L276
	movq	-128(%rbp), %rax
	movq	168(%rax), %rcx
	movq	stderr(%rip), %rax
	movq	-40(%rbp), %rdx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L301
.L276:
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	movq	-128(%rbp), %rdx
	addq	$10, %rax
	movq	8(%rdx,%rax,8), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$36, %al
	jne	.L277
	addq	$1, -24(%rbp)
.L277:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -80(%rbp)
	movl	-80(%rbp), %eax
	movl	%eax, -92(%rbp)
.L275:
	movzbl	-110(%rbp), %eax
	testb	%al, %al
	je	.L278
	movl	-96(%rbp), %eax
	negl	%eax
	jmp	.L279
.L278:
	movl	-96(%rbp), %eax
.L279:
	movl	%eax, -96(%rbp)
	movzbl	-109(%rbp), %eax
	testb	%al, %al
	je	.L280
	movl	-92(%rbp), %eax
	negl	%eax
	jmp	.L281
.L280:
	movl	-92(%rbp), %eax
.L281:
	movl	%eax, -92(%rbp)
	movl	-96(%rbp), %eax
	testl	%eax, %eax
	jle	.L282
	movl	-92(%rbp), %eax
	testl	%eax, %eax
	jle	.L282
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$54, %edx
	movl	$1, %esi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L301
.L282:
	movl	-92(%rbp), %eax
	testl	%eax, %eax
	je	.L283
	movl	-92(%rbp), %eax
	jmp	.L284
.L283:
	movl	-96(%rbp), %eax
.L284:
	movl	%eax, -76(%rbp)
	movzbl	-108(%rbp), %eax
	testb	%al, %al
	je	.L285
	movl	-100(%rbp), %eax
	movl	%eax, %edi
	call	get_rm_reg_bits_from_reg
	subl	$72, %eax
	movb	%al, -105(%rbp)
	movq	-64(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -64(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-105(%rbp), %eax
	movb	%al, (%rdx)
	movl	-100(%rbp), %eax
	movl	%eax, %edi
	call	is_token_64bit
	testb	%al, %al
	je	.L286
	movl	-76(%rbp), %eax
	cltq
	movq	%rax, -48(%rbp)
	movq	-64(%rbp), %rax
	addq	$8, %rax
	cmpq	$10, %rax
	jbe	.L287
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L301
.L287:
	movq	-64(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-120(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	add_new_inst
	movl	$1, %eax
	jmp	.L301
.L286:
	movq	-64(%rbp), %rax
	addq	$4, %rax
	cmpq	$10, %rax
	jbe	.L290
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L301
.L290:
	movl	-76(%rbp), %eax
	movl	%eax, -48(%rbp)
	movq	-64(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movl	-48(%rbp), %eax
	movl	%eax, (%rdx)
	movq	-64(%rbp), %rax
	addq	$4, %rax
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-120(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	add_new_inst
	movl	$1, %eax
	jmp	.L301
.L285:
	cmpl	$0, -76(%rbp)
	jne	.L291
	movl	$3, -88(%rbp)
	jmp	.L292
.L291:
	cmpl	$-128, -76(%rbp)
	jl	.L293
	cmpl	$127, -76(%rbp)
	jg	.L293
	movl	$1, -88(%rbp)
	jmp	.L292
.L293:
	movl	$2, -88(%rbp)
.L292:
	movl	-104(%rbp), %eax
	movl	%eax, %edi
	call	get_rm_reg_bits_from_reg
	movl	%eax, -72(%rbp)
	movl	-100(%rbp), %eax
	movl	%eax, %edi
	call	get_rm_reg_bits_from_reg
	movl	%eax, -68(%rbp)
	cmpl	$0, -72(%rbp)
	js	.L294
	cmpl	$0, -68(%rbp)
	jns	.L295
.L294:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$63, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L301
.L295:
	movl	-100(%rbp), %esi
	movl	-104(%rbp), %eax
	leaq	-64(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movl	%eax, %edi
	call	add_rex_if_required
	movl	-96(%rbp), %eax
	testl	%eax, %eax
	je	.L296
	movq	-64(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -64(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$-117, (%rax)
	jmp	.L297
.L296:
	movq	-64(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -64(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$-119, (%rax)
.L297:
	movb	$0, -106(%rbp)
	movl	-96(%rbp), %eax
	testl	%eax, %eax
	je	.L298
	movl	-88(%rbp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movl	-68(%rbp), %eax
	sall	$3, %eax
	andl	$56, %eax
	orl	%eax, %edx
	movl	-72(%rbp), %eax
	andl	$7, %eax
	orl	%edx, %eax
	movb	%al, -106(%rbp)
	jmp	.L299
.L298:
	movl	-88(%rbp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movl	-72(%rbp), %eax
	sall	$3, %eax
	andl	$56, %eax
	orl	%eax, %edx
	movl	-68(%rbp), %eax
	andl	$7, %eax
	orl	%edx, %eax
	movb	%al, -106(%rbp)
.L299:
	movq	-64(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -64(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-106(%rbp), %eax
	movb	%al, (%rdx)
	cmpl	$0, -76(%rbp)
	je	.L300
	movq	-64(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -64(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rdx, %rax
	movl	-76(%rbp), %edx
	movb	%dl, (%rax)
.L300:
	movq	-64(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-120(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	add_new_inst
	movl	$1, %eax
.L301:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L302
	call	__stack_chk_fail@PLT
.L302:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	opcode_mov, .-opcode_mov
	.globl	opcode_sub
	.type	opcode_sub, @function
opcode_sub:
.LFB26:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -120(%rbp)
	movq	%rsi, -128(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-128(%rbp), %rax
	movq	80(%rax), %rax
	cmpq	$2, %rax
	ja	.L304
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$40, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L325
.L304:
	movq	$0, -48(%rbp)
	movl	$-1, -92(%rbp)
	movl	$-1, -88(%rbp)
	movb	$0, -101(%rbp)
	movb	$0, -100(%rbp)
	movl	$0, -84(%rbp)
	movl	$0, -80(%rbp)
	movb	$0, -99(%rbp)
	movb	$0, -98(%rbp)
	movq	$1, -64(%rbp)
	movq	-128(%rbp), %rax
	leaq	-99(%rbp), %r8
	leaq	-101(%rbp), %rdi
	leaq	-84(%rbp), %rcx
	leaq	-92(%rbp), %rdx
	leaq	-64(%rbp), %rsi
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	parse_mov_operand
	movl	-84(%rbp), %eax
	cmpl	$8, %eax
	jne	.L306
	movq	-128(%rbp), %rax
	movq	168(%rax), %rax
	cmpq	%rax, -48(%rbp)
	jb	.L307
	movq	-128(%rbp), %rax
	movq	168(%rax), %rcx
	movq	stderr(%rip), %rax
	movq	-48(%rbp), %rdx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L325
.L307:
	movq	-48(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -48(%rbp)
	movq	-128(%rbp), %rdx
	addq	$10, %rax
	movq	8(%rdx,%rax,8), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$36, %al
	jne	.L308
	addq	$1, -40(%rbp)
.L308:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -76(%rbp)
	movl	-76(%rbp), %eax
	movl	%eax, -84(%rbp)
.L306:
	movq	-128(%rbp), %rax
	leaq	-98(%rbp), %r8
	leaq	-100(%rbp), %rdi
	leaq	-80(%rbp), %rcx
	leaq	-88(%rbp), %rdx
	leaq	-64(%rbp), %rsi
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	parse_mov_operand
	movl	-80(%rbp), %eax
	cmpl	$8, %eax
	jne	.L309
	movq	-128(%rbp), %rax
	movq	168(%rax), %rax
	cmpq	%rax, -48(%rbp)
	jb	.L310
	movq	-128(%rbp), %rax
	movq	168(%rax), %rcx
	movq	stderr(%rip), %rax
	movq	-48(%rbp), %rdx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L325
.L310:
	movq	-48(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -48(%rbp)
	movq	-128(%rbp), %rdx
	addq	$10, %rax
	movq	8(%rdx,%rax,8), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$36, %al
	jne	.L311
	addq	$1, -32(%rbp)
.L311:
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -72(%rbp)
	movl	-72(%rbp), %eax
	movl	%eax, -80(%rbp)
.L309:
	movzbl	-101(%rbp), %eax
	testb	%al, %al
	je	.L312
	movl	-84(%rbp), %eax
	negl	%eax
	jmp	.L313
.L312:
	movl	-84(%rbp), %eax
.L313:
	movl	%eax, -84(%rbp)
	movzbl	-100(%rbp), %eax
	testb	%al, %al
	je	.L314
	movl	-80(%rbp), %eax
	negl	%eax
	jmp	.L315
.L314:
	movl	-80(%rbp), %eax
.L315:
	movl	%eax, -80(%rbp)
	movl	-80(%rbp), %eax
	testl	%eax, %eax
	je	.L316
	movl	-80(%rbp), %eax
	jmp	.L317
.L316:
	movl	-84(%rbp), %eax
.L317:
	movl	%eax, -68(%rbp)
	movl	$12, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movq	$0, -24(%rbp)
	movzbl	-99(%rbp), %eax
	testb	%al, %al
	je	.L318
	movb	$-127, -97(%rbp)
	movl	-88(%rbp), %eax
	movl	%eax, %edi
	call	get_rm_reg_bits_from_reg
	orl	$-24, %eax
	movb	%al, -96(%rbp)
	movl	-88(%rbp), %eax
	movl	%eax, %edi
	call	is_token_64bit
	testb	%al, %al
	je	.L319
	movb	$72, -94(%rbp)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-94(%rbp), %eax
	movb	%al, (%rdx)
	movl	-68(%rbp), %eax
	cltq
	movq	%rax, -56(%rbp)
	cmpl	$128, -68(%rbp)
	jg	.L320
	cmpl	$0, -68(%rbp)
	js	.L320
	movl	-68(%rbp), %eax
	movb	%al, -93(%rbp)
	movb	$-125, -97(%rbp)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-97(%rbp), %eax
	movb	%al, (%rdx)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-96(%rbp), %eax
	movb	%al, (%rdx)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-93(%rbp), %eax
	movb	%al, (%rdx)
	jmp	.L322
.L320:
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-97(%rbp), %eax
	movb	%al, (%rdx)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-96(%rbp), %eax
	movb	%al, (%rdx)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rax, (%rdx)
	addq	$8, -24(%rbp)
	jmp	.L322
.L319:
	movl	-88(%rbp), %eax
	movl	%eax, %edi
	call	is_token_32bit
	testb	%al, %al
	je	.L323
	movl	-68(%rbp), %eax
	movl	%eax, -56(%rbp)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-97(%rbp), %eax
	movb	%al, (%rdx)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-96(%rbp), %eax
	movb	%al, (%rdx)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-56(%rbp), %eax
	movl	%eax, (%rdx)
	addq	$4, -24(%rbp)
	jmp	.L322
.L323:
	movl	-88(%rbp), %eax
	movl	%eax, %edi
	call	is_token_16bit
	testb	%al, %al
	je	.L324
	movl	-68(%rbp), %eax
	movw	%ax, -56(%rbp)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-97(%rbp), %eax
	movb	%al, (%rdx)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-96(%rbp), %eax
	movb	%al, (%rdx)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movzwl	-56(%rbp), %eax
	movw	%ax, (%rdx)
	addq	$2, -24(%rbp)
	jmp	.L322
.L324:
	movl	-68(%rbp), %eax
	movb	%al, -95(%rbp)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-97(%rbp), %eax
	movb	%al, (%rdx)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-96(%rbp), %eax
	movb	%al, (%rdx)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-95(%rbp), %eax
	movb	%al, (%rdx)
.L322:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-120(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	add_new_inst
.L318:
	movl	$1, %eax
.L325:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L326
	call	__stack_chk_fail@PLT
.L326:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	opcode_sub, .-opcode_sub
	.globl	opcode_cmp
	.type	opcode_cmp, @function
opcode_cmp:
.LFB27:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$136, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -136(%rbp)
	movq	%rsi, -144(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	-144(%rbp), %rax
	movq	80(%rax), %rax
	cmpq	$2, %rax
	ja	.L328
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$40, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L349
.L328:
	movq	$0, -56(%rbp)
	movl	$-1, -108(%rbp)
	movl	$-1, -104(%rbp)
	movb	$0, -118(%rbp)
	movb	$0, -117(%rbp)
	movl	$0, -100(%rbp)
	movl	$0, -96(%rbp)
	movb	$0, -116(%rbp)
	movb	$0, -115(%rbp)
	movq	$1, -80(%rbp)
	movq	-144(%rbp), %rax
	leaq	-116(%rbp), %r8
	leaq	-118(%rbp), %rdi
	leaq	-100(%rbp), %rcx
	leaq	-108(%rbp), %rdx
	leaq	-80(%rbp), %rsi
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	parse_mov_operand
	movl	-100(%rbp), %eax
	cmpl	$8, %eax
	jne	.L330
	movq	-144(%rbp), %rax
	movq	168(%rax), %rax
	cmpq	%rax, -56(%rbp)
	jb	.L331
	movq	-144(%rbp), %rax
	movq	168(%rax), %rcx
	movq	stderr(%rip), %rax
	movq	-56(%rbp), %rdx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L349
.L331:
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -56(%rbp)
	movq	-144(%rbp), %rdx
	addq	$10, %rax
	movq	8(%rdx,%rax,8), %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$36, %al
	jne	.L332
	addq	$1, -48(%rbp)
.L332:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -92(%rbp)
	movl	-92(%rbp), %eax
	movl	%eax, -100(%rbp)
.L330:
	movq	-144(%rbp), %rax
	leaq	-115(%rbp), %r8
	leaq	-117(%rbp), %rdi
	leaq	-96(%rbp), %rcx
	leaq	-104(%rbp), %rdx
	leaq	-80(%rbp), %rsi
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	parse_mov_operand
	movl	-96(%rbp), %eax
	cmpl	$8, %eax
	jne	.L333
	movq	-144(%rbp), %rax
	movq	168(%rax), %rax
	cmpq	%rax, -56(%rbp)
	jb	.L334
	movq	-144(%rbp), %rax
	movq	168(%rax), %rcx
	movq	stderr(%rip), %rax
	movq	-56(%rbp), %rdx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L349
.L334:
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -56(%rbp)
	movq	-144(%rbp), %rdx
	addq	$10, %rax
	movq	8(%rdx,%rax,8), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$36, %al
	jne	.L335
	addq	$1, -40(%rbp)
.L335:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -88(%rbp)
	movl	-88(%rbp), %eax
	movl	%eax, -96(%rbp)
.L333:
	movzbl	-118(%rbp), %eax
	testb	%al, %al
	je	.L336
	movl	-100(%rbp), %eax
	negl	%eax
	jmp	.L337
.L336:
	movl	-100(%rbp), %eax
.L337:
	movl	%eax, -100(%rbp)
	movzbl	-117(%rbp), %eax
	testb	%al, %al
	je	.L338
	movl	-96(%rbp), %eax
	negl	%eax
	jmp	.L339
.L338:
	movl	-96(%rbp), %eax
.L339:
	movl	%eax, -96(%rbp)
	movl	-96(%rbp), %eax
	testl	%eax, %eax
	je	.L340
	movl	-96(%rbp), %eax
	jmp	.L341
.L340:
	movl	-100(%rbp), %eax
.L341:
	movl	%eax, -84(%rbp)
	movl	$12, %edi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	movq	$0, -72(%rbp)
	movzbl	-116(%rbp), %eax
	testb	%al, %al
	je	.L342
	movb	$-127, -112(%rbp)
	movl	-104(%rbp), %eax
	movl	%eax, %edi
	call	get_rm_reg_bits_from_reg
	orl	$120, %eax
	movb	%al, -111(%rbp)
	movl	-104(%rbp), %eax
	movl	%eax, %edi
	call	is_token_64bit
	testb	%al, %al
	je	.L343
	movl	-84(%rbp), %eax
	cltq
	movq	%rax, -64(%rbp)
	cmpl	$-127, -84(%rbp)
	jl	.L344
	cmpl	$128, -84(%rbp)
	jg	.L344
	movl	-84(%rbp), %eax
	movb	%al, -109(%rbp)
	movb	$-128, -112(%rbp)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-112(%rbp), %eax
	movb	%al, (%rdx)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-111(%rbp), %eax
	movb	%al, (%rdx)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-109(%rbp), %eax
	movb	%al, (%rdx)
	jmp	.L346
.L344:
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-112(%rbp), %eax
	movb	%al, (%rdx)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-111(%rbp), %eax
	movb	%al, (%rdx)
	movq	-72(%rbp), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-72(%rbp), %rax
	addq	$8, %rax
	movq	%rax, -72(%rbp)
	jmp	.L346
.L343:
	movl	-104(%rbp), %eax
	movl	%eax, %edi
	call	is_token_32bit
	testb	%al, %al
	je	.L347
	movl	-84(%rbp), %eax
	movl	%eax, -64(%rbp)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-112(%rbp), %eax
	movb	%al, (%rdx)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-111(%rbp), %eax
	movb	%al, (%rdx)
	movq	-72(%rbp), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movl	-64(%rbp), %eax
	movl	%eax, (%rdx)
	movq	-72(%rbp), %rax
	addq	$4, %rax
	movq	%rax, -72(%rbp)
	jmp	.L346
.L347:
	movl	-104(%rbp), %eax
	movl	%eax, %edi
	call	is_token_16bit
	testb	%al, %al
	je	.L348
	movl	-84(%rbp), %eax
	movw	%ax, -64(%rbp)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-112(%rbp), %eax
	movb	%al, (%rdx)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-111(%rbp), %eax
	movb	%al, (%rdx)
	movq	-72(%rbp), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movzwl	-64(%rbp), %eax
	movw	%ax, (%rdx)
	movq	-72(%rbp), %rax
	addq	$2, %rax
	movq	%rax, -72(%rbp)
	jmp	.L346
.L348:
	movl	-84(%rbp), %eax
	movb	%al, -110(%rbp)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-112(%rbp), %eax
	movb	%al, (%rdx)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-111(%rbp), %eax
	movb	%al, (%rdx)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-110(%rbp), %eax
	movb	%al, (%rdx)
.L346:
	movl	-100(%rbp), %ecx
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	movq	-72(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-136(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	add_new_inst
	movl	$1, %eax
	jmp	.L349
.L342:
	movl	-104(%rbp), %esi
	movl	-108(%rbp), %eax
	leaq	-72(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movl	%eax, %edi
	call	add_rex_if_required
	movb	$59, -114(%rbp)
	movl	-108(%rbp), %eax
	movl	%eax, %edi
	call	get_rm_reg_bits_from_reg
	sall	$3, %eax
	andl	$56, %eax
	orl	$-64, %eax
	movl	%eax, %ebx
	movl	-104(%rbp), %eax
	movl	%eax, %edi
	call	get_rm_reg_bits_from_reg
	orl	%ebx, %eax
	movb	%al, -113(%rbp)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-114(%rbp), %eax
	movb	%al, (%rdx)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-113(%rbp), %eax
	movb	%al, (%rdx)
	movq	-72(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-136(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	add_new_inst
	movl	$1, %eax
.L349:
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L350
	call	__stack_chk_fail@PLT
.L350:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	opcode_cmp, .-opcode_cmp
	.globl	handle_plt_call
	.type	handle_plt_call, @function
handle_plt_call:
.LFB28:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	%rcx, -80(%rbp)
	pxor	%xmm0, %xmm0
	movaps	%xmm0, -32(%rbp)
	movaps	%xmm0, -16(%rbp)
	movb	$1, -6(%rbp)
	movq	$0, -16(%rbp)
	movw	$0, -8(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -32(%rbp)
	movb	$0, -5(%rbp)
	movb	$0, -4(%rbp)
	movq	-56(%rbp), %rax
	movq	1104(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-56(%rbp), %rdx
	movq	%rcx, 1104(%rdx)
	movq	-56(%rbp), %rdx
	salq	$5, %rax
	addq	%rdx, %rax
	leaq	272(%rax), %rcx
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, (%rcx)
	movq	%rdx, 8(%rcx)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rax, 16(%rcx)
	movq	%rdx, 24(%rcx)
	movl	$32, %edi
	call	malloc@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$32, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-56(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	leaq	-4(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-40(%rbp), %rax
	movq	$-4, (%rax)
	movq	-40(%rbp), %rax
	movl	$3, 16(%rax)
	movq	-40(%rbp), %rcx
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rsi
	movq	-56(%rbp), %rax
	movl	$0, %r9d
	movq	%rcx, %r8
	movl	$0, %ecx
	movq	%rax, %rdi
	call	add_new_inst
	movl	$1, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	handle_plt_call, .-handle_plt_call
	.section	.rodata
	.align 8
.LC22:
	.string	"[ERROR] call failed: function name required\n"
	.align 8
.LC23:
	.string	"[ERROR] call failed: got unexpected operand tokens\n"
	.align 8
.LC24:
	.string	"[ERROR] At least 2 operands required for call\n"
	.text
	.globl	opcode_call
	.type	opcode_call, @function
opcode_call:
.LFB29:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	$5, %edi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	movq	$0, -40(%rbp)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rdx
	addq	%rdx, %rax
	movb	$-24, (%rax)
	movq	$0, -32(%rbp)
	jmp	.L354
.L355:
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addq	$1, -32(%rbp)
.L354:
	cmpq	$3, -32(%rbp)
	jbe	.L355
	movq	-64(%rbp), %rax
	movq	168(%rax), %rax
	testq	%rax, %rax
	jne	.L356
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$44, %edx
	movl	$1, %esi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L357
.L356:
	movq	-64(%rbp), %rax
	movq	88(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-64(%rbp), %rax
	movq	80(%rax), %rax
	cmpq	$3, %rax
	jne	.L358
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$232, %eax
	jne	.L359
	movq	-64(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	$402, %eax
	jne	.L359
	movq	-64(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$408, %eax
	je	.L360
.L359:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$51, %edx
	movl	$1, %esi
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L357
.L360:
	movq	-40(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	handle_plt_call
	jmp	.L357
.L358:
	movq	-64(%rbp), %rax
	movq	80(%rax), %rax
	cmpq	$1, %rax
	ja	.L361
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$46, %edx
	movl	$1, %esi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L357
.L361:
	movl	$32, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$32, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-56(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	leaq	-4(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-8(%rbp), %rax
	movq	$-4, (%rax)
	movq	-8(%rbp), %rax
	movl	$3, 16(%rax)
	movq	-8(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-56(%rbp), %rax
	movl	$0, %r9d
	movq	%rcx, %r8
	movl	$0, %ecx
	movq	%rax, %rdi
	call	add_new_inst
	movl	$1, %eax
.L357:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	opcode_call, .-opcode_call
	.section	.rodata
	.align 8
.LC25:
	.string	"[ERROR] pop requires two operands\n"
	.text
	.globl	opcode_pop
	.type	opcode_pop, @function
opcode_pop:
.LFB30:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	80(%rax), %rax
	cmpq	$1, %rax
	ja	.L363
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$34, %edx
	movl	$1, %esi
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L364
.L363:
	movq	-48(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	get_rm_reg_bits_from_reg
	addl	$88, %eax
	movb	%al, -17(%rbp)
	movl	$1, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movq	$0, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-17(%rbp), %eax
	movb	%al, (%rdx)
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-40(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	add_new_inst
	movl	$1, %eax
.L364:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	opcode_pop, .-opcode_pop
	.section	.rodata
	.align 8
.LC26:
	.string	"[ERROR] lea failed: not enough operands\n"
	.align 8
.LC27:
	.string	"[ERROR] lea failed: rodata label required\n"
	.align 8
.LC28:
	.string	"[ERROR] lea failed: expected rodata reference in operand 1\n"
.LC29:
	.string	"[ERROR] expected (\n"
	.align 8
.LC30:
	.string	"[ERROR] lea failed: cannot get index of constant %s\n"
	.align 8
.LC31:
	.string	"[ERROR] lea failed: constant index %ld does not existn\n"
.LC32:
	.string	".rodata"
	.text
	.globl	opcode_lea
	.type	opcode_lea, @function
opcode_lea:
.LFB31:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	-112(%rbp), %rax
	movq	80(%rax), %rax
	cmpq	$2, %rax
	ja	.L366
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$40, %edx
	movl	$1, %esi
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L367
.L366:
	movq	-112(%rbp), %rax
	movq	168(%rax), %rax
	testq	%rax, %rax
	jne	.L368
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$42, %edx
	movl	$1, %esi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L367
.L368:
	movl	$-1, -80(%rbp)
	movl	$-1, -76(%rbp)
	movq	-112(%rbp), %rax
	movq	88(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	$1, -40(%rbp)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	movq	-112(%rbp), %rdx
	movl	(%rdx,%rax,4), %eax
	cmpl	$336, %eax
	je	.L369
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$59, %edx
	movl	$1, %esi
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L367
.L369:
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	movq	-112(%rbp), %rdx
	movl	(%rdx,%rax,4), %eax
	cmpl	$334, %eax
	je	.L370
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L367
.L370:
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	movq	-112(%rbp), %rdx
	movl	(%rdx,%rax,4), %eax
	movl	%eax, -80(%rbp)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	movq	-112(%rbp), %rdx
	movl	(%rdx,%rax,4), %eax
	cmpl	$335, %eax
	je	.L371
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L367
.L371:
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	movq	-112(%rbp), %rdx
	movl	(%rdx,%rax,4), %eax
	movl	%eax, -76(%rbp)
	movl	$7, %edi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	movq	$0, -72(%rbp)
	movl	-76(%rbp), %eax
	movl	%eax, %edi
	call	is_token_64bit
	testb	%al, %al
	jne	.L372
	movl	-80(%rbp), %eax
	movl	%eax, %edi
	call	is_token_64bit
	testb	%al, %al
	je	.L373
.L372:
	movb	$72, -83(%rbp)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-83(%rbp), %eax
	movb	%al, (%rdx)
.L373:
	movb	$-115, -82(%rbp)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-82(%rbp), %eax
	movb	%al, (%rdx)
	movl	-76(%rbp), %eax
	movl	%eax, %edi
	call	get_rm_reg_bits_from_reg
	sall	$3, %eax
	orl	$5, %eax
	movb	%al, -81(%rbp)
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-81(%rbp), %eax
	movb	%al, (%rdx)
	addq	$3, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	cltq
	movq	%rax, -24(%rbp)
	cmpq	$1024, -24(%rbp)
	jbe	.L374
	movq	stderr(%rip), %rax
	movq	-48(%rbp), %rdx
	leaq	.LC30(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L367
.L374:
	movq	-104(%rbp), %rax
	movq	96(%rax), %rax
	cmpq	%rax, -24(%rbp)
	jb	.L375
	movq	stderr(%rip), %rax
	movq	-24(%rbp), %rdx
	leaq	.LC31(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L367
.L375:
	movq	$0, -64(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L376
	movq	-24(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-104(%rbp), %rax
	addq	$2, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -64(%rbp)
	jmp	.L377
.L376:
	movq	$0, -64(%rbp)
.L377:
	subq	$4, -64(%rbp)
	movq	-104(%rbp), %rax
	movq	8(%rax), %rax
	addq	$3, %rax
	movq	%rax, -16(%rbp)
	movl	$32, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$32, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, (%rax)
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-8(%rbp), %rax
	movl	$1, 16(%rax)
	movq	$0, -56(%rbp)
	jmp	.L378
.L379:
	movq	-72(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -72(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	addq	$1, -56(%rbp)
.L378:
	cmpq	$3, -56(%rbp)
	jbe	.L379
	movq	-8(%rbp), %rcx
	movq	-72(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-104(%rbp), %rax
	movl	$0, %r9d
	movq	%rcx, %r8
	movl	$1, %ecx
	movq	%rax, %rdi
	call	add_new_inst
	movl	$1, %eax
.L367:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	opcode_lea, .-opcode_lea
	.section	.rodata
	.align 8
.LC33:
	.string	"[ERROR] jmp expected text label reference\n"
	.align 8
.LC34:
	.string	"[ERROR] jmp requires label str\n"
	.text
	.globl	opcode_jmp
	.type	opcode_jmp, @function
opcode_jmp:
.LFB32:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	$338, %eax
	je	.L381
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$42, %edx
	movl	$1, %esi
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L382
.L381:
	movq	-48(%rbp), %rax
	movq	168(%rax), %rax
	testq	%rax, %rax
	jne	.L383
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L382
.L383:
	movl	$6, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movq	$0, -24(%rbp)
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$233, %eax
	jne	.L384
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$-21, (%rax)
	jmp	.L385
.L384:
	movq	-48(%rbp), %rax
	movl	(%rax), %ecx
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
.L385:
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-48(%rbp), %rax
	movq	88(%rax), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-40(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movl	$2, %ecx
	movq	%rax, %rdi
	call	add_new_inst
	movl	$1, %eax
.L382:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	opcode_jmp, .-opcode_jmp
	.section	.rodata
	.align 8
.LC35:
	.string	"[ERROR] mul requires 2 operands\n"
	.align 8
.LC36:
	.string	"[ERROR] mul requires label str\n"
.LC37:
	.string	"test"
.LC38:
	.string	"not"
.LC39:
	.string	"neg"
.LC40:
	.string	"mul"
.LC41:
	.string	"imul"
.LC42:
	.string	"div"
.LC43:
	.string	"idiv"
.LC44:
	.string	"[DEBUG] RM DISP: %d\n"
	.text
	.globl	opcode_mul
	.type	opcode_mul, @function
opcode_mul:
.LFB33:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-80(%rbp), %rax
	movq	80(%rax), %rax
	cmpq	$1, %rax
	ja	.L387
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$32, %edx
	movl	$1, %esi
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L407
.L387:
	movq	-80(%rbp), %rax
	movq	168(%rax), %rax
	testq	%rax, %rax
	jne	.L389
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$31, %edx
	movl	$1, %esi
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L407
.L389:
	movl	$10, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movq	$0, -32(%rbp)
	movq	-80(%rbp), %rax
	movl	(%rax), %ecx
	movq	-32(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -32(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	movq	$1, -40(%rbp)
	movl	$0, -56(%rbp)
	movl	$0, -52(%rbp)
	movb	$0, -62(%rbp)
	movb	$0, -61(%rbp)
	movq	-80(%rbp), %rax
	leaq	-61(%rbp), %r8
	leaq	-62(%rbp), %rdi
	leaq	-52(%rbp), %rcx
	leaq	-56(%rbp), %rdx
	leaq	-40(%rbp), %rsi
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	parse_mov_operand
	movl	-52(%rbp), %eax
	cmpl	$8, %eax
	jne	.L390
	movq	-80(%rbp), %rax
	movq	96(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$36, %al
	jne	.L391
	addq	$1, -24(%rbp)
.L391:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -44(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, -52(%rbp)
.L390:
	movzbl	-62(%rbp), %eax
	testb	%al, %al
	je	.L392
	movl	-52(%rbp), %eax
	negl	%eax
	jmp	.L393
.L392:
	movl	-52(%rbp), %eax
.L393:
	movl	%eax, -52(%rbp)
	movb	$0, -58(%rbp)
	movb	$0, -60(%rbp)
	movb	$0, -59(%rbp)
	movl	-56(%rbp), %eax
	movl	%eax, %edi
	call	get_rm_reg_bits_from_reg
	movb	%al, -57(%rbp)
	movl	-52(%rbp), %eax
	testl	%eax, %eax
	jne	.L394
	movb	$3, -60(%rbp)
	jmp	.L395
.L394:
	movl	-52(%rbp), %eax
	cmpl	$-127, %eax
	jl	.L396
	movl	-52(%rbp), %eax
	cmpl	$128, %eax
	jg	.L396
	movb	$1, -60(%rbp)
	jmp	.L395
.L396:
	movb	$2, -60(%rbp)
.L395:
	movq	-80(%rbp), %rax
	movq	88(%rax), %rax
	movl	$4, %edx
	leaq	.LC37(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcmp@PLT
	testl	%eax, %eax
	jne	.L397
	movb	$0, -59(%rbp)
	jmp	.L398
.L397:
	movq	-80(%rbp), %rax
	movq	88(%rax), %rax
	movl	$3, %edx
	leaq	.LC38(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcmp@PLT
	testl	%eax, %eax
	jne	.L399
	movb	$2, -59(%rbp)
	jmp	.L398
.L399:
	movq	-80(%rbp), %rax
	movq	88(%rax), %rax
	movl	$3, %edx
	leaq	.LC39(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcmp@PLT
	testl	%eax, %eax
	jne	.L400
	movb	$3, -59(%rbp)
	jmp	.L398
.L400:
	movq	-80(%rbp), %rax
	movq	88(%rax), %rax
	movl	$3, %edx
	leaq	.LC40(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcmp@PLT
	testl	%eax, %eax
	jne	.L401
	movb	$4, -59(%rbp)
	jmp	.L398
.L401:
	movq	-80(%rbp), %rax
	movq	88(%rax), %rax
	movl	$4, %edx
	leaq	.LC41(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcmp@PLT
	testl	%eax, %eax
	jne	.L402
	movb	$5, -59(%rbp)
	jmp	.L398
.L402:
	movq	-80(%rbp), %rax
	movq	88(%rax), %rax
	movl	$3, %edx
	leaq	.LC42(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcmp@PLT
	testl	%eax, %eax
	jne	.L403
	movb	$6, -59(%rbp)
	jmp	.L398
.L403:
	movq	-80(%rbp), %rax
	movq	88(%rax), %rax
	movl	$4, %edx
	leaq	.LC43(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcmp@PLT
	testl	%eax, %eax
	jne	.L398
	movb	$7, -59(%rbp)
.L398:
	movzbl	-60(%rbp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movzbl	-59(%rbp), %eax
	sall	$3, %eax
	orl	%eax, %edx
	movzbl	-57(%rbp), %eax
	orl	%edx, %eax
	movb	%al, -58(%rbp)
	movq	-32(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -32(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rax, %rdx
	movzbl	-58(%rbp), %eax
	movb	%al, (%rdx)
	movl	-52(%rbp), %eax
	testl	%eax, %eax
	je	.L404
	movl	log_level(%rip), %eax
	cmpl	$2, %eax
	jbe	.L405
	movl	-52(%rbp), %edx
	movq	stderr(%rip), %rax
	leaq	.LC44(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L405:
	cmpb	$1, -60(%rbp)
	jne	.L406
	movl	-52(%rbp), %ecx
	movq	-32(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -32(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	jmp	.L404
.L406:
	movl	-52(%rbp), %eax
	movl	%eax, -48(%rbp)
	movq	-16(%rbp), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movl	-48(%rbp), %eax
	movl	%eax, (%rdx)
	addq	$4, -32(%rbp)
.L404:
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-72(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	add_new_inst
	movl	$1, %eax
.L407:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L408
	call	__stack_chk_fail@PLT
.L408:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	opcode_mul, .-opcode_mul
	.ident	"GCC: (GNU) 14.2.1 20250207"
	.section	.note.GNU-stack,"",@progbits
