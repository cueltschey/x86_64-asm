	.file	"elf.c"
	.text
	.globl	buffer_init
	.type	buffer_init, @function
buffer_init:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	buffer_init, .-buffer_init
	.globl	buffer_destroy
	.type	buffer_destroy, @function
buffer_destroy:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	buffer_init
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	buffer_destroy, .-buffer_destroy
	.globl	buffer_append
	.type	buffer_append, @function
buffer_append:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	buffer_ensure_capacity
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	leaq	(%rdx,%rax), %rcx
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy@PLT
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	buffer_append, .-buffer_append
	.section	.rodata
.LC0:
	.string	"realloc failed for buffer"
	.text
	.globl	buffer_ensure_capacity
	.type	buffer_ensure_capacity, @function
buffer_ensure_capacity:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rdx, %rax
	jnb	.L11
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L6
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	addq	%rax, %rax
	jmp	.L7
.L6:
	movl	$1024, %eax
.L7:
	movq	%rax, -16(%rbp)
	jmp	.L8
.L9:
	salq	-16(%rbp)
.L8:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	cmpq	%rax, -16(%rbp)
	jb	.L9
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L10
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L10:
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 16(%rax)
.L11:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	buffer_ensure_capacity, .-buffer_ensure_capacity
	.section	.rodata
	.align 8
.LC1:
	.string	"[ERROR] Error: find_symbol called with NULL name\n"
	.text
	.globl	find_symbol
	.type	find_symbol, @function
find_symbol:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L13
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$49, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L14
.L13:
	movq	$0, -16(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L15
.L18:
	movq	-8(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	leaq	1232(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	leaq	8(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L16
	movq	-8(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	leaq	1232(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	addq	$8, %rax
	movq	%rax, -16(%rbp)
	jmp	.L17
.L16:
	addq	$1, -8(%rbp)
.L15:
	movq	-24(%rbp), %rax
	movq	25816(%rax), %rax
	cmpq	%rax, -8(%rbp)
	jb	.L18
.L17:
	movq	-16(%rbp), %rax
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	find_symbol, .-find_symbol
	.section	.rodata
.LC2:
	.string	"Symbol '%s' redefined"
	.align 8
.LC3:
	.string	"[ERROR] Maximum number of symbols reached\n"
	.text
	.globl	add_symbol
	.type	add_symbol, @function
add_symbol:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$224, %rsp
	movq	%rdi, -184(%rbp)
	movq	%rsi, -192(%rbp)
	movl	%edx, %eax
	movq	%rcx, -208(%rbp)
	movl	%r8d, %ecx
	movl	%r9d, %edx
	movw	%ax, -196(%rbp)
	movl	%ecx, %eax
	movb	%al, -200(%rbp)
	movl	%edx, %eax
	movb	%al, -212(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -160(%rbp)
	jmp	.L20
.L28:
	movq	-160(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	leaq	1232(%rax), %rdx
	movq	-184(%rbp), %rax
	addq	%rdx, %rax
	leaq	8(%rax), %rdx
	movq	-192(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L21
	movq	-184(%rbp), %rcx
	movq	-160(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	addq	%rcx, %rax
	addq	$1332, %rax
	movzbl	(%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	jne	.L22
	cmpb	$1, -212(%rbp)
	jne	.L23
.L22:
	cmpw	$0, -196(%rbp)
	je	.L24
	movq	-184(%rbp), %rcx
	movq	-160(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	addq	%rcx, %rax
	leaq	1330(%rax), %rdx
	movzwl	-196(%rbp), %eax
	movw	%ax, (%rdx)
	movq	-184(%rbp), %rcx
	movq	-160(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	addq	%rcx, %rax
	leaq	1312(%rax), %rdx
	movq	-208(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-184(%rbp), %rcx
	movq	-160(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	addq	%rcx, %rax
	addq	$1332, %rax
	movb	$1, (%rax)
.L24:
	cmpb	$1, -212(%rbp)
	jne	.L26
	movq	-184(%rbp), %rcx
	movq	-160(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	addq	%rcx, %rax
	addq	$1328, %rax
	movzbl	(%rax), %eax
	andl	$15, %eax
	movb	%al, -161(%rbp)
	movzbl	-212(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movzbl	-161(%rbp), %eax
	andl	$15, %eax
	leal	(%rdx,%rax), %ecx
	movq	-184(%rbp), %rsi
	movq	-160(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	addq	%rsi, %rax
	addq	$1328, %rax
	movb	%cl, (%rax)
	movq	-184(%rbp), %rcx
	movq	-160(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	addq	%rcx, %rax
	addq	$1333, %rax
	movb	$1, (%rax)
	jmp	.L26
.L23:
	movq	-184(%rbp), %rcx
	movq	-160(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	addq	%rcx, %rax
	addq	$1332, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L26
	cmpw	$0, -196(%rbp)
	je	.L26
	movq	-184(%rbp), %rcx
	movq	-160(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	addq	%rcx, %rax
	addq	$1330, %rax
	movzwl	(%rax), %eax
	testw	%ax, %ax
	je	.L26
	movq	-192(%rbp), %rdx
	leaq	-144(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC2(%rip), %rdx
	movl	$128, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	movl	$-1, %eax
	jmp	.L27
.L26:
	movq	-160(%rbp), %rax
	jmp	.L27
.L21:
	addq	$1, -160(%rbp)
.L20:
	movq	-184(%rbp), %rax
	movq	25816(%rax), %rax
	cmpq	%rax, -160(%rbp)
	jb	.L28
	movq	-184(%rbp), %rax
	movq	25816(%rax), %rax
	cmpq	$255, %rax
	jbe	.L29
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$42, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$-1, %eax
	jmp	.L27
.L29:
	movq	-184(%rbp), %rax
	movq	25816(%rax), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	leaq	1232(%rax), %rdx
	movq	-184(%rbp), %rax
	addq	%rdx, %rax
	addq	$8, %rax
	movq	%rax, -152(%rbp)
	movq	-152(%rbp), %rax
	movq	-192(%rbp), %rcx
	movl	$63, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	movq	-152(%rbp), %rax
	movb	$0, 63(%rax)
	movq	-152(%rbp), %rax
	movq	-208(%rbp), %rdx
	movq	%rdx, 72(%rax)
	movq	-152(%rbp), %rax
	movq	$0, 80(%rax)
	movzbl	-212(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movzbl	-200(%rbp), %eax
	andl	$15, %eax
	addl	%eax, %edx
	movq	-152(%rbp), %rax
	movb	%dl, 88(%rax)
	movq	-152(%rbp), %rax
	movb	$0, 89(%rax)
	movq	-152(%rbp), %rax
	movzwl	-196(%rbp), %edx
	movw	%dx, 90(%rax)
	cmpw	$0, -196(%rbp)
	setne	%dl
	movq	-152(%rbp), %rax
	movb	%dl, 92(%rax)
	cmpb	$1, -212(%rbp)
	sete	%dl
	movq	-152(%rbp), %rax
	movb	%dl, 93(%rax)
	movq	-152(%rbp), %rax
	movl	$0, 64(%rax)
	movq	-152(%rbp), %rax
	movq	-192(%rbp), %rcx
	movl	$64, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	movq	-184(%rbp), %rax
	movq	25816(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-184(%rbp), %rdx
	movq	%rcx, 25816(%rdx)
.L27:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L30
	call	__stack_chk_fail@PLT
.L30:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	add_symbol, .-add_symbol
	.section	.rodata
	.align 8
.LC4:
	.string	"[ERROR] Error: Maximum number of sections reached (%d)\n"
.LC5:
	.string	".text"
.LC6:
	.string	".rela.text"
.LC7:
	.string	".note.GNU-stack"
.LC8:
	.string	".symtab"
.LC9:
	.string	".strtab"
.LC10:
	.string	".shstrtab"
.LC11:
	.string	".rodata"
	.text
	.globl	add_section
	.type	add_section, @function
add_section:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movq	%r9, -64(%rbp)
	movq	-24(%rbp), %rax
	movq	27104(%rax), %rax
	cmpq	$9, %rax
	jbe	.L32
	movq	stderr(%rip), %rax
	movl	$10, %edx
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
.L32:
	movq	-24(%rbp), %rax
	movq	27104(%rax), %rax
	salq	$7, %rax
	leaq	25824(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rcx
	movl	$31, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	movq	-8(%rbp), %rax
	movb	$0, 31(%rax)
	movq	-8(%rbp), %rax
	movl	-36(%rbp), %edx
	movl	%edx, 36(%rax)
	movq	-8(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 40(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 48(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 56(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 64(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 72(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 76(%rax)
	movq	-8(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, 80(%rax)
	movq	-8(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, 88(%rax)
	movq	-8(%rbp), %rax
	addq	$96, %rax
	movq	%rax, %rdi
	call	buffer_init
	movq	-8(%rbp), %rax
	movb	$1, 120(%rax)
	movq	-32(%rbp), %rax
	leaq	.LC5(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L33
	movq	-24(%rbp), %rax
	movq	27104(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 16(%rax)
	jmp	.L34
.L33:
	movq	-32(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L35
	movq	-24(%rbp), %rax
	movq	27104(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 64(%rax)
	jmp	.L34
.L35:
	movq	-32(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L36
	movq	-24(%rbp), %rax
	movq	27104(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 24(%rax)
	jmp	.L34
.L36:
	movq	-32(%rbp), %rax
	leaq	.LC8(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L37
	movq	-24(%rbp), %rax
	movq	27104(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 32(%rax)
	jmp	.L34
.L37:
	movq	-32(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L38
	movq	-24(%rbp), %rax
	movq	27104(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 40(%rax)
	jmp	.L34
.L38:
	movq	-32(%rbp), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L39
	movq	-24(%rbp), %rax
	movq	27104(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 48(%rax)
	jmp	.L34
.L39:
	movq	-32(%rbp), %rax
	leaq	.LC11(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L34
	movq	-24(%rbp), %rax
	movq	27104(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 56(%rax)
.L34:
	movq	-24(%rbp), %rax
	movq	27104(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 27104(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	add_section, .-add_section
	.globl	add_rela
	.type	add_rela, @function
add_rela:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movl	%ecx, -76(%rbp)
	movq	%r8, -88(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-48(%rbp), %rax
	movl	$32, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-88(%rbp), %rax
	movq	%rax, -24(%rbp)
	movl	-76(%rbp), %eax
	movl	%eax, -40(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, -32(%rbp)
	movq	-56(%rbp), %rax
	movq	27752(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-56(%rbp), %rdx
	movq	%rcx, 27752(%rdx)
	movq	-56(%rbp), %rdx
	addq	$847, %rax
	salq	$5, %rax
	leaq	(%rdx,%rax), %rcx
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rax, 8(%rcx)
	movq	%rdx, 16(%rcx)
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, 24(%rcx)
	movq	%rdx, 32(%rcx)
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L41
	call	__stack_chk_fail@PLT
.L41:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	add_rela, .-add_rela
	.section	.rodata
.LC12:
	.string	""
	.string	""
	.text
	.globl	build_elf_strtab_symtab
	.type	build_elf_strtab_symtab, @function
build_elf_strtab_symtab:
.LFB8:
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
	movq	32(%rax), %rax
	salq	$7, %rax
	leaq	25824(%rax), %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -96(%rbp)
	movq	-120(%rbp), %rax
	movq	40(%rax), %rax
	salq	$7, %rax
	leaq	25824(%rax), %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -88(%rbp)
	movq	-96(%rbp), %rax
	addq	$96, %rax
	movq	%rax, %rdi
	call	buffer_destroy
	movq	-96(%rbp), %rax
	addq	$96, %rax
	movq	%rax, %rdi
	call	buffer_init
	leaq	-64(%rbp), %rax
	movl	$24, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-96(%rbp), %rax
	leaq	96(%rax), %rcx
	leaq	-64(%rbp), %rax
	movl	$24, %edx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	buffer_append
	movl	$-1, -108(%rbp)
	movq	$1, -104(%rbp)
	jmp	.L43
.L47:
	movq	-104(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	leaq	1232(%rax), %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	addq	$8, %rax
	movq	%rax, -80(%rbp)
	leaq	-32(%rbp), %rax
	movl	$24, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-80(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L44
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -72(%rbp)
	movq	-88(%rbp), %rax
	movq	104(%rax), %rax
	movl	%eax, %edx
	movq	-80(%rbp), %rax
	movl	%edx, 64(%rax)
	movq	-80(%rbp), %rax
	movq	-88(%rbp), %rdx
	leaq	96(%rdx), %rcx
	movq	-72(%rbp), %rdx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	buffer_append
	movq	-88(%rbp), %rax
	addq	$96, %rax
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	buffer_append
	jmp	.L45
.L44:
	movq	-80(%rbp), %rax
	movl	$0, 64(%rax)
.L45:
	movq	-80(%rbp), %rax
	movl	64(%rax), %eax
	movl	%eax, -32(%rbp)
	movq	-80(%rbp), %rax
	movzbl	88(%rax), %eax
	movb	%al, -28(%rbp)
	movq	-80(%rbp), %rax
	movzbl	89(%rax), %eax
	movb	%al, -27(%rbp)
	movq	-80(%rbp), %rax
	movzwl	90(%rax), %eax
	movw	%ax, -26(%rbp)
	movq	-80(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-80(%rbp), %rax
	movq	80(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-96(%rbp), %rax
	leaq	96(%rax), %rcx
	leaq	-32(%rbp), %rax
	movl	$24, %edx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	buffer_append
	cmpl	$-1, -108(%rbp)
	jne	.L46
	movzbl	-28(%rbp), %eax
	shrb	$4, %al
	testb	%al, %al
	je	.L46
	movq	-104(%rbp), %rax
	movl	%eax, -108(%rbp)
.L46:
	addq	$1, -104(%rbp)
.L43:
	movq	-120(%rbp), %rax
	movq	25816(%rax), %rax
	cmpq	%rax, -104(%rbp)
	jb	.L47
	movq	-88(%rbp), %rax
	movq	104(%rax), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, 64(%rax)
	movq	-120(%rbp), %rax
	movq	40(%rax), %rax
	movl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, 72(%rax)
	cmpl	$-1, -108(%rbp)
	jne	.L48
	movq	-120(%rbp), %rax
	movq	25816(%rax), %rax
	jmp	.L49
.L48:
	movl	-108(%rbp), %eax
.L49:
	movq	-96(%rbp), %rdx
	movl	%eax, 76(%rdx)
	movq	-96(%rbp), %rax
	movq	104(%rax), %rdx
	movq	-96(%rbp), %rax
	movq	%rdx, 64(%rax)
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L50
	call	__stack_chk_fail@PLT
.L50:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	build_elf_strtab_symtab, .-build_elf_strtab_symtab
	.section	.rodata
	.align 8
.LC13:
	.string	"[ERROR] Unknown relocation type: %d\n"
	.text
	.globl	build_elf_rela
	.type	build_elf_rela, @function
build_elf_rela:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -104(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-104(%rbp), %rax
	movq	64(%rax), %rax
	salq	$7, %rax
	leaq	25824(%rax), %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	$24, 88(%rax)
	movq	-104(%rbp), %rax
	movq	16(%rax), %rax
	movl	%eax, %edx
	movq	-56(%rbp), %rax
	movl	%edx, 76(%rax)
	movq	-104(%rbp), %rax
	movq	32(%rax), %rax
	movl	%eax, %edx
	movq	-56(%rbp), %rax
	movl	%edx, 72(%rax)
	movq	-104(%rbp), %rax
	movq	16(%rax), %rax
	salq	$7, %rax
	leaq	25824(%rax), %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -48(%rbp)
	movq	$0, -80(%rbp)
	jmp	.L52
.L62:
	movq	-80(%rbp), %rax
	addq	$847, %rax
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	addq	$8, %rax
	movq	%rax, -40(%rbp)
	leaq	-32(%rbp), %rax
	movl	$24, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-48(%rbp), %rax
	movq	48(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	addq	%rdx, %rax
	movq	%rax, -32(%rbp)
	movq	-40(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$3, %eax
	je	.L53
	cmpl	$3, %eax
	ja	.L54
	testl	%eax, %eax
	je	.L55
	cmpl	$1, %eax
	je	.L56
	jmp	.L54
.L55:
	movl	$1, -84(%rbp)
	jmp	.L57
.L56:
	movl	$2, -84(%rbp)
	jmp	.L57
.L53:
	movl	$4, -84(%rbp)
	jmp	.L57
.L54:
	movq	-40(%rbp), %rax
	movl	8(%rax), %edx
	movq	stderr(%rip), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L57:
	movq	$0, -72(%rbp)
	movq	$0, -64(%rbp)
	jmp	.L58
.L61:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rcx
	movq	-64(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	leaq	1232(%rax), %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	addq	$8, %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L59
	movq	-64(%rbp), %rax
	movq	%rax, -72(%rbp)
	jmp	.L60
.L59:
	addq	$1, -64(%rbp)
.L58:
	movq	-104(%rbp), %rax
	movq	25816(%rax), %rax
	cmpq	%rax, -64(%rbp)
	jb	.L61
.L60:
	movq	-72(%rbp), %rax
	salq	$32, %rax
	movq	%rax, %rdx
	movl	-84(%rbp), %eax
	addq	%rdx, %rax
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-56(%rbp), %rax
	leaq	96(%rax), %rcx
	leaq	-32(%rbp), %rax
	movl	$24, %edx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	buffer_append
	addq	$1, -80(%rbp)
.L52:
	movq	-104(%rbp), %rax
	movq	27752(%rax), %rax
	cmpq	%rax, -80(%rbp)
	jb	.L62
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L63
	call	__stack_chk_fail@PLT
.L63:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	build_elf_rela, .-build_elf_rela
	.section	.rodata
	.align 8
.LC14:
	.string	"Failed to allocate memory for section header table"
.LC15:
	.string	"Failed to write ELF Header"
	.align 8
.LC16:
	.string	"lseek failed before writing section"
	.align 8
.LC17:
	.string	"[ERROR] Error seeking for section %s\n"
.LC18:
	.string	"Failed to write ELF Sections"
	.align 8
.LC19:
	.string	"lseek failed before writing SHT"
	.align 8
.LC20:
	.string	"Failed to write section headers"
	.text
	.globl	write_elf_object_file
	.type	write_elf_object_file, @function
write_elf_object_file:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$240, %rsp
	movq	%rdi, -232(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$1, -216(%rbp)
	movq	$0, -208(%rbp)
	jmp	.L65
.L66:
	movq	-216(%rbp), %rax
	movl	%eax, %ecx
	movq	-232(%rbp), %rax
	movq	-208(%rbp), %rdx
	addq	$202, %rdx
	salq	$7, %rdx
	addq	%rdx, %rax
	movl	%ecx, (%rax)
	movq	-208(%rbp), %rax
	salq	$7, %rax
	leaq	25824(%rax), %rdx
	movq	-232(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-208(%rbp), %rax
	salq	$7, %rax
	leaq	25824(%rax), %rcx
	movq	-232(%rbp), %rax
	addq	%rax, %rcx
	movq	-232(%rbp), %rax
	movq	48(%rax), %rax
	salq	$7, %rax
	leaq	25920(%rax), %rsi
	movq	-232(%rbp), %rax
	addq	%rsi, %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	buffer_append
	movq	-232(%rbp), %rax
	movq	48(%rax), %rax
	salq	$7, %rax
	leaq	25920(%rax), %rdx
	movq	-232(%rbp), %rax
	addq	%rdx, %rax
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	buffer_append
	movq	-208(%rbp), %rax
	salq	$7, %rax
	leaq	25824(%rax), %rdx
	movq	-232(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	-216(%rbp), %rdx
	addq	%rdx, %rax
	addq	$1, %rax
	movq	%rax, -216(%rbp)
	addq	$1, -208(%rbp)
.L65:
	movq	-232(%rbp), %rax
	movq	27104(%rax), %rax
	cmpq	%rax, -208(%rbp)
	jb	.L66
	movq	-232(%rbp), %rax
	movq	48(%rax), %rax
	salq	$7, %rax
	leaq	25920(%rax), %rdx
	movq	-232(%rbp), %rax
	addq	%rdx, %rax
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	buffer_append
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	build_elf_strtab_symtab
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	build_elf_rela
	movq	-232(%rbp), %rax
	movq	27104(%rax), %rax
	movl	$64, %esi
	movq	%rax, %rdi
	call	calloc@PLT
	movq	%rax, -168(%rbp)
	cmpq	$0, -168(%rbp)
	jne	.L67
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$0, %eax
	jmp	.L89
.L67:
	movq	-232(%rbp), %rax
	movq	8(%rax), %rax
	movl	$420, %edx
	movl	$577, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -220(%rbp)
	cmpl	$0, -220(%rbp)
	jns	.L69
	movl	$0, %eax
	jmp	.L89
.L69:
	leaq	-80(%rbp), %rax
	movl	$64, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movb	$127, -80(%rbp)
	movb	$69, -79(%rbp)
	movb	$76, -78(%rbp)
	movb	$70, -77(%rbp)
	movb	$2, -76(%rbp)
	movb	$1, -75(%rbp)
	movb	$1, -74(%rbp)
	movb	$0, -73(%rbp)
	movb	$0, -72(%rbp)
	movw	$1, -64(%rbp)
	movw	$62, -62(%rbp)
	movl	$1, -60(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movl	$0, -32(%rbp)
	movw	$64, -28(%rbp)
	movw	$0, -26(%rbp)
	movw	$0, -24(%rbp)
	movw	$64, -22(%rbp)
	movq	-232(%rbp), %rax
	movq	27104(%rax), %rax
	movw	%ax, -20(%rbp)
	movq	-232(%rbp), %rax
	movq	48(%rax), %rax
	movw	%ax, -18(%rbp)
	movq	$64, -200(%rbp)
	movq	$1, -192(%rbp)
	jmp	.L70
.L78:
	movq	-192(%rbp), %rax
	salq	$7, %rax
	leaq	25824(%rax), %rdx
	movq	-232(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rax
	movq	80(%rax), %rax
	cmpq	$1, %rax
	jbe	.L71
	movq	-112(%rbp), %rax
	movq	80(%rax), %rax
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -96(%rbp)
	movq	-200(%rbp), %rax
	andq	-96(%rbp), %rax
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	je	.L71
	movq	-104(%rbp), %rax
	subq	-88(%rbp), %rax
	addq	%rax, -200(%rbp)
.L71:
	movq	-112(%rbp), %rax
	movq	104(%rax), %rax
	testq	%rax, %rax
	jne	.L72
	movq	-112(%rbp), %rax
	movl	36(%rax), %eax
	testl	%eax, %eax
	je	.L73
	movq	-112(%rbp), %rax
	movl	36(%rax), %eax
	cmpl	$8, %eax
	je	.L73
.L72:
	movq	-112(%rbp), %rax
	movq	-200(%rbp), %rdx
	movq	%rdx, 56(%rax)
	jmp	.L74
.L73:
	movq	-112(%rbp), %rax
	movq	-200(%rbp), %rdx
	movq	%rdx, 56(%rax)
.L74:
	movq	-112(%rbp), %rax
	movl	36(%rax), %eax
	cmpl	$8, %eax
	je	.L75
	movq	-112(%rbp), %rax
	movq	104(%rax), %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, 64(%rax)
	jmp	.L76
.L75:
	movq	-112(%rbp), %rax
	movq	$0, 64(%rax)
.L76:
	movq	-112(%rbp), %rax
	movl	36(%rax), %eax
	cmpl	$8, %eax
	je	.L77
	movq	-112(%rbp), %rax
	movq	64(%rax), %rax
	addq	%rax, -200(%rbp)
.L77:
	addq	$1, -192(%rbp)
.L70:
	movq	-232(%rbp), %rax
	movq	27104(%rax), %rax
	cmpq	%rax, -192(%rbp)
	jb	.L78
	movq	$8, -160(%rbp)
	movq	-160(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -152(%rbp)
	movq	-200(%rbp), %rax
	andq	-152(%rbp), %rax
	movq	%rax, -144(%rbp)
	cmpq	$0, -144(%rbp)
	je	.L79
	movq	-160(%rbp), %rax
	subq	-144(%rbp), %rax
	addq	%rax, -200(%rbp)
.L79:
	movq	-200(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	$0, -184(%rbp)
	jmp	.L80
.L81:
	movq	-184(%rbp), %rax
	salq	$7, %rax
	leaq	25824(%rax), %rdx
	movq	-232(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -128(%rbp)
	movq	-184(%rbp), %rax
	salq	$6, %rax
	movq	%rax, %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -120(%rbp)
	movq	-128(%rbp), %rax
	movl	32(%rax), %edx
	movq	-120(%rbp), %rax
	movl	%edx, (%rax)
	movq	-128(%rbp), %rax
	movl	36(%rax), %edx
	movq	-120(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-128(%rbp), %rax
	movq	40(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-128(%rbp), %rax
	movq	48(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-128(%rbp), %rax
	movq	56(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-128(%rbp), %rax
	movq	64(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, 32(%rax)
	movq	-128(%rbp), %rax
	movl	72(%rax), %edx
	movq	-120(%rbp), %rax
	movl	%edx, 40(%rax)
	movq	-128(%rbp), %rax
	movl	76(%rax), %edx
	movq	-120(%rbp), %rax
	movl	%edx, 44(%rax)
	movq	-128(%rbp), %rax
	movq	80(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, 48(%rax)
	movq	-128(%rbp), %rax
	movq	88(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, 56(%rax)
	addq	$1, -184(%rbp)
.L80:
	movq	-232(%rbp), %rax
	movq	27104(%rax), %rax
	cmpq	%rax, -184(%rbp)
	jb	.L81
	leaq	-80(%rbp), %rcx
	movl	-220(%rbp), %eax
	movl	$64, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	testq	%rax, %rax
	jns	.L82
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
.L82:
	movq	$1, -176(%rbp)
	jmp	.L83
.L86:
	movq	-176(%rbp), %rax
	salq	$7, %rax
	leaq	25824(%rax), %rdx
	movq	-232(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -136(%rbp)
	movq	-136(%rbp), %rax
	movq	64(%rax), %rax
	testq	%rax, %rax
	je	.L84
	movq	-136(%rbp), %rax
	movq	56(%rax), %rax
	testq	%rax, %rax
	je	.L84
	movq	-136(%rbp), %rax
	movl	36(%rax), %eax
	cmpl	$8, %eax
	je	.L84
	movq	-136(%rbp), %rax
	movq	56(%rax), %rax
	movq	%rax, %rcx
	movl	-220(%rbp), %eax
	movl	$0, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	lseek@PLT
	cmpq	$-1, %rax
	jne	.L85
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movq	-136(%rbp), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	-220(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
	jmp	.L89
.L85:
	movq	-136(%rbp), %rax
	movq	64(%rax), %rdx
	movq	-136(%rbp), %rax
	movq	96(%rax), %rcx
	movl	-220(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	testq	%rax, %rax
	jns	.L84
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	-220(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
	jmp	.L89
.L84:
	addq	$1, -176(%rbp)
.L83:
	movq	-232(%rbp), %rax
	movq	27104(%rax), %rax
	cmpq	%rax, -176(%rbp)
	jb	.L86
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	movl	-220(%rbp), %eax
	movl	$0, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	lseek@PLT
	cmpq	$-1, %rax
	jne	.L87
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	-220(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
	jmp	.L89
.L87:
	movq	-232(%rbp), %rax
	movq	27104(%rax), %rax
	salq	$6, %rax
	movq	%rax, %rdx
	movq	-168(%rbp), %rcx
	movl	-220(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	testq	%rax, %rax
	jns	.L88
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
.L88:
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	-220(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %eax
.L89:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L90
	call	__stack_chk_fail@PLT
.L90:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	write_elf_object_file, .-write_elf_object_file
	.ident	"GCC: (GNU) 14.2.1 20250207"
	.section	.note.GNU-stack,"",@progbits
