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
