try_swap:
.LFB10:
	.loc 1 1262 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$184, %rsp
	.cfi_offset 3, -24
	movss	%xmm0, -116(%rbp)
	movq	%rdi, -128(%rbp)
	movq	%rsi, -136(%rbp)
	movq	%rdx, -144(%rbp)
	movss	%xmm1, -120(%rbp)
	movl	%ecx, -148(%rbp)
	movq	%r8, -160(%rbp)
	movq	%r9, -168(%rbp)
	movss	%xmm2, -152(%rbp)
	movss	%xmm3, -172(%rbp)
	movss	%xmm4, -176(%rbp)
	.loc 1 1278 0
	movl	$0, -40(%rbp)
	.loc 1 1279 0
	movl	$0, -32(%rbp)
	jmp	.L160
.L161:
	.loc 1 1282 0 discriminator 3
	movq	type_descriptors(%rip), %rcx
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %edx
	.loc 1 1281 0 discriminator 3
	movl	-40(%rbp), %eax
	cmpl	%eax, %edx
	cmovge	%edx, %eax
	movl	%eax, -40(%rbp)
	.loc 1 1279 0 discriminator 3
	addl	$1, -32(%rbp)
.L160:
	.loc 1 1279 0 is_stmt 0 discriminator 1
	movl	num_types(%rip), %eax
	cmpl	%eax, -32(%rbp)
	jl	.L161
	.loc 1 1287 0 is_stmt 1
	movq	bb_coord_new.4805(%rip), %rax
	testq	%rax, %rax
	jne	.L162
	.loc 1 1289 0
	movl	-40(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	movq	%rax, bb_coord_new.4805(%rip)
	.loc 1 1291 0
	movl	-40(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	movq	%rax, bb_edge_new.4806(%rip)
	.loc 1 1294 0
	movl	-40(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	.loc 1 1293 0
	movq	%rax, nets_to_update.4807(%rip)
	.loc 1 1296 0
	movl	-40(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	.loc 1 1295 0
	movq	%rax, net_block_moved.4808(%rip)
.L162:
	.loc 1 1300 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -100(%rbp)
	.loc 1 1301 0
	movl	num_blocks(%rip), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	movl	%eax, -20(%rbp)
	.loc 1 1310 0
	cmpl	$1, 24(%rbp)
	jne	.L163
	.loc 1 1312 0
	jmp	.L164
.L165:
	.loc 1 1314 0
	movl	num_blocks(%rip), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	movl	%eax, -20(%rbp)
.L164:
	.loc 1 1312 0
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rdx
	movq	IO_TYPE(%rip), %rax
	cmpq	%rax, %rdx
	je	.L165
.L163:
	.loc 1 1318 0
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	24(%rax), %eax
	movl	%eax, -56(%rbp)
	.loc 1 1319 0
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	28(%rax), %eax
	movl	%eax, -60(%rbp)
	.loc 1 1320 0
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	32(%rax), %eax
	movl	%eax, -64(%rbp)
	.loc 1 1323 0
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	.loc 1 1322 0
	movq	8(%rax), %rdx
	leaq	-92(%rbp), %r9
	leaq	-88(%rbp), %r8
	movq	48(%rbp), %rcx
	movl	-120(%rbp), %edi
	movl	-60(%rbp), %esi
	movl	-56(%rbp), %eax
	movl	%edi, -180(%rbp)
	movss	-180(%rbp), %xmm0
	movl	%eax, %edi
	call	find_to
	testl	%eax, %eax
	jne	.L166
	.loc 1 1324 0
	movl	$0, %eax
	jmp	.L198
.L166:
	.loc 1 1334 0
	movl	$0, -24(%rbp)
	.loc 1 1335 0
	movq	grid(%rip), %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-92(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	12(%rax), %eax
	cmpl	$1, %eax
	jle	.L168
	.loc 1 1337 0
	movq	grid(%rip), %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-92(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	12(%rax), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	movl	%eax, -24(%rbp)
.L168:
	.loc 1 1339 0
	movq	grid(%rip), %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-92(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$-1, %eax
	jne	.L169
	.loc 1 1341 0
	movl	$-1, -28(%rbp)
	.loc 1 1342 0
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-88(%rbp), %eax
	movl	%eax, 24(%rdx)
	.loc 1 1343 0
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-92(%rbp), %eax
	movl	%eax, 28(%rdx)
	.loc 1 1344 0
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-24(%rbp), %eax
	movl	%eax, 32(%rdx)
	jmp	.L170
.L169:
	.loc 1 1348 0
	movq	grid(%rip), %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-92(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -28(%rbp)
	.loc 1 1349 0
	movq	block(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-56(%rbp), %eax
	movl	%eax, 24(%rdx)
	.loc 1 1350 0
	movq	block(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-60(%rbp), %eax
	movl	%eax, 28(%rdx)
	.loc 1 1351 0
	movq	block(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-64(%rbp), %eax
	movl	%eax, 32(%rdx)
	.loc 1 1353 0
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-88(%rbp), %eax
	movl	%eax, 24(%rdx)
	.loc 1 1354 0
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-92(%rbp), %eax
	movl	%eax, 28(%rdx)
	.loc 1 1355 0
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-24(%rbp), %eax
	movl	%eax, 32(%rdx)
.L170:
	.loc 1 1364 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -48(%rbp)
	.loc 1 1365 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -52(%rbp)
	.loc 1 1366 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -96(%rbp)
	.loc 1 1368 0
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rax
	movl	8(%rax), %eax
	movl	%eax, -68(%rbp)
	.loc 1 1370 0
	movq	net_block_moved.4808(%rip), %rsi
	movq	nets_to_update.4807(%rip), %rax
	movl	-68(%rbp), %edi
	movl	-28(%rbp), %ecx
	movl	-20(%rbp), %edx
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	find_affected_nets
	movl	%eax, -72(%rbp)
	.loc 1 1373 0
	cmpl	$1, -148(%rbp)
	jne	.L171
	.loc 1 1375 0
	movq	-168(%rbp), %rcx
	movq	-160(%rbp), %rax
	movl	16(%rbp), %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	save_region_occ
.L171:
	.loc 1 1378 0
	movl	$0, -44(%rbp)
	.loc 1 1380 0
	movl	$0, -36(%rbp)
	jmp	.L172
.L180:
	.loc 1 1382 0
	movq	nets_to_update.4807(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -76(%rbp)
	.loc 1 1387 0
	movq	net_block_moved.4808(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$2, %eax
	je	.L199
	.loc 1 1390 0
	movq	net(%rip), %rcx
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cmpl	$3, %eax
	jg	.L175
	.loc 1 1392 0
	movq	bb_coord_new.4805(%rip), %rax
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rax, %rdx
	movl	-76(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	get_non_updateable_bb
	jmp	.L176
.L175:
	.loc 1 1396 0
	movq	net_block_moved.4808(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L177
	.loc 1 1397 0
	movl	-92(%rbp), %ecx
	movl	-88(%rbp), %r9d
	movq	bb_edge_new.4806(%rip), %rax
	.loc 1 1398 0
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	.loc 1 1397 0
	leaq	(%rax,%rdx), %rdi
	movq	bb_coord_new.4805(%rip), %rax
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	leaq	(%rax,%rdx), %rsi
	movl	-60(%rbp), %r8d
	movl	-56(%rbp), %edx
	movl	-76(%rbp), %eax
	subq	$8, %rsp
	pushq	%rcx
	movl	%edx, %ecx
	movq	%rdi, %rdx
	movl	%eax, %edi
	call	update_bb
	addq	$16, %rsp
	jmp	.L176
.L177:
	.loc 1 1401 0
	movl	-92(%rbp), %r8d
	movl	-88(%rbp), %edx
	movq	bb_edge_new.4806(%rip), %rax
	.loc 1 1402 0
	movl	-44(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$4, %rcx
	.loc 1 1401 0
	leaq	(%rax,%rcx), %rdi
	movq	bb_coord_new.4805(%rip), %rax
	movl	-44(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$4, %rcx
	leaq	(%rax,%rcx), %rsi
	movl	-56(%rbp), %r9d
	movl	-76(%rbp), %eax
	subq	$8, %rsp
	movl	-60(%rbp), %ecx
	pushq	%rcx
	movl	%edx, %ecx
	movq	%rdi, %rdx
	movl	%eax, %edi
	call	update_bb
	addq	$16, %rsp
.L176:
	.loc 1 1406 0
	cmpl	$1, -148(%rbp)
	je	.L178
	.loc 1 1408 0
	movq	temp_net_cost(%rip), %rax
	movl	-76(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	leaq	(%rax,%rdx), %rbx
	.loc 1 1409 0
	movq	bb_coord_new.4805(%rip), %rax
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rax, %rdx
	movl	-76(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	get_net_cost
	movd	%xmm0, %eax
	.loc 1 1408 0
	movl	%eax, (%rbx)
	.loc 1 1410 0
	movq	temp_net_cost(%rip), %rax
	movl	-76(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movq	net_cost(%rip), %rax
	movl	-76(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	subss	%xmm1, %xmm0
	movss	-52(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -52(%rbp)
	jmp	.L179
.L178:
	.loc 1 1415 0
	movq	bb_coords(%rip), %rax
	movl	-76(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	leaq	(%rax,%rdx), %rsi
	movl	-76(%rbp), %eax
	movl	16(%rbp), %ecx
	movl	$-1, %edx
	movl	%eax, %edi
	call	update_region_occ
	.loc 1 1417 0
	movq	bb_coord_new.4805(%rip), %rax
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	leaq	(%rax,%rdx), %rsi
	movl	-76(%rbp), %eax
	movl	16(%rbp), %ecx
	movl	$1, %edx
	movl	%eax, %edi
	call	update_region_occ
.L179:
	.loc 1 1421 0
	addl	$1, -44(%rbp)
	jmp	.L174
.L199:
	.loc 1 1388 0
	nop
.L174:
	.loc 1 1380 0 discriminator 2
	addl	$1, -36(%rbp)
.L172:
	.loc 1 1380 0 is_stmt 0 discriminator 1
	movl	-36(%rbp), %eax
	cmpl	-72(%rbp), %eax
	jl	.L180
	.loc 1 1424 0 is_stmt 1
	cmpl	$1, -148(%rbp)
	jne	.L181
	.loc 1 1426 0
	movl	16(%rbp), %edi
	call	nonlinear_cong_cost
	movd	%xmm0, %eax
	movl	%eax, -80(%rbp)
	.loc 1 1427 0
	movq	-136(%rbp), %rax
	movss	(%rax), %xmm1
	movss	-80(%rbp), %xmm0
	subss	%xmm1, %xmm0
	movss	%xmm0, -52(%rbp)
.L181:
	.loc 1 1431 0
	cmpl	$1, 32(%rbp)
	je	.L182
	.loc 1 1431 0 is_stmt 0 discriminator 1
	cmpl	$2, 32(%rbp)
	jne	.L183
.L182:
	.loc 1 1438 0 is_stmt 1
	leaq	-100(%rbp), %rdi
	leaq	-96(%rbp), %rcx
	movl	-68(%rbp), %edx
	movl	-28(%rbp), %esi
	movl	-20(%rbp), %eax
	movq	%rdi, %r8
	movl	%eax, %edi
	call	comp_delta_td_cost
	.loc 1 1442 0
	movss	.LC2(%rip), %xmm0
	subss	-152(%rbp), %xmm0
	mulss	-52(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	mulss	-172(%rbp), %xmm1
	.loc 1 1443 0
	movss	-96(%rbp), %xmm0
	mulss	-152(%rbp), %xmm0
	mulss	-176(%rbp), %xmm0
	.loc 1 1441 0
	addss	%xmm1, %xmm0
	movss	%xmm0, -48(%rbp)
	jmp	.L184
.L183:
	.loc 1 1447 0
	movss	-52(%rbp), %xmm0
	movss	%xmm0, -48(%rbp)
.L184:
	.loc 1 1451 0
	movss	-116(%rbp), %xmm0
	movl	-48(%rbp), %eax
	movaps	%xmm0, %xmm1
	movl	%eax, -180(%rbp)
	movss	-180(%rbp), %xmm0
	call	assess_swap
	movl	%eax, -84(%rbp)
	.loc 1 1455 0
	cmpl	$0, -84(%rbp)
	je	.L185
	.loc 1 1457 0
	movq	-128(%rbp), %rax
	movss	(%rax), %xmm0
	addss	-48(%rbp), %xmm0
	movq	-128(%rbp), %rax
	movss	%xmm0, (%rax)
	.loc 1 1458 0
	movq	-136(%rbp), %rax
	movss	(%rax), %xmm0
	addss	-52(%rbp), %xmm0
	movq	-136(%rbp), %rax
	movss	%xmm0, (%rax)
	.loc 1 1461 0
	cmpl	$1, 32(%rbp)
	je	.L186
	.loc 1 1461 0 is_stmt 0 discriminator 1
	cmpl	$2, 32(%rbp)
	jne	.L187
.L186:
	.loc 1 1466 0 is_stmt 1
	movq	-144(%rbp), %rax
	movss	(%rax), %xmm1
	movss	-96(%rbp), %xmm0
	addss	%xmm1, %xmm0
	movq	-144(%rbp), %rax
	movss	%xmm0, (%rax)
	.loc 1 1467 0
	movq	40(%rbp), %rax
	movss	(%rax), %xmm1
	movss	-100(%rbp), %xmm0
	addss	%xmm1, %xmm0
	movq	40(%rbp), %rax
	movss	%xmm0, (%rax)
	.loc 1 1469 0
	movl	-68(%rbp), %edx
	movl	-28(%rbp), %ecx
	movl	-20(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	update_td_cost
.L187:
	.loc 1 1474 0
	movl	$0, -44(%rbp)
	.loc 1 1476 0
	movl	$0, -36(%rbp)
	jmp	.L188
.L192:
	.loc 1 1478 0
	movq	nets_to_update.4807(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -76(%rbp)
	.loc 1 1483 0
	movq	net_block_moved.4808(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$2, %eax
	jne	.L189
	.loc 1 1485 0
	movq	temp_net_cost(%rip), %rax
	movl	-76(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC53(%rip), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 1486 0
	jmp	.L190
.L189:
	.loc 1 1489 0
	movq	bb_coords(%rip), %rax
	movl	-76(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	leaq	(%rax,%rdx), %rcx
	movq	bb_coord_new.4805(%rip), %rax
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movq	8(%rax), %rdx
	movq	(%rax), %rax
	movq	%rax, (%rcx)
	movq	%rdx, 8(%rcx)
	.loc 1 1490 0
	movq	net(%rip), %rcx
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cmpl	$3, %eax
	jle	.L191
	.loc 1 1491 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-76(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	leaq	(%rax,%rdx), %rcx
	movq	bb_edge_new.4806(%rip), %rax
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movq	8(%rax), %rdx
	movq	(%rax), %rax
	movq	%rax, (%rcx)
	movq	%rdx, 8(%rcx)
.L191:
	.loc 1 1493 0
	addl	$1, -44(%rbp)
	.loc 1 1495 0
	movq	net_cost(%rip), %rax
	movl	-76(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movq	temp_net_cost(%rip), %rdx
	movl	-76(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 1496 0
	movq	temp_net_cost(%rip), %rax
	movl	-76(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC53(%rip), %xmm0
	movss	%xmm0, (%rax)
.L190:
	.loc 1 1476 0 discriminator 2
	addl	$1, -36(%rbp)
.L188:
	.loc 1 1476 0 is_stmt 0 discriminator 1
	movl	-36(%rbp), %eax
	cmpl	-72(%rbp), %eax
	jl	.L192
	.loc 1 1501 0 is_stmt 1
	movq	grid(%rip), %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-92(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	movl	-20(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 1502 0
	movq	grid(%rip), %rax
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-60(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	movl	-28(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 1504 0
	cmpl	$-1, -28(%rbp)
	jne	.L194
	.loc 1 1506 0
	movq	grid(%rip), %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-92(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	12(%rax), %edx
	addl	$1, %edx
	movl	%edx, 12(%rax)
	.loc 1 1507 0
	movq	grid(%rip), %rax
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-60(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	12(%rax), %edx
	subl	$1, %edx
	movl	%edx, 12(%rax)
	jmp	.L194
.L185:
	.loc 1 1515 0
	movl	$0, -36(%rbp)
	jmp	.L195
.L196:
	.loc 1 1517 0 discriminator 3
	movq	nets_to_update.4807(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -76(%rbp)
	.loc 1 1518 0 discriminator 3
	movq	temp_net_cost(%rip), %rax
	movl	-76(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC53(%rip), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 1515 0 discriminator 3
	addl	$1, -36(%rbp)
.L195:
	.loc 1 1515 0 is_stmt 0 discriminator 1
	movl	-36(%rbp), %eax
	cmpl	-72(%rbp), %eax
	jl	.L196
	.loc 1 1522 0 is_stmt 1
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-56(%rbp), %eax
	movl	%eax, 24(%rdx)
	.loc 1 1523 0
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-60(%rbp), %eax
	movl	%eax, 28(%rdx)
	.loc 1 1524 0
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-64(%rbp), %eax
	movl	%eax, 32(%rdx)
	.loc 1 1525 0
	cmpl	$-1, -28(%rbp)
	je	.L197
	.loc 1 1527 0
	movq	block(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-88(%rbp), %eax
	movl	%eax, 24(%rdx)
	.loc 1 1528 0
	movq	block(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-92(%rbp), %eax
	movl	%eax, 28(%rdx)
	.loc 1 1529 0
	movq	block(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-24(%rbp), %eax
	movl	%eax, 32(%rdx)
.L197:
	.loc 1 1533 0
	cmpl	$1, -148(%rbp)
	jne	.L194
	.loc 1 1535 0
	movq	-168(%rbp), %rcx
	movq	-160(%rbp), %rax
	movl	16(%rbp), %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	restore_region_occ
.L194:
	.loc 1 1540 0
	movl	-84(%rbp), %eax
.L198:
	.loc 1 1541 0 discriminator 1
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	try_swap, .-try_swap
	.type	save_region_occ, @function
save_region_occ:
.LFB11:
	.loc 1 1548 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	.loc 1 1555 0
	movl	$0, -4(%rbp)
	jmp	.L201
.L204:
	.loc 1 1557 0
	movl	$0, -8(%rbp)
	jmp	.L202
.L203:
	.loc 1 1559 0 discriminator 3
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movq	place_region_x(%rip), %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$4, %rcx
	addq	%rcx, %rdx
	movss	8(%rdx), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 1560 0 discriminator 3
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movq	place_region_y(%rip), %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$4, %rcx
	addq	%rcx, %rdx
	movss	8(%rdx), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 1557 0 discriminator 3
	addl	$1, -8(%rbp)
.L202:
	.loc 1 1557 0 is_stmt 0 discriminator 1
	movl	-8(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L203
	.loc 1 1555 0 is_stmt 1 discriminator 2
	addl	$1, -4(%rbp)
.L201:
	.loc 1 1555 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L204
	.loc 1 1563 0 is_stmt 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	save_region_occ, .-save_region_occ
	.type	restore_region_occ, @function
restore_region_occ:
.LFB12:
	.loc 1 1570 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	.loc 1 1577 0
	movl	$0, -4(%rbp)
	jmp	.L206
.L209:
	.loc 1 1579 0
	movl	$0, -8(%rbp)
	jmp	.L207
.L208:
	.loc 1 1581 0 discriminator 3
	movq	place_region_x(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	movss	%xmm0, 8(%rax)
	.loc 1 1582 0 discriminator 3
	movq	place_region_y(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	movss	%xmm0, 8(%rax)
	.loc 1 1579 0 discriminator 3
	addl	$1, -8(%rbp)
.L207:
	.loc 1 1579 0 is_stmt 0 discriminator 1
	movl	-8(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L208
	.loc 1 1577 0 is_stmt 1 discriminator 2
	addl	$1, -4(%rbp)
.L206:
	.loc 1 1577 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L209
	.loc 1 1585 0 is_stmt 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	restore_region_occ, .-restore_region_occ
	.section	.rodata
	.align 8
.LC54:
	.string	"Error in find_affected_nets -- count = %d, affected index = %d.\n"
	.text
	.type	find_affected_nets, @function
find_affected_nets:
.LFB13:
	.loc 1 1594 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	%ecx, -40(%rbp)
	movl	%r8d, -44(%rbp)
	.loc 1 1603 0
	movl	$0, -8(%rbp)
	.loc 1 1605 0
	movl	$0, -4(%rbp)
	jmp	.L211
.L217:
	.loc 1 1607 0
	movq	block(%rip), %rcx
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -16(%rbp)
	.loc 1 1609 0
	cmpl	$-1, -16(%rbp)
	je	.L234
	.loc 1 1612 0
	movq	net(%rip), %rcx
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L235
	.loc 1 1617 0
	movq	temp_net_cost(%rip), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	ja	.L236
	.loc 1 1620 0
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-16(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 1621 0
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, (%rax)
	.loc 1 1622 0
	addl	$1, -8(%rbp)
	.loc 1 1623 0
	movq	temp_net_cost(%rip), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, (%rax)
	jmp	.L213
.L234:
	.loc 1 1610 0
	nop
	jmp	.L213
.L235:
	.loc 1 1613 0
	nop
	jmp	.L213
.L236:
	.loc 1 1618 0
	nop
.L213:
	.loc 1 1605 0 discriminator 2
	addl	$1, -4(%rbp)
.L211:
	.loc 1 1605 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L217
	.loc 1 1626 0 is_stmt 1
	cmpl	$-1, -40(%rbp)
	je	.L218
	.loc 1 1628 0
	movl	$0, -4(%rbp)
	jmp	.L219
.L230:
	.loc 1 1630 0
	movq	block(%rip), %rcx
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -16(%rbp)
	.loc 1 1632 0
	cmpl	$-1, -16(%rbp)
	je	.L237
	.loc 1 1635 0
	movq	net(%rip), %rcx
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L238
	.loc 1 1638 0
	movq	temp_net_cost(%rip), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jbe	.L233
	.loc 1 1640 0
	movl	$0, -12(%rbp)
	jmp	.L225
.L229:
	.loc 1 1642 0
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	-16(%rbp), %eax
	jne	.L226
	.loc 1 1644 0
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L239
	.loc 1 1645 0
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	$2, (%rax)
	.loc 1 1647 0
	jmp	.L239
.L226:
	.loc 1 1640 0 discriminator 2
	addl	$1, -12(%rbp)
.L225:
	.loc 1 1640 0 is_stmt 0 discriminator 1
	movl	-12(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.L229
	jmp	.L228
.L239:
	.loc 1 1647 0 is_stmt 1
	nop
.L228:
	.loc 1 1652 0
	movl	-12(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.L221
	.loc 1 1654 0
	movl	-8(%rbp), %edx
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC54(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1658 0
	movl	$1, %edi
	call	exit@PLT
.L233:
	.loc 1 1666 0
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-16(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 1667 0
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	$1, (%rax)
	.loc 1 1668 0
	addl	$1, -8(%rbp)
	.loc 1 1669 0
	movq	temp_net_cost(%rip), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, (%rax)
	jmp	.L221
.L237:
	.loc 1 1633 0
	nop
	jmp	.L221
.L238:
	.loc 1 1636 0
	nop
.L221:
	.loc 1 1628 0 discriminator 2
	addl	$1, -4(%rbp)
.L219:
	.loc 1 1628 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L230
.L218:
	.loc 1 1674 0 is_stmt 1
	movl	-8(%rbp), %eax
	.loc 1 1675 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	find_affected_nets, .-find_affected_nets
	.section	.rodata
.LC55:
	.string	"num_col_same_type != 0"
.LC56:
	.string	"Error in find_to: rlx = %d\n"
	.align 8
.LC57:
	.string	"Error in find_to.  Unexpected io swap location."
.LC58:
	.string	"*x_to >= 1 && *x_to <= nx"
.LC59:
	.string	"*y_to >= 1 && *y_to <= ny"
	.align 8
.LC60:
	.string	"Error in routine find_to:  (x_to,y_to) = (%d,%d)\n"
	.align 8
.LC61:
	.string	"type == grid[*x_to][*y_to].type"
	.text
	.type	find_to, @function
find_to:
.LFB14:
	.loc 1 1686 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 3, -24
	movl	%edi, -84(%rbp)
	movl	%esi, -88(%rbp)
	movq	%rdx, -96(%rbp)
	movss	%xmm0, -100(%rbp)
	movq	%rcx, -112(%rbp)
	movq	%r8, -120(%rbp)
	movq	%r9, -128(%rbp)
	.loc 1 1696 0
	movl	nx(%rip), %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	ucomiss	-100(%rbp), %xmm0
	jbe	.L286
	.loc 1 1696 0 is_stmt 0 discriminator 1
	movss	-100(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	jmp	.L243
.L286:
	.loc 1 1696 0 discriminator 2
	movl	nx(%rip), %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	cvttss2si	%xmm0, %eax
.L243:
	.loc 1 1696 0 discriminator 4
	movl	%eax, -32(%rbp)
	.loc 1 1697 0 is_stmt 1 discriminator 4
	movl	ny(%rip), %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	ucomiss	-100(%rbp), %xmm0
	jbe	.L287
	.loc 1 1697 0 is_stmt 0 discriminator 1
	movss	-100(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	jmp	.L246
.L287:
	.loc 1 1697 0 discriminator 2
	movl	ny(%rip), %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	cvttss2si	%xmm0, %eax
.L246:
	.loc 1 1697 0 discriminator 4
	movl	%eax, -36(%rbp)
	.loc 1 1699 0 is_stmt 1 discriminator 4
	movl	-84(%rbp), %eax
	subl	-32(%rbp), %eax
	movl	$1, %edx
	testl	%eax, %eax
	cmovle	%edx, %eax
	movl	%eax, -40(%rbp)
	.loc 1 1700 0 discriminator 4
	movl	-84(%rbp), %edx
	movl	-32(%rbp), %eax
	addl	%eax, %edx
	movl	nx(%rip), %eax
	cmpl	%eax, %edx
	cmovle	%edx, %eax
	movl	%eax, -44(%rbp)
	.loc 1 1701 0 discriminator 4
	movl	-88(%rbp), %eax
	subl	-36(%rbp), %eax
	movl	$1, %edx
	testl	%eax, %eax
	cmovle	%edx, %eax
	movl	%eax, -48(%rbp)
	.loc 1 1702 0 discriminator 4
	movl	-88(%rbp), %edx
	movl	-36(%rbp), %eax
	addl	%eax, %edx
	movl	ny(%rip), %eax
	cmpl	%eax, %edx
	cmovle	%edx, %eax
	movl	%eax, -52(%rbp)
	.loc 1 1704 0 discriminator 4
	movl	$0, -20(%rbp)
	.loc 1 1705 0 discriminator 4
	movl	$0, -28(%rbp)
	.loc 1 1706 0 discriminator 4
	movq	IO_TYPE(%rip), %rax
	cmpq	%rax, -96(%rbp)
	je	.L247
	.loc 1 1708 0
	movl	-40(%rbp), %eax
	movl	%eax, -24(%rbp)
	jmp	.L248
.L250:
	.loc 1 1710 0
	movq	grid(%rip), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	cmpq	-96(%rbp), %rax
	jne	.L249
	.loc 1 1712 0
	addl	$1, -20(%rbp)
	.loc 1 1713 0
	movl	-28(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-112(%rbp), %rax
	addq	%rax, %rdx
	movl	-24(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 1714 0
	addl	$1, -28(%rbp)
.L249:
	.loc 1 1708 0 discriminator 2
	addl	$1, -24(%rbp)
.L248:
	.loc 1 1708 0 is_stmt 0 discriminator 1
	movl	-24(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jle	.L250
	.loc 1 1717 0 is_stmt 1
	cmpl	$0, -20(%rbp)
	jne	.L251
	.loc 1 1717 0 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.4899(%rip), %rcx
	movl	$1717, %edx
	leaq	.LC40(%rip), %rsi
	leaq	.LC55(%rip), %rdi
	call	__assert_fail@PLT
.L251:
	.loc 1 1718 0 is_stmt 1
	cmpl	$1, -20(%rbp)
	jne	.L247
	.loc 1 1719 0 discriminator 1
	movl	-52(%rbp), %eax
	subl	-48(%rbp), %eax
	movq	-96(%rbp), %rdx
	movl	16(%rdx), %esi
	cltd
	idivl	%esi
	subl	$1, %eax
	.loc 1 1718 0 discriminator 1
	testl	%eax, %eax
	jle	.L252
	.loc 1 1720 0
	movq	-96(%rbp), %rax
	movl	16(%rax), %edx
	movl	ny(%rip), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	cmpl	%eax, %edx
	jle	.L247
.L252:
	.loc 1 1721 0
	movl	$0, %eax
	jmp	.L253
.L247:
	.loc 1 1725 0
	cmpl	$0, -32(%rbp)
	jle	.L254
	.loc 1 1725 0 is_stmt 0 discriminator 1
	movl	nx(%rip), %eax
	cmpl	%eax, -32(%rbp)
	jle	.L255
.L254:
	.loc 1 1727 0 is_stmt 1
	movl	-32(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC56(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1728 0
	movl	$1, %edi
	call	exit@PLT
.L255:
	.loc 1 1734 0
	movq	IO_TYPE(%rip), %rax
	cmpq	%rax, -96(%rbp)
	jne	.L256
	.loc 1 1736 0
	movl	nx(%rip), %eax
	cmpl	%eax, -32(%rbp)
	jl	.L257
	.loc 1 1738 0
	movl	$3, %edi
	call	my_irand@PLT
	movl	%eax, -56(%rbp)
	.loc 1 1748 0
	movl	-56(%rbp), %eax
	cmpl	$1, %eax
	je	.L259
	cmpl	$1, %eax
	jg	.L260
	testl	%eax, %eax
	je	.L261
	jmp	.L258
.L260:
	cmpl	$2, %eax
	je	.L262
	cmpl	$3, %eax
	je	.L263
	jmp	.L258
.L261:
	.loc 1 1751 0
	movl	ny(%rip), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	.loc 1 1752 0
	movq	-120(%rbp), %rax
	movl	$0, (%rax)
	.loc 1 1753 0
	movq	-128(%rbp), %rax
	movl	-60(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 1754 0
	jmp	.L276
.L259:
	.loc 1 1756 0
	movl	nx(%rip), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	.loc 1 1757 0
	movq	-120(%rbp), %rax
	movl	-60(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 1758 0
	movl	ny(%rip), %eax
	leal	1(%rax), %edx
	movq	-128(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1759 0
	jmp	.L276
.L262:
	.loc 1 1761 0
	movl	ny(%rip), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	.loc 1 1762 0
	movl	nx(%rip), %eax
	leal	1(%rax), %edx
	movq	-120(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1763 0
	movq	-128(%rbp), %rax
	movl	-60(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 1764 0
	jmp	.L276
.L263:
	.loc 1 1766 0
	movl	nx(%rip), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	.loc 1 1767 0
	movq	-120(%rbp), %rax
	movl	-60(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 1768 0
	movq	-128(%rbp), %rax
	movl	$0, (%rax)
	.loc 1 1769 0
	jmp	.L276
.L258:
	.loc 1 1771 0
	leaq	.LC57(%rip), %rdi
	call	puts@PLT
	.loc 1 1773 0
	movl	$1, %edi
	call	exit@PLT
.L257:
	.loc 1 1778 0
	cmpl	$0, -84(%rbp)
	jne	.L266
	.loc 1 1780 0
	movl	-36(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	movl	%eax, -60(%rbp)
	.loc 1 1781 0
	movl	-88(%rbp), %eax
	subl	-36(%rbp), %eax
	movl	%eax, %edx
	movl	-60(%rbp), %eax
	addl	%eax, %edx
	movq	-128(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1782 0
	movq	-120(%rbp), %rax
	movl	-84(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 1783 0
	movq	-128(%rbp), %rax
	movl	(%rax), %edx
	movl	ny(%rip), %eax
	cmpl	%eax, %edx
	jle	.L267
	.loc 1 1785 0
	movl	ny(%rip), %eax
	leal	1(%rax), %edx
	movq	-128(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1786 0
	movl	-32(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	leal	1(%rax), %edx
	movq	-120(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L276
.L267:
	.loc 1 1788 0
	movq	-128(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jg	.L276
	.loc 1 1790 0
	movq	-128(%rbp), %rax
	movl	$0, (%rax)
	.loc 1 1791 0
	movl	-32(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	leal	1(%rax), %edx
	movq	-120(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L276
.L266:
	.loc 1 1794 0
	movl	nx(%rip), %eax
	addl	$1, %eax
	cmpl	-84(%rbp), %eax
	jne	.L269
	.loc 1 1796 0
	movl	-36(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	movl	%eax, -60(%rbp)
	.loc 1 1797 0
	movl	-88(%rbp), %eax
	subl	-36(%rbp), %eax
	movl	%eax, %edx
	movl	-60(%rbp), %eax
	addl	%eax, %edx
	movq	-128(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1798 0
	movq	-120(%rbp), %rax
	movl	-84(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 1799 0
	movq	-128(%rbp), %rax
	movl	(%rax), %edx
	movl	ny(%rip), %eax
	cmpl	%eax, %edx
	jle	.L270
	.loc 1 1801 0
	movl	ny(%rip), %eax
	leal	1(%rax), %edx
	movq	-128(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1802 0
	movl	nx(%rip), %ebx
	movl	-32(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	subl	%eax, %ebx
	movl	%ebx, %edx
	movq	-120(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L276
.L270:
	.loc 1 1804 0
	movq	-128(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jg	.L276
	.loc 1 1806 0
	movq	-128(%rbp), %rax
	movl	$0, (%rax)
	.loc 1 1807 0
	movl	nx(%rip), %ebx
	movl	-32(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	subl	%eax, %ebx
	movl	%ebx, %edx
	movq	-120(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L276
.L269:
	.loc 1 1810 0
	cmpl	$0, -88(%rbp)
	jne	.L272
	.loc 1 1812 0
	movl	-32(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	movl	%eax, -60(%rbp)
	.loc 1 1813 0
	movl	-84(%rbp), %eax
	subl	-32(%rbp), %eax
	movl	%eax, %edx
	movl	-60(%rbp), %eax
	addl	%eax, %edx
	movq	-120(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1814 0
	movq	-128(%rbp), %rax
	movl	-88(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 1815 0
	movq	-120(%rbp), %rax
	movl	(%rax), %edx
	movl	nx(%rip), %eax
	cmpl	%eax, %edx
	jle	.L273
	.loc 1 1817 0
	movl	nx(%rip), %eax
	leal	1(%rax), %edx
	movq	-120(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1818 0
	movl	-36(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	leal	1(%rax), %edx
	movq	-128(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L276
.L273:
	.loc 1 1820 0
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jg	.L276
	.loc 1 1822 0
	movq	-120(%rbp), %rax
	movl	$0, (%rax)
	.loc 1 1823 0
	movl	-36(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	leal	1(%rax), %edx
	movq	-128(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L276
.L272:
	.loc 1 1828 0
	movl	-32(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	movl	%eax, -60(%rbp)
	.loc 1 1829 0
	movl	-84(%rbp), %eax
	subl	-32(%rbp), %eax
	movl	%eax, %edx
	movl	-60(%rbp), %eax
	addl	%eax, %edx
	movq	-120(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1830 0
	movq	-128(%rbp), %rax
	movl	-88(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 1831 0
	movq	-120(%rbp), %rax
	movl	(%rax), %edx
	movl	nx(%rip), %eax
	cmpl	%eax, %edx
	jle	.L275
	.loc 1 1833 0
	movl	nx(%rip), %eax
	leal	1(%rax), %edx
	movq	-120(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1834 0
	movl	ny(%rip), %ebx
	movl	-36(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	subl	%eax, %ebx
	movl	%ebx, %edx
	movq	-128(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L276
.L275:
	.loc 1 1836 0
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jg	.L276
	.loc 1 1838 0
	movq	-120(%rbp), %rax
	movl	$0, (%rax)
	.loc 1 1839 0
	movl	ny(%rip), %ebx
	movl	-36(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	subl	%eax, %ebx
	movl	%ebx, %edx
	movq	-128(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L276
.L256:
	.loc 1 1846 0
	movl	-20(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	movl	%eax, -64(%rbp)
	.loc 1 1848 0
	movl	-52(%rbp), %eax
	subl	-48(%rbp), %eax
	movq	-96(%rbp), %rdx
	movl	16(%rdx), %esi
	cltd
	idivl	%esi
	subl	$1, %eax
	movl	$0, %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	.loc 1 1847 0
	movl	%eax, %edi
	call	my_irand@PLT
	movl	%eax, -68(%rbp)
	.loc 1 1850 0
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-120(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1851 0
	movq	-96(%rbp), %rax
	movl	16(%rax), %eax
	imull	-68(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%eax, %edx
	movq	-128(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1852 0
	movq	-128(%rbp), %rax
	movl	(%rax), %ecx
	movq	grid(%rip), %rdx
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rsi
	movq	-128(%rbp), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	movl	8(%rax), %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movq	-128(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1853 0
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jle	.L277
	.loc 1 1853 0 is_stmt 0 discriminator 2
	movq	-120(%rbp), %rax
	movl	(%rax), %edx
	movl	nx(%rip), %eax
	cmpl	%eax, %edx
	jle	.L278
.L277:
	.loc 1 1853 0 discriminator 3
	leaq	__PRETTY_FUNCTION__.4899(%rip), %rcx
	movl	$1853, %edx
	leaq	.LC40(%rip), %rsi
	leaq	.LC58(%rip), %rdi
	call	__assert_fail@PLT
.L278:
	.loc 1 1854 0 is_stmt 1
	movq	-128(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jle	.L279
	.loc 1 1854 0 is_stmt 0 discriminator 2
	movq	-128(%rbp), %rax
	movl	(%rax), %edx
	movl	ny(%rip), %eax
	cmpl	%eax, %edx
	jle	.L276
.L279:
	.loc 1 1854 0 discriminator 3
	leaq	__PRETTY_FUNCTION__.4899(%rip), %rcx
	movl	$1854, %edx
	leaq	.LC40(%rip), %rsi
	leaq	.LC59(%rip), %rdi
	call	__assert_fail@PLT
.L276:
	.loc 1 1857 0 is_stmt 1
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cmpl	-84(%rbp), %eax
	jne	.L280
	.loc 1 1857 0 is_stmt 0 discriminator 1
	movq	-128(%rbp), %rax
	movl	(%rax), %eax
	cmpl	-88(%rbp), %eax
	je	.L255
.L280:
	.loc 1 1860 0 is_stmt 1
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	js	.L281
	.loc 1 1860 0 is_stmt 0 discriminator 1
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	movl	nx(%rip), %edx
	addl	$1, %edx
	cmpl	%edx, %eax
	jg	.L281
	.loc 1 1860 0 discriminator 2
	movq	-128(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	js	.L281
	.loc 1 1860 0 discriminator 3
	movq	-128(%rbp), %rax
	movl	(%rax), %eax
	movl	ny(%rip), %edx
	addl	$1, %edx
	cmpl	%edx, %eax
	jle	.L282
.L281:
	.loc 1 1862 0 is_stmt 1
	movq	-128(%rbp), %rax
	movl	(%rax), %edx
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC60(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1864 0
	movl	$1, %edi
	call	exit@PLT
.L282:
	.loc 1 1867 0
	movq	grid(%rip), %rdx
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movq	-128(%rbp), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	cmpq	-96(%rbp), %rax
	je	.L283
	.loc 1 1867 0 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.4899(%rip), %rcx
	movl	$1867, %edx
	leaq	.LC40(%rip), %rsi
	leaq	.LC61(%rip), %rdi
	call	__assert_fail@PLT
.L283:
	.loc 1 1868 0 is_stmt 1
	movl	$1, %eax
.L253:
	.loc 1 1869 0
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	find_to, .-find_to
	.type	assess_swap, @function
