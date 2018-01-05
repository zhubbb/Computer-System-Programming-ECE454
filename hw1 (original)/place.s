	.file	"place.c"
	.text
	.p2align 4,,15
	.type	get_bb_from_scratch, @function
get_bb_from_scratch:
.LFB53:
	.cfi_startproc
	movq	duplicate_pins(%rip), %rax
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movslq	%edi, %rdi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, -8(%rsp)
	movl	(%rax,%rdi,4), %edx
	movq	%rsi, -16(%rsp)
	testl	%edx, %edx
	jne	.L2
	movq	net(%rip), %rax
	leaq	(%rdi,%rdi,4), %rdx
	leaq	(%rax,%rdx,8), %rax
	movq	16(%rax), %r10
	movl	8(%rax), %eax
	addl	$1, %eax
.L3:
	movslq	(%r10), %rdx
	movq	block(%rip), %rbp
	movl	$1, %ecx
	movl	nx(%rip), %r8d
	movl	ny(%rip), %r9d
	leaq	(%rdx,%rdx,4), %rdx
	movl	%r8d, %esi
	movl	%r9d, %edi
	leaq	0(%rbp,%rdx,8), %rdx
	cmpl	%r8d, 24(%rdx)
	cmovle	24(%rdx), %esi
	testl	%esi, %esi
	cmovle	%ecx, %esi
	cmpl	%r9d, 28(%rdx)
	cmovle	28(%rdx), %edi
	testl	%edi, %edi
	cmovle	%ecx, %edi
	cmpl	$1, %eax
	jle	.L16
	subl	$2, %eax
	movl	$1, %r15d
	leaq	4(%r10), %rcx
	leaq	8(%r10,%rax,4), %r14
	movl	%edi, %r11d
	movl	%esi, %ebx
	movl	$1, -24(%rsp)
	movl	$1, %r12d
	movl	$1, %r13d
	movl	$1, %r10d
	movl	%r15d, -20(%rsp)
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L5:
	cmpl	%ebx, %edx
	je	.L6
	cmpl	%esi, %edx
	jge	.L7
	movl	%edx, %esi
	movl	$1, %r13d
.L9:
	cmpl	%edi, %eax
	je	.L22
.L10:
	cmpl	%r11d, %eax
	je	.L11
	cmpl	%edi, %eax
	jge	.L12
	movl	%eax, %edi
	movl	$1, %r12d
.L14:
	addq	$4, %rcx
	cmpq	%rcx, %r14
	je	.L23
.L15:
	movslq	(%rcx), %rax
	movl	%r8d, %edx
	movl	%r9d, %r15d
	leaq	(%rax,%rax,4), %rax
	leaq	0(%rbp,%rax,8), %rax
	cmpl	%r8d, 24(%rax)
	cmovle	24(%rax), %edx
	testl	%edx, %edx
	cmovle	%r10d, %edx
	cmpl	%r9d, 28(%rax)
	cmovle	28(%rax), %r15d
	testl	%r15d, %r15d
	movl	%r15d, %eax
	cmovle	%r10d, %eax
	cmpl	%esi, %edx
	jne	.L5
	addl	$1, %r13d
	cmpl	%ebx, %esi
	je	.L6
.L7:
	cmpl	%ebx, %edx
	jle	.L9
	cmpl	%edi, %eax
	movl	%edx, %ebx
	movl	$1, -20(%rsp)
	jne	.L10
	.p2align 4,,10
	.p2align 3
.L22:
	addl	$1, %r12d
	cmpl	%eax, %r11d
	je	.L11
.L12:
	cmpl	%r11d, %eax
	jle	.L14
	addq	$4, %rcx
	movl	%eax, %r11d
	movl	$1, -24(%rsp)
	cmpq	%rcx, %r14
	jne	.L15
	.p2align 4,,10
	.p2align 3
.L23:
	movl	-20(%rsp), %r15d
.L4:
	movq	-16(%rsp), %rax
	movl	%ebx, 4(%rax)
	movl	%esi, (%rax)
	movl	%edi, 8(%rax)
	movl	%r11d, 12(%rax)
	movl	-24(%rsp), %ebx
	movq	-8(%rsp), %rax
	movl	%r13d, (%rax)
	movl	%r15d, 4(%rax)
	movl	%r12d, 8(%rax)
	movl	%ebx, 12(%rax)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	.cfi_restore_state
	addl	$1, -20(%rsp)
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L11:
	addl	$1, -24(%rsp)
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L2:
	movq	unique_pin_list(%rip), %rax
	movq	net(%rip), %rcx
	movq	(%rax,%rdi,8), %r10
	leaq	(%rdi,%rdi,4), %rax
	leaq	(%rcx,%rax,8), %rax
	movl	8(%rax), %eax
	addl	$1, %eax
	subl	%edx, %eax
	jmp	.L3
.L16:
	movl	%edi, %r11d
	movl	%esi, %ebx
	movl	$1, -24(%rsp)
	movl	$1, %r12d
	movl	$1, %r15d
	movl	$1, %r13d
	jmp	.L4
	.cfi_endproc
.LFE53:
	.size	get_bb_from_scratch, .-get_bb_from_scratch
	.p2align 4,,15
	.type	update_bb, @function
update_bb:
.LFB57:
	.cfi_startproc
	movl	nx(%rip), %r10d
	movl	ny(%rip), %eax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	16(%rsp), %r11d
	movl	$1, %ebx
	cmpl	%r9d, %r10d
	cmovle	%r10d, %r9d
	testl	%r9d, %r9d
	cmovle	%ebx, %r9d
	cmpl	%r11d, %eax
	cmovle	%eax, %r11d
	testl	%r11d, %r11d
	cmovle	%ebx, %r11d
	cmpl	%ecx, %r10d
	cmovg	%ecx, %r10d
	testl	%r10d, %r10d
	cmovle	%ebx, %r10d
	cmpl	%r8d, %eax
	cmovg	%r8d, %eax
	testl	%eax, %eax
	cmovg	%eax, %ebx
	cmpl	%r10d, %r9d
	movslq	%edi, %rax
	movl	%ebx, %r8d
	jge	.L25
	salq	$4, %rax
	movq	%rax, %rbx
	addq	bb_coords(%rip), %rbx
	movl	4(%rbx), %ecx
	cmpl	%ecx, %r10d
	je	.L59
	addq	bb_num_on_edges(%rip), %rax
	movl	%ecx, 4(%rsi)
	movl	4(%rax), %ecx
	movl	%ecx, 4(%rdx)
.L28:
	movl	(%rbx), %ecx
	cmpl	%ecx, %r9d
	jge	.L29
	movl	%r9d, (%rsi)
	movl	$1, (%rdx)
.L30:
	cmpl	%r8d, %r11d
	jge	.L38
.L64:
	movl	12(%rbx), %ecx
	cmpl	%ecx, %r8d
	je	.L60
	movl	%ecx, 12(%rsi)
	movl	12(%rax), %ecx
	movl	%ecx, 12(%rdx)
.L40:
	movl	8(%rbx), %ecx
	cmpl	%ecx, %r11d
	jl	.L61
	je	.L62
	movl	%ecx, 8(%rsi)
	movl	8(%rax), %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	movl	%eax, 8(%rdx)
	ret
	.p2align 4,,10
	.p2align 3
.L25:
	.cfi_restore_state
	jle	.L32
	salq	$4, %rax
	movq	%rax, %rbx
	addq	bb_coords(%rip), %rbx
	movl	(%rbx), %ecx
	cmpl	%ecx, %r10d
	je	.L63
	addq	bb_num_on_edges(%rip), %rax
	movl	%ecx, (%rsi)
	movl	(%rax), %ecx
	movl	%ecx, (%rdx)
.L35:
	movl	4(%rbx), %ecx
	cmpl	%ecx, %r9d
	jle	.L36
	cmpl	%r8d, %r11d
	movl	%r9d, 4(%rsi)
	movl	$1, 4(%rdx)
	jl	.L64
	.p2align 4,,10
	.p2align 3
.L38:
	movl	8(%rbx), %ecx
	jle	.L44
	cmpl	%ecx, %r8d
	je	.L65
	movl	%ecx, 8(%rsi)
	movl	8(%rax), %ecx
	movl	%ecx, 8(%rdx)
.L46:
	movl	12(%rbx), %ecx
	cmpl	%ecx, %r11d
	jg	.L66
	je	.L67
	movl	%ecx, 12(%rsi)
	movl	12(%rax), %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	movl	%eax, 12(%rdx)
	ret
	.p2align 4,,10
	.p2align 3
.L32:
	.cfi_restore_state
	salq	$4, %rax
	movq	%rax, %rbx
	addq	bb_coords(%rip), %rbx
	addq	bb_num_on_edges(%rip), %rax
	movl	(%rbx), %ecx
	movl	%ecx, (%rsi)
	movl	4(%rbx), %ecx
	movl	%ecx, 4(%rsi)
	movl	(%rax), %ecx
	movl	%ecx, (%rdx)
	movl	4(%rax), %ecx
	movl	%ecx, 4(%rdx)
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L44:
	movl	%ecx, 8(%rsi)
	movl	12(%rbx), %ecx
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	movl	%ecx, 12(%rsi)
	movl	8(%rax), %ecx
	movl	12(%rax), %eax
	movl	%ecx, 8(%rdx)
	movl	%eax, 12(%rdx)
	ret
	.p2align 4,,10
	.p2align 3
.L29:
	.cfi_restore_state
	je	.L68
	movl	%ecx, (%rsi)
	movl	(%rax), %ecx
	movl	%ecx, (%rdx)
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L59:
	addq	bb_num_on_edges(%rip), %rax
	movl	4(%rax), %ecx
	cmpl	$1, %ecx
	je	.L34
	subl	$1, %ecx
	movl	%ecx, 4(%rdx)
	movl	4(%rbx), %ecx
	movl	%ecx, 4(%rsi)
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L63:
	addq	bb_num_on_edges(%rip), %rax
	movl	(%rax), %ecx
	cmpl	$1, %ecx
	je	.L34
	subl	$1, %ecx
	movl	%ecx, (%rdx)
	movl	(%rbx), %ecx
	movl	%ecx, (%rsi)
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L65:
	movl	8(%rax), %ecx
	cmpl	$1, %ecx
	je	.L34
	subl	$1, %ecx
	movl	%ecx, 8(%rdx)
	movl	8(%rbx), %ecx
	movl	%ecx, 8(%rsi)
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L68:
	movl	%r9d, (%rsi)
	movl	(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, (%rdx)
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L61:
	movl	%r11d, 8(%rsi)
	movl	$1, 8(%rdx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L60:
	.cfi_restore_state
	movl	12(%rax), %ecx
	cmpl	$1, %ecx
	je	.L34
	subl	$1, %ecx
	movl	%ecx, 12(%rdx)
	movl	12(%rbx), %ecx
	movl	%ecx, 12(%rsi)
	jmp	.L40
	.p2align 4,,10
	.p2align 3
.L36:
	je	.L69
	movl	%ecx, 4(%rsi)
	movl	4(%rax), %ecx
	movl	%ecx, 4(%rdx)
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L66:
	movl	%r11d, 12(%rsi)
	movl	$1, 12(%rdx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L62:
	.cfi_restore_state
	movl	%r11d, 8(%rsi)
	movl	8(%rax), %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	addl	$1, %eax
	movl	%eax, 8(%rdx)
	ret
	.p2align 4,,10
	.p2align 3
.L67:
	.cfi_restore_state
	movl	%r11d, 12(%rsi)
	movl	12(%rax), %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	addl	$1, %eax
	movl	%eax, 12(%rdx)
	ret
	.p2align 4,,10
	.p2align 3
.L34:
	.cfi_restore_state
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	get_bb_from_scratch
	.p2align 4,,10
	.p2align 3
.L69:
	.cfi_restore_state
	movl	%r9d, 4(%rsi)
	movl	4(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 4(%rdx)
	jmp	.L30
	.cfi_endproc
.LFE57:
	.size	update_bb, .-update_bb
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"./SRC/place.c"
.LC1:
	.string	"source_type != NULL"
.LC2:
	.string	"sink_type != NULL"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"Error in comp_td_point_to_point_delay in place.c, bad delay_source_to_sink value"
	.text
	.p2align 4,,15
	.type	comp_td_point_to_point_delay, @function
comp_td_point_to_point_delay:
.LFB39:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movslq	%edi, %rdi
	movq	net(%rip), %rdx
	leaq	(%rdi,%rdi,4), %rax
	movslq	%esi, %rsi
	leaq	(%rdx,%rax,8), %rax
	movq	16(%rax), %rdx
	movq	block(%rip), %rax
	movslq	(%rdx), %rcx
	movslq	(%rdx,%rsi,4), %rdx
	leaq	(%rcx,%rcx,4), %rcx
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%rax,%rcx,8), %rcx
	leaq	(%rax,%rdx,8), %rax
	movq	8(%rcx), %rdi
	movq	8(%rax), %rsi
	testq	%rdi, %rdi
	je	.L82
	testq	%rsi, %rsi
	je	.L83
	movl	24(%rax), %edx
	movl	28(%rax), %eax
	subl	28(%rcx), %eax
	subl	24(%rcx), %edx
	movl	%eax, %ecx
	movl	%edx, %r8d
	sarl	$31, %ecx
	sarl	$31, %r8d
	xorl	%ecx, %eax
	xorl	%r8d, %edx
	subl	%ecx, %eax
	movq	IO_TYPE(%rip), %rcx
	subl	%r8d, %edx
	movslq	%edx, %rdx
	cltq
	cmpq	%rcx, %rdi
	je	.L84
	cmpq	%rcx, %rsi
	je	.L85
	movq	delta_fb_to_fb(%rip), %rcx
	movq	(%rcx,%rdx,8), %rdx
	movss	(%rdx,%rax,4), %xmm0
.L75:
	pxor	%xmm1, %xmm1
	ucomiss	%xmm0, %xmm1
	ja	.L86
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L84:
	.cfi_restore_state
	cmpq	%rdi, %rsi
	je	.L87
	movq	delta_io_to_fb(%rip), %rcx
	movq	(%rcx,%rdx,8), %rdx
	movss	(%rdx,%rax,4), %xmm0
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L85:
	movq	delta_fb_to_io(%rip), %rcx
	movq	(%rcx,%rdx,8), %rdx
	movss	(%rdx,%rax,4), %xmm0
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L87:
	movq	delta_io_to_io(%rip), %rcx
	movq	(%rcx,%rdx,8), %rdx
	movss	(%rdx,%rax,4), %xmm0
	jmp	.L75
.L83:
	leaq	__PRETTY_FUNCTION__.5031(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	movl	$1988, %edx
	call	__assert_fail@PLT
.L82:
	leaq	__PRETTY_FUNCTION__.5031(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	movl	$1987, %edx
	call	__assert_fail@PLT
.L86:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE39:
	.size	comp_td_point_to_point_delay, .-comp_td_point_to_point_delay
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"Error in update_region_occ:  x_overlap < 0\n inet = %d, overlap = %g\n"
	.align 8
.LC11:
	.string	"Error in update_region_occ:  y_overlap < 0\n inet = %d, overlap = %g\n"
	.text
	.p2align 4,,15
	.type	update_region_occ.constprop.5, @function
update_region_occ.constprop.5:
.LFB67:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movslq	%edi, %rax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	(%rax,%rax,4), %rax
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	net(%rip), %rcx
	leaq	(%rcx,%rax,8), %rax
	movslq	8(%rax), %rax
	cmpl	$49, %eax
	jle	.L89
	pxor	%xmm3, %xmm3
	subl	$49, %eax
	cvtsi2sd	%eax, %xmm3
	mulsd	.LC5(%rip), %xmm3
	addsd	.LC6(%rip), %xmm3
	cvtsd2ss	%xmm3, %xmm3
.L90:
	pxor	%xmm0, %xmm0
	leal	-1(%rdx), %ecx
	movsd	.LC7(%rip), %xmm1
	pxor	%xmm4, %xmm4
	cvtsi2sd	(%rsi), %xmm0
	subsd	%xmm1, %xmm0
	pxor	%xmm7, %xmm7
	pxor	%xmm2, %xmm2
	cvtsd2ss	%xmm0, %xmm4
	pxor	%xmm0, %xmm0
	cvtsi2ss	nx(%rip), %xmm2
	cvtsi2sd	4(%rsi), %xmm0
	addsd	%xmm1, %xmm0
	movaps	%xmm4, %xmm8
	movss	%xmm4, 12(%rsp)
	pxor	%xmm4, %xmm4
	cvtsd2ss	%xmm0, %xmm4
	pxor	%xmm0, %xmm0
	cvtsi2sd	8(%rsi), %xmm0
	subsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm7
	pxor	%xmm0, %xmm0
	movss	%xmm4, 16(%rsp)
	cvtsi2sd	12(%rsi), %xmm0
	addsd	%xmm1, %xmm0
	movaps	%xmm7, %xmm9
	movss	%xmm7, 20(%rsp)
	pxor	%xmm7, %xmm7
	cvtsd2ss	%xmm0, %xmm7
	pxor	%xmm0, %xmm0
	cvtsi2ss	%edx, %xmm0
	movss	%xmm7, 24(%rsp)
	movaps	%xmm0, %xmm5
	divss	%xmm2, %xmm5
	pxor	%xmm2, %xmm2
	cvtsi2ss	ny(%rip), %xmm2
	movss	%xmm5, 28(%rsp)
	divss	%xmm2, %xmm0
	movaps	%xmm8, %xmm2
	movaps	%xmm0, %xmm6
	movss	%xmm0, 32(%rsp)
	pxor	%xmm0, %xmm0
	cvtss2sd	%xmm2, %xmm0
	subsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	%xmm5, %xmm0
	cvttss2si	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtss2sd	%xmm4, %xmm0
	subsd	%xmm1, %xmm0
	movl	%eax, %ebx
	movl	%eax, 68(%rsp)
	cvttsd2si	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	%xmm5, %xmm0
	movaps	%xmm9, %xmm5
	cvttss2si	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtss2sd	%xmm5, %xmm0
	subsd	%xmm1, %xmm0
	cmpl	%eax, %edx
	cmovle	%ecx, %eax
	movl	%eax, %esi
	movl	%eax, 76(%rsp)
	cvttsd2si	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	%xmm6, %xmm0
	cvttss2si	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtss2sd	%xmm7, %xmm0
	subsd	%xmm1, %xmm0
	movaps	%xmm4, %xmm1
	subss	%xmm8, %xmm1
	movl	%eax, 72(%rsp)
	cvttsd2si	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	%xmm6, %xmm0
	cvttss2si	%xmm0, %eax
	movss	.LC8(%rip), %xmm0
	movaps	%xmm0, %xmm4
	divss	%xmm1, %xmm4
	movaps	%xmm7, %xmm1
	subss	%xmm9, %xmm1
	cmpl	%eax, %edx
	cmovg	%eax, %ecx
	cmpl	%esi, %ebx
	movl	%ecx, 8(%rsp)
	divss	%xmm1, %xmm0
	movss	%xmm4, 36(%rsp)
	movss	%xmm0, 40(%rsp)
	jg	.L88
	movl	72(%rsp), %esi
	cmpl	%ecx, %esi
	jg	.L88
	movslq	68(%rsp), %rax
	movsd	.LC9(%rip), %xmm4
	movl	%edi, 44(%rsp)
	leaq	0(,%rax,8), %r14
	leaq	4(,%rax,4), %r15
	movslq	%esi, %rax
	movq	%rax, %rsi
	leaq	4(,%rax,4), %rax
	salq	$4, %rsi
	movq	%rax, 88(%rsp)
	movq	%r14, %rax
	movq	%rsi, 80(%rsp)
	movq	%r15, %r14
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L106:
	leaq	-4(%r14), %rbx
	movq	%r15, %rax
	movq	88(%rsp), %rbp
	movq	%r14, %r15
	movq	80(%rsp), %r12
	movl	72(%rsp), %r13d
	movq	%rbx, %r14
	movq	%rax, %rbx
	jmp	.L105
	.p2align 4,,10
	.p2align 3
.L101:
	pxor	%xmm0, %xmm0
	cvtss2sd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm4
	ja	.L114
.L103:
	movaps	%xmm1, %xmm0
	movq	place_region_x(%rip), %rax
	movq	%r12, %rcx
	movq	%r12, %rdx
	addl	$1, %r13d
	addq	$16, %r12
	mulss	%xmm3, %xmm0
	addq	$4, %rbp
	addq	(%rax,%rbx), %rcx
	movq	place_region_y(%rip), %rax
	mulss	%xmm2, %xmm0
	addq	(%rax,%rbx), %rdx
	cmpl	8(%rsp), %r13d
	mulss	%xmm3, %xmm2
	mulss	40(%rsp), %xmm0
	mulss	%xmm2, %xmm1
	mulss	36(%rsp), %xmm1
	mulss	28(%rsp), %xmm0
	mulss	32(%rsp), %xmm1
	addss	8(%rcx), %xmm0
	movss	%xmm0, 8(%rcx)
	addss	8(%rdx), %xmm1
	movss	%xmm1, 8(%rdx)
	jg	.L115
.L105:
	movq	place_region_bounds_x(%rip), %rax
	movss	16(%rsp), %xmm2
	movss	24(%rsp), %xmm1
	movss	(%rax,%r14), %xmm5
	minss	(%rax,%r15), %xmm2
	movq	place_region_bounds_y(%rip), %rax
	maxss	12(%rsp), %xmm5
	movss	-4(%rax,%rbp), %xmm0
	minss	(%rax,%rbp), %xmm1
	maxss	20(%rsp), %xmm0
	subss	%xmm5, %xmm2
	subss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtss2sd	%xmm2, %xmm0
	ucomisd	%xmm0, %xmm4
	jbe	.L101
	movl	44(%rsp), %esi
	leaq	.LC10(%rip), %rdi
	movl	$1, %eax
	movsd	%xmm4, 56(%rsp)
	movss	%xmm1, 64(%rsp)
	movss	%xmm2, 52(%rsp)
	movss	%xmm3, 48(%rsp)
	call	printf@PLT
	pxor	%xmm0, %xmm0
	movss	64(%rsp), %xmm1
	movsd	56(%rsp), %xmm4
	cvtss2sd	%xmm1, %xmm0
	movss	52(%rsp), %xmm2
	ucomisd	%xmm0, %xmm4
	movss	48(%rsp), %xmm3
	jbe	.L103
.L114:
	movl	44(%rsp), %esi
	leaq	.LC11(%rip), %rdi
	movl	$1, %eax
	movsd	%xmm4, 56(%rsp)
	movss	%xmm1, 64(%rsp)
	movss	%xmm2, 52(%rsp)
	movss	%xmm3, 48(%rsp)
	call	printf@PLT
	movsd	56(%rsp), %xmm4
	movss	64(%rsp), %xmm1
	movss	52(%rsp), %xmm2
	movss	48(%rsp), %xmm3
	jmp	.L103
	.p2align 4,,10
	.p2align 3
.L115:
	movq	%r15, %r14
	addl	$1, 68(%rsp)
	movq	%rbx, %r15
	movl	68(%rsp), %eax
	addq	$8, %r15
	addq	$4, %r14
	cmpl	76(%rsp), %eax
	jle	.L106
.L88:
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L89:
	.cfi_restore_state
	leaq	cross_count(%rip), %rcx
	movss	(%rcx,%rax,4), %xmm3
	jmp	.L90
	.cfi_endproc
.LFE67:
	.size	update_region_occ.constprop.5, .-update_region_occ.constprop.5
	.section	.rodata.str1.1
.LC12:
	.string	"num_col_same_type != 0"
.LC13:
	.string	"Error in find_to: rlx = %d\n"
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"Error in find_to.  Unexpected io swap location."
	.section	.rodata.str1.1
.LC15:
	.string	"*x_to >= 1 && *x_to <= nx"
.LC16:
	.string	"*y_to >= 1 && *y_to <= ny"
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Error in routine find_to:  (x_to,y_to) = (%d,%d)\n"
	.align 8
.LC18:
	.string	"type == grid[*x_to][*y_to].type"
	.align 8
.LC19:
	.string	"Error in find_affected_nets -- count = %d, affected index = %d.\n"
	.text
	.p2align 4,,15
	.type	try_swap, @function
try_swap:
.LFB32:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$328, %rsp
	.cfi_def_cfa_offset 384
	movq	%rdx, 264(%rsp)
	movl	num_types(%rip), %edx
	movss	%xmm0, 272(%rsp)
	movq	%rdi, 232(%rsp)
	movq	%rsi, 224(%rsp)
	movss	%xmm1, (%rsp)
	movl	%ecx, 144(%rsp)
	movss	%xmm2, 276(%rsp)
	testl	%edx, %edx
	movq	%r8, 240(%rsp)
	movss	%xmm3, 280(%rsp)
	movq	%r9, 248(%rsp)
	movss	%xmm4, 284(%rsp)
	movq	416(%rsp), %r13
	jle	.L313
	subl	$1, %edx
	movq	type_descriptors(%rip), %rcx
	leaq	(%rdx,%rdx,8), %rsi
	leaq	(%rdx,%rsi,2), %rdx
	leaq	8(%rcx), %rax
	leaq	160(%rcx,%rdx,8), %rsi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L118:
	movl	(%rax), %ecx
	cmpl	%ecx, %edx
	cmovl	%ecx, %edx
	addq	$152, %rax
	cmpq	%rax, %rsi
	jne	.L118
.L117:
	cmpq	$0, bb_coord_new.4893(%rip)
	je	.L470
.L119:
	movl	num_blocks(%rip), %eax
	leal	-1(%rax), %edi
	call	my_irand@PLT
	cmpl	$1, 392(%rsp)
	movl	%eax, 196(%rsp)
	je	.L120
	cltq
	movq	IO_TYPE(%rip), %rcx
	movq	%rax, 216(%rsp)
	leaq	(%rax,%rax,4), %rax
	salq	$3, %rax
	movq	%rax, 184(%rsp)
	addq	block(%rip), %rax
	movq	8(%rax), %rbx
.L121:
	movl	nx(%rip), %esi
	pxor	%xmm0, %xmm0
	movl	24(%rax), %edi
	movss	(%rsp), %xmm4
	cvtsi2ss	%esi, %xmm0
	movl	%edi, 136(%rsp)
	movl	28(%rax), %edi
	movl	32(%rax), %eax
	movl	%edi, 132(%rsp)
	movl	%eax, 204(%rsp)
	ucomiss	%xmm4, %xmm0
	jbe	.L437
	cvttss2si	%xmm4, %r12d
.L125:
	movl	ny(%rip), %edx
	pxor	%xmm0, %xmm0
	cvtsi2ss	%edx, %xmm0
	ucomiss	%xmm4, %xmm0
	jbe	.L438
	cvttss2si	%xmm4, %eax
	movl	%eax, 24(%rsp)
	movl	%eax, %r10d
.L128:
	movl	136(%rsp), %r11d
	movl	$1, %ebp
	movl	132(%rsp), %r8d
	movl	%r11d, %eax
	subl	%r12d, %eax
	testl	%eax, %eax
	movl	%eax, %edi
	movl	%eax, 32(%rsp)
	cmovle	%ebp, %edi
	movslq	%edi, %rax
	movl	%r11d, %edi
	addl	%r12d, %edi
	cmpl	%esi, %edi
	cmovle	%edi, %esi
	movl	%r8d, %edi
	subl	%r10d, %edi
	testl	%edi, %edi
	movl	%edi, 48(%rsp)
	cmovg	%edi, %ebp
	addl	%r10d, %r8d
	cmpl	%edx, %r8d
	cmovg	%edx, %r8d
	cmpq	%rcx, %rbx
	je	.L314
	xorl	%r15d, %r15d
	cmpl	%esi, %eax
	movq	grid(%rip), %rdi
	jle	.L132
	jmp	.L133
	.p2align 4,,10
	.p2align 3
.L131:
	addq	$1, %rax
	cmpl	%eax, %esi
	jl	.L471
.L132:
	movq	(%rdi,%rax,8), %rdx
	cmpq	%rbx, 24(%rdx)
	jne	.L131
	movslq	%r15d, %rdx
	addl	$1, %r15d
	movl	%eax, 0(%r13,%rdx,4)
	addq	$1, %rax
	cmpl	%eax, %esi
	jge	.L132
	.p2align 4,,10
	.p2align 3
.L471:
	testl	%r15d, %r15d
	je	.L133
	cmpl	$1, %r15d
	je	.L472
.L129:
	testl	%r12d, %r12d
	jle	.L137
	cmpl	nx(%rip), %r12d
	jg	.L137
	leal	(%r12,%r12), %eax
	subl	%ebp, %r8d
	movl	132(%rsp), %r14d
	movl	%r8d, 8(%rsp)
	movl	%r12d, 16(%rsp)
	movl	%eax, 40(%rsp)
	movl	24(%rsp), %eax
	leal	(%rax,%rax), %edi
	subl	$1, %eax
	movl	%eax, 64(%rsp)
	leal	-1(%r12), %eax
	movl	%edi, 56(%rsp)
	leal	-1(%r15), %edi
	movl	136(%rsp), %r15d
	movl	%eax, 72(%rsp)
	movl	%edi, (%rsp)
	jmp	.L138
	.p2align 4,,10
	.p2align 3
.L139:
	movl	(%rsp), %edi
	call	my_irand@PLT
	movslq	%eax, %r12
	movl	8(%rsp), %eax
	cltd
	idivl	16(%rbx)
	leal	-1(%rax), %edi
	testl	%eax, %eax
	movl	$0, %eax
	cmovle	%eax, %edi
	call	my_irand@PLT
	imull	16(%rbx), %eax
	movslq	0(%r13,%r12,4), %rsi
	movq	grid(%rip), %rcx
	movq	%rsi, %rdx
	leal	(%rax,%rbp), %r12d
	movslq	%r12d, %rax
	leaq	(%rax,%rax,2), %rax
	salq	$3, %rax
	addq	(%rcx,%rsi,8), %rax
	subl	8(%rax), %r12d
	testl	%esi, %esi
	jle	.L160
	cmpl	nx(%rip), %esi
	jg	.L160
	testl	%r12d, %r12d
	jle	.L162
	cmpl	ny(%rip), %r12d
	jg	.L162
.L147:
	cmpl	%edx, %r15d
	jne	.L163
.L150:
	cmpl	%r12d, %r14d
	jne	.L163
.L164:
	movq	IO_TYPE(%rip), %rcx
.L138:
	cmpq	%rcx, %rbx
	jne	.L139
	movl	nx(%rip), %eax
	cmpl	%eax, 16(%rsp)
	jge	.L473
	testl	%r15d, %r15d
	je	.L474
	addl	$1, %eax
	cmpl	%eax, %r15d
	je	.L475
	testl	%r14d, %r14d
	movl	40(%rsp), %edi
	jne	.L153
	call	my_irand@PLT
	movl	32(%rsp), %edi
	leal	(%rdi,%rax), %edx
	movl	nx(%rip), %eax
	cmpl	%eax, %edx
	jg	.L476
	testl	%edx, %edx
	jle	.L477
	cmpl	%edx, %r15d
	je	.L164
	movl	%edx, %r14d
	movl	$0, 176(%rsp)
	jmp	.L299
	.p2align 4,,10
	.p2align 3
.L473:
	movl	$3, %edi
	call	my_irand@PLT
	cmpl	$1, %eax
	je	.L142
	jle	.L478
	cmpl	$2, %eax
	je	.L145
	cmpl	$3, %eax
	jne	.L141
	movl	nx(%rip), %eax
	xorl	%r12d, %r12d
	leal	-1(%rax), %edi
	call	my_irand@PLT
	leal	1(%rax), %edx
	cmpl	%edx, %r15d
	je	.L150
.L163:
	testl	%edx, %edx
	movl	%edx, %r14d
	movl	%r12d, 176(%rsp)
	js	.L165
	movl	nx(%rip), %eax
.L299:
	addl	$1, %eax
	cmpl	%eax, %r14d
	jg	.L165
	movl	176(%rsp), %edi
	movl	%edi, %eax
	shrl	$31, %eax
	testb	%al, %al
	jne	.L165
	movl	ny(%rip), %eax
	addl	$1, %eax
	cmpl	%eax, %edi
	jg	.L165
	movslq	%r14d, %rax
	movq	grid(%rip), %r12
	movq	%rax, %rdi
	movq	%rax, 288(%rsp)
	movslq	176(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	salq	$3, %rax
	movq	%rax, 296(%rsp)
	addq	(%r12,%rdi,8), %rax
	cmpq	%rbx, (%rax)
	jne	.L479
	movl	12(%rbx), %edx
	cmpl	$1, %edx
	jle	.L480
	leal	-1(%rdx), %edi
	call	my_irand@PLT
	movq	grid(%rip), %r12
	movq	288(%rsp), %rdi
	movslq	%eax, %rdx
	movq	296(%rsp), %rax
	leaq	0(,%rdx,4), %rbx
	movl	%edx, 304(%rsp)
	addq	(%r12,%rdi,8), %rax
	movq	%rbx, 256(%rsp)
.L297:
	movq	16(%rax), %rax
	movq	block(%rip), %r13
	movl	(%rax,%rbx), %eax
	cmpl	$-1, %eax
	movl	%eax, 200(%rsp)
	je	.L481
	movslq	200(%rsp), %rax
	movl	136(%rsp), %ebx
	movq	%rax, 312(%rsp)
	leaq	(%rax,%rax,4), %rax
	salq	$3, %rax
	movq	%rax, 208(%rsp)
	addq	%r13, %rax
	movl	%ebx, 24(%rax)
	movl	132(%rsp), %ebx
	movl	%ebx, 28(%rax)
	movl	204(%rsp), %ebx
	movl	%ebx, 32(%rax)
	movq	184(%rsp), %rax
	movl	176(%rsp), %ebx
	addq	%r13, %rax
	movl	%ebx, 28(%rax)
	movl	304(%rsp), %ebx
	movl	%r14d, 24(%rax)
	movl	%ebx, 32(%rax)
.L169:
	movq	8(%rax), %rdx
	movq	net_block_moved.4896(%rip), %rcx
	movl	8(%rdx), %ebx
	movq	nets_to_update.4895(%rip), %rdx
	testl	%ebx, %ebx
	movl	%ebx, %edi
	movl	%ebx, 308(%rsp)
	jle	.L170
	leal	-1(%rdi), %esi
	pxor	%xmm4, %xmm4
	movq	16(%rax), %rax
	movq	net(%rip), %r11
	xorl	%r10d, %r10d
	leaq	4(,%rsi,4), %r9
	movq	temp_net_cost(%rip), %rbx
	movss	%xmm4, 192(%rsp)
	movaps	%xmm4, %xmm2
	leaq	(%rax,%r9), %rbp
	movss	.LC8(%rip), %xmm1
	jmp	.L172
	.p2align 4,,10
	.p2align 3
.L171:
	addq	$4, %rax
	cmpq	%rax, %rbp
	je	.L482
.L172:
	movl	(%rax), %edi
	cmpl	$-1, %edi
	je	.L171
	movslq	%edi, %rsi
	leaq	0(,%rsi,4), %r8
	addq	%r8, %rsi
	movl	32(%r11,%rsi,8), %r15d
	testl	%r15d, %r15d
	jne	.L171
	addq	%rbx, %r8
	movss	(%r8), %xmm0
	ucomiss	%xmm2, %xmm0
	ja	.L171
	addq	$4, %rax
	movslq	%r10d, %rsi
	addl	$1, %r10d
	cmpq	%rax, %rbp
	movl	%edi, (%rdx,%rsi,4)
	movl	$0, (%rcx,%rsi,4)
	movss	%xmm1, (%r8)
	jne	.L172
.L482:
	cmpl	$-1, 200(%rsp)
	movl	%r10d, 124(%rsp)
	je	.L301
	movq	208(%rsp), %rax
	movss	.LC8(%rip), %xmm1
	movss	192(%rsp), %xmm2
	movq	16(%r13,%rax), %r8
	leaq	(%r8,%r9), %rbp
	movl	124(%rsp), %r9d
	.p2align 4,,10
	.p2align 3
.L182:
	movl	(%r8), %edi
	cmpl	$-1, %edi
	je	.L174
	movslq	%edi, %rax
	leaq	0(,%rax,4), %rsi
	addq	%rsi, %rax
	movl	32(%r11,%rax,8), %r10d
	testl	%r10d, %r10d
	jne	.L174
	addq	%rbx, %rsi
	movss	(%rsi), %xmm0
	ucomiss	%xmm2, %xmm0
	jbe	.L440
	testl	%r9d, %r9d
	je	.L174
	cmpl	(%rdx), %edi
	je	.L177
	movl	$1, %eax
	jmp	.L179
	.p2align 4,,10
	.p2align 3
.L181:
	leaq	0(,%rax,4), %r10
	addq	$1, %rax
	cmpl	-4(%rdx,%rax,4), %edi
	je	.L483
.L179:
	cmpl	%r9d, %eax
	movl	%eax, %esi
	jl	.L181
.L180:
	cmpl	%esi, %r9d
	jl	.L484
.L174:
	addq	$4, %r8
	cmpq	%r8, %rbp
	jne	.L182
	movl	%r9d, 124(%rsp)
.L301:
	cmpl	$1, 144(%rsp)
	je	.L312
	movl	124(%rsp), %edi
	testl	%edi, %edi
	je	.L303
.L302:
	movss	192(%rsp), %xmm4
	movq	$0, 104(%rsp)
	movss	%xmm4, 120(%rsp)
	movl	$0, 128(%rsp)
	movl	%r14d, 180(%rsp)
	movsd	.LC9(%rip), %xmm4
	jmp	.L219
	.p2align 4,,10
	.p2align 3
.L486:
	subq	$8, %rsp
	.cfi_def_cfa_offset 392
	movl	184(%rsp), %eax
	pushq	%rax
	.cfi_def_cfa_offset 400
	movl	196(%rsp), %r9d
	movl	148(%rsp), %r8d
	movl	152(%rsp), %ecx
.L459:
	movl	88(%rsp), %edi
	movq	%rbp, %rsi
	call	update_bb
	popq	%rdx
	.cfi_def_cfa_offset 392
	popq	%rcx
	.cfi_def_cfa_offset 384
	cmpl	$1, 144(%rsp)
	movq	net(%rip), %rax
	movsd	(%rsp), %xmm4
	movslq	8(%rax,%r13), %rax
	je	.L193
	salq	$2, %rbx
	movq	%rbx, %rsi
	addq	temp_net_cost(%rip), %rsi
	cmpl	$49, %eax
	jle	.L196
	pxor	%xmm0, %xmm0
	subl	$49, %eax
	pxor	%xmm2, %xmm2
	cvtsi2sd	%eax, %xmm0
	mulsd	.LC5(%rip), %xmm0
	addsd	.LC6(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm2
.L197:
	movslq	4(%rbp), %rdi
	movslq	12(%rbp), %r9
	movslq	0(%rbp), %rcx
	movslq	8(%rbp), %r10
	movq	chanx_place_cost_fac(%rip), %rdx
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	movq	%r9, %rax
	movq	(%rdx,%r9,8), %r9
	movl	%edi, %edx
	subl	%r10d, %eax
	subl	%ecx, %edx
	addl	$1, %eax
	addl	$1, %edx
	cvtsi2ss	%edx, %xmm1
	movq	chany_place_cost_fac(%rip), %rdx
	cvtsi2ss	%eax, %xmm0
	movq	net_cost(%rip), %rax
	movq	(%rdx,%rdi,8), %rdx
	mulss	%xmm2, %xmm1
	mulss	%xmm2, %xmm0
	mulss	-4(%r9,%r10,4), %xmm1
	mulss	-4(%rdx,%rcx,4), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, (%rsi)
	subss	(%rax,%rbx), %xmm0
	addss	120(%rsp), %xmm0
	movss	%xmm0, 120(%rsp)
.L198:
	addl	$1, 128(%rsp)
.L188:
	addq	$1, 104(%rsp)
	movq	104(%rsp), %rax
	cmpl	%eax, 124(%rsp)
	jle	.L218
	movq	nets_to_update.4895(%rip), %rdx
	movq	net_block_moved.4896(%rip), %rcx
.L219:
	movq	104(%rsp), %rax
	movl	(%rcx,%rax,4), %ecx
	cmpl	$2, %ecx
	je	.L188
	movslq	(%rdx,%rax,4), %rbx
	leaq	(%rbx,%rbx,4), %r13
	movl	%ebx, 72(%rsp)
	salq	$3, %r13
	movq	%r13, %rdx
	addq	net(%rip), %rdx
	movslq	8(%rdx), %rax
	cmpl	$3, %eax
	jle	.L485
	movslq	128(%rsp), %rax
	movsd	%xmm4, (%rsp)
	salq	$4, %rax
	movq	%rax, %rdx
	movq	%rax, %rbp
	addq	bb_edge_new.4894(%rip), %rdx
	addq	bb_coord_new.4893(%rip), %rbp
	testl	%ecx, %ecx
	movq	%rax, 168(%rsp)
	je	.L486
	subq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 392
	movl	140(%rsp), %eax
	pushq	%rax
	.cfi_def_cfa_offset 400
	movl	152(%rsp), %r9d
	movl	192(%rsp), %r8d
	movl	196(%rsp), %ecx
	jmp	.L459
	.p2align 4,,10
	.p2align 3
.L153:
	.cfi_restore_state
	call	my_irand@PLT
	movl	32(%rsp), %edi
	leal	(%rdi,%rax), %edx
	movl	nx(%rip), %eax
	cmpl	%eax, %edx
	jg	.L487
	testl	%edx, %edx
	jle	.L488
	cmpl	%edx, %r15d
	je	.L164
	movl	132(%rsp), %edi
	movl	%edx, %r14d
	movl	%edi, 176(%rsp)
	jmp	.L299
	.p2align 4,,10
	.p2align 3
.L474:
	movl	56(%rsp), %edi
	call	my_irand@PLT
	movl	48(%rsp), %edi
	leal	(%rdi,%rax), %r12d
	movl	ny(%rip), %eax
	cmpl	%eax, %r12d
	jg	.L489
	xorl	%edx, %edx
	testl	%r12d, %r12d
	jg	.L150
	movl	72(%rsp), %edi
	xorl	%r12d, %r12d
	call	my_irand@PLT
	leal	1(%rax), %edx
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L438:
	cvttss2si	%xmm0, %eax
	movl	%eax, 24(%rsp)
	movl	%eax, %r10d
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L437:
	cvttss2si	%xmm0, %r12d
	jmp	.L125
.L145:
	movl	ny(%rip), %eax
	leal	-1(%rax), %edi
	call	my_irand@PLT
	leal	1(%rax), %r12d
	movl	nx(%rip), %eax
	leal	1(%rax), %edx
	jmp	.L147
.L478:
	testl	%eax, %eax
	jne	.L141
	movl	%eax, 80(%rsp)
	movl	ny(%rip), %eax
	leal	-1(%rax), %edi
	call	my_irand@PLT
	movl	80(%rsp), %edx
	leal	1(%rax), %r12d
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L485:
	movq	16(%rdx), %r11
	movslq	128(%rsp), %rcx
	movq	block(%rip), %r10
	movslq	(%r11), %rdx
	salq	$4, %rcx
	movq	%rcx, %rbp
	addq	bb_coord_new.4893(%rip), %rbp
	testl	%eax, %eax
	movq	%rcx, 168(%rsp)
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%r10,%rdx,8), %rdx
	movl	24(%rdx), %ecx
	movl	28(%rdx), %edx
	jle	.L318
	movslq	4(%r11), %rsi
	leaq	(%rsi,%rsi,4), %rsi
	leaq	(%r10,%rsi,8), %rdi
	movl	24(%rdi), %esi
	movl	28(%rdi), %r8d
	cmpl	%esi, %ecx
	movl	%esi, %edi
	cmovge	%ecx, %edi
	cmovg	%ecx, %edi
	cmovg	%esi, %ecx
	cmpl	%r8d, %edx
	movl	%r8d, %esi
	cmovge	%edx, %esi
	cmovg	%edx, %esi
	cmovg	%r8d, %edx
	cmpl	$1, %eax
	je	.L190
	movslq	8(%r11), %r8
	movl	%edi, %r13d
	leaq	(%r8,%r8,4), %r8
	leaq	(%r10,%r8,8), %r8
	movl	24(%r8), %r9d
	movl	28(%r8), %r8d
	cmpl	%edi, %r9d
	cmovge	%r9d, %r13d
	cmpl	%ecx, %r9d
	cmovge	%r13d, %edi
	cmpl	%r9d, %ecx
	cmovg	%r9d, %ecx
	cmpl	%esi, %r8d
	movl	%esi, %r9d
	cmovge	%r8d, %r9d
	cmpl	%edx, %r8d
	cmovge	%r9d, %esi
	cmpl	%r8d, %edx
	cmovg	%r8d, %edx
	cmpl	$3, %eax
	jne	.L190
	movslq	12(%r11), %r8
	leaq	(%r8,%r8,4), %r8
	leaq	(%r10,%r8,8), %r8
	movl	%edi, %r10d
	movl	24(%r8), %r9d
	movl	28(%r8), %r8d
	cmpl	%edi, %r9d
	cmovge	%r9d, %r10d
	cmpl	%ecx, %r9d
	cmovge	%r10d, %edi
	cmpl	%r9d, %ecx
	cmovg	%r9d, %ecx
	cmpl	%esi, %r8d
	movl	%esi, %r9d
	cmovge	%r8d, %r9d
	cmpl	%edx, %r8d
	cmovge	%r9d, %esi
	cmpl	%r8d, %edx
	cmovg	%r8d, %edx
.L190:
	movl	nx(%rip), %r8d
	movl	$1, %r9d
	cmpl	%ecx, %r8d
	cmovle	%r8d, %ecx
	testl	%ecx, %ecx
	cmovle	%r9d, %ecx
	movl	%ecx, 0(%rbp)
	movl	ny(%rip), %ecx
	cmpl	%edx, %ecx
	cmovle	%ecx, %edx
	testl	%edx, %edx
	cmovle	%r9d, %edx
	cmpl	%edi, %r8d
	cmovle	%r8d, %edi
	movl	%edx, 8(%rbp)
	testl	%edi, %edi
	cmovle	%r9d, %edi
	cmpl	%esi, %ecx
	cmovle	%ecx, %esi
	movl	%edi, 4(%rbp)
	testl	%esi, %esi
	cmovle	%r9d, %esi
	cmpl	$1, 144(%rsp)
	movl	%esi, 12(%rbp)
	je	.L193
	salq	$2, %rbx
	movq	%rbx, %rsi
	addq	temp_net_cost(%rip), %rsi
.L196:
	leaq	cross_count(%rip), %rdx
	movss	(%rdx,%rax,4), %xmm2
	jmp	.L197
	.p2align 4,,10
	.p2align 3
.L483:
	addq	%rcx, %r10
	movl	(%r10), %edi
	testl	%edi, %edi
	jne	.L180
.L311:
	movl	$2, (%r10)
	jmp	.L180
	.p2align 4,,10
	.p2align 3
.L440:
	movslq	%r9d, %rax
	addl	$1, %r9d
	movl	%edi, (%rdx,%rax,4)
	movl	$1, (%rcx,%rax,4)
	movss	%xmm1, (%rsi)
	jmp	.L174
.L193:
	salq	$4, %rbx
	addq	bb_coords(%rip), %rbx
	cmpl	$49, %eax
	movq	%rbx, %rdx
	jle	.L199
	pxor	%xmm3, %xmm3
	subl	$49, %eax
	cvtsi2sd	%eax, %xmm3
	mulsd	.LC5(%rip), %xmm3
	addsd	.LC6(%rip), %xmm3
	cvtsd2ss	%xmm3, %xmm3
.L200:
	pxor	%xmm0, %xmm0
	movl	384(%rsp), %ebx
	pxor	%xmm6, %xmm6
	pxor	%xmm7, %xmm7
	cvtsi2sd	(%rdx), %xmm0
	subsd	.LC7(%rip), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ss	nx(%rip), %xmm1
	cvtsd2ss	%xmm0, %xmm6
	pxor	%xmm0, %xmm0
	cvtsi2sd	4(%rdx), %xmm0
	addsd	.LC7(%rip), %xmm0
	movaps	%xmm6, %xmm8
	movss	%xmm6, 8(%rsp)
	pxor	%xmm6, %xmm6
	cvtsd2ss	%xmm0, %xmm6
	pxor	%xmm0, %xmm0
	cvtsi2sd	8(%rdx), %xmm0
	subsd	.LC7(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm7
	pxor	%xmm0, %xmm0
	movss	%xmm6, 16(%rsp)
	cvtsi2sd	12(%rdx), %xmm0
	addsd	.LC7(%rip), %xmm0
	leal	-1(%rbx), %edx
	movaps	%xmm7, %xmm9
	movss	%xmm7, 24(%rsp)
	pxor	%xmm7, %xmm7
	cvtsd2ss	%xmm0, %xmm7
	pxor	%xmm0, %xmm0
	cvtsi2ss	384(%rsp), %xmm0
	movss	%xmm7, 32(%rsp)
	movaps	%xmm0, %xmm5
	divss	%xmm1, %xmm5
	pxor	%xmm1, %xmm1
	cvtsi2ss	ny(%rip), %xmm1
	movss	%xmm5, 40(%rsp)
	divss	%xmm1, %xmm0
	movaps	%xmm8, %xmm1
	movaps	%xmm0, %xmm2
	movss	%xmm0, 48(%rsp)
	pxor	%xmm0, %xmm0
	cvtss2sd	%xmm1, %xmm0
	subsd	.LC7(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	%xmm5, %xmm0
	cvttss2si	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtss2sd	%xmm6, %xmm0
	subsd	.LC7(%rip), %xmm0
	movl	%eax, %edi
	movl	%eax, 116(%rsp)
	cvttsd2si	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	%xmm5, %xmm0
	movaps	%xmm9, %xmm5
	cvttss2si	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtss2sd	%xmm5, %xmm0
	subsd	.LC7(%rip), %xmm0
	cmpl	%eax, %ebx
	cmovle	%edx, %eax
	movl	%eax, %ebx
	movl	%eax, 148(%rsp)
	cvttsd2si	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtss2sd	%xmm7, %xmm0
	subsd	.LC7(%rip), %xmm0
	movl	%eax, 140(%rsp)
	cvttsd2si	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %eax
	movaps	%xmm6, %xmm0
	movss	.LC8(%rip), %xmm6
	subss	%xmm8, %xmm0
	divss	%xmm0, %xmm6
	movaps	%xmm7, %xmm0
	movss	.LC8(%rip), %xmm7
	cmpl	%eax, 384(%rsp)
	subss	%xmm9, %xmm0
	cmovg	%eax, %edx
	cmpl	%ebx, %edi
	movl	%edx, (%rsp)
	divss	%xmm0, %xmm7
	movss	%xmm6, 56(%rsp)
	movss	%xmm7, 64(%rsp)
	jg	.L204
	movl	140(%rsp), %ebx
	cmpl	%edx, %ebx
	jg	.L217
	movslq	116(%rsp), %rax
	leaq	0(,%rax,8), %r13
	leaq	4(,%rax,4), %r15
	movslq	%ebx, %rax
	movq	%rax, %rbx
	leaq	4(,%rax,4), %rax
	salq	$4, %rbx
	movq	%rax, 152(%rsp)
	movq	%r13, %rax
	movq	%rbx, 160(%rsp)
	movq	%r15, %r13
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L216:
	leaq	-4(%r13), %rbx
	movq	%r15, %rax
	movq	152(%rsp), %rbp
	movq	%r13, %r15
	movq	160(%rsp), %r12
	movl	140(%rsp), %r14d
	movq	%rbx, %r13
	movq	%rax, %rbx
	jmp	.L215
	.p2align 4,,10
	.p2align 3
.L211:
	pxor	%xmm0, %xmm0
	cvtss2sd	%xmm2, %xmm0
	ucomisd	%xmm0, %xmm4
	ja	.L490
.L213:
	movaps	%xmm2, %xmm0
	movq	place_region_x(%rip), %rax
	movq	%r12, %rsi
	movq	%r12, %rcx
	addl	$1, %r14d
	addq	$16, %r12
	mulss	%xmm3, %xmm0
	addq	$4, %rbp
	addq	(%rax,%rbx), %rsi
	mulss	%xmm1, %xmm0
	mulss	%xmm3, %xmm1
	movss	8(%rsi), %xmm5
	movq	%rsi, %rax
	mulss	64(%rsp), %xmm0
	mulss	%xmm2, %xmm1
	mulss	56(%rsp), %xmm1
	mulss	40(%rsp), %xmm0
	mulss	48(%rsp), %xmm1
	subss	%xmm0, %xmm5
	movss	%xmm5, 8(%rax)
	movq	place_region_y(%rip), %rax
	addq	(%rax,%rbx), %rcx
	cmpl	(%rsp), %r14d
	movss	8(%rcx), %xmm0
	subss	%xmm1, %xmm0
	movss	%xmm0, 8(%rcx)
	jg	.L491
.L215:
	movq	place_region_bounds_x(%rip), %rax
	movss	16(%rsp), %xmm1
	movss	32(%rsp), %xmm2
	movss	(%rax,%r13), %xmm5
	minss	(%rax,%r15), %xmm1
	movq	place_region_bounds_y(%rip), %rax
	maxss	8(%rsp), %xmm5
	movss	-4(%rax,%rbp), %xmm0
	minss	(%rax,%rbp), %xmm2
	maxss	24(%rsp), %xmm0
	subss	%xmm5, %xmm1
	subss	%xmm0, %xmm2
	pxor	%xmm0, %xmm0
	cvtss2sd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm4
	jbe	.L211
	movl	72(%rsp), %esi
	leaq	.LC10(%rip), %rdi
	movl	$1, %eax
	movss	%xmm3, 112(%rsp)
	movsd	%xmm4, 96(%rsp)
	movss	%xmm2, 88(%rsp)
	movss	%xmm1, 80(%rsp)
	call	printf@PLT
	pxor	%xmm0, %xmm0
	movss	88(%rsp), %xmm2
	movsd	96(%rsp), %xmm4
	cvtss2sd	%xmm2, %xmm0
	movss	112(%rsp), %xmm3
	ucomisd	%xmm0, %xmm4
	movss	80(%rsp), %xmm1
	jbe	.L213
.L490:
	movl	72(%rsp), %esi
	leaq	.LC11(%rip), %rdi
	movl	$1, %eax
	movss	%xmm3, 112(%rsp)
	movsd	%xmm4, 96(%rsp)
	movss	%xmm2, 88(%rsp)
	movss	%xmm1, 80(%rsp)
	call	printf@PLT
	movss	112(%rsp), %xmm3
	movsd	96(%rsp), %xmm4
	movss	88(%rsp), %xmm2
	movss	80(%rsp), %xmm1
	jmp	.L213
	.p2align 4,,10
	.p2align 3
.L491:
	movq	%r15, %r13
	addl	$1, 116(%rsp)
	movq	%rbx, %r15
	movl	116(%rsp), %eax
	addq	$8, %r15
	addq	$4, %r13
	cmpl	148(%rsp), %eax
	jle	.L216
.L217:
	movq	168(%rsp), %rbp
	addq	bb_coord_new.4893(%rip), %rbp
.L204:
	movl	384(%rsp), %edx
	movl	72(%rsp), %edi
	movq	%rbp, %rsi
	movsd	%xmm4, (%rsp)
	call	update_region_occ.constprop.5
	movsd	(%rsp), %xmm4
	jmp	.L198
.L218:
	cmpl	$1, 144(%rsp)
	movl	180(%rsp), %r14d
	je	.L492
.L220:
	movl	400(%rsp), %eax
	subl	$1, %eax
	cmpl	$1, %eax
	movl	%eax, 32(%rsp)
	jbe	.L493
	movss	192(%rsp), %xmm4
	ucomiss	120(%rsp), %xmm4
	jnb	.L494
	movaps	%xmm4, %xmm1
	movss	120(%rsp), %xmm4
	movss	%xmm4, 16(%rsp)
	movaps	%xmm1, %xmm2
.L307:
	movss	272(%rsp), %xmm4
	ucomiss	192(%rsp), %xmm4
	jp	.L245
	jne	.L245
.L251:
	movl	124(%rsp), %eax
	testl	%eax, %eax
	je	.L292
	movl	124(%rsp), %ebx
	movq	nets_to_update.4895(%rip), %rax
	movq	temp_net_cost(%rip), %rsi
	movss	.LC21(%rip), %xmm0
	leal	-1(%rbx), %edx
	leaq	4(%rax,%rdx,4), %rcx
	.p2align 4,,10
	.p2align 3
.L291:
	movslq	(%rax), %rdx
	addq	$4, %rax
	cmpq	%rax, %rcx
	movss	%xmm0, (%rsi,%rdx,4)
	jne	.L291
.L292:
	movq	block(%rip), %rax
	movq	184(%rsp), %rdx
	movl	136(%rsp), %ebx
	addq	%rax, %rdx
	cmpl	$-1, 200(%rsp)
	movl	%ebx, 24(%rdx)
	movl	132(%rsp), %ebx
	movl	%ebx, 28(%rdx)
	movl	204(%rsp), %ebx
	movl	%ebx, 32(%rdx)
	je	.L249
	addq	208(%rsp), %rax
	movl	176(%rsp), %ebx
	movl	%ebx, 28(%rax)
	movl	304(%rsp), %ebx
	movl	%r14d, 24(%rax)
	movl	%ebx, 32(%rax)
.L249:
	cmpl	$1, 144(%rsp)
	je	.L495
.L136:
	xorl	%eax, %eax
.L116:
	addq	$328, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L475:
	.cfi_restore_state
	movl	56(%rsp), %edi
	call	my_irand@PLT
	movl	48(%rsp), %edi
	leal	(%rdi,%rax), %r12d
	movl	ny(%rip), %eax
	cmpl	%eax, %r12d
	jg	.L496
	testl	%r12d, %r12d
	movl	%r15d, %edx
	jg	.L150
	movl	nx(%rip), %r12d
	movl	72(%rsp), %edi
	call	my_irand@PLT
	movl	%r12d, %edx
	xorl	%r12d, %r12d
	subl	%eax, %edx
	jmp	.L147
.L487:
	movl	ny(%rip), %r12d
	movl	64(%rsp), %edi
	leal	1(%rax), %edx
	movl	%edx, 80(%rsp)
	call	my_irand@PLT
	movl	80(%rsp), %edx
	subl	%eax, %r12d
	jmp	.L147
.L476:
	movl	64(%rsp), %edi
	leal	1(%rax), %edx
	movl	%edx, 80(%rsp)
	call	my_irand@PLT
	movl	80(%rsp), %edx
	leal	1(%rax), %r12d
	jmp	.L147
.L480:
	movq	$0, 256(%rsp)
	movl	$0, 304(%rsp)
	movq	256(%rsp), %rbx
	jmp	.L297
.L489:
	movl	72(%rsp), %edi
	leal	1(%rax), %r12d
	call	my_irand@PLT
	leal	1(%rax), %edx
	jmp	.L147
.L120:
	movslq	196(%rsp), %rax
	movq	IO_TYPE(%rip), %rcx
	movq	%rax, 216(%rsp)
	leaq	(%rax,%rax,4), %rax
	salq	$3, %rax
	movq	%rax, 184(%rsp)
	addq	block(%rip), %rax
	movq	8(%rax), %rbx
	cmpq	%rcx, %rbx
	jne	.L121
	.p2align 4,,10
	.p2align 3
.L386:
	movl	num_blocks(%rip), %eax
	leal	-1(%rax), %edi
	call	my_irand@PLT
	movslq	%eax, %rsi
	movq	IO_TYPE(%rip), %rcx
	leaq	(%rsi,%rsi,4), %rdx
	salq	$3, %rdx
	movq	%rdx, %rdi
	addq	block(%rip), %rdi
	movq	8(%rdi), %rbx
	cmpq	%rcx, %rbx
	je	.L386
	movl	%eax, 196(%rsp)
	movq	%rsi, 216(%rsp)
	movq	%rdi, %rax
	movq	%rdx, 184(%rsp)
	jmp	.L121
.L141:
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L142:
	movl	nx(%rip), %eax
	leal	-1(%rax), %edi
	call	my_irand@PLT
	leal	1(%rax), %edx
	movl	ny(%rip), %eax
	leal	1(%rax), %r12d
	jmp	.L147
.L472:
	movl	16(%rbx), %esi
	movl	%r8d, %eax
	subl	%ebp, %eax
	cltd
	idivl	%esi
	cmpl	$1, %eax
	jle	.L136
	movl	ny(%rip), %edx
	movl	%edx, %eax
	shrl	$31, %eax
	addl	%edx, %eax
	sarl	%eax
	cmpl	%eax, %esi
	jle	.L129
	jmp	.L136
.L199:
	leaq	cross_count(%rip), %rcx
	movss	(%rcx,%rax,4), %xmm3
	jmp	.L200
.L314:
	xorl	%r15d, %r15d
	jmp	.L129
.L245:
	movss	%xmm1, 24(%rsp)
	movss	%xmm2, 8(%rsp)
	call	my_frand@PLT
	movss	120(%rsp), %xmm4
	xorps	.LC20(%rip), %xmm4
	movss	%xmm0, (%rsp)
	movaps	%xmm4, %xmm0
	divss	272(%rsp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	exp@PLT
	cvtsd2ss	%xmm0, %xmm0
	ucomiss	(%rsp), %xmm0
	movss	8(%rsp), %xmm2
	movss	24(%rsp), %xmm1
	jbe	.L251
	movq	232(%rsp), %rax
	movss	120(%rsp), %xmm0
	cmpl	$1, 32(%rsp)
	addss	(%rax), %xmm0
	movss	%xmm0, (%rax)
	movq	224(%rsp), %rax
	movss	16(%rsp), %xmm0
	addss	(%rax), %xmm0
	movss	%xmm0, (%rax)
	jbe	.L298
.L461:
	movq	grid(%rip), %r12
.L305:
	movl	124(%rsp), %r13d
	testl	%r13d, %r13d
	je	.L290
	movq	nets_to_update.4895(%rip), %r10
	movq	net_block_moved.4896(%rip), %r9
	xorl	%edx, %edx
	movq	temp_net_cost(%rip), %r11
	xorl	%edi, %edi
	movl	124(%rsp), %r8d
	movss	.LC21(%rip), %xmm0
	jmp	.L289
	.p2align 4,,10
	.p2align 3
.L286:
	movq	bb_coord_new.4893(%rip), %rcx
	movslq	%edi, %rsi
	movq	%rax, %rbx
	salq	$4, %rsi
	salq	$4, %rbx
	movq	net(%rip), %rbp
	movq	(%rcx,%rsi), %r13
	movq	8(%rcx,%rsi), %r14
	movq	bb_coords(%rip), %rcx
	movq	%r13, (%rcx,%rbx)
	movq	%r14, 8(%rcx,%rbx)
	leaq	(%rax,%rax,4), %rcx
	leaq	0(%rbp,%rcx,8), %rcx
	cmpl	$3, 8(%rcx)
	jle	.L288
	movq	bb_edge_new.4894(%rip), %rcx
	movq	(%rcx,%rsi), %r13
	movq	8(%rcx,%rsi), %r14
	movq	bb_num_on_edges(%rip), %rcx
	movq	%r13, (%rcx,%rbx)
	movq	%r14, 8(%rcx,%rbx)
.L288:
	leaq	(%r11,%rax,4), %rcx
	movq	net_cost(%rip), %rsi
	addq	$1, %rdx
	addl	$1, %edi
	cmpl	%edx, %r8d
	movss	(%rcx), %xmm1
	movss	%xmm1, (%rsi,%rax,4)
	movss	%xmm0, (%rcx)
	jle	.L290
.L289:
	cmpl	$2, (%r9,%rdx,4)
	movslq	(%r10,%rdx,4), %rax
	jne	.L286
	addq	$1, %rdx
	movss	%xmm0, (%r11,%rax,4)
	cmpl	%edx, %r8d
	jg	.L289
.L290:
	movq	288(%rsp), %rax
	movq	296(%rsp), %rdx
	movq	256(%rsp), %rbx
	movl	196(%rsp), %edi
	movslq	136(%rsp), %rsi
	addq	(%r12,%rax,8), %rdx
	movq	16(%rdx), %rax
	movl	%edi, (%rax,%rbx)
	movslq	132(%rsp), %rax
	movl	200(%rsp), %ebx
	leaq	(%rax,%rax,2), %rcx
	movq	(%r12,%rsi,8), %rax
	movslq	204(%rsp), %rsi
	cmpl	$-1, %ebx
	leaq	(%rax,%rcx,8), %rax
	movq	16(%rax), %rcx
	movl	%ebx, (%rcx,%rsi,4)
	je	.L497
.L462:
	movl	$1, %eax
	jmp	.L116
.L481:
	movq	184(%rsp), %rax
	movl	176(%rsp), %ebx
	movq	$-40, 208(%rsp)
	movq	$-1, 312(%rsp)
	addq	%r13, %rax
	movl	%ebx, 28(%rax)
	movl	304(%rsp), %ebx
	movl	%r14d, 24(%rax)
	movl	%ebx, 32(%rax)
	jmp	.L169
.L492:
	movl	384(%rsp), %eax
	testl	%eax, %eax
	jle	.L319
	movl	384(%rsp), %eax
	movq	place_region_x(%rip), %rbp
	movq	place_region_y(%rip), %r12
	leal	-1(%rax), %r13d
	movl	%eax, %r8d
.L310:
	pxor	%xmm0, %xmm0
	movl	%r13d, %edi
	xorl	%esi, %esi
	addq	$1, %rdi
	salq	$4, %rdi
	movaps	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L230:
	movq	0(%rbp,%rsi,8), %rax
	movq	(%r12,%rsi,8), %rdx
	leaq	(%rax,%rdi), %rcx
	.p2align 4,,10
	.p2align 3
.L222:
	movss	8(%rax), %xmm2
	movss	(%rax), %xmm0
	ucomiss	%xmm2, %xmm0
	mulss	4(%rax), %xmm2
	ja	.L460
	mulss	%xmm2, %xmm2
.L460:
	addss	%xmm1, %xmm2
	movss	(%rdx), %xmm0
	movss	8(%rdx), %xmm1
	ucomiss	%xmm1, %xmm0
	mulss	4(%rdx), %xmm1
	jbe	.L443
	addq	$16, %rax
	addq	$16, %rdx
	addss	%xmm2, %xmm1
	cmpq	%rcx, %rax
	jne	.L222
	addq	$1, %rsi
	cmpl	%esi, %r8d
	jg	.L230
.L498:
	movaps	%xmm1, %xmm0
.L221:
	movq	224(%rsp), %rax
	subss	(%rax), %xmm0
	movss	%xmm0, 120(%rsp)
	jmp	.L220
	.p2align 4,,10
	.p2align 3
.L443:
	mulss	%xmm1, %xmm1
	addq	$16, %rax
	addq	$16, %rdx
	cmpq	%rax, %rcx
	addss	%xmm2, %xmm1
	jne	.L222
	addq	$1, %rsi
	cmpl	%esi, %r8d
	jg	.L230
	jmp	.L498
.L488:
	movl	24(%rsp), %edi
	movl	ny(%rip), %r15d
	subl	$1, %edi
	call	my_irand@PLT
	subl	%eax, %r15d
	movl	%r15d, 176(%rsp)
.L156:
	xorl	%r14d, %r14d
	movl	nx(%rip), %eax
	jmp	.L299
.L496:
	leal	1(%rax), %r12d
	movl	72(%rsp), %edi
	movl	nx(%rip), %eax
	movl	%eax, 80(%rsp)
	call	my_irand@PLT
	movl	80(%rsp), %edx
	subl	%eax, %edx
	jmp	.L147
.L477:
	movl	24(%rsp), %edi
	subl	$1, %edi
	call	my_irand@PLT
	addl	$1, %eax
	movl	%eax, 176(%rsp)
	jmp	.L156
.L313:
	xorl	%edx, %edx
	jmp	.L117
.L318:
	movl	%edx, %esi
	movl	%ecx, %edi
	jmp	.L190
.L177:
	movl	(%rcx), %esi
	testl	%esi, %esi
	jne	.L174
	movq	%rcx, %r10
	jmp	.L311
.L133:
	leaq	__PRETTY_FUNCTION__.4987(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	movl	$1717, %edx
	call	__assert_fail@PLT
.L470:
	leal	(%rdx,%rdx), %ebx
	movslq	%ebx, %rbx
	movq	%rbx, %rbp
	salq	$2, %rbx
	salq	$4, %rbp
	movq	%rbp, %rdi
	call	my_malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, bb_coord_new.4893(%rip)
	call	my_malloc@PLT
	movq	%rbx, %rdi
	movq	%rax, bb_edge_new.4894(%rip)
	call	my_malloc@PLT
	movq	%rbx, %rdi
	movq	%rax, nets_to_update.4895(%rip)
	call	my_malloc@PLT
	movq	%rax, net_block_moved.4896(%rip)
	jmp	.L119
.L312:
	movl	384(%rsp), %esi
	testl	%esi, %esi
	jle	.L184
	movl	384(%rsp), %eax
	movl	%r14d, (%rsp)
	xorl	%ebx, %ebx
	movq	place_region_x(%rip), %rbp
	movq	place_region_y(%rip), %r12
	movq	240(%rsp), %r10
	movq	248(%rsp), %r14
	subl	$1, %eax
	movl	384(%rsp), %r15d
	leaq	4(,%rax,4), %r11
	movq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L186:
	movq	(%r10,%rbx,8), %r9
	movq	0(%rbp,%rbx,8), %r8
	xorl	%eax, %eax
	movq	(%r14,%rbx,8), %rdi
	movq	(%r12,%rbx,8), %rsi
	.p2align 4,,10
	.p2align 3
.L185:
	movss	8(%r8,%rax,4), %xmm0
	movss	%xmm0, (%r9,%rax)
	movss	8(%rsi,%rax,4), %xmm0
	movss	%xmm0, (%rdi,%rax)
	addq	$4, %rax
	cmpq	%rax, %r11
	jne	.L185
	addq	$1, %rbx
	cmpl	%ebx, %r15d
	jg	.L186
	movl	124(%rsp), %eax
	movl	(%rsp), %r14d
	testl	%eax, %eax
	jne	.L302
	movl	384(%rsp), %r8d
	jmp	.L310
	.p2align 4,,10
	.p2align 3
.L497:
	addl	$1, 12(%rdx)
	subl	$1, 12(%rax)
	jmp	.L462
.L493:
	movss	120(%rsp), %xmm4
	movss	%xmm4, 16(%rsp)
.L309:
	movl	308(%rsp), %eax
	testl	%eax, %eax
	jle	.L320
	movq	216(%rsp), %rbx
	subl	$1, %eax
	xorl	%r12d, %r12d
	movss	192(%rsp), %xmm2
	leaq	4(,%rax,4), %rax
	movss	%xmm2, (%rsp)
	movl	%r14d, 56(%rsp)
	leaq	0(,%rbx,8), %r15
	movss	%xmm2, 8(%rsp)
	movq	%rax, 24(%rsp)
	movq	%r15, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L237:
	movq	block(%rip), %rax
	movq	184(%rsp), %rbx
	movq	16(%rax,%rbx), %rax
	movl	(%rax,%r12), %ebp
	cmpl	$-1, %ebp
	je	.L233
	movslq	%ebp, %rdx
	leaq	(%rdx,%rdx,4), %rbx
	salq	$3, %rbx
	movq	%rbx, %rsi
	addq	net(%rip), %rsi
	movl	32(%rsi), %eax
	testl	%eax, %eax
	jne	.L233
	movq	net_pin_index(%rip), %rax
	movq	40(%rsp), %rdi
	movq	(%rax,%rdi), %rax
	movl	(%rax,%r12), %eax
	testl	%eax, %eax
	jne	.L234
	movl	8(%rsi), %eax
	leaq	0(,%rdx,8), %r14
	movl	$4, %r13d
	movl	$1, %r15d
	testl	%eax, %eax
	jle	.L233
	.p2align 4,,10
	.p2align 3
.L385:
	movl	%r15d, %esi
	movl	%ebp, %edi
	addl	$1, %r15d
	call	comp_td_point_to_point_delay
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movq	%r13, %rdi
	movq	timing_place_crit(%rip), %rdx
	addq	(%rax,%r14), %rdi
	movq	(%rdx,%r14), %rdx
	movq	point_to_point_timing_cost(%rip), %rax
	movss	%xmm0, (%rdi)
	movq	(%rax,%r14), %rax
	mulss	(%rdx,%r13), %xmm0
	movq	temp_point_to_point_timing_cost(%rip), %rdx
	movq	(%rdx,%r14), %rdx
	movss	%xmm0, (%rdx,%r13)
	movq	point_to_point_delay_cost(%rip), %rdx
	movss	(%rdi), %xmm1
	movq	(%rdx,%r14), %rdx
	subss	(%rax,%r13), %xmm0
	movq	net(%rip), %rax
	subss	(%rdx,%r13), %xmm1
	addq	$4, %r13
	cmpl	8(%rax,%rbx), %r15d
	addss	8(%rsp), %xmm0
	addss	(%rsp), %xmm1
	movss	%xmm0, 8(%rsp)
	movss	%xmm1, (%rsp)
	jle	.L385
	.p2align 4,,10
	.p2align 3
.L233:
	addq	$4, %r12
	cmpq	%r12, 24(%rsp)
	jne	.L237
	xorl	%ebx, %ebx
	cmpl	$-1, 200(%rsp)
	movq	312(%rsp), %rax
	movss	(%rsp), %xmm2
	movl	56(%rsp), %r14d
	movss	8(%rsp), %xmm1
	leaq	0(,%rax,8), %r15
	je	.L232
	movss	%xmm2, (%rsp)
	movq	%r15, 40(%rsp)
	movl	%r14d, 48(%rsp)
	movss	%xmm1, 8(%rsp)
	movq	%r12, 24(%rsp)
	movq	%rbx, %r13
	.p2align 4,,10
	.p2align 3
.L383:
	movq	208(%rsp), %rbx
	movq	block(%rip), %rax
	movq	16(%rax,%rbx), %rax
	movl	(%rax,%r13), %ebx
	cmpl	$-1, %ebx
	je	.L239
	movslq	%ebx, %rdx
	leaq	(%rdx,%rdx,4), %rbp
	salq	$3, %rbp
	movq	%rbp, %rsi
	addq	net(%rip), %rsi
	movl	32(%rsi), %eax
	testl	%eax, %eax
	jne	.L239
	movq	net_pin_index(%rip), %rax
	movq	40(%rsp), %rdi
	movq	(%rax,%rdi), %rax
	movl	(%rax,%r13), %eax
	testl	%eax, %eax
	jne	.L240
	movl	8(%rsi), %eax
	leaq	0(,%rdx,8), %r12
	movl	$4, %r14d
	movl	$1, %r15d
	testl	%eax, %eax
	jle	.L239
	.p2align 4,,10
	.p2align 3
.L384:
	movl	%r15d, %esi
	movl	%ebx, %edi
	addl	$1, %r15d
	call	comp_td_point_to_point_delay
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movq	%r14, %rdi
	movq	timing_place_crit(%rip), %rdx
	addq	(%rax,%r12), %rdi
	movq	(%rdx,%r12), %rdx
	movq	point_to_point_timing_cost(%rip), %rax
	movss	%xmm0, (%rdi)
	movq	(%rax,%r12), %rax
	mulss	(%rdx,%r14), %xmm0
	movq	temp_point_to_point_timing_cost(%rip), %rdx
	movq	(%rdx,%r12), %rdx
	movss	%xmm0, (%rdx,%r14)
	movq	point_to_point_delay_cost(%rip), %rdx
	movss	(%rdi), %xmm3
	movq	(%rdx,%r12), %rdx
	subss	(%rax,%r14), %xmm0
	movq	net(%rip), %rax
	subss	(%rdx,%r14), %xmm3
	addq	$4, %r14
	cmpl	8(%rax,%rbp), %r15d
	addss	8(%rsp), %xmm0
	addss	(%rsp), %xmm3
	movss	%xmm0, 8(%rsp)
	movss	%xmm3, (%rsp)
	jle	.L384
	.p2align 4,,10
	.p2align 3
.L239:
	addq	$4, %r13
	cmpq	%r13, 24(%rsp)
	jne	.L383
	movl	48(%rsp), %r14d
	movss	(%rsp), %xmm2
	movss	8(%rsp), %xmm1
.L232:
	movss	276(%rsp), %xmm4
	movss	.LC8(%rip), %xmm0
	subss	%xmm4, %xmm0
	mulss	%xmm1, %xmm4
	movss	284(%rsp), %xmm3
	mulss	16(%rsp), %xmm0
	mulss	%xmm4, %xmm3
	movss	192(%rsp), %xmm4
	mulss	280(%rsp), %xmm0
	addss	%xmm3, %xmm0
	ucomiss	%xmm0, %xmm4
	movss	%xmm0, 120(%rsp)
	jb	.L307
	movq	232(%rsp), %rax
	addss	(%rax), %xmm0
	movss	%xmm0, (%rax)
	movq	224(%rsp), %rax
	movss	16(%rsp), %xmm0
	addss	(%rax), %xmm0
	movss	%xmm0, (%rax)
.L298:
	movq	264(%rsp), %rax
	movl	308(%rsp), %r15d
	addss	(%rax), %xmm1
	testl	%r15d, %r15d
	movss	%xmm1, (%rax)
	movq	408(%rsp), %rax
	addss	(%rax), %xmm2
	movss	%xmm2, (%rax)
	jle	.L461
	movq	block(%rip), %rax
	movq	184(%rsp), %rbx
	xorl	%r15d, %r15d
	movss	.LC21(%rip), %xmm2
	movaps	%xmm2, %xmm3
	movaps	.LC22(%rip), %xmm5
	movq	16(%rax,%rbx), %rbp
	movq	%rax, 72(%rsp)
	movq	net(%rip), %rax
	movq	216(%rsp), %rbx
	movaps	%xmm2, %xmm1
	movaps	%xmm2, %xmm0
	movq	%rax, (%rsp)
	movq	net_pin_index(%rip), %rax
	movq	%rax, 88(%rsp)
	leaq	(%rax,%rbx,8), %rax
	movq	%rax, 48(%rsp)
	movq	point_to_point_delay_cost(%rip), %rax
	movq	%rax, 32(%rsp)
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movq	%rax, 24(%rsp)
	movq	point_to_point_timing_cost(%rip), %rax
	movq	%rax, 16(%rsp)
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movq	%rax, 40(%rsp)
	movl	308(%rsp), %eax
	subl	$1, %eax
	leaq	4(,%rax,4), %rax
	movq	%rax, 8(%rsp)
	jmp	.L267
.L500:
	movl	8(%rax), %r8d
	testl	%r8d, %r8d
	jle	.L254
	movq	16(%rsp), %rbx
	movq	32(%rsp), %rax
	movq	(%rbx,%rdx,8), %rdi
	movq	(%rax,%rdx,8), %rsi
	movq	24(%rsp), %rax
	movq	40(%rsp), %rbx
	leaq	20(%rdi), %r11
	leaq	4(%rsi), %r13
	leaq	20(%rsi), %r12
	movq	(%rax,%rdx,8), %rax
	leaq	4(%rdi), %r10
	movq	(%rbx,%rdx,8), %rdx
	movq	%r11, %r14
	cmpq	%r13, %r14
	movq	%r14, 56(%rsp)
	setbe	64(%rsp)
	cmpq	%r12, %r10
	leaq	20(%rax), %rbx
	setnb	%r14b
	orb	64(%rsp), %r14b
	leaq	4(%rax), %rcx
	cmpq	%rbx, %r13
	leaq	20(%rdx), %r11
	leaq	4(%rdx), %r9
	setnb	80(%rsp)
	cmpq	%r12, %rcx
	movb	%r14b, 64(%rsp)
	setnb	%r14b
	orb	80(%rsp), %r14b
	andb	64(%rsp), %r14b
	cmpl	$9, %r8d
	seta	64(%rsp)
	andb	64(%rsp), %r14b
	cmpq	%r13, %r11
	setbe	%r13b
	cmpq	%r12, %r9
	setnb	%r12b
	orl	%r13d, %r12d
	andl	%r12d, %r14d
	cmpq	%rcx, 56(%rsp)
	setbe	%r12b
	cmpq	%rbx, %r10
	setnb	%r13b
	orl	%r13d, %r12d
	andl	%r12d, %r14d
	cmpq	%rcx, %r11
	setbe	%r12b
	cmpq	%rbx, %r9
	setnb	%bl
	orl	%r12d, %ebx
	testb	%bl, %r14b
	je	.L258
	cmpq	%r10, %r11
	setbe	%r10b
	cmpq	56(%rsp), %r9
	setnb	%r9b
	orb	%r9b, %r10b
	je	.L258
	shrq	$2, %rcx
	movq	%rcx, %r9
	movl	$1, %ecx
	negq	%r9
	andl	$3, %r9d
	je	.L259
	movss	4(%rax), %xmm4
	cmpl	$1, %r9d
	movl	$2, %ecx
	movss	%xmm4, 4(%rsi)
	movss	%xmm0, 4(%rax)
	movss	4(%rdx), %xmm4
	movss	%xmm4, 4(%rdi)
	movss	%xmm0, 4(%rdx)
	je	.L259
	movss	8(%rax), %xmm4
	cmpl	$3, %r9d
	movl	$3, %ecx
	movss	%xmm4, 8(%rsi)
	movss	%xmm0, 8(%rax)
	movss	8(%rdx), %xmm4
	movss	%xmm4, 8(%rdi)
	movss	%xmm0, 8(%rdx)
	jne	.L259
	movss	12(%rax), %xmm4
	movl	$4, %ecx
	movss	%xmm4, 12(%rsi)
	movss	%xmm0, 12(%rax)
	movss	12(%rdx), %xmm4
	movss	%xmm4, 12(%rdi)
	movss	%xmm0, 12(%rdx)
.L259:
	movl	%r8d, %ebx
	movq	%rax, 80(%rsp)
	subl	%r9d, %ebx
	movl	%r9d, %r9d
	leaq	4(,%r9,4), %r9
	leal	-4(%rbx), %r10d
	leaq	(%rsi,%r9), %r11
	shrl	$2, %r10d
	leaq	(%rax,%r9), %r14
	addl	$1, %r10d
	leaq	(%rdx,%r9), %r13
	movq	%r11, 64(%rsp)
	leaq	(%rdi,%r9), %r11
	leal	0(,%r10,4), %r12d
	xorl	%r9d, %r9d
	movq	%r11, 56(%rsp)
	xorl	%r11d, %r11d
.L261:
	movq	64(%rsp), %rax
	addl	$1, %r11d
	movaps	(%r14,%r9), %xmm4
	movups	%xmm4, (%rax,%r9)
	movq	56(%rsp), %rax
	movaps	%xmm5, (%r14,%r9)
	movups	0(%r13,%r9), %xmm4
	movups	%xmm4, (%rax,%r9)
	movups	%xmm5, 0(%r13,%r9)
	addq	$16, %r9
	cmpl	%r11d, %r10d
	ja	.L261
	addl	%r12d, %ecx
	cmpl	%ebx, %r12d
	movq	80(%rsp), %rax
	je	.L254
	movslq	%ecx, %r10
	leaq	0(,%r10,4), %r9
	leaq	(%rax,%r9), %r11
	addq	%rdx, %r9
	movss	(%r11), %xmm4
	movss	%xmm4, (%rsi,%r10,4)
	movss	%xmm1, (%r11)
	movss	(%r9), %xmm4
	movss	%xmm4, (%rdi,%r10,4)
	movss	%xmm1, (%r9)
	leal	1(%rcx), %r9d
	cmpl	%r9d, %r8d
	jl	.L254
	movslq	%r9d, %r9
	addl	$2, %ecx
	leaq	0(,%r9,4), %r10
	leaq	(%rax,%r10), %r11
	addq	%rdx, %r10
	cmpl	%ecx, %r8d
	movss	(%r11), %xmm4
	movss	%xmm4, (%rsi,%r9,4)
	movss	%xmm1, (%r11)
	movss	(%r10), %xmm4
	movss	%xmm4, (%rdi,%r9,4)
	movss	%xmm1, (%r10)
	jl	.L254
	movslq	%ecx, %rcx
	leaq	0(,%rcx,4), %r8
	addq	%r8, %rax
	addq	%r8, %rdx
	movss	(%rax), %xmm4
	movss	%xmm4, (%rsi,%rcx,4)
	movss	%xmm1, (%rax)
	movss	(%rdx), %xmm4
	movss	%xmm4, (%rdi,%rcx,4)
	movss	%xmm1, (%rdx)
.L254:
	addq	$4, %r15
	cmpq	8(%rsp), %r15
	je	.L499
.L267:
	movslq	0(%rbp,%r15), %rdx
	cmpl	$-1, %edx
	je	.L254
	movq	(%rsp), %rbx
	leaq	(%rdx,%rdx,4), %rax
	leaq	(%rbx,%rax,8), %rax
	movl	32(%rax), %r14d
	testl	%r14d, %r14d
	jne	.L254
	movq	48(%rsp), %rbx
	movq	(%rbx), %rcx
	movslq	(%rcx,%r15), %rcx
	testl	%ecx, %ecx
	je	.L500
	movq	16(%rax), %rax
	movl	(%rax), %eax
	cmpl	%eax, 200(%rsp)
	je	.L254
	cmpl	%eax, 196(%rsp)
	je	.L254
	movq	24(%rsp), %rbx
	leaq	0(,%rcx,4), %rax
	movq	%rax, %rsi
	addq	(%rbx,%rdx,8), %rsi
	movq	32(%rsp), %rbx
	movq	(%rbx,%rdx,8), %rdi
	movq	40(%rsp), %rbx
	movss	(%rsi), %xmm4
	addq	(%rbx,%rdx,8), %rax
	movq	16(%rsp), %rbx
	movss	%xmm4, (%rdi,%rcx,4)
	movss	%xmm2, (%rsi)
	movq	(%rbx,%rdx,8), %rdx
	movss	(%rax), %xmm4
	movss	%xmm4, (%rdx,%rcx,4)
	movss	%xmm2, (%rax)
	jmp	.L254
.L234:
	movq	16(%rsi), %rcx
	movq	%rdx, 48(%rsp)
	movl	(%rcx), %ecx
	cmpl	%ecx, 196(%rsp)
	je	.L233
	cmpl	%ecx, 200(%rsp)
	je	.L233
	movl	%eax, %esi
	movl	%ebp, %edi
	movl	%eax, 64(%rsp)
	call	comp_td_point_to_point_delay
	movq	48(%rsp), %rdx
	movq	temp_point_to_point_delay_cost(%rip), %rcx
	movslq	64(%rsp), %rax
	movq	timing_place_crit(%rip), %rsi
	movq	(%rcx,%rdx,8), %rcx
	movq	(%rsi,%rdx,8), %rsi
	leaq	(%rcx,%rax,4), %rcx
	movss	%xmm0, (%rcx)
	mulss	(%rsi,%rax,4), %xmm0
	movq	temp_point_to_point_timing_cost(%rip), %rsi
	movq	(%rsi,%rdx,8), %rsi
	movss	%xmm0, (%rsi,%rax,4)
	movq	point_to_point_delay_cost(%rip), %rsi
	movss	(%rcx), %xmm1
	movq	point_to_point_timing_cost(%rip), %rcx
	movq	(%rsi,%rdx,8), %rsi
	movq	(%rcx,%rdx,8), %rdx
	subss	(%rsi,%rax,4), %xmm1
	subss	(%rdx,%rax,4), %xmm0
	addss	(%rsp), %xmm1
	addss	8(%rsp), %xmm0
	movss	%xmm1, (%rsp)
	movss	%xmm0, 8(%rsp)
	jmp	.L233
.L494:
	movq	grid(%rip), %r12
	movss	120(%rsp), %xmm4
.L306:
	movq	232(%rsp), %rax
	movss	(%rax), %xmm0
	addss	%xmm4, %xmm0
	movss	%xmm0, (%rax)
	movq	224(%rsp), %rax
	movss	(%rax), %xmm0
	addss	%xmm4, %xmm0
	movss	%xmm0, (%rax)
	jmp	.L305
.L495:
	movl	384(%rsp), %r8d
	testl	%r8d, %r8d
	jle	.L136
	movl	384(%rsp), %eax
	movq	place_region_x(%rip), %r11
	xorl	%r9d, %r9d
	movq	place_region_y(%rip), %r10
	movq	240(%rsp), %rbx
	movq	248(%rsp), %rbp
	movl	384(%rsp), %r12d
	subl	$1, %eax
	leaq	4(,%rax,4), %r8
.L294:
	movq	(%r11,%r9,8), %rdi
	movq	(%rbx,%r9,8), %rsi
	xorl	%eax, %eax
	movq	(%r10,%r9,8), %rcx
	movq	0(%rbp,%r9,8), %rdx
	.p2align 4,,10
	.p2align 3
.L293:
	movss	(%rsi,%rax), %xmm0
	movss	%xmm0, 8(%rdi,%rax,4)
	movss	(%rdx,%rax), %xmm0
	movss	%xmm0, 8(%rcx,%rax,4)
	addq	$4, %rax
	cmpq	%r8, %rax
	jne	.L293
	addq	$1, %r9
	cmpl	%r9d, %r12d
	jg	.L294
	jmp	.L136
.L240:
	movq	16(%rsi), %rcx
	movq	%rdx, 64(%rsp)
	movl	(%rcx), %ecx
	cmpl	%ecx, 196(%rsp)
	je	.L239
	cmpl	%ecx, 200(%rsp)
	je	.L239
	movl	%eax, %esi
	movl	%ebx, %edi
	movl	%eax, 56(%rsp)
	call	comp_td_point_to_point_delay
	movq	64(%rsp), %rdx
	movq	temp_point_to_point_delay_cost(%rip), %rcx
	movslq	56(%rsp), %rax
	movq	timing_place_crit(%rip), %rsi
	movq	(%rcx,%rdx,8), %rcx
	movq	(%rsi,%rdx,8), %rsi
	leaq	(%rcx,%rax,4), %rcx
	movss	%xmm0, (%rcx)
	mulss	(%rsi,%rax,4), %xmm0
	movq	temp_point_to_point_timing_cost(%rip), %rsi
	movq	(%rsi,%rdx,8), %rsi
	movss	%xmm0, (%rsi,%rax,4)
	movq	point_to_point_delay_cost(%rip), %rsi
	movss	(%rcx), %xmm3
	movq	point_to_point_timing_cost(%rip), %rcx
	movq	(%rsi,%rdx,8), %rsi
	movq	(%rcx,%rdx,8), %rdx
	subss	(%rsi,%rax,4), %xmm3
	subss	(%rdx,%rax,4), %xmm0
	addss	(%rsp), %xmm3
	addss	8(%rsp), %xmm0
	movss	%xmm3, (%rsp)
	movss	%xmm0, 8(%rsp)
	jmp	.L239
.L170:
	cmpl	$1, 144(%rsp)
	pxor	%xmm4, %xmm4
	movl	$0, 124(%rsp)
	movss	%xmm4, 192(%rsp)
	je	.L312
.L303:
	movl	400(%rsp), %eax
	movss	192(%rsp), %xmm4
	subl	$1, %eax
	cmpl	$1, %eax
	movl	%eax, 32(%rsp)
	jbe	.L327
	movss	%xmm4, 120(%rsp)
	jmp	.L306
.L499:
	cmpl	$-1, 200(%rsp)
	je	.L461
	movq	208(%rsp), %rbx
	movq	72(%rsp), %rax
	xorl	%r10d, %r10d
	movss	.LC21(%rip), %xmm2
	movaps	%xmm2, %xmm4
	movaps	.LC22(%rip), %xmm3
	movq	16(%rax,%rbx), %rax
	movq	312(%rsp), %rbx
	movaps	%xmm2, %xmm1
	movaps	%xmm2, %xmm0
	movq	%rax, 8(%rsp)
	movq	88(%rsp), %rax
	leaq	(%rax,%rbx,8), %rax
	movq	%rax, 56(%rsp)
	jmp	.L285
.L501:
	movl	8(%rax), %r8d
	testl	%r8d, %r8d
	jle	.L272
	movq	32(%rsp), %rax
	movq	16(%rsp), %rbx
	movq	(%rax,%rdx,8), %rsi
	movq	24(%rsp), %rax
	movq	(%rbx,%rdx,8), %rdi
	movq	40(%rsp), %rbx
	movq	(%rax,%rdx,8), %rax
	leaq	20(%rsi), %r12
	leaq	4(%rsi), %r13
	movq	(%rbx,%rdx,8), %rcx
	leaq	20(%rdi), %rbx
	leaq	4(%rdi), %r11
	leaq	4(%rax), %rdx
	leaq	20(%rax), %rbp
	movq	%rbx, 48(%rsp)
	leaq	20(%rcx), %rbx
	leaq	4(%rcx), %r9
	cmpq	%rdx, %r12
	setbe	64(%rsp)
	cmpq	%r13, %rbp
	setbe	%r14b
	orb	64(%rsp), %r14b
	cmpq	48(%rsp), %r13
	setnb	72(%rsp)
	cmpq	%r11, %r12
	movb	%r14b, 64(%rsp)
	setbe	%r14b
	orb	72(%rsp), %r14b
	andb	64(%rsp), %r14b
	cmpl	$9, %r8d
	seta	64(%rsp)
	andb	64(%rsp), %r14b
	cmpq	%rbx, %r13
	setnb	%r13b
	cmpq	%r9, %r12
	setbe	%r12b
	orl	%r13d, %r12d
	andl	%r12d, %r14d
	cmpq	48(%rsp), %rdx
	setnb	%r12b
	cmpq	%r11, %rbp
	setbe	%r13b
	orl	%r13d, %r12d
	andl	%r12d, %r14d
	cmpq	%rdx, %rbx
	setbe	%r12b
	cmpq	%r9, %rbp
	setbe	%bpl
	orl	%r12d, %ebp
	testb	%bpl, %r14b
	je	.L276
	cmpq	%r11, %rbx
	setbe	%r11b
	cmpq	48(%rsp), %r9
	setnb	%r9b
	orb	%r9b, %r11b
	je	.L276
	shrq	$2, %rdx
	movq	%rdx, %r9
	movl	$1, %edx
	negq	%r9
	andl	$3, %r9d
	je	.L277
	movss	4(%rax), %xmm5
	cmpl	$1, %r9d
	movl	$2, %edx
	movss	%xmm5, 4(%rsi)
	movss	%xmm0, 4(%rax)
	movss	4(%rcx), %xmm5
	movss	%xmm5, 4(%rdi)
	movss	%xmm0, 4(%rcx)
	je	.L277
	movss	8(%rax), %xmm5
	cmpl	$3, %r9d
	movl	$3, %edx
	movss	%xmm5, 8(%rsi)
	movss	%xmm0, 8(%rax)
	movss	8(%rcx), %xmm5
	movss	%xmm5, 8(%rdi)
	movss	%xmm0, 8(%rcx)
	jne	.L277
	movss	12(%rax), %xmm5
	movl	$4, %edx
	movss	%xmm5, 12(%rsi)
	movss	%xmm0, 12(%rax)
	movss	12(%rcx), %xmm5
	movss	%xmm5, 12(%rdi)
	movss	%xmm0, 12(%rcx)
.L277:
	movl	%r8d, %ebp
	movq	%rax, 72(%rsp)
	subl	%r9d, %ebp
	movl	%r9d, %r9d
	leaq	4(,%r9,4), %r9
	leal	-4(%rbp), %r11d
	leaq	(%rsi,%r9), %rbx
	shrl	$2, %r11d
	leaq	(%rax,%r9), %r14
	addl	$1, %r11d
	leaq	(%rcx,%r9), %r13
	movq	%rbx, 64(%rsp)
	leaq	(%rdi,%r9), %rbx
	leal	0(,%r11,4), %r12d
	xorl	%r9d, %r9d
	movq	%rbx, 48(%rsp)
	xorl	%ebx, %ebx
.L279:
	movq	64(%rsp), %rax
	addl	$1, %ebx
	movaps	(%r14,%r9), %xmm5
	movups	%xmm5, (%rax,%r9)
	movq	48(%rsp), %rax
	movaps	%xmm3, (%r14,%r9)
	movups	0(%r13,%r9), %xmm5
	movups	%xmm5, (%rax,%r9)
	movups	%xmm3, 0(%r13,%r9)
	addq	$16, %r9
	cmpl	%r11d, %ebx
	jb	.L279
	addl	%r12d, %edx
	cmpl	%ebp, %r12d
	movq	72(%rsp), %rax
	je	.L272
	movslq	%edx, %r11
	leaq	0(,%r11,4), %r9
	leaq	(%rax,%r9), %rbx
	addq	%rcx, %r9
	movss	(%rbx), %xmm5
	movss	%xmm5, (%rsi,%r11,4)
	movss	%xmm1, (%rbx)
	movss	(%r9), %xmm5
	movss	%xmm5, (%rdi,%r11,4)
	movss	%xmm1, (%r9)
	leal	1(%rdx), %r9d
	cmpl	%r9d, %r8d
	jl	.L272
	movslq	%r9d, %r9
	addl	$2, %edx
	leaq	0(,%r9,4), %r11
	leaq	(%rax,%r11), %rbx
	addq	%rcx, %r11
	cmpl	%edx, %r8d
	movss	(%rbx), %xmm5
	movss	%xmm5, (%rsi,%r9,4)
	movss	%xmm1, (%rbx)
	movss	(%r11), %xmm5
	movss	%xmm5, (%rdi,%r9,4)
	movss	%xmm1, (%r11)
	jl	.L272
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %r8
	addq	%r8, %rax
	addq	%r8, %rcx
	movss	(%rax), %xmm5
	movss	%xmm5, (%rsi,%rdx,4)
	movss	%xmm1, (%rax)
	movss	(%rcx), %xmm5
	movss	%xmm5, (%rdi,%rdx,4)
	movss	%xmm1, (%rcx)
.L272:
	addq	$4, %r10
	cmpq	%r15, %r10
	je	.L461
.L285:
	movq	8(%rsp), %rax
	movslq	(%rax,%r10), %rdx
	cmpl	$-1, %edx
	je	.L272
	movq	(%rsp), %rbx
	leaq	(%rdx,%rdx,4), %rax
	leaq	(%rbx,%rax,8), %rax
	movl	32(%rax), %r12d
	testl	%r12d, %r12d
	jne	.L272
	movq	56(%rsp), %rbx
	movq	(%rbx), %rcx
	movl	(%rcx,%r10), %ecx
	testl	%ecx, %ecx
	je	.L501
	movq	16(%rax), %rax
	movl	(%rax), %eax
	cmpl	%eax, 200(%rsp)
	je	.L272
	cmpl	%eax, 196(%rsp)
	je	.L272
	movslq	%ecx, %rax
	movq	24(%rsp), %rbx
	leaq	0(,%rax,4), %rcx
	movq	%rcx, %rsi
	addq	(%rbx,%rdx,8), %rsi
	movq	32(%rsp), %rbx
	movq	(%rbx,%rdx,8), %rdi
	movq	40(%rsp), %rbx
	movss	(%rsi), %xmm5
	addq	(%rbx,%rdx,8), %rcx
	movq	16(%rsp), %rbx
	movss	%xmm5, (%rdi,%rax,4)
	movss	%xmm2, (%rsi)
	movq	(%rbx,%rdx,8), %rdx
	movss	(%rcx), %xmm5
	movss	%xmm5, (%rdx,%rax,4)
	movss	%xmm2, (%rcx)
	jmp	.L272
.L258:
	movl	$1, %ecx
.L265:
	movss	(%rax,%rcx,4), %xmm4
	movss	%xmm4, (%rsi,%rcx,4)
	movss	%xmm3, (%rax,%rcx,4)
	movss	(%rdx,%rcx,4), %xmm4
	movss	%xmm4, (%rdi,%rcx,4)
	movss	%xmm3, (%rdx,%rcx,4)
	addq	$1, %rcx
	cmpl	%ecx, %r8d
	jge	.L265
	jmp	.L254
.L276:
	movl	$1, %edx
.L283:
	movss	(%rax,%rdx,4), %xmm5
	movss	%xmm5, (%rsi,%rdx,4)
	movss	%xmm4, (%rax,%rdx,4)
	movss	(%rcx,%rdx,4), %xmm5
	movss	%xmm5, (%rdi,%rdx,4)
	movss	%xmm4, (%rcx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %r8d
	jge	.L283
	jmp	.L272
.L160:
	leaq	__PRETTY_FUNCTION__.4987(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC15(%rip), %rdi
	movl	$1853, %edx
	call	__assert_fail@PLT
.L184:
	movl	124(%rsp), %esi
	testl	%esi, %esi
	jne	.L302
.L319:
	pxor	%xmm0, %xmm0
	jmp	.L221
.L162:
	leaq	__PRETTY_FUNCTION__.4987(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC16(%rip), %rdi
	movl	$1854, %edx
	call	__assert_fail@PLT
.L320:
	movss	192(%rsp), %xmm1
	movaps	%xmm1, %xmm2
	jmp	.L232
.L327:
	movss	%xmm4, 16(%rsp)
	jmp	.L309
.L479:
	leaq	__PRETTY_FUNCTION__.4987(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC18(%rip), %rdi
	movl	$1867, %edx
	call	__assert_fail@PLT
.L484:
	leaq	.LC19(%rip), %rdi
	movl	%r9d, %edx
	xorl	%eax, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L137:
	leaq	.LC13(%rip), %rdi
	movl	%r12d, %esi
	xorl	%eax, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L165:
	movl	176(%rsp), %edx
	leaq	.LC17(%rip), %rdi
	movl	%r14d, %esi
	xorl	%eax, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE32:
	.size	try_swap, .-try_swap
	.p2align 4,,15
	.type	comp_td_costs, @function
comp_td_costs:
.LFB42:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movl	num_nets(%rip), %eax
	movq	%rdi, 64(%rsp)
	movq	%rsi, 72(%rsp)
	testl	%eax, %eax
	jle	.L517
	movq	delta_fb_to_fb(%rip), %rbx
	movq	timing_place_crit(%rip), %r9
	subl	$1, %eax
	pxor	%xmm5, %xmm5
	movq	block(%rip), %r12
	movq	IO_TYPE(%rip), %r15
	movq	temp_point_to_point_delay_cost(%rip), %r11
	movq	%rbx, 16(%rsp)
	movq	delta_fb_to_io(%rip), %rbx
	leaq	8(%r9,%rax,8), %rax
	movq	point_to_point_timing_cost(%rip), %r10
	movq	temp_point_to_point_timing_cost(%rip), %r14
	movaps	%xmm5, %xmm2
	movaps	%xmm5, %xmm3
	movq	%rbx, 48(%rsp)
	movq	delta_io_to_fb(%rip), %rbx
	movq	%rax, 32(%rsp)
	movss	.LC21(%rip), %xmm4
	movq	%rbx, 40(%rsp)
	movq	delta_io_to_io(%rip), %rbx
	movq	%rbx, 56(%rsp)
	movq	net(%rip), %rbx
	addq	$8, %rbx
	movq	%rbx, 24(%rsp)
	movq	point_to_point_delay_cost(%rip), %rbx
	.p2align 4,,10
	.p2align 3
.L516:
	movq	24(%rsp), %rax
	movl	24(%rax), %edx
	testl	%edx, %edx
	jne	.L504
	movl	(%rax), %esi
	testl	%esi, %esi
	movl	%esi, 4(%rsp)
	jle	.L504
	movq	8(%rax), %r13
	movslq	0(%r13), %rax
	leaq	(%rax,%rax,4), %rax
	leaq	(%r12,%rax,8), %rdx
	movslq	4(%r13), %rax
	movq	8(%rdx), %rbp
	leaq	(%rax,%rax,4), %rax
	testq	%rbp, %rbp
	leaq	(%r12,%rax,8), %rax
	movq	8(%rax), %r8
	je	.L505
	testq	%r8, %r8
	je	.L506
	movl	24(%rdx), %esi
	movl	$4, %ecx
	movl	%esi, 8(%rsp)
	movl	28(%rdx), %esi
	movl	%esi, 12(%rsp)
	movl	$1, %esi
	jmp	.L508
	.p2align 4,,10
	.p2align 3
.L509:
	cmpq	%r15, %r8
	je	.L529
	movq	16(%rsp), %rdi
	movq	(%rdi,%rdx,8), %rdx
	movss	(%rdx,%rax,4), %xmm0
.L511:
	ucomiss	%xmm0, %xmm5
	ja	.L530
	movq	(%r9), %rax
	addl	$1, %esi
	cmpl	4(%rsp), %esi
	addss	%xmm0, %xmm2
	movss	(%rax,%rcx), %xmm1
	movq	(%rbx), %rax
	mulss	%xmm0, %xmm1
	movss	%xmm0, (%rax,%rcx)
	movq	(%r11), %rax
	addss	%xmm1, %xmm3
	movss	%xmm4, (%rax,%rcx)
	movq	(%r10), %rax
	movss	%xmm1, (%rax,%rcx)
	movq	(%r14), %rax
	movss	%xmm4, (%rax,%rcx)
	jg	.L504
	addq	$4, %rcx
	movslq	0(%r13,%rcx), %rax
	leaq	(%rax,%rax,4), %rax
	leaq	(%r12,%rax,8), %rax
	movq	8(%rax), %r8
	testq	%r8, %r8
	je	.L506
.L508:
	movl	24(%rax), %edx
	subl	8(%rsp), %edx
	movl	28(%rax), %eax
	subl	12(%rsp), %eax
	movl	%edx, %edi
	sarl	$31, %edi
	xorl	%edi, %edx
	subl	%edi, %edx
	movl	%eax, %edi
	sarl	$31, %edi
	movslq	%edx, %rdx
	xorl	%edi, %eax
	subl	%edi, %eax
	cmpq	%r15, %rbp
	cltq
	jne	.L509
	cmpq	%rbp, %r8
	je	.L531
	movq	40(%rsp), %rdi
	movq	(%rdi,%rdx,8), %rdx
	movss	(%rdx,%rax,4), %xmm0
	jmp	.L511
	.p2align 4,,10
	.p2align 3
.L504:
	addq	$40, 24(%rsp)
	addq	$8, %r9
	addq	$8, %rbx
	addq	$8, %r11
	addq	$8, %r10
	addq	$8, %r14
	cmpq	%r9, 32(%rsp)
	jne	.L516
	movq	64(%rsp), %rax
.L503:
	movss	%xmm3, (%rax)
	movq	72(%rsp), %rax
	movss	%xmm2, (%rax)
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L529:
	.cfi_restore_state
	movq	48(%rsp), %rdi
	movq	(%rdi,%rdx,8), %rdx
	movss	(%rdx,%rax,4), %xmm0
	jmp	.L511
	.p2align 4,,10
	.p2align 3
.L531:
	movq	56(%rsp), %rdi
	movq	(%rdi,%rdx,8), %rdx
	movss	(%rdx,%rax,4), %xmm0
	jmp	.L511
.L517:
	pxor	%xmm2, %xmm2
	movq	%rdi, %rax
	movaps	%xmm2, %xmm3
	jmp	.L503
.L505:
	leaq	__PRETTY_FUNCTION__.5031(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	movl	$1987, %edx
	call	__assert_fail@PLT
.L530:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L506:
	leaq	__PRETTY_FUNCTION__.5031(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	movl	$1988, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE42:
	.size	comp_td_costs, .-comp_td_costs
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"BB estimate of min-dist (placement) wirelength is ;%.0f\n"
	.text
	.p2align 4,,15
	.type	comp_bb_cost, @function
comp_bb_cost:
.LFB43:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	cmpl	$1, %esi
	movl	%esi, 8(%rsp)
	movl	%edx, 12(%rsp)
	je	.L587
.L534:
	movl	num_nets(%rip), %edx
	testl	%edx, %edx
	jle	.L582
	pxor	%xmm5, %xmm5
.L561:
	pxor	%xmm0, %xmm0
	movaps	%xmm5, %xmm3
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L549:
	leaq	(%rbx,%rbx,4), %r12
	movl	%ebx, %r13d
	salq	$3, %r12
	movq	%r12, %rax
	addq	net(%rip), %rax
	movl	32(%rax), %ecx
	testl	%ecx, %ecx
	jne	.L538
	movl	8(%rax), %edx
	cmpl	$3, %edx
	jle	.L539
	testl	%r14d, %r14d
	je	.L588
.L539:
	movq	16(%rax), %rax
	movq	block(%rip), %r11
	movq	%rbx, %rbp
	salq	$4, %rbp
	addq	bb_coords(%rip), %rbp
	testl	%edx, %edx
	movslq	(%rax), %rcx
	leaq	(%rcx,%rcx,4), %rcx
	leaq	(%r11,%rcx,8), %rcx
	movl	24(%rcx), %r8d
	movl	28(%rcx), %edi
	jle	.L563
	subl	$1, %edx
	leaq	4(%rax), %r9
	movl	%edi, %ecx
	leaq	8(%rax,%rdx,4), %r15
	movl	%r8d, %esi
	.p2align 4,,10
	.p2align 3
.L542:
	movslq	(%r9), %rax
	movl	%r8d, %r10d
	leaq	(%rax,%rax,4), %rax
	leaq	(%r11,%rax,8), %rax
	movl	24(%rax), %edx
	movl	28(%rax), %eax
	cmpl	%r8d, %edx
	cmovge	%edx, %r10d
	cmpl	%esi, %edx
	cmovge	%r10d, %r8d
	cmpl	%edx, %esi
	cmovg	%edx, %esi
	cmpl	%edi, %eax
	movl	%edi, %edx
	cmovge	%eax, %edx
	cmpl	%ecx, %eax
	cmovge	%edx, %edi
	cmpl	%eax, %ecx
	cmovg	%eax, %ecx
	addq	$4, %r9
	cmpq	%r9, %r15
	jne	.L542
.L541:
	movl	nx(%rip), %eax
	movl	$1, %edx
	cmpl	%esi, %eax
	cmovle	%eax, %esi
	testl	%esi, %esi
	cmovle	%edx, %esi
	movl	%esi, 0(%rbp)
	movl	ny(%rip), %esi
	cmpl	%ecx, %esi
	cmovle	%esi, %ecx
	testl	%ecx, %ecx
	cmovle	%edx, %ecx
	cmpl	%r8d, %eax
	cmovle	%eax, %r8d
	movl	%ecx, 8(%rbp)
	testl	%r8d, %r8d
	cmovle	%edx, %r8d
	cmpl	%edi, %esi
	cmovle	%esi, %edi
	movl	%r8d, 4(%rbp)
	testl	%edi, %edi
	cmovle	%edx, %edi
	cmpl	$1, 8(%rsp)
	movl	%edi, 12(%rbp)
	je	.L543
.L595:
	movq	net_cost(%rip), %rax
	leaq	(%rax,%rbx,4), %r8
	movq	net(%rip), %rax
	movslq	8(%rax,%r12), %rdi
	cmpl	$49, %edi
	jg	.L589
	leaq	cross_count(%rip), %rdx
	movslq	%edi, %rax
	movss	(%rdx,%rax,4), %xmm2
.L545:
	movslq	4(%rbp), %rdx
	movslq	0(%rbp), %rax
	pxor	%xmm1, %xmm1
	movl	12(%rbp), %ecx
	movq	chanx_place_cost_fac(%rip), %r10
	movslq	8(%rbp), %r11
	movq	chany_place_cost_fac(%rip), %r9
	movl	%edx, %esi
	movslq	%ecx, %rbp
	subl	%eax, %esi
	movq	(%r10,%rbp,8), %r10
	movq	(%r9,%rdx,8), %rdx
	addl	$1, %esi
	subl	%r11d, %ecx
	cvtsi2ss	%esi, %xmm1
	addl	$1, %ecx
	cmpl	$1, %r14d
	movss	-4(%r10,%r11,4), %xmm4
	mulss	%xmm2, %xmm1
	mulss	%xmm1, %xmm4
	pxor	%xmm1, %xmm1
	cvtsi2ss	%ecx, %xmm1
	mulss	%xmm2, %xmm1
	mulss	-4(%rdx,%rax,4), %xmm1
	addss	%xmm4, %xmm1
	movss	%xmm1, (%r8)
	addss	%xmm1, %xmm3
	je	.L590
.L538:
	leal	1(%rbx), %eax
	addq	$1, %rbx
	cmpl	%eax, num_nets(%rip)
	jg	.L549
	cmpl	$1, 8(%rsp)
	je	.L591
.L550:
	cmpl	$1, %r14d
	je	.L592
.L532:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movaps	%xmm3, %xmm0
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L589:
	.cfi_restore_state
	pxor	%xmm2, %xmm2
	leal	-49(%rdi), %eax
	cvtsi2sd	%eax, %xmm2
	mulsd	.LC5(%rip), %xmm2
	addsd	.LC6(%rip), %xmm2
	cvtsd2ss	%xmm2, %xmm2
	jmp	.L545
	.p2align 4,,10
	.p2align 3
.L590:
	leal	-50(%rdi), %eax
	cmpl	$33, %eax
	jbe	.L593
	cmpl	$83, %edi
	jg	.L594
	pxor	%xmm1, %xmm1
	leaq	cross_count(%rip), %rax
	cvtss2sd	(%rax,%rdi,4), %xmm1
.L547:
	pxor	%xmm2, %xmm2
	pxor	%xmm4, %xmm4
	cvtsi2sd	%esi, %xmm2
	cvtsi2sd	%ecx, %xmm4
	mulsd	%xmm1, %xmm2
	mulsd	%xmm4, %xmm1
	addsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	jmp	.L538
	.p2align 4,,10
	.p2align 3
.L588:
	movq	%rbx, %rdx
	movl	%ebx, %edi
	movss	%xmm5, 28(%rsp)
	salq	$4, %rdx
	movss	%xmm3, 24(%rsp)
	movq	%rdx, %rbp
	addq	bb_coords(%rip), %rbp
	movsd	%xmm0, 16(%rsp)
	addq	bb_num_on_edges(%rip), %rdx
	movq	%rbp, %rsi
	call	get_bb_from_scratch
	cmpl	$1, 8(%rsp)
	movsd	16(%rsp), %xmm0
	movss	24(%rsp), %xmm3
	movss	28(%rsp), %xmm5
	jne	.L595
.L543:
	movl	12(%rsp), %edx
	movq	%rbp, %rsi
	movl	%r13d, %edi
	movss	%xmm5, 28(%rsp)
	movss	%xmm3, 24(%rsp)
	movsd	%xmm0, 16(%rsp)
	call	update_region_occ.constprop.5
	movss	28(%rsp), %xmm5
	movss	24(%rsp), %xmm3
	movsd	16(%rsp), %xmm0
	jmp	.L538
.L594:
	pxor	%xmm2, %xmm2
	addl	$1, %edi
	movsd	.LC24(%rip), %xmm1
	movsd	.LC25(%rip), %xmm4
	cvtsi2sd	%edi, %xmm2
	mulsd	%xmm2, %xmm1
	mulsd	%xmm2, %xmm4
	addsd	.LC6(%rip), %xmm1
	mulsd	%xmm4, %xmm2
	subsd	%xmm2, %xmm1
	jmp	.L547
	.p2align 4,,10
	.p2align 3
.L593:
	pxor	%xmm1, %xmm1
	subl	$49, %edi
	cvtsi2sd	%edi, %xmm1
	mulsd	.LC5(%rip), %xmm1
	addsd	.LC6(%rip), %xmm1
	jmp	.L547
.L563:
	movl	%edi, %ecx
	movl	%r8d, %esi
	jmp	.L541
.L587:
	testl	%edx, %edx
	jle	.L534
	leal	-1(%rdx), %esi
	movq	place_region_x(%rip), %rdi
	movq	place_region_y(%rip), %r8
	pxor	%xmm5, %xmm5
	xorl	%r9d, %r9d
	movq	%rsi, %r10
	salq	$4, %rsi
	movl	%edx, %r11d
	addq	$24, %rsi
	.p2align 4,,10
	.p2align 3
.L535:
	movq	(%rdi,%r9,8), %rcx
	movq	(%r8,%r9,8), %rdx
	movl	$8, %eax
	.p2align 4,,10
	.p2align 3
.L536:
	movss	%xmm5, (%rcx,%rax)
	movss	%xmm5, (%rdx,%rax)
	addq	$16, %rax
	cmpq	%rax, %rsi
	jne	.L536
	addq	$1, %r9
	cmpl	%r9d, %r11d
	jg	.L535
	movl	num_nets(%rip), %eax
	pxor	%xmm0, %xmm0
	testl	%eax, %eax
	jg	.L561
.L562:
	movl	%r10d, %r9d
	movl	12(%rsp), %r10d
	xorl	%esi, %esi
	addq	$1, %r9
	movaps	%xmm5, %xmm3
	salq	$4, %r9
	.p2align 4,,10
	.p2align 3
.L559:
	movq	(%rdi,%rsi,8), %rax
	movq	(%r8,%rsi,8), %rdx
	leaq	(%rax,%r9), %rcx
	.p2align 4,,10
	.p2align 3
.L551:
	movss	8(%rax), %xmm1
	movss	(%rax), %xmm2
	ucomiss	%xmm1, %xmm2
	mulss	4(%rax), %xmm1
	movaps	%xmm1, %xmm2
	ja	.L585
	mulss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
.L585:
	movss	8(%rdx), %xmm2
	addss	%xmm3, %xmm1
	movss	(%rdx), %xmm3
	ucomiss	%xmm2, %xmm3
	mulss	4(%rdx), %xmm2
	jbe	.L580
	movaps	%xmm2, %xmm3
	addq	$16, %rax
	addq	$16, %rdx
	cmpq	%rax, %rcx
	addss	%xmm1, %xmm3
	jne	.L551
	addq	$1, %rsi
	cmpl	%esi, %r10d
	jg	.L559
.L596:
	cmpl	$1, %r14d
	jne	.L532
.L592:
	leaq	.LC26(%rip), %rdi
	movl	$1, %eax
	movss	%xmm3, 8(%rsp)
	call	printf@PLT
	movss	8(%rsp), %xmm3
	jmp	.L532
	.p2align 4,,10
	.p2align 3
.L580:
	mulss	%xmm2, %xmm2
	addq	$16, %rax
	addq	$16, %rdx
	cmpq	%rcx, %rax
	movaps	%xmm2, %xmm3
	addss	%xmm1, %xmm3
	jne	.L551
	addq	$1, %rsi
	cmpl	%esi, %r10d
	jg	.L559
	jmp	.L596
.L591:
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.L564
	movq	place_region_x(%rip), %rdi
	movq	place_region_y(%rip), %r8
	leal	-1(%rax), %r10d
	jmp	.L562
.L564:
	movaps	%xmm5, %xmm3
	jmp	.L550
.L582:
	pxor	%xmm0, %xmm0
	pxor	%xmm3, %xmm3
	jmp	.L550
	.cfi_endproc
.LFE43:
	.size	comp_bb_cost, .-comp_bb_cost
	.section	.rodata.str1.1
.LC29:
	.string	"count[type_index] > 0"
.LC30:
	.string	"grid[i][j].blocks != NULL"
	.section	.rodata.str1.8
	.align 8
.LC31:
	.string	"\nThere are %d point to point connections in this circuit\n\n"
	.align 8
.LC34:
	.string	"Warning:  Starting t: %d of %d configurations accepted.\n"
	.align 8
.LC36:
	.string	"Initial Placement Cost: %g bb_cost: %g td_cost: %g delay_cost: %g\n\n"
	.section	.rodata.str1.1
.LC37:
	.string	"Av Tot Del"
.LC38:
	.string	"Av. TD Cost"
.LC39:
	.string	"Av. BB Cost"
.LC40:
	.string	"Cost"
.LC41:
	.string	"T"
	.section	.rodata.str1.8
	.align 8
.LC42:
	.string	"%11s  %10s %11s  %11s  %11s %11s  %11s %9s %8s  %7s  %7s  %10s  %7s\n"
	.section	.rodata.str1.1
.LC43:
	.string	"Alpha"
.LC44:
	.string	"Tot. Moves"
.LC45:
	.string	"Exp"
.LC46:
	.string	"R limit"
.LC47:
	.string	"Std Dev"
.LC48:
	.string	"Ac Rate"
.LC49:
	.string	"d_max"
.LC50:
	.string	"P to P Del"
.LC51:
	.string	"---------"
.LC52:
	.string	"-----------"
.LC53:
	.string	"----------"
.LC54:
	.string	"--------"
.LC55:
	.string	"-----"
.LC56:
	.string	"-------"
	.section	.rodata.str1.8
	.align 8
.LC57:
	.string	"Initial Placement.  Cost: %g  BB Cost: %g  TD Cost %g  Delay Cost: %g \t d_max %g Channel Factor: %d"
	.align 8
.LC60:
	.string	"Error in try_place:  new_bb_cost = %g, old bb_cost = %g.\n"
	.align 8
.LC61:
	.string	"Error in try_place:  new_timing_cost = %g, old timing_cost = %g.\n"
	.align 8
.LC62:
	.string	"Error in try_place:  new_delay_cost = %g, old delay_cost = %g.\n"
	.align 8
.LC63:
	.string	"%11.5g  %10.6g %11.6g  %11.6g  %11.6g %11.6g %11.4g %9.4g %8.3g  %7.4g  %7.4g  %10d  "
	.section	.rodata.str1.1
.LC69:
	.string	"%7.4g\n"
	.section	.rodata.str1.8
	.align 8
.LC70:
	.string	"Cost: %g  BB Cost %g  TD Cost %g  Temperature: %g  d_max: %g"
	.align 8
.LC73:
	.string	"%11.5g  %10.6g %11.6g  %11.6g  %11.6g %11.6g %11.4g %9.4g %8.3g  %7.4g  %7.4g  %10d  \n\n"
	.align 8
.LC74:
	.string	"bb_cost recomputed from scratch is %g.\n"
	.align 8
.LC75:
	.string	"Error:  bb_cost_check: %g and bb_cost: %g differ in check_place.\n"
	.align 8
.LC76:
	.string	"timing_cost recomputed from scratch is %g. \n"
	.align 8
.LC77:
	.string	"Error:  timing_cost_check: %g and timing_cost: %g differ in check_place.\n"
	.align 8
.LC78:
	.string	"delay_cost recomputed from scratch is %g. \n"
	.align 8
.LC79:
	.string	"Error:  delay_cost_check: %g and delay_cost: %g differ in check_place.\n"
	.align 8
.LC80:
	.string	"Error:  block at grid location (%d,%d) overused. Usage is %d\n"
	.align 8
.LC81:
	.string	"Error:  block %d type does not match grid location (%d,%d) type.\n"
	.align 8
.LC82:
	.string	"Error:  block %d location conflicts with grid(%d,%d)data.\n"
	.align 8
.LC83:
	.string	"Error:  Location (%d,%d) usage is %d, but has actual usage %d.\n"
	.align 8
.LC84:
	.string	"Error:  block %d listed %d times in data structures.\n"
	.align 8
.LC85:
	.string	"\nCompleted placement consistency check successfully.\n"
	.align 8
.LC86:
	.string	"\nCompleted placement consistency check, %d Errors found.\n\n"
	.section	.rodata.str1.1
.LC87:
	.string	"Aborting program."
	.section	.rodata.str1.8
	.align 8
.LC88:
	.string	"Placement Estimated Crit Path Delay: %g\n\n"
	.align 8
.LC89:
	.string	"Placement. Cost: %g  bb_cost: %g td_cost: %g Channel Factor: %d d_max: %g"
	.align 8
.LC90:
	.string	"Placement. Cost: %g  bb_cost: %g  td_cost: %g  delay_cost: %g.\n"
	.section	.rodata.str1.1
.LC91:
	.string	"(*mst)[inet]"
	.text
	.p2align 4,,15
	.globl	try_place
	.type	try_place, @function
try_place:
.LFB24:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$680, %rsp
	.cfi_def_cfa_offset 736
	movslq	nx(%rip), %rdi
	movl	736(%rsp), %eax
	movss	740(%rsp), %xmm7
	movss	%xmm7, 24(%rsp)
	movq	%rcx, 248(%rsp)
	movq	%rsi, 304(%rsp)
	movss	796(%rsp), %xmm7
	movl	780(%rsp), %ebp
	movl	%eax, %r15d
	movl	%eax, 220(%rsp)
	salq	$2, %rdi
	movl	748(%rsp), %eax
	movss	%xmm0, 312(%rsp)
	movss	%xmm7, 200(%rsp)
	movl	%eax, 40(%rsp)
	movl	760(%rsp), %eax
	movl	%eax, 196(%rsp)
	movl	784(%rsp), %eax
	movl	%eax, 212(%rsp)
	movl	788(%rsp), %eax
	movl	%eax, %r14d
	movl	%eax, 216(%rsp)
	movl	792(%rsp), %eax
	movl	%eax, 192(%rsp)
	movl	808(%rsp), %eax
	movl	%eax, 208(%rsp)
	call	my_malloc@PLT
	movq	%rax, 88(%rsp)
	movl	%r15d, %eax
	movq	$0, 264(%rsp)
	subl	$1, %eax
	testl	%r14d, %r14d
	setne	278(%rsp)
	movzbl	278(%rsp), %ecx
	cmpl	$1, %eax
	movl	%eax, 44(%rsp)
	setbe	%al
	movl	%eax, %edi
	orb	%cl, %dil
	movb	%dil, 279(%rsp)
	je	.L598
	leaq	352(%rsp), %rcx
	leaq	360(%rsp), %rdx
	subq	$8, %rsp
	.cfi_def_cfa_offset 744
	pushq	16(%r12)
	.cfi_def_cfa_offset 752
	pushq	8(%r12)
	.cfi_def_cfa_offset 760
	movq	%rbx, %rdi
	pushq	(%r12)
	.cfi_def_cfa_offset 768
	pushq	1000(%rsp)
	.cfi_def_cfa_offset 776
	pushq	1000(%rsp)
	.cfi_def_cfa_offset 784
	pushq	1000(%rsp)
	.cfi_def_cfa_offset 792
	pushq	1000(%rsp)
	.cfi_def_cfa_offset 800
	pushq	1000(%rsp)
	.cfi_def_cfa_offset 808
	pushq	1000(%rsp)
	.cfi_def_cfa_offset 816
	pushq	1000(%rsp)
	.cfi_def_cfa_offset 824
	pushq	1000(%rsp)
	.cfi_def_cfa_offset 832
	pushq	1000(%rsp)
	.cfi_def_cfa_offset 840
	pushq	1000(%rsp)
	.cfi_def_cfa_offset 848
	pushq	1000(%rsp)
	.cfi_def_cfa_offset 856
	pushq	1000(%rsp)
	.cfi_def_cfa_offset 864
	subq	$48, %rsp
	.cfi_def_cfa_offset 912
	movq	1008(%rsp), %rax
	movq	%rax, (%rsp)
	movq	1016(%rsp), %rax
	movq	480(%rsp), %rsi
	movss	488(%rsp), %xmm0
	movq	%rax, 8(%rsp)
	movq	1024(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	1032(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	1040(%rsp), %rax
	movq	%rax, 32(%rsp)
	movl	1048(%rsp), %eax
	movl	%eax, 40(%rsp)
	call	alloc_lookups_and_criticalities@PLT
	movq	536(%rsp), %rax
	movq	%rax, 440(%rsp)
	addq	$176, %rsp
	.cfi_def_cfa_offset 736
.L598:
	movl	756(%rsp), %eax
	subq	$48, %rsp
	.cfi_def_cfa_offset 784
	movl	%eax, 320(%rsp)
	movl	%eax, %edi
	movq	880(%rsp), %rax
	movq	%rax, (%rsp)
	movq	888(%rsp), %rax
	movq	%rax, 8(%rsp)
	movq	896(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	904(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	912(%rsp), %rax
	movq	%rax, 32(%rsp)
	movl	920(%rsp), %eax
	movl	%eax, 40(%rsp)
	call	init_chan@PLT
	movl	num_types(%rip), %edx
	addq	$48, %rsp
	.cfi_def_cfa_offset 736
	testl	%edx, %edx
	jle	.L908
	subl	$1, %edx
	movq	type_descriptors(%rip), %rcx
	xorl	%ebx, %ebx
	leaq	(%rdx,%rdx,8), %rsi
	leaq	(%rdx,%rsi,2), %rdx
	leaq	8(%rcx), %rax
	leaq	160(%rcx,%rdx,8), %rcx
.L600:
	movl	(%rax), %edx
	cmpl	%edx, %ebx
	cmovl	%edx, %ebx
	addq	$152, %rax
	cmpq	%rax, %rcx
	jne	.L600
.L599:
	cmpb	$0, 279(%rsp)
	movss	752(%rsp), %xmm7
	movss	%xmm7, 32(%rsp)
	movl	num_nets(%rip), %r13d
	je	.L602
	movslq	%r13d, %rdi
	salq	$3, %rdi
	call	my_malloc@PLT
	movslq	num_nets(%rip), %rdi
	movq	%rax, point_to_point_delay_cost(%rip)
	salq	$3, %rdi
	call	my_malloc@PLT
	movslq	num_nets(%rip), %rdi
	movq	%rax, temp_point_to_point_delay_cost(%rip)
	salq	$3, %rdi
	call	my_malloc@PLT
	movslq	num_nets(%rip), %rdi
	movq	%rax, point_to_point_timing_cost(%rip)
	salq	$3, %rdi
	call	my_malloc@PLT
	movq	%rax, temp_point_to_point_timing_cost(%rip)
	movl	num_blocks(%rip), %eax
	leal	-1(%rbx), %ecx
	xorl	%edx, %edx
	xorl	%edi, %edi
	movl	$4, %r8d
	leal	-1(%rax), %esi
	call	alloc_matrix@PLT
	movl	num_nets(%rip), %r13d
	movq	%rax, net_pin_index(%rip)
	testl	%r13d, %r13d
	jle	.L602
	xorl	%r12d, %r12d
	xorl	%r14d, %r14d
.L603:
	movq	net(%rip), %rax
	leaq	(%r12,%r12,4), %rbx
	movq	%r12, %r13
	addq	point_to_point_delay_cost(%rip), %r13
	addl	$1, %r14d
	movslq	8(%rax,%rbx), %rdi
	salq	$2, %rdi
	call	my_malloc@PLT
	movq	%rax, 0(%r13)
	movq	%r12, %rax
	addq	point_to_point_delay_cost(%rip), %rax
	movq	%r12, %r13
	addq	temp_point_to_point_delay_cost(%rip), %r13
	subq	$4, (%rax)
	movq	net(%rip), %rax
	movslq	8(%rax,%rbx), %rdi
	salq	$2, %rdi
	call	my_malloc@PLT
	movq	%rax, 0(%r13)
	movq	%r12, %rax
	addq	temp_point_to_point_delay_cost(%rip), %rax
	movq	%r12, %r13
	addq	point_to_point_timing_cost(%rip), %r13
	subq	$4, (%rax)
	movq	net(%rip), %rax
	movslq	8(%rax,%rbx), %rdi
	salq	$2, %rdi
	call	my_malloc@PLT
	movq	%rax, 0(%r13)
	movq	%r12, %rax
	addq	point_to_point_timing_cost(%rip), %rax
	movq	%r12, %r13
	addq	temp_point_to_point_timing_cost(%rip), %r13
	subq	$4, (%rax)
	movq	net(%rip), %rax
	movslq	8(%rax,%rbx), %rdi
	salq	$2, %rdi
	call	my_malloc@PLT
	movq	%rax, 0(%r13)
	movq	%r12, %rax
	addq	temp_point_to_point_timing_cost(%rip), %rax
	movl	num_nets(%rip), %r13d
	addq	$8, %r12
	subq	$4, (%rax)
	cmpl	%r13d, %r14d
	jl	.L603
	testl	%r13d, %r13d
	jle	.L602
	pxor	%xmm0, %xmm0
	movq	net(%rip), %rax
	movq	point_to_point_delay_cost(%rip), %rbx
	movq	temp_point_to_point_delay_cost(%rip), %r11
	xorl	%r14d, %r14d
	pxor	%xmm3, %xmm3
	leaq	8(%rax), %r15
	movaps	%xmm0, %xmm2
	movaps	%xmm0, %xmm1
	jmp	.L604
.L1127:
	cmpl	$14, %esi
	jbe	.L939
	movq	%rcx, %rdi
	movl	$1, %ecx
	shrq	$2, %rdi
	negq	%rdi
	andl	$3, %edi
	je	.L607
	cmpl	$1, %edi
	movss	%xmm1, 4(%rax)
	movl	$2, %ecx
	movss	%xmm1, 4(%rdx)
	je	.L607
	cmpl	$3, %edi
	movss	%xmm1, 8(%rax)
	movl	$3, %ecx
	movss	%xmm1, 8(%rdx)
	jne	.L607
	movss	%xmm1, 12(%rax)
	movl	$4, %ecx
	movss	%xmm1, 12(%rdx)
.L607:
	movl	%esi, %r10d
	xorl	%r9d, %r9d
	subl	%edi, %r10d
	movl	%edi, %edi
	leal	-4(%r10), %r8d
	movl	%r10d, 16(%rsp)
	shrl	$2, %r8d
	addl	$1, %r8d
	leal	0(,%r8,4), %r10d
	movl	%r10d, 8(%rsp)
	leaq	4(,%rdi,4), %r10
	xorl	%edi, %edi
	leaq	(%rax,%r10), %r12
	addq	%rdx, %r10
.L609:
	addl	$1, %r9d
	movaps	%xmm3, (%r12,%rdi)
	movups	%xmm3, (%r10,%rdi)
	addq	$16, %rdi
	cmpl	%r8d, %r9d
	jb	.L609
	movl	8(%rsp), %edi
	addl	%edi, %ecx
	cmpl	16(%rsp), %edi
	je	.L613
	movslq	%ecx, %rdi
	movss	%xmm2, (%rax,%rdi,4)
	movss	%xmm2, (%rdx,%rdi,4)
	leal	1(%rcx), %edi
	cmpl	%edi, %esi
	jl	.L613
	addl	$2, %ecx
	movslq	%edi, %rdi
	cmpl	%ecx, %esi
	movss	%xmm2, (%rax,%rdi,4)
	movss	%xmm2, (%rdx,%rdi,4)
	jl	.L613
	movslq	%ecx, %rcx
	movss	%xmm2, (%rax,%rcx,4)
	movss	%xmm2, (%rdx,%rcx,4)
.L613:
	addq	$1, %r14
	addq	$40, %r15
	cmpl	%r14d, %r13d
	jle	.L602
.L604:
	movl	(%r15), %esi
	testl	%esi, %esi
	jle	.L613
	movq	(%rbx,%r14,8), %rax
	movq	(%r11,%r14,8), %rdx
	leaq	20(%rax), %rdi
	leaq	4(%rdx), %r8
	leaq	4(%rax), %rcx
	cmpq	%rdi, %r8
	leaq	20(%rdx), %rdi
	setnb	%r8b
	cmpq	%rdi, %rcx
	setnb	%dil
	orb	%dil, %r8b
	jne	.L1127
.L939:
	movl	$1, %ecx
.L605:
	movss	%xmm0, (%rax,%rcx,4)
	movss	%xmm0, (%rdx,%rcx,4)
	addq	$1, %rcx
	cmpl	%ecx, %esi
	jge	.L605
	addq	$1, %r14
	addq	$40, %r15
	cmpl	%r14d, %r13d
	jg	.L604
.L602:
	movslq	%r13d, %rdi
	salq	$2, %rdi
	call	my_malloc@PLT
	movslq	num_nets(%rip), %rdi
	movq	%rax, net_cost(%rip)
	salq	$2, %rdi
	call	my_malloc@PLT
	movslq	num_nets(%rip), %rsi
	movq	%rax, temp_net_cost(%rip)
	testl	%esi, %esi
	jle	.L629
	movq	%rax, %rdx
	shrq	$2, %rdx
	negq	%rdx
	andl	$3, %edx
	cmpl	%esi, %edx
	cmova	%esi, %edx
	cmpl	$6, %esi
	jg	.L1128
	movl	%esi, %edx
.L620:
	movss	.LC21(%rip), %xmm0
	cmpl	$1, %edx
	movss	%xmm0, (%rax)
	je	.L914
	cmpl	$2, %edx
	movss	%xmm0, 4(%rax)
	je	.L915
	cmpl	$3, %edx
	movss	%xmm0, 8(%rax)
	je	.L916
	cmpl	$4, %edx
	movss	%xmm0, 12(%rax)
	je	.L917
	cmpl	$6, %edx
	movss	%xmm0, 16(%rax)
	jne	.L918
	movss	%xmm0, 20(%rax)
	movl	$6, %ecx
.L622:
	cmpl	%esi, %edx
	je	.L629
.L621:
	movl	%esi, %r9d
	leal	-1(%rsi), %r11d
	movl	%edx, %r8d
	subl	%edx, %r9d
	leal	-4(%r9), %edi
	subl	%edx, %r11d
	shrl	$2, %edi
	addl	$1, %edi
	cmpl	$2, %r11d
	leal	0(,%rdi,4), %r10d
	jbe	.L624
	leaq	(%rax,%r8,4), %r8
	movaps	.LC22(%rip), %xmm0
	xorl	%edx, %edx
.L625:
	addl	$1, %edx
	addq	$16, %r8
	movaps	%xmm0, -16(%r8)
	cmpl	%edi, %edx
	jb	.L625
	addl	%r10d, %ecx
	cmpl	%r9d, %r10d
	je	.L629
.L624:
	movslq	%ecx, %rdx
	movss	.LC21(%rip), %xmm0
	movss	%xmm0, (%rax,%rdx,4)
	leal	1(%rcx), %edx
	cmpl	%edx, %esi
	jle	.L629
	movslq	%edx, %rdx
	movss	%xmm0, (%rax,%rdx,4)
	leal	2(%rcx), %edx
	cmpl	%edx, %esi
	jle	.L629
	movslq	%edx, %rdx
	movss	%xmm0, (%rax,%rdx,4)
.L629:
	movq	%rsi, %rdi
	salq	$4, %rdi
	call	my_malloc@PLT
	movslq	num_nets(%rip), %rdi
	movq	%rax, bb_coords(%rip)
	salq	$4, %rdi
	call	my_malloc@PLT
	movslq	num_nets(%rip), %rdi
	movl	$4, %esi
	movq	%rax, bb_num_on_edges(%rip)
	call	my_calloc@PLT
	movslq	num_blocks(%rip), %rdi
	movl	$4, %esi
	movq	%rax, duplicate_pins(%rip)
	call	my_calloc@PLT
	movl	num_nets(%rip), %ebx
	movq	%rax, %r12
	testl	%ebx, %ebx
	jle	.L619
	movq	net(%rip), %rbx
	xorl	%r11d, %r11d
	xorl	%r13d, %r13d
	xorl	%r9d, %r9d
	movl	%r11d, %r15d
	movl	%ebp, 16(%rsp)
.L630:
	leaq	0(%r13,%r13,4), %r8
	leaq	(%r8,%r8), %rbp
	leaq	(%rbx,%rbp), %rsi
	movl	8(%rsi), %eax
	testl	%eax, %eax
	js	.L634
	movq	16(%rsi), %rdi
	movl	$1, %edx
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L631:
	movslq	-4(%rdi,%rdx,4), %rax
	leaq	(%r12,%rax,4), %rcx
	movl	(%rcx), %eax
	addl	$1, %eax
	cmpl	$1, %eax
	movl	%eax, (%rcx)
	movl	%edx, %ecx
	setg	%al
	addq	$1, %rdx
	movzbl	%al, %eax
	addl	%eax, %r14d
	movl	8(%rsi), %eax
	cmpl	%eax, %ecx
	jle	.L631
	testl	%r14d, %r14d
	je	.L1129
	movq	duplicate_pins(%rip), %rax
	testl	%r9d, %r9d
	movl	%r14d, (%rax,%r13)
	je	.L635
	movq	unique_pin_list(%rip), %rbx
.L636:
	movl	8(%rsi), %edi
	leaq	(%r13,%r13), %r10
	addq	%r10, %rbx
	movq	%r10, 8(%rsp)
	addl	$1, %edi
	subl	%r14d, %edi
	movslq	%edi, %rdi
	salq	$2, %rdi
	call	my_malloc@PLT
	movq	%rax, (%rbx)
	movq	net(%rip), %rbx
	leaq	(%rbx,%rbp), %r8
	movl	8(%r8), %esi
	testl	%esi, %esi
	js	.L919
	movq	8(%rsp), %r10
	addq	unique_pin_list(%rip), %r10
	movl	$1, %eax
	movq	16(%r8), %r9
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L638:
	movslq	-4(%r9,%rax,4), %rcx
	movq	%rcx, %rdx
	leaq	(%r12,%rcx,4), %rcx
	movl	(%rcx), %r11d
	testl	%r11d, %r11d
	je	.L637
	movl	$0, (%rcx)
	movq	(%r10), %rcx
	movslq	%edi, %rsi
	addl	$1, %edi
	movl	%edx, (%rcx,%rsi,4)
	movl	8(%r8), %esi
.L637:
	movl	%eax, %edx
	addq	$1, %rax
	cmpl	%esi, %edx
	jle	.L638
.L919:
	movl	$1, %r9d
.L634:
	addl	$1, %r15d
	addq	$4, %r13
	cmpl	num_nets(%rip), %r15d
	jl	.L630
	movl	16(%rsp), %ebp
.L619:
	movq	%r12, %rdi
	call	free@PLT
	cmpl	$1, 40(%rsp)
	je	.L1130
	movl	40(%rsp), %eax
	testl	%eax, %eax
	jne	.L692
	movl	ny(%rip), %eax
	leal	1(%rax), %edi
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	my_malloc@PLT
	movl	ny(%rip), %r15d
	movq	%rax, chanx_place_cost_fac(%rip)
	testl	%r15d, %r15d
	js	.L659
	movq	%rax, %rbx
	xorl	%r14d, %r14d
	movl	$4, %r13d
	xorl	%r12d, %r12d
	jmp	.L660
.L1131:
	movq	chanx_place_cost_fac(%rip), %rbx
.L660:
	movq	%r13, %rdi
	addq	%r12, %rbx
	addl	$1, %r14d
	call	my_malloc@PLT
	addq	$8, %r12
	addq	$4, %r13
	cmpl	ny(%rip), %r14d
	movq	%rax, (%rbx)
	jle	.L1131
.L659:
	movl	nx(%rip), %eax
	leal	1(%rax), %edi
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	my_malloc@PLT
	movl	nx(%rip), %r14d
	movq	%rax, chany_place_cost_fac(%rip)
	testl	%r14d, %r14d
	js	.L920
	xorl	%r15d, %r15d
	movl	$4, %r13d
	xorl	%r12d, %r12d
	jmp	.L662
.L1132:
	movq	chany_place_cost_fac(%rip), %rax
.L662:
	movq	%r13, %rdi
	leaq	(%rax,%r12), %rbx
	addl	$1, %r15d
	call	my_malloc@PLT
	movl	nx(%rip), %r14d
	addq	$8, %r12
	addq	$4, %r13
	movq	%rax, (%rbx)
	cmpl	%r14d, %r15d
	jle	.L1132
	movq	chany_place_cost_fac(%rip), %r15
.L661:
	movq	chan_width_x(%rip), %rbx
	pxor	%xmm0, %xmm0
	movq	chanx_place_cost_fac(%rip), %r12
	cvtsi2ss	(%rbx), %xmm0
	movq	(%r12), %rax
	movss	%xmm0, (%rax)
	movl	ny(%rip), %eax
	cmpl	$0, %eax
	movl	%eax, 8(%rsp)
	jle	.L664
	movl	$1, %r13d
	jmp	.L674
.L1133:
	cmpl	$10, %r13d
	jbe	.L665
	movq	%rdx, %r9
	xorl	%ecx, %ecx
	shrq	$2, %r9
	negq	%r9
	andl	$3, %r9d
	je	.L666
	movss	(%rdx), %xmm1
	cmpl	$1, %r9d
	movl	$1, %ecx
	addss	%xmm0, %xmm1
	movss	%xmm1, (%rax)
	je	.L666
	movss	4(%rdx), %xmm1
	cmpl	$3, %r9d
	movl	$2, %ecx
	addss	%xmm0, %xmm1
	movss	%xmm1, 4(%rax)
	jne	.L666
	movss	8(%rdx), %xmm1
	movl	$3, %ecx
	addss	%xmm0, %xmm1
	movss	%xmm1, 8(%rax)
.L666:
	subl	%r9d, %r8d
	movl	%r9d, %r9d
	movq	%rax, 48(%rsp)
	salq	$2, %r9
	leal	-4(%r8), %edi
	leaq	(%rax,%r9), %r10
	movaps	%xmm0, %xmm1
	shrl	$2, %edi
	leaq	(%rdx,%r9), %r14
	xorl	%r9d, %r9d
	movq	%r10, 16(%rsp)
	addl	$1, %edi
	movq	16(%rsp), %rax
	shufps	$0, %xmm1, %xmm1
	leal	0(,%rdi,4), %r11d
	xorl	%r10d, %r10d
.L668:
	movaps	(%r14,%r9), %xmm2
	addl	$1, %r10d
	addps	%xmm1, %xmm2
	movups	%xmm2, (%rax,%r9)
	addq	$16, %r9
	cmpl	%edi, %r10d
	jb	.L668
	addl	%r11d, %ecx
	cmpl	%r8d, %r11d
	movq	48(%rsp), %rax
	je	.L673
	movslq	%ecx, %rdi
	movss	(%rdx,%rdi,4), %xmm1
	addss	%xmm0, %xmm1
	movss	%xmm1, (%rax,%rdi,4)
	leal	1(%rcx), %edi
	cmpl	%esi, %edi
	jge	.L673
	movslq	%edi, %rdi
	addl	$2, %ecx
	movss	(%rdx,%rdi,4), %xmm1
	cmpl	%ecx, %esi
	addss	%xmm0, %xmm1
	movss	%xmm1, (%rax,%rdi,4)
	jle	.L673
	movslq	%ecx, %rcx
	addss	(%rdx,%rcx,4), %xmm0
	movss	%xmm0, (%rax,%rcx,4)
.L673:
	addq	$1, %r13
	cmpl	%r13d, 8(%rsp)
	jl	.L676
.L674:
	pxor	%xmm0, %xmm0
	movq	-8(%r12,%r13,8), %rdx
	movq	(%r12,%r13,8), %rax
	movl	%r13d, %esi
	movl	%r13d, %r8d
	cvtsi2ss	(%rbx,%r13,4), %xmm0
	leaq	16(%rdx), %rcx
	cmpq	%rcx, %rax
	leaq	16(%rax), %rcx
	setnb	%dil
	cmpq	%rcx, %rdx
	setnb	%cl
	orb	%cl, %dil
	movss	%xmm0, (%rax,%r13,4)
	jne	.L1133
.L665:
	xorl	%ecx, %ecx
.L672:
	movss	(%rdx,%rcx,4), %xmm1
	addss	%xmm0, %xmm1
	movss	%xmm1, (%rax,%rcx,4)
	addq	$1, %rcx
	cmpl	%ecx, %esi
	jg	.L672
	addq	$1, %r13
	cmpl	%r13d, 8(%rsp)
	jge	.L674
.L676:
	pxor	%xmm5, %xmm5
	movq	%r12, %r14
	xorl	%ebx, %ebx
	cvtss2sd	32(%rsp), %xmm5
	movsd	%xmm5, 16(%rsp)
	movsd	.LC28(%rip), %xmm5
	movsd	%xmm5, 8(%rsp)
.L675:
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L678:
	movq	(%r14), %rax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	leaq	(%rax,%r12,4), %r13
	movl	%ebx, %eax
	subl	%r12d, %eax
	addq	$1, %r12
	cvtsi2sd	%eax, %xmm0
	cvtss2sd	0(%r13), %xmm1
	addsd	8(%rsp), %xmm0
	divsd	%xmm1, %xmm0
	movsd	16(%rsp), %xmm1
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 0(%r13)
	cvtss2sd	%xmm0, %xmm0
	call	pow@PLT
	pxor	%xmm6, %xmm6
	cmpl	%r12d, %ebx
	cvtsd2ss	%xmm0, %xmm6
	movss	%xmm6, 0(%r13)
	jge	.L678
	addl	$1, %ebx
	addq	$8, %r14
	cmpl	ny(%rip), %ebx
	jle	.L675
	movl	nx(%rip), %r14d
.L677:
	movq	chan_width_y(%rip), %r12
	pxor	%xmm0, %xmm0
	movq	(%r15), %rax
	cmpl	$0, %r14d
	cvtsi2ss	(%r12), %xmm0
	movss	%xmm0, (%rax)
	jle	.L679
	movl	$1, %r13d
	jmp	.L689
.L1134:
	cmpl	$10, %r13d
	jbe	.L680
	movq	%rdx, %r9
	xorl	%ecx, %ecx
	shrq	$2, %r9
	negq	%r9
	andl	$3, %r9d
	je	.L681
	movss	(%rdx), %xmm1
	cmpl	$1, %r9d
	movl	$1, %ecx
	addss	%xmm0, %xmm1
	movss	%xmm1, (%rax)
	je	.L681
	movss	4(%rdx), %xmm1
	cmpl	$3, %r9d
	movl	$2, %ecx
	addss	%xmm0, %xmm1
	movss	%xmm1, 4(%rax)
	jne	.L681
	movss	8(%rdx), %xmm1
	movl	$3, %ecx
	addss	%xmm0, %xmm1
	movss	%xmm1, 8(%rax)
.L681:
	subl	%r9d, %r8d
	movl	%r9d, %r9d
	movq	%rax, 16(%rsp)
	salq	$2, %r9
	leal	-4(%r8), %edi
	leaq	(%rax,%r9), %r10
	movaps	%xmm0, %xmm1
	shrl	$2, %edi
	leaq	(%rdx,%r9), %rbx
	xorl	%r9d, %r9d
	movq	%r10, 8(%rsp)
	addl	$1, %edi
	movq	8(%rsp), %rax
	shufps	$0, %xmm1, %xmm1
	leal	0(,%rdi,4), %r11d
	xorl	%r10d, %r10d
.L683:
	movaps	(%rbx,%r9), %xmm2
	addl	$1, %r10d
	addps	%xmm1, %xmm2
	movups	%xmm2, (%rax,%r9)
	addq	$16, %r9
	cmpl	%edi, %r10d
	jb	.L683
	addl	%r11d, %ecx
	cmpl	%r8d, %r11d
	movq	16(%rsp), %rax
	je	.L688
	movslq	%ecx, %rdi
	movss	(%rdx,%rdi,4), %xmm1
	addss	%xmm0, %xmm1
	movss	%xmm1, (%rax,%rdi,4)
	leal	1(%rcx), %edi
	cmpl	%edi, %esi
	jle	.L688
	movslq	%edi, %rdi
	addl	$2, %ecx
	movss	(%rdx,%rdi,4), %xmm1
	cmpl	%ecx, %esi
	addss	%xmm0, %xmm1
	movss	%xmm1, (%rax,%rdi,4)
	jle	.L688
	movslq	%ecx, %rcx
	addss	(%rdx,%rcx,4), %xmm0
	movss	%xmm0, (%rax,%rcx,4)
.L688:
	addq	$1, %r13
	cmpl	%r13d, %r14d
	jl	.L691
.L689:
	pxor	%xmm0, %xmm0
	movq	-8(%r15,%r13,8), %rdx
	movq	(%r15,%r13,8), %rax
	movl	%r13d, %esi
	movl	%r13d, %r8d
	cvtsi2ss	(%r12,%r13,4), %xmm0
	leaq	16(%rdx), %rcx
	cmpq	%rcx, %rax
	leaq	16(%rax), %rcx
	setnb	%dil
	cmpq	%rcx, %rdx
	setnb	%cl
	orb	%cl, %dil
	movss	%xmm0, (%rax,%r13,4)
	jne	.L1134
.L680:
	xorl	%ecx, %ecx
.L687:
	movss	(%rdx,%rcx,4), %xmm1
	addss	%xmm0, %xmm1
	movss	%xmm1, (%rax,%rcx,4)
	addq	$1, %rcx
	cmpl	%ecx, %esi
	jg	.L687
	addq	$1, %r13
	cmpl	%r13d, %r14d
	jge	.L689
.L691:
	pxor	%xmm6, %xmm6
	xorl	%ebx, %ebx
	movsd	.LC28(%rip), %xmm5
	cvtss2sd	32(%rsp), %xmm6
	movsd	%xmm5, 8(%rsp)
	movsd	%xmm6, 16(%rsp)
.L690:
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L693:
	movq	(%r15), %rax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	leaq	(%rax,%r12,4), %r13
	movl	%ebx, %eax
	subl	%r12d, %eax
	addq	$1, %r12
	cvtsi2sd	%eax, %xmm0
	cvtss2sd	0(%r13), %xmm1
	addsd	8(%rsp), %xmm0
	divsd	%xmm1, %xmm0
	movsd	16(%rsp), %xmm1
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 0(%r13)
	cvtss2sd	%xmm0, %xmm0
	call	pow@PLT
	pxor	%xmm7, %xmm7
	cmpl	%r12d, %ebx
	cvtsd2ss	%xmm0, %xmm7
	movss	%xmm7, 0(%r13)
	jge	.L693
	addl	$1, %ebx
	addq	$8, %r15
	cmpl	nx(%rip), %ebx
	jle	.L690
.L692:
	movq	$0, 72(%rsp)
	movq	$0, 64(%rsp)
.L655:
	movslq	num_types(%rip), %rdi
	movq	768(%rsp), %rax
	movq	%rax, 16(%rsp)
	salq	$3, %rdi
	call	my_malloc@PLT
	movslq	num_types(%rip), %rdi
	movl	$4, %esi
	movq	%rax, %r12
	call	my_calloc@PLT
	movslq	num_types(%rip), %rdi
	movl	$4, %esi
	movq	%rax, %rbx
	call	my_calloc@PLT
	movl	nx(%rip), %edx
	movq	%rax, %r13
	cmpl	$-1, %edx
	jl	.L694
	movl	ny(%rip), %eax
	movq	grid(%rip), %r10
	movl	$1, %r9d
.L695:
	cmpl	$-1, %eax
	jl	.L701
	movq	-8(%r10,%r9,8), %rsi
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L699:
	movq	(%rsi), %rcx
	movl	$0, 12(%rsi)
	movl	12(%rcx), %r14d
	testl	%r14d, %r14d
	jle	.L696
	movq	16(%rsi), %rdi
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L698:
	movl	$-1, -4(%rdi,%rax,4)
	movl	8(%rsi), %r11d
	testl	%r11d, %r11d
	jne	.L697
	movslq	144(%rcx), %rdx
	addl	$1, (%rbx,%rdx,4)
.L697:
	movl	%eax, %edx
	addq	$1, %rax
	cmpl	12(%rcx), %edx
	jl	.L698
	movl	ny(%rip), %eax
.L696:
	leal	1(%rax), %edx
	addl	$1, %r8d
	addq	$24, %rsi
	cmpl	%edx, %r8d
	jle	.L699
	movl	nx(%rip), %edx
.L701:
	leal	1(%rdx), %ecx
	movl	%r9d, %esi
	addq	$1, %r9
	cmpl	%ecx, %esi
	jle	.L695
	movl	num_types(%rip), %edi
	testl	%edi, %edi
	jle	.L702
.L903:
	movl	$1, %r14d
.L703:
	movslq	-4(%rbx,%r14,4), %rax
	leaq	(%rax,%rax,2), %rdi
	salq	$2, %rdi
	call	my_malloc@PLT
	movq	%rax, -8(%r12,%r14,8)
	movl	%r14d, %eax
	addq	$1, %r14
	cmpl	num_types(%rip), %eax
	jl	.L703
	movl	nx(%rip), %edx
.L702:
	cmpl	$-1, %edx
	jl	.L704
	movl	ny(%rip), %ecx
	movq	grid(%rip), %r11
	xorl	%r10d, %r10d
.L705:
	cmpl	$-1, %ecx
	jl	.L711
	movq	(%r11), %rdi
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L712:
	movq	(%rdi), %r8
	xorl	%eax, %eax
	movl	12(%r8), %edx
	testl	%edx, %edx
	jle	.L710
	.p2align 4,,10
	.p2align 3
.L996:
	movl	8(%rdi), %esi
	testl	%esi, %esi
	jne	.L706
	movslq	144(%r8), %rdx
	movq	(%r12,%rdx,8), %rcx
	leaq	0(%r13,%rdx,4), %rdx
	movslq	(%rdx), %rsi
	leaq	(%rsi,%rsi,2), %rsi
	movl	%r10d, (%rcx,%rsi,4)
	movslq	(%rdx), %rsi
	leaq	(%rsi,%rsi,2), %rsi
	movl	%r9d, 4(%rcx,%rsi,4)
	movslq	(%rdx), %rsi
	leaq	(%rsi,%rsi,2), %rsi
	movl	%eax, 8(%rcx,%rsi,4)
	addl	$1, (%rdx)
	movl	12(%r8), %edx
.L706:
	addl	$1, %eax
	cmpl	%edx, %eax
	jl	.L996
	movl	ny(%rip), %ecx
.L710:
	leal	1(%rcx), %eax
	addl	$1, %r9d
	addq	$24, %rdi
	cmpl	%eax, %r9d
	jle	.L712
	movl	nx(%rip), %edx
.L711:
	leal	1(%rdx), %eax
	addl	$1, %r10d
	addq	$8, %r11
	cmpl	%eax, %r10d
	jle	.L705
.L704:
	cmpl	$2, 196(%rsp)
	movl	num_blocks(%rip), %edx
	setne	8(%rsp)
	xorl	%r14d, %r14d
	testl	%edx, %edx
	jle	.L720
	movq	%r13, 32(%rsp)
	movl	%ebp, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L995:
	movq	block(%rip), %rcx
	leaq	(%r14,%r14,4), %rax
	movl	%r14d, %r13d
	leaq	(%rcx,%rax,8), %rax
	movq	8(%rax), %rax
	cmpq	%rax, IO_TYPE(%rip)
	jne	.L940
	cmpb	$0, 8(%rsp)
	je	.L716
.L940:
	movslq	144(%rax), %r15
	leaq	(%rbx,%r15,4), %rbp
	movl	0(%rbp), %eax
	testl	%eax, %eax
	jle	.L1135
	leal	-1(%rax), %edi
	call	my_irand@PLT
	movq	(%r12,%r15,8), %rdi
	cltq
	leaq	(%rax,%rax,2), %rax
	leaq	(%rdi,%rax,4), %rax
	movslq	4(%rax), %rsi
	movslq	(%rax), %r9
	leaq	(%rsi,%rsi,2), %r8
	movq	grid(%rip), %rsi
	movq	(%rsi,%r9,8), %rsi
	movslq	8(%rax), %r9
	leaq	(%rsi,%r8,8), %rsi
	movq	16(%rsi), %r8
	movl	%r13d, (%r8,%r9,4)
	addl	$1, 12(%rsi)
	movslq	0(%rbp), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	leaq	(%rdi,%rcx,4), %rcx
	movq	-12(%rcx), %rsi
	movq	%rsi, (%rax)
	movl	-4(%rcx), %ecx
	movl	%ecx, 8(%rax)
	subl	$1, 0(%rbp)
	movl	num_blocks(%rip), %edx
.L716:
	leal	1(%r14), %eax
	addq	$1, %r14
	cmpl	%edx, %eax
	jl	.L995
	movq	32(%rsp), %r13
	movl	48(%rsp), %ebp
.L720:
	cmpl	$2, 196(%rsp)
	je	.L1136
.L715:
	movl	nx(%rip), %eax
	addl	$1, %eax
	movl	%eax, 8(%rsp)
	js	.L721
	movl	ny(%rip), %eax
	movq	grid(%rip), %r15
	xorl	%r14d, %r14d
	movq	block(%rip), %r9
	leal	1(%rax), %r11d
.L722:
	testl	%r11d, %r11d
	movl	%r14d, %r8d
	js	.L725
	movq	(%r15,%r14,8), %r10
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L729:
	movq	(%r10), %rax
	movl	12(%rax), %ecx
	testl	%ecx, %ecx
	jle	.L726
	movq	16(%r10), %rsi
	testq	%rsi, %rsi
	je	.L727
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L724:
	movslq	(%rsi,%rdx,4), %rax
	cmpl	$-1, %eax
	je	.L723
	leaq	(%rax,%rax,4), %rax
	leaq	(%r9,%rax,8), %rax
	movl	%r8d, 24(%rax)
	movl	%edi, 28(%rax)
	movl	%edx, 32(%rax)
.L723:
	addq	$1, %rdx
	cmpl	%edx, %ecx
	jg	.L724
.L726:
	addl	$1, %edi
	addq	$24, %r10
	cmpl	%r11d, %edi
	jle	.L729
.L725:
	addq	$1, %r14
	cmpl	%r14d, 8(%rsp)
	jge	.L722
.L721:
	movl	num_types(%rip), %r15d
	movl	$1, %r14d
	testl	%r15d, %r15d
	jle	.L734
.L994:
	movq	-8(%r12,%r14,8), %rdi
	call	free@PLT
	movl	%r14d, %eax
	addq	$1, %r14
	cmpl	num_types(%rip), %eax
	jl	.L994
.L734:
	movq	%r12, %rdi
	call	free@PLT
	movq	%r13, %rdi
	call	free@PLT
	movq	%rbx, %rdi
	call	free@PLT
	pxor	%xmm0, %xmm0
	cvtsi2ss	272(%rsp), %xmm0
	call	init_draw_coords@PLT
	cmpl	$1, 44(%rsp)
	jbe	.L1137
	movl	40(%rsp), %esi
	movl	%ebp, %edx
	xorl	%edi, %edi
	call	comp_bb_cost
	pxor	%xmm3, %xmm3
	leaq	336(%rsp), %rax
	movss	.LC8(%rip), %xmm5
	movl	$0, 256(%rsp)
	movq	%rax, 224(%rsp)
	leaq	324(%rsp), %rax
	movss	%xmm0, 328(%rsp)
	movss	%xmm0, 320(%rsp)
	movl	$0, 232(%rsp)
	movss	%xmm3, 324(%rsp)
	movq	%rax, 48(%rsp)
	movss	%xmm3, 336(%rsp)
	movss	%xmm3, 184(%rsp)
	movss	%xmm3, 56(%rsp)
	movss	%xmm3, 32(%rsp)
	movss	%xmm3, 188(%rsp)
	movss	%xmm3, 176(%rsp)
	movss	%xmm5, 164(%rsp)
.L755:
	pxor	%xmm6, %xmm6
	pxor	%xmm0, %xmm0
	movsd	.LC32(%rip), %xmm1
	cvtss2sd	812(%rsp), %xmm6
	cvtsi2sd	num_blocks(%rip), %xmm0
	movsd	%xmm6, 8(%rsp)
	call	pow@PLT
	mulsd	8(%rsp), %xmm0
	movl	192(%rsp), %r11d
	testl	%r11d, %r11d
	cvttsd2si	%xmm0, %ebx
	leal	1(%rbx), %eax
	movl	%eax, 180(%rsp)
	je	.L757
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ss	%ebx, %xmm0
	cvtsi2ss	192(%rsp), %xmm1
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	addsd	.LC7(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, 180(%rsp)
.L757:
	testl	%ebx, %ebx
	movl	$1, %eax
	movl	ny(%rip), %edx
	cmovle	%eax, %ebx
	movslq	nx(%rip), %rax
	cmpl	%edx, %eax
	jle	.L758
	pxor	%xmm7, %xmm7
	cvtsi2ss	%eax, %xmm7
	movss	%xmm7, 16(%rsp)
	movaps	%xmm7, %xmm0
.L759:
	movss	164(%rsp), %xmm7
	movl	196(%rsp), %r10d
	subss	%xmm7, %xmm0
	leaq	0(,%rax,4), %rdi
	xorl	%r14d, %r14d
	testl	%r10d, %r10d
	setne	%r14b
	divss	%xmm0, %xmm7
	movss	%xmm7, 296(%rsp)
	movss	816(%rsp), %xmm7
	movss	%xmm7, 8(%rsp)
	call	my_malloc@PLT
	cmpl	$1, 208(%rsp)
	movq	%rax, 96(%rsp)
	je	.L1138
	cmpl	%ebx, num_blocks(%rip)
	movl	%ebx, %r13d
	cmovle	num_blocks(%rip), %r13d
	testl	%r13d, %r13d
	jle	.L928
	pxor	%xmm5, %xmm5
	leaq	320(%rsp), %rax
	xorl	%r10d, %r10d
	xorl	%r12d, %r12d
	leaq	328(%rsp), %r15
	movq	%rax, 80(%rsp)
	movapd	%xmm5, %xmm6
	movsd	%xmm5, 152(%rsp)
	jmp	.L763
.L762:
	addl	$1, %r10d
	cmpl	%r10d, %r13d
	je	.L1139
.L763:
	movsd	%xmm5, 112(%rsp)
	movl	%r10d, 8(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 744
	movsd	%xmm6, 112(%rsp)
	pushq	104(%rsp)
	.cfi_def_cfa_offset 752
	pushq	240(%rsp)
	.cfi_def_cfa_offset 760
	movl	244(%rsp), %eax
	movq	%r15, %rsi
	movss	.LC33(%rip), %xmm0
	pushq	%rax
	.cfi_def_cfa_offset 768
	pushq	%r14
	.cfi_def_cfa_offset 776
	pushq	%rbp
	.cfi_def_cfa_offset 784
	movq	120(%rsp), %r9
	movq	112(%rsp), %r8
	movl	88(%rsp), %ecx
	movq	96(%rsp), %rdx
	movq	128(%rsp), %rdi
	movss	104(%rsp), %xmm4
	movss	80(%rsp), %xmm3
	movss	72(%rsp), %xmm2
	movss	64(%rsp), %xmm1
	call	try_swap
	addq	$48, %rsp
	.cfi_def_cfa_offset 736
	cmpl	$1, %eax
	movl	8(%rsp), %r10d
	movsd	104(%rsp), %xmm6
	movsd	112(%rsp), %xmm5
	jne	.L762
	pxor	%xmm1, %xmm1
	movss	320(%rsp), %xmm0
	addl	$1, %r10d
	addl	$1, %r12d
	cmpl	%r10d, %r13d
	cvtss2sd	%xmm0, %xmm1
	mulss	%xmm0, %xmm0
	addsd	%xmm1, %xmm6
	cvtss2sd	%xmm0, %xmm0
	addsd	%xmm0, %xmm5
	jne	.L763
.L1139:
	testl	%r12d, %r12d
	je	.L929
	pxor	%xmm0, %xmm0
	cmpl	$1, %r12d
	cvtsi2sd	%r12d, %xmm0
	divsd	%xmm0, %xmm6
	je	.L930
	leal	-1(%r12), %eax
	mulsd	%xmm6, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	mulsd	%xmm6, %xmm0
	movsd	152(%rsp), %xmm6
	subsd	%xmm0, %xmm5
	movapd	%xmm5, %xmm0
	divsd	%xmm1, %xmm0
	ucomisd	%xmm6, %xmm0
	jbe	.L1086
	ucomisd	%xmm0, %xmm6
	sqrtsd	%xmm0, %xmm1
	ja	.L1140
.L761:
	cmpl	%r12d, %r13d
	je	.L766
.L764:
	leaq	.LC34(%rip), %rdi
	movl	%r13d, %edx
	movl	%r12d, %esi
	xorl	%eax, %eax
	movsd	%xmm1, 8(%rsp)
	call	printf@PLT
	movsd	8(%rsp), %xmm1
.L766:
	movq	96(%rsp), %rdi
	movsd	%xmm1, 8(%rsp)
	call	free@PLT
	movsd	8(%rsp), %xmm1
	pxor	%xmm6, %xmm6
	mulsd	.LC35(%rip), %xmm1
	cvtsd2ss	%xmm1, %xmm6
	movss	%xmm6, 8(%rsp)
.L760:
	pxor	%xmm0, %xmm0
	leaq	.LC36(%rip), %rdi
	movl	$4, %eax
	pxor	%xmm3, %xmm3
	pxor	%xmm2, %xmm2
	pxor	%xmm1, %xmm1
	cvtss2sd	320(%rsp), %xmm0
	cvtss2sd	336(%rsp), %xmm3
	cvtss2sd	324(%rsp), %xmm2
	cvtss2sd	328(%rsp), %xmm1
	call	printf@PLT
	leaq	.LC43(%rip), %rax
	leaq	.LC37(%rip), %r9
	leaq	.LC38(%rip), %r8
	leaq	.LC39(%rip), %rcx
	leaq	.LC40(%rip), %rdx
	leaq	.LC41(%rip), %rsi
	pushq	%rax
	.cfi_def_cfa_offset 744
	leaq	.LC44(%rip), %rax
	leaq	.LC42(%rip), %rdi
	pushq	%rax
	.cfi_def_cfa_offset 752
	leaq	.LC45(%rip), %rax
	pushq	%rax
	.cfi_def_cfa_offset 760
	leaq	.LC46(%rip), %rax
	pushq	%rax
	.cfi_def_cfa_offset 768
	leaq	.LC47(%rip), %rax
	pushq	%rax
	.cfi_def_cfa_offset 776
	leaq	.LC48(%rip), %rax
	pushq	%rax
	.cfi_def_cfa_offset 784
	leaq	.LC49(%rip), %rax
	pushq	%rax
	.cfi_def_cfa_offset 792
	leaq	.LC50(%rip), %rax
	pushq	%rax
	.cfi_def_cfa_offset 800
	xorl	%eax, %eax
	call	printf@PLT
	leaq	.LC56(%rip), %rax
	leaq	.LC53(%rip), %rdx
	leaq	.LC55(%rip), %rcx
	addq	$64, %rsp
	.cfi_def_cfa_offset 736
	leaq	.LC52(%rip), %r8
	leaq	.LC51(%rip), %r9
	pushq	%rcx
	.cfi_def_cfa_offset 744
	leaq	.LC54(%rip), %rsi
	pushq	%rdx
	.cfi_def_cfa_offset 752
	leaq	.LC42(%rip), %rdi
	pushq	%rax
	.cfi_def_cfa_offset 760
	pushq	%rax
	.cfi_def_cfa_offset 768
	pushq	%rax
	.cfi_def_cfa_offset 776
	pushq	%rax
	.cfi_def_cfa_offset 784
	xorl	%eax, %eax
	pushq	%rcx
	.cfi_def_cfa_offset 792
	pushq	%rdx
	.cfi_def_cfa_offset 800
	movq	%r8, %rcx
	call	printf@PLT
	pxor	%xmm0, %xmm0
	addq	$64, %rsp
	.cfi_def_cfa_offset 736
	pxor	%xmm4, %xmm4
	leaq	368(%rsp), %rax
	pxor	%xmm3, %xmm3
	movl	272(%rsp), %edx
	pxor	%xmm2, %xmm2
	cvtss2sd	320(%rsp), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	176(%rsp), %xmm4
	cvtss2sd	336(%rsp), %xmm3
	leaq	.LC57(%rip), %rsi
	movq	%rax, %r13
	cvtss2sd	324(%rsp), %xmm2
	movq	%rax, %rdi
	movq	%rax, 240(%rsp)
	cvtss2sd	328(%rsp), %xmm1
	movl	$5, %eax
	call	sprintf@PLT
	xorl	%ecx, %ecx
	movl	$1, %edx
	movq	%r13, %rsi
	movl	$1, %edi
	call	update_screen@PLT
	leal	-1(%rbp), %eax
	movss	824(%rsp), %xmm5
	movss	%xmm5, 260(%rsp)
	movl	$0, 168(%rsp)
	movl	$0, 204(%rsp)
	movq	%rax, %rdx
	movl	%eax, 300(%rsp)
	addq	$1, %rax
	salq	$4, %rax
	salq	$4, %rdx
	cmpl	$1, 208(%rsp)
	leaq	24(%rdx), %rdi
	movq	%rax, 280(%rsp)
	leal	-1(%rbx), %eax
	movl	220(%rsp), %r12d
	movq	%r15, 96(%rsp)
	movq	%rdi, 288(%rsp)
	movl	%eax, 236(%rsp)
	movq	224(%rsp), %r13
	je	.L1141
.L823:
	pxor	%xmm0, %xmm0
	pxor	%xmm2, %xmm2
	pxor	%xmm1, %xmm1
	cvtss2sd	320(%rsp), %xmm0
	cvtsi2sd	num_nets(%rip), %xmm2
	mulsd	.LC72(%rip), %xmm0
	cvtss2sd	8(%rsp), %xmm1
	divsd	%xmm2, %xmm0
	ucomisd	%xmm1, %xmm0
	ja	.L1117
.L825:
	cmpl	$1, 44(%rsp)
	jbe	.L1142
.L899:
	movsd	152(%rsp), %xmm6
	movl	$1, 144(%rsp)
	xorl	%r15d, %r15d
	movl	$0, 160(%rsp)
	movsd	%xmm6, 104(%rsp)
	movsd	%xmm6, 136(%rsp)
	movsd	%xmm6, 128(%rsp)
	movsd	%xmm6, 120(%rsp)
	movsd	%xmm6, 112(%rsp)
	jmp	.L777
	.p2align 4,,10
	.p2align 3
.L771:
	cmpl	$1, 44(%rsp)
	jbe	.L1143
.L772:
	addl	$1, %r15d
	cmpl	%ebx, %r15d
	jge	.L1144
.L777:
	subq	$8, %rsp
	.cfi_def_cfa_offset 744
	pushq	96(%rsp)
	.cfi_def_cfa_offset 752
	pushq	%r13
	.cfi_def_cfa_offset 760
	pushq	%r12
	.cfi_def_cfa_offset 768
	pushq	%r14
	.cfi_def_cfa_offset 776
	pushq	%rbp
	.cfi_def_cfa_offset 784
	movq	120(%rsp), %r9
	movq	112(%rsp), %r8
	movl	88(%rsp), %ecx
	movq	96(%rsp), %rdx
	movq	144(%rsp), %rsi
	movq	128(%rsp), %rdi
	movss	104(%rsp), %xmm4
	movss	80(%rsp), %xmm3
	movss	72(%rsp), %xmm2
	movss	64(%rsp), %xmm1
	movss	56(%rsp), %xmm0
	call	try_swap
	addq	$48, %rsp
	.cfi_def_cfa_offset 736
	cmpl	$1, %eax
	jne	.L771
	pxor	%xmm1, %xmm1
	movss	320(%rsp), %xmm0
	addl	$1, 160(%rsp)
	cmpl	$1, 44(%rsp)
	cvtss2sd	%xmm0, %xmm1
	mulss	%xmm0, %xmm0
	addsd	112(%rsp), %xmm1
	cvtss2sd	%xmm0, %xmm0
	addsd	104(%rsp), %xmm0
	movsd	%xmm1, 112(%rsp)
	pxor	%xmm1, %xmm1
	cvtss2sd	328(%rsp), %xmm1
	movsd	%xmm0, 104(%rsp)
	addsd	120(%rsp), %xmm1
	movsd	%xmm1, 120(%rsp)
	pxor	%xmm1, %xmm1
	cvtss2sd	324(%rsp), %xmm1
	addsd	128(%rsp), %xmm1
	movsd	%xmm1, 128(%rsp)
	pxor	%xmm1, %xmm1
	cvtss2sd	336(%rsp), %xmm1
	addsd	136(%rsp), %xmm1
	movsd	%xmm1, 136(%rsp)
	ja	.L772
.L1143:
	movl	144(%rsp), %eax
	cmpl	%eax, 180(%rsp)
	jle	.L773
	addl	$1, %r15d
	addl	$1, %eax
	cmpl	%ebx, %r15d
	movl	%eax, 144(%rsp)
	jl	.L777
.L1144:
	addl	%ebx, 168(%rsp)
	movl	168(%rsp), %eax
	cmpl	$50000, %eax
	jg	.L1145
.L778:
	movl	160(%rsp), %eax
	pxor	%xmm8, %xmm8
	pxor	%xmm0, %xmm0
	addl	%ebx, 204(%rsp)
	cvtsi2ss	%eax, %xmm8
	testl	%eax, %eax
	cvtsi2ss	%ebx, %xmm0
	divss	%xmm0, %xmm8
	jne	.L807
	pxor	%xmm1, %xmm1
	pxor	%xmm2, %xmm2
	pxor	%xmm3, %xmm3
	pxor	%xmm4, %xmm4
	cvtss2sd	320(%rsp), %xmm1
	pxor	%xmm5, %xmm5
	cvtss2sd	328(%rsp), %xmm2
	cvtss2sd	324(%rsp), %xmm3
	cvtss2sd	336(%rsp), %xmm4
.L808:
	pxor	%xmm7, %xmm7
	subq	$32, %rsp
	.cfi_def_cfa_offset 768
	cvtss2sd	%xmm8, %xmm8
	pxor	%xmm6, %xmm6
	leaq	.LC63(%rip), %rdi
	pxor	%xmm9, %xmm9
	movl	$8, %eax
	cvtss2sd	48(%rsp), %xmm7
	pxor	%xmm0, %xmm0
	cvtss2sd	208(%rsp), %xmm6
	movsd	%xmm7, 144(%rsp)
	cvtss2sd	40(%rsp), %xmm9
	movsd	%xmm6, 152(%rsp)
	movl	236(%rsp), %esi
	movsd	%xmm5, (%rsp)
	pxor	%xmm5, %xmm5
	cvtss2sd	216(%rsp), %xmm0
	movsd	%xmm7, 8(%rsp)
	movapd	%xmm8, %xmm7
	movsd	%xmm0, 16(%rsp)
	movapd	%xmm9, %xmm0
	cvtss2sd	220(%rsp), %xmm5
	movsd	%xmm8, 160(%rsp)
	movsd	%xmm9, 136(%rsp)
	call	printf@PLT
	movss	852(%rsp), %xmm0
	addq	$32, %rsp
	.cfi_def_cfa_offset 736
	cmpl	$1, 208(%rsp)
	movsd	104(%rsp), %xmm9
	movsd	128(%rsp), %xmm8
	je	.L1146
	ucomisd	.LC64(%rip), %xmm8
	jbe	.L1094
	movss	8(%rsp), %xmm7
	mulss	.LC27(%rip), %xmm7
	movss	%xmm7, 104(%rsp)
	movaps	%xmm7, %xmm0
.L811:
	divss	8(%rsp), %xmm0
	leaq	.LC69(%rip), %rdi
	movl	$1, %eax
	movsd	%xmm8, 16(%rsp)
	cvtss2sd	%xmm0, %xmm0
	call	printf@PLT
	pxor	%xmm0, %xmm0
	movq	240(%rsp), %r15
	pxor	%xmm3, %xmm3
	leaq	.LC70(%rip), %rsi
	pxor	%xmm2, %xmm2
	movl	$5, %eax
	pxor	%xmm1, %xmm1
	cvtss2sd	320(%rsp), %xmm0
	movsd	120(%rsp), %xmm4
	movq	%r15, %rdi
	cvtss2sd	104(%rsp), %xmm3
	cvtss2sd	324(%rsp), %xmm2
	cvtss2sd	328(%rsp), %xmm1
	call	sprintf@PLT
	xorl	%ecx, %ecx
	xorl	%edi, %edi
	movl	$1, %edx
	movq	%r15, %rsi
	call	update_screen@PLT
	movsd	16(%rsp), %xmm8
	movl	nx(%rip), %eax
	cmpl	%eax, ny(%rip)
	pxor	%xmm0, %xmm0
	addsd	.LC71(%rip), %xmm8
	cmovge	ny(%rip), %eax
	pxor	%xmm6, %xmm6
	cmpl	$1, 44(%rsp)
	cvtsi2ss	%eax, %xmm0
	mulsd	112(%rsp), %xmm8
	cvtsd2ss	%xmm8, %xmm6
	minss	%xmm6, %xmm0
	maxss	164(%rsp), %xmm0
	movss	%xmm0, 16(%rsp)
	jbe	.L1147
.L822:
	cmpl	$1, 208(%rsp)
	movss	104(%rsp), %xmm5
	movss	%xmm5, 8(%rsp)
	jne	.L823
.L1141:
	movss	260(%rsp), %xmm7
	ucomiss	8(%rsp), %xmm7
	jbe	.L825
.L1117:
	cmpl	$1, 44(%rsp)
	movq	96(%rsp), %r15
	jbe	.L1148
.L897:
	movsd	152(%rsp), %xmm5
	leal	-1(%rbx), %eax
	movl	$1, %r11d
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	movl	%ebx, 128(%rsp)
	movsd	%xmm5, 120(%rsp)
	movl	%eax, 136(%rsp)
	movsd	%xmm5, 112(%rsp)
	movsd	%xmm5, 104(%rsp)
	movsd	%xmm5, 96(%rsp)
	movsd	%xmm5, 8(%rsp)
	jmp	.L834
	.p2align 4,,10
	.p2align 3
.L829:
	addl	$1, %r12d
	cmpl	128(%rsp), %r12d
	jge	.L1149
.L834:
	movl	%r11d, 144(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 744
	movq	%r15, %rsi
	pushq	96(%rsp)
	.cfi_def_cfa_offset 752
	pushq	240(%rsp)
	.cfi_def_cfa_offset 760
	movl	244(%rsp), %eax
	pxor	%xmm0, %xmm0
	pushq	%rax
	.cfi_def_cfa_offset 768
	pushq	%r14
	.cfi_def_cfa_offset 776
	pushq	%rbp
	.cfi_def_cfa_offset 784
	movq	120(%rsp), %r9
	movq	112(%rsp), %r8
	movl	88(%rsp), %ecx
	movq	96(%rsp), %rdx
	movq	128(%rsp), %rdi
	movss	104(%rsp), %xmm4
	movss	80(%rsp), %xmm3
	movss	72(%rsp), %xmm2
	movss	64(%rsp), %xmm1
	call	try_swap
	addq	$48, %rsp
	.cfi_def_cfa_offset 736
	cmpl	$1, %eax
	movl	%eax, %ebx
	movl	144(%rsp), %r11d
	jne	.L829
	pxor	%xmm1, %xmm1
	movss	320(%rsp), %xmm0
	pxor	%xmm2, %xmm2
	addl	$1, %r13d
	cmpl	$1, 44(%rsp)
	cvtss2sd	%xmm0, %xmm1
	mulss	%xmm0, %xmm0
	addsd	8(%rsp), %xmm1
	cvtss2sd	%xmm0, %xmm0
	addsd	120(%rsp), %xmm0
	movsd	%xmm1, 8(%rsp)
	pxor	%xmm1, %xmm1
	cvtss2sd	328(%rsp), %xmm1
	movsd	%xmm0, 120(%rsp)
	addsd	96(%rsp), %xmm1
	movsd	%xmm1, 96(%rsp)
	movss	336(%rsp), %xmm1
	cvtss2sd	%xmm1, %xmm2
	addsd	112(%rsp), %xmm2
	movsd	%xmm2, 112(%rsp)
	pxor	%xmm2, %xmm2
	cvtss2sd	324(%rsp), %xmm2
	addsd	104(%rsp), %xmm2
	movsd	%xmm2, 104(%rsp)
	ja	.L829
	cmpl	%r11d, 180(%rsp)
	jg	.L1116
	cmpl	%r12d, 136(%rsp)
	je	.L1116
	cmpl	$1, 220(%rsp)
	jne	.L833
	pxor	%xmm0, %xmm0
	movq	360(%rsp), %rdi
	cvtsi2ss	232(%rsp), %xmm0
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm1, 188(%rsp)
	call	load_constant_net_delay@PLT
.L833:
	movq	360(%rsp), %rdi
	call	load_timing_graph_net_delays@PLT
	movq	352(%rsp), %rdi
	pxor	%xmm0, %xmm0
	call	load_net_slack@PLT
	movl	220(%rsp), %eax
	movss	24(%rsp), %xmm7
	movss	200(%rsp), %xmm5
	movl	%ebp, 780(%rsp)
	movss	%xmm0, 176(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 744
	movl	%eax, 744(%rsp)
	movl	48(%rsp), %eax
	movss	%xmm7, 748(%rsp)
	movss	%xmm5, 804(%rsp)
	movl	%eax, 756(%rsp)
	movl	204(%rsp), %eax
	movl	%eax, 768(%rsp)
	movl	220(%rsp), %eax
	movl	%eax, 792(%rsp)
	movl	224(%rsp), %eax
	movl	%eax, 796(%rsp)
	movl	200(%rsp), %eax
	movl	%eax, 800(%rsp)
	pushq	808(%rsp)
	.cfi_def_cfa_offset 752
	pushq	808(%rsp)
	.cfi_def_cfa_offset 760
	pushq	808(%rsp)
	.cfi_def_cfa_offset 768
	pushq	808(%rsp)
	.cfi_def_cfa_offset 776
	pushq	808(%rsp)
	.cfi_def_cfa_offset 784
	pushq	808(%rsp)
	.cfi_def_cfa_offset 792
	pushq	808(%rsp)
	.cfi_def_cfa_offset 800
	pushq	808(%rsp)
	.cfi_def_cfa_offset 808
	pushq	808(%rsp)
	.cfi_def_cfa_offset 816
	movq	432(%rsp), %rdi
	movss	264(%rsp), %xmm1
	call	load_criticalities@PLT
	addq	$80, %rsp
	.cfi_def_cfa_offset 736
	movq	224(%rsp), %rsi
	movq	48(%rsp), %rdi
	call	comp_td_costs
	jmp	.L831
	.p2align 4,,10
	.p2align 3
.L635:
	movslq	num_nets(%rip), %rdi
	movl	$8, %esi
	call	my_calloc@PLT
	movq	%rbp, %rsi
	movq	%rax, unique_pin_list(%rip)
	addq	net(%rip), %rsi
	movq	%rax, %rbx
	jmp	.L636
.L1129:
	testl	%eax, %eax
	js	.L634
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L639:
	movslq	-4(%rdi,%rax,4), %rdx
	movl	$0, (%r12,%rdx,4)
	movl	%eax, %edx
	addq	$1, %rax
	cmpl	8(%rsi), %edx
	jle	.L639
	jmp	.L634
.L727:
	leaq	__PRETTY_FUNCTION__.5374(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC30(%rip), %rdi
	movl	$3680, %edx
	call	__assert_fail@PLT
.L1128:
	xorl	%ecx, %ecx
	testl	%edx, %edx
	je	.L621
	jmp	.L620
	.p2align 4,,10
	.p2align 3
.L758:
	pxor	%xmm5, %xmm5
	cvtsi2ss	%edx, %xmm5
	movss	%xmm5, 16(%rsp)
	movaps	%xmm5, %xmm0
	jmp	.L759
.L1136:
	movq	16(%rsp), %rdi
	call	read_user_pad_loc@PLT
	jmp	.L715
.L1130:
	leal	-1(%rbp), %ebx
	leal	1(%rbp), %r12d
	xorl	%edx, %edx
	xorl	%edi, %edi
	movl	$16, %r8d
	movl	%ebx, %ecx
	movl	%ebx, %esi
	movslq	%r12d, %r12
	call	alloc_matrix@PLT
	salq	$2, %r12
	xorl	%edx, %edx
	movl	$16, %r8d
	movl	%ebx, %ecx
	movl	%ebx, %esi
	xorl	%edi, %edi
	movq	%rax, place_region_x(%rip)
	call	alloc_matrix@PLT
	movq	%r12, %rdi
	movq	%rax, place_region_y(%rip)
	call	my_malloc@PLT
	movq	%r12, %rdi
	movq	%rax, place_region_bounds_x(%rip)
	call	my_malloc@PLT
	testl	%ebp, %ebp
	movq	%rax, place_region_bounds_y(%rip)
	jle	.L641
	movl	ny(%rip), %r8d
	pxor	%xmm7, %xmm7
	pxor	%xmm5, %xmm5
	movq	place_region_x(%rip), %r9
	pxor	%xmm3, %xmm3
	movl	%ebx, %edx
	cvtsi2ss	%r8d, %xmm7
	movq	chan_width_x(%rip), %r12
	leaq	8(%r9,%rdx,8), %r15
	xorl	%r13d, %r13d
	cvtsi2ss	%ebp, %xmm5
	xorl	%r14d, %r14d
	movl	%ebx, %esi
	movaps	%xmm3, %xmm6
	movsd	.LC7(%rip), %xmm4
	movss	%xmm7, 16(%rsp)
	movss	.LC8(%rip), %xmm7
	movss	%xmm7, 164(%rsp)
.L647:
	divss	%xmm5, %xmm6
	addl	$1, %r14d
	movss	%xmm3, 112(%rsp)
	movss	16(%rsp), %xmm7
	movl	$1, %ebx
	movl	%r8d, 104(%rsp)
	movsd	%xmm4, 64(%rsp)
	movq	%r9, 96(%rsp)
	movq	%rax, 80(%rsp)
	movss	%xmm5, 48(%rsp)
	movl	%esi, 72(%rsp)
	movaps	%xmm6, %xmm1
	pxor	%xmm6, %xmm6
	mulss	%xmm7, %xmm1
	cvtsi2ss	%r14d, %xmm6
	addss	164(%rsp), %xmm1
	movss	%xmm1, 32(%rsp)
	movaps	%xmm6, %xmm0
	movss	%xmm6, 56(%rsp)
	divss	%xmm5, %xmm0
	mulss	%xmm7, %xmm0
	movss	%xmm0, 8(%rsp)
	movaps	%xmm1, %xmm0
	call	floorf@PLT
	cvttss2si	%xmm0, %edx
	movss	8(%rsp), %xmm0
	testl	%edx, %edx
	cmovg	%edx, %ebx
	call	ceilf@PLT
	cvttss2si	%xmm0, %edi
	movl	104(%rsp), %r8d
	movslq	%ebx, %rcx
	pxor	%xmm0, %xmm0
	movl	(%r12,%rcx,4), %edx
	movl	-4(%r12,%rcx,4), %eax
	movsd	64(%rsp), %xmm4
	movl	72(%rsp), %esi
	movss	32(%rsp), %xmm1
	movq	96(%rsp), %r9
	movss	48(%rsp), %xmm5
	movss	56(%rsp), %xmm6
	movss	112(%rsp), %xmm3
	cmpl	%r8d, %edi
	cmovg	%r8d, %edi
	addl	%edx, %eax
	cmpl	$1, %ebx
	cvtsi2sd	%eax, %xmm0
	movq	80(%rsp), %rax
	mulsd	%xmm4, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	je	.L1150
.L642:
	pxor	%xmm2, %xmm2
	movss	164(%rsp), %xmm7
	leal	1(%rbx), %ecx
	cvtsi2ss	%ebx, %xmm2
	cmpl	%ecx, %edi
	subss	%xmm2, %xmm1
	subss	%xmm1, %xmm7
	mulss	%xmm7, %xmm0
	movaps	%xmm0, %xmm1
	addss	%xmm3, %xmm1
	jle	.L643
	movslq	%ecx, %rcx
.L644:
	movl	(%r12,%rcx,4), %r10d
	pxor	%xmm0, %xmm0
	addq	$1, %rcx
	addl	%r10d, %edx
	cmpl	%ecx, %edi
	cvtsi2sd	%edx, %xmm0
	movl	%r10d, %edx
	mulsd	%xmm4, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	addss	%xmm0, %xmm1
	jg	.L644
.L643:
	movslq	%edi, %rdx
	pxor	%xmm0, %xmm0
	movl	(%r12,%rdx,4), %ecx
	movl	-4(%r12,%rdx,4), %ebx
	pxor	%xmm2, %xmm2
	addl	%ecx, %ebx
	cmpl	%r8d, %edi
	cvtsi2sd	%ebx, %xmm0
	mulsd	%xmm4, %xmm0
	cvtsd2ss	%xmm0, %xmm2
	je	.L1151
.L645:
	movq	%r9, %rcx
	pxor	%xmm0, %xmm0
	movss	164(%rsp), %xmm10
	movaps	%xmm10, %xmm7
	cvtsi2ss	%edi, %xmm0
	subss	8(%rsp), %xmm0
	subss	%xmm0, %xmm7
	movaps	%xmm7, %xmm0
	movaps	%xmm10, %xmm7
	mulss	%xmm2, %xmm0
	addss	%xmm0, %xmm1
	divss	%xmm1, %xmm7
	movaps	%xmm7, %xmm0
.L646:
	movq	%r13, %rdx
	addq	(%rcx), %rdx
	addq	$8, %rcx
	cmpq	%rcx, %r15
	movss	%xmm1, (%rdx)
	movss	%xmm0, 4(%rdx)
	movss	%xmm3, 8(%rdx)
	movss	%xmm3, 12(%rdx)
	jne	.L646
	addq	$16, %r13
	cmpl	%ebp, %r14d
	jne	.L647
	movl	nx(%rip), %r15d
	pxor	%xmm7, %xmm7
	pxor	%xmm6, %xmm6
	xorl	%r13d, %r13d
	leal	-1(%r14), %edx
	movq	chan_width_y(%rip), %r12
	movq	place_region_y(%rip), %r8
	cvtsi2ss	%r15d, %xmm7
	addq	$1, %rdx
	movl	%esi, %ebx
	movl	%ebp, %esi
	cvtsi2ss	%r13d, %xmm6
	salq	$4, %rdx
	movl	%ebx, %ebp
	movq	%rdx, 32(%rsp)
.L653:
	divss	%xmm5, %xmm6
	addl	$1, %r13d
	movss	%xmm3, 120(%rsp)
	movq	%r8, 112(%rsp)
	movl	%esi, 104(%rsp)
	movsd	%xmm4, 80(%rsp)
	movq	%rax, 96(%rsp)
	movss	%xmm5, 64(%rsp)
	movl	$1, %ebx
	movss	%xmm7, 56(%rsp)
	movaps	%xmm6, %xmm1
	pxor	%xmm6, %xmm6
	mulss	%xmm7, %xmm1
	cvtsi2ss	%r13d, %xmm6
	addss	164(%rsp), %xmm1
	movss	%xmm1, 48(%rsp)
	movaps	%xmm6, %xmm0
	movss	%xmm6, 72(%rsp)
	divss	%xmm5, %xmm0
	mulss	%xmm7, %xmm0
	movss	%xmm0, 8(%rsp)
	movaps	%xmm1, %xmm0
	call	floorf@PLT
	cvttss2si	%xmm0, %edx
	movss	8(%rsp), %xmm0
	testl	%edx, %edx
	cmovg	%edx, %ebx
	call	ceilf@PLT
	cvttss2si	%xmm0, %edi
	movslq	%ebx, %rcx
	movl	(%r12,%rcx,4), %edx
	movl	-4(%r12,%rcx,4), %eax
	pxor	%xmm0, %xmm0
	movss	48(%rsp), %xmm1
	movsd	80(%rsp), %xmm4
	movl	104(%rsp), %esi
	movss	56(%rsp), %xmm7
	movq	112(%rsp), %r8
	movss	64(%rsp), %xmm5
	movss	72(%rsp), %xmm6
	movss	120(%rsp), %xmm3
	cmpl	%r15d, %edi
	cmovg	%r15d, %edi
	addl	%edx, %eax
	cmpl	$1, %ebx
	cvtsi2sd	%eax, %xmm0
	movq	96(%rsp), %rax
	mulsd	%xmm4, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	je	.L1152
.L648:
	pxor	%xmm2, %xmm2
	leal	1(%rbx), %ecx
	cmpl	%ecx, %edi
	cvtsi2ss	%ebx, %xmm2
	subss	%xmm2, %xmm1
	movss	164(%rsp), %xmm2
	subss	%xmm1, %xmm2
	mulss	%xmm2, %xmm0
	movaps	%xmm0, %xmm1
	addss	%xmm3, %xmm1
	jle	.L649
	movslq	%ecx, %rcx
.L650:
	movl	(%r12,%rcx,4), %r9d
	pxor	%xmm0, %xmm0
	addq	$1, %rcx
	addl	%r9d, %edx
	cmpl	%ecx, %edi
	cvtsi2sd	%edx, %xmm0
	movl	%r9d, %edx
	mulsd	%xmm4, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	addss	%xmm0, %xmm1
	jg	.L650
.L649:
	movslq	%edi, %rdx
	pxor	%xmm0, %xmm0
	movl	(%r12,%rdx,4), %ecx
	movl	-4(%r12,%rdx,4), %ebx
	pxor	%xmm2, %xmm2
	addl	%ecx, %ebx
	cmpl	%r15d, %edi
	cvtsi2sd	%ebx, %xmm0
	mulsd	%xmm4, %xmm0
	cvtsd2ss	%xmm0, %xmm2
	je	.L1153
.L651:
	movq	(%r8), %rdx
	movq	32(%rsp), %rbx
	pxor	%xmm0, %xmm0
	movss	164(%rsp), %xmm12
	movaps	%xmm12, %xmm11
	leaq	(%rdx,%rbx), %rcx
	cvtsi2ss	%edi, %xmm0
	subss	8(%rsp), %xmm0
	subss	%xmm0, %xmm11
	movaps	%xmm11, %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm0, %xmm1
	movaps	%xmm12, %xmm0
	divss	%xmm1, %xmm0
.L652:
	movss	%xmm1, (%rdx)
	addq	$16, %rdx
	movss	%xmm0, -12(%rdx)
	movss	%xmm3, -8(%rdx)
	movss	%xmm3, -4(%rdx)
	cmpq	%rdx, %rcx
	jne	.L652
	addq	$8, %r8
	cmpl	%r13d, %r14d
	jne	.L653
	movss	16(%rsp), %xmm0
	divss	%xmm5, %xmm7
	movq	place_region_bounds_x(%rip), %rcx
	movss	.LC27(%rip), %xmm1
	movl	%ebp, %ebx
	movl	$1, %edx
	movl	%esi, %ebp
	movss	%xmm1, (%rcx)
	movss	%xmm1, (%rax)
	divss	%xmm5, %xmm0
.L656:
	movss	-4(%rcx,%rdx,4), %xmm1
	addss	%xmm7, %xmm1
	movss	%xmm1, (%rcx,%rdx,4)
	movss	-4(%rax,%rdx,4), %xmm1
	addss	%xmm0, %xmm1
	movss	%xmm1, (%rax,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %r14d
	jge	.L656
.L657:
	movl	$4, %r8d
	movl	%ebx, %ecx
	xorl	%edx, %edx
	movl	%ebx, %esi
	xorl	%edi, %edi
	call	alloc_matrix@PLT
	movl	$4, %r8d
	movq	%rax, %r12
	movl	%ebx, %ecx
	xorl	%edx, %edx
	movl	%ebx, %esi
	xorl	%edi, %edi
	call	alloc_matrix@PLT
	movq	%r12, 64(%rsp)
	movq	%rax, 72(%rsp)
	jmp	.L655
.L1153:
	pxor	%xmm0, %xmm0
	cvtsi2sd	%ecx, %xmm0
	mulsd	%xmm4, %xmm0
	movapd	%xmm0, %xmm8
	pxor	%xmm0, %xmm0
	cvtss2sd	%xmm2, %xmm0
	pxor	%xmm2, %xmm2
	addsd	%xmm8, %xmm0
	cvtsd2ss	%xmm0, %xmm2
	jmp	.L651
.L1152:
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm0
	cvtsi2sd	(%r12), %xmm2
	mulsd	%xmm4, %xmm2
	addsd	%xmm2, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	jmp	.L648
.L1151:
	pxor	%xmm0, %xmm0
	cvtsi2sd	%ecx, %xmm0
	movapd	%xmm0, %xmm7
	pxor	%xmm0, %xmm0
	mulsd	%xmm4, %xmm7
	cvtss2sd	%xmm2, %xmm0
	pxor	%xmm2, %xmm2
	addsd	%xmm7, %xmm0
	cvtsd2ss	%xmm0, %xmm2
	jmp	.L645
.L1150:
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm0
	cvtsi2sd	(%r12), %xmm2
	mulsd	%xmm4, %xmm2
	addsd	%xmm2, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	jmp	.L642
	.p2align 4,,10
	.p2align 3
.L773:
	cmpl	%r15d, 236(%rsp)
	je	.L1154
	cmpl	$1, %r12d
	je	.L1155
.L776:
	movq	360(%rsp), %rdi
	call	load_timing_graph_net_delays@PLT
	movq	352(%rsp), %rdi
	pxor	%xmm0, %xmm0
	call	load_net_slack@PLT
	movl	40(%rsp), %eax
	movss	24(%rsp), %xmm5
	movss	%xmm5, 740(%rsp)
	movl	%r12d, 736(%rsp)
	movl	%ebp, 780(%rsp)
	movss	200(%rsp), %xmm5
	subq	$8, %rsp
	.cfi_def_cfa_offset 744
	movl	%eax, 756(%rsp)
	movss	%xmm0, 184(%rsp)
	movl	204(%rsp), %eax
	movss	%xmm5, 804(%rsp)
	movl	%eax, 768(%rsp)
	movl	220(%rsp), %eax
	movl	%eax, 792(%rsp)
	movl	224(%rsp), %eax
	movl	%eax, 796(%rsp)
	movl	200(%rsp), %eax
	movl	%eax, 800(%rsp)
	pushq	808(%rsp)
	.cfi_def_cfa_offset 752
	pushq	808(%rsp)
	.cfi_def_cfa_offset 760
	pushq	808(%rsp)
	.cfi_def_cfa_offset 768
	pushq	808(%rsp)
	.cfi_def_cfa_offset 776
	pushq	808(%rsp)
	.cfi_def_cfa_offset 784
	pushq	808(%rsp)
	.cfi_def_cfa_offset 792
	pushq	808(%rsp)
	.cfi_def_cfa_offset 800
	pushq	808(%rsp)
	.cfi_def_cfa_offset 808
	pushq	808(%rsp)
	.cfi_def_cfa_offset 816
	movq	432(%rsp), %rdi
	movss	264(%rsp), %xmm1
	call	load_criticalities@PLT
	addq	$80, %rsp
	.cfi_def_cfa_offset 736
	movq	48(%rsp), %rdi
	movq	%r13, %rsi
	call	comp_td_costs
	movl	$1, 144(%rsp)
	jmp	.L772
.L807:
	pxor	%xmm0, %xmm0
	cmpl	$1, %eax
	movsd	112(%rsp), %xmm1
	movsd	120(%rsp), %xmm2
	cvtsi2sd	%eax, %xmm0
	movsd	128(%rsp), %xmm3
	movsd	136(%rsp), %xmm4
	divsd	%xmm0, %xmm1
	divsd	%xmm0, %xmm2
	divsd	%xmm0, %xmm3
	divsd	%xmm0, %xmm4
	je	.L932
	subl	$1, %eax
	mulsd	%xmm1, %xmm0
	pxor	%xmm5, %xmm5
	movsd	104(%rsp), %xmm7
	cvtsi2sd	%eax, %xmm5
	mulsd	%xmm1, %xmm0
	subsd	%xmm0, %xmm7
	movapd	%xmm7, %xmm0
	movsd	152(%rsp), %xmm7
	divsd	%xmm5, %xmm0
	ucomisd	%xmm7, %xmm0
	jbe	.L1093
	ucomisd	%xmm0, %xmm7
	sqrtsd	%xmm0, %xmm5
	jbe	.L808
	movsd	%xmm5, 144(%rsp)
	movsd	%xmm4, 136(%rsp)
	movsd	%xmm3, 128(%rsp)
	movsd	%xmm2, 120(%rsp)
	movsd	%xmm1, 112(%rsp)
	movss	%xmm8, 104(%rsp)
	call	sqrt@PLT
	movss	104(%rsp), %xmm8
	movsd	112(%rsp), %xmm1
	movsd	120(%rsp), %xmm2
	movsd	128(%rsp), %xmm3
	movsd	136(%rsp), %xmm4
	movsd	144(%rsp), %xmm5
	jmp	.L808
	.p2align 4,,10
	.p2align 3
.L1154:
	addl	$1, 144(%rsp)
	jmp	.L772
.L1094:
	movsd	.LC65(%rip), %xmm0
	ucomisd	%xmm0, %xmm8
	jbe	.L1095
	mulsd	.LC66(%rip), %xmm9
	pxor	%xmm7, %xmm7
	cvtsd2ss	%xmm9, %xmm7
	movss	%xmm7, 104(%rsp)
	movaps	%xmm7, %xmm0
	jmp	.L811
.L1145:
	cmpl	$1, 40(%rsp)
	je	.L1156
	movl	num_nets(%rip), %edx
	testl	%edx, %edx
	jle	.L1157
	movq	net(%rip), %rax
	movl	num_nets(%rip), %ecx
	movq	net_cost(%rip), %rsi
	pxor	%xmm0, %xmm0
	leaq	32(%rax), %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L787:
	movl	(%rdx), %edi
	testl	%edi, %edi
	jne	.L786
	addss	(%rsi,%rax,4), %xmm0
.L786:
	addq	$1, %rax
	addq	$40, %rdx
	cmpl	%eax, %ecx
	jg	.L787
.L788:
	movaps	%xmm0, %xmm7
	movss	328(%rsp), %xmm2
	pxor	%xmm1, %xmm1
	subss	%xmm2, %xmm7
	movsd	.LC59(%rip), %xmm3
	cvtss2sd	%xmm2, %xmm1
	movaps	%xmm7, %xmm2
	mulsd	%xmm1, %xmm3
	andps	.LC58(%rip), %xmm2
	cvtss2sd	%xmm2, %xmm2
	ucomisd	%xmm3, %xmm2
	ja	.L1158
	cmpl	$1, 44(%rsp)
	movss	%xmm0, 328(%rsp)
	jbe	.L1159
	testl	%r12d, %r12d
	jne	.L1160
	movss	824(%rsp), %xmm5
	movl	$0, 168(%rsp)
	movss	%xmm0, 320(%rsp)
	movss	%xmm5, 260(%rsp)
	jmp	.L778
.L1146:
	mulss	8(%rsp), %xmm0
	movss	%xmm0, 104(%rsp)
	jmp	.L811
.L1142:
	movl	192(%rsp), %r9d
	movss	164(%rsp), %xmm6
	movss	%xmm6, 320(%rsp)
	testl	%r9d, %r9d
	jne	.L768
	movl	256(%rsp), %eax
	movl	212(%rsp), %edi
	cmpl	%edi, %eax
	jge	.L768
	addl	$1, %eax
	movl	%eax, 256(%rsp)
.L769:
	movaps	%xmm6, %xmm7
	divss	328(%rsp), %xmm7
	movss	%xmm7, 32(%rsp)
	movaps	%xmm6, %xmm7
	divss	324(%rsp), %xmm7
	movss	%xmm7, 56(%rsp)
	jmp	.L899
.L1147:
	movss	164(%rsp), %xmm5
	subss	%xmm5, %xmm0
	movss	200(%rsp), %xmm6
	movss	804(%rsp), %xmm1
	subss	%xmm6, %xmm1
	mulss	296(%rsp), %xmm0
	subss	%xmm0, %xmm5
	movaps	%xmm5, %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm6, %xmm0
	movss	%xmm0, 184(%rsp)
	jmp	.L822
.L768:
	pxor	%xmm0, %xmm0
	cmpl	$1, %r12d
	movss	336(%rsp), %xmm1
	cvtsi2ss	232(%rsp), %xmm0
	divss	%xmm0, %xmm1
	movss	%xmm1, 188(%rsp)
	je	.L1161
.L770:
	movq	360(%rsp), %rdi
	call	load_timing_graph_net_delays@PLT
	movq	352(%rsp), %rdi
	pxor	%xmm0, %xmm0
	call	load_net_slack@PLT
	movl	40(%rsp), %eax
	movss	24(%rsp), %xmm7
	movss	200(%rsp), %xmm5
	movl	%r12d, 736(%rsp)
	movss	%xmm0, 176(%rsp)
	movl	%ebp, 780(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 744
	movl	%eax, 756(%rsp)
	movl	204(%rsp), %eax
	movss	%xmm7, 748(%rsp)
	movss	%xmm5, 804(%rsp)
	movl	%eax, 768(%rsp)
	movl	220(%rsp), %eax
	movl	%eax, 792(%rsp)
	movl	224(%rsp), %eax
	movl	%eax, 796(%rsp)
	movl	200(%rsp), %eax
	movl	%eax, 800(%rsp)
	pushq	808(%rsp)
	.cfi_def_cfa_offset 752
	pushq	808(%rsp)
	.cfi_def_cfa_offset 760
	pushq	808(%rsp)
	.cfi_def_cfa_offset 768
	pushq	808(%rsp)
	.cfi_def_cfa_offset 776
	pushq	808(%rsp)
	.cfi_def_cfa_offset 784
	pushq	808(%rsp)
	.cfi_def_cfa_offset 792
	pushq	808(%rsp)
	.cfi_def_cfa_offset 800
	pushq	808(%rsp)
	.cfi_def_cfa_offset 808
	pushq	808(%rsp)
	.cfi_def_cfa_offset 816
	movq	432(%rsp), %rdi
	movss	264(%rsp), %xmm1
	call	load_criticalities@PLT
	addq	$80, %rsp
	.cfi_def_cfa_offset 736
	movq	48(%rsp), %rdi
	movq	%r13, %rsi
	call	comp_td_costs
	movl	$1, 256(%rsp)
	movss	164(%rsp), %xmm6
	jmp	.L769
.L1095:
	ucomisd	.LC67(%rip), %xmm8
	ja	.L816
	movss	16(%rsp), %xmm5
	ucomiss	164(%rsp), %xmm5
	jbe	.L1096
.L816:
	mulsd	.LC68(%rip), %xmm9
	pxor	%xmm7, %xmm7
	cvtsd2ss	%xmm9, %xmm7
	movss	%xmm7, 104(%rsp)
	movaps	%xmm7, %xmm0
	jmp	.L811
.L1155:
	pxor	%xmm0, %xmm0
	movq	360(%rsp), %rdi
	movss	336(%rsp), %xmm1
	cvtsi2ss	232(%rsp), %xmm0
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm1, 188(%rsp)
	call	load_constant_net_delay@PLT
	jmp	.L776
.L1160:
	movss	824(%rsp), %xmm7
	movl	$0, 168(%rsp)
	movss	%xmm7, 260(%rsp)
	jmp	.L778
.L1156:
	testl	%ebp, %ebp
	pxor	%xmm0, %xmm0
	jle	.L780
	movq	place_region_x(%rip), %r8
	movq	place_region_y(%rip), %rdi
	xorl	%esi, %esi
	pxor	%xmm0, %xmm0
	movq	288(%rsp), %r9
.L782:
	movq	(%r8,%rsi,8), %rcx
	movq	(%rdi,%rsi,8), %rdx
	movl	$8, %eax
	.p2align 4,,10
	.p2align 3
.L781:
	movss	%xmm0, (%rcx,%rax)
	movss	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpq	%rax, %r9
	jne	.L781
	addq	$1, %rsi
	cmpl	%esi, %ebp
	jg	.L782
.L780:
	movl	num_nets(%rip), %eax
	testl	%eax, %eax
	jle	.L785
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	xorl	%r15d, %r15d
.L784:
	movq	net(%rip), %rdx
	movl	32(%rdx,%rax), %r8d
	testl	%r8d, %r8d
	jne	.L783
	movq	%rcx, %rsi
	addq	bb_coords(%rip), %rsi
	movl	%ebp, %edx
	movl	%r15d, %edi
	movss	%xmm0, 260(%rsp)
	movq	%rax, 168(%rsp)
	movq	%rcx, 144(%rsp)
	call	update_region_occ.constprop.5
	movq	168(%rsp), %rax
	movq	144(%rsp), %rcx
	movss	260(%rsp), %xmm0
.L783:
	addl	$1, %r15d
	addq	$40, %rax
	addq	$16, %rcx
	cmpl	%r15d, num_nets(%rip)
	jg	.L784
.L785:
	testl	%ebp, %ebp
	jle	.L788
	movq	place_region_x(%rip), %r8
	movq	place_region_y(%rip), %rdi
	xorl	%esi, %esi
	movq	280(%rsp), %r9
	movaps	%xmm0, %xmm1
.L798:
	movq	(%r8,%rsi,8), %rax
	movq	(%rdi,%rsi,8), %rdx
	movaps	%xmm1, %xmm0
	leaq	(%rax,%r9), %rcx
	.p2align 4,,10
	.p2align 3
.L790:
	movss	8(%rax), %xmm3
	movss	(%rax), %xmm1
	ucomiss	%xmm3, %xmm1
	jbe	.L1088
.L1162:
	movss	4(%rax), %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm0, %xmm4
	movaps	%xmm4, %xmm3
.L793:
	movss	8(%rdx), %xmm0
	movss	(%rdx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L1089
	movss	4(%rdx), %xmm2
	addq	$16, %rax
	addq	$16, %rdx
	mulss	%xmm0, %xmm2
	cmpq	%rax, %rcx
	addss	%xmm3, %xmm2
	movaps	%xmm2, %xmm0
	jne	.L790
.L1115:
	addq	$1, %rsi
	movaps	%xmm0, %xmm1
	cmpl	%esi, %ebp
	jg	.L798
	jmp	.L788
	.p2align 4,,10
	.p2align 3
.L1089:
	mulss	4(%rdx), %xmm0
	addq	$16, %rax
	addq	$16, %rdx
	cmpq	%rax, %rcx
	mulss	%xmm0, %xmm0
	addss	%xmm3, %xmm0
	je	.L1115
	movss	8(%rax), %xmm3
	movss	(%rax), %xmm1
	ucomiss	%xmm3, %xmm1
	ja	.L1162
.L1088:
	mulss	4(%rax), %xmm3
	mulss	%xmm3, %xmm3
	addss	%xmm0, %xmm3
	jmp	.L793
.L1159:
	leaq	340(%rsp), %rsi
	leaq	332(%rsp), %rdi
	call	comp_td_costs
	movss	332(%rsp), %xmm0
	movaps	%xmm0, %xmm6
	movss	324(%rsp), %xmm2
	pxor	%xmm1, %xmm1
	subss	%xmm2, %xmm6
	movsd	.LC59(%rip), %xmm3
	cvtss2sd	%xmm2, %xmm1
	movaps	%xmm6, %xmm2
	mulsd	%xmm1, %xmm3
	andps	.LC58(%rip), %xmm2
	cvtss2sd	%xmm2, %xmm2
	ucomisd	%xmm3, %xmm2
	ja	.L1163
	movss	340(%rsp), %xmm3
	pxor	%xmm1, %xmm1
	movaps	%xmm3, %xmm5
	movss	336(%rsp), %xmm2
	subss	%xmm2, %xmm5
	cvtss2sd	%xmm2, %xmm1
	movsd	.LC59(%rip), %xmm4
	mulsd	%xmm1, %xmm4
	movaps	%xmm5, %xmm2
	andps	.LC58(%rip), %xmm2
	cvtss2sd	%xmm2, %xmm2
	ucomisd	%xmm4, %xmm2
	ja	.L1164
	movss	824(%rsp), %xmm6
	movl	$0, 168(%rsp)
	movss	%xmm0, 324(%rsp)
	movss	%xmm6, 260(%rsp)
	jmp	.L778
.L1116:
	leal	1(%r11), %ebx
.L831:
	addl	$1, %r12d
	cmpl	128(%rsp), %r12d
	movl	%ebx, %r11d
	jl	.L834
.L1149:
	movl	128(%rsp), %ebx
	pxor	%xmm7, %xmm7
	pxor	%xmm0, %xmm0
	movl	204(%rsp), %r12d
	cvtsi2ss	%r13d, %xmm7
	addl	%ebx, %r12d
	testl	%r13d, %r13d
	cvtsi2ss	%ebx, %xmm0
	divss	%xmm0, %xmm7
	jne	.L835
	pxor	%xmm1, %xmm1
	pxor	%xmm2, %xmm2
	pxor	%xmm4, %xmm4
	pxor	%xmm3, %xmm3
	cvtss2sd	320(%rsp), %xmm1
	pxor	%xmm5, %xmm5
	cvtss2sd	328(%rsp), %xmm2
	cvtss2sd	336(%rsp), %xmm4
	cvtss2sd	324(%rsp), %xmm3
.L836:
	pxor	%xmm6, %xmm6
	subq	$32, %rsp
	.cfi_def_cfa_offset 768
	cvtss2sd	%xmm7, %xmm7
	pxor	%xmm0, %xmm0
	leaq	.LC73(%rip), %rdi
	movl	%r12d, %esi
	movl	$8, %eax
	xorl	%ebx, %ebx
	cvtss2sd	208(%rsp), %xmm6
	movsd	%xmm6, 88(%rsp)
	cvtss2sd	216(%rsp), %xmm0
	movsd	%xmm5, (%rsp)
	pxor	%xmm5, %xmm5
	movsd	%xmm0, 16(%rsp)
	pxor	%xmm0, %xmm0
	cvtss2sd	220(%rsp), %xmm5
	cvtss2sd	48(%rsp), %xmm0
	movsd	%xmm0, 8(%rsp)
	pxor	%xmm0, %xmm0
	call	printf@PLT
	movss	368(%rsp), %xmm4
	movl	%ebp, %edx
	movss	356(%rsp), %xmm7
	movl	$1, %edi
	movss	%xmm4, 40(%rsp)
	movl	$1, %ebp
	movss	360(%rsp), %xmm4
	movss	%xmm7, 48(%rsp)
	movss	%xmm4, 112(%rsp)
	addq	$32, %rsp
	.cfi_def_cfa_offset 736
	movl	40(%rsp), %esi
	call	comp_bb_cost
	pxor	%xmm3, %xmm3
	movss	%xmm0, 32(%rsp)
	movaps	%xmm0, %xmm2
	leaq	.LC74(%rip), %rdi
	movl	$1, %eax
	cvtss2sd	%xmm2, %xmm3
	movapd	%xmm3, %xmm0
	movsd	%xmm3, 24(%rsp)
	call	printf@PLT
	movss	80(%rsp), %xmm4
	movss	32(%rsp), %xmm2
	pxor	%xmm1, %xmm1
	subss	%xmm4, %xmm2
	movsd	24(%rsp), %xmm3
	cvtss2sd	%xmm4, %xmm1
	movaps	%xmm2, %xmm0
	movsd	.LC59(%rip), %xmm2
	andps	.LC58(%rip), %xmm0
	mulsd	%xmm1, %xmm2
	cvtss2sd	%xmm0, %xmm0
	ucomisd	%xmm2, %xmm0
	ja	.L1165
.L838:
	cmpl	$1, 44(%rsp)
	jbe	.L1166
.L840:
	movslq	num_blocks(%rip), %rdi
	salq	$2, %rdi
	call	my_malloc@PLT
	movq	%rax, %rdi
	movq	%rax, bdone.5444(%rip)
	movl	num_blocks(%rip), %eax
	testl	%eax, %eax
	jle	.L844
	movl	$1, %edx
.L845:
	movl	$0, -4(%rdi,%rdx,4)
	movl	num_blocks(%rip), %eax
	movl	%edx, %ecx
	addq	$1, %rdx
	cmpl	%eax, %ecx
	jl	.L845
	cmpl	$-1, nx(%rip)
	jl	.L847
.L846:
	movl	ny(%rip), %eax
	movq	$0, 32(%rsp)
	xorl	%ebp, %ebp
.L858:
	xorl	%r12d, %r12d
	cmpl	$-1, %eax
	movq	$0, 24(%rsp)
	jl	.L859
	.p2align 4,,10
	.p2align 3
.L993:
	movq	grid(%rip), %rax
	movq	32(%rsp), %rcx
	movq	24(%rsp), %rdi
	addq	(%rax,%rcx), %rdi
	movq	(%rdi), %rdx
	movl	12(%rdi), %ecx
	movq	%rdi, %rax
	movl	12(%rdx), %esi
	cmpl	%esi, %ecx
	jg	.L1167
	testl	%esi, %esi
	jle	.L937
.L1168:
	xorl	%r15d, %r15d
	xorl	%r13d, %r13d
	movq	%r15, %r14
	.p2align 4,,10
	.p2align 3
.L855:
	movq	16(%rax), %rcx
	movl	(%rcx,%r14,4), %r9d
	cmpl	$-1, %r9d
	je	.L851
	movslq	%r9d, %r15
	leaq	(%r15,%r15,4), %r11
	salq	$3, %r11
	movq	%r11, %rax
	addq	block(%rip), %rax
	movq	%r11, 8(%rsp)
	cmpq	%rdx, 8(%rax)
	je	.L852
	leaq	.LC81(%rip), %rdi
	movl	%r9d, %esi
	movl	%r12d, %ecx
	movl	%ebp, %edx
	xorl	%eax, %eax
	movl	%r9d, 16(%rsp)
	call	printf@PLT
	movq	8(%rsp), %r11
	movl	16(%rsp), %r9d
	addl	$1, %ebx
	movq	%r11, %rax
	addq	block(%rip), %rax
.L852:
	cmpl	%ebp, 24(%rax)
	jne	.L853
	cmpl	%r12d, 28(%rax)
	je	.L854
.L853:
	leaq	.LC82(%rip), %rdi
	movl	%r12d, %ecx
	movl	%ebp, %edx
	movl	%r9d, %esi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	printf@PLT
.L854:
	movq	bdone.5444(%rip), %rax
	movq	32(%rsp), %rcx
	addl	$1, %r13d
	movq	24(%rsp), %rdi
	addl	$1, (%rax,%r15,4)
	movq	grid(%rip), %rax
	addq	(%rax,%rcx), %rdi
	movq	(%rdi), %rdx
	movq	%rdi, %rax
	movl	12(%rdx), %esi
.L851:
	leal	1(%r14), %ecx
	addq	$1, %r14
	cmpl	%esi, %ecx
	jl	.L855
.L849:
	movl	12(%rax), %ecx
	cmpl	%r13d, %ecx
	je	.L856
	leaq	.LC83(%rip), %rdi
	movl	%r13d, %r8d
	movl	%r12d, %edx
	movl	%ebp, %esi
	xorl	%eax, %eax
	call	printf@PLT
.L856:
	movl	ny(%rip), %eax
	addl	$1, %r12d
	addq	$24, 24(%rsp)
	leal	1(%rax), %edx
	cmpl	%edx, %r12d
	jle	.L993
.L859:
	movl	nx(%rip), %edi
	addl	$1, %ebp
	addq	$8, 32(%rsp)
	leal	1(%rdi), %edx
	cmpl	%edx, %ebp
	jle	.L858
	movl	num_blocks(%rip), %eax
	movq	bdone.5444(%rip), %rdi
.L847:
	testl	%eax, %eax
	jle	.L860
	leaq	.LC84(%rip), %rbp
	xorl	%r12d, %r12d
.L862:
	movl	(%rdi,%r12,4), %edx
	cmpl	$1, %edx
	je	.L861
	movq	%rbp, %rdi
	movl	%r12d, %esi
	xorl	%eax, %eax
	call	printf@PLT
	movl	num_blocks(%rip), %eax
	movq	bdone.5444(%rip), %rdi
	addl	$1, %ebx
.L861:
	leal	1(%r12), %edx
	addq	$1, %r12
	cmpl	%eax, %edx
	jl	.L862
.L860:
	call	free@PLT
	testl	%ebx, %ebx
	jne	.L863
.L1175:
	leaq	.LC85(%rip), %rdi
	call	puts@PLT
	movl	220(%rsp), %eax
	testl	%eax, %eax
	jne	.L864
	cmpb	$0, 278(%rsp)
	je	.L864
	movl	num_nets(%rip), %eax
	testl	%eax, %eax
	jle	.L865
	movq	net(%rip), %rdi
	movq	timing_place_crit(%rip), %r12
	subl	$1, %eax
	leaq	8(%rdi), %r13
	leaq	8(%r12,%rax,8), %rbp
.L866:
	movl	0(%r13), %eax
	testl	%eax, %eax
	jle	.L867
	subl	$1, %eax
	xorl	%esi, %esi
	leaq	4(,%rax,4), %rdx
	movq	(%r12), %rax
	leaq	4(%rax), %rdi
	call	memset@PLT
.L867:
	addq	$8, %r12
	addq	$40, %r13
	cmpq	%rbp, %r12
	jne	.L866
.L865:
	movq	224(%rsp), %rsi
	movq	48(%rsp), %rdi
	call	comp_td_costs
.L868:
	movq	point_to_point_delay_cost(%rip), %rdi
	movq	%rdi, 360(%rsp)
	call	load_timing_graph_net_delays@PLT
	movq	352(%rsp), %rdi
	pxor	%xmm0, %xmm0
	call	load_net_slack@PLT
	leaq	.LC88(%rip), %rdi
	cvtss2sd	%xmm0, %xmm0
	movl	$1, %eax
	call	printf@PLT
	jmp	.L870
	.p2align 4,,10
	.p2align 3
.L1167:
	leaq	.LC80(%rip), %rdi
	movl	%r12d, %edx
	movl	%ebp, %esi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	printf@PLT
	movq	grid(%rip), %rax
	movq	32(%rsp), %rcx
	movq	24(%rsp), %rdi
	addq	(%rax,%rcx), %rdi
	movq	(%rdi), %rdx
	movq	%rdi, %rax
	movl	12(%rdx), %esi
	testl	%esi, %esi
	jg	.L1168
.L937:
	xorl	%r13d, %r13d
	jmp	.L849
.L864:
	cmpl	$1, 44(%rsp)
	jbe	.L868
	movl	216(%rsp), %r15d
	testl	%r15d, %r15d
	jne	.L868
.L870:
	pxor	%xmm0, %xmm0
	movq	240(%rsp), %r15
	movl	272(%rsp), %edx
	pxor	%xmm2, %xmm2
	leaq	.LC89(%rip), %rsi
	pxor	%xmm1, %xmm1
	movl	$4, %eax
	cvtss2sd	320(%rsp), %xmm0
	movq	%r15, %rdi
	movsd	56(%rsp), %xmm3
	cvtss2sd	324(%rsp), %xmm2
	cvtss2sd	328(%rsp), %xmm1
	call	sprintf@PLT
	pxor	%xmm0, %xmm0
	leaq	.LC90(%rip), %rdi
	pxor	%xmm3, %xmm3
	movl	$4, %eax
	pxor	%xmm2, %xmm2
	pxor	%xmm1, %xmm1
	cvtss2sd	320(%rsp), %xmm0
	cvtss2sd	336(%rsp), %xmm3
	cvtss2sd	324(%rsp), %xmm2
	cvtss2sd	328(%rsp), %xmm1
	call	printf@PLT
	xorl	%ecx, %ecx
	movl	$1, %edx
	movq	%r15, %rsi
	movl	$1, %edi
	call	update_screen@PLT
	cmpl	$1, 44(%rsp)
	jbe	.L871
	cmpb	$0, 279(%rsp)
	je	.L873
.L871:
	movl	num_nets(%rip), %esi
	movq	264(%rsp), %rax
	movq	point_to_point_delay_cost(%rip), %r15
	movq	point_to_point_timing_cost(%rip), %r13
	movq	temp_point_to_point_delay_cost(%rip), %r12
	movq	temp_point_to_point_timing_cost(%rip), %rbp
	testl	%esi, %esi
	movq	%rax, 360(%rsp)
	jle	.L902
	movl	$1, %r14d
.L874:
	movq	-8(%r15,%r14,8), %rax
	leaq	4(%rax), %rdi
	movq	%rdi, -8(%r15,%r14,8)
	call	free@PLT
	movq	-8(%r13,%r14,8), %rax
	leaq	4(%rax), %rdi
	movq	%rdi, -8(%r13,%r14,8)
	call	free@PLT
	movq	-8(%r12,%r14,8), %rax
	leaq	4(%rax), %rdi
	movq	%rdi, -8(%r12,%r14,8)
	call	free@PLT
	movq	-8(%rbp,%r14,8), %rax
	leaq	4(%rax), %rdi
	movq	%rdi, -8(%rbp,%r14,8)
	call	free@PLT
	movl	%r14d, %eax
	addq	$1, %r14
	cmpl	num_nets(%rip), %eax
	jl	.L874
.L902:
	movq	%r15, %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	movq	%r13, %rdi
	call	free@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movl	num_blocks(%rip), %eax
	movq	net_pin_index(%rip), %rdi
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$4, %r8d
	leal	-1(%rax), %edx
	call	free_matrix@PLT
	movq	net_cost(%rip), %rdi
	call	free@PLT
	movq	temp_net_cost(%rip), %rdi
	call	free@PLT
	movq	bb_num_on_edges(%rip), %rdi
	call	free@PLT
	movq	bb_coords(%rip), %rdi
	call	free@PLT
	movl	num_nets(%rip), %eax
	movq	$0, net_cost(%rip)
	movq	$0, temp_net_cost(%rip)
	movq	$0, bb_num_on_edges(%rip)
	movq	$0, bb_coords(%rip)
	movq	duplicate_pins(%rip), %rbp
	testl	%eax, %eax
	jle	.L876
	xorl	%edx, %edx
	xorl	%r13d, %r13d
	movl	$1, %r12d
	jmp	.L878
.L877:
	movl	%r12d, %ecx
	addq	$8, %r13
	addq	$1, %r12
	cmpl	%eax, %ecx
	jge	.L1169
.L878:
	movl	-4(%rbp,%r12,4), %r14d
	testl	%r14d, %r14d
	je	.L877
	movq	unique_pin_list(%rip), %rax
	movq	(%rax,%r13), %rdi
	addq	$8, %r13
	call	free@PLT
	movl	num_nets(%rip), %eax
	movl	%r12d, %ecx
	addq	$1, %r12
	movl	$1, %edx
	cmpl	%eax, %ecx
	jl	.L878
.L1169:
	testl	%edx, %edx
	jne	.L1170
.L876:
	movq	%rbp, %rdi
	call	free@PLT
	cmpl	$1, 40(%rsp)
	je	.L1171
.L879:
	movl	40(%rsp), %r11d
	testl	%r11d, %r11d
	je	.L1172
.L880:
	leaq	352(%rsp), %rsi
	leaq	360(%rsp), %rdi
	call	free_lookups_and_criticalities@PLT
.L873:
	movq	248(%rsp), %rax
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	.L887
	movl	num_nets(%rip), %r8d
	testl	%r8d, %r8d
	jle	.L888
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L890
	movq	%rax, %r13
	xorl	%r12d, %r12d
	movl	$8, %ebp
	jmp	.L891
	.p2align 4,,10
	.p2align 3
.L892:
	movq	0(%r13), %rax
	movq	(%rax,%rbp), %rdi
	addq	$8, %rbp
	testq	%rdi, %rdi
	je	.L890
.L891:
	call	free@PLT
	addl	$1, %r12d
	cmpl	%r12d, num_nets(%rip)
	jg	.L892
	movq	248(%rsp), %rax
	movq	(%rax), %rdi
.L888:
	call	free@PLT
.L887:
	movslq	num_nets(%rip), %rdi
	salq	$3, %rdi
	call	my_malloc@PLT
	movq	248(%rsp), %rdi
	movq	%rax, (%rdi)
	movl	num_nets(%rip), %edi
	testl	%edi, %edi
	jle	.L893
	xorl	%r12d, %r12d
	jmp	.L894
	.p2align 4,,10
	.p2align 3
.L1173:
	movq	248(%rsp), %rax
	movq	(%rax), %rax
.L894:
	movl	%ebx, %edi
	leaq	(%rax,%r12), %rbp
	addl	$1, %ebx
	call	get_mst_of_net@PLT
	addq	$8, %r12
	cmpl	%ebx, num_nets(%rip)
	movq	%rax, 0(%rbp)
	jg	.L1173
.L893:
	movq	88(%rsp), %rdi
	call	free@PLT
	addq	$680, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L1161:
	.cfi_restore_state
	movq	360(%rsp), %rdi
	movaps	%xmm1, %xmm0
	call	load_constant_net_delay@PLT
	jmp	.L770
.L1096:
	mulsd	%xmm0, %xmm9
	pxor	%xmm5, %xmm5
	cvtsd2ss	%xmm9, %xmm5
	movss	%xmm5, 104(%rsp)
	movaps	%xmm5, %xmm0
	jmp	.L811
.L835:
	pxor	%xmm0, %xmm0
	cmpl	$1, %r13d
	movsd	8(%rsp), %xmm1
	movsd	96(%rsp), %xmm2
	cvtsi2sd	%r13d, %xmm0
	movsd	112(%rsp), %xmm4
	movsd	104(%rsp), %xmm3
	divsd	%xmm0, %xmm1
	divsd	%xmm0, %xmm2
	divsd	%xmm0, %xmm4
	divsd	%xmm0, %xmm3
	je	.L934
	leal	-1(%r13), %eax
	mulsd	%xmm1, %xmm0
	movsd	120(%rsp), %xmm5
	movsd	152(%rsp), %xmm6
	mulsd	%xmm1, %xmm0
	subsd	%xmm0, %xmm5
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	divsd	%xmm0, %xmm5
	movapd	%xmm5, %xmm0
	ucomisd	%xmm6, %xmm0
	jbe	.L1097
	ucomisd	%xmm0, %xmm6
	sqrtsd	%xmm0, %xmm5
	jbe	.L836
	movsd	%xmm5, 96(%rsp)
	movsd	%xmm3, 80(%rsp)
	movsd	%xmm4, 56(%rsp)
	movsd	%xmm2, 32(%rsp)
	movsd	%xmm1, 24(%rsp)
	movss	%xmm7, 8(%rsp)
	call	sqrt@PLT
	movss	8(%rsp), %xmm7
	movsd	24(%rsp), %xmm1
	movsd	32(%rsp), %xmm2
	movsd	56(%rsp), %xmm4
	movsd	80(%rsp), %xmm3
	movsd	96(%rsp), %xmm5
	jmp	.L836
.L1137:
	movl	40(%rsp), %esi
	xorl	%edi, %edi
	movl	%ebp, %edx
	call	comp_bb_cost
	movl	num_blocks(%rip), %eax
	movss	%xmm0, 328(%rsp)
	testl	%eax, %eax
	jle	.L741
	movq	block(%rip), %rbx
	movq	net_pin_index(%rip), %r9
	movl	$1, %esi
	leaq	8(%rbx), %rdx
.L740:
	movq	(%rdx), %rdi
	movl	8(%rdi), %r14d
	testl	%r14d, %r14d
	jle	.L738
	movq	-8(%r9,%rsi,8), %r8
	movl	$1, %eax
.L739:
	movl	$-1, -4(%r8,%rax,4)
	movl	%eax, %ecx
	addq	$1, %rax
	cmpl	8(%rdi), %ecx
	jl	.L739
	movl	num_blocks(%rip), %eax
.L738:
	movl	%esi, %ecx
	addq	$40, %rdx
	addq	$1, %rsi
	cmpl	%eax, %ecx
	jl	.L740
.L741:
	movl	num_nets(%rip), %ecx
	testl	%ecx, %ecx
	jle	.L737
	movq	net(%rip), %rsi
	movq	net_pin_index(%rip), %rbx
	xorl	%edi, %edi
	leaq	8(%rsi), %rax
.L745:
	movl	24(%rax), %r13d
	testl	%r13d, %r13d
	jne	.L743
	movl	(%rax), %r12d
	testl	%r12d, %r12d
	js	.L743
	movq	8(%rax), %r9
	movq	16(%rax), %r8
	xorl	%ecx, %ecx
	xorl	%edx, %edx
.L744:
	movslq	(%r9,%rcx), %r10
	movslq	(%r8,%rcx), %r11
	addq	$4, %rcx
	movq	(%rbx,%r10,8), %r10
	movl	%edx, (%r10,%r11,4)
	addl	$1, %edx
	cmpl	(%rax), %edx
	jle	.L744
	movl	num_nets(%rip), %ecx
.L743:
	addl	$1, %edi
	addq	$40, %rax
	cmpl	%ecx, %edi
	jl	.L745
	testl	%ecx, %ecx
	jle	.L737
	leal	-4(%rcx), %edi
	leal	-1(%rcx), %eax
	shrl	$2, %edi
	addl	$1, %edi
	cmpl	$25, %eax
	leal	0(,%rdi,4), %edx
	jbe	.L927
	pxor	%xmm2, %xmm2
	leaq	32(%rsi), %rax
	xorl	%r8d, %r8d
	movdqa	%xmm2, %xmm4
.L747:
	movd	120(%rax), %xmm6
	addl	$1, %r8d
	addq	$160, %rax
	movd	-80(%rax), %xmm1
	movd	-160(%rax), %xmm0
	movd	-120(%rax), %xmm7
	punpckldq	%xmm6, %xmm1
	movd	-104(%rax), %xmm3
	punpckldq	%xmm7, %xmm0
	movd	-64(%rax), %xmm5
	movd	-144(%rax), %xmm6
	punpckldq	%xmm5, %xmm3
	punpcklqdq	%xmm1, %xmm0
	movd	-184(%rax), %xmm1
	cmpl	%r8d, %edi
	punpckldq	%xmm6, %xmm1
	pcmpeqd	%xmm4, %xmm0
	punpcklqdq	%xmm3, %xmm1
	pand	%xmm1, %xmm0
	paddd	%xmm0, %xmm2
	ja	.L747
	movdqa	%xmm2, %xmm0
	cmpl	%edx, %ecx
	movl	%edx, %eax
	psrldq	$8, %xmm0
	paddd	%xmm0, %xmm2
	movdqa	%xmm2, %xmm0
	psrldq	$4, %xmm0
	paddd	%xmm0, %xmm2
	movd	%xmm2, 232(%rsp)
	je	.L742
.L746:
	movslq	%eax, %rdx
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%rsi,%rdx,8), %rdx
	xorl	%esi, %esi
.L749:
	movl	32(%rdx), %ebx
	movl	%esi, %edi
	testl	%ebx, %ebx
	cmove	8(%rdx), %edi
	addl	$1, %eax
	addl	%edi, 232(%rsp)
	addq	$40, %rdx
	cmpl	%eax, %ecx
	jg	.L749
	jmp	.L742
.L737:
	movl	$0, 232(%rsp)
.L742:
	movl	232(%rsp), %esi
	leaq	.LC31(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	cmpl	$1, 220(%rsp)
	je	.L1174
	leaq	336(%rsp), %rax
	pxor	%xmm4, %xmm4
	movq	point_to_point_delay_cost(%rip), %rdi
	movq	%rax, 224(%rsp)
	leaq	324(%rsp), %rax
	movss	%xmm4, 188(%rsp)
	movq	%rdi, 360(%rsp)
	movq	%rax, 48(%rsp)
.L895:
	call	load_timing_graph_net_delays@PLT
	movq	352(%rsp), %rdi
	pxor	%xmm0, %xmm0
	call	load_net_slack@PLT
	movl	220(%rsp), %eax
	movss	200(%rsp), %xmm6
	movss	24(%rsp), %xmm7
	movl	%ebp, 780(%rsp)
	movss	%xmm6, 796(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 744
	movl	%eax, 744(%rsp)
	movl	48(%rsp), %eax
	movss	%xmm0, 184(%rsp)
	movss	%xmm7, 748(%rsp)
	movaps	%xmm6, %xmm1
	movl	%eax, 756(%rsp)
	movl	204(%rsp), %eax
	movl	%eax, 768(%rsp)
	movl	220(%rsp), %eax
	movl	%eax, 792(%rsp)
	movl	224(%rsp), %eax
	movl	%eax, 796(%rsp)
	movl	200(%rsp), %eax
	movl	%eax, 800(%rsp)
	pushq	808(%rsp)
	.cfi_def_cfa_offset 752
	pushq	808(%rsp)
	.cfi_def_cfa_offset 760
	pushq	808(%rsp)
	.cfi_def_cfa_offset 768
	pushq	808(%rsp)
	.cfi_def_cfa_offset 776
	pushq	808(%rsp)
	.cfi_def_cfa_offset 784
	pushq	808(%rsp)
	.cfi_def_cfa_offset 792
	pushq	808(%rsp)
	.cfi_def_cfa_offset 800
	pushq	808(%rsp)
	.cfi_def_cfa_offset 808
	pushq	808(%rsp)
	.cfi_def_cfa_offset 816
	movq	432(%rsp), %rdi
	movss	%xmm6, 280(%rsp)
	call	load_criticalities@PLT
	addq	$80, %rsp
	.cfi_def_cfa_offset 736
	movq	224(%rsp), %rsi
	movq	48(%rsp), %rdi
	call	comp_td_costs
	movss	.LC8(%rip), %xmm5
	movl	$1, 256(%rsp)
	movaps	%xmm5, %xmm6
	movss	%xmm5, 164(%rsp)
	divss	324(%rsp), %xmm5
	movss	%xmm6, 320(%rsp)
	movss	%xmm5, 56(%rsp)
	movaps	%xmm6, %xmm5
	movss	200(%rsp), %xmm6
	divss	328(%rsp), %xmm5
	movss	%xmm6, 184(%rsp)
	movss	%xmm5, 32(%rsp)
	jmp	.L755
.L915:
	movl	$2, %ecx
	jmp	.L622
.L908:
	xorl	%ebx, %ebx
	jmp	.L599
.L914:
	movl	$1, %ecx
	jmp	.L622
.L679:
	jne	.L692
	jmp	.L691
.L664:
	jne	.L677
	jmp	.L676
.L694:
	movl	num_types(%rip), %ecx
	testl	%ecx, %ecx
	jg	.L903
	jmp	.L704
.L920:
	movq	%rax, %r15
	jmp	.L661
.L1174:
	movl	num_nets(%rip), %eax
	testl	%eax, %eax
	jle	.L752
	movq	net(%rip), %rbx
	movq	timing_place_crit(%rip), %r12
	subl	$1, %eax
	leaq	8(%rbx), %r13
	leaq	8(%r12,%rax,8), %rbx
.L753:
	movl	0(%r13), %eax
	testl	%eax, %eax
	jle	.L754
	subl	$1, %eax
	xorl	%esi, %esi
	leaq	4(,%rax,4), %rdx
	movq	(%r12), %rax
	leaq	4(%rax), %rdi
	call	memset@PLT
.L754:
	addq	$8, %r12
	addq	$40, %r13
	cmpq	%r12, %rbx
	jne	.L753
.L752:
	leaq	336(%rsp), %rax
	leaq	324(%rsp), %rbx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	movq	%rax, 224(%rsp)
	movq	%rbx, 48(%rsp)
	call	comp_td_costs
	pxor	%xmm0, %xmm0
	movq	360(%rsp), %rdi
	movss	336(%rsp), %xmm1
	cvtsi2ss	232(%rsp), %xmm0
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm1, 188(%rsp)
	call	load_constant_net_delay@PLT
	movq	360(%rsp), %rdi
	jmp	.L895
.L927:
	movl	$0, 232(%rsp)
	xorl	%eax, %eax
	jmp	.L746
.L1135:
	leaq	__PRETTY_FUNCTION__.5374(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC29(%rip), %rdi
	movl	$3652, %edx
	call	__assert_fail@PLT
.L1148:
	movl	212(%rsp), %edi
	cmpl	%edi, 256(%rsp)
	jge	.L951
	movl	192(%rsp), %eax
	testl	%eax, %eax
	jne	.L951
.L826:
	movss	164(%rsp), %xmm5
	movaps	%xmm5, %xmm7
	divss	328(%rsp), %xmm7
	movss	%xmm7, 32(%rsp)
	movaps	%xmm5, %xmm7
	divss	324(%rsp), %xmm7
	movss	%xmm7, 56(%rsp)
	jmp	.L897
.L918:
	movl	$5, %ecx
	jmp	.L622
.L916:
	movl	$3, %ecx
	jmp	.L622
.L951:
	pxor	%xmm0, %xmm0
	cmpl	$1, 220(%rsp)
	movss	336(%rsp), %xmm1
	cvtsi2ss	232(%rsp), %xmm0
	divss	%xmm0, %xmm1
	movss	%xmm1, 188(%rsp)
	jne	.L828
	movq	360(%rsp), %rdi
	movaps	%xmm1, %xmm0
	call	load_constant_net_delay@PLT
.L828:
	movq	360(%rsp), %rdi
	call	load_timing_graph_net_delays@PLT
	movq	352(%rsp), %rdi
	pxor	%xmm0, %xmm0
	call	load_net_slack@PLT
	movl	220(%rsp), %eax
	movss	24(%rsp), %xmm6
	movss	200(%rsp), %xmm7
	movl	%ebp, 780(%rsp)
	movss	%xmm0, 176(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 744
	movl	%eax, 744(%rsp)
	movl	48(%rsp), %eax
	movss	%xmm6, 748(%rsp)
	movss	%xmm7, 804(%rsp)
	movl	%eax, 756(%rsp)
	movl	204(%rsp), %eax
	movl	%eax, 768(%rsp)
	movl	220(%rsp), %eax
	movl	%eax, 792(%rsp)
	movl	224(%rsp), %eax
	movl	%eax, 796(%rsp)
	movl	200(%rsp), %eax
	movl	%eax, 800(%rsp)
	pushq	808(%rsp)
	.cfi_def_cfa_offset 752
	pushq	808(%rsp)
	.cfi_def_cfa_offset 760
	pushq	808(%rsp)
	.cfi_def_cfa_offset 768
	pushq	808(%rsp)
	.cfi_def_cfa_offset 776
	pushq	808(%rsp)
	.cfi_def_cfa_offset 784
	pushq	808(%rsp)
	.cfi_def_cfa_offset 792
	pushq	808(%rsp)
	.cfi_def_cfa_offset 800
	pushq	808(%rsp)
	.cfi_def_cfa_offset 808
	pushq	808(%rsp)
	.cfi_def_cfa_offset 816
	movq	432(%rsp), %rdi
	movss	264(%rsp), %xmm1
	call	load_criticalities@PLT
	addq	$80, %rsp
	.cfi_def_cfa_offset 736
	movq	224(%rsp), %rsi
	movq	48(%rsp), %rdi
	call	comp_td_costs
	jmp	.L826
.L917:
	movl	$4, %ecx
	jmp	.L622
.L1097:
	movapd	%xmm6, %xmm5
	jmp	.L836
.L934:
	pxor	%xmm5, %xmm5
	jmp	.L836
.L1170:
	movq	unique_pin_list(%rip), %rdi
	call	free@PLT
	movq	%rbp, %rdi
	call	free@PLT
	cmpl	$1, 40(%rsp)
	jne	.L879
.L1171:
	movl	300(%rsp), %r15d
	movq	place_region_x(%rip), %rdi
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	$16, %r8d
	movl	%r15d, %edx
	call	free_matrix@PLT
	movq	place_region_y(%rip), %rdi
	xorl	%ecx, %ecx
	movl	%r15d, %edx
	xorl	%esi, %esi
	movl	$16, %r8d
	call	free_matrix@PLT
	movq	place_region_bounds_x(%rip), %rdi
	call	free@PLT
	movq	place_region_bounds_y(%rip), %rdi
	call	free@PLT
	movq	64(%rsp), %rdi
	xorl	%ecx, %ecx
	movl	%r15d, %edx
	xorl	%esi, %esi
	movl	$4, %r8d
	call	free_matrix@PLT
	movq	72(%rsp), %rdi
	movl	$4, %r8d
	xorl	%ecx, %ecx
	movl	%r15d, %edx
	xorl	%esi, %esi
	call	free_matrix@PLT
	jmp	.L880
.L890:
	leaq	__PRETTY_FUNCTION__.4767(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC91(%rip), %rdi
	movl	$962, %edx
	call	__assert_fail@PLT
.L1172:
	movl	ny(%rip), %r10d
	movq	chanx_place_cost_fac(%rip), %r12
	movl	$1, %ebp
	testl	%r10d, %r10d
	js	.L882
.L992:
	movq	-8(%r12,%rbp,8), %rdi
	call	free@PLT
	movl	%ebp, %eax
	addq	$1, %rbp
	cmpl	ny(%rip), %eax
	jle	.L992
.L882:
	movq	%r12, %rdi
	movl	$1, %ebp
	call	free@PLT
	movl	nx(%rip), %r9d
	movq	chany_place_cost_fac(%rip), %r12
	testl	%r9d, %r9d
	js	.L885
.L991:
	movq	-8(%r12,%rbp,8), %rdi
	call	free@PLT
	movl	%ebp, %eax
	addq	$1, %rbp
	cmpl	nx(%rip), %eax
	jle	.L991
.L885:
	movq	%r12, %rdi
	call	free@PLT
	jmp	.L880
.L844:
	cmpl	$-1, nx(%rip)
	jge	.L846
	call	free@PLT
	testl	%ebx, %ebx
	je	.L1175
.L863:
	leaq	.LC86(%rip), %rdi
	movl	%ebx, %esi
	xorl	%eax, %eax
	call	printf@PLT
	leaq	.LC87(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L1166:
	leaq	348(%rsp), %rsi
	leaq	344(%rsp), %rdi
	call	comp_td_costs
	pxor	%xmm0, %xmm0
	leaq	.LC76(%rip), %rdi
	movl	$1, %eax
	cvtss2sd	344(%rsp), %xmm0
	call	printf@PLT
	movss	344(%rsp), %xmm2
	movaps	%xmm2, %xmm0
	movss	16(%rsp), %xmm7
	pxor	%xmm1, %xmm1
	subss	%xmm7, %xmm0
	movsd	.LC59(%rip), %xmm3
	cvtss2sd	%xmm7, %xmm1
	andps	.LC58(%rip), %xmm0
	mulsd	%xmm1, %xmm3
	cvtss2sd	%xmm0, %xmm0
	ucomisd	%xmm3, %xmm0
	jbe	.L841
	pxor	%xmm0, %xmm0
	leaq	.LC77(%rip), %rdi
	movl	$2, %eax
	movl	%ebp, %ebx
	cvtss2sd	%xmm2, %xmm0
	call	printf@PLT
.L841:
	pxor	%xmm0, %xmm0
	leaq	.LC78(%rip), %rdi
	movl	$1, %eax
	cvtss2sd	348(%rsp), %xmm0
	call	printf@PLT
	movss	348(%rsp), %xmm2
	movaps	%xmm2, %xmm0
	movss	8(%rsp), %xmm5
	pxor	%xmm1, %xmm1
	subss	%xmm5, %xmm0
	movsd	.LC59(%rip), %xmm3
	cvtss2sd	%xmm5, %xmm1
	andps	.LC58(%rip), %xmm0
	mulsd	%xmm1, %xmm3
	cvtss2sd	%xmm0, %xmm0
	ucomisd	%xmm3, %xmm0
	jbe	.L840
	pxor	%xmm0, %xmm0
	leaq	.LC79(%rip), %rdi
	movl	$2, %eax
	addl	$1, %ebx
	cvtss2sd	%xmm2, %xmm0
	call	printf@PLT
	jmp	.L840
.L1165:
	movapd	%xmm3, %xmm0
	leaq	.LC75(%rip), %rdi
	movl	$2, %eax
	movl	$2, %ebp
	movl	$1, %ebx
	call	printf@PLT
	jmp	.L838
.L1164:
	pxor	%xmm0, %xmm0
	leaq	.LC62(%rip), %rdi
	movl	$2, %eax
	cvtss2sd	%xmm3, %xmm0
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L1163:
	leaq	.LC61(%rip), %rdi
	cvtss2sd	%xmm0, %xmm0
	movl	$2, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L1158:
	leaq	.LC60(%rip), %rdi
	cvtss2sd	%xmm0, %xmm0
	movl	$2, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L1157:
	pxor	%xmm0, %xmm0
	jmp	.L788
.L1093:
	movapd	%xmm7, %xmm5
	jmp	.L808
.L932:
	pxor	%xmm5, %xmm5
	jmp	.L808
.L1140:
	movsd	%xmm1, 8(%rsp)
	call	sqrt@PLT
	movsd	8(%rsp), %xmm1
	jmp	.L761
.L1086:
	movapd	%xmm6, %xmm1
	jmp	.L761
.L641:
	movq	place_region_bounds_x(%rip), %rdx
	movss	.LC27(%rip), %xmm0
	movss	%xmm0, (%rdx)
	movss	%xmm0, (%rax)
	jmp	.L657
.L930:
	pxor	%xmm1, %xmm1
	jmp	.L761
.L929:
	pxor	%xmm1, %xmm1
	jmp	.L764
.L928:
	pxor	%xmm5, %xmm5
	leaq	320(%rsp), %rax
	xorl	%r12d, %r12d
	leaq	328(%rsp), %r15
	movq	%rax, 80(%rsp)
	movsd	%xmm5, 152(%rsp)
	movapd	%xmm5, %xmm1
	jmp	.L761
.L1138:
	pxor	%xmm5, %xmm5
	leaq	320(%rsp), %rax
	leaq	328(%rsp), %r15
	movq	%rax, 80(%rsp)
	movsd	%xmm5, 152(%rsp)
	jmp	.L760
	.cfi_endproc
.LFE24:
	.size	try_place, .-try_place
	.local	bdone.5444
	.comm	bdone.5444,8,8
	.section	.rodata
	.align 16
	.type	__PRETTY_FUNCTION__.5031, @object
	.size	__PRETTY_FUNCTION__.5031, 29
__PRETTY_FUNCTION__.5031:
	.string	"comp_td_point_to_point_delay"
	.align 8
	.type	__PRETTY_FUNCTION__.4987, @object
	.size	__PRETTY_FUNCTION__.4987, 8
__PRETTY_FUNCTION__.4987:
	.string	"find_to"
	.local	net_block_moved.4896
	.comm	net_block_moved.4896,8,8
	.local	nets_to_update.4895
	.comm	nets_to_update.4895,8,8
	.local	bb_edge_new.4894
	.comm	bb_edge_new.4894,8,8
	.local	bb_coord_new.4893
	.comm	bb_coord_new.4893,8,8
	.align 16
	.type	__PRETTY_FUNCTION__.5374, @object
	.size	__PRETTY_FUNCTION__.5374, 18
__PRETTY_FUNCTION__.5374:
	.string	"initial_placement"
	.align 8
	.type	__PRETTY_FUNCTION__.4767, @object
	.size	__PRETTY_FUNCTION__.4767, 10
__PRETTY_FUNCTION__.4767:
	.string	"try_place"
	.align 32
	.type	cross_count, @object
	.size	cross_count, 200
cross_count:
	.long	1065353216
	.long	1065353216
	.long	1065353216
	.long	1066047793
	.long	1066641706
	.long	1067203743
	.long	1067721320
	.long	1068192760
	.long	1068701109
	.long	1069122218
	.long	1069525710
	.long	1069929202
	.long	1070333533
	.long	1070737025
	.long	1071140517
	.long	1071480255
	.long	1071819994
	.long	1072159733
	.long	1072499471
	.long	1072839210
	.long	1073144555
	.long	1073449900
	.long	1073748115
	.long	1073900788
	.long	1074053461
	.long	1074186840
	.long	1074320219
	.long	1074454017
	.long	1074587396
	.long	1074720775
	.long	1074851637
	.long	1074982499
	.long	1075113781
	.long	1075244643
	.long	1075375505
	.long	1075497979
	.long	1075620453
	.long	1075743346
	.long	1075865820
	.long	1075988293
	.long	1076094829
	.long	1076201364
	.long	1076307480
	.long	1076414015
	.long	1076520550
	.long	1076630441
	.long	1076739912
	.long	1076849803
	.long	1076959275
	.long	1077069165
	.local	chany_place_cost_fac
	.comm	chany_place_cost_fac,8,8
	.local	chanx_place_cost_fac
	.comm	chanx_place_cost_fac,8,8
	.local	place_region_bounds_y
	.comm	place_region_bounds_y,8,8
	.local	place_region_bounds_x
	.comm	place_region_bounds_x,8,8
	.local	place_region_y
	.comm	place_region_y,8,8
	.local	place_region_x
	.comm	place_region_x,8,8
	.local	bb_num_on_edges
	.comm	bb_num_on_edges,8,8
	.local	bb_coords
	.comm	bb_coords,8,8
	.local	net_pin_index
	.comm	net_pin_index,8,8
	.local	temp_point_to_point_delay_cost
	.comm	temp_point_to_point_delay_cost,8,8
	.local	point_to_point_delay_cost
	.comm	point_to_point_delay_cost,8,8
	.local	temp_point_to_point_timing_cost
	.comm	temp_point_to_point_timing_cost,8,8
	.local	point_to_point_timing_cost
	.comm	point_to_point_timing_cost,8,8
	.local	temp_net_cost
	.comm	temp_net_cost,8,8
	.local	net_cost
	.comm	net_cost,8,8
	.local	unique_pin_list
	.comm	unique_pin_list,8,8
	.local	duplicate_pins
	.comm	duplicate_pins,8,8
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC5:
	.long	3789191947
	.long	1067108783
	.align 8
.LC6:
	.long	2879346075
	.long	1074157741
	.align 8
.LC7:
	.long	0
	.long	1071644672
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC8:
	.long	1065353216
	.section	.rodata.cst8
	.align 8
.LC9:
	.long	3539053052
	.long	-1085250995
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC20:
	.long	2147483648
	.long	0
	.long	0
	.long	0
	.section	.rodata.cst4
	.align 4
.LC21:
	.long	3212836864
	.section	.rodata.cst16
	.align 16
.LC22:
	.long	3212836864
	.long	3212836864
	.long	3212836864
	.long	3212836864
	.section	.rodata.cst8
	.align 8
.LC24:
	.long	34359738
	.long	1065781035
	.align 8
.LC25:
	.long	3994305841
	.long	1052652272
	.section	.rodata.cst4
	.align 4
.LC27:
	.long	1056964608
	.section	.rodata.cst8
	.align 8
.LC28:
	.long	0
	.long	1072693248
	.align 8
.LC32:
	.long	1635523546
	.long	1073042738
	.section	.rodata.cst4
	.align 4
.LC33:
	.long	1900671690
	.section	.rodata.cst8
	.align 8
.LC35:
	.long	0
	.long	1077149696
	.section	.rodata.cst16
	.align 16
.LC58:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC59:
	.long	1202590843
	.long	1063549665
	.align 8
.LC64:
	.long	3951369912
	.long	1072609361
	.align 8
.LC65:
	.long	2576980378
	.long	1072273817
	.align 8
.LC66:
	.long	3435973837
	.long	1072483532
	.align 8
.LC67:
	.long	858993459
	.long	1069757235
	.align 8
.LC68:
	.long	1717986918
	.long	1072588390
	.align 8
.LC71:
	.long	515396076
	.long	1071770501
	.align 8
.LC72:
	.long	1202590843
	.long	1064598241
	.ident	"GCC: (Debian 6.3.0-18) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
