	.file	"main.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"[INFO ] Assembling %s into %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	movaps	%xmm0, -32(%rbp)
	movq	%xmm0, -16(%rbp)
	leaq	-32(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movl	-36(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	parse_args@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L2
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	usage@PLT
	movl	$1, %eax
	jmp	.L6
.L2:
	movl	-16(%rbp), %eax
	movl	%eax, log_level(%rip)
	movl	log_level(%rip), %eax
	cmpl	$1, %eax
	jbe	.L4
	movq	-24(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L4:
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	assemble_file@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L5
	movl	$1, %eax
	jmp	.L6
.L5:
	movl	$0, %eax
.L6:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (GNU) 14.2.1 20250207"
	.section	.note.GNU-stack,"",@progbits
