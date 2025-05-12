	.file	"test4.c"
	.text
	.section	.rodata
.LC0:
	.string	"Positive"
.LC1:
	.string	"Negative"
.LC2:
	.string	"Zero"
	.text
	.globl	check_sign
	.type	check_sign, @function
check_sign:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jle	.L2
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L5
.L2:
	cmpl	$0, -4(%rbp)
	jns	.L4
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L5
.L4:
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L5:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	check_sign, .-check_sign
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$5, %edi
	call	check_sign
	movl	$-3, %edi
	call	check_sign
	movl	$0, %edi
	call	check_sign
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (GNU) 15.1.1 20250425"
	.section	.note.GNU-stack,"",@progbits
