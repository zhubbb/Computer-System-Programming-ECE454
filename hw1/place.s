	.file	"place.c"
	.text
.Ltext0:
	.local	duplicate_pins
	.comm	duplicate_pins,8,8
	.local	unique_pin_list
	.comm	unique_pin_list,8,8
	.local	net_cost
	.comm	net_cost,8,8
	.local	temp_net_cost
	.comm	temp_net_cost,8,8
	.local	point_to_point_timing_cost
	.comm	point_to_point_timing_cost,8,8
	.local	temp_point_to_point_timing_cost
	.comm	temp_point_to_point_timing_cost,8,8
	.local	point_to_point_delay_cost
	.comm	point_to_point_delay_cost,8,8
	.local	temp_point_to_point_delay_cost
	.comm	temp_point_to_point_delay_cost,8,8
	.local	net_pin_index
	.comm	net_pin_index,8,8
	.local	bb_coords
	.comm	bb_coords,8,8
	.local	bb_num_on_edges
	.comm	bb_num_on_edges,8,8
	.local	place_region_x
	.comm	place_region_x,8,8
	.local	place_region_y
	.comm	place_region_y,8,8
	.local	place_region_bounds_x
	.comm	place_region_bounds_x,8,8
	.local	place_region_bounds_y
	.comm	place_region_bounds_y,8,8
	.local	chanx_place_cost_fac
	.comm	chanx_place_cost_fac,8,8
	.local	chany_place_cost_fac
	.comm	chany_place_cost_fac,8,8
	.section	.rodata
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
	.align 8
.LC0:
	.string	"\nThere are %d point to point connections in this circuit\n\n"
	.align 8
.LC5:
	.string	"Initial Placement Cost: %g bb_cost: %g td_cost: %g delay_cost: %g\n\n"
.LC6:
	.string	"Av Tot Del"
.LC7:
	.string	"Av. TD Cost"
.LC8:
	.string	"Av. BB Cost"
.LC9:
	.string	"Cost"
.LC10:
	.string	"T"
	.align 8
.LC11:
	.string	"%11s  %10s %11s  %11s  %11s %11s  %11s %9s %8s  %7s  %7s  %10s  %7s\n"
.LC12:
	.string	"Alpha"
.LC13:
	.string	"Tot. Moves"
.LC14:
	.string	"Exp"
.LC15:
	.string	"R limit"
.LC16:
	.string	"Std Dev"
.LC17:
	.string	"Ac Rate"
.LC18:
	.string	"d_max"
.LC19:
	.string	"P to P Del"
.LC20:
	.string	"---------"
.LC21:
	.string	"-----------"
.LC22:
	.string	"----------"
.LC23:
	.string	"--------"
.LC24:
	.string	"-----"
.LC25:
	.string	"-------"
	.align 8
.LC26:
	.string	"Initial Placement.  Cost: %g  BB Cost: %g  TD Cost %g  Delay Cost: %g \t d_max %g Channel Factor: %d"
	.align 8
.LC30:
	.string	"Error in try_place:  new_bb_cost = %g, old bb_cost = %g.\n"
	.align 8
.LC31:
	.string	"Error in try_place:  new_timing_cost = %g, old timing_cost = %g.\n"
	.align 8
.LC32:
	.string	"Error in try_place:  new_delay_cost = %g, old delay_cost = %g.\n"
	.align 8
.LC33:
	.string	"%11.5g  %10.6g %11.6g  %11.6g  %11.6g %11.6g %11.4g %9.4g %8.3g  %7.4g  %7.4g  %10d  "
.LC34:
	.string	"%7.4g\n"
	.align 8
.LC35:
	.string	"Cost: %g  BB Cost %g  TD Cost %g  Temperature: %g  d_max: %g"
	.align 8
.LC36:
	.string	"%11.5g  %10.6g %11.6g  %11.6g  %11.6g %11.6g %11.4g %9.4g %8.3g  %7.4g  %7.4g  %10d  \n\n"
	.align 8
.LC37:
	.string	"Placement Estimated Crit Path Delay: %g\n\n"
	.align 8
.LC38:
	.string	"Placement. Cost: %g  bb_cost: %g td_cost: %g Channel Factor: %d d_max: %g"
	.align 8
.LC39:
	.string	"Placement. Cost: %g  bb_cost: %g  td_cost: %g  delay_cost: %g.\n"
.LC40:
	.string	"./SRC/place.c"
.LC41:
	.string	"(*mst)[inet]"
	.text
	.globl	try_place
	.type	try_place, @function
try_place:
.LFB2:
	.file 1 "./SRC/place.c"
	.loc 1 305 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$600, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -568(%rbp)
	movd	%xmm0, %eax
	movq	%rdx, -592(%rbp)
	movq	%rcx, -600(%rbp)
	movq	%rsi, -584(%rbp)
	movl	%eax, -576(%rbp)
	.loc 1 338 0
	movl	nx(%rip), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	movq	%rax, -144(%rbp)
	.loc 1 340 0
	movq	$0, -136(%rbp)
	.loc 1 342 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	je	.L2
	.loc 1 343 0 discriminator 1
	movl	16(%rbp), %eax
	.loc 1 342 0 discriminator 1
	cmpl	$2, %eax
	je	.L2
	.loc 1 344 0
	movl	68(%rbp), %eax
	.loc 1 343 0
	testl	%eax, %eax
	je	.L3
.L2:
	.loc 1 347 0
	leaq	-552(%rbp), %rcx
	leaq	-560(%rbp), %rdx
	movq	-584(%rbp), %rsi
	movl	-576(%rbp), %r8d
	movq	-568(%rbp), %rdi
	subq	$8, %rsp
	movq	-592(%rbp), %rax
	pushq	16(%rax)
	pushq	8(%rax)
	pushq	(%rax)
	pushq	248(%rbp)
	pushq	240(%rbp)
	pushq	232(%rbp)
	pushq	224(%rbp)
	pushq	216(%rbp)
	pushq	208(%rbp)
	pushq	200(%rbp)
	pushq	192(%rbp)
	pushq	184(%rbp)
	pushq	176(%rbp)
	pushq	168(%rbp)
	pushq	160(%rbp)
	subq	$48, %rsp
	movq	%rsp, %rax
	movq	112(%rbp), %r9
	movq	%r9, (%rax)
	movq	120(%rbp), %r9
	movq	%r9, 8(%rax)
	movq	128(%rbp), %r9
	movq	%r9, 16(%rax)
	movq	136(%rbp), %r9
	movq	%r9, 24(%rax)
	movq	144(%rbp), %r9
	movq	%r9, 32(%rax)
	movl	152(%rbp), %r9d
	movl	%r9d, 40(%rax)
	movl	%r8d, -608(%rbp)
	movss	-608(%rbp), %xmm0
	call	alloc_lookups_and_criticalities@PLT
	addq	$176, %rsp
	.loc 1 355 0
	movq	-560(%rbp), %rax
	movq	%rax, -136(%rbp)
.L3:
	.loc 1 396 0
	movl	36(%rbp), %eax
	movl	%eax, -148(%rbp)
	.loc 1 397 0
	movl	40(%rbp), %eax
	testl	%eax, %eax
	jne	.L4
	.loc 1 398 0
	movl	$0, -100(%rbp)
	jmp	.L5
.L4:
	.loc 1 400 0
	movl	$1, -100(%rbp)
.L5:
	.loc 1 402 0
	movl	-148(%rbp), %edx
	subq	$48, %rsp
	movq	%rsp, %rax
	movq	112(%rbp), %rcx
	movq	%rcx, (%rax)
	movq	120(%rbp), %rcx
	movq	%rcx, 8(%rax)
	movq	128(%rbp), %rcx
	movq	%rcx, 16(%rax)
	movq	136(%rbp), %rcx
	movq	%rcx, 24(%rax)
	movq	144(%rbp), %rcx
	movq	%rcx, 32(%rax)
	movl	152(%rbp), %ecx
	movl	%ecx, 40(%rax)
	movl	%edx, %edi
	call	init_chan@PLT
	addq	$48, %rsp
	.loc 1 404 0
	movl	32(%rbp), %esi
	movl	60(%rbp), %eax
	movl	28(%rbp), %edx
	movl	%edx, %edi
	leaq	-232(%rbp), %rcx
	leaq	-224(%rbp), %rdx
	subq	$8, %rsp
	pushq	80(%rbp)
	pushq	72(%rbp)
	pushq	64(%rbp)
	pushq	56(%rbp)
	pushq	48(%rbp)
	pushq	40(%rbp)
	pushq	32(%rbp)
	pushq	24(%rbp)
	pushq	16(%rbp)
	movl	%esi, -608(%rbp)
	movss	-608(%rbp), %xmm0
	movl	%eax, %esi
	call	alloc_and_load_placement_structs
	addq	$80, %rsp
	.loc 1 410 0
	movq	48(%rbp), %rdx
	movl	40(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	initial_placement
	.loc 1 411 0
	pxor	%xmm0, %xmm0
	cvtsi2ss	-148(%rbp), %xmm0
	call	init_draw_coords@PLT
	.loc 1 418 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	je	.L6
	.loc 1 419 0 discriminator 1
	movl	16(%rbp), %eax
	.loc 1 418 0 discriminator 1
	cmpl	$2, %eax
	jne	.L7
.L6:
	.loc 1 421 0
	movl	60(%rbp), %eax
	movl	28(%rbp), %edx
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	%ecx, %esi
	movl	$0, %edi
	call	comp_bb_cost
	movd	%xmm0, %eax
	movl	%eax, -204(%rbp)
	.loc 1 424 0
	movss	76(%rbp), %xmm0
	movss	%xmm0, -128(%rbp)
	.loc 1 426 0
	call	compute_net_pin_index_values
	.loc 1 428 0
	call	count_connections
	movl	%eax, -104(%rbp)
	.loc 1 429 0
	movl	-104(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 433 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L8
	.loc 1 435 0
	movl	$0, -108(%rbp)
	jmp	.L9
.L12:
	.loc 1 436 0
	movl	$1, -112(%rbp)
	jmp	.L10
.L11:
	.loc 1 437 0 discriminator 3
	movq	timing_place_crit(%rip), %rax
	movl	-108(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-112(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	.loc 1 436 0 discriminator 3
	addl	$1, -112(%rbp)
.L10:
	.loc 1 436 0 is_stmt 0 discriminator 1
	movq	net(%rip), %rcx
	movl	-108(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cmpl	-112(%rbp), %eax
	jge	.L11
	.loc 1 435 0 is_stmt 1 discriminator 2
	addl	$1, -108(%rbp)
.L9:
	.loc 1 435 0 is_stmt 0 discriminator 1
	movl	num_nets(%rip), %eax
	cmpl	%eax, -108(%rbp)
	jl	.L12
	.loc 1 439 0 is_stmt 1
	leaq	-212(%rbp), %rdx
	leaq	-200(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	comp_td_costs
	.loc 1 442 0
	movss	-212(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ss	-104(%rbp), %xmm0
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, -44(%rbp)
	.loc 1 443 0
	movq	-560(%rbp), %rax
	movl	-44(%rbp), %edx
	movl	%edx, -608(%rbp)
	movss	-608(%rbp), %xmm0
	movq	%rax, %rdi
	call	load_constant_net_delay@PLT
	jmp	.L13
.L8:
	.loc 1 447 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -44(%rbp)
.L13:
	.loc 1 450 0
	movl	16(%rbp), %eax
	cmpl	$2, %eax
	jne	.L14
	.loc 1 452 0
	movq	point_to_point_delay_cost(%rip), %rax
	movq	%rax, -560(%rbp)
.L14:
	.loc 1 460 0
	movq	-560(%rbp), %rax
	movq	%rax, %rdi
	call	load_timing_graph_net_delays@PLT
	.loc 1 461 0
	movq	-552(%rbp), %rax
	pxor	%xmm0, %xmm0
	movq	%rax, %rdi
	call	load_net_slack@PLT
	movd	%xmm0, %eax
	movl	%eax, -40(%rbp)
	.loc 1 462 0
	movq	-552(%rbp), %rax
	movss	-128(%rbp), %xmm0
	movl	-40(%rbp), %edx
	subq	$8, %rsp
	pushq	80(%rbp)
	pushq	72(%rbp)
	pushq	64(%rbp)
	pushq	56(%rbp)
	pushq	48(%rbp)
	pushq	40(%rbp)
	pushq	32(%rbp)
	pushq	24(%rbp)
	pushq	16(%rbp)
	movaps	%xmm0, %xmm1
	movl	%edx, -608(%rbp)
	movss	-608(%rbp), %xmm0
	movq	%rax, %rdi
	call	load_criticalities@PLT
	addq	$80, %rsp
	.loc 1 463 0
	movl	$1, -116(%rbp)
	.loc 1 466 0
	leaq	-212(%rbp), %rdx
	leaq	-200(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	comp_td_costs
	.loc 1 468 0
	movss	-200(%rbp), %xmm1
	movss	.LC2(%rip), %xmm0
	divss	%xmm1, %xmm0
	movss	%xmm0, -52(%rbp)
	.loc 1 469 0
	movss	-204(%rbp), %xmm1
	movss	.LC2(%rip), %xmm0
	divss	%xmm1, %xmm0
	movss	%xmm0, -48(%rbp)
	.loc 1 470 0
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, -196(%rbp)
	jmp	.L15
.L7:
	.loc 1 476 0
	movl	60(%rbp), %eax
	movl	28(%rbp), %edx
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	%ecx, %esi
	movl	$0, %edi
	call	comp_bb_cost
	movd	%xmm0, %eax
	movl	%eax, -204(%rbp)
	movss	-204(%rbp), %xmm0
	movss	%xmm0, -196(%rbp)
	.loc 1 478 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -200(%rbp)
	.loc 1 479 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -212(%rbp)
	.loc 1 480 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -44(%rbp)
	.loc 1 481 0
	movl	$0, -116(%rbp)
	.loc 1 482 0
	movl	$0, -104(%rbp)
	.loc 1 483 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -40(%rbp)
	.loc 1 484 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -128(%rbp)
	.loc 1 486 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -52(%rbp)
	.loc 1 487 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -48(%rbp)
.L15:
	.loc 1 490 0
	movss	92(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm6
	movsd	%xmm6, -608(%rbp)
	movl	num_blocks(%rip), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC3(%rip), %xmm1
	call	pow@PLT
	mulsd	-608(%rbp), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, -32(%rbp)
	.loc 1 492 0
	movl	72(%rbp), %eax
	testl	%eax, %eax
	je	.L16
	.loc 1 493 0
	pxor	%xmm0, %xmm0
	cvtsi2ss	-32(%rbp), %xmm0
	.loc 1 494 0
	movl	72(%rbp), %eax
	pxor	%xmm1, %xmm1
	cvtsi2ss	%eax, %xmm1
	.loc 1 493 0
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	.LC4(%rip), %xmm1
	addsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, -124(%rbp)
	jmp	.L17
.L16:
	.loc 1 497 0
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -124(%rbp)
.L17:
	.loc 1 505 0
	cmpl	$0, -32(%rbp)
	jg	.L18
	.loc 1 506 0
	movl	$1, -32(%rbp)
.L18:
	.loc 1 508 0
	movl	nx(%rip), %edx
	movl	ny(%rip), %eax
	cmpl	%eax, %edx
	jle	.L19
	.loc 1 508 0 is_stmt 0 discriminator 1
	movl	nx(%rip), %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	jmp	.L20
.L19:
	.loc 1 508 0 discriminator 2
	movl	ny(%rip), %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
.L20:
	.loc 1 508 0 discriminator 4
	movss	%xmm0, -192(%rbp)
	.loc 1 510 0 is_stmt 1 discriminator 4
	movss	-192(%rbp), %xmm0
	movss	%xmm0, -152(%rbp)
	.loc 1 511 0 discriminator 4
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, -156(%rbp)
	.loc 1 512 0 discriminator 4
	movss	-152(%rbp), %xmm0
	subss	-156(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, -160(%rbp)
	.loc 1 514 0 discriminator 4
	movss	20(%rbp), %xmm0
	movl	16(%rbp), %eax
	movl	-192(%rbp), %ecx
	movl	60(%rbp), %r8d
	movq	-232(%rbp), %r11
	movq	-224(%rbp), %r10
	.loc 1 515 0 discriminator 4
	movl	28(%rbp), %edx
	.loc 1 514 0 discriminator 4
	movl	%edx, %ebx
	movss	-52(%rbp), %xmm2
	movss	-48(%rbp), %xmm1
	leaq	-200(%rbp), %rdx
	leaq	-204(%rbp), %rsi
	leaq	-196(%rbp), %rdi
	leaq	-212(%rbp), %r9
	pushq	%r9
	pushq	%rax
	movl	-32(%rbp), %eax
	pushq	%rax
	subq	$24, %rsp
	movq	%rsp, %rax
	movq	88(%rbp), %r9
	movq	%r9, (%rax)
	movq	96(%rbp), %r9
	movq	%r9, 8(%rax)
	movl	104(%rbp), %r9d
	movl	%r9d, 16(%rax)
	movl	-100(%rbp), %eax
	pushq	%rax
	pushq	%r8
	movaps	%xmm2, %xmm3
	movaps	%xmm1, %xmm2
	movaps	%xmm0, %xmm1
	movl	%ecx, -608(%rbp)
	movss	-608(%rbp), %xmm0
	movq	%r11, %r9
	movq	%r10, %r8
	movl	%ebx, %ecx
	call	starting_t
	addq	$64, %rsp
	movd	%xmm0, %eax
	movl	%eax, -188(%rbp)
	.loc 1 521 0 discriminator 4
	movl	$0, -20(%rbp)
	.loc 1 522 0 discriminator 4
	movl	$0, -36(%rbp)
	.loc 1 523 0 discriminator 4
	movss	-212(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm3
	movss	-200(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm2
	movss	-204(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movss	-196(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC5(%rip), %rdi
	movl	$4, %eax
	call	printf@PLT
	.loc 1 528 0 discriminator 4
	leaq	.LC12(%rip), %rax
	pushq	%rax
	leaq	.LC13(%rip), %rax
	pushq	%rax
	leaq	.LC14(%rip), %rax
	pushq	%rax
	leaq	.LC15(%rip), %rax
	pushq	%rax
	leaq	.LC16(%rip), %rax
	pushq	%rax
	leaq	.LC17(%rip), %rax
	pushq	%rax
	leaq	.LC18(%rip), %rax
	pushq	%rax
	leaq	.LC19(%rip), %rax
	pushq	%rax
	leaq	.LC6(%rip), %r9
	leaq	.LC7(%rip), %r8
	leaq	.LC8(%rip), %rcx
	leaq	.LC9(%rip), %rdx
	leaq	.LC10(%rip), %rsi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$64, %rsp
	.loc 1 533 0 discriminator 4
	leaq	.LC24(%rip), %rax
	pushq	%rax
	leaq	.LC22(%rip), %rax
	pushq	%rax
	leaq	.LC25(%rip), %rax
	pushq	%rax
	leaq	.LC25(%rip), %rax
	pushq	%rax
	leaq	.LC25(%rip), %rax
	pushq	%rax
	leaq	.LC25(%rip), %rax
	pushq	%rax
	leaq	.LC24(%rip), %rax
	pushq	%rax
	leaq	.LC22(%rip), %rax
	pushq	%rax
	leaq	.LC20(%rip), %r9
	leaq	.LC21(%rip), %r8
	leaq	.LC21(%rip), %rcx
	leaq	.LC22(%rip), %rdx
	leaq	.LC23(%rip), %rsi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$64, %rsp
	.loc 1 540 0 discriminator 4
	cvtss2sd	-40(%rbp), %xmm4
	movss	-212(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm3
	movss	-200(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm2
	movss	-204(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movss	-196(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	-148(%rbp), %edx
	leaq	-544(%rbp), %rax
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rdi
	movl	$5, %eax
	call	sprintf@PLT
	.loc 1 544 0 discriminator 4
	leaq	-544(%rbp), %rax
	movl	$0, %ecx
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$1, %edi
	call	update_screen@PLT
	.loc 1 546 0 discriminator 4
	jmp	.L21
.L49:
	.loc 1 549 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	je	.L22
	.loc 1 550 0 discriminator 1
	movl	16(%rbp), %eax
	.loc 1 549 0 discriminator 1
	cmpl	$2, %eax
	jne	.L23
.L22:
	.loc 1 552 0
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, -196(%rbp)
.L23:
	.loc 1 555 0
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -64(%rbp)
	.loc 1 556 0
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -72(%rbp)
	.loc 1 557 0
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -88(%rbp)
	.loc 1 558 0
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -80(%rbp)
	.loc 1 559 0
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -96(%rbp)
	.loc 1 560 0
	movl	$0, -28(%rbp)
	.loc 1 562 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	je	.L24
	.loc 1 563 0 discriminator 1
	movl	16(%rbp), %eax
	.loc 1 562 0 discriminator 1
	cmpl	$2, %eax
	jne	.L25
.L24:
	.loc 1 567 0
	movl	64(%rbp), %eax
	.loc 1 566 0
	cmpl	-116(%rbp), %eax
	jle	.L26
	.loc 1 568 0
	movl	72(%rbp), %eax
	testl	%eax, %eax
	je	.L27
.L26:
	.loc 1 573 0
	movss	-212(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ss	-104(%rbp), %xmm0
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, -44(%rbp)
	.loc 1 575 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L28
	.loc 1 577 0
	movq	-560(%rbp), %rax
	movl	-44(%rbp), %edx
	movl	%edx, -608(%rbp)
	movss	-608(%rbp), %xmm0
	movq	%rax, %rdi
	call	load_constant_net_delay@PLT
.L28:
	.loc 1 582 0
	movq	-560(%rbp), %rax
	movq	%rax, %rdi
	call	load_timing_graph_net_delays@PLT
	.loc 1 583 0
	movq	-552(%rbp), %rax
	pxor	%xmm0, %xmm0
	movq	%rax, %rdi
	call	load_net_slack@PLT
	movd	%xmm0, %eax
	movl	%eax, -40(%rbp)
	.loc 1 584 0
	movq	-552(%rbp), %rax
	movss	-128(%rbp), %xmm0
	movl	-40(%rbp), %edx
	subq	$8, %rsp
	pushq	80(%rbp)
	pushq	72(%rbp)
	pushq	64(%rbp)
	pushq	56(%rbp)
	pushq	48(%rbp)
	pushq	40(%rbp)
	pushq	32(%rbp)
	pushq	24(%rbp)
	pushq	16(%rbp)
	movaps	%xmm0, %xmm1
	movl	%edx, -608(%rbp)
	movss	-608(%rbp), %xmm0
	movq	%rax, %rdi
	call	load_criticalities@PLT
	addq	$80, %rsp
	.loc 1 587 0
	leaq	-212(%rbp), %rdx
	leaq	-200(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	comp_td_costs
	.loc 1 588 0
	movl	$0, -116(%rbp)
.L27:
	.loc 1 590 0
	addl	$1, -116(%rbp)
	.loc 1 594 0
	movss	-204(%rbp), %xmm1
	movss	.LC2(%rip), %xmm0
	divss	%xmm1, %xmm0
	movss	%xmm0, -48(%rbp)
	.loc 1 595 0
	movss	-200(%rbp), %xmm1
	movss	.LC2(%rip), %xmm0
	divss	%xmm1, %xmm0
	movss	%xmm0, -52(%rbp)
.L25:
	.loc 1 598 0
	movl	$1, -120(%rbp)
	.loc 1 600 0
	movl	$0, -24(%rbp)
	jmp	.L29
.L35:
	.loc 1 602 0
	movss	20(%rbp), %xmm1
	movl	16(%rbp), %r8d
	movl	60(%rbp), %ecx
	movq	-232(%rbp), %r11
	movq	-224(%rbp), %r10
	.loc 1 603 0
	movl	28(%rbp), %eax
	.loc 1 602 0
	movl	%eax, %ebx
	movss	-192(%rbp), %xmm0
	movl	-188(%rbp), %eax
	movss	-52(%rbp), %xmm3
	movss	-48(%rbp), %xmm2
	leaq	-200(%rbp), %rdx
	leaq	-204(%rbp), %rsi
	leaq	-196(%rbp), %rdi
	subq	$8, %rsp
	pushq	-144(%rbp)
	leaq	-212(%rbp), %r9
	pushq	%r9
	pushq	%r8
	movl	-100(%rbp), %r8d
	pushq	%r8
	pushq	%rcx
	movaps	%xmm3, %xmm4
	movaps	%xmm2, %xmm3
	movaps	%xmm1, %xmm2
	movq	%r11, %r9
	movq	%r10, %r8
	movl	%ebx, %ecx
	movaps	%xmm0, %xmm1
	movl	%eax, -608(%rbp)
	movss	-608(%rbp), %xmm0
	call	try_swap
	addq	$48, %rsp
	cmpl	$1, %eax
	jne	.L30
	.loc 1 612 0
	addl	$1, -28(%rbp)
	.loc 1 613 0
	movss	-196(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	-64(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	.loc 1 614 0
	movss	-204(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	-72(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -72(%rbp)
	.loc 1 615 0
	movss	-200(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	-80(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -80(%rbp)
	.loc 1 616 0
	movss	-212(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	-88(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
	.loc 1 617 0
	movss	-196(%rbp), %xmm1
	movss	-196(%rbp), %xmm0
	mulss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	-96(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
.L30:
	.loc 1 620 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	je	.L31
	.loc 1 621 0
	movl	16(%rbp), %eax
	cmpl	$2, %eax
	jne	.L32
.L31:
	.loc 1 625 0
	movl	-120(%rbp), %eax
	cmpl	-124(%rbp), %eax
	jl	.L33
	.loc 1 626 0
	movl	-32(%rbp), %eax
	subl	$1, %eax
	cmpl	-24(%rbp), %eax
	je	.L33
	.loc 1 629 0
	movl	$0, -120(%rbp)
	.loc 1 634 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L34
	.loc 1 638 0
	movss	-212(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ss	-104(%rbp), %xmm0
	.loc 1 637 0
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, -44(%rbp)
	.loc 1 639 0
	movq	-560(%rbp), %rax
	movl	-44(%rbp), %edx
	movl	%edx, -608(%rbp)
	movss	-608(%rbp), %xmm0
	movq	%rax, %rdi
	call	load_constant_net_delay@PLT
.L34:
	.loc 1 643 0
	movq	-560(%rbp), %rax
	movq	%rax, %rdi
	call	load_timing_graph_net_delays@PLT
	.loc 1 644 0
	movq	-552(%rbp), %rax
	pxor	%xmm0, %xmm0
	movq	%rax, %rdi
	call	load_net_slack@PLT
	movd	%xmm0, %eax
	movl	%eax, -40(%rbp)
	.loc 1 645 0
	movq	-552(%rbp), %rax
	movss	-128(%rbp), %xmm0
	movl	-40(%rbp), %edx
	subq	$8, %rsp
	pushq	80(%rbp)
	pushq	72(%rbp)
	pushq	64(%rbp)
	pushq	56(%rbp)
	pushq	48(%rbp)
	pushq	40(%rbp)
	pushq	32(%rbp)
	pushq	24(%rbp)
	pushq	16(%rbp)
	movaps	%xmm0, %xmm1
	movl	%edx, -608(%rbp)
	movss	-608(%rbp), %xmm0
	movq	%rax, %rdi
	call	load_criticalities@PLT
	addq	$80, %rsp
	.loc 1 647 0
	leaq	-212(%rbp), %rdx
	leaq	-200(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	comp_td_costs
.L33:
	.loc 1 649 0
	addl	$1, -120(%rbp)
.L32:
	.loc 1 600 0 discriminator 2
	addl	$1, -24(%rbp)
.L29:
	.loc 1 600 0 is_stmt 0 discriminator 1
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L35
	.loc 1 669 0 is_stmt 1
	movl	-32(%rbp), %eax
	addl	%eax, -36(%rbp)
	.loc 1 670 0
	cmpl	$50000, -36(%rbp)
	jle	.L36
	.loc 1 673 0
	movl	60(%rbp), %eax
	movl	28(%rbp), %edx
	.loc 1 672 0
	movl	%eax, %esi
	movl	%edx, %edi
	call	recompute_bb_cost
	movd	%xmm0, %eax
	movl	%eax, -164(%rbp)
	.loc 1 675 0
	movss	-204(%rbp), %xmm1
	movss	-164(%rbp), %xmm0
	subss	%xmm1, %xmm0
	movss	.LC28(%rip), %xmm1
	andps	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movss	-204(%rbp), %xmm1
	cvtss2sd	%xmm1, %xmm1
	movsd	.LC29(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	ucomisd	%xmm1, %xmm0
	jbe	.L81
	.loc 1 677 0
	movss	-204(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	cvtss2sd	-164(%rbp), %xmm0
	leaq	.LC30(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	.loc 1 680 0
	movl	$1, %edi
	call	exit@PLT
.L81:
	.loc 1 682 0
	movss	-164(%rbp), %xmm0
	movss	%xmm0, -204(%rbp)
	.loc 1 684 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	je	.L39
	.loc 1 685 0
	movl	16(%rbp), %eax
	cmpl	$2, %eax
	jne	.L40
.L39:
	.loc 1 688 0
	leaq	-216(%rbp), %rdx
	leaq	-208(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	comp_td_costs
	.loc 1 689 0
	movss	-208(%rbp), %xmm0
	movss	-200(%rbp), %xmm1
	subss	%xmm1, %xmm0
	movss	.LC28(%rip), %xmm1
	andps	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	.loc 1 690 0
	movss	-200(%rbp), %xmm1
	cvtss2sd	%xmm1, %xmm1
	movsd	.LC29(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	.loc 1 689 0
	ucomisd	%xmm1, %xmm0
	jbe	.L82
	.loc 1 692 0
	movss	-200(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movss	-208(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC31(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	.loc 1 695 0
	movl	$1, %edi
	call	exit@PLT
.L82:
	.loc 1 697 0
	movss	-216(%rbp), %xmm0
	movss	-212(%rbp), %xmm1
	subss	%xmm1, %xmm0
	movss	.LC28(%rip), %xmm1
	andps	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	.loc 1 698 0
	movss	-212(%rbp), %xmm1
	cvtss2sd	%xmm1, %xmm1
	movsd	.LC29(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	.loc 1 697 0
	ucomisd	%xmm1, %xmm0
	jbe	.L83
	.loc 1 700 0
	movss	-212(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movss	-216(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC32(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	.loc 1 703 0
	movl	$1, %edi
	call	exit@PLT
.L83:
	.loc 1 705 0
	movss	-208(%rbp), %xmm0
	movss	%xmm0, -200(%rbp)
.L40:
	.loc 1 708 0
	movl	16(%rbp), %eax
	testl	%eax, %eax
	jne	.L45
	.loc 1 710 0
	movss	-164(%rbp), %xmm0
	movss	%xmm0, -196(%rbp)
.L45:
	.loc 1 712 0
	movl	$0, -36(%rbp)
.L36:
	.loc 1 715 0
	movl	-32(%rbp), %eax
	addl	%eax, -20(%rbp)
	.loc 1 716 0
	pxor	%xmm0, %xmm0
	cvtsi2ss	-28(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ss	-32(%rbp), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -168(%rbp)
	.loc 1 717 0
	cmpl	$0, -28(%rbp)
	jne	.L46
	.loc 1 719 0
	movss	-196(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm7
	movsd	%xmm7, -64(%rbp)
	.loc 1 720 0
	movss	-204(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm7
	movsd	%xmm7, -72(%rbp)
	.loc 1 721 0
	movss	-200(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm5
	movsd	%xmm5, -80(%rbp)
	.loc 1 722 0
	movss	-212(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm6
	movsd	%xmm6, -88(%rbp)
	jmp	.L47
.L46:
	.loc 1 726 0
	pxor	%xmm0, %xmm0
	cvtsi2sd	-28(%rbp), %xmm0
	movsd	-64(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	.loc 1 727 0
	pxor	%xmm0, %xmm0
	cvtsi2sd	-28(%rbp), %xmm0
	movsd	-72(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -72(%rbp)
	.loc 1 728 0
	pxor	%xmm0, %xmm0
	cvtsi2sd	-28(%rbp), %xmm0
	movsd	-80(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -80(%rbp)
	.loc 1 729 0
	pxor	%xmm0, %xmm0
	cvtsi2sd	-28(%rbp), %xmm0
	movsd	-88(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
.L47:
	.loc 1 731 0
	movsd	-64(%rbp), %xmm0
	movq	-96(%rbp), %rdx
	movl	-28(%rbp), %eax
	movapd	%xmm0, %xmm1
	movq	%rdx, -608(%rbp)
	movsd	-608(%rbp), %xmm0
	movl	%eax, %edi
	call	get_std_dev
	movq	%xmm0, %rax
	movq	%rax, -176(%rbp)
	.loc 1 734 0
	cvtss2sd	-128(%rbp), %xmm2
	movss	-192(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	cvtss2sd	-168(%rbp), %xmm5
	cvtss2sd	-40(%rbp), %xmm4
	cvtss2sd	-44(%rbp), %xmm3
	movss	-188(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	-20(%rbp), %eax
	movsd	-88(%rbp), %xmm11
	movsd	-80(%rbp), %xmm10
	movsd	-72(%rbp), %xmm9
	movsd	-64(%rbp), %xmm8
	subq	$8, %rsp
	leaq	-8(%rsp), %rsp
	movsd	%xmm2, (%rsp)
	leaq	-8(%rsp), %rsp
	movsd	%xmm1, (%rsp)
	pushq	-176(%rbp)
	movl	%eax, %esi
	movapd	%xmm5, %xmm7
	movapd	%xmm4, %xmm6
	movapd	%xmm3, %xmm5
	movapd	%xmm11, %xmm4
	movapd	%xmm10, %xmm3
	movapd	%xmm9, %xmm2
	movapd	%xmm8, %xmm1
	leaq	.LC33(%rip), %rdi
	movl	$8, %eax
	call	printf@PLT
	addq	$32, %rsp
	.loc 1 741 0
	movss	-188(%rbp), %xmm0
	movss	%xmm0, -180(%rbp)
	.loc 1 742 0
	movss	-192(%rbp), %xmm1
	cvtsd2ss	-176(%rbp), %xmm0
	movss	-168(%rbp), %xmm2
	leaq	-188(%rbp), %rdx
	subq	$8, %rsp
	subq	$24, %rsp
	movq	%rsp, %rax
	movq	88(%rbp), %rcx
	movq	%rcx, (%rax)
	movq	96(%rbp), %rcx
	movq	%rcx, 8(%rax)
	movl	104(%rbp), %ecx
	movl	%ecx, 16(%rax)
	movq	%rdx, %rdi
	call	update_t
	addq	$32, %rsp
	.loc 1 745 0
	movss	-188(%rbp), %xmm0
	divss	-180(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC34(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	.loc 1 748 0
	cvtss2sd	-40(%rbp), %xmm4
	movss	-188(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm3
	movss	-200(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm2
	movss	-204(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movss	-196(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	-544(%rbp), %rax
	leaq	.LC35(%rip), %rsi
	movq	%rax, %rdi
	movl	$5, %eax
	call	sprintf@PLT
	.loc 1 751 0
	leaq	-544(%rbp), %rax
	movl	$0, %ecx
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	update_screen@PLT
	.loc 1 752 0
	movl	-168(%rbp), %edx
	leaq	-192(%rbp), %rax
	movl	%edx, -608(%rbp)
	movss	-608(%rbp), %xmm0
	movq	%rax, %rdi
	call	update_rlim
	.loc 1 754 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	je	.L48
	.loc 1 755 0 discriminator 1
	movl	16(%rbp), %eax
	.loc 1 754 0 discriminator 1
	cmpl	$2, %eax
	jne	.L21
.L48:
	.loc 1 759 0
	movss	-192(%rbp), %xmm0
	subss	-156(%rbp), %xmm0
	.loc 1 760 0
	mulss	-160(%rbp), %xmm0
	.loc 1 758 0
	movss	.LC2(%rip), %xmm1
	subss	%xmm0, %xmm1
	.loc 1 761 0
	movss	84(%rbp), %xmm0
	.loc 1 762 0
	movss	76(%rbp), %xmm2
	.loc 1 761 0
	subss	%xmm2, %xmm0
	.loc 1 760 0
	mulss	%xmm1, %xmm0
	.loc 1 763 0
	movss	76(%rbp), %xmm1
	.loc 1 757 0
	addss	%xmm1, %xmm0
	movss	%xmm0, -128(%rbp)
.L21:
	.loc 1 546 0
	movss	-196(%rbp), %xmm0
	movl	-188(%rbp), %edx
	subq	$8, %rsp
	subq	$24, %rsp
	movq	%rsp, %rax
	movq	88(%rbp), %rcx
	movq	%rcx, (%rax)
	movq	96(%rbp), %rcx
	movq	%rcx, 8(%rax)
	movl	104(%rbp), %ecx
	movl	%ecx, 16(%rax)
	movaps	%xmm0, %xmm1
	movl	%edx, -608(%rbp)
	movss	-608(%rbp), %xmm0
	call	exit_crit
	addq	$32, %rsp
	testl	%eax, %eax
	je	.L49
	.loc 1 770 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -188(%rbp)
	.loc 1 771 0
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -64(%rbp)
	.loc 1 772 0
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -72(%rbp)
	.loc 1 773 0
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -80(%rbp)
	.loc 1 774 0
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -96(%rbp)
	.loc 1 775 0
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -88(%rbp)
	.loc 1 776 0
	movl	$0, -28(%rbp)
	.loc 1 778 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	je	.L50
	.loc 1 779 0 discriminator 1
	movl	16(%rbp), %eax
	.loc 1 778 0 discriminator 1
	cmpl	$2, %eax
	jne	.L51
.L50:
	.loc 1 783 0
	movl	64(%rbp), %eax
	cmpl	-116(%rbp), %eax
	jle	.L52
	.loc 1 784 0 discriminator 1
	movl	72(%rbp), %eax
	.loc 1 783 0 discriminator 1
	testl	%eax, %eax
	je	.L53
.L52:
	.loc 1 790 0
	movss	-212(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ss	-104(%rbp), %xmm0
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, -44(%rbp)
	.loc 1 792 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L54
	.loc 1 793 0
	movq	-560(%rbp), %rax
	movl	-44(%rbp), %edx
	movl	%edx, -608(%rbp)
	movss	-608(%rbp), %xmm0
	movq	%rax, %rdi
	call	load_constant_net_delay@PLT
.L54:
	.loc 1 795 0
	movq	-560(%rbp), %rax
	movq	%rax, %rdi
	call	load_timing_graph_net_delays@PLT
	.loc 1 796 0
	movq	-552(%rbp), %rax
	pxor	%xmm0, %xmm0
	movq	%rax, %rdi
	call	load_net_slack@PLT
	movd	%xmm0, %eax
	movl	%eax, -40(%rbp)
	.loc 1 797 0
	movq	-552(%rbp), %rax
	movss	-128(%rbp), %xmm0
	movl	-40(%rbp), %edx
	subq	$8, %rsp
	pushq	80(%rbp)
	pushq	72(%rbp)
	pushq	64(%rbp)
	pushq	56(%rbp)
	pushq	48(%rbp)
	pushq	40(%rbp)
	pushq	32(%rbp)
	pushq	24(%rbp)
	pushq	16(%rbp)
	movaps	%xmm0, %xmm1
	movl	%edx, -608(%rbp)
	movss	-608(%rbp), %xmm0
	movq	%rax, %rdi
	call	load_criticalities@PLT
	addq	$80, %rsp
	.loc 1 800 0
	leaq	-212(%rbp), %rdx
	leaq	-200(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	comp_td_costs
	.loc 1 801 0
	movl	$0, -116(%rbp)
.L53:
	.loc 1 803 0
	addl	$1, -116(%rbp)
	.loc 1 805 0
	movss	-204(%rbp), %xmm1
	movss	.LC2(%rip), %xmm0
	divss	%xmm1, %xmm0
	movss	%xmm0, -48(%rbp)
	.loc 1 806 0
	movss	-200(%rbp), %xmm1
	movss	.LC2(%rip), %xmm0
	divss	%xmm1, %xmm0
	movss	%xmm0, -52(%rbp)
.L51:
	.loc 1 809 0
	movl	$1, -120(%rbp)
	.loc 1 811 0
	movl	$0, -24(%rbp)
	jmp	.L55
.L60:
	.loc 1 813 0
	movss	20(%rbp), %xmm1
	movl	16(%rbp), %r8d
	movl	60(%rbp), %ecx
	movq	-232(%rbp), %r11
	movq	-224(%rbp), %r10
	.loc 1 814 0
	movl	28(%rbp), %eax
	.loc 1 813 0
	movl	%eax, %ebx
	movss	-192(%rbp), %xmm0
	movl	-188(%rbp), %eax
	movss	-52(%rbp), %xmm3
	movss	-48(%rbp), %xmm2
	leaq	-200(%rbp), %rdx
	leaq	-204(%rbp), %rsi
	leaq	-196(%rbp), %rdi
	subq	$8, %rsp
	pushq	-144(%rbp)
	leaq	-212(%rbp), %r9
	pushq	%r9
	pushq	%r8
	movl	-100(%rbp), %r8d
	pushq	%r8
	pushq	%rcx
	movaps	%xmm3, %xmm4
	movaps	%xmm2, %xmm3
	movaps	%xmm1, %xmm2
	movq	%r11, %r9
	movq	%r10, %r8
	movl	%ebx, %ecx
	movaps	%xmm0, %xmm1
	movl	%eax, -608(%rbp)
	movss	-608(%rbp), %xmm0
	call	try_swap
	addq	$48, %rsp
	cmpl	$1, %eax
	jne	.L56
	.loc 1 821 0
	addl	$1, -28(%rbp)
	.loc 1 822 0
	movss	-196(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	-64(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	.loc 1 823 0
	movss	-204(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	-72(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -72(%rbp)
	.loc 1 824 0
	movss	-212(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	-88(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
	.loc 1 825 0
	movss	-200(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	-80(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -80(%rbp)
	.loc 1 826 0
	movss	-196(%rbp), %xmm1
	movss	-196(%rbp), %xmm0
	mulss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	-96(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
	.loc 1 828 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	je	.L57
	.loc 1 829 0
	movl	16(%rbp), %eax
	cmpl	$2, %eax
	jne	.L56
.L57:
	.loc 1 833 0
	movl	-120(%rbp), %eax
	cmpl	-124(%rbp), %eax
	jl	.L58
	.loc 1 834 0
	movl	-32(%rbp), %eax
	subl	$1, %eax
	cmpl	-24(%rbp), %eax
	je	.L58
	.loc 1 837 0
	movl	$0, -120(%rbp)
	.loc 1 842 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L59
	.loc 1 846 0
	movss	-212(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ss	-104(%rbp), %xmm0
	.loc 1 845 0
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, -44(%rbp)
	.loc 1 847 0
	movq	-560(%rbp), %rax
	movl	-44(%rbp), %edx
	movl	%edx, -608(%rbp)
	movss	-608(%rbp), %xmm0
	movq	%rax, %rdi
	call	load_constant_net_delay@PLT
.L59:
	.loc 1 851 0
	movq	-560(%rbp), %rax
	movq	%rax, %rdi
	call	load_timing_graph_net_delays@PLT
	.loc 1 852 0
	movq	-552(%rbp), %rax
	pxor	%xmm0, %xmm0
	movq	%rax, %rdi
	call	load_net_slack@PLT
	movd	%xmm0, %eax
	movl	%eax, -40(%rbp)
	.loc 1 853 0
	movq	-552(%rbp), %rax
	movss	-128(%rbp), %xmm0
	movl	-40(%rbp), %edx
	subq	$8, %rsp
	pushq	80(%rbp)
	pushq	72(%rbp)
	pushq	64(%rbp)
	pushq	56(%rbp)
	pushq	48(%rbp)
	pushq	40(%rbp)
	pushq	32(%rbp)
	pushq	24(%rbp)
	pushq	16(%rbp)
	movaps	%xmm0, %xmm1
	movl	%edx, -608(%rbp)
	movss	-608(%rbp), %xmm0
	movq	%rax, %rdi
	call	load_criticalities@PLT
	addq	$80, %rsp
	.loc 1 855 0
	leaq	-212(%rbp), %rdx
	leaq	-200(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	comp_td_costs
.L58:
	.loc 1 857 0
	addl	$1, -120(%rbp)
.L56:
	.loc 1 811 0 discriminator 2
	addl	$1, -24(%rbp)
.L55:
	.loc 1 811 0 is_stmt 0 discriminator 1
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L60
	.loc 1 864 0 is_stmt 1
	movl	-32(%rbp), %eax
	addl	%eax, -20(%rbp)
	.loc 1 865 0
	pxor	%xmm0, %xmm0
	cvtsi2ss	-28(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ss	-32(%rbp), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -168(%rbp)
	.loc 1 866 0
	cmpl	$0, -28(%rbp)
	jne	.L61
	.loc 1 868 0
	movss	-196(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm7
	movsd	%xmm7, -64(%rbp)
	.loc 1 869 0
	movss	-204(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm5
	movsd	%xmm5, -72(%rbp)
	.loc 1 870 0
	movss	-212(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm6
	movsd	%xmm6, -88(%rbp)
	.loc 1 871 0
	movss	-200(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm7
	movsd	%xmm7, -80(%rbp)
	jmp	.L62
.L61:
	.loc 1 875 0
	pxor	%xmm0, %xmm0
	cvtsi2sd	-28(%rbp), %xmm0
	movsd	-64(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	.loc 1 876 0
	pxor	%xmm0, %xmm0
	cvtsi2sd	-28(%rbp), %xmm0
	movsd	-72(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -72(%rbp)
	.loc 1 877 0
	pxor	%xmm0, %xmm0
	cvtsi2sd	-28(%rbp), %xmm0
	movsd	-88(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
	.loc 1 878 0
	pxor	%xmm0, %xmm0
	cvtsi2sd	-28(%rbp), %xmm0
	movsd	-80(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -80(%rbp)
.L62:
	.loc 1 881 0
	movsd	-64(%rbp), %xmm0
	movq	-96(%rbp), %rdx
	movl	-28(%rbp), %eax
	movapd	%xmm0, %xmm1
	movq	%rdx, -608(%rbp)
	movsd	-608(%rbp), %xmm0
	movl	%eax, %edi
	call	get_std_dev
	movq	%xmm0, %rax
	movq	%rax, -176(%rbp)
	.loc 1 885 0
	cvtss2sd	-128(%rbp), %xmm2
	movss	-192(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	cvtss2sd	-168(%rbp), %xmm5
	cvtss2sd	-40(%rbp), %xmm4
	cvtss2sd	-44(%rbp), %xmm3
	movss	-188(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	-20(%rbp), %eax
	movsd	-88(%rbp), %xmm11
	movsd	-80(%rbp), %xmm10
	movsd	-72(%rbp), %xmm9
	movsd	-64(%rbp), %xmm8
	subq	$8, %rsp
	leaq	-8(%rsp), %rsp
	movsd	%xmm2, (%rsp)
	leaq	-8(%rsp), %rsp
	movsd	%xmm1, (%rsp)
	pushq	-176(%rbp)
	movl	%eax, %esi
	movapd	%xmm5, %xmm7
	movapd	%xmm4, %xmm6
	movapd	%xmm3, %xmm5
	movapd	%xmm11, %xmm4
	movapd	%xmm10, %xmm3
	movapd	%xmm9, %xmm2
	movapd	%xmm8, %xmm1
	leaq	.LC36(%rip), %rdi
	movl	$8, %eax
	call	printf@PLT
	addq	$32, %rsp
	.loc 1 897 0
	movss	-212(%rbp), %xmm1
	movl	16(%rbp), %edx
	movl	60(%rbp), %ecx
	movl	28(%rbp), %eax
	movl	%eax, %edi
	movss	-200(%rbp), %xmm0
	movl	-204(%rbp), %eax
	movaps	%xmm1, %xmm2
	movl	%ecx, %esi
	movaps	%xmm0, %xmm1
	movl	%eax, -608(%rbp)
	movss	-608(%rbp), %xmm0
	call	check_place
	.loc 1 901 0
	movl	68(%rbp), %eax
	testl	%eax, %eax
	je	.L63
	.loc 1 902 0 discriminator 1
	movl	16(%rbp), %eax
	.loc 1 901 0 discriminator 1
	testl	%eax, %eax
	jne	.L63
	.loc 1 906 0
	movl	$0, -108(%rbp)
	jmp	.L64
.L67:
	.loc 1 907 0
	movl	$1, -112(%rbp)
	jmp	.L65
.L66:
	.loc 1 908 0 discriminator 3
	movq	timing_place_crit(%rip), %rax
	movl	-108(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-112(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	.loc 1 907 0 discriminator 3
	addl	$1, -112(%rbp)
.L65:
	.loc 1 907 0 is_stmt 0 discriminator 1
	movq	net(%rip), %rcx
	movl	-108(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cmpl	-112(%rbp), %eax
	jge	.L66
	.loc 1 906 0 is_stmt 1 discriminator 2
	addl	$1, -108(%rbp)
.L64:
	.loc 1 906 0 is_stmt 0 discriminator 1
	movl	num_nets(%rip), %eax
	cmpl	%eax, -108(%rbp)
	jl	.L67
	.loc 1 909 0 is_stmt 1
	leaq	-212(%rbp), %rdx
	leaq	-200(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	comp_td_costs
.L63:
	.loc 1 912 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	je	.L68
	.loc 1 913 0 discriminator 1
	movl	16(%rbp), %eax
	.loc 1 912 0 discriminator 1
	cmpl	$2, %eax
	je	.L68
	.loc 1 914 0
	movl	68(%rbp), %eax
	.loc 1 913 0
	testl	%eax, %eax
	je	.L69
.L68:
	.loc 1 916 0
	movq	point_to_point_delay_cost(%rip), %rax
	movq	%rax, -560(%rbp)
	.loc 1 918 0
	movq	-560(%rbp), %rax
	movq	%rax, %rdi
	call	load_timing_graph_net_delays@PLT
	.loc 1 919 0
	movq	-552(%rbp), %rax
	pxor	%xmm0, %xmm0
	movq	%rax, %rdi
	call	load_net_slack@PLT
	movd	%xmm0, %eax
	movl	%eax, -184(%rbp)
	.loc 1 926 0
	cvtss2sd	-184(%rbp), %xmm0
	leaq	.LC37(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
.L69:
	.loc 1 930 0
	cvtss2sd	-40(%rbp), %xmm3
	movss	-200(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm2
	movss	-204(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movss	-196(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	-148(%rbp), %edx
	leaq	-544(%rbp), %rax
	leaq	.LC38(%rip), %rsi
	movq	%rax, %rdi
	movl	$4, %eax
	call	sprintf@PLT
	.loc 1 933 0
	movss	-212(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm3
	movss	-200(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm2
	movss	-204(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movss	-196(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC39(%rip), %rdi
	movl	$4, %eax
	call	printf@PLT
	.loc 1 936 0
	leaq	-544(%rbp), %rax
	movl	$0, %ecx
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$1, %edi
	call	update_screen@PLT
	.loc 1 942 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	je	.L70
	.loc 1 943 0 discriminator 1
	movl	16(%rbp), %eax
	.loc 1 942 0 discriminator 1
	cmpl	$2, %eax
	je	.L70
	.loc 1 944 0
	movl	68(%rbp), %eax
	.loc 1 943 0
	testl	%eax, %eax
	je	.L71
.L70:
	.loc 1 947 0
	movq	-136(%rbp), %rax
	movq	%rax, -560(%rbp)
	.loc 1 949 0
	movq	-232(%rbp), %rcx
	movq	-224(%rbp), %rdx
	movl	60(%rbp), %eax
	movl	28(%rbp), %esi
	movl	%esi, %edi
	subq	$8, %rsp
	pushq	80(%rbp)
	pushq	72(%rbp)
	pushq	64(%rbp)
	pushq	56(%rbp)
	pushq	48(%rbp)
	pushq	40(%rbp)
	pushq	32(%rbp)
	pushq	24(%rbp)
	pushq	16(%rbp)
	movl	%eax, %esi
	call	free_placement_structs
	addq	$80, %rsp
	.loc 1 952 0
	leaq	-552(%rbp), %rdx
	leaq	-560(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	free_lookups_and_criticalities@PLT
.L71:
	.loc 1 958 0
	movq	-600(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L72
	.loc 1 960 0
	movl	$0, -108(%rbp)
	jmp	.L73
.L75:
	.loc 1 962 0
	movq	-600(%rbp), %rax
	movq	(%rax), %rax
	movl	-108(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L74
	.loc 1 962 0 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.4679(%rip), %rcx
	movl	$962, %edx
	leaq	.LC40(%rip), %rsi
	leaq	.LC41(%rip), %rdi
	call	__assert_fail@PLT
.L74:
	.loc 1 963 0 is_stmt 1 discriminator 2
	movq	-600(%rbp), %rax
	movq	(%rax), %rax
	movl	-108(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 960 0 discriminator 2
	addl	$1, -108(%rbp)
.L73:
	.loc 1 960 0 is_stmt 0 discriminator 1
	movl	num_nets(%rip), %eax
	cmpl	%eax, -108(%rbp)
	jl	.L75
	.loc 1 965 0 is_stmt 1
	movq	-600(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L72:
	.loc 1 967 0
	movl	num_nets(%rip), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	movq	%rax, %rdx
	movq	-600(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 968 0
	movl	$0, -108(%rbp)
	jmp	.L76
.L77:
	.loc 1 970 0 discriminator 3
	movq	-600(%rbp), %rax
	movq	(%rax), %rax
	movl	-108(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rbx
	movl	-108(%rbp), %eax
	movl	%eax, %edi
	call	get_mst_of_net@PLT
	movq	%rax, (%rbx)
	.loc 1 968 0 discriminator 3
	addl	$1, -108(%rbp)
.L76:
	.loc 1 968 0 is_stmt 0 discriminator 1
	movl	num_nets(%rip), %eax
	cmpl	%eax, -108(%rbp)
	jl	.L77
	.loc 1 972 0 is_stmt 1
	movq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 973 0
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	try_place, .-try_place
	.type	count_connections, @function
count_connections:
.LFB3:
	.loc 1 977 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 982 0
	movl	$0, -4(%rbp)
	.loc 1 984 0
	movl	$0, -8(%rbp)
	jmp	.L85
.L88:
	.loc 1 987 0
	movq	net(%rip), %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L90
	.loc 1 990 0
	movq	net(%rip), %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	addl	%eax, -4(%rbp)
	jmp	.L87
.L90:
	.loc 1 988 0
	nop
.L87:
	.loc 1 984 0 discriminator 2
	addl	$1, -8(%rbp)
.L85:
	.loc 1 984 0 is_stmt 0 discriminator 1
	movl	num_nets(%rip), %eax
	cmpl	%eax, -8(%rbp)
	jl	.L88
	.loc 1 992 0 is_stmt 1
	movl	-4(%rbp), %eax
	.loc 1 993 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	count_connections, .-count_connections
	.type	compute_net_pin_index_values, @function
compute_net_pin_index_values:
.LFB4:
	.loc 1 997 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 1005 0
	movl	$0, -12(%rbp)
	jmp	.L92
.L95:
	.loc 1 1007 0
	movq	block(%rip), %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	.loc 1 1008 0
	movl	$0, -16(%rbp)
	jmp	.L93
.L94:
	.loc 1 1010 0 discriminator 3
	movq	net_pin_index(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	$-1, (%rax)
	.loc 1 1008 0 discriminator 3
	addl	$1, -16(%rbp)
.L93:
	.loc 1 1008 0 is_stmt 0 discriminator 1
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	-16(%rbp), %eax
	jg	.L94
	.loc 1 1005 0 is_stmt 1 discriminator 2
	addl	$1, -12(%rbp)
.L92:
	.loc 1 1005 0 is_stmt 0 discriminator 1
	movl	num_blocks(%rip), %eax
	cmpl	%eax, -12(%rbp)
	jl	.L95
	.loc 1 1014 0 is_stmt 1
	movl	$0, -4(%rbp)
	jmp	.L96
.L101:
	.loc 1 1017 0
	movq	net(%rip), %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L102
	.loc 1 1020 0
	movl	$0, -8(%rbp)
	jmp	.L99
.L100:
	.loc 1 1022 0 discriminator 3
	movq	net(%rip), %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -28(%rbp)
	.loc 1 1023 0 discriminator 3
	movq	net_pin_index(%rip), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movq	net(%rip), %rsi
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	movq	24(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	cltq
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-8(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 1020 0 discriminator 3
	addl	$1, -8(%rbp)
.L99:
	.loc 1 1020 0 is_stmt 0 discriminator 1
	movq	net(%rip), %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cmpl	-8(%rbp), %eax
	jge	.L100
	jmp	.L98
.L102:
	.loc 1 1018 0 is_stmt 1
	nop
.L98:
	.loc 1 1014 0 discriminator 2
	addl	$1, -4(%rbp)
.L96:
	.loc 1 1014 0 is_stmt 0 discriminator 1
	movl	num_nets(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L101
	.loc 1 1027 0 is_stmt 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	compute_net_pin_index_values, .-compute_net_pin_index_values
	.type	get_std_dev, @function
get_std_dev:
.LFB5:
	.loc 1 1034 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movsd	%xmm0, -32(%rbp)
	movsd	%xmm1, -40(%rbp)
	.loc 1 1043 0
	cmpl	$1, -20(%rbp)
	jg	.L104
	.loc 1 1044 0
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L105
.L104:
	.loc 1 1046 0
	pxor	%xmm0, %xmm0
	cvtsi2sd	-20(%rbp), %xmm0
	mulsd	-40(%rbp), %xmm0
	mulsd	-40(%rbp), %xmm0
	movsd	-32(%rbp), %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movl	-20(%rbp), %eax
	subl	$1, %eax
	pxor	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
.L105:
	.loc 1 1048 0
	movsd	-8(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jbe	.L111
	.loc 1 1049 0
	movq	-8(%rbp), %rax
	movq	%rax, -48(%rbp)
	movsd	-48(%rbp), %xmm0
	call	sqrt@PLT
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	jmp	.L108
.L111:
	.loc 1 1051 0
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
.L108:
	.loc 1 1053 0
	movsd	-8(%rbp), %xmm0
	.loc 1 1054 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	get_std_dev, .-get_std_dev
	.type	update_rlim, @function
update_rlim:
.LFB6:
	.loc 1 1060 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movss	%xmm0, -28(%rbp)
	.loc 1 1067 0
	movq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm1
	cvtss2sd	-28(%rbp), %xmm0
	movsd	.LC42(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movq	-24(%rbp), %rax
	movss	%xmm0, (%rax)
	.loc 1 1068 0
	movl	ny(%rip), %edx
	movl	nx(%rip), %eax
	cmpl	%eax, %edx
	cmovge	%edx, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	movss	%xmm0, -4(%rbp)
	.loc 1 1069 0
	movq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	ucomiss	-4(%rbp), %xmm0
	jbe	.L121
	.loc 1 1069 0 is_stmt 0 discriminator 1
	movss	-4(%rbp), %xmm0
	jmp	.L115
.L121:
	.loc 1 1069 0 discriminator 2
	movq	-24(%rbp), %rax
	movss	(%rax), %xmm0
.L115:
	.loc 1 1069 0 discriminator 4
	movq	-24(%rbp), %rax
	movss	%xmm0, (%rax)
	.loc 1 1070 0 is_stmt 1 discriminator 4
	movq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	movss	.LC2(%rip), %xmm1
	ucomiss	%xmm1, %xmm0
	jbe	.L122
	.loc 1 1070 0 is_stmt 0 discriminator 1
	movq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	jmp	.L118
.L122:
	.loc 1 1070 0 discriminator 2
	movss	.LC2(%rip), %xmm0
.L118:
	.loc 1 1070 0 discriminator 4
	movq	-24(%rbp), %rax
	movss	%xmm0, (%rax)
	.loc 1 1071 0 is_stmt 1 discriminator 4
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	update_rlim, .-update_rlim
	.type	update_t, @function
update_t:
.LFB7:
	.loc 1 1081 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movss	%xmm0, -12(%rbp)
	movss	%xmm1, -16(%rbp)
	movss	%xmm2, -20(%rbp)
	.loc 1 1085 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L124
	.loc 1 1087 0
	movss	28(%rbp), %xmm1
	movq	-8(%rbp), %rax
	movss	(%rax), %xmm0
	mulss	%xmm1, %xmm0
	movq	-8(%rbp), %rax
	movss	%xmm0, (%rax)
	.loc 1 1127 0
	jmp	.L138
.L124:
	.loc 1 1110 0
	cvtss2sd	-20(%rbp), %xmm0
	ucomisd	.LC43(%rip), %xmm0
	jbe	.L135
	.loc 1 1112 0
	movq	-8(%rbp), %rax
	movss	(%rax), %xmm1
	movss	.LC44(%rip), %xmm0
	mulss	%xmm1, %xmm0
	movq	-8(%rbp), %rax
	movss	%xmm0, (%rax)
	.loc 1 1127 0
	jmp	.L138
.L135:
	.loc 1 1114 0
	cvtss2sd	-20(%rbp), %xmm0
	ucomisd	.LC45(%rip), %xmm0
	jbe	.L136
	.loc 1 1116 0
	movq	-8(%rbp), %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	.LC46(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movq	-8(%rbp), %rax
	movss	%xmm0, (%rax)
	.loc 1 1127 0
	jmp	.L138
.L136:
	.loc 1 1118 0
	cvtss2sd	-20(%rbp), %xmm0
	ucomisd	.LC47(%rip), %xmm0
	ja	.L130
	.loc 1 1118 0 is_stmt 0 discriminator 1
	movss	-16(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	ucomiss	%xmm1, %xmm0
	jbe	.L137
.L130:
	.loc 1 1120 0 is_stmt 1
	movq	-8(%rbp), %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	.LC48(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movq	-8(%rbp), %rax
	movss	%xmm0, (%rax)
	.loc 1 1127 0
	jmp	.L138
.L137:
	.loc 1 1124 0
	movq	-8(%rbp), %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	.LC45(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movq	-8(%rbp), %rax
	movss	%xmm0, (%rax)
.L138:
	.loc 1 1127 0
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	update_t, .-update_t
	.type	exit_crit, @function
exit_crit:
.LFB8:
	.loc 1 1134 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	.loc 1 1138 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L140
	.loc 1 1140 0
	movss	32(%rbp), %xmm0
	ucomiss	-4(%rbp), %xmm0
	jbe	.L148
	.loc 1 1142 0
	movl	$1, %eax
	jmp	.L143
.L148:
	.loc 1 1146 0
	movl	$0, %eax
	jmp	.L143
.L140:
	.loc 1 1152 0
	cvtss2sd	-4(%rbp), %xmm1
	cvtss2sd	-8(%rbp), %xmm0
	movsd	.LC49(%rip), %xmm2
	mulsd	%xmm2, %xmm0
	movl	num_nets(%rip), %eax
	pxor	%xmm2, %xmm2
	cvtsi2sd	%eax, %xmm2
	divsd	%xmm2, %xmm0
	ucomisd	%xmm1, %xmm0
	jbe	.L149
	.loc 1 1154 0
	movl	$1, %eax
	jmp	.L143
.L149:
	.loc 1 1158 0
	movl	$0, %eax
.L143:
	.loc 1 1160 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	exit_crit, .-exit_crit
	.section	.rodata
	.align 8
.LC51:
	.string	"Warning:  Starting t: %d of %d configurations accepted.\n"
	.text
	.type	starting_t, @function
starting_t:
.LFB9:
	.loc 1 1180 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movl	%ecx, -76(%rbp)
	movq	%r8, -88(%rbp)
	movq	%r9, -96(%rbp)
	movss	%xmm0, -80(%rbp)
	movss	%xmm1, -100(%rbp)
	movss	%xmm2, -104(%rbp)
	movss	%xmm3, -108(%rbp)
	.loc 1 1188 0
	movl	nx(%rip), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	movq	%rax, -32(%rbp)
	.loc 1 1190 0
	movl	32(%rbp), %eax
	cmpl	$1, %eax
	jne	.L151
	.loc 1 1191 0
	movss	40(%rbp), %xmm0
	jmp	.L152
.L151:
	.loc 1 1193 0
	movl	num_blocks(%rip), %eax
	cmpl	%eax, 56(%rbp)
	cmovle	56(%rbp), %eax
	movl	%eax, -36(%rbp)
	.loc 1 1195 0
	movl	$0, -8(%rbp)
	.loc 1 1196 0
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -16(%rbp)
	.loc 1 1197 0
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	.loc 1 1201 0
	movl	$0, -4(%rbp)
	jmp	.L153
.L155:
	.loc 1 1203 0
	movss	-108(%rbp), %xmm3
	movss	-104(%rbp), %xmm2
	movss	-100(%rbp), %xmm1
	movq	-96(%rbp), %r9
	movq	-88(%rbp), %r8
	movl	-76(%rbp), %ecx
	movss	-80(%rbp), %xmm0
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movq	-56(%rbp), %rax
	subq	$8, %rsp
	pushq	-32(%rbp)
	pushq	72(%rbp)
	movl	64(%rbp), %edi
	pushq	%rdi
	movl	24(%rbp), %edi
	pushq	%rdi
	movl	16(%rbp), %edi
	pushq	%rdi
	movaps	%xmm3, %xmm4
	movaps	%xmm2, %xmm3
	movaps	%xmm1, %xmm2
	movaps	%xmm0, %xmm1
	movq	%rax, %rdi
	movss	.LC50(%rip), %xmm0
	call	try_swap
	addq	$48, %rsp
	cmpl	$1, %eax
	jne	.L154
	.loc 1 1210 0
	addl	$1, -8(%rbp)
	.loc 1 1211 0
	movq	-56(%rbp), %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	-16(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	.loc 1 1212 0
	movq	-56(%rbp), %rax
	movss	(%rax), %xmm1
	movq	-56(%rbp), %rax
	movss	(%rax), %xmm0
	mulss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	-24(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
.L154:
	.loc 1 1201 0 discriminator 2
	addl	$1, -4(%rbp)
.L153:
	.loc 1 1201 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L155
	.loc 1 1216 0 is_stmt 1
	cmpl	$0, -8(%rbp)
	je	.L156
	.loc 1 1217 0
	pxor	%xmm0, %xmm0
	cvtsi2sd	-8(%rbp), %xmm0
	movsd	-16(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	jmp	.L157
.L156:
	.loc 1 1219 0
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -16(%rbp)
.L157:
	.loc 1 1221 0
	movsd	-16(%rbp), %xmm0
	movq	-24(%rbp), %rdx
	movl	-8(%rbp), %eax
	movapd	%xmm0, %xmm1
	movq	%rdx, -120(%rbp)
	movsd	-120(%rbp), %xmm0
	movl	%eax, %edi
	call	get_std_dev
	movq	%xmm0, %rax
	movq	%rax, -48(%rbp)
	.loc 1 1224 0
	movl	-8(%rbp), %eax
	cmpl	-36(%rbp), %eax
	je	.L158
	.loc 1 1226 0
	movl	-36(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC51(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L158:
	.loc 1 1237 0
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 1241 0
	movsd	-48(%rbp), %xmm1
	movsd	.LC52(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
.L152:
	.loc 1 1242 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	starting_t, .-starting_t
	.type	try_swap, @function
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
assess_swap:
.LFB15:
	.loc 1 1875 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movss	%xmm0, -20(%rbp)
	movss	%xmm1, -24(%rbp)
	.loc 1 1882 0
	pxor	%xmm0, %xmm0
	ucomiss	-20(%rbp), %xmm0
	jb	.L300
	.loc 1 1889 0
	movl	$1, -4(%rbp)
	.loc 1 1890 0
	movl	-4(%rbp), %eax
	jmp	.L291
.L300:
	.loc 1 1893 0
	pxor	%xmm0, %xmm0
	ucomiss	-24(%rbp), %xmm0
	jp	.L292
	pxor	%xmm0, %xmm0
	ucomiss	-24(%rbp), %xmm0
	jne	.L292
	.loc 1 1894 0
	movl	$0, %eax
	jmp	.L291
.L292:
	.loc 1 1896 0
	call	my_frand@PLT
	movd	%xmm0, %eax
	movl	%eax, -8(%rbp)
	.loc 1 1897 0
	movss	-20(%rbp), %xmm1
	movss	.LC62(%rip), %xmm0
	xorps	%xmm1, %xmm0
	divss	-24(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	exp@PLT
	cvtsd2ss	%xmm0, %xmm2
	movss	%xmm2, -12(%rbp)
	.loc 1 1898 0
	movss	-12(%rbp), %xmm0
	ucomiss	-8(%rbp), %xmm0
	jbe	.L301
	.loc 1 1900 0
	movl	$1, -4(%rbp)
	jmp	.L296
.L301:
	.loc 1 1904 0
	movl	$0, -4(%rbp)
.L296:
	.loc 1 1906 0
	movl	-4(%rbp), %eax
.L291:
	.loc 1 1907 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	assess_swap, .-assess_swap
	.type	recompute_bb_cost, @function
recompute_bb_cost:
.LFB16:
	.loc 1 1913 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	.loc 1 1922 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 1926 0
	cmpl	$1, -20(%rbp)
	jne	.L303
	.loc 1 1928 0
	movl	$0, -4(%rbp)
	jmp	.L304
.L307:
	.loc 1 1930 0
	movl	$0, -8(%rbp)
	jmp	.L305
.L306:
	.loc 1 1932 0 discriminator 3
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
	pxor	%xmm0, %xmm0
	movss	%xmm0, 8(%rax)
	.loc 1 1933 0 discriminator 3
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
	pxor	%xmm0, %xmm0
	movss	%xmm0, 8(%rax)
	.loc 1 1930 0 discriminator 3
	addl	$1, -8(%rbp)
.L305:
	.loc 1 1930 0 is_stmt 0 discriminator 1
	movl	-8(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jl	.L306
	.loc 1 1928 0 is_stmt 1 discriminator 2
	addl	$1, -4(%rbp)
.L304:
	.loc 1 1928 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jl	.L307
.L303:
	.loc 1 1938 0 is_stmt 1
	movl	$0, -12(%rbp)
	jmp	.L308
.L311:
	.loc 1 1941 0
	movq	net(%rip), %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L309
	.loc 1 1946 0
	cmpl	$1, -20(%rbp)
	je	.L310
	.loc 1 1948 0
	movq	net_cost(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movss	-16(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -16(%rbp)
	jmp	.L309
.L310:
	.loc 1 1952 0
	movq	bb_coords(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	leaq	(%rax,%rdx), %rsi
	movl	-24(%rbp), %edx
	movl	-12(%rbp), %eax
	movl	%edx, %ecx
	movl	$1, %edx
	movl	%eax, %edi
	call	update_region_occ
.L309:
	.loc 1 1938 0 discriminator 2
	addl	$1, -12(%rbp)
.L308:
	.loc 1 1938 0 is_stmt 0 discriminator 1
	movl	num_nets(%rip), %eax
	cmpl	%eax, -12(%rbp)
	jl	.L311
	.loc 1 1958 0 is_stmt 1
	cmpl	$1, -20(%rbp)
	jne	.L312
	.loc 1 1960 0
	movl	-24(%rbp), %eax
	movl	%eax, %edi
	call	nonlinear_cong_cost
	movd	%xmm0, %eax
	movl	%eax, -16(%rbp)
.L312:
	.loc 1 1963 0
	movss	-16(%rbp), %xmm0
	.loc 1 1964 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	recompute_bb_cost, .-recompute_bb_cost
	.section	.rodata
.LC63:
	.string	"source_type != NULL"
.LC64:
	.string	"sink_type != NULL"
	.align 8
.LC65:
	.string	"Error in comp_td_point_to_point_delay in place.c, bad delay_source_to_sink value"
	.align 8
.LC66:
	.string	"Error in comp_td_point_to_point_delay in place.c, delay is less than 0"
	.text
	.type	comp_td_point_to_point_delay, @function
comp_td_point_to_point_delay:
.LFB17:
	.loc 1 1970 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movl	%esi, -56(%rbp)
	.loc 1 1979 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -4(%rbp)
	.loc 1 1981 0
	movq	net(%rip), %rcx
	movl	-52(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	(%rax), %eax
	movl	%eax, -8(%rbp)
	.loc 1 1982 0
	movq	block(%rip), %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 1 1984 0
	movq	net(%rip), %rcx
	movl	-52(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -20(%rbp)
	.loc 1 1985 0
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	.loc 1 1987 0
	cmpq	$0, -16(%rbp)
	jne	.L315
	.loc 1 1987 0 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.4943(%rip), %rcx
	movl	$1987, %edx
	leaq	.LC40(%rip), %rsi
	leaq	.LC63(%rip), %rdi
	call	__assert_fail@PLT
.L315:
	.loc 1 1988 0 is_stmt 1
	cmpq	$0, -32(%rbp)
	jne	.L316
	.loc 1 1988 0 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.4943(%rip), %rcx
	movl	$1988, %edx
	leaq	.LC40(%rip), %rsi
	leaq	.LC64(%rip), %rdi
	call	__assert_fail@PLT
.L316:
	.loc 1 1990 0 is_stmt 1
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	24(%rax), %ecx
	movq	block(%rip), %rsi
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	movl	24(%rax), %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, -36(%rbp)
	subl	%eax, -36(%rbp)
	.loc 1 1991 0
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	28(%rax), %ecx
	movq	block(%rip), %rsi
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	movl	28(%rax), %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, -40(%rbp)
	subl	%eax, -40(%rbp)
	.loc 1 1997 0
	movq	IO_TYPE(%rip), %rax
	cmpq	%rax, -16(%rbp)
	jne	.L317
	.loc 1 1999 0
	movq	IO_TYPE(%rip), %rax
	cmpq	%rax, -32(%rbp)
	jne	.L318
	.loc 1 2000 0
	movq	delta_io_to_io(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-40(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movss	%xmm0, -4(%rbp)
	jmp	.L320
.L318:
	.loc 1 2002 0
	movq	delta_io_to_fb(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-40(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movss	%xmm0, -4(%rbp)
	jmp	.L320
.L317:
	.loc 1 2006 0
	movq	IO_TYPE(%rip), %rax
	cmpq	%rax, -32(%rbp)
	jne	.L321
	.loc 1 2007 0
	movq	delta_fb_to_io(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-40(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movss	%xmm0, -4(%rbp)
	jmp	.L320
.L321:
	.loc 1 2009 0
	movq	delta_fb_to_fb(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-40(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movss	%xmm0, -4(%rbp)
.L320:
	.loc 1 2011 0
	pxor	%xmm0, %xmm0
	ucomiss	-4(%rbp), %xmm0
	jbe	.L329
	.loc 1 2013 0
	leaq	.LC65(%rip), %rdi
	call	puts@PLT
	.loc 1 2015 0
	movl	$1, %edi
	call	exit@PLT
.L329:
	.loc 1 2018 0
	pxor	%xmm0, %xmm0
	ucomiss	-4(%rbp), %xmm0
	jbe	.L330
	.loc 1 2020 0
	leaq	.LC66(%rip), %rdi
	call	puts@PLT
	.loc 1 2022 0
	movl	$1, %edi
	call	exit@PLT
.L330:
	.loc 1 2025 0
	movss	-4(%rbp), %xmm0
	.loc 1 2026 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	comp_td_point_to_point_delay, .-comp_td_point_to_point_delay
	.type	update_td_cost, @function
update_td_cost:
.LFB18:
	.loc 1 2034 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	.loc 1 2040 0
	movl	$0, -4(%rbp)
	jmp	.L332
.L340:
	.loc 1 2043 0
	movq	block(%rip), %rcx
	movl	-20(%rbp), %eax
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
	movl	%eax, -12(%rbp)
	.loc 1 2045 0
	cmpl	$-1, -12(%rbp)
	je	.L351
	.loc 1 2048 0
	movq	net(%rip), %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L352
	.loc 1 2051 0
	movq	net_pin_index(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -16(%rbp)
	.loc 1 2053 0
	cmpl	$0, -16(%rbp)
	je	.L336
	.loc 1 2057 0
	movq	net(%rip), %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	(%rax), %eax
	cmpl	-24(%rbp), %eax
	je	.L334
	.loc 1 2058 0
	movq	net(%rip), %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	(%rax), %eax
	cmpl	-20(%rbp), %eax
	je	.L334
	.loc 1 2061 0
	movq	point_to_point_delay_cost(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 2062 0
	movq	temp_point_to_point_delay_cost(%rip), %rdx
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movl	-16(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	.loc 1 2061 0
	movss	%xmm0, (%rax)
	.loc 1 2063 0
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC53(%rip), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2066 0
	movq	point_to_point_timing_cost(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 2067 0
	movq	temp_point_to_point_timing_cost(%rip), %rdx
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	.loc 1 2068 0
	movl	-16(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	.loc 1 2066 0
	movss	%xmm0, (%rax)
	.loc 1 2069 0
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC53(%rip), %xmm0
	movss	%xmm0, (%rax)
	jmp	.L334
.L336:
	.loc 1 2076 0
	movl	$1, -8(%rbp)
	jmp	.L338
.L339:
	.loc 1 2079 0 discriminator 3
	movq	point_to_point_delay_cost(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 2080 0 discriminator 3
	movq	temp_point_to_point_delay_cost(%rip), %rdx
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	.loc 1 2079 0 discriminator 3
	movss	%xmm0, (%rax)
	.loc 1 2081 0 discriminator 3
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC53(%rip), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2083 0 discriminator 3
	movq	point_to_point_timing_cost(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 2084 0 discriminator 3
	movq	temp_point_to_point_timing_cost(%rip), %rdx
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	.loc 1 2083 0 discriminator 3
	movss	%xmm0, (%rax)
	.loc 1 2085 0 discriminator 3
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC53(%rip), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2076 0 discriminator 3
	addl	$1, -8(%rbp)
.L338:
	.loc 1 2076 0 is_stmt 0 discriminator 1
	movq	net(%rip), %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cmpl	-8(%rbp), %eax
	jge	.L339
	jmp	.L334
.L351:
	.loc 1 2046 0 is_stmt 1
	nop
	jmp	.L334
.L352:
	.loc 1 2049 0
	nop
.L334:
	.loc 1 2040 0 discriminator 2
	addl	$1, -4(%rbp)
.L332:
	.loc 1 2040 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L340
	.loc 1 2090 0 is_stmt 1
	cmpl	$-1, -24(%rbp)
	je	.L353
	.loc 1 2092 0
	movl	$0, -4(%rbp)
	jmp	.L342
.L350:
	.loc 1 2095 0
	movq	block(%rip), %rcx
	movl	-24(%rbp), %eax
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
	movl	%eax, -12(%rbp)
	.loc 1 2097 0
	cmpl	$-1, -12(%rbp)
	je	.L354
	.loc 1 2100 0
	movq	net(%rip), %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L355
	.loc 1 2103 0
	movq	net_pin_index(%rip), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -16(%rbp)
	.loc 1 2105 0
	cmpl	$0, -16(%rbp)
	je	.L346
	.loc 1 2109 0
	movq	net(%rip), %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	(%rax), %eax
	cmpl	-24(%rbp), %eax
	je	.L344
	.loc 1 2110 0
	movq	net(%rip), %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	(%rax), %eax
	cmpl	-20(%rbp), %eax
	je	.L344
	.loc 1 2113 0
	movq	point_to_point_delay_cost(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 2114 0
	movq	temp_point_to_point_delay_cost(%rip), %rdx
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	.loc 1 2115 0
	movl	-16(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	.loc 1 2113 0
	movss	%xmm0, (%rax)
	.loc 1 2116 0
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 2117 0
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC53(%rip), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2119 0
	movq	point_to_point_timing_cost(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 2121 0
	movq	temp_point_to_point_timing_cost(%rip), %rdx
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	.loc 1 2122 0
	movl	-16(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	.loc 1 2120 0
	movss	%xmm0, (%rax)
	.loc 1 2123 0
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 2124 0
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC53(%rip), %xmm0
	movss	%xmm0, (%rax)
	jmp	.L344
.L346:
	.loc 1 2130 0
	movl	$1, -8(%rbp)
	jmp	.L348
.L349:
	.loc 1 2133 0 discriminator 3
	movq	point_to_point_delay_cost(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 2134 0 discriminator 3
	movq	temp_point_to_point_delay_cost(%rip), %rdx
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	.loc 1 2135 0 discriminator 3
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	.loc 1 2133 0 discriminator 3
	movss	%xmm0, (%rax)
	.loc 1 2136 0 discriminator 3
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 2137 0 discriminator 3
	movss	.LC53(%rip), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2139 0 discriminator 3
	movq	point_to_point_timing_cost(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 2140 0 discriminator 3
	movq	temp_point_to_point_timing_cost(%rip), %rdx
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	.loc 1 2141 0 discriminator 3
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	.loc 1 2139 0 discriminator 3
	movss	%xmm0, (%rax)
	.loc 1 2142 0 discriminator 3
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 2143 0 discriminator 3
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC53(%rip), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2130 0 discriminator 3
	addl	$1, -8(%rbp)
.L348:
	.loc 1 2130 0 is_stmt 0 discriminator 1
	movq	net(%rip), %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cmpl	-8(%rbp), %eax
	jge	.L349
	jmp	.L344
.L354:
	.loc 1 2098 0 is_stmt 1
	nop
	jmp	.L344
.L355:
	.loc 1 2101 0
	nop
.L344:
	.loc 1 2092 0 discriminator 2
	addl	$1, -4(%rbp)
.L342:
	.loc 1 2092 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L350
.L353:
	.loc 1 2148 0 is_stmt 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	update_td_cost, .-update_td_cost
	.type	comp_delta_td_cost, @function
comp_delta_td_cost:
.LFB19:
	.loc 1 2157 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movl	%edx, -44(%rbp)
	movq	%rcx, -56(%rbp)
	movq	%r8, -64(%rbp)
	.loc 1 2167 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -12(%rbp)
	.loc 1 2168 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 2171 0
	movl	$0, -4(%rbp)
	jmp	.L357
.L365:
	.loc 1 2173 0
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
	movl	%eax, -20(%rbp)
	.loc 1 2175 0
	cmpl	$-1, -20(%rbp)
	je	.L376
	.loc 1 2178 0
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L377
	.loc 1 2181 0
	movq	net_pin_index(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -24(%rbp)
	.loc 1 2183 0
	cmpl	$0, -24(%rbp)
	je	.L361
	.loc 1 2191 0
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	(%rax), %eax
	cmpl	-40(%rbp), %eax
	je	.L359
	.loc 1 2192 0
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	(%rax), %eax
	cmpl	-36(%rbp), %eax
	je	.L359
	.loc 1 2194 0
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	comp_td_point_to_point_delay
	movd	%xmm0, %eax
	movl	%eax, -28(%rbp)
	.loc 1 2197 0
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	-28(%rbp), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2199 0
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 2200 0
	movq	timing_place_crit(%rip), %rdx
	movl	-20(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	mulss	-28(%rbp), %xmm0
	.loc 1 2199 0
	movss	%xmm0, (%rax)
	.loc 1 2203 0
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	.loc 1 2204 0
	movq	point_to_point_delay_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	subss	%xmm1, %xmm0
	.loc 1 2202 0
	movss	-16(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 2207 0
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	.loc 1 2208 0
	movq	point_to_point_timing_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	subss	%xmm1, %xmm0
	.loc 1 2206 0
	movss	-12(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -12(%rbp)
	jmp	.L359
.L361:
	.loc 1 2214 0
	movl	$1, -8(%rbp)
	jmp	.L363
.L364:
	.loc 1 2216 0 discriminator 3
	movl	-8(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	comp_td_point_to_point_delay
	movd	%xmm0, %eax
	movl	%eax, -28(%rbp)
	.loc 1 2219 0 discriminator 3
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	-28(%rbp), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2221 0 discriminator 3
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 2222 0 discriminator 3
	movq	timing_place_crit(%rip), %rdx
	movl	-20(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	mulss	-28(%rbp), %xmm0
	.loc 1 2221 0 discriminator 3
	movss	%xmm0, (%rax)
	.loc 1 2225 0 discriminator 3
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	.loc 1 2226 0 discriminator 3
	movq	point_to_point_delay_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	.loc 1 2225 0 discriminator 3
	subss	%xmm1, %xmm0
	.loc 1 2224 0 discriminator 3
	movss	-16(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 2229 0 discriminator 3
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	.loc 1 2230 0 discriminator 3
	movq	point_to_point_timing_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	.loc 1 2229 0 discriminator 3
	subss	%xmm1, %xmm0
	.loc 1 2228 0 discriminator 3
	movss	-12(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -12(%rbp)
	.loc 1 2214 0 discriminator 3
	addl	$1, -8(%rbp)
.L363:
	.loc 1 2214 0 is_stmt 0 discriminator 1
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cmpl	-8(%rbp), %eax
	jge	.L364
	jmp	.L359
.L376:
	.loc 1 2176 0 is_stmt 1
	nop
	jmp	.L359
.L377:
	.loc 1 2179 0
	nop
.L359:
	.loc 1 2171 0 discriminator 2
	addl	$1, -4(%rbp)
.L357:
	.loc 1 2171 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L365
	.loc 1 2235 0 is_stmt 1
	cmpl	$-1, -40(%rbp)
	je	.L366
	.loc 1 2237 0
	movl	$0, -4(%rbp)
	jmp	.L367
.L375:
	.loc 1 2239 0
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
	movl	%eax, -20(%rbp)
	.loc 1 2241 0
	cmpl	$-1, -20(%rbp)
	je	.L378
	.loc 1 2244 0
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L379
	.loc 1 2247 0
	movq	net_pin_index(%rip), %rax
	movl	-40(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -24(%rbp)
	.loc 1 2249 0
	cmpl	$0, -24(%rbp)
	je	.L371
	.loc 1 2257 0
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	(%rax), %eax
	cmpl	-40(%rbp), %eax
	je	.L369
	.loc 1 2258 0
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	(%rax), %eax
	cmpl	-36(%rbp), %eax
	je	.L369
	.loc 1 2260 0
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	comp_td_point_to_point_delay
	movd	%xmm0, %eax
	movl	%eax, -28(%rbp)
	.loc 1 2264 0
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 2265 0
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	-28(%rbp), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2266 0
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 2267 0
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 2268 0
	movq	timing_place_crit(%rip), %rdx
	movl	-20(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	mulss	-28(%rbp), %xmm0
	.loc 1 2267 0
	movss	%xmm0, (%rax)
	.loc 1 2272 0
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 2273 0
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	.loc 1 2274 0
	movq	point_to_point_delay_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 2275 0
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	.loc 1 2273 0
	subss	%xmm1, %xmm0
	.loc 1 2271 0
	movss	-16(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 2277 0
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 2278 0
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	.loc 1 2279 0
	movq	point_to_point_timing_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 2280 0
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	.loc 1 2278 0
	subss	%xmm1, %xmm0
	.loc 1 2276 0
	movss	-12(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -12(%rbp)
	jmp	.L369
.L371:
	.loc 1 2286 0
	movl	$1, -8(%rbp)
	jmp	.L373
.L374:
	.loc 1 2289 0 discriminator 3
	movl	-8(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	comp_td_point_to_point_delay
	movd	%xmm0, %eax
	movl	%eax, -28(%rbp)
	.loc 1 2293 0 discriminator 3
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 2294 0 discriminator 3
	movss	-28(%rbp), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2295 0 discriminator 3
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 2296 0 discriminator 3
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 2297 0 discriminator 3
	movq	timing_place_crit(%rip), %rdx
	movl	-20(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	mulss	-28(%rbp), %xmm0
	.loc 1 2296 0 discriminator 3
	movss	%xmm0, (%rax)
	.loc 1 2302 0 discriminator 3
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 2303 0 discriminator 3
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	.loc 1 2304 0 discriminator 3
	movq	point_to_point_delay_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	.loc 1 2303 0 discriminator 3
	subss	%xmm1, %xmm0
	.loc 1 2301 0 discriminator 3
	movss	-16(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 2306 0 discriminator 3
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 2307 0 discriminator 3
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	.loc 1 2308 0 discriminator 3
	movq	point_to_point_timing_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 2309 0 discriminator 3
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	.loc 1 2307 0 discriminator 3
	subss	%xmm1, %xmm0
	.loc 1 2305 0 discriminator 3
	movss	-12(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -12(%rbp)
	.loc 1 2286 0 discriminator 3
	addl	$1, -8(%rbp)
.L373:
	.loc 1 2286 0 is_stmt 0 discriminator 1
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cmpl	-8(%rbp), %eax
	jge	.L374
	jmp	.L369
.L378:
	.loc 1 2242 0 is_stmt 1
	nop
	jmp	.L369
.L379:
	.loc 1 2245 0
	nop
.L369:
	.loc 1 2237 0 discriminator 2
	addl	$1, -4(%rbp)
.L367:
	.loc 1 2237 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L375
.L366:
	.loc 1 2315 0 is_stmt 1
	movq	-56(%rbp), %rax
	movss	-12(%rbp), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2316 0
	movq	-64(%rbp), %rax
	movss	-16(%rbp), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2317 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	comp_delta_td_cost, .-comp_delta_td_cost
	.type	comp_td_costs, @function
comp_td_costs:
.LFB20:
	.loc 1 2322 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 1 2331 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -12(%rbp)
	.loc 1 2332 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 2334 0
	movl	$0, -4(%rbp)
	jmp	.L381
.L385:
	.loc 1 2336 0
	movq	net(%rip), %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L382
	.loc 1 2339 0
	movl	$1, -8(%rbp)
	jmp	.L383
.L384:
	.loc 1 2342 0 discriminator 3
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	comp_td_point_to_point_delay
	movd	%xmm0, %eax
	movl	%eax, -20(%rbp)
	.loc 1 2346 0 discriminator 3
	movq	timing_place_crit(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	.loc 1 2344 0 discriminator 3
	mulss	-20(%rbp), %xmm0
	movss	%xmm0, -24(%rbp)
	.loc 1 2348 0 discriminator 3
	movss	-16(%rbp), %xmm0
	addss	-20(%rbp), %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 2349 0 discriminator 3
	movq	point_to_point_delay_cost(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	-20(%rbp), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2351 0 discriminator 3
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC53(%rip), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2353 0 discriminator 3
	movq	point_to_point_timing_cost(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	-24(%rbp), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2355 0 discriminator 3
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC53(%rip), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2356 0 discriminator 3
	movss	-12(%rbp), %xmm0
	addss	-24(%rbp), %xmm0
	movss	%xmm0, -12(%rbp)
	.loc 1 2339 0 discriminator 3
	addl	$1, -8(%rbp)
.L383:
	.loc 1 2339 0 is_stmt 0 discriminator 1
	movq	net(%rip), %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cmpl	-8(%rbp), %eax
	jge	.L384
.L382:
	.loc 1 2334 0 is_stmt 1 discriminator 2
	addl	$1, -4(%rbp)
.L381:
	.loc 1 2334 0 is_stmt 0 discriminator 1
	movl	num_nets(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L385
	.loc 1 2360 0 is_stmt 1
	movq	-40(%rbp), %rax
	movss	-12(%rbp), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2361 0
	movq	-48(%rbp), %rax
	movss	-16(%rbp), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2362 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	comp_td_costs, .-comp_td_costs
	.section	.rodata
	.align 8
.LC67:
	.string	"BB estimate of min-dist (placement) wirelength is ;%.0f\n"
	.text
	.type	comp_bb_cost, @function
comp_bb_cost:
.LFB21:
	.loc 1 2369 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movl	%edi, -52(%rbp)
	movl	%esi, -56(%rbp)
	movl	%edx, -60(%rbp)
	.loc 1 2384 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -32(%rbp)
	.loc 1 2385 0
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -40(%rbp)
	.loc 1 2389 0
	cmpl	$1, -56(%rbp)
	jne	.L387
	.loc 1 2391 0
	movl	$0, -20(%rbp)
	jmp	.L388
.L391:
	.loc 1 2393 0
	movl	$0, -24(%rbp)
	jmp	.L389
.L390:
	.loc 1 2395 0 discriminator 3
	movq	place_region_x(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movss	%xmm0, 8(%rax)
	.loc 1 2396 0 discriminator 3
	movq	place_region_y(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movss	%xmm0, 8(%rax)
	.loc 1 2393 0 discriminator 3
	addl	$1, -24(%rbp)
.L389:
	.loc 1 2393 0 is_stmt 0 discriminator 1
	movl	-24(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L390
	.loc 1 2391 0 is_stmt 1 discriminator 2
	addl	$1, -20(%rbp)
.L388:
	.loc 1 2391 0 is_stmt 0 discriminator 1
	movl	-20(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L391
.L387:
	.loc 1 2401 0 is_stmt 1
	movl	$0, -28(%rbp)
	jmp	.L392
.L398:
	.loc 1 2404 0
	movq	net(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jne	.L393
	.loc 1 2410 0
	movq	net(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cmpl	$3, %eax
	jle	.L394
	.loc 1 2410 0 is_stmt 0 discriminator 1
	cmpl	$0, -52(%rbp)
	jne	.L394
	.loc 1 2412 0 is_stmt 1
	movq	bb_num_on_edges(%rip), %rax
	.loc 1 2413 0
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	.loc 1 2412 0
	addq	%rax, %rdx
	movq	bb_coords(%rip), %rax
	movl	-28(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$4, %rcx
	addq	%rax, %rcx
	movl	-28(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	get_bb_from_scratch
	jmp	.L395
.L394:
	.loc 1 2417 0
	movq	bb_coords(%rip), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rax, %rdx
	movl	-28(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	get_non_updateable_bb
.L395:
	.loc 1 2420 0
	cmpl	$1, -56(%rbp)
	je	.L396
	.loc 1 2422 0
	movq	net_cost(%rip), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	leaq	(%rax,%rdx), %rbx
	movq	bb_coords(%rip), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rax, %rdx
	movl	-28(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	get_net_cost
	movd	%xmm0, %eax
	movl	%eax, (%rbx)
	.loc 1 2423 0
	movq	net_cost(%rip), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movss	-32(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -32(%rbp)
	.loc 1 2424 0
	cmpl	$1, -52(%rbp)
	jne	.L393
	.loc 1 2426 0
	movq	bb_coords(%rip), %rax
	.loc 1 2428 0
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	.loc 1 2426 0
	addq	%rax, %rdx
	movl	-28(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	get_net_wirelength_estimate
	movapd	%xmm0, %xmm1
	.loc 1 2425 0
	movsd	-40(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	jmp	.L393
.L396:
	.loc 1 2432 0
	movq	bb_coords(%rip), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	leaq	(%rax,%rdx), %rsi
	movl	-60(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	%edx, %ecx
	movl	$1, %edx
	movl	%eax, %edi
	call	update_region_occ
.L393:
	.loc 1 2401 0 discriminator 2
	addl	$1, -28(%rbp)
.L392:
	.loc 1 2401 0 is_stmt 0 discriminator 1
	movl	num_nets(%rip), %eax
	cmpl	%eax, -28(%rbp)
	jl	.L398
	.loc 1 2438 0 is_stmt 1
	cmpl	$1, -56(%rbp)
	jne	.L399
	.loc 1 2440 0
	movl	-60(%rbp), %eax
	movl	%eax, %edi
	call	nonlinear_cong_cost
	movd	%xmm0, %eax
	movl	%eax, -32(%rbp)
.L399:
	.loc 1 2443 0
	cmpl	$1, -52(%rbp)
	jne	.L400
	.loc 1 2444 0
	movq	-40(%rbp), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	leaq	.LC67(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
.L400:
	.loc 1 2447 0
	movss	-32(%rbp), %xmm0
	.loc 1 2448 0
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	comp_bb_cost, .-comp_bb_cost
	.type	nonlinear_cong_cost, @function
nonlinear_cong_cost:
.LFB22:
	.loc 1 2453 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	.loc 1 2467 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -4(%rbp)
	.loc 1 2469 0
	movl	$0, -8(%rbp)
	jmp	.L403
.L412:
	.loc 1 2471 0
	movl	$0, -12(%rbp)
	jmp	.L404
.L411:
	.loc 1 2476 0
	movq	place_region_x(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movss	8(%rax), %xmm1
	.loc 1 2477 0
	movq	place_region_x(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	.loc 1 2476 0
	ucomiss	%xmm1, %xmm0
	jbe	.L416
	.loc 1 2479 0
	movq	place_region_x(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movss	8(%rax), %xmm1
	.loc 1 2480 0
	movq	place_region_x(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movss	4(%rax), %xmm0
	.loc 1 2479 0
	mulss	%xmm1, %xmm0
	movss	-4(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	jmp	.L407
.L416:
	.loc 1 2485 0
	movq	place_region_x(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movss	8(%rax), %xmm1
	.loc 1 2486 0
	movq	place_region_x(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movss	4(%rax), %xmm0
	.loc 1 2485 0
	mulss	%xmm1, %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 2487 0
	movss	-16(%rbp), %xmm0
	mulss	-16(%rbp), %xmm0
	movss	-4(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
.L407:
	.loc 1 2490 0
	movq	place_region_y(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movss	8(%rax), %xmm1
	.loc 1 2491 0
	movq	place_region_y(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	.loc 1 2490 0
	ucomiss	%xmm1, %xmm0
	jbe	.L417
	.loc 1 2493 0
	movq	place_region_y(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movss	8(%rax), %xmm1
	.loc 1 2494 0
	movq	place_region_y(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movss	4(%rax), %xmm0
	.loc 1 2493 0
	mulss	%xmm1, %xmm0
	movss	-4(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	jmp	.L410
.L417:
	.loc 1 2499 0
	movq	place_region_y(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movss	8(%rax), %xmm1
	.loc 1 2500 0
	movq	place_region_y(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movss	4(%rax), %xmm0
	.loc 1 2499 0
	mulss	%xmm1, %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 2501 0
	movss	-16(%rbp), %xmm0
	mulss	-16(%rbp), %xmm0
	movss	-4(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
.L410:
	.loc 1 2471 0 discriminator 2
	addl	$1, -12(%rbp)
.L404:
	.loc 1 2471 0 is_stmt 0 discriminator 1
	movl	-12(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L411
	.loc 1 2469 0 is_stmt 1 discriminator 2
	addl	$1, -8(%rbp)
.L403:
	.loc 1 2469 0 is_stmt 0 discriminator 1
	movl	-8(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L412
	.loc 1 2507 0 is_stmt 1
	movss	-4(%rbp), %xmm0
	.loc 1 2508 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	nonlinear_cong_cost, .-nonlinear_cong_cost
	.section	.rodata
	.align 8
.LC71:
	.string	"Error in update_region_occ:  x_overlap < 0\n inet = %d, overlap = %g\n"
	.align 8
.LC72:
	.string	"Error in update_region_occ:  y_overlap < 0\n inet = %d, overlap = %g\n"
	.text
	.type	update_region_occ, @function
update_region_occ:
.LFB23:
	.loc 1 2516 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movl	%edi, -100(%rbp)
	movq	%rsi, -112(%rbp)
	movl	%edx, -104(%rbp)
	movl	%ecx, -116(%rbp)
	.loc 1 2530 0
	movq	net(%rip), %rcx
	movl	-100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cmpl	$49, %eax
	jle	.L419
	.loc 1 2532 0
	movq	net(%rip), %rcx
	movl	-100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	subl	$49, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC68(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	.LC69(%rip), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm2
	movss	%xmm2, -4(%rbp)
	jmp	.L420
.L419:
	.loc 1 2536 0
	movq	net(%rip), %rcx
	movl	-100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	cross_count(%rip), %rax
	movss	(%rdx,%rax), %xmm0
	movss	%xmm0, -4(%rbp)
.L420:
	.loc 1 2539 0
	movq	-112(%rbp), %rax
	movl	(%rax), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC4(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm3
	movss	%xmm3, -16(%rbp)
	.loc 1 2540 0
	movq	-112(%rbp), %rax
	movl	4(%rax), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC4(%rip), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm4
	movss	%xmm4, -20(%rbp)
	.loc 1 2541 0
	movq	-112(%rbp), %rax
	movl	8(%rax), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC4(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm5
	movss	%xmm5, -24(%rbp)
	.loc 1 2542 0
	movq	-112(%rbp), %rax
	movl	12(%rax), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC4(%rip), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm6
	movss	%xmm6, -28(%rbp)
	.loc 1 2546 0
	pxor	%xmm0, %xmm0
	cvtsi2ss	-116(%rbp), %xmm0
	movl	nx(%rip), %eax
	pxor	%xmm1, %xmm1
	cvtsi2ss	%eax, %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -32(%rbp)
	.loc 1 2547 0
	pxor	%xmm0, %xmm0
	cvtsi2ss	-116(%rbp), %xmm0
	movl	ny(%rip), %eax
	pxor	%xmm1, %xmm1
	cvtsi2ss	%eax, %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -36(%rbp)
	.loc 1 2556 0
	cvtss2sd	-16(%rbp), %xmm0
	movsd	.LC4(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	-32(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	movl	%eax, -40(%rbp)
	.loc 1 2557 0
	cvtss2sd	-20(%rbp), %xmm0
	movsd	.LC4(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	-32(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	movl	%eax, -44(%rbp)
	.loc 1 2558 0
	movl	-116(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-44(%rbp), %eax
	cmpl	%eax, %edx
	cmovle	%edx, %eax
	movl	%eax, -44(%rbp)
	.loc 1 2560 0
	cvtss2sd	-24(%rbp), %xmm0
	movsd	.LC4(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	-36(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	movl	%eax, -48(%rbp)
	.loc 1 2561 0
	cvtss2sd	-28(%rbp), %xmm0
	movsd	.LC4(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	-36(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	movl	%eax, -52(%rbp)
	.loc 1 2562 0
	movl	-116(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-52(%rbp), %eax
	cmpl	%eax, %edx
	cmovle	%edx, %eax
	movl	%eax, -52(%rbp)
	.loc 1 2564 0
	movss	-20(%rbp), %xmm0
	subss	-16(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, -56(%rbp)
	.loc 1 2565 0
	movss	-28(%rbp), %xmm0
	subss	-24(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, -60(%rbp)
	.loc 1 2570 0
	movl	-40(%rbp), %eax
	movl	%eax, -8(%rbp)
	jmp	.L421
.L440:
	.loc 1 2572 0
	movl	-48(%rbp), %eax
	movl	%eax, -12(%rbp)
	jmp	.L422
.L439:
	.loc 1 2574 0
	movq	place_region_bounds_x(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	ucomiss	-16(%rbp), %xmm0
	jbe	.L447
	.loc 1 2574 0 is_stmt 0 discriminator 1
	movq	place_region_bounds_x(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	jmp	.L425
.L447:
	.loc 1 2574 0 discriminator 2
	movss	-16(%rbp), %xmm0
.L425:
	.loc 1 2574 0 discriminator 4
	movss	%xmm0, -64(%rbp)
	.loc 1 2576 0 is_stmt 1 discriminator 4
	movq	place_region_bounds_x(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	ucomiss	-20(%rbp), %xmm0
	jbe	.L448
	.loc 1 2576 0 is_stmt 0 discriminator 1
	movss	-20(%rbp), %xmm0
	jmp	.L428
.L448:
	.loc 1 2576 0 discriminator 2
	movq	place_region_bounds_x(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
.L428:
	.loc 1 2575 0 is_stmt 1
	movss	%xmm0, -68(%rbp)
	.loc 1 2577 0
	movq	place_region_bounds_y(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	ucomiss	-24(%rbp), %xmm0
	jbe	.L449
	.loc 1 2577 0 is_stmt 0 discriminator 1
	movq	place_region_bounds_y(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	jmp	.L431
.L449:
	.loc 1 2577 0 discriminator 2
	movss	-24(%rbp), %xmm0
.L431:
	.loc 1 2577 0 discriminator 4
	movss	%xmm0, -72(%rbp)
	.loc 1 2579 0 is_stmt 1 discriminator 4
	movq	place_region_bounds_y(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	ucomiss	-28(%rbp), %xmm0
	jbe	.L450
	.loc 1 2579 0 is_stmt 0 discriminator 1
	movss	-28(%rbp), %xmm0
	jmp	.L434
.L450:
	.loc 1 2579 0 discriminator 2
	movq	place_region_bounds_y(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
.L434:
	.loc 1 2578 0 is_stmt 1
	movss	%xmm0, -76(%rbp)
	.loc 1 2581 0
	movss	-68(%rbp), %xmm0
	subss	-64(%rbp), %xmm0
	movss	%xmm0, -80(%rbp)
	.loc 1 2582 0
	movss	-76(%rbp), %xmm0
	subss	-72(%rbp), %xmm0
	movss	%xmm0, -84(%rbp)
	.loc 1 2586 0
	cvtss2sd	-80(%rbp), %xmm0
	movsd	.LC70(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	.L435
	.loc 1 2588 0
	cvtss2sd	-80(%rbp), %xmm0
	movl	-100(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC71(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
.L435:
	.loc 1 2594 0
	cvtss2sd	-84(%rbp), %xmm0
	movsd	.LC70(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	.L437
	.loc 1 2596 0
	cvtss2sd	-84(%rbp), %xmm0
	movl	-100(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC72(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
.L437:
	.loc 1 2605 0 discriminator 2
	movss	-4(%rbp), %xmm0
	mulss	-84(%rbp), %xmm0
	mulss	-80(%rbp), %xmm0
	mulss	-60(%rbp), %xmm0
	.loc 1 2604 0 discriminator 2
	mulss	-32(%rbp), %xmm0
	movss	%xmm0, -88(%rbp)
	.loc 1 2608 0 discriminator 2
	movss	-4(%rbp), %xmm0
	mulss	-80(%rbp), %xmm0
	mulss	-84(%rbp), %xmm0
	mulss	-56(%rbp), %xmm0
	.loc 1 2607 0 discriminator 2
	mulss	-36(%rbp), %xmm0
	movss	%xmm0, -92(%rbp)
	.loc 1 2611 0 discriminator 2
	movq	place_region_x(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movq	place_region_x(%rip), %rdx
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$4, %rcx
	addq	%rcx, %rdx
	movss	8(%rdx), %xmm1
	.loc 1 2612 0 discriminator 2
	pxor	%xmm0, %xmm0
	cvtsi2ss	-104(%rbp), %xmm0
	mulss	-88(%rbp), %xmm0
	.loc 1 2611 0 discriminator 2
	addss	%xmm1, %xmm0
	movss	%xmm0, 8(%rax)
	.loc 1 2613 0 discriminator 2
	movq	place_region_y(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movq	place_region_y(%rip), %rdx
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$4, %rcx
	addq	%rcx, %rdx
	movss	8(%rdx), %xmm1
	.loc 1 2614 0 discriminator 2
	pxor	%xmm0, %xmm0
	cvtsi2ss	-104(%rbp), %xmm0
	mulss	-92(%rbp), %xmm0
	.loc 1 2613 0 discriminator 2
	addss	%xmm1, %xmm0
	movss	%xmm0, 8(%rax)
	.loc 1 2572 0 discriminator 2
	addl	$1, -12(%rbp)
.L422:
	.loc 1 2572 0 is_stmt 0 discriminator 1
	movl	-12(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jle	.L439
	.loc 1 2570 0 is_stmt 1 discriminator 2
	addl	$1, -8(%rbp)
.L421:
	.loc 1 2570 0 is_stmt 0 discriminator 1
	movl	-8(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jle	.L440
	.loc 1 2618 0 is_stmt 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	update_region_occ, .-update_region_occ
	.type	free_place_regions, @function
free_place_regions:
.LFB24:
	.loc 1 2623 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	.loc 1 2628 0
	movl	-4(%rbp), %eax
	leal	-1(%rax), %edx
	movq	place_region_x(%rip), %rax
	movl	$16, %r8d
	movl	$0, %ecx
	movl	$0, %esi
	movq	%rax, %rdi
	call	free_matrix@PLT
	.loc 1 2631 0
	movl	-4(%rbp), %eax
	leal	-1(%rax), %edx
	movq	place_region_y(%rip), %rax
	movl	$16, %r8d
	movl	$0, %ecx
	movl	$0, %esi
	movq	%rax, %rdi
	call	free_matrix@PLT
	.loc 1 2634 0
	movq	place_region_bounds_x(%rip), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 2635 0
	movq	place_region_bounds_y(%rip), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 2636 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	free_place_regions, .-free_place_regions
	.type	free_placement_structs, @function
free_placement_structs:
.LFB25:
	.loc 1 2645 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movq	%rdx, -32(%rbp)
	movq	%rcx, -40(%rbp)
	.loc 1 2652 0
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	je	.L453
	.loc 1 2653 0 discriminator 1
	movl	16(%rbp), %eax
	.loc 1 2652 0 discriminator 1
	cmpl	$2, %eax
	je	.L453
	.loc 1 2654 0
	movl	68(%rbp), %eax
	.loc 1 2653 0
	testl	%eax, %eax
	je	.L454
.L453:
	.loc 1 2656 0
	movl	$0, -4(%rbp)
	jmp	.L455
.L456:
	.loc 1 2660 0 discriminator 3
	movq	point_to_point_delay_cost(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	addq	$4, %rdx
	movq	%rdx, (%rax)
	.loc 1 2661 0 discriminator 3
	movq	point_to_point_delay_cost(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 2663 0 discriminator 3
	movq	point_to_point_timing_cost(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	addq	$4, %rdx
	movq	%rdx, (%rax)
	.loc 1 2664 0 discriminator 3
	movq	point_to_point_timing_cost(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 2666 0 discriminator 3
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	addq	$4, %rdx
	movq	%rdx, (%rax)
	.loc 1 2667 0 discriminator 3
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 2669 0 discriminator 3
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	addq	$4, %rdx
	movq	%rdx, (%rax)
	.loc 1 2670 0 discriminator 3
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 2656 0 discriminator 3
	addl	$1, -4(%rbp)
.L455:
	.loc 1 2656 0 is_stmt 0 discriminator 1
	movl	num_nets(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L456
	.loc 1 2672 0 is_stmt 1
	movq	point_to_point_delay_cost(%rip), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 2673 0
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 2675 0
	movq	point_to_point_timing_cost(%rip), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 2676 0
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 2678 0
	movl	num_blocks(%rip), %eax
	leal	-1(%rax), %edx
	movq	net_pin_index(%rip), %rax
	movl	$4, %r8d
	movl	$0, %ecx
	movl	$0, %esi
	movq	%rax, %rdi
	call	free_matrix@PLT
.L454:
	.loc 1 2682 0
	movq	net_cost(%rip), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 2683 0
	movq	temp_net_cost(%rip), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 2684 0
	movq	bb_num_on_edges(%rip), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 2685 0
	movq	bb_coords(%rip), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 2687 0
	movq	$0, net_cost(%rip)
	.loc 1 2688 0
	movq	$0, temp_net_cost(%rip)
	.loc 1 2689 0
	movq	$0, bb_num_on_edges(%rip)
	.loc 1 2690 0
	movq	$0, bb_coords(%rip)
	.loc 1 2692 0
	call	free_unique_pin_list
	.loc 1 2694 0
	cmpl	$1, -20(%rbp)
	jne	.L457
	.loc 1 2696 0
	movl	-24(%rbp), %eax
	movl	%eax, %edi
	call	free_place_regions
	.loc 1 2697 0
	movl	-24(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-32(%rbp), %rax
	movl	$4, %r8d
	movl	$0, %ecx
	movl	$0, %esi
	movq	%rax, %rdi
	call	free_matrix@PLT
	.loc 1 2699 0
	movl	-24(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-40(%rbp), %rax
	movl	$4, %r8d
	movl	$0, %ecx
	movl	$0, %esi
	movq	%rax, %rdi
	call	free_matrix@PLT
	.loc 1 2707 0
	jmp	.L459
.L457:
	.loc 1 2703 0
	cmpl	$0, -20(%rbp)
	jne	.L459
	.loc 1 2705 0
	call	free_fast_cost_update_structs
.L459:
	.loc 1 2707 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	free_placement_structs, .-free_placement_structs
	.type	alloc_and_load_placement_structs, @function
alloc_and_load_placement_structs:
.LFB26:
	.loc 1 2717 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movss	%xmm0, -44(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	.loc 1 2724 0
	movl	$0, -28(%rbp)
	.loc 1 2725 0
	movl	$0, -32(%rbp)
	jmp	.L461
.L462:
	.loc 1 2728 0 discriminator 3
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
	.loc 1 2727 0 discriminator 3
	movl	-28(%rbp), %eax
	cmpl	%eax, %edx
	cmovge	%edx, %eax
	movl	%eax, -28(%rbp)
	.loc 1 2725 0 discriminator 3
	addl	$1, -32(%rbp)
.L461:
	.loc 1 2725 0 is_stmt 0 discriminator 1
	movl	num_types(%rip), %eax
	cmpl	%eax, -32(%rbp)
	jl	.L462
	.loc 1 2731 0 is_stmt 1
	movl	16(%rbp), %eax
	cmpl	$1, %eax
	je	.L463
	.loc 1 2732 0 discriminator 1
	movl	16(%rbp), %eax
	.loc 1 2731 0 discriminator 1
	cmpl	$2, %eax
	je	.L463
	.loc 1 2733 0
	movl	68(%rbp), %eax
	.loc 1 2732 0
	testl	%eax, %eax
	je	.L464
.L463:
	.loc 1 2738 0
	movl	num_nets(%rip), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	.loc 1 2737 0
	movq	%rax, point_to_point_delay_cost(%rip)
	.loc 1 2740 0
	movl	num_nets(%rip), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	.loc 1 2739 0
	movq	%rax, temp_point_to_point_delay_cost(%rip)
	.loc 1 2743 0
	movl	num_nets(%rip), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	.loc 1 2742 0
	movq	%rax, point_to_point_timing_cost(%rip)
	.loc 1 2745 0
	movl	num_nets(%rip), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	.loc 1 2744 0
	movq	%rax, temp_point_to_point_timing_cost(%rip)
	.loc 1 2748 0
	movl	-28(%rbp), %eax
	leal	-1(%rax), %edx
	movl	num_blocks(%rip), %eax
	subl	$1, %eax
	movl	$4, %r8d
	movl	%edx, %ecx
	movl	$0, %edx
	movl	%eax, %esi
	movl	$0, %edi
	call	alloc_matrix@PLT
	.loc 1 2747 0
	movq	%rax, net_pin_index(%rip)
	.loc 1 2751 0
	movl	$0, -20(%rbp)
	jmp	.L465
.L466:
	.loc 1 2756 0 discriminator 3
	movq	point_to_point_delay_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rbx
	.loc 1 2757 0 discriminator 3
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	.loc 1 2756 0 discriminator 3
	movq	%rax, (%rbx)
	.loc 1 2759 0 discriminator 3
	movq	point_to_point_delay_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	subq	$4, %rdx
	movq	%rdx, (%rax)
	.loc 1 2761 0 discriminator 3
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rbx
	.loc 1 2762 0 discriminator 3
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	.loc 1 2761 0 discriminator 3
	movq	%rax, (%rbx)
	.loc 1 2764 0 discriminator 3
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	subq	$4, %rdx
	movq	%rdx, (%rax)
	.loc 1 2766 0 discriminator 3
	movq	point_to_point_timing_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rbx
	.loc 1 2767 0 discriminator 3
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	.loc 1 2766 0 discriminator 3
	movq	%rax, (%rbx)
	.loc 1 2769 0 discriminator 3
	movq	point_to_point_timing_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	subq	$4, %rdx
	movq	%rdx, (%rax)
	.loc 1 2771 0 discriminator 3
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rbx
	.loc 1 2772 0 discriminator 3
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	.loc 1 2771 0 discriminator 3
	movq	%rax, (%rbx)
	.loc 1 2774 0 discriminator 3
	movq	temp_point_to_point_timing_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	subq	$4, %rdx
	movq	%rdx, (%rax)
	.loc 1 2751 0 discriminator 3
	addl	$1, -20(%rbp)
.L465:
	.loc 1 2751 0 is_stmt 0 discriminator 1
	movl	num_nets(%rip), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L466
	.loc 1 2776 0 is_stmt 1
	movl	$0, -20(%rbp)
	jmp	.L467
.L470:
	.loc 1 2778 0
	movl	$1, -24(%rbp)
	jmp	.L468
.L469:
	.loc 1 2780 0 discriminator 3
	movq	point_to_point_delay_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2781 0 discriminator 3
	movq	temp_point_to_point_delay_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2778 0 discriminator 3
	addl	$1, -24(%rbp)
.L468:
	.loc 1 2778 0 is_stmt 0 discriminator 1
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cmpl	-24(%rbp), %eax
	jge	.L469
	.loc 1 2776 0 is_stmt 1 discriminator 2
	addl	$1, -20(%rbp)
.L467:
	.loc 1 2776 0 is_stmt 0 discriminator 1
	movl	num_nets(%rip), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L470
.L464:
	.loc 1 2790 0 is_stmt 1
	movl	num_nets(%rip), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	movq	%rax, net_cost(%rip)
	.loc 1 2791 0
	movl	num_nets(%rip), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	movq	%rax, temp_net_cost(%rip)
	.loc 1 2797 0
	movl	$0, -20(%rbp)
	jmp	.L471
.L472:
	.loc 1 2798 0 discriminator 3
	movq	temp_net_cost(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC53(%rip), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2797 0 discriminator 3
	addl	$1, -20(%rbp)
.L471:
	.loc 1 2797 0 is_stmt 0 discriminator 1
	movl	num_nets(%rip), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L472
	.loc 1 2800 0 is_stmt 1
	movl	num_nets(%rip), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	movq	%rax, bb_coords(%rip)
	.loc 1 2802 0
	movl	num_nets(%rip), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	.loc 1 2801 0
	movq	%rax, bb_num_on_edges(%rip)
	.loc 1 2806 0
	call	alloc_and_load_unique_pin_list
	.loc 1 2810 0
	cmpl	$1, -36(%rbp)
	jne	.L473
	.loc 1 2812 0
	movl	-40(%rbp), %eax
	movl	%eax, %edi
	call	alloc_place_regions
	.loc 1 2813 0
	movl	-40(%rbp), %eax
	movl	%eax, %edi
	call	load_place_regions
	.loc 1 2814 0
	movl	-40(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-40(%rbp), %eax
	subl	$1, %eax
	movl	$4, %r8d
	movl	%edx, %ecx
	movl	$0, %edx
	movl	%eax, %esi
	movl	$0, %edi
	call	alloc_matrix@PLT
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 2818 0
	movl	-40(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-40(%rbp), %eax
	subl	$1, %eax
	movl	$4, %r8d
	movl	%edx, %ecx
	movl	$0, %edx
	movl	%eax, %esi
	movl	$0, %edi
	call	alloc_matrix@PLT
	movq	%rax, %rdx
	.loc 1 2817 0
	movq	-64(%rbp), %rax
	movq	%rdx, (%rax)
	jmp	.L474
.L473:
	.loc 1 2823 0
	movq	-56(%rbp), %rax
	movq	$0, (%rax)
	.loc 1 2824 0
	movq	-64(%rbp), %rax
	movq	$0, (%rax)
.L474:
	.loc 1 2827 0
	cmpl	$0, -36(%rbp)
	jne	.L476
	.loc 1 2829 0
	movl	-44(%rbp), %eax
	movl	%eax, -48(%rbp)
	movss	-48(%rbp), %xmm0
	call	alloc_and_load_for_fast_cost_update
.L476:
	.loc 1 2831 0
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	alloc_and_load_placement_structs, .-alloc_and_load_placement_structs
	.type	alloc_place_regions, @function
alloc_place_regions:
.LFB27:
	.loc 1 2836 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	.loc 1 2843 0
	movl	-4(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	$16, %r8d
	movl	%edx, %ecx
	movl	$0, %edx
	movl	%eax, %esi
	movl	$0, %edi
	call	alloc_matrix@PLT
	.loc 1 2842 0
	movq	%rax, place_region_x(%rip)
	.loc 1 2848 0
	movl	-4(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	$16, %r8d
	movl	%edx, %ecx
	movl	$0, %edx
	movl	%eax, %esi
	movl	$0, %edi
	call	alloc_matrix@PLT
	.loc 1 2847 0
	movq	%rax, place_region_y(%rip)
	.loc 1 2852 0
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	movq	%rax, place_region_bounds_x(%rip)
	.loc 1 2855 0
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	movq	%rax, place_region_bounds_y(%rip)
	.loc 1 2857 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	alloc_place_regions, .-alloc_place_regions
	.type	load_place_regions, @function
load_place_regions:
.LFB28:
	.loc 1 2862 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	.loc 1 2873 0
	movl	$0, -8(%rbp)
	jmp	.L479
.L486:
	.loc 1 2875 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 2876 0
	pxor	%xmm0, %xmm0
	cvtsi2ss	-8(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ss	-52(%rbp), %xmm1
	divss	%xmm1, %xmm0
	movaps	%xmm0, %xmm1
	movl	ny(%rip), %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	%xmm1, %xmm0
	movss	.LC2(%rip), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -24(%rbp)
	.loc 1 2877 0
	movl	-8(%rbp), %eax
	addl	$1, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ss	-52(%rbp), %xmm1
	divss	%xmm1, %xmm0
	movaps	%xmm0, %xmm1
	movl	ny(%rip), %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	%xmm1, %xmm0
	movss	%xmm0, -28(%rbp)
	.loc 1 2879 0
	cvtss2sd	-24(%rbp), %xmm0
	call	floor@PLT
	cvttsd2si	%xmm0, %eax
	movl	%eax, -32(%rbp)
	.loc 1 2880 0
	movl	$1, %eax
	cmpl	$0, -32(%rbp)
	cmovg	-32(%rbp), %eax
	movl	%eax, -32(%rbp)
	.loc 1 2881 0
	cvtss2sd	-28(%rbp), %xmm0
	call	ceil@PLT
	cvttsd2si	%xmm0, %eax
	movl	%eax, -36(%rbp)
	.loc 1 2882 0
	movl	ny(%rip), %eax
	cmpl	%eax, -36(%rbp)
	cmovle	-36(%rbp), %eax
	movl	%eax, -36(%rbp)
	.loc 1 2884 0
	movq	chan_width_x(%rip), %rax
	movl	-32(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	subq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %edx
	.loc 1 2885 0
	movq	chan_width_x(%rip), %rax
	movl	-32(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rax
	movl	(%rax), %eax
	.loc 1 2884 0
	addl	%edx, %eax
	.loc 1 2885 0
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC73(%rip), %xmm1
	divsd	%xmm1, %xmm0
	.loc 1 2884 0
	cvtsd2ss	%xmm0, %xmm3
	movss	%xmm3, -20(%rbp)
	.loc 1 2886 0
	cmpl	$1, -32(%rbp)
	jne	.L480
	.loc 1 2887 0
	cvtss2sd	-20(%rbp), %xmm1
	movq	chan_width_x(%rip), %rax
	movl	(%rax), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC73(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm4
	movss	%xmm4, -20(%rbp)
.L480:
	.loc 1 2889 0
	pxor	%xmm0, %xmm0
	cvtsi2ss	-32(%rbp), %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	.LC2(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, -40(%rbp)
	.loc 1 2890 0
	movss	-40(%rbp), %xmm0
	mulss	-20(%rbp), %xmm0
	movss	-16(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 2892 0
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.L481
.L482:
	.loc 1 2895 0 discriminator 3
	movq	chan_width_x(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	subq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	chan_width_x(%rip), %rax
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rax
	movl	(%rax), %eax
	addl	%edx, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC73(%rip), %xmm1
	divsd	%xmm1, %xmm0
	.loc 1 2894 0 discriminator 3
	cvtsd2ss	%xmm0, %xmm5
	movss	%xmm5, -20(%rbp)
	.loc 1 2896 0 discriminator 3
	movss	-16(%rbp), %xmm0
	addss	-20(%rbp), %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 2892 0 discriminator 3
	addl	$1, -12(%rbp)
.L481:
	.loc 1 2892 0 is_stmt 0 discriminator 1
	movl	-12(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L482
	.loc 1 2899 0 is_stmt 1
	movq	chan_width_x(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	subq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %edx
	.loc 1 2900 0
	movq	chan_width_x(%rip), %rax
	movl	-36(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rax
	movl	(%rax), %eax
	.loc 1 2899 0
	addl	%edx, %eax
	.loc 1 2900 0
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC73(%rip), %xmm1
	divsd	%xmm1, %xmm0
	.loc 1 2899 0
	cvtsd2ss	%xmm0, %xmm6
	movss	%xmm6, -20(%rbp)
	.loc 1 2901 0
	movl	ny(%rip), %eax
	cmpl	%eax, -36(%rbp)
	jne	.L483
	.loc 1 2902 0
	cvtss2sd	-20(%rbp), %xmm1
	movq	chan_width_x(%rip), %rax
	movl	ny(%rip), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC73(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm7
	movss	%xmm7, -20(%rbp)
.L483:
	.loc 1 2904 0
	pxor	%xmm0, %xmm0
	cvtsi2ss	-36(%rbp), %xmm0
	subss	-28(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, -40(%rbp)
	.loc 1 2905 0
	movss	-40(%rbp), %xmm0
	mulss	-20(%rbp), %xmm0
	movss	-16(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 2907 0
	movl	$0, -4(%rbp)
	jmp	.L484
.L485:
	.loc 1 2909 0 discriminator 3
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
	movss	-16(%rbp), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2910 0 discriminator 3
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
	movss	.LC2(%rip), %xmm0
	divss	-16(%rbp), %xmm0
	movss	%xmm0, 4(%rax)
	.loc 1 2911 0 discriminator 3
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
	pxor	%xmm0, %xmm0
	movss	%xmm0, 8(%rax)
	.loc 1 2912 0 discriminator 3
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
	pxor	%xmm0, %xmm0
	movss	%xmm0, 12(%rax)
	.loc 1 2907 0 discriminator 3
	addl	$1, -4(%rbp)
.L484:
	.loc 1 2907 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L485
	.loc 1 2873 0 is_stmt 1 discriminator 2
	addl	$1, -8(%rbp)
.L479:
	.loc 1 2873 0 is_stmt 0 discriminator 1
	movl	-8(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L486
	.loc 1 2918 0 is_stmt 1
	movl	$0, -4(%rbp)
	jmp	.L487
.L494:
	.loc 1 2920 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 2921 0
	pxor	%xmm0, %xmm0
	cvtsi2ss	-4(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ss	-52(%rbp), %xmm1
	divss	%xmm1, %xmm0
	movaps	%xmm0, %xmm1
	movl	nx(%rip), %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	%xmm1, %xmm0
	movss	.LC2(%rip), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -24(%rbp)
	.loc 1 2922 0
	movl	-4(%rbp), %eax
	addl	$1, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ss	-52(%rbp), %xmm1
	divss	%xmm1, %xmm0
	movaps	%xmm0, %xmm1
	movl	nx(%rip), %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	%xmm1, %xmm0
	movss	%xmm0, -28(%rbp)
	.loc 1 2924 0
	cvtss2sd	-24(%rbp), %xmm0
	call	floor@PLT
	cvttsd2si	%xmm0, %eax
	movl	%eax, -32(%rbp)
	.loc 1 2925 0
	movl	$1, %eax
	cmpl	$0, -32(%rbp)
	cmovg	-32(%rbp), %eax
	movl	%eax, -32(%rbp)
	.loc 1 2926 0
	cvtss2sd	-28(%rbp), %xmm0
	call	ceil@PLT
	cvttsd2si	%xmm0, %eax
	movl	%eax, -36(%rbp)
	.loc 1 2927 0
	movl	nx(%rip), %eax
	cmpl	%eax, -36(%rbp)
	cmovle	-36(%rbp), %eax
	movl	%eax, -36(%rbp)
	.loc 1 2929 0
	movq	chan_width_y(%rip), %rax
	movl	-32(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	subq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %edx
	.loc 1 2930 0
	movq	chan_width_y(%rip), %rax
	movl	-32(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rax
	movl	(%rax), %eax
	.loc 1 2929 0
	addl	%edx, %eax
	.loc 1 2930 0
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC73(%rip), %xmm1
	divsd	%xmm1, %xmm0
	.loc 1 2929 0
	cvtsd2ss	%xmm0, %xmm3
	movss	%xmm3, -20(%rbp)
	.loc 1 2931 0
	cmpl	$1, -32(%rbp)
	jne	.L488
	.loc 1 2932 0
	cvtss2sd	-20(%rbp), %xmm1
	movq	chan_width_y(%rip), %rax
	movl	(%rax), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC73(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm4
	movss	%xmm4, -20(%rbp)
.L488:
	.loc 1 2934 0
	pxor	%xmm0, %xmm0
	cvtsi2ss	-32(%rbp), %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	.LC2(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, -40(%rbp)
	.loc 1 2935 0
	movss	-40(%rbp), %xmm0
	mulss	-20(%rbp), %xmm0
	movss	-16(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 2937 0
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.L489
.L490:
	.loc 1 2940 0 discriminator 3
	movq	chan_width_y(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	subq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	chan_width_y(%rip), %rax
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rax
	movl	(%rax), %eax
	addl	%edx, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC73(%rip), %xmm1
	divsd	%xmm1, %xmm0
	.loc 1 2939 0 discriminator 3
	cvtsd2ss	%xmm0, %xmm5
	movss	%xmm5, -20(%rbp)
	.loc 1 2941 0 discriminator 3
	movss	-16(%rbp), %xmm0
	addss	-20(%rbp), %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 2937 0 discriminator 3
	addl	$1, -12(%rbp)
.L489:
	.loc 1 2937 0 is_stmt 0 discriminator 1
	movl	-12(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L490
	.loc 1 2944 0 is_stmt 1
	movq	chan_width_y(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	subq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %edx
	.loc 1 2945 0
	movq	chan_width_y(%rip), %rax
	movl	-36(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rax
	movl	(%rax), %eax
	.loc 1 2944 0
	addl	%edx, %eax
	.loc 1 2945 0
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC73(%rip), %xmm1
	divsd	%xmm1, %xmm0
	.loc 1 2944 0
	cvtsd2ss	%xmm0, %xmm6
	movss	%xmm6, -20(%rbp)
	.loc 1 2946 0
	movl	nx(%rip), %eax
	cmpl	%eax, -36(%rbp)
	jne	.L491
	.loc 1 2947 0
	cvtss2sd	-20(%rbp), %xmm1
	movq	chan_width_y(%rip), %rax
	movl	nx(%rip), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC73(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm7
	movss	%xmm7, -20(%rbp)
.L491:
	.loc 1 2949 0
	pxor	%xmm0, %xmm0
	cvtsi2ss	-36(%rbp), %xmm0
	subss	-28(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, -40(%rbp)
	.loc 1 2950 0
	movss	-40(%rbp), %xmm0
	mulss	-20(%rbp), %xmm0
	movss	-16(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -16(%rbp)
	.loc 1 2952 0
	movl	$0, -8(%rbp)
	jmp	.L492
.L493:
	.loc 1 2954 0 discriminator 3
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
	movss	-16(%rbp), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2955 0 discriminator 3
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
	movss	.LC2(%rip), %xmm0
	divss	-16(%rbp), %xmm0
	movss	%xmm0, 4(%rax)
	.loc 1 2956 0 discriminator 3
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
	pxor	%xmm0, %xmm0
	movss	%xmm0, 8(%rax)
	.loc 1 2957 0 discriminator 3
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
	pxor	%xmm0, %xmm0
	movss	%xmm0, 12(%rax)
	.loc 1 2952 0 discriminator 3
	addl	$1, -8(%rbp)
.L492:
	.loc 1 2952 0 is_stmt 0 discriminator 1
	movl	-8(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L493
	.loc 1 2918 0 is_stmt 1 discriminator 2
	addl	$1, -4(%rbp)
.L487:
	.loc 1 2918 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L494
	.loc 1 2964 0 is_stmt 1
	movl	nx(%rip), %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ss	-52(%rbp), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -44(%rbp)
	.loc 1 2965 0
	movl	ny(%rip), %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ss	-52(%rbp), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -48(%rbp)
	.loc 1 2967 0
	movq	place_region_bounds_x(%rip), %rax
	movss	.LC44(%rip), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2968 0
	movq	place_region_bounds_y(%rip), %rax
	movss	.LC44(%rip), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2970 0
	movl	$1, -4(%rbp)
	jmp	.L495
.L496:
	.loc 1 2972 0 discriminator 3
	movq	place_region_bounds_x(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movq	place_region_bounds_x(%rip), %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	subq	$4, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	addss	-44(%rbp), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 2973 0 discriminator 3
	movq	place_region_bounds_y(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 2974 0 discriminator 3
	movq	place_region_bounds_y(%rip), %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	subq	$4, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	addss	-48(%rbp), %xmm0
	.loc 1 2973 0 discriminator 3
	movss	%xmm0, (%rax)
	.loc 1 2970 0 discriminator 3
	addl	$1, -4(%rbp)
.L495:
	.loc 1 2970 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jle	.L496
	.loc 1 2976 0 is_stmt 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	load_place_regions, .-load_place_regions
	.type	free_unique_pin_list, @function
free_unique_pin_list:
.LFB29:
	.loc 1 2981 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 2987 0
	movl	$0, -4(%rbp)
	.loc 1 2989 0
	movl	$0, -8(%rbp)
	jmp	.L498
.L500:
	.loc 1 2991 0
	movq	duplicate_pins(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L499
	.loc 1 2993 0
	movq	unique_pin_list(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 2994 0
	movl	$1, -4(%rbp)
.L499:
	.loc 1 2989 0 discriminator 2
	addl	$1, -8(%rbp)
.L498:
	.loc 1 2989 0 is_stmt 0 discriminator 1
	movl	num_nets(%rip), %eax
	cmpl	%eax, -8(%rbp)
	jl	.L500
	.loc 1 2998 0 is_stmt 1
	cmpl	$0, -4(%rbp)
	je	.L501
	.loc 1 2999 0
	movq	unique_pin_list(%rip), %rax
	movq	%rax, %rdi
	call	free@PLT
.L501:
	.loc 1 3001 0
	movq	duplicate_pins(%rip), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 3002 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	free_unique_pin_list, .-free_unique_pin_list
	.type	alloc_and_load_unique_pin_list, @function
alloc_and_load_unique_pin_list:
.LFB30:
	.loc 1 3007 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	.loc 1 3019 0
	movl	num_nets(%rip), %eax
	cltq
	movl	$4, %esi
	movq	%rax, %rdi
	call	my_calloc@PLT
	movq	%rax, duplicate_pins(%rip)
	.loc 1 3020 0
	movl	num_blocks(%rip), %eax
	cltq
	movl	$4, %esi
	movq	%rax, %rdi
	call	my_calloc@PLT
	movq	%rax, -48(%rbp)
	.loc 1 3021 0
	movl	$0, -32(%rbp)
	.loc 1 3023 0
	movl	$0, -20(%rbp)
	jmp	.L503
.L515:
	.loc 1 3026 0
	movl	$0, -28(%rbp)
	.loc 1 3028 0
	movl	$0, -24(%rbp)
	jmp	.L504
.L506:
	.loc 1 3030 0
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -52(%rbp)
	.loc 1 3031 0
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	.loc 1 3032 0
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jle	.L505
	.loc 1 3033 0
	addl	$1, -28(%rbp)
.L505:
	.loc 1 3028 0 discriminator 2
	addl	$1, -24(%rbp)
.L504:
	.loc 1 3028 0 is_stmt 0 discriminator 1
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cmpl	-24(%rbp), %eax
	jge	.L506
	.loc 1 3036 0 is_stmt 1
	cmpl	$0, -28(%rbp)
	jle	.L507
	.loc 1 3038 0
	movq	duplicate_pins(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	movl	-28(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 3040 0
	cmpl	$0, -32(%rbp)
	jne	.L508
	.loc 1 3043 0
	movl	num_nets(%rip), %eax
	cltq
	movl	$8, %esi
	movq	%rax, %rdi
	call	my_calloc@PLT
	.loc 1 3042 0
	movq	%rax, unique_pin_list(%rip)
	.loc 1 3044 0
	movl	$1, -32(%rbp)
.L508:
	.loc 1 3047 0
	movq	unique_pin_list(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rbx
	.loc 1 3048 0
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	addl	$1, %eax
	subl	-28(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	.loc 1 3047 0
	movq	%rax, (%rbx)
	.loc 1 3051 0
	movl	$0, -36(%rbp)
	.loc 1 3052 0
	movl	$0, -24(%rbp)
	jmp	.L509
.L511:
	.loc 1 3054 0
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -52(%rbp)
	.loc 1 3055 0
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L510
	.loc 1 3057 0
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, (%rax)
	.loc 1 3058 0
	movq	unique_pin_list(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	movl	-52(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 3059 0
	addl	$1, -36(%rbp)
.L510:
	.loc 1 3052 0 discriminator 2
	addl	$1, -24(%rbp)
.L509:
	.loc 1 3052 0 is_stmt 0 discriminator 1
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cmpl	-24(%rbp), %eax
	jge	.L511
	jmp	.L512
.L507:
	.loc 1 3066 0 is_stmt 1
	movl	$0, -24(%rbp)
	jmp	.L513
.L514:
	.loc 1 3068 0 discriminator 3
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -52(%rbp)
	.loc 1 3069 0 discriminator 3
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, (%rax)
	.loc 1 3066 0 discriminator 3
	addl	$1, -24(%rbp)
.L513:
	.loc 1 3066 0 is_stmt 0 discriminator 1
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cmpl	-24(%rbp), %eax
	jge	.L514
.L512:
	.loc 1 3023 0 is_stmt 1 discriminator 2
	addl	$1, -20(%rbp)
.L503:
	.loc 1 3023 0 is_stmt 0 discriminator 1
	movl	num_nets(%rip), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L515
	.loc 1 3074 0 is_stmt 1
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 3075 0
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	alloc_and_load_unique_pin_list, .-alloc_and_load_unique_pin_list
	.type	get_bb_from_scratch, @function
get_bb_from_scratch:
.LFB31:
	.loc 1 3082 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	.loc 1 3098 0
	movq	duplicate_pins(%rip), %rax
	movl	-68(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L517
	.loc 1 3100 0
	movq	net(%rip), %rcx
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movq	%rax, -48(%rbp)
	.loc 1 3101 0
	movq	net(%rip), %rcx
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	.L518
.L517:
	.loc 1 3105 0
	movq	unique_pin_list(%rip), %rax
	movl	-68(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	.loc 1 3106 0
	movq	net(%rip), %rcx
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	leal	1(%rax), %ecx
	movq	duplicate_pins(%rip), %rax
	movl	-68(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -40(%rbp)
.L518:
	.loc 1 3109 0
	movq	block(%rip), %rcx
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	24(%rax), %eax
	movl	%eax, -52(%rbp)
	.loc 1 3110 0
	movq	block(%rip), %rcx
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	28(%rax), %eax
	movl	%eax, -56(%rbp)
	.loc 1 3112 0
	movl	nx(%rip), %eax
	cmpl	%eax, -52(%rbp)
	cmovle	-52(%rbp), %eax
	movl	$1, %edx
	testl	%eax, %eax
	cmovle	%edx, %eax
	movl	%eax, -52(%rbp)
	.loc 1 3113 0
	movl	ny(%rip), %eax
	cmpl	%eax, -56(%rbp)
	cmovle	-56(%rbp), %eax
	movl	$1, %edx
	testl	%eax, %eax
	cmovle	%edx, %eax
	movl	%eax, -56(%rbp)
	.loc 1 3115 0
	movl	-52(%rbp), %eax
	movl	%eax, -8(%rbp)
	.loc 1 3116 0
	movl	-56(%rbp), %eax
	movl	%eax, -16(%rbp)
	.loc 1 3117 0
	movl	-52(%rbp), %eax
	movl	%eax, -12(%rbp)
	.loc 1 3118 0
	movl	-56(%rbp), %eax
	movl	%eax, -20(%rbp)
	.loc 1 3119 0
	movl	$1, -24(%rbp)
	.loc 1 3120 0
	movl	$1, -32(%rbp)
	.loc 1 3121 0
	movl	$1, -28(%rbp)
	.loc 1 3122 0
	movl	$1, -36(%rbp)
	.loc 1 3124 0
	movl	$1, -4(%rbp)
	jmp	.L519
.L528:
	.loc 1 3127 0
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -60(%rbp)
	.loc 1 3128 0
	movq	block(%rip), %rcx
	movl	-60(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	24(%rax), %eax
	movl	%eax, -52(%rbp)
	.loc 1 3129 0
	movq	block(%rip), %rcx
	movl	-60(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	28(%rax), %eax
	movl	%eax, -56(%rbp)
	.loc 1 3138 0
	movl	nx(%rip), %eax
	cmpl	%eax, -52(%rbp)
	cmovle	-52(%rbp), %eax
	movl	$1, %edx
	testl	%eax, %eax
	cmovle	%edx, %eax
	movl	%eax, -52(%rbp)
	.loc 1 3139 0
	movl	ny(%rip), %eax
	cmpl	%eax, -56(%rbp)
	cmovle	-56(%rbp), %eax
	movl	$1, %edx
	testl	%eax, %eax
	cmovle	%edx, %eax
	movl	%eax, -56(%rbp)
	.loc 1 3141 0
	movl	-52(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jne	.L520
	.loc 1 3143 0
	addl	$1, -24(%rbp)
.L520:
	.loc 1 3145 0
	movl	-52(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jne	.L521
	.loc 1 3147 0
	addl	$1, -28(%rbp)
	jmp	.L522
.L521:
	.loc 1 3149 0
	movl	-52(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.L523
	.loc 1 3151 0
	movl	-52(%rbp), %eax
	movl	%eax, -8(%rbp)
	.loc 1 3152 0
	movl	$1, -24(%rbp)
	jmp	.L522
.L523:
	.loc 1 3154 0
	movl	-52(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jle	.L522
	.loc 1 3156 0
	movl	-52(%rbp), %eax
	movl	%eax, -12(%rbp)
	.loc 1 3157 0
	movl	$1, -28(%rbp)
.L522:
	.loc 1 3160 0
	movl	-56(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jne	.L524
	.loc 1 3162 0
	addl	$1, -32(%rbp)
.L524:
	.loc 1 3164 0
	movl	-56(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jne	.L525
	.loc 1 3166 0
	addl	$1, -36(%rbp)
	jmp	.L526
.L525:
	.loc 1 3168 0
	movl	-56(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.L527
	.loc 1 3170 0
	movl	-56(%rbp), %eax
	movl	%eax, -16(%rbp)
	.loc 1 3171 0
	movl	$1, -32(%rbp)
	jmp	.L526
.L527:
	.loc 1 3173 0
	movl	-56(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jle	.L526
	.loc 1 3175 0
	movl	-56(%rbp), %eax
	movl	%eax, -20(%rbp)
	.loc 1 3176 0
	movl	$1, -36(%rbp)
.L526:
	.loc 1 3124 0 discriminator 2
	addl	$1, -4(%rbp)
.L519:
	.loc 1 3124 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L528
	.loc 1 3183 0 is_stmt 1
	movq	-80(%rbp), %rax
	movl	-8(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 3184 0
	movq	-80(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, 4(%rax)
	.loc 1 3185 0
	movq	-80(%rbp), %rax
	movl	-16(%rbp), %edx
	movl	%edx, 8(%rax)
	.loc 1 3186 0
	movq	-80(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 12(%rax)
	.loc 1 3188 0
	movq	-88(%rbp), %rax
	movl	-24(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 3189 0
	movq	-88(%rbp), %rax
	movl	-28(%rbp), %edx
	movl	%edx, 4(%rax)
	.loc 1 3190 0
	movq	-88(%rbp), %rax
	movl	-32(%rbp), %edx
	movl	%edx, 8(%rax)
	.loc 1 3191 0
	movq	-88(%rbp), %rax
	movl	-36(%rbp), %edx
	movl	%edx, 12(%rax)
	.loc 1 3192 0
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	get_bb_from_scratch, .-get_bb_from_scratch
	.type	get_net_wirelength_estimate, @function
get_net_wirelength_estimate:
.LFB32:
	.loc 1 3198 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 3208 0
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	addl	$1, %eax
	cmpl	$50, %eax
	jle	.L530
	.loc 1 3208 0 is_stmt 0 discriminator 1
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	addl	$1, %eax
	cmpl	$84, %eax
	jg	.L530
	.loc 1 3210 0 is_stmt 1
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	subl	$49, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC68(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	.LC69(%rip), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L531
.L530:
	.loc 1 3212 0
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	addl	$1, %eax
	cmpl	$84, %eax
	jle	.L532
	.loc 1 3215 0
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	addl	$1, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC74(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	.LC69(%rip), %xmm1
	addsd	%xmm1, %xmm0
	.loc 1 3216 0
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	addl	$1, %eax
	pxor	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	movsd	.LC75(%rip), %xmm2
	mulsd	%xmm1, %xmm2
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	addl	$1, %eax
	pxor	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	mulsd	%xmm2, %xmm1
	.loc 1 3214 0
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L531
.L532:
	.loc 1 3221 0
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	cross_count(%rip), %rax
	movss	(%rdx,%rax), %xmm0
	cvtss2sd	%xmm0, %xmm3
	movsd	%xmm3, -8(%rbp)
.L531:
	.loc 1 3231 0
	movq	-32(%rbp), %rax
	movl	4(%rax), %edx
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$1, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	mulsd	-8(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	.loc 1 3233 0
	movq	-32(%rbp), %rax
	movl	12(%rax), %edx
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$1, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	mulsd	-8(%rbp), %xmm0
	movsd	-16(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	.loc 1 3235 0
	movsd	-16(%rbp), %xmm0
	.loc 1 3236 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	get_net_wirelength_estimate, .-get_net_wirelength_estimate
	.type	get_net_cost, @function
get_net_cost:
.LFB33:
	.loc 1 3242 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 3252 0
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	addl	$1, %eax
	cmpl	$50, %eax
	jle	.L535
	.loc 1 3254 0
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	subl	$49, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC68(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	.LC69(%rip), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm2
	movss	%xmm2, -4(%rbp)
	jmp	.L536
.L535:
	.loc 1 3259 0
	movq	net(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	cross_count(%rip), %rax
	movss	(%rdx,%rax), %xmm0
	movss	%xmm0, -4(%rbp)
.L536:
	.loc 1 3269 0
	movq	-32(%rbp), %rax
	movl	4(%rax), %edx
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$1, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	-4(%rbp), %xmm0
	.loc 1 3270 0
	movq	chanx_place_cost_fac(%rip), %rdx
	movq	-32(%rbp), %rax
	movl	12(%rax), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	cltq
	salq	$2, %rax
	subq	$4, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	.loc 1 3269 0
	mulss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	.loc 1 3272 0
	movq	-32(%rbp), %rax
	movl	12(%rax), %edx
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$1, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	-4(%rbp), %xmm0
	.loc 1 3273 0
	movq	chany_place_cost_fac(%rip), %rdx
	movq	-32(%rbp), %rax
	movl	4(%rax), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$2, %rax
	subq	$4, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	.loc 1 3272 0
	mulss	%xmm1, %xmm0
	movss	-8(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	.loc 1 3275 0
	movss	-8(%rbp), %xmm0
	.loc 1 3276 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	get_net_cost, .-get_net_cost
	.type	get_non_updateable_bb, @function
get_non_updateable_bb:
.LFB34:
	.loc 1 3282 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 1 3295 0
	movq	block(%rip), %rcx
	movq	net(%rip), %rsi
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	movq	16(%rax), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	24(%rax), %eax
	movl	%eax, -24(%rbp)
	.loc 1 3296 0
	movq	block(%rip), %rcx
	movq	net(%rip), %rsi
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	movq	16(%rax), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	28(%rax), %eax
	movl	%eax, -28(%rbp)
	.loc 1 3298 0
	movl	-24(%rbp), %eax
	movl	%eax, -16(%rbp)
	.loc 1 3299 0
	movl	-28(%rbp), %eax
	movl	%eax, -20(%rbp)
	.loc 1 3300 0
	movl	-24(%rbp), %eax
	movl	%eax, -8(%rbp)
	.loc 1 3301 0
	movl	-28(%rbp), %eax
	movl	%eax, -12(%rbp)
	.loc 1 3303 0
	movl	$1, -4(%rbp)
	jmp	.L539
.L544:
	.loc 1 3305 0
	movq	block(%rip), %rcx
	movq	net(%rip), %rsi
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	movq	16(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	24(%rax), %eax
	movl	%eax, -24(%rbp)
	.loc 1 3306 0
	movq	block(%rip), %rcx
	movq	net(%rip), %rsi
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	movq	16(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	28(%rax), %eax
	movl	%eax, -28(%rbp)
	.loc 1 3308 0
	movl	-24(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.L540
	.loc 1 3310 0
	movl	-24(%rbp), %eax
	movl	%eax, -16(%rbp)
	jmp	.L541
.L540:
	.loc 1 3312 0
	movl	-24(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.L541
	.loc 1 3314 0
	movl	-24(%rbp), %eax
	movl	%eax, -8(%rbp)
.L541:
	.loc 1 3317 0
	movl	-28(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.L542
	.loc 1 3319 0
	movl	-28(%rbp), %eax
	movl	%eax, -20(%rbp)
	jmp	.L543
.L542:
	.loc 1 3321 0
	movl	-28(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jle	.L543
	.loc 1 3323 0
	movl	-28(%rbp), %eax
	movl	%eax, -12(%rbp)
.L543:
	.loc 1 3303 0 discriminator 2
	addl	$1, -4(%rbp)
.L539:
	.loc 1 3303 0 is_stmt 0 discriminator 1
	movq	net(%rip), %rcx
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	addl	$1, %eax
	cmpl	-4(%rbp), %eax
	jg	.L544
	.loc 1 3334 0 is_stmt 1
	movl	nx(%rip), %eax
	cmpl	%eax, -16(%rbp)
	cmovle	-16(%rbp), %eax
	movl	$1, %edx
	testl	%eax, %eax
	cmovg	%eax, %edx
	movq	-48(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 3335 0
	movl	ny(%rip), %eax
	cmpl	%eax, -20(%rbp)
	cmovle	-20(%rbp), %eax
	movl	$1, %edx
	testl	%eax, %eax
	cmovg	%eax, %edx
	movq	-48(%rbp), %rax
	movl	%edx, 8(%rax)
	.loc 1 3336 0
	movl	nx(%rip), %eax
	cmpl	%eax, -8(%rbp)
	cmovle	-8(%rbp), %eax
	movl	$1, %edx
	testl	%eax, %eax
	cmovg	%eax, %edx
	movq	-48(%rbp), %rax
	movl	%edx, 4(%rax)
	.loc 1 3337 0
	movl	ny(%rip), %eax
	cmpl	%eax, -12(%rbp)
	cmovle	-12(%rbp), %eax
	movl	$1, %edx
	testl	%eax, %eax
	cmovg	%eax, %edx
	movq	-48(%rbp), %rax
	movl	%edx, 12(%rax)
	.loc 1 3338 0
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	get_non_updateable_bb, .-get_non_updateable_bb
	.type	update_bb, @function
update_bb:
.LFB35:
	.loc 1 3349 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -8(%rbp)
	movl	%r8d, -28(%rbp)
	movl	%r9d, -32(%rbp)
	.loc 1 3364 0
	movl	nx(%rip), %eax
	cmpl	%eax, -32(%rbp)
	cmovle	-32(%rbp), %eax
	movl	$1, %edx
	testl	%eax, %eax
	cmovle	%edx, %eax
	movl	%eax, -32(%rbp)
	.loc 1 3365 0
	movl	ny(%rip), %eax
	cmpl	%eax, 16(%rbp)
	cmovle	16(%rbp), %eax
	movl	$1, %edx
	testl	%eax, %eax
	cmovle	%edx, %eax
	movl	%eax, 16(%rbp)
	.loc 1 3366 0
	movl	nx(%rip), %eax
	cmpl	%eax, -8(%rbp)
	cmovle	-8(%rbp), %eax
	movl	$1, %edx
	testl	%eax, %eax
	cmovle	%edx, %eax
	movl	%eax, -8(%rbp)
	.loc 1 3367 0
	movl	ny(%rip), %eax
	cmpl	%eax, -28(%rbp)
	cmovle	-28(%rbp), %eax
	movl	$1, %edx
	testl	%eax, %eax
	cmovle	%edx, %eax
	movl	%eax, -28(%rbp)
	.loc 1 3371 0
	movl	-32(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.L546
	.loc 1 3376 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	4(%rax), %eax
	cmpl	-8(%rbp), %eax
	jne	.L547
	.loc 1 3378 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	4(%rax), %eax
	cmpl	$1, %eax
	jne	.L548
	.loc 1 3380 0
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movl	-4(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	get_bb_from_scratch
	.loc 1 3382 0
	jmp	.L545
.L548:
	.loc 1 3387 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	4(%rax), %eax
	leal	-1(%rax), %edx
	.loc 1 3386 0
	movq	-24(%rbp), %rax
	movl	%edx, 4(%rax)
	.loc 1 3388 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	4(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 4(%rax)
	jmp	.L550
.L547:
	.loc 1 3394 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	4(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 4(%rax)
	.loc 1 3395 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	4(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 4(%rax)
.L550:
	.loc 1 3400 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	-32(%rbp), %eax
	jle	.L551
	.loc 1 3402 0
	movq	-16(%rbp), %rax
	movl	-32(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 3403 0
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	jmp	.L554
.L551:
	.loc 1 3406 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	-32(%rbp), %eax
	jne	.L553
	.loc 1 3408 0
	movq	-16(%rbp), %rax
	movl	-32(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 3409 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L554
.L553:
	.loc 1 3414 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 3415 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L554
.L546:
	.loc 1 3420 0
	movl	-32(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.L555
	.loc 1 3425 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	-8(%rbp), %eax
	jne	.L556
	.loc 1 3427 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L557
	.loc 1 3429 0
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movl	-4(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	get_bb_from_scratch
	.loc 1 3431 0
	jmp	.L545
.L557:
	.loc 1 3436 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	leal	-1(%rax), %edx
	.loc 1 3435 0
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 3437 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L558
.L556:
	.loc 1 3443 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 3444 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
.L558:
	.loc 1 3449 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	4(%rax), %eax
	cmpl	-32(%rbp), %eax
	jge	.L559
	.loc 1 3451 0
	movq	-16(%rbp), %rax
	movl	-32(%rbp), %edx
	movl	%edx, 4(%rax)
	.loc 1 3452 0
	movq	-24(%rbp), %rax
	movl	$1, 4(%rax)
	jmp	.L554
.L559:
	.loc 1 3455 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	4(%rax), %eax
	cmpl	-32(%rbp), %eax
	jne	.L561
	.loc 1 3457 0
	movq	-16(%rbp), %rax
	movl	-32(%rbp), %edx
	movl	%edx, 4(%rax)
	.loc 1 3458 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	4(%rax), %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 4(%rax)
	jmp	.L554
.L561:
	.loc 1 3463 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	4(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 4(%rax)
	.loc 1 3464 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	4(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 4(%rax)
	jmp	.L554
.L555:
	.loc 1 3470 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 3471 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	4(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 4(%rax)
	.loc 1 3472 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 3473 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	4(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 4(%rax)
.L554:
	.loc 1 3478 0
	movl	16(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.L562
	.loc 1 3483 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	12(%rax), %eax
	cmpl	-28(%rbp), %eax
	jne	.L563
	.loc 1 3485 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	12(%rax), %eax
	cmpl	$1, %eax
	jne	.L564
	.loc 1 3487 0
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movl	-4(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	get_bb_from_scratch
	.loc 1 3489 0
	jmp	.L545
.L564:
	.loc 1 3494 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	12(%rax), %eax
	leal	-1(%rax), %edx
	.loc 1 3493 0
	movq	-24(%rbp), %rax
	movl	%edx, 12(%rax)
	.loc 1 3495 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	12(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 12(%rax)
	jmp	.L565
.L563:
	.loc 1 3501 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	12(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 12(%rax)
	.loc 1 3502 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	12(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 12(%rax)
.L565:
	.loc 1 3507 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	8(%rax), %eax
	cmpl	16(%rbp), %eax
	jle	.L566
	.loc 1 3509 0
	movq	-16(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 8(%rax)
	.loc 1 3510 0
	movq	-24(%rbp), %rax
	movl	$1, 8(%rax)
	jmp	.L545
.L566:
	.loc 1 3513 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	8(%rax), %eax
	cmpl	16(%rbp), %eax
	jne	.L568
	.loc 1 3515 0
	movq	-16(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 8(%rax)
	.loc 1 3516 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	8(%rax), %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 8(%rax)
	jmp	.L545
.L568:
	.loc 1 3521 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	8(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 8(%rax)
	.loc 1 3522 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	8(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 8(%rax)
	jmp	.L545
.L562:
	.loc 1 3526 0
	movl	16(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jle	.L569
	.loc 1 3531 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	8(%rax), %eax
	cmpl	-28(%rbp), %eax
	jne	.L570
	.loc 1 3533 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	8(%rax), %eax
	cmpl	$1, %eax
	jne	.L571
	.loc 1 3535 0
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movl	-4(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	get_bb_from_scratch
	.loc 1 3537 0
	jmp	.L545
.L571:
	.loc 1 3542 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	8(%rax), %eax
	leal	-1(%rax), %edx
	.loc 1 3541 0
	movq	-24(%rbp), %rax
	movl	%edx, 8(%rax)
	.loc 1 3543 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	8(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 8(%rax)
	jmp	.L572
.L570:
	.loc 1 3549 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	8(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 8(%rax)
	.loc 1 3550 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	8(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 8(%rax)
.L572:
	.loc 1 3555 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	12(%rax), %eax
	cmpl	16(%rbp), %eax
	jge	.L573
	.loc 1 3557 0
	movq	-16(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 12(%rax)
	.loc 1 3558 0
	movq	-24(%rbp), %rax
	movl	$1, 12(%rax)
	jmp	.L545
.L573:
	.loc 1 3561 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	12(%rax), %eax
	cmpl	16(%rbp), %eax
	jne	.L575
	.loc 1 3563 0
	movq	-16(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 12(%rax)
	.loc 1 3564 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	12(%rax), %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 12(%rax)
	jmp	.L545
.L575:
	.loc 1 3569 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	12(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 12(%rax)
	.loc 1 3570 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	12(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 12(%rax)
	jmp	.L545
.L569:
	.loc 1 3576 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	8(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 8(%rax)
	.loc 1 3577 0
	movq	bb_coords(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	12(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 12(%rax)
	.loc 1 3578 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	8(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 8(%rax)
	.loc 1 3579 0
	movq	bb_num_on_edges(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movl	12(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 12(%rax)
.L545:
	.loc 1 3581 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	update_bb, .-update_bb
	.section	.rodata
.LC76:
	.string	"count[type_index] > 0"
.LC77:
	.string	"grid[i][j].blocks != NULL"
	.text
	.type	initial_placement, @function
initial_placement:
.LFB36:
	.loc 1 3587 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 3, -24
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	.loc 1 3600 0
	movl	num_types(%rip), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	movq	%rax, -40(%rbp)
	.loc 1 3601 0
	movl	num_types(%rip), %eax
	cltq
	movl	$4, %esi
	movq	%rax, %rdi
	call	my_calloc@PLT
	movq	%rax, -48(%rbp)
	.loc 1 3602 0
	movl	num_types(%rip), %eax
	cltq
	movl	$4, %esi
	movq	%rax, %rdi
	call	my_calloc@PLT
	movq	%rax, -56(%rbp)
	.loc 1 3606 0
	movl	$0, -20(%rbp)
	jmp	.L577
.L583:
	.loc 1 3608 0
	movl	$0, -24(%rbp)
	jmp	.L578
.L582:
	.loc 1 3610 0
	movq	grid(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	$0, 12(%rax)
	.loc 1 3611 0
	movl	$0, -28(%rbp)
	jmp	.L579
.L581:
	.loc 1 3613 0
	movq	grid(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	$-1, (%rax)
	.loc 1 3614 0
	movq	grid(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jne	.L580
	.loc 1 3616 0
	movq	grid(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	144(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
.L580:
	.loc 1 3611 0 discriminator 2
	addl	$1, -28(%rbp)
.L579:
	.loc 1 3611 0 is_stmt 0 discriminator 1
	movq	grid(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	12(%rax), %eax
	cmpl	-28(%rbp), %eax
	jg	.L581
	.loc 1 3608 0 is_stmt 1 discriminator 2
	addl	$1, -24(%rbp)
.L578:
	.loc 1 3608 0 is_stmt 0 discriminator 1
	movl	ny(%rip), %eax
	addl	$1, %eax
	cmpl	-24(%rbp), %eax
	jge	.L582
	.loc 1 3606 0 is_stmt 1 discriminator 2
	addl	$1, -20(%rbp)
.L577:
	.loc 1 3606 0 is_stmt 0 discriminator 1
	movl	nx(%rip), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L583
	.loc 1 3622 0 is_stmt 1
	movl	$0, -20(%rbp)
	jmp	.L584
.L585:
	.loc 1 3624 0 discriminator 3
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	.loc 1 3625 0 discriminator 3
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	.loc 1 3624 0 discriminator 3
	movq	%rax, (%rbx)
	.loc 1 3622 0 discriminator 3
	addl	$1, -20(%rbp)
.L584:
	.loc 1 3622 0 is_stmt 0 discriminator 1
	movl	num_types(%rip), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L585
	.loc 1 3628 0 is_stmt 1
	movl	$0, -20(%rbp)
	jmp	.L586
.L592:
	.loc 1 3630 0
	movl	$0, -24(%rbp)
	jmp	.L587
.L591:
	.loc 1 3632 0
	movl	$0, -28(%rbp)
	jmp	.L588
.L590:
	.loc 1 3634 0
	movq	grid(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jne	.L589
	.loc 1 3636 0
	movq	grid(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	144(%rax), %eax
	movl	%eax, -60(%rbp)
	.loc 1 3637 0
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-20(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 3638 0
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-24(%rbp), %eax
	movl	%eax, 4(%rdx)
	.loc 1 3639 0
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-28(%rbp), %eax
	movl	%eax, 8(%rdx)
	.loc 1 3640 0
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
.L589:
	.loc 1 3632 0 discriminator 2
	addl	$1, -28(%rbp)
.L588:
	.loc 1 3632 0 is_stmt 0 discriminator 1
	movq	grid(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	12(%rax), %eax
	cmpl	-28(%rbp), %eax
	jg	.L590
	.loc 1 3630 0 is_stmt 1 discriminator 2
	addl	$1, -24(%rbp)
.L587:
	.loc 1 3630 0 is_stmt 0 discriminator 1
	movl	ny(%rip), %eax
	addl	$1, %eax
	cmpl	-24(%rbp), %eax
	jge	.L591
	.loc 1 3628 0 is_stmt 1 discriminator 2
	addl	$1, -20(%rbp)
.L586:
	.loc 1 3628 0 is_stmt 0 discriminator 1
	movl	nx(%rip), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L592
	.loc 1 3646 0 is_stmt 1
	movl	$0, -32(%rbp)
	jmp	.L593
.L597:
	.loc 1 3649 0
	movq	block(%rip), %rcx
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rdx
	movq	IO_TYPE(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L594
	.loc 1 3649 0 is_stmt 0 discriminator 1
	cmpl	$2, -84(%rbp)
	je	.L595
.L594:
	.loc 1 3651 0 is_stmt 1
	movq	block(%rip), %rcx
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rax
	movl	144(%rax), %eax
	movl	%eax, -60(%rbp)
	.loc 1 3652 0
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jg	.L596
	.loc 1 3652 0 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.5286(%rip), %rcx
	movl	$3652, %edx
	leaq	.LC40(%rip), %rsi
	leaq	.LC76(%rip), %rdi
	call	__assert_fail@PLT
.L596:
	.loc 1 3653 0 is_stmt 1
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	my_irand@PLT
	movl	%eax, -64(%rbp)
	.loc 1 3654 0
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-64(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, -68(%rbp)
	.loc 1 3655 0
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-64(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	movl	4(%rax), %eax
	movl	%eax, -72(%rbp)
	.loc 1 3656 0
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-64(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	movl	8(%rax), %eax
	movl	%eax, -76(%rbp)
	.loc 1 3657 0
	movq	grid(%rip), %rax
	movl	-68(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-72(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	-76(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	movl	-32(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 3658 0
	movq	grid(%rip), %rax
	movl	-68(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-72(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	12(%rax), %edx
	addl	$1, %edx
	movl	%edx, 12(%rax)
	.loc 1 3661 0
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-64(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rsi
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movslq	%eax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	salq	$2, %rax
	subq	$12, %rax
	addq	%rsi, %rax
	movq	(%rax), %rcx
	movq	%rcx, (%rdx)
	movl	8(%rax), %eax
	movl	%eax, 8(%rdx)
	.loc 1 3662 0
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	subl	$1, %edx
	movl	%edx, (%rax)
.L595:
	.loc 1 3646 0 discriminator 2
	addl	$1, -32(%rbp)
.L593:
	.loc 1 3646 0 is_stmt 0 discriminator 1
	movl	num_blocks(%rip), %eax
	cmpl	%eax, -32(%rbp)
	jl	.L597
	.loc 1 3666 0 is_stmt 1
	cmpl	$2, -84(%rbp)
	jne	.L598
	.loc 1 3668 0
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	read_user_pad_loc@PLT
.L598:
	.loc 1 3674 0
	movl	$0, -20(%rbp)
	jmp	.L599
.L606:
	.loc 1 3676 0
	movl	$0, -24(%rbp)
	jmp	.L600
.L605:
	.loc 1 3678 0
	movl	$0, -28(%rbp)
	jmp	.L601
.L604:
	.loc 1 3680 0
	movq	grid(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L602
	.loc 1 3680 0 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.5286(%rip), %rcx
	movl	$3680, %edx
	leaq	.LC40(%rip), %rsi
	leaq	.LC77(%rip), %rdi
	call	__assert_fail@PLT
.L602:
	.loc 1 3681 0 is_stmt 1
	movq	grid(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -32(%rbp)
	.loc 1 3683 0
	cmpl	$-1, -32(%rbp)
	je	.L603
	.loc 1 3685 0
	movq	block(%rip), %rcx
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-20(%rbp), %eax
	movl	%eax, 24(%rdx)
	.loc 1 3686 0
	movq	block(%rip), %rcx
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-24(%rbp), %eax
	movl	%eax, 28(%rdx)
	.loc 1 3687 0
	movq	block(%rip), %rcx
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-28(%rbp), %eax
	movl	%eax, 32(%rdx)
.L603:
	.loc 1 3678 0 discriminator 2
	addl	$1, -28(%rbp)
.L601:
	.loc 1 3678 0 is_stmt 0 discriminator 1
	movq	grid(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	12(%rax), %eax
	cmpl	-28(%rbp), %eax
	jg	.L604
	.loc 1 3676 0 is_stmt 1 discriminator 2
	addl	$1, -24(%rbp)
.L600:
	.loc 1 3676 0 is_stmt 0 discriminator 1
	movl	ny(%rip), %eax
	addl	$1, %eax
	cmpl	-24(%rbp), %eax
	jge	.L605
	.loc 1 3674 0 is_stmt 1 discriminator 2
	addl	$1, -20(%rbp)
.L599:
	.loc 1 3674 0 is_stmt 0 discriminator 1
	movl	nx(%rip), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L606
	.loc 1 3697 0 is_stmt 1
	movl	$0, -20(%rbp)
	jmp	.L607
.L608:
	.loc 1 3699 0 discriminator 3
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 3697 0 discriminator 3
	addl	$1, -20(%rbp)
.L607:
	.loc 1 3697 0 is_stmt 0 discriminator 1
	movl	num_types(%rip), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L608
	.loc 1 3701 0 is_stmt 1
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 3702 0
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 3703 0
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 3704 0
	nop
	addq	$88, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
	.size	initial_placement, .-initial_placement
	.type	free_fast_cost_update_structs, @function
free_fast_cost_update_structs:
.LFB37:
	.loc 1 3709 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 3716 0
	movl	$0, -4(%rbp)
	jmp	.L610
.L611:
	.loc 1 3717 0 discriminator 3
	movq	chanx_place_cost_fac(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 3716 0 discriminator 3
	addl	$1, -4(%rbp)
.L610:
	.loc 1 3716 0 is_stmt 0 discriminator 1
	movl	ny(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jle	.L611
	.loc 1 3719 0 is_stmt 1
	movq	chanx_place_cost_fac(%rip), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 3721 0
	movl	$0, -4(%rbp)
	jmp	.L612
.L613:
	.loc 1 3722 0 discriminator 3
	movq	chany_place_cost_fac(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 3721 0 discriminator 3
	addl	$1, -4(%rbp)
.L612:
	.loc 1 3721 0 is_stmt 0 discriminator 1
	movl	nx(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jle	.L613
	.loc 1 3724 0 is_stmt 1
	movq	chany_place_cost_fac(%rip), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 3725 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE37:
	.size	free_fast_cost_update_structs, .-free_fast_cost_update_structs
	.type	alloc_and_load_for_fast_cost_update, @function
alloc_and_load_for_fast_cost_update:
.LFB38:
	.loc 1 3730 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movss	%xmm0, -36(%rbp)
	.loc 1 3750 0
	movl	ny(%rip), %eax
	addl	$1, %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	movq	%rax, chanx_place_cost_fac(%rip)
	.loc 1 3751 0
	movl	$0, -28(%rbp)
	jmp	.L615
.L616:
	.loc 1 3752 0 discriminator 3
	movq	chanx_place_cost_fac(%rip), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rbx
	movl	-28(%rbp), %eax
	addl	$1, %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	movq	%rax, (%rbx)
	.loc 1 3751 0 discriminator 3
	addl	$1, -28(%rbp)
.L615:
	.loc 1 3751 0 is_stmt 0 discriminator 1
	movl	ny(%rip), %eax
	cmpl	%eax, -28(%rbp)
	jle	.L616
	.loc 1 3754 0 is_stmt 1
	movl	nx(%rip), %eax
	addl	$1, %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	movq	%rax, chany_place_cost_fac(%rip)
	.loc 1 3755 0
	movl	$0, -28(%rbp)
	jmp	.L617
.L618:
	.loc 1 3756 0 discriminator 3
	movq	chany_place_cost_fac(%rip), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rbx
	movl	-28(%rbp), %eax
	addl	$1, %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	movq	%rax, (%rbx)
	.loc 1 3755 0 discriminator 3
	addl	$1, -28(%rbp)
.L617:
	.loc 1 3755 0 is_stmt 0 discriminator 1
	movl	nx(%rip), %eax
	cmpl	%eax, -28(%rbp)
	jle	.L618
	.loc 1 3762 0 is_stmt 1
	movq	chanx_place_cost_fac(%rip), %rax
	movq	(%rax), %rax
	movq	chan_width_x(%rip), %rdx
	movl	(%rdx), %edx
	pxor	%xmm0, %xmm0
	cvtsi2ss	%edx, %xmm0
	movss	%xmm0, (%rax)
	.loc 1 3764 0
	movl	$1, -24(%rbp)
	jmp	.L619
.L622:
	.loc 1 3766 0
	movq	chanx_place_cost_fac(%rip), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movq	chan_width_x(%rip), %rdx
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movl	(%rdx), %edx
	pxor	%xmm0, %xmm0
	cvtsi2ss	%edx, %xmm0
	movss	%xmm0, (%rax)
	.loc 1 3767 0
	movl	$0, -20(%rbp)
	jmp	.L620
.L621:
	.loc 1 3769 0 discriminator 3
	movq	chanx_place_cost_fac(%rip), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 3770 0 discriminator 3
	movq	chanx_place_cost_fac(%rip), %rdx
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	subq	$8, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movl	-20(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm1
	.loc 1 3771 0 discriminator 3
	movq	chan_width_x(%rip), %rdx
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movl	(%rdx), %edx
	.loc 1 3770 0 discriminator 3
	pxor	%xmm0, %xmm0
	cvtsi2ss	%edx, %xmm0
	addss	%xmm1, %xmm0
	.loc 1 3769 0 discriminator 3
	movss	%xmm0, (%rax)
	.loc 1 3767 0 discriminator 3
	addl	$1, -20(%rbp)
.L620:
	.loc 1 3767 0 is_stmt 0 discriminator 1
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jl	.L621
	.loc 1 3764 0 is_stmt 1 discriminator 2
	addl	$1, -24(%rbp)
.L619:
	.loc 1 3764 0 is_stmt 0 discriminator 1
	movl	ny(%rip), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L622
	.loc 1 3783 0 is_stmt 1
	movl	$0, -24(%rbp)
	jmp	.L623
.L626:
	.loc 1 3784 0
	movl	$0, -20(%rbp)
	jmp	.L624
.L625:
	.loc 1 3786 0 discriminator 3
	movq	chanx_place_cost_fac(%rip), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	movl	-24(%rbp), %eax
	subl	-20(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC78(%rip), %xmm1
	addsd	%xmm1, %xmm0
	.loc 1 3787 0 discriminator 3
	movq	chanx_place_cost_fac(%rip), %rax
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	-20(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	cvtss2sd	%xmm1, %xmm1
	.loc 1 3786 0 discriminator 3
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, (%rdx)
	.loc 1 3788 0 discriminator 3
	movq	chanx_place_cost_fac(%rip), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	leaq	(%rax,%rdx), %rbx
	.loc 1 3789 0 discriminator 3
	cvtss2sd	-36(%rbp), %xmm1
	movq	chanx_place_cost_fac(%rip), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	pow@PLT
	cvtsd2ss	%xmm0, %xmm0
	.loc 1 3788 0 discriminator 3
	movss	%xmm0, (%rbx)
	.loc 1 3784 0 discriminator 3
	addl	$1, -20(%rbp)
.L624:
	.loc 1 3784 0 is_stmt 0 discriminator 1
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jle	.L625
	.loc 1 3783 0 is_stmt 1 discriminator 2
	addl	$1, -24(%rbp)
.L623:
	.loc 1 3783 0 is_stmt 0 discriminator 1
	movl	ny(%rip), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L626
	.loc 1 3797 0 is_stmt 1
	movq	chany_place_cost_fac(%rip), %rax
	movq	(%rax), %rax
	movq	chan_width_y(%rip), %rdx
	movl	(%rdx), %edx
	pxor	%xmm0, %xmm0
	cvtsi2ss	%edx, %xmm0
	movss	%xmm0, (%rax)
	.loc 1 3799 0
	movl	$1, -24(%rbp)
	jmp	.L627
.L630:
	.loc 1 3801 0
	movq	chany_place_cost_fac(%rip), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movq	chan_width_y(%rip), %rdx
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movl	(%rdx), %edx
	pxor	%xmm0, %xmm0
	cvtsi2ss	%edx, %xmm0
	movss	%xmm0, (%rax)
	.loc 1 3802 0
	movl	$0, -20(%rbp)
	jmp	.L628
.L629:
	.loc 1 3804 0 discriminator 3
	movq	chany_place_cost_fac(%rip), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 3805 0 discriminator 3
	movq	chany_place_cost_fac(%rip), %rdx
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	subq	$8, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movl	-20(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm1
	.loc 1 3806 0 discriminator 3
	movq	chan_width_y(%rip), %rdx
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movl	(%rdx), %edx
	.loc 1 3805 0 discriminator 3
	pxor	%xmm0, %xmm0
	cvtsi2ss	%edx, %xmm0
	addss	%xmm1, %xmm0
	.loc 1 3804 0 discriminator 3
	movss	%xmm0, (%rax)
	.loc 1 3802 0 discriminator 3
	addl	$1, -20(%rbp)
.L628:
	.loc 1 3802 0 is_stmt 0 discriminator 1
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jl	.L629
	.loc 1 3799 0 is_stmt 1 discriminator 2
	addl	$1, -24(%rbp)
.L627:
	.loc 1 3799 0 is_stmt 0 discriminator 1
	movl	nx(%rip), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L630
	.loc 1 3813 0 is_stmt 1
	movl	$0, -24(%rbp)
	jmp	.L631
.L634:
	.loc 1 3814 0
	movl	$0, -20(%rbp)
	jmp	.L632
.L633:
	.loc 1 3816 0 discriminator 3
	movq	chany_place_cost_fac(%rip), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	movl	-24(%rbp), %eax
	subl	-20(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC78(%rip), %xmm1
	addsd	%xmm1, %xmm0
	.loc 1 3817 0 discriminator 3
	movq	chany_place_cost_fac(%rip), %rax
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	-20(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	cvtss2sd	%xmm1, %xmm1
	.loc 1 3816 0 discriminator 3
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, (%rdx)
	.loc 1 3818 0 discriminator 3
	movq	chany_place_cost_fac(%rip), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	leaq	(%rax,%rdx), %rbx
	.loc 1 3819 0 discriminator 3
	cvtss2sd	-36(%rbp), %xmm1
	movq	chany_place_cost_fac(%rip), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	pow@PLT
	cvtsd2ss	%xmm0, %xmm0
	.loc 1 3818 0 discriminator 3
	movss	%xmm0, (%rbx)
	.loc 1 3814 0 discriminator 3
	addl	$1, -20(%rbp)
.L632:
	.loc 1 3814 0 is_stmt 0 discriminator 1
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jle	.L633
	.loc 1 3813 0 is_stmt 1 discriminator 2
	addl	$1, -24(%rbp)
.L631:
	.loc 1 3813 0 is_stmt 0 discriminator 1
	movl	nx(%rip), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L634
	.loc 1 3822 0 is_stmt 1
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE38:
	.size	alloc_and_load_for_fast_cost_update, .-alloc_and_load_for_fast_cost_update
	.section	.rodata
	.align 8
.LC79:
	.string	"bb_cost recomputed from scratch is %g.\n"
	.align 8
.LC80:
	.string	"Error:  bb_cost_check: %g and bb_cost: %g differ in check_place.\n"
	.align 8
.LC81:
	.string	"timing_cost recomputed from scratch is %g. \n"
	.align 8
.LC82:
	.string	"Error:  timing_cost_check: %g and timing_cost: %g differ in check_place.\n"
	.align 8
.LC83:
	.string	"delay_cost recomputed from scratch is %g. \n"
	.align 8
.LC84:
	.string	"Error:  delay_cost_check: %g and delay_cost: %g differ in check_place.\n"
	.align 8
.LC85:
	.string	"Error:  block at grid location (%d,%d) overused. Usage is %d\n"
	.align 8
.LC86:
	.string	"Error:  block %d type does not match grid location (%d,%d) type.\n"
	.align 8
.LC87:
	.string	"Error:  block %d location conflicts with grid(%d,%d)data.\n"
	.align 8
.LC88:
	.string	"Error:  Location (%d,%d) usage is %d, but has actual usage %d.\n"
	.align 8
.LC89:
	.string	"Error:  block %d listed %d times in data structures.\n"
	.align 8
.LC90:
	.string	"\nCompleted placement consistency check successfully.\n"
	.align 8
.LC91:
	.string	"\nCompleted placement consistency check, %d Errors found.\n\n"
.LC92:
	.string	"Aborting program."
	.text
	.type	check_place, @function
check_place:
.LFB39:
	.loc 1 3832 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movss	%xmm0, -52(%rbp)
	movss	%xmm1, -56(%rbp)
	movl	%edi, -60(%rbp)
	movl	%esi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movss	%xmm2, -72(%rbp)
	.loc 1 3841 0
	movl	$0, -16(%rbp)
	.loc 1 3846 0
	movl	-64(%rbp), %edx
	movl	-60(%rbp), %eax
	movl	%eax, %esi
	movl	$1, %edi
	call	comp_bb_cost
	movd	%xmm0, %eax
	movl	%eax, -24(%rbp)
	.loc 1 3847 0
	cvtss2sd	-24(%rbp), %xmm0
	leaq	.LC79(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	.loc 1 3848 0
	movss	-24(%rbp), %xmm0
	subss	-52(%rbp), %xmm0
	movss	.LC28(%rip), %xmm1
	andps	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	cvtss2sd	-52(%rbp), %xmm1
	movsd	.LC29(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	ucomisd	%xmm1, %xmm0
	jbe	.L636
	.loc 1 3850 0
	cvtss2sd	-52(%rbp), %xmm1
	cvtss2sd	-24(%rbp), %xmm0
	leaq	.LC80(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	.loc 1 3853 0
	addl	$1, -16(%rbp)
.L636:
	.loc 1 3856 0
	cmpl	$1, -68(%rbp)
	je	.L638
	.loc 1 3856 0 is_stmt 0 discriminator 1
	cmpl	$2, -68(%rbp)
	jne	.L639
.L638:
	.loc 1 3859 0 is_stmt 1
	leaq	-36(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	comp_td_costs
	.loc 1 3860 0
	movss	-32(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC81(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	.loc 1 3862 0
	movss	-32(%rbp), %xmm0
	subss	-56(%rbp), %xmm0
	movss	.LC28(%rip), %xmm1
	andps	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	.loc 1 3863 0
	cvtss2sd	-56(%rbp), %xmm1
	movsd	.LC29(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	.loc 1 3862 0
	ucomisd	%xmm1, %xmm0
	jbe	.L640
	.loc 1 3865 0
	cvtss2sd	-56(%rbp), %xmm1
	movss	-32(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC82(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	.loc 1 3868 0
	addl	$1, -16(%rbp)
.L640:
	.loc 1 3870 0
	movss	-36(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC83(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	.loc 1 3872 0
	movss	-36(%rbp), %xmm0
	subss	-72(%rbp), %xmm0
	movss	.LC28(%rip), %xmm1
	andps	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	cvtss2sd	-72(%rbp), %xmm1
	movsd	.LC29(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	ucomisd	%xmm1, %xmm0
	jbe	.L639
	.loc 1 3874 0
	cvtss2sd	-72(%rbp), %xmm1
	movss	-36(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC84(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	.loc 1 3877 0
	addl	$1, -16(%rbp)
.L639:
	.loc 1 3881 0
	movl	num_blocks(%rip), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	my_malloc@PLT
	movq	%rax, bdone.5356(%rip)
	.loc 1 3882 0
	movl	$0, -4(%rbp)
	jmp	.L643
.L644:
	.loc 1 3883 0 discriminator 3
	movq	bdone.5356(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	$0, (%rax)
	.loc 1 3882 0 discriminator 3
	addl	$1, -4(%rbp)
.L643:
	.loc 1 3882 0 is_stmt 0 discriminator 1
	movl	num_blocks(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L644
	.loc 1 3886 0 is_stmt 1
	movl	$0, -4(%rbp)
	jmp	.L645
.L657:
	.loc 1 3887 0
	movl	$0, -8(%rbp)
	jmp	.L646
.L656:
	.loc 1 3889 0
	movq	grid(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	12(%rax), %ecx
	movq	grid(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rsi
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	movq	(%rax), %rax
	movl	12(%rax), %eax
	cmpl	%eax, %ecx
	jle	.L647
	.loc 1 3893 0
	movq	grid(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	.loc 1 3891 0
	movl	12(%rax), %ecx
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC85(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 3894 0
	addl	$1, -16(%rbp)
.L647:
	.loc 1 3896 0
	movl	$0, -20(%rbp)
	.loc 1 3897 0
	movl	$0, -12(%rbp)
	jmp	.L648
.L654:
	.loc 1 3899 0
	movq	grid(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -28(%rbp)
	.loc 1 3900 0
	cmpl	$-1, -28(%rbp)
	je	.L666
	.loc 1 3903 0
	movq	block(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rcx
	movq	grid(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rsi
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	movq	(%rax), %rax
	cmpq	%rax, %rcx
	je	.L651
	.loc 1 3905 0
	movl	-8(%rbp), %ecx
	movl	-4(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC86(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 3908 0
	addl	$1, -16(%rbp)
.L651:
	.loc 1 3910 0
	movq	block(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	24(%rax), %eax
	cmpl	-4(%rbp), %eax
	jne	.L652
	.loc 1 3910 0 is_stmt 0 discriminator 1
	movq	block(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	28(%rax), %eax
	cmpl	-8(%rbp), %eax
	je	.L653
.L652:
	.loc 1 3912 0 is_stmt 1
	movl	-8(%rbp), %ecx
	movl	-4(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC87(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 3915 0
	addl	$1, -16(%rbp)
.L653:
	.loc 1 3917 0
	addl	$1, -20(%rbp)
	.loc 1 3918 0
	movq	bdone.5356(%rip), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	jmp	.L650
.L666:
	.loc 1 3901 0
	nop
.L650:
	.loc 1 3897 0 discriminator 2
	addl	$1, -12(%rbp)
.L648:
	.loc 1 3897 0 is_stmt 0 discriminator 1
	movq	grid(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	12(%rax), %eax
	cmpl	-12(%rbp), %eax
	jg	.L654
	.loc 1 3920 0 is_stmt 1
	movq	grid(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	12(%rax), %eax
	cmpl	-20(%rbp), %eax
	je	.L655
	.loc 1 3924 0
	movq	grid(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	.loc 1 3922 0
	movl	12(%rax), %ecx
	movl	-20(%rbp), %esi
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%esi, %r8d
	movl	%eax, %esi
	leaq	.LC88(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L655:
	.loc 1 3887 0 discriminator 2
	addl	$1, -8(%rbp)
.L646:
	.loc 1 3887 0 is_stmt 0 discriminator 1
	movl	ny(%rip), %eax
	addl	$1, %eax
	cmpl	-8(%rbp), %eax
	jge	.L656
	.loc 1 3886 0 is_stmt 1 discriminator 2
	addl	$1, -4(%rbp)
.L645:
	.loc 1 3886 0 is_stmt 0 discriminator 1
	movl	nx(%rip), %eax
	addl	$1, %eax
	cmpl	-4(%rbp), %eax
	jge	.L657
	.loc 1 3929 0 is_stmt 1
	movl	$0, -4(%rbp)
	jmp	.L658
.L660:
	.loc 1 3930 0
	movq	bdone.5356(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	je	.L659
	.loc 1 3934 0
	movq	bdone.5356(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	.loc 1 3932 0
	movl	(%rax), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC89(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 3935 0
	addl	$1, -16(%rbp)
.L659:
	.loc 1 3929 0 discriminator 2
	addl	$1, -4(%rbp)
.L658:
	.loc 1 3929 0 is_stmt 0 discriminator 1
	movl	num_blocks(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L660
	.loc 1 3937 0 is_stmt 1
	movq	bdone.5356(%rip), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 3939 0
	cmpl	$0, -16(%rbp)
	jne	.L661
	.loc 1 3941 0
	leaq	.LC90(%rip), %rdi
	call	puts@PLT
	.loc 1 3955 0
	jmp	.L665
.L661:
	.loc 1 3949 0
	movl	-16(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC91(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 3952 0
	leaq	.LC92(%rip), %rdi
	call	puts@PLT
	.loc 1 3953 0
	movl	$1, %edi
	call	exit@PLT
.L665:
	.loc 1 3955 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE39:
	.size	check_place, .-check_place
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.4679, @object
	.size	__PRETTY_FUNCTION__.4679, 10
__PRETTY_FUNCTION__.4679:
	.string	"try_place"
	.local	bb_coord_new.4805
	.comm	bb_coord_new.4805,8,8
	.local	bb_edge_new.4806
	.comm	bb_edge_new.4806,8,8
	.local	nets_to_update.4807
	.comm	nets_to_update.4807,8,8
	.local	net_block_moved.4808
	.comm	net_block_moved.4808,8,8
	.align 8
	.type	__PRETTY_FUNCTION__.4899, @object
	.size	__PRETTY_FUNCTION__.4899, 8
__PRETTY_FUNCTION__.4899:
	.string	"find_to"
	.align 16
	.type	__PRETTY_FUNCTION__.4943, @object
	.size	__PRETTY_FUNCTION__.4943, 29
__PRETTY_FUNCTION__.4943:
	.string	"comp_td_point_to_point_delay"
	.align 16
	.type	__PRETTY_FUNCTION__.5286, @object
	.size	__PRETTY_FUNCTION__.5286, 18
__PRETTY_FUNCTION__.5286:
	.string	"initial_placement"
	.local	bdone.5356
	.comm	bdone.5356,8,8
	.align 4
.LC2:
	.long	1065353216
	.align 8
.LC3:
	.long	1635523546
	.long	1073042738
	.align 8
.LC4:
	.long	0
	.long	1071644672
	.align 16
.LC28:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.align 8
.LC29:
	.long	1202590843
	.long	1063549665
	.align 8
.LC42:
	.long	515396076
	.long	1071770501
	.align 8
.LC43:
	.long	3951369912
	.long	1072609361
	.align 4
.LC44:
	.long	1056964608
	.align 8
.LC45:
	.long	2576980378
	.long	1072273817
	.align 8
.LC46:
	.long	3435973837
	.long	1072483532
	.align 8
.LC47:
	.long	858993459
	.long	1069757235
	.align 8
.LC48:
	.long	1717986918
	.long	1072588390
	.align 8
.LC49:
	.long	1202590843
	.long	1064598241
	.align 4
.LC50:
	.long	1900671690
	.align 8
.LC52:
	.long	0
	.long	1077149696
	.align 4
.LC53:
	.long	3212836864
	.align 16
.LC62:
	.long	2147483648
	.long	0
	.long	0
	.long	0
	.align 8
.LC68:
	.long	3789191947
	.long	1067108783
	.align 8
.LC69:
	.long	2879346075
	.long	1074157741
	.align 8
.LC70:
	.long	3539053052
	.long	-1085250995
	.align 8
.LC73:
	.long	0
	.long	1073741824
	.align 8
.LC74:
	.long	34359738
	.long	1065781035
	.align 8
.LC75:
	.long	3994305841
	.long	1052652272
	.align 8
.LC78:
	.long	0
	.long	1072693248
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/6/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/libio.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 7 "/usr/include/math.h"
	.file 8 "./SRC/util.h"
	.file 9 "./SRC/vpr_types.h"
	.file 10 "./SRC/globals.h"
	.file 11 "./SRC/mst.h"
	.file 12 "./SRC/timing_place_lookup.h"
	.file 13 "./SRC/timing_place.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x318a
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF605
	.byte	0xc
	.long	.LASF606
	.long	.LASF607
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
	.byte	0xd8
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x83
	.long	0x69
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x84
	.long	0x69
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x95
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x7
	.long	0x95
	.uleb128 0x8
	.long	.LASF41
	.byte	0xd8
	.byte	0x4
	.byte	0xf1
	.long	0x21e
	.uleb128 0x9
	.long	.LASF12
	.byte	0x4
	.byte	0xf2
	.long	0x62
	.byte	0
	.uleb128 0x9
	.long	.LASF13
	.byte	0x4
	.byte	0xf7
	.long	0x8f
	.byte	0x8
	.uleb128 0x9
	.long	.LASF14
	.byte	0x4
	.byte	0xf8
	.long	0x8f
	.byte	0x10
	.uleb128 0x9
	.long	.LASF15
	.byte	0x4
	.byte	0xf9
	.long	0x8f
	.byte	0x18
	.uleb128 0x9
	.long	.LASF16
	.byte	0x4
	.byte	0xfa
	.long	0x8f
	.byte	0x20
	.uleb128 0x9
	.long	.LASF17
	.byte	0x4
	.byte	0xfb
	.long	0x8f
	.byte	0x28
	.uleb128 0x9
	.long	.LASF18
	.byte	0x4
	.byte	0xfc
	.long	0x8f
	.byte	0x30
	.uleb128 0x9
	.long	.LASF19
	.byte	0x4
	.byte	0xfd
	.long	0x8f
	.byte	0x38
	.uleb128 0x9
	.long	.LASF20
	.byte	0x4
	.byte	0xfe
	.long	0x8f
	.byte	0x40
	.uleb128 0xa
	.long	.LASF21
	.byte	0x4
	.value	0x100
	.long	0x8f
	.byte	0x48
	.uleb128 0xa
	.long	.LASF22
	.byte	0x4
	.value	0x101
	.long	0x8f
	.byte	0x50
	.uleb128 0xa
	.long	.LASF23
	.byte	0x4
	.value	0x102
	.long	0x8f
	.byte	0x58
	.uleb128 0xa
	.long	.LASF24
	.byte	0x4
	.value	0x104
	.long	0x256
	.byte	0x60
	.uleb128 0xa
	.long	.LASF25
	.byte	0x4
	.value	0x106
	.long	0x25c
	.byte	0x68
	.uleb128 0xa
	.long	.LASF26
	.byte	0x4
	.value	0x108
	.long	0x62
	.byte	0x70
	.uleb128 0xa
	.long	.LASF27
	.byte	0x4
	.value	0x10c
	.long	0x62
	.byte	0x74
	.uleb128 0xa
	.long	.LASF28
	.byte	0x4
	.value	0x10e
	.long	0x70
	.byte	0x78
	.uleb128 0xa
	.long	.LASF29
	.byte	0x4
	.value	0x112
	.long	0x46
	.byte	0x80
	.uleb128 0xa
	.long	.LASF30
	.byte	0x4
	.value	0x113
	.long	0x54
	.byte	0x82
	.uleb128 0xa
	.long	.LASF31
	.byte	0x4
	.value	0x114
	.long	0x262
	.byte	0x83
	.uleb128 0xa
	.long	.LASF32
	.byte	0x4
	.value	0x118
	.long	0x272
	.byte	0x88
	.uleb128 0xa
	.long	.LASF33
	.byte	0x4
	.value	0x121
	.long	0x7b
	.byte	0x90
	.uleb128 0xa
	.long	.LASF34
	.byte	0x4
	.value	0x129
	.long	0x8d
	.byte	0x98
	.uleb128 0xa
	.long	.LASF35
	.byte	0x4
	.value	0x12a
	.long	0x8d
	.byte	0xa0
	.uleb128 0xa
	.long	.LASF36
	.byte	0x4
	.value	0x12b
	.long	0x8d
	.byte	0xa8
	.uleb128 0xa
	.long	.LASF37
	.byte	0x4
	.value	0x12c
	.long	0x8d
	.byte	0xb0
	.uleb128 0xa
	.long	.LASF38
	.byte	0x4
	.value	0x12e
	.long	0x2d
	.byte	0xb8
	.uleb128 0xa
	.long	.LASF39
	.byte	0x4
	.value	0x12f
	.long	0x62
	.byte	0xc0
	.uleb128 0xa
	.long	.LASF40
	.byte	0x4
	.value	0x131
	.long	0x278
	.byte	0xc4
	.byte	0
	.uleb128 0xb
	.long	.LASF608
	.byte	0x4
	.byte	0x96
	.uleb128 0x8
	.long	.LASF42
	.byte	0x18
	.byte	0x4
	.byte	0x9c
	.long	0x256
	.uleb128 0x9
	.long	.LASF43
	.byte	0x4
	.byte	0x9d
	.long	0x256
	.byte	0
	.uleb128 0x9
	.long	.LASF44
	.byte	0x4
	.byte	0x9e
	.long	0x25c
	.byte	0x8
	.uleb128 0x9
	.long	.LASF45
	.byte	0x4
	.byte	0xa2
	.long	0x62
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x225
	.uleb128 0x6
	.byte	0x8
	.long	0xa1
	.uleb128 0xc
	.long	0x95
	.long	0x272
	.uleb128 0xd
	.long	0x86
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x21e
	.uleb128 0xc
	.long	0x95
	.long	0x288
	.uleb128 0xd
	.long	0x86
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	.LASF609
	.uleb128 0xf
	.long	.LASF46
	.byte	0x4
	.value	0x13b
	.long	0x288
	.uleb128 0xf
	.long	.LASF47
	.byte	0x4
	.value	0x13c
	.long	0x288
	.uleb128 0xf
	.long	.LASF48
	.byte	0x4
	.value	0x13d
	.long	0x288
	.uleb128 0x6
	.byte	0x8
	.long	0x9c
	.uleb128 0x7
	.long	0x2b1
	.uleb128 0x10
	.long	.LASF49
	.byte	0x5
	.byte	0xaa
	.long	0x25c
	.uleb128 0x10
	.long	.LASF50
	.byte	0x5
	.byte	0xab
	.long	0x25c
	.uleb128 0x10
	.long	.LASF51
	.byte	0x5
	.byte	0xac
	.long	0x25c
	.uleb128 0x10
	.long	.LASF52
	.byte	0x6
	.byte	0x1a
	.long	0x62
	.uleb128 0xc
	.long	0x2b7
	.long	0x2f3
	.uleb128 0x11
	.byte	0
	.uleb128 0x7
	.long	0x2e8
	.uleb128 0x10
	.long	.LASF53
	.byte	0x6
	.byte	0x1b
	.long	0x2f3
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF54
	.uleb128 0x7
	.long	0x303
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF55
	.uleb128 0x10
	.long	.LASF56
	.byte	0x7
	.byte	0xa8
	.long	0x62
	.uleb128 0x12
	.byte	0x4
	.long	0x62
	.byte	0x7
	.value	0x15c
	.long	0x34d
	.uleb128 0x13
	.long	.LASF57
	.sleb128 -1
	.uleb128 0x14
	.long	.LASF58
	.byte	0
	.uleb128 0x14
	.long	.LASF59
	.byte	0x1
	.uleb128 0x14
	.long	.LASF60
	.byte	0x2
	.uleb128 0x14
	.long	.LASF61
	.byte	0x3
	.byte	0
	.uleb128 0x15
	.long	.LASF62
	.byte	0x7
	.value	0x162
	.long	0x321
	.uleb128 0xf
	.long	.LASF63
	.byte	0x7
	.value	0x167
	.long	0x34d
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF64
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF65
	.uleb128 0x10
	.long	.LASF66
	.byte	0x8
	.byte	0x7
	.long	0x62
	.uleb128 0x16
	.byte	0x4
	.long	0x4d
	.byte	0x8
	.byte	0xe
	.long	0x397
	.uleb128 0x14
	.long	.LASF67
	.byte	0
	.uleb128 0x14
	.long	.LASF68
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF69
	.byte	0x8
	.byte	0xf
	.long	0x37e
	.uleb128 0x8
	.long	.LASF70
	.byte	0x10
	.byte	0x8
	.byte	0x3b
	.long	0x3c7
	.uleb128 0x9
	.long	.LASF71
	.byte	0x8
	.byte	0x3d
	.long	0x62
	.byte	0
	.uleb128 0x9
	.long	.LASF72
	.byte	0x8
	.byte	0x3e
	.long	0x3c7
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x62
	.uleb128 0x2
	.long	.LASF73
	.byte	0x8
	.byte	0x40
	.long	0x3a2
	.uleb128 0x17
	.long	.LASF77
	.byte	0x4
	.long	0x62
	.byte	0x9
	.byte	0x16
	.long	0x3fb
	.uleb128 0x13
	.long	.LASF74
	.sleb128 -1
	.uleb128 0x14
	.long	.LASF75
	.byte	0
	.uleb128 0x14
	.long	.LASF76
	.byte	0x1
	.byte	0
	.uleb128 0x17
	.long	.LASF78
	.byte	0x4
	.long	0x4d
	.byte	0x9
	.byte	0x2d
	.long	0x418
	.uleb128 0x14
	.long	.LASF79
	.byte	0
	.uleb128 0x14
	.long	.LASF80
	.byte	0x1
	.byte	0
	.uleb128 0x17
	.long	.LASF81
	.byte	0x4
	.long	0x4d
	.byte	0x9
	.byte	0x30
	.long	0x43b
	.uleb128 0x14
	.long	.LASF82
	.byte	0
	.uleb128 0x14
	.long	.LASF83
	.byte	0x1
	.uleb128 0x14
	.long	.LASF84
	.byte	0x2
	.byte	0
	.uleb128 0x17
	.long	.LASF85
	.byte	0x4
	.long	0x4d
	.byte	0x9
	.byte	0x35
	.long	0x458
	.uleb128 0x14
	.long	.LASF86
	.byte	0
	.uleb128 0x14
	.long	.LASF87
	.byte	0x1
	.byte	0
	.uleb128 0x17
	.long	.LASF88
	.byte	0x4
	.long	0x4d
	.byte	0x9
	.byte	0x3d
	.long	0x47b
	.uleb128 0x14
	.long	.LASF89
	.byte	0
	.uleb128 0x14
	.long	.LASF90
	.byte	0x1
	.uleb128 0x14
	.long	.LASF91
	.byte	0x2
	.byte	0
	.uleb128 0x17
	.long	.LASF92
	.byte	0x4
	.long	0x4d
	.byte	0x9
	.byte	0x43
	.long	0x49e
	.uleb128 0x14
	.long	.LASF93
	.byte	0
	.uleb128 0x14
	.long	.LASF94
	.byte	0x1
	.uleb128 0x14
	.long	.LASF95
	.byte	0x2
	.byte	0
	.uleb128 0x8
	.long	.LASF96
	.byte	0x28
	.byte	0x9
	.byte	0x47
	.long	0x4e7
	.uleb128 0x9
	.long	.LASF97
	.byte	0x9
	.byte	0x49
	.long	0x8f
	.byte	0
	.uleb128 0x9
	.long	.LASF98
	.byte	0x9
	.byte	0x4a
	.long	0x62
	.byte	0x8
	.uleb128 0x9
	.long	.LASF99
	.byte	0x9
	.byte	0x4b
	.long	0x3c7
	.byte	0x10
	.uleb128 0x9
	.long	.LASF100
	.byte	0x9
	.byte	0x4c
	.long	0x3c7
	.byte	0x18
	.uleb128 0x9
	.long	.LASF101
	.byte	0x9
	.byte	0x4d
	.long	0x397
	.byte	0x20
	.byte	0
	.uleb128 0x8
	.long	.LASF102
	.byte	0x18
	.byte	0x9
	.byte	0x51
	.long	0x518
	.uleb128 0x9
	.long	.LASF103
	.byte	0x9
	.byte	0x53
	.long	0x518
	.byte	0
	.uleb128 0x9
	.long	.LASF104
	.byte	0x9
	.byte	0x54
	.long	0x51e
	.byte	0x8
	.uleb128 0x9
	.long	.LASF105
	.byte	0x9
	.byte	0x55
	.long	0x51e
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x51e
	.uleb128 0x6
	.byte	0x8
	.long	0x303
	.uleb128 0x2
	.long	.LASF106
	.byte	0x9
	.byte	0x57
	.long	0x4e7
	.uleb128 0x8
	.long	.LASF107
	.byte	0xc
	.byte	0x9
	.byte	0x65
	.long	0x560
	.uleb128 0x9
	.long	.LASF108
	.byte	0x9
	.byte	0x67
	.long	0x397
	.byte	0
	.uleb128 0x9
	.long	.LASF109
	.byte	0x9
	.byte	0x68
	.long	0x303
	.byte	0x4
	.uleb128 0x9
	.long	.LASF110
	.byte	0x9
	.byte	0x69
	.long	0x303
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	.LASF111
	.byte	0x9
	.byte	0x6b
	.long	0x52f
	.uleb128 0x8
	.long	.LASF112
	.byte	0x18
	.byte	0x9
	.byte	0x6c
	.long	0x5a8
	.uleb128 0x9
	.long	.LASF113
	.byte	0x9
	.byte	0x6e
	.long	0x303
	.byte	0
	.uleb128 0x9
	.long	.LASF114
	.byte	0x9
	.byte	0x6f
	.long	0x303
	.byte	0x4
	.uleb128 0x9
	.long	.LASF115
	.byte	0x9
	.byte	0x70
	.long	0x303
	.byte	0x8
	.uleb128 0x9
	.long	.LASF116
	.byte	0x9
	.byte	0x71
	.long	0x5a8
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x524
	.uleb128 0x2
	.long	.LASF117
	.byte	0x9
	.byte	0x73
	.long	0x56b
	.uleb128 0x17
	.long	.LASF118
	.byte	0x4
	.long	0x4d
	.byte	0x9
	.byte	0x87
	.long	0x5e2
	.uleb128 0x14
	.long	.LASF119
	.byte	0
	.uleb128 0x14
	.long	.LASF120
	.byte	0x1
	.uleb128 0x14
	.long	.LASF121
	.byte	0x2
	.uleb128 0x14
	.long	.LASF122
	.byte	0x3
	.byte	0
	.uleb128 0x8
	.long	.LASF123
	.byte	0x14
	.byte	0x9
	.byte	0x89
	.long	0x62b
	.uleb128 0x9
	.long	.LASF124
	.byte	0x9
	.byte	0x8b
	.long	0x5b9
	.byte	0
	.uleb128 0x9
	.long	.LASF125
	.byte	0x9
	.byte	0x8c
	.long	0x62
	.byte	0x4
	.uleb128 0x9
	.long	.LASF126
	.byte	0x9
	.byte	0x8d
	.long	0x62
	.byte	0x8
	.uleb128 0x9
	.long	.LASF127
	.byte	0x9
	.byte	0x8e
	.long	0x303
	.byte	0xc
	.uleb128 0x9
	.long	.LASF128
	.byte	0x9
	.byte	0x8f
	.long	0x62
	.byte	0x10
	.byte	0
	.uleb128 0x8
	.long	.LASF129
	.byte	0x98
	.byte	0x9
	.byte	0xa5
	.long	0x740
	.uleb128 0x9
	.long	.LASF97
	.byte	0x9
	.byte	0xa7
	.long	0x2b1
	.byte	0
	.uleb128 0x9
	.long	.LASF130
	.byte	0x9
	.byte	0xa8
	.long	0x62
	.byte	0x8
	.uleb128 0x9
	.long	.LASF131
	.byte	0x9
	.byte	0xa9
	.long	0x62
	.byte	0xc
	.uleb128 0x9
	.long	.LASF132
	.byte	0x9
	.byte	0xab
	.long	0x62
	.byte	0x10
	.uleb128 0x9
	.long	.LASF133
	.byte	0x9
	.byte	0xac
	.long	0x745
	.byte	0x18
	.uleb128 0x9
	.long	.LASF134
	.byte	0x9
	.byte	0xae
	.long	0x62
	.byte	0x20
	.uleb128 0x9
	.long	.LASF135
	.byte	0x9
	.byte	0xaf
	.long	0x786
	.byte	0x28
	.uleb128 0x9
	.long	.LASF136
	.byte	0x9
	.byte	0xb0
	.long	0x3c7
	.byte	0x30
	.uleb128 0x9
	.long	.LASF137
	.byte	0x9
	.byte	0xb2
	.long	0x78c
	.byte	0x38
	.uleb128 0x9
	.long	.LASF138
	.byte	0x9
	.byte	0xb4
	.long	0x397
	.byte	0x40
	.uleb128 0x9
	.long	.LASF139
	.byte	0x9
	.byte	0xb5
	.long	0x397
	.byte	0x44
	.uleb128 0x9
	.long	.LASF140
	.byte	0x9
	.byte	0xb6
	.long	0x303
	.byte	0x48
	.uleb128 0x9
	.long	.LASF141
	.byte	0x9
	.byte	0xb7
	.long	0x303
	.byte	0x4c
	.uleb128 0x9
	.long	.LASF142
	.byte	0x9
	.byte	0xba
	.long	0x62
	.byte	0x50
	.uleb128 0x9
	.long	.LASF143
	.byte	0x9
	.byte	0xbb
	.long	0x62
	.byte	0x54
	.uleb128 0x9
	.long	.LASF144
	.byte	0x9
	.byte	0xbc
	.long	0x62
	.byte	0x58
	.uleb128 0x9
	.long	.LASF145
	.byte	0x9
	.byte	0xbf
	.long	0x792
	.byte	0x60
	.uleb128 0x9
	.long	.LASF146
	.byte	0x9
	.byte	0xc0
	.long	0x62
	.byte	0x68
	.uleb128 0x9
	.long	.LASF147
	.byte	0x9
	.byte	0xc3
	.long	0x5ae
	.byte	0x70
	.uleb128 0x9
	.long	.LASF148
	.byte	0x9
	.byte	0xc6
	.long	0x62
	.byte	0x88
	.uleb128 0x9
	.long	.LASF149
	.byte	0x9
	.byte	0xc7
	.long	0x62
	.byte	0x8c
	.uleb128 0x9
	.long	.LASF150
	.byte	0x9
	.byte	0xc9
	.long	0x62
	.byte	0x90
	.byte	0
	.uleb128 0x7
	.long	0x62b
	.uleb128 0x6
	.byte	0x8
	.long	0x74b
	.uleb128 0x6
	.byte	0x8
	.long	0x3c7
	.uleb128 0x18
	.long	.LASF151
	.byte	0x10
	.byte	0x9
	.value	0x12b
	.long	0x786
	.uleb128 0xa
	.long	.LASF152
	.byte	0x9
	.value	0x12d
	.long	0x3d8
	.byte	0
	.uleb128 0xa
	.long	.LASF130
	.byte	0x9
	.value	0x12e
	.long	0x62
	.byte	0x4
	.uleb128 0xa
	.long	.LASF153
	.byte	0x9
	.value	0x12f
	.long	0x3c7
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x751
	.uleb128 0x6
	.byte	0x8
	.long	0x397
	.uleb128 0x6
	.byte	0x8
	.long	0x5e2
	.uleb128 0x2
	.long	.LASF154
	.byte	0x9
	.byte	0xcc
	.long	0x7a3
	.uleb128 0x6
	.byte	0x8
	.long	0x740
	.uleb128 0x8
	.long	.LASF155
	.byte	0x28
	.byte	0x9
	.byte	0xdd
	.long	0x7f8
	.uleb128 0x9
	.long	.LASF97
	.byte	0x9
	.byte	0xdf
	.long	0x8f
	.byte	0
	.uleb128 0x9
	.long	.LASF152
	.byte	0x9
	.byte	0xe0
	.long	0x798
	.byte	0x8
	.uleb128 0x9
	.long	.LASF156
	.byte	0x9
	.byte	0xe1
	.long	0x3c7
	.byte	0x10
	.uleb128 0x19
	.string	"x"
	.byte	0x9
	.byte	0xe2
	.long	0x62
	.byte	0x18
	.uleb128 0x19
	.string	"y"
	.byte	0x9
	.byte	0xe3
	.long	0x62
	.byte	0x1c
	.uleb128 0x19
	.string	"z"
	.byte	0x9
	.byte	0xe4
	.long	0x62
	.byte	0x20
	.byte	0
	.uleb128 0x8
	.long	.LASF157
	.byte	0x18
	.byte	0x9
	.byte	0xf0
	.long	0x835
	.uleb128 0x9
	.long	.LASF152
	.byte	0x9
	.byte	0xf2
	.long	0x798
	.byte	0
	.uleb128 0x9
	.long	.LASF158
	.byte	0x9
	.byte	0xf3
	.long	0x62
	.byte	0x8
	.uleb128 0x9
	.long	.LASF159
	.byte	0x9
	.byte	0xf4
	.long	0x62
	.byte	0xc
	.uleb128 0x9
	.long	.LASF160
	.byte	0x9
	.byte	0xf5
	.long	0x3c7
	.byte	0x10
	.byte	0
	.uleb128 0x18
	.long	.LASF161
	.byte	0x10
	.byte	0x9
	.value	0x100
	.long	0x877
	.uleb128 0xa
	.long	.LASF162
	.byte	0x9
	.value	0x102
	.long	0x62
	.byte	0
	.uleb128 0xa
	.long	.LASF163
	.byte	0x9
	.value	0x103
	.long	0x62
	.byte	0x4
	.uleb128 0xa
	.long	.LASF164
	.byte	0x9
	.value	0x104
	.long	0x62
	.byte	0x8
	.uleb128 0xa
	.long	.LASF165
	.byte	0x9
	.value	0x105
	.long	0x62
	.byte	0xc
	.byte	0
	.uleb128 0x1a
	.long	.LASF166
	.byte	0x4
	.long	0x4d
	.byte	0x9
	.value	0x10d
	.long	0x8a1
	.uleb128 0x14
	.long	.LASF167
	.byte	0
	.uleb128 0x14
	.long	.LASF168
	.byte	0x1
	.uleb128 0x14
	.long	.LASF169
	.byte	0x2
	.uleb128 0x14
	.long	.LASF170
	.byte	0x3
	.byte	0
	.uleb128 0x18
	.long	.LASF171
	.byte	0x14
	.byte	0x9
	.value	0x10f
	.long	0x8ef
	.uleb128 0xa
	.long	.LASF152
	.byte	0x9
	.value	0x111
	.long	0x877
	.byte	0
	.uleb128 0xa
	.long	.LASF172
	.byte	0x9
	.value	0x112
	.long	0x303
	.byte	0x4
	.uleb128 0xa
	.long	.LASF173
	.byte	0x9
	.value	0x113
	.long	0x303
	.byte	0x8
	.uleb128 0xa
	.long	.LASF174
	.byte	0x9
	.value	0x114
	.long	0x303
	.byte	0xc
	.uleb128 0x1b
	.string	"dc"
	.byte	0x9
	.value	0x115
	.long	0x303
	.byte	0x10
	.byte	0
	.uleb128 0x15
	.long	.LASF175
	.byte	0x9
	.value	0x117
	.long	0x8a1
	.uleb128 0x18
	.long	.LASF176
	.byte	0x2c
	.byte	0x9
	.value	0x11d
	.long	0x930
	.uleb128 0xa
	.long	.LASF177
	.byte	0x9
	.value	0x11f
	.long	0x303
	.byte	0
	.uleb128 0xa
	.long	.LASF178
	.byte	0x9
	.value	0x120
	.long	0x8ef
	.byte	0x4
	.uleb128 0xa
	.long	.LASF179
	.byte	0x9
	.value	0x121
	.long	0x8ef
	.byte	0x18
	.byte	0
	.uleb128 0x15
	.long	.LASF180
	.byte	0x9
	.value	0x123
	.long	0x8fb
	.uleb128 0x18
	.long	.LASF181
	.byte	0x10
	.byte	0x9
	.value	0x139
	.long	0x97e
	.uleb128 0xa
	.long	.LASF131
	.byte	0x9
	.value	0x13b
	.long	0x303
	.byte	0
	.uleb128 0xa
	.long	.LASF182
	.byte	0x9
	.value	0x13c
	.long	0x303
	.byte	0x4
	.uleb128 0xa
	.long	.LASF183
	.byte	0x9
	.value	0x13d
	.long	0x303
	.byte	0x8
	.uleb128 0xa
	.long	.LASF184
	.byte	0x9
	.value	0x13e
	.long	0x303
	.byte	0xc
	.byte	0
	.uleb128 0x18
	.long	.LASF185
	.byte	0x20
	.byte	0x9
	.value	0x146
	.long	0x9c0
	.uleb128 0xa
	.long	.LASF97
	.byte	0x9
	.value	0x148
	.long	0x8f
	.byte	0
	.uleb128 0xa
	.long	.LASF186
	.byte	0x9
	.value	0x149
	.long	0x62
	.byte	0x8
	.uleb128 0xa
	.long	.LASF187
	.byte	0x9
	.value	0x14a
	.long	0x3c7
	.byte	0x10
	.uleb128 0xa
	.long	.LASF188
	.byte	0x9
	.value	0x14b
	.long	0x3c7
	.byte	0x18
	.byte	0
	.uleb128 0x15
	.long	.LASF189
	.byte	0x9
	.value	0x14d
	.long	0x97e
	.uleb128 0x18
	.long	.LASF190
	.byte	0x18
	.byte	0x9
	.value	0x15c
	.long	0xa0e
	.uleb128 0xa
	.long	.LASF191
	.byte	0x9
	.value	0x15e
	.long	0xa0e
	.byte	0
	.uleb128 0xa
	.long	.LASF192
	.byte	0x9
	.value	0x15f
	.long	0x3c7
	.byte	0x8
	.uleb128 0xa
	.long	.LASF193
	.byte	0x9
	.value	0x160
	.long	0x62
	.byte	0x10
	.uleb128 0xa
	.long	.LASF194
	.byte	0x9
	.value	0x161
	.long	0x62
	.byte	0x14
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xa14
	.uleb128 0x6
	.byte	0x8
	.long	0x9c0
	.uleb128 0x15
	.long	.LASF195
	.byte	0x9
	.value	0x163
	.long	0x9cc
	.uleb128 0x18
	.long	.LASF196
	.byte	0x14
	.byte	0x9
	.value	0x170
	.long	0xa75
	.uleb128 0xa
	.long	.LASF152
	.byte	0x9
	.value	0x172
	.long	0x3fb
	.byte	0
	.uleb128 0xa
	.long	.LASF197
	.byte	0x9
	.value	0x173
	.long	0x303
	.byte	0x4
	.uleb128 0xa
	.long	.LASF198
	.byte	0x9
	.value	0x174
	.long	0x303
	.byte	0x8
	.uleb128 0xa
	.long	.LASF199
	.byte	0x9
	.value	0x175
	.long	0x303
	.byte	0xc
	.uleb128 0xa
	.long	.LASF200
	.byte	0x9
	.value	0x176
	.long	0x303
	.byte	0x10
	.byte	0
	.uleb128 0x1a
	.long	.LASF201
	.byte	0x4
	.long	0x4d
	.byte	0x9
	.value	0x180
	.long	0xa99
	.uleb128 0x14
	.long	.LASF202
	.byte	0
	.uleb128 0x14
	.long	.LASF203
	.byte	0x1
	.uleb128 0x14
	.long	.LASF204
	.byte	0x2
	.byte	0
	.uleb128 0x18
	.long	.LASF205
	.byte	0x48
	.byte	0x9
	.value	0x184
	.long	0xb77
	.uleb128 0xa
	.long	.LASF206
	.byte	0x9
	.value	0x186
	.long	0xa75
	.byte	0
	.uleb128 0xa
	.long	.LASF207
	.byte	0x9
	.value	0x187
	.long	0x303
	.byte	0x4
	.uleb128 0xa
	.long	.LASF208
	.byte	0x9
	.value	0x188
	.long	0x62
	.byte	0x8
	.uleb128 0xa
	.long	.LASF209
	.byte	0x9
	.value	0x189
	.long	0x43b
	.byte	0xc
	.uleb128 0xa
	.long	.LASF210
	.byte	0x9
	.value	0x18a
	.long	0x303
	.byte	0x10
	.uleb128 0xa
	.long	.LASF211
	.byte	0x9
	.value	0x18b
	.long	0x62
	.byte	0x14
	.uleb128 0xa
	.long	.LASF212
	.byte	0x9
	.value	0x18c
	.long	0x47b
	.byte	0x18
	.uleb128 0xa
	.long	.LASF213
	.byte	0x9
	.value	0x18d
	.long	0x8f
	.byte	0x20
	.uleb128 0xa
	.long	.LASF214
	.byte	0x9
	.value	0x18e
	.long	0x458
	.byte	0x28
	.uleb128 0xa
	.long	.LASF215
	.byte	0x9
	.value	0x18f
	.long	0x62
	.byte	0x2c
	.uleb128 0xa
	.long	.LASF216
	.byte	0x9
	.value	0x190
	.long	0x62
	.byte	0x30
	.uleb128 0xa
	.long	.LASF217
	.byte	0x9
	.value	0x191
	.long	0x397
	.byte	0x34
	.uleb128 0xa
	.long	.LASF218
	.byte	0x9
	.value	0x192
	.long	0x62
	.byte	0x38
	.uleb128 0xa
	.long	.LASF219
	.byte	0x9
	.value	0x193
	.long	0x303
	.byte	0x3c
	.uleb128 0xa
	.long	.LASF220
	.byte	0x9
	.value	0x194
	.long	0x62
	.byte	0x40
	.uleb128 0xa
	.long	.LASF221
	.byte	0x9
	.value	0x195
	.long	0x303
	.byte	0x44
	.byte	0
	.uleb128 0x1a
	.long	.LASF222
	.byte	0x4
	.long	0x4d
	.byte	0x9
	.value	0x1b7
	.long	0xb95
	.uleb128 0x14
	.long	.LASF223
	.byte	0
	.uleb128 0x14
	.long	.LASF224
	.byte	0x1
	.byte	0
	.uleb128 0x1a
	.long	.LASF225
	.byte	0x4
	.long	0x4d
	.byte	0x9
	.value	0x1b9
	.long	0xbb9
	.uleb128 0x14
	.long	.LASF226
	.byte	0
	.uleb128 0x14
	.long	.LASF227
	.byte	0x1
	.uleb128 0x14
	.long	.LASF228
	.byte	0x2
	.byte	0
	.uleb128 0x1a
	.long	.LASF229
	.byte	0x4
	.long	0x4d
	.byte	0x9
	.value	0x1bb
	.long	0xbdd
	.uleb128 0x14
	.long	.LASF230
	.byte	0
	.uleb128 0x14
	.long	.LASF231
	.byte	0x1
	.uleb128 0x14
	.long	.LASF232
	.byte	0x2
	.byte	0
	.uleb128 0x18
	.long	.LASF233
	.byte	0x40
	.byte	0x9
	.value	0x1c0
	.long	0xcbb
	.uleb128 0xa
	.long	.LASF234
	.byte	0x9
	.value	0x1c2
	.long	0x303
	.byte	0
	.uleb128 0xa
	.long	.LASF235
	.byte	0x9
	.value	0x1c3
	.long	0x303
	.byte	0x4
	.uleb128 0xa
	.long	.LASF236
	.byte	0x9
	.value	0x1c4
	.long	0x303
	.byte	0x8
	.uleb128 0xa
	.long	.LASF237
	.byte	0x9
	.value	0x1c5
	.long	0x303
	.byte	0xc
	.uleb128 0xa
	.long	.LASF238
	.byte	0x9
	.value	0x1c6
	.long	0x303
	.byte	0x10
	.uleb128 0xa
	.long	.LASF239
	.byte	0x9
	.value	0x1c7
	.long	0x62
	.byte	0x14
	.uleb128 0xa
	.long	.LASF240
	.byte	0x9
	.value	0x1c8
	.long	0x62
	.byte	0x18
	.uleb128 0xa
	.long	.LASF241
	.byte	0x9
	.value	0x1c9
	.long	0xb77
	.byte	0x1c
	.uleb128 0xa
	.long	.LASF242
	.byte	0x9
	.value	0x1ca
	.long	0x62
	.byte	0x20
	.uleb128 0xa
	.long	.LASF243
	.byte	0x9
	.value	0x1cb
	.long	0xb95
	.byte	0x24
	.uleb128 0xa
	.long	.LASF244
	.byte	0x9
	.value	0x1cc
	.long	0xbb9
	.byte	0x28
	.uleb128 0xa
	.long	.LASF245
	.byte	0x9
	.value	0x1cd
	.long	0x303
	.byte	0x2c
	.uleb128 0xa
	.long	.LASF246
	.byte	0x9
	.value	0x1ce
	.long	0x303
	.byte	0x30
	.uleb128 0xa
	.long	.LASF247
	.byte	0x9
	.value	0x1cf
	.long	0x303
	.byte	0x34
	.uleb128 0xa
	.long	.LASF248
	.byte	0x9
	.value	0x1d0
	.long	0x397
	.byte	0x38
	.uleb128 0xa
	.long	.LASF249
	.byte	0x9
	.value	0x1d1
	.long	0x397
	.byte	0x3c
	.byte	0
	.uleb128 0x1a
	.long	.LASF250
	.byte	0x4
	.long	0x4d
	.byte	0x9
	.value	0x1fd
	.long	0xcd9
	.uleb128 0x14
	.long	.LASF251
	.byte	0
	.uleb128 0x14
	.long	.LASF252
	.byte	0x1
	.byte	0
	.uleb128 0x1a
	.long	.LASF253
	.byte	0x4
	.long	0x4d
	.byte	0x9
	.value	0x1ff
	.long	0xd03
	.uleb128 0x14
	.long	.LASF254
	.byte	0
	.uleb128 0x14
	.long	.LASF255
	.byte	0x1
	.uleb128 0x14
	.long	.LASF256
	.byte	0x2
	.uleb128 0x14
	.long	.LASF257
	.byte	0x3
	.byte	0
	.uleb128 0x18
	.long	.LASF258
	.byte	0x20
	.byte	0x9
	.value	0x205
	.long	0xd92
	.uleb128 0xa
	.long	.LASF259
	.byte	0x9
	.value	0x207
	.long	0xcbb
	.byte	0
	.uleb128 0x1b
	.string	"Fs"
	.byte	0x9
	.value	0x208
	.long	0x62
	.byte	0x4
	.uleb128 0xa
	.long	.LASF260
	.byte	0x9
	.value	0x209
	.long	0xcd9
	.byte	0x8
	.uleb128 0xa
	.long	.LASF261
	.byte	0x9
	.value	0x20a
	.long	0x62
	.byte	0xc
	.uleb128 0xa
	.long	.LASF262
	.byte	0x9
	.value	0x20b
	.long	0x5b
	.byte	0x10
	.uleb128 0xa
	.long	.LASF263
	.byte	0x9
	.value	0x20c
	.long	0x5b
	.byte	0x12
	.uleb128 0xa
	.long	.LASF264
	.byte	0x9
	.value	0x20d
	.long	0x5b
	.byte	0x14
	.uleb128 0xa
	.long	.LASF265
	.byte	0x9
	.value	0x20e
	.long	0x5b
	.byte	0x16
	.uleb128 0xa
	.long	.LASF266
	.byte	0x9
	.value	0x20f
	.long	0x303
	.byte	0x18
	.uleb128 0xa
	.long	.LASF267
	.byte	0x9
	.value	0x210
	.long	0x303
	.byte	0x1c
	.byte	0
	.uleb128 0x1a
	.long	.LASF268
	.byte	0x4
	.long	0x4d
	.byte	0x9
	.value	0x230
	.long	0xdbc
	.uleb128 0x14
	.long	.LASF269
	.byte	0
	.uleb128 0x14
	.long	.LASF270
	.byte	0x1
	.uleb128 0x14
	.long	.LASF271
	.byte	0x2
	.uleb128 0x14
	.long	.LASF272
	.byte	0x3
	.byte	0
	.uleb128 0x18
	.long	.LASF273
	.byte	0x48
	.byte	0x9
	.value	0x235
	.long	0xe7e
	.uleb128 0xa
	.long	.LASF274
	.byte	0x9
	.value	0x237
	.long	0x62
	.byte	0
	.uleb128 0xa
	.long	.LASF275
	.byte	0x9
	.value	0x238
	.long	0x62
	.byte	0x4
	.uleb128 0xa
	.long	.LASF276
	.byte	0x9
	.value	0x239
	.long	0x5b
	.byte	0x8
	.uleb128 0xa
	.long	.LASF277
	.byte	0x9
	.value	0x23a
	.long	0x5b
	.byte	0xa
	.uleb128 0xa
	.long	.LASF278
	.byte	0x9
	.value	0x23b
	.long	0x303
	.byte	0xc
	.uleb128 0xa
	.long	.LASF279
	.byte	0x9
	.value	0x23c
	.long	0x303
	.byte	0x10
	.uleb128 0xa
	.long	.LASF280
	.byte	0x9
	.value	0x23d
	.long	0x397
	.byte	0x14
	.uleb128 0xa
	.long	.LASF281
	.byte	0x9
	.value	0x23e
	.long	0x303
	.byte	0x18
	.uleb128 0xa
	.long	.LASF282
	.byte	0x9
	.value	0x23f
	.long	0x303
	.byte	0x1c
	.uleb128 0xa
	.long	.LASF259
	.byte	0x9
	.value	0x240
	.long	0xcbb
	.byte	0x20
	.uleb128 0x1b
	.string	"cb"
	.byte	0x9
	.value	0x241
	.long	0x78c
	.byte	0x28
	.uleb128 0xa
	.long	.LASF283
	.byte	0x9
	.value	0x242
	.long	0x62
	.byte	0x30
	.uleb128 0x1b
	.string	"sb"
	.byte	0x9
	.value	0x243
	.long	0x78c
	.byte	0x38
	.uleb128 0xa
	.long	.LASF284
	.byte	0x9
	.value	0x244
	.long	0x62
	.byte	0x40
	.byte	0
	.uleb128 0x15
	.long	.LASF285
	.byte	0x9
	.value	0x246
	.long	0xdbc
	.uleb128 0x18
	.long	.LASF286
	.byte	0x28
	.byte	0x9
	.value	0x25b
	.long	0xefe
	.uleb128 0xa
	.long	.LASF287
	.byte	0x9
	.value	0x25d
	.long	0x397
	.byte	0
	.uleb128 0x1b
	.string	"R"
	.byte	0x9
	.value	0x25e
	.long	0x303
	.byte	0x4
	.uleb128 0x1b
	.string	"Cin"
	.byte	0x9
	.value	0x25f
	.long	0x303
	.byte	0x8
	.uleb128 0xa
	.long	.LASF288
	.byte	0x9
	.value	0x260
	.long	0x303
	.byte	0xc
	.uleb128 0xa
	.long	.LASF289
	.byte	0x9
	.value	0x261
	.long	0x303
	.byte	0x10
	.uleb128 0xa
	.long	.LASF290
	.byte	0x9
	.value	0x262
	.long	0x303
	.byte	0x14
	.uleb128 0xa
	.long	.LASF291
	.byte	0x9
	.value	0x263
	.long	0x303
	.byte	0x18
	.uleb128 0xa
	.long	.LASF97
	.byte	0x9
	.value	0x264
	.long	0x8f
	.byte	0x20
	.byte	0
	.uleb128 0x1a
	.long	.LASF292
	.byte	0x4
	.long	0x4d
	.byte	0x9
	.value	0x275
	.long	0xf22
	.uleb128 0x14
	.long	.LASF293
	.byte	0
	.uleb128 0x14
	.long	.LASF294
	.byte	0x1
	.uleb128 0x14
	.long	.LASF295
	.byte	0x2
	.byte	0
	.uleb128 0x1a
	.long	.LASF296
	.byte	0x4
	.long	0x4d
	.byte	0x9
	.value	0x2b6
	.long	0xf5e
	.uleb128 0x14
	.long	.LASF297
	.byte	0
	.uleb128 0x14
	.long	.LASF298
	.byte	0x1
	.uleb128 0x14
	.long	.LASF299
	.byte	0x2
	.uleb128 0x14
	.long	.LASF300
	.byte	0x3
	.uleb128 0x14
	.long	.LASF301
	.byte	0x4
	.uleb128 0x14
	.long	.LASF302
	.byte	0x5
	.uleb128 0x14
	.long	.LASF303
	.byte	0x6
	.byte	0
	.uleb128 0x15
	.long	.LASF304
	.byte	0x9
	.value	0x2b8
	.long	0xf22
	.uleb128 0x18
	.long	.LASF305
	.byte	0x10
	.byte	0x9
	.value	0x2c3
	.long	0xf9f
	.uleb128 0xa
	.long	.LASF150
	.byte	0x9
	.value	0x2c5
	.long	0x62
	.byte	0
	.uleb128 0xa
	.long	.LASF306
	.byte	0x9
	.value	0x2c6
	.long	0x5b
	.byte	0x4
	.uleb128 0xa
	.long	.LASF307
	.byte	0x9
	.value	0x2c7
	.long	0xf9f
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xf6a
	.uleb128 0x18
	.long	.LASF308
	.byte	0x40
	.byte	0x9
	.value	0x2d5
	.long	0x10a6
	.uleb128 0xa
	.long	.LASF309
	.byte	0x9
	.value	0x2d7
	.long	0x5b
	.byte	0
	.uleb128 0xa
	.long	.LASF310
	.byte	0x9
	.value	0x2d8
	.long	0x5b
	.byte	0x2
	.uleb128 0xa
	.long	.LASF311
	.byte	0x9
	.value	0x2d9
	.long	0x5b
	.byte	0x4
	.uleb128 0xa
	.long	.LASF312
	.byte	0x9
	.value	0x2da
	.long	0x5b
	.byte	0x6
	.uleb128 0xa
	.long	.LASF313
	.byte	0x9
	.value	0x2dc
	.long	0x5b
	.byte	0x8
	.uleb128 0xa
	.long	.LASF314
	.byte	0x9
	.value	0x2de
	.long	0x5b
	.byte	0xa
	.uleb128 0x1b
	.string	"occ"
	.byte	0x9
	.value	0x2df
	.long	0x5b
	.byte	0xc
	.uleb128 0xa
	.long	.LASF131
	.byte	0x9
	.value	0x2e0
	.long	0x5b
	.byte	0xe
	.uleb128 0xa
	.long	.LASF315
	.byte	0x9
	.value	0x2e1
	.long	0x5b
	.byte	0x10
	.uleb128 0xa
	.long	.LASF316
	.byte	0x9
	.value	0x2e2
	.long	0x5b
	.byte	0x12
	.uleb128 0xa
	.long	.LASF152
	.byte	0x9
	.value	0x2e3
	.long	0xf5e
	.byte	0x14
	.uleb128 0xa
	.long	.LASF317
	.byte	0x9
	.value	0x2e4
	.long	0x3c7
	.byte	0x18
	.uleb128 0xa
	.long	.LASF318
	.byte	0x9
	.value	0x2e5
	.long	0x10a6
	.byte	0x20
	.uleb128 0x1b
	.string	"R"
	.byte	0x9
	.value	0x2e7
	.long	0x303
	.byte	0x28
	.uleb128 0x1b
	.string	"C"
	.byte	0x9
	.value	0x2e8
	.long	0x303
	.byte	0x2c
	.uleb128 0xa
	.long	.LASF319
	.byte	0x9
	.value	0x2ea
	.long	0xefe
	.byte	0x30
	.uleb128 0xa
	.long	.LASF320
	.byte	0x9
	.value	0x2eb
	.long	0xd92
	.byte	0x34
	.uleb128 0xa
	.long	.LASF321
	.byte	0x9
	.value	0x2ec
	.long	0x62
	.byte	0x38
	.uleb128 0xa
	.long	.LASF322
	.byte	0x9
	.value	0x2ed
	.long	0x62
	.byte	0x3c
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x5b
	.uleb128 0x15
	.long	.LASF323
	.byte	0x9
	.value	0x2ef
	.long	0xfa5
	.uleb128 0x18
	.long	.LASF324
	.byte	0x20
	.byte	0x9
	.value	0x31f
	.long	0x112e
	.uleb128 0xa
	.long	.LASF325
	.byte	0x9
	.value	0x321
	.long	0x303
	.byte	0
	.uleb128 0xa
	.long	.LASF326
	.byte	0x9
	.value	0x322
	.long	0x303
	.byte	0x4
	.uleb128 0xa
	.long	.LASF327
	.byte	0x9
	.value	0x323
	.long	0x62
	.byte	0x8
	.uleb128 0xa
	.long	.LASF328
	.byte	0x9
	.value	0x324
	.long	0x62
	.byte	0xc
	.uleb128 0xa
	.long	.LASF329
	.byte	0x9
	.value	0x325
	.long	0x303
	.byte	0x10
	.uleb128 0xa
	.long	.LASF330
	.byte	0x9
	.value	0x326
	.long	0x303
	.byte	0x14
	.uleb128 0xa
	.long	.LASF331
	.byte	0x9
	.value	0x327
	.long	0x303
	.byte	0x18
	.uleb128 0xa
	.long	.LASF332
	.byte	0x9
	.value	0x328
	.long	0x303
	.byte	0x1c
	.byte	0
	.uleb128 0x15
	.long	.LASF333
	.byte	0x9
	.value	0x32a
	.long	0x10b8
	.uleb128 0x10
	.long	.LASF334
	.byte	0xa
	.byte	0x1
	.long	0x397
	.uleb128 0x10
	.long	.LASF335
	.byte	0xa
	.byte	0x2
	.long	0x8f
	.uleb128 0x10
	.long	.LASF336
	.byte	0xa
	.byte	0x4
	.long	0x303
	.uleb128 0x10
	.long	.LASF337
	.byte	0xa
	.byte	0x5
	.long	0x303
	.uleb128 0x10
	.long	.LASF338
	.byte	0xa
	.byte	0x7
	.long	0x62
	.uleb128 0x1c
	.string	"net"
	.byte	0xa
	.byte	0x8
	.long	0x117c
	.uleb128 0x6
	.byte	0x8
	.long	0x49e
	.uleb128 0x10
	.long	.LASF339
	.byte	0xa
	.byte	0xa
	.long	0x62
	.uleb128 0x10
	.long	.LASF340
	.byte	0xa
	.byte	0xb
	.long	0x1198
	.uleb128 0x6
	.byte	0x8
	.long	0x7a9
	.uleb128 0x1c
	.string	"nx"
	.byte	0xa
	.byte	0xe
	.long	0x62
	.uleb128 0x1c
	.string	"ny"
	.byte	0xa
	.byte	0xe
	.long	0x62
	.uleb128 0x10
	.long	.LASF341
	.byte	0xa
	.byte	0x11
	.long	0x3c7
	.uleb128 0x10
	.long	.LASF342
	.byte	0xa
	.byte	0x11
	.long	0x3c7
	.uleb128 0x10
	.long	.LASF343
	.byte	0xa
	.byte	0x12
	.long	0x11d3
	.uleb128 0x6
	.byte	0x8
	.long	0x11d9
	.uleb128 0x6
	.byte	0x8
	.long	0x7f8
	.uleb128 0x10
	.long	.LASF344
	.byte	0xa
	.byte	0x15
	.long	0x11ea
	.uleb128 0x6
	.byte	0x8
	.long	0xf9f
	.uleb128 0x10
	.long	.LASF345
	.byte	0xa
	.byte	0x15
	.long	0x11ea
	.uleb128 0x10
	.long	.LASF346
	.byte	0xa
	.byte	0x18
	.long	0x62
	.uleb128 0x10
	.long	.LASF347
	.byte	0xa
	.byte	0x19
	.long	0x1211
	.uleb128 0x6
	.byte	0x8
	.long	0x10ac
	.uleb128 0x10
	.long	.LASF348
	.byte	0xa
	.byte	0x1a
	.long	0x62
	.uleb128 0x10
	.long	.LASF349
	.byte	0xa
	.byte	0x1b
	.long	0x122d
	.uleb128 0x6
	.byte	0x8
	.long	0x112e
	.uleb128 0x10
	.long	.LASF350
	.byte	0xa
	.byte	0x1c
	.long	0x123e
	.uleb128 0x6
	.byte	0x8
	.long	0x1244
	.uleb128 0x6
	.byte	0x8
	.long	0x124a
	.uleb128 0x6
	.byte	0x8
	.long	0x3cd
	.uleb128 0x10
	.long	.LASF351
	.byte	0xa
	.byte	0x1d
	.long	0x74b
	.uleb128 0x10
	.long	.LASF352
	.byte	0xa
	.byte	0x1e
	.long	0x1266
	.uleb128 0x6
	.byte	0x8
	.long	0xe8a
	.uleb128 0x10
	.long	.LASF353
	.byte	0xa
	.byte	0x1f
	.long	0x74b
	.uleb128 0x10
	.long	.LASF354
	.byte	0xa
	.byte	0x22
	.long	0x798
	.uleb128 0x10
	.long	.LASF355
	.byte	0xa
	.byte	0x25
	.long	0x798
	.uleb128 0x10
	.long	.LASF356
	.byte	0xa
	.byte	0x28
	.long	0x798
	.uleb128 0x10
	.long	.LASF357
	.byte	0xa
	.byte	0x2b
	.long	0x62
	.uleb128 0x10
	.long	.LASF358
	.byte	0xa
	.byte	0x2c
	.long	0x12ae
	.uleb128 0x6
	.byte	0x8
	.long	0x62b
	.uleb128 0x8
	.long	.LASF359
	.byte	0x4
	.byte	0xb
	.byte	0x1
	.long	0x12d9
	.uleb128 0x9
	.long	.LASF360
	.byte	0xb
	.byte	0x3
	.long	0x46
	.byte	0
	.uleb128 0x9
	.long	.LASF361
	.byte	0xb
	.byte	0x4
	.long	0x46
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF362
	.byte	0xb
	.byte	0x7
	.long	0x12b4
	.uleb128 0x10
	.long	.LASF363
	.byte	0xc
	.byte	0xc
	.long	0x518
	.uleb128 0x10
	.long	.LASF364
	.byte	0xc
	.byte	0xd
	.long	0x518
	.uleb128 0x10
	.long	.LASF365
	.byte	0xc
	.byte	0xe
	.long	0x518
	.uleb128 0x10
	.long	.LASF366
	.byte	0xc
	.byte	0xf
	.long	0x518
	.uleb128 0x10
	.long	.LASF367
	.byte	0xd
	.byte	0x14
	.long	0x518
	.uleb128 0x17
	.long	.LASF368
	.byte	0x4
	.long	0x4d
	.byte	0x1
	.byte	0x1e
	.long	0x1338
	.uleb128 0x14
	.long	.LASF369
	.byte	0
	.uleb128 0x14
	.long	.LASF370
	.byte	0x1
	.byte	0
	.uleb128 0x1d
	.long	.LASF371
	.byte	0x1
	.byte	0x2d
	.long	0x3c7
	.uleb128 0x9
	.byte	0x3
	.quad	duplicate_pins
	.uleb128 0x1d
	.long	.LASF372
	.byte	0x1
	.byte	0x32
	.long	0x74b
	.uleb128 0x9
	.byte	0x3
	.quad	unique_pin_list
	.uleb128 0x1d
	.long	.LASF373
	.byte	0x1
	.byte	0x36
	.long	0x51e
	.uleb128 0x9
	.byte	0x3
	.quad	net_cost
	.uleb128 0x1d
	.long	.LASF374
	.byte	0x1
	.byte	0x36
	.long	0x51e
	.uleb128 0x9
	.byte	0x3
	.quad	temp_net_cost
	.uleb128 0x1d
	.long	.LASF375
	.byte	0x1
	.byte	0x3b
	.long	0x518
	.uleb128 0x9
	.byte	0x3
	.quad	point_to_point_timing_cost
	.uleb128 0x1d
	.long	.LASF376
	.byte	0x1
	.byte	0x3c
	.long	0x518
	.uleb128 0x9
	.byte	0x3
	.quad	temp_point_to_point_timing_cost
	.uleb128 0x1d
	.long	.LASF377
	.byte	0x1
	.byte	0x42
	.long	0x518
	.uleb128 0x9
	.byte	0x3
	.quad	point_to_point_delay_cost
	.uleb128 0x1d
	.long	.LASF378
	.byte	0x1
	.byte	0x43
	.long	0x518
	.uleb128 0x9
	.byte	0x3
	.quad	temp_point_to_point_delay_cost
	.uleb128 0x1d
	.long	.LASF379
	.byte	0x1
	.byte	0x4a
	.long	0x74b
	.uleb128 0x9
	.byte	0x3
	.quad	net_pin_index
	.uleb128 0x1d
	.long	.LASF380
	.byte	0x1
	.byte	0x51
	.long	0x140a
	.uleb128 0x9
	.byte	0x3
	.quad	bb_coords
	.uleb128 0x6
	.byte	0x8
	.long	0x835
	.uleb128 0x1d
	.long	.LASF381
	.byte	0x1
	.byte	0x51
	.long	0x140a
	.uleb128 0x9
	.byte	0x3
	.quad	bb_num_on_edges
	.uleb128 0x1d
	.long	.LASF382
	.byte	0x1
	.byte	0x58
	.long	0x143a
	.uleb128 0x9
	.byte	0x3
	.quad	place_region_x
	.uleb128 0x6
	.byte	0x8
	.long	0x1440
	.uleb128 0x6
	.byte	0x8
	.long	0x93c
	.uleb128 0x1d
	.long	.LASF383
	.byte	0x1
	.byte	0x58
	.long	0x143a
	.uleb128 0x9
	.byte	0x3
	.quad	place_region_y
	.uleb128 0x1d
	.long	.LASF384
	.byte	0x1
	.byte	0x5c
	.long	0x51e
	.uleb128 0x9
	.byte	0x3
	.quad	place_region_bounds_x
	.uleb128 0x1d
	.long	.LASF385
	.byte	0x1
	.byte	0x5c
	.long	0x51e
	.uleb128 0x9
	.byte	0x3
	.quad	place_region_bounds_y
	.uleb128 0x1d
	.long	.LASF386
	.byte	0x1
	.byte	0x66
	.long	0x518
	.uleb128 0x9
	.byte	0x3
	.quad	chanx_place_cost_fac
	.uleb128 0x1d
	.long	.LASF387
	.byte	0x1
	.byte	0x66
	.long	0x518
	.uleb128 0x9
	.byte	0x3
	.quad	chany_place_cost_fac
	.uleb128 0xc
	.long	0x30a
	.long	0x14bf
	.uleb128 0xd
	.long	0x86
	.byte	0x31
	.byte	0
	.uleb128 0x7
	.long	0x14af
	.uleb128 0x1d
	.long	.LASF388
	.byte	0x1
	.byte	0x6c
	.long	0x14bf
	.uleb128 0x9
	.byte	0x3
	.quad	cross_count
	.uleb128 0x1e
	.long	.LASF399
	.byte	0x1
	.value	0xef2
	.quad	.LFB39
	.quad	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.long	0x15ef
	.uleb128 0x1f
	.long	.LASF389
	.byte	0x1
	.value	0xef2
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1f
	.long	.LASF390
	.byte	0x1
	.value	0xef3
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1f
	.long	.LASF209
	.byte	0x1
	.value	0xef4
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x1f
	.long	.LASF215
	.byte	0x1
	.value	0xef5
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1f
	.long	.LASF206
	.byte	0x1
	.value	0xef6
	.long	0xa75
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x1f
	.long	.LASF391
	.byte	0x1
	.value	0xef7
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x20
	.long	.LASF392
	.byte	0x1
	.value	0xf00
	.long	0x3c7
	.uleb128 0x9
	.byte	0x3
	.quad	bdone.5356
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0xf01
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x21
	.string	"j"
	.byte	0x1
	.value	0xf01
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x21
	.string	"k"
	.byte	0x1
	.value	0xf01
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x20
	.long	.LASF393
	.byte	0x1
	.value	0xf01
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.long	.LASF394
	.byte	0x1
	.value	0xf01
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.long	.LASF395
	.byte	0x1
	.value	0xf02
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.long	.LASF396
	.byte	0x1
	.value	0xf03
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x20
	.long	.LASF397
	.byte	0x1
	.value	0xf04
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.long	.LASF398
	.byte	0x1
	.value	0xf04
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x1e
	.long	.LASF400
	.byte	0x1
	.value	0xe91
	.quad	.LFB38
	.quad	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.long	0x1648
	.uleb128 0x1f
	.long	.LASF210
	.byte	0x1
	.value	0xe91
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x21
	.string	"low"
	.byte	0x1
	.value	0xea0
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x20
	.long	.LASF401
	.byte	0x1
	.value	0xea0
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0xea0
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x1e
	.long	.LASF402
	.byte	0x1
	.value	0xe7c
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.long	0x1674
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0xe82
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1e
	.long	.LASF403
	.byte	0x1
	.value	0xe01
	.quad	.LFB36
	.quad	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.long	0x17a3
	.uleb128 0x1f
	.long	.LASF212
	.byte	0x1
	.value	0xe01
	.long	0x47b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x1f
	.long	.LASF213
	.byte	0x1
	.value	0xe02
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x18
	.long	.LASF404
	.byte	0xc
	.byte	0x1
	.value	0xe06
	.long	0x16e1
	.uleb128 0x1b
	.string	"x"
	.byte	0x1
	.value	0xe08
	.long	0x62
	.byte	0
	.uleb128 0x1b
	.string	"y"
	.byte	0x1
	.value	0xe09
	.long	0x62
	.byte	0x4
	.uleb128 0x1b
	.string	"z"
	.byte	0x1
	.value	0xe0a
	.long	0x62
	.byte	0x8
	.byte	0
	.uleb128 0x21
	.string	"pos"
	.byte	0x1
	.value	0xe0c
	.long	0x17a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0xe0d
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x21
	.string	"j"
	.byte	0x1
	.value	0xe0d
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x21
	.string	"k"
	.byte	0x1
	.value	0xe0d
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.long	.LASF405
	.byte	0x1
	.value	0xe0d
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.long	.LASF406
	.byte	0x1
	.value	0xe0d
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x20
	.long	.LASF407
	.byte	0x1
	.value	0xe0d
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x21
	.string	"x"
	.byte	0x1
	.value	0xe0d
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x21
	.string	"y"
	.byte	0x1
	.value	0xe0d
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x21
	.string	"z"
	.byte	0x1
	.value	0xe0d
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x20
	.long	.LASF408
	.byte	0x1
	.value	0xe0e
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x20
	.long	.LASF150
	.byte	0x1
	.value	0xe0e
	.long	0x3c7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x22
	.long	.LASF508
	.long	0x17bf
	.uleb128 0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.5286
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x17a9
	.uleb128 0x6
	.byte	0x8
	.long	0x16b2
	.uleb128 0xc
	.long	0x9c
	.long	0x17bf
	.uleb128 0xd
	.long	0x86
	.byte	0x11
	.byte	0
	.uleb128 0x7
	.long	0x17af
	.uleb128 0x1e
	.long	.LASF409
	.byte	0x1
	.value	0xd0e
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.long	0x184c
	.uleb128 0x1f
	.long	.LASF410
	.byte	0x1
	.value	0xd0e
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1f
	.long	.LASF411
	.byte	0x1
	.value	0xd0f
	.long	0x140a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1f
	.long	.LASF412
	.byte	0x1
	.value	0xd10
	.long	0x140a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1f
	.long	.LASF413
	.byte	0x1
	.value	0xd11
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1f
	.long	.LASF414
	.byte	0x1
	.value	0xd12
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1f
	.long	.LASF415
	.byte	0x1
	.value	0xd13
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1f
	.long	.LASF416
	.byte	0x1
	.value	0xd14
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x23
	.long	.LASF417
	.byte	0x1
	.value	0xcd0
	.quad	.LFB34
	.quad	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.long	0x18ec
	.uleb128 0x1f
	.long	.LASF410
	.byte	0x1
	.value	0xcd0
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1f
	.long	.LASF411
	.byte	0x1
	.value	0xcd1
	.long	0x140a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x21
	.string	"k"
	.byte	0x1
	.value	0xcdd
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x20
	.long	.LASF163
	.byte	0x1
	.value	0xcdd
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.long	.LASF165
	.byte	0x1
	.value	0xcdd
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x20
	.long	.LASF162
	.byte	0x1
	.value	0xcdd
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.long	.LASF164
	.byte	0x1
	.value	0xcdd
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x21
	.string	"x"
	.byte	0x1
	.value	0xcdd
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x21
	.string	"y"
	.byte	0x1
	.value	0xcdd
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x24
	.long	.LASF421
	.byte	0x1
	.value	0xca8
	.long	0x303
	.quad	.LFB33
	.quad	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.long	0x194b
	.uleb128 0x1f
	.long	.LASF410
	.byte	0x1
	.value	0xca8
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1f
	.long	.LASF418
	.byte	0x1
	.value	0xca9
	.long	0x140a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.long	.LASF419
	.byte	0x1
	.value	0xcaf
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.long	.LASF420
	.byte	0x1
	.value	0xcaf
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x24
	.long	.LASF422
	.byte	0x1
	.value	0xc7c
	.long	0x30f
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.long	0x19aa
	.uleb128 0x1f
	.long	.LASF410
	.byte	0x1
	.value	0xc7c
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1f
	.long	.LASF418
	.byte	0x1
	.value	0xc7d
	.long	0x140a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.long	.LASF419
	.byte	0x1
	.value	0xc83
	.long	0x30f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.long	.LASF420
	.byte	0x1
	.value	0xc83
	.long	0x30f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x23
	.long	.LASF423
	.byte	0x1
	.value	0xc07
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0x1aca
	.uleb128 0x1f
	.long	.LASF410
	.byte	0x1
	.value	0xc07
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x1f
	.long	.LASF424
	.byte	0x1
	.value	0xc08
	.long	0x140a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1f
	.long	.LASF425
	.byte	0x1
	.value	0xc09
	.long	0x140a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x20
	.long	.LASF426
	.byte	0x1
	.value	0xc11
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x20
	.long	.LASF394
	.byte	0x1
	.value	0xc11
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x21
	.string	"x"
	.byte	0x1
	.value	0xc11
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x21
	.string	"y"
	.byte	0x1
	.value	0xc11
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x20
	.long	.LASF162
	.byte	0x1
	.value	0xc11
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.long	.LASF163
	.byte	0x1
	.value	0xc11
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x20
	.long	.LASF164
	.byte	0x1
	.value	0xc11
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.long	.LASF165
	.byte	0x1
	.value	0xc11
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x20
	.long	.LASF427
	.byte	0x1
	.value	0xc12
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.long	.LASF428
	.byte	0x1
	.value	0xc12
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.long	.LASF429
	.byte	0x1
	.value	0xc12
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.long	.LASF430
	.byte	0x1
	.value	0xc12
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x20
	.long	.LASF431
	.byte	0x1
	.value	0xc13
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x20
	.long	.LASF432
	.byte	0x1
	.value	0xc14
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0x1e
	.long	.LASF433
	.byte	0x1
	.value	0xbbe
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0x1b53
	.uleb128 0x20
	.long	.LASF410
	.byte	0x1
	.value	0xbc7
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x20
	.long	.LASF426
	.byte	0x1
	.value	0xbc7
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.long	.LASF394
	.byte	0x1
	.value	0xbc7
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x20
	.long	.LASF434
	.byte	0x1
	.value	0xbc7
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.long	.LASF435
	.byte	0x1
	.value	0xbc7
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.long	.LASF158
	.byte	0x1
	.value	0xbc7
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x20
	.long	.LASF436
	.byte	0x1
	.value	0xbc8
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0x1e
	.long	.LASF437
	.byte	0x1
	.value	0xba4
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0x1b90
	.uleb128 0x20
	.long	.LASF438
	.byte	0x1
	.value	0xba9
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x20
	.long	.LASF410
	.byte	0x1
	.value	0xba9
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1e
	.long	.LASF439
	.byte	0x1
	.value	0xb2d
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x1c6f
	.uleb128 0x1f
	.long	.LASF215
	.byte	0x1
	.value	0xb2d
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0xb33
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x21
	.string	"j"
	.byte	0x1
	.value	0xb33
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.long	.LASF440
	.byte	0x1
	.value	0xb33
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.long	.LASF441
	.byte	0x1
	.value	0xb33
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x20
	.long	.LASF442
	.byte	0x1
	.value	0xb33
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x20
	.long	.LASF443
	.byte	0x1
	.value	0xb34
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.long	.LASF444
	.byte	0x1
	.value	0xb34
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.long	.LASF131
	.byte	0x1
	.value	0xb34
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x21
	.string	"fac"
	.byte	0x1
	.value	0xb34
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x20
	.long	.LASF445
	.byte	0x1
	.value	0xb34
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x20
	.long	.LASF446
	.byte	0x1
	.value	0xb35
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x20
	.long	.LASF447
	.byte	0x1
	.value	0xb35
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0x1e
	.long	.LASF448
	.byte	0x1
	.value	0xb13
	.quad	.LFB27
	.quad	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0x1c9d
	.uleb128 0x1f
	.long	.LASF215
	.byte	0x1
	.value	0xb13
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1e
	.long	.LASF449
	.byte	0x1
	.value	0xa97
	.quad	.LFB26
	.quad	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0x1d52
	.uleb128 0x1f
	.long	.LASF209
	.byte	0x1
	.value	0xa97
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1f
	.long	.LASF215
	.byte	0x1
	.value	0xa98
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1f
	.long	.LASF210
	.byte	0x1
	.value	0xa99
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1f
	.long	.LASF450
	.byte	0x1
	.value	0xa9a
	.long	0x1d52
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1f
	.long	.LASF451
	.byte	0x1
	.value	0xa9b
	.long	0x1d52
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1f
	.long	.LASF452
	.byte	0x1
	.value	0xa9c
	.long	0xa99
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x20
	.long	.LASF410
	.byte	0x1
	.value	0xaa2
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x20
	.long	.LASF426
	.byte	0x1
	.value	0xaa2
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.long	.LASF453
	.byte	0x1
	.value	0xaa2
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0xaa2
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x518
	.uleb128 0x1e
	.long	.LASF454
	.byte	0x1
	.value	0xa50
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x1dd1
	.uleb128 0x1f
	.long	.LASF209
	.byte	0x1
	.value	0xa50
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1f
	.long	.LASF215
	.byte	0x1
	.value	0xa51
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1f
	.long	.LASF450
	.byte	0x1
	.value	0xa52
	.long	0x518
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1f
	.long	.LASF451
	.byte	0x1
	.value	0xa53
	.long	0x518
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1f
	.long	.LASF452
	.byte	0x1
	.value	0xa54
	.long	0xa99
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x20
	.long	.LASF410
	.byte	0x1
	.value	0xa5a
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1e
	.long	.LASF455
	.byte	0x1
	.value	0xa3e
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x1dff
	.uleb128 0x1f
	.long	.LASF215
	.byte	0x1
	.value	0xa3e
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1e
	.long	.LASF456
	.byte	0x1
	.value	0x9d0
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x1fbe
	.uleb128 0x1f
	.long	.LASF410
	.byte	0x1
	.value	0x9d0
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x1f
	.long	.LASF424
	.byte	0x1
	.value	0x9d1
	.long	0x140a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x1f
	.long	.LASF457
	.byte	0x1
	.value	0x9d2
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x1f
	.long	.LASF215
	.byte	0x1
	.value	0x9d3
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -132
	.uleb128 0x20
	.long	.LASF458
	.byte	0x1
	.value	0x9db
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.long	.LASF459
	.byte	0x1
	.value	0x9db
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x20
	.long	.LASF460
	.byte	0x1
	.value	0x9db
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.long	.LASF461
	.byte	0x1
	.value	0x9db
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.long	.LASF420
	.byte	0x1
	.value	0x9db
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x20
	.long	.LASF462
	.byte	0x1
	.value	0x9dc
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.long	.LASF463
	.byte	0x1
	.value	0x9dc
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x20
	.long	.LASF464
	.byte	0x1
	.value	0x9dd
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x20
	.long	.LASF465
	.byte	0x1
	.value	0x9dd
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x20
	.long	.LASF466
	.byte	0x1
	.value	0x9de
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x20
	.long	.LASF467
	.byte	0x1
	.value	0x9de
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x20
	.long	.LASF468
	.byte	0x1
	.value	0x9de
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x20
	.long	.LASF469
	.byte	0x1
	.value	0x9de
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x20
	.long	.LASF470
	.byte	0x1
	.value	0x9df
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x20
	.long	.LASF471
	.byte	0x1
	.value	0x9df
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x20
	.long	.LASF472
	.byte	0x1
	.value	0x9df
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x20
	.long	.LASF473
	.byte	0x1
	.value	0x9df
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x20
	.long	.LASF474
	.byte	0x1
	.value	0x9e0
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x20
	.long	.LASF475
	.byte	0x1
	.value	0x9e0
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x20
	.long	.LASF476
	.byte	0x1
	.value	0x9e0
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x20
	.long	.LASF477
	.byte	0x1
	.value	0x9e0
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0x9e0
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x21
	.string	"j"
	.byte	0x1
	.value	0x9e0
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x24
	.long	.LASF478
	.byte	0x1
	.value	0x994
	.long	0x303
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x2028
	.uleb128 0x1f
	.long	.LASF215
	.byte	0x1
	.value	0x994
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x20
	.long	.LASF184
	.byte	0x1
	.value	0x9a0
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x21
	.string	"tmp"
	.byte	0x1
	.value	0x9a0
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0x9a1
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x21
	.string	"j"
	.byte	0x1
	.value	0x9a1
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x25
	.long	.LASF479
	.byte	0x1
	.value	0x93e
	.long	0x303
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x20c0
	.uleb128 0x1f
	.long	.LASF480
	.byte	0x1
	.value	0x93e
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1f
	.long	.LASF209
	.byte	0x1
	.value	0x93f
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1f
	.long	.LASF215
	.byte	0x1
	.value	0x940
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0x94c
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x21
	.string	"j"
	.byte	0x1
	.value	0x94c
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x21
	.string	"k"
	.byte	0x1
	.value	0x94c
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.long	.LASF184
	.byte	0x1
	.value	0x94d
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.long	.LASF481
	.byte	0x1
	.value	0x94e
	.long	0x30f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x1e
	.long	.LASF482
	.byte	0x1
	.value	0x910
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x2157
	.uleb128 0x1f
	.long	.LASF390
	.byte	0x1
	.value	0x910
	.long	0x51e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1f
	.long	.LASF483
	.byte	0x1
	.value	0x911
	.long	0x51e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x20
	.long	.LASF410
	.byte	0x1
	.value	0x917
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x20
	.long	.LASF426
	.byte	0x1
	.value	0x917
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.long	.LASF484
	.byte	0x1
	.value	0x918
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x20
	.long	.LASF485
	.byte	0x1
	.value	0x918
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.long	.LASF486
	.byte	0x1
	.value	0x918
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x20
	.long	.LASF487
	.byte	0x1
	.value	0x919
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x1e
	.long	.LASF488
	.byte	0x1
	.value	0x868
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x222a
	.uleb128 0x1f
	.long	.LASF489
	.byte	0x1
	.value	0x868
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1f
	.long	.LASF490
	.byte	0x1
	.value	0x869
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1f
	.long	.LASF491
	.byte	0x1
	.value	0x86a
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1f
	.long	.LASF492
	.byte	0x1
	.value	0x86b
	.long	0x51e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1f
	.long	.LASF493
	.byte	0x1
	.value	0x86c
	.long	0x51e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x20
	.long	.LASF410
	.byte	0x1
	.value	0x874
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x21
	.string	"k"
	.byte	0x1
	.value	0x874
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x20
	.long	.LASF494
	.byte	0x1
	.value	0x874
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.long	.LASF426
	.byte	0x1
	.value	0x874
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.long	.LASF495
	.byte	0x1
	.value	0x875
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x20
	.long	.LASF496
	.byte	0x1
	.value	0x875
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.long	.LASF497
	.byte	0x1
	.value	0x875
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x23
	.long	.LASF498
	.byte	0x1
	.value	0x7ef
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x22b2
	.uleb128 0x1f
	.long	.LASF489
	.byte	0x1
	.value	0x7ef
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1f
	.long	.LASF490
	.byte	0x1
	.value	0x7f0
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1f
	.long	.LASF491
	.byte	0x1
	.value	0x7f1
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.long	.LASF499
	.byte	0x1
	.value	0x7f6
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x20
	.long	.LASF494
	.byte	0x1
	.value	0x7f6
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.long	.LASF410
	.byte	0x1
	.value	0x7f6
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x20
	.long	.LASF426
	.byte	0x1
	.value	0x7f6
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x25
	.long	.LASF500
	.byte	0x1
	.value	0x7b0
	.long	0x303
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x2371
	.uleb128 0x1f
	.long	.LASF410
	.byte	0x1
	.value	0x7b0
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1f
	.long	.LASF426
	.byte	0x1
	.value	0x7b1
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x20
	.long	.LASF501
	.byte	0x1
	.value	0x7b6
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.long	.LASF502
	.byte	0x1
	.value	0x7b6
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x20
	.long	.LASF503
	.byte	0x1
	.value	0x7b7
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x20
	.long	.LASF504
	.byte	0x1
	.value	0x7b7
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x20
	.long	.LASF505
	.byte	0x1
	.value	0x7b8
	.long	0x798
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.long	.LASF506
	.byte	0x1
	.value	0x7b8
	.long	0x798
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.long	.LASF507
	.byte	0x1
	.value	0x7b9
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x22
	.long	.LASF508
	.long	0x2381
	.uleb128 0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.4943
	.byte	0
	.uleb128 0xc
	.long	0x9c
	.long	0x2381
	.uleb128 0xd
	.long	0x86
	.byte	0x1c
	.byte	0
	.uleb128 0x7
	.long	0x2371
	.uleb128 0x25
	.long	.LASF509
	.byte	0x1
	.value	0x777
	.long	0x303
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x23ff
	.uleb128 0x1f
	.long	.LASF209
	.byte	0x1
	.value	0x777
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1f
	.long	.LASF215
	.byte	0x1
	.value	0x778
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0x77f
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x21
	.string	"j"
	.byte	0x1
	.value	0x77f
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.long	.LASF410
	.byte	0x1
	.value	0x77f
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x20
	.long	.LASF184
	.byte	0x1
	.value	0x780
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x25
	.long	.LASF510
	.byte	0x1
	.value	0x751
	.long	0x62
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x246b
	.uleb128 0x1f
	.long	.LASF511
	.byte	0x1
	.value	0x751
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x26
	.string	"t"
	.byte	0x1
	.value	0x752
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.long	.LASF512
	.byte	0x1
	.value	0x757
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x20
	.long	.LASF513
	.byte	0x1
	.value	0x758
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x20
	.long	.LASF514
	.byte	0x1
	.value	0x758
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x25
	.long	.LASF515
	.byte	0x1
	.value	0x68f
	.long	0x397
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x25d5
	.uleb128 0x1f
	.long	.LASF516
	.byte	0x1
	.value	0x68f
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x1f
	.long	.LASF517
	.byte	0x1
	.value	0x690
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x1f
	.long	.LASF152
	.byte	0x1
	.value	0x691
	.long	0x798
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x1f
	.long	.LASF518
	.byte	0x1
	.value	0x692
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x1f
	.long	.LASF519
	.byte	0x1
	.value	0x693
	.long	0x3c7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x1f
	.long	.LASF520
	.byte	0x1
	.value	0x694
	.long	0x3c7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x1f
	.long	.LASF521
	.byte	0x1
	.value	0x695
	.long	0x3c7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x20
	.long	.LASF522
	.byte	0x1
	.value	0x69d
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x20
	.long	.LASF523
	.byte	0x1
	.value	0x69d
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x20
	.long	.LASF524
	.byte	0x1
	.value	0x69d
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x20
	.long	.LASF525
	.byte	0x1
	.value	0x69d
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x21
	.string	"rlx"
	.byte	0x1
	.value	0x69d
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x21
	.string	"rly"
	.byte	0x1
	.value	0x69d
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x20
	.long	.LASF526
	.byte	0x1
	.value	0x69d
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x20
	.long	.LASF527
	.byte	0x1
	.value	0x69d
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x20
	.long	.LASF528
	.byte	0x1
	.value	0x69d
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x20
	.long	.LASF529
	.byte	0x1
	.value	0x69d
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x20
	.long	.LASF530
	.byte	0x1
	.value	0x69e
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0x69e
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x21
	.string	"j"
	.byte	0x1
	.value	0x69e
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x22
	.long	.LASF508
	.long	0x25e5
	.uleb128 0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.4899
	.byte	0
	.uleb128 0xc
	.long	0x9c
	.long	0x25e5
	.uleb128 0xd
	.long	0x86
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.long	0x25d5
	.uleb128 0x25
	.long	.LASF531
	.byte	0x1
	.value	0x635
	.long	0x62
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x2692
	.uleb128 0x1f
	.long	.LASF532
	.byte	0x1
	.value	0x635
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1f
	.long	.LASF533
	.byte	0x1
	.value	0x636
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1f
	.long	.LASF489
	.byte	0x1
	.value	0x637
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1f
	.long	.LASF490
	.byte	0x1
	.value	0x638
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1f
	.long	.LASF491
	.byte	0x1
	.value	0x639
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x21
	.string	"k"
	.byte	0x1
	.value	0x641
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x20
	.long	.LASF410
	.byte	0x1
	.value	0x641
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.long	.LASF534
	.byte	0x1
	.value	0x641
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.long	.LASF408
	.byte	0x1
	.value	0x641
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x23
	.long	.LASF535
	.byte	0x1
	.value	0x61f
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x26f8
	.uleb128 0x1f
	.long	.LASF450
	.byte	0x1
	.value	0x61f
	.long	0x518
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1f
	.long	.LASF451
	.byte	0x1
	.value	0x620
	.long	0x518
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1f
	.long	.LASF215
	.byte	0x1
	.value	0x621
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0x627
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x21
	.string	"j"
	.byte	0x1
	.value	0x627
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x23
	.long	.LASF536
	.byte	0x1
	.value	0x609
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x275e
	.uleb128 0x1f
	.long	.LASF450
	.byte	0x1
	.value	0x609
	.long	0x518
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1f
	.long	.LASF451
	.byte	0x1
	.value	0x60a
	.long	0x518
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1f
	.long	.LASF215
	.byte	0x1
	.value	0x60b
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0x611
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x21
	.string	"j"
	.byte	0x1
	.value	0x611
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x25
	.long	.LASF537
	.byte	0x1
	.value	0x4de
	.long	0x62
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x2a16
	.uleb128 0x26
	.string	"t"
	.byte	0x1
	.value	0x4de
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -132
	.uleb128 0x1f
	.long	.LASF184
	.byte	0x1
	.value	0x4df
	.long	0x51e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x1f
	.long	.LASF389
	.byte	0x1
	.value	0x4e0
	.long	0x51e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x1f
	.long	.LASF390
	.byte	0x1
	.value	0x4e1
	.long	0x51e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x1f
	.long	.LASF518
	.byte	0x1
	.value	0x4e2
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x1f
	.long	.LASF209
	.byte	0x1
	.value	0x4e3
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -164
	.uleb128 0x1f
	.long	.LASF450
	.byte	0x1
	.value	0x4e4
	.long	0x518
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x1f
	.long	.LASF451
	.byte	0x1
	.value	0x4e5
	.long	0x518
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x1f
	.long	.LASF215
	.byte	0x1
	.value	0x4e6
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1f
	.long	.LASF538
	.byte	0x1
	.value	0x4e7
	.long	0x397
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1f
	.long	.LASF206
	.byte	0x1
	.value	0x4e8
	.long	0xa75
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1f
	.long	.LASF207
	.byte	0x1
	.value	0x4e9
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x1f
	.long	.LASF539
	.byte	0x1
	.value	0x4ea
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -188
	.uleb128 0x1f
	.long	.LASF540
	.byte	0x1
	.value	0x4eb
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x1f
	.long	.LASF391
	.byte	0x1
	.value	0x4ec
	.long	0x51e
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x1f
	.long	.LASF519
	.byte	0x1
	.value	0x4ed
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x20
	.long	.LASF489
	.byte	0x1
	.value	0x4f6
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x20
	.long	.LASF520
	.byte	0x1
	.value	0x4f6
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x20
	.long	.LASF521
	.byte	0x1
	.value	0x4f6
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x20
	.long	.LASF541
	.byte	0x1
	.value	0x4f6
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.long	.LASF516
	.byte	0x1
	.value	0x4f6
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x20
	.long	.LASF517
	.byte	0x1
	.value	0x4f6
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x20
	.long	.LASF542
	.byte	0x1
	.value	0x4f6
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x20
	.long	.LASF490
	.byte	0x1
	.value	0x4f6
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0x4f7
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x21
	.string	"k"
	.byte	0x1
	.value	0x4f7
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x20
	.long	.LASF410
	.byte	0x1
	.value	0x4f7
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x20
	.long	.LASF543
	.byte	0x1
	.value	0x4f7
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x20
	.long	.LASF491
	.byte	0x1
	.value	0x4f7
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x20
	.long	.LASF453
	.byte	0x1
	.value	0x4f7
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x20
	.long	.LASF544
	.byte	0x1
	.value	0x4f8
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x20
	.long	.LASF545
	.byte	0x1
	.value	0x4f8
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x20
	.long	.LASF511
	.byte	0x1
	.value	0x4f9
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x20
	.long	.LASF546
	.byte	0x1
	.value	0x4f9
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x20
	.long	.LASF547
	.byte	0x1
	.value	0x4f9
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x20
	.long	.LASF548
	.byte	0x1
	.value	0x4f9
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x20
	.long	.LASF549
	.byte	0x1
	.value	0x4f9
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x20
	.long	.LASF411
	.byte	0x1
	.value	0x4fa
	.long	0x140a
	.uleb128 0x9
	.byte	0x3
	.quad	bb_coord_new.4805
	.uleb128 0x20
	.long	.LASF412
	.byte	0x1
	.value	0x4fb
	.long	0x140a
	.uleb128 0x9
	.byte	0x3
	.quad	bb_edge_new.4806
	.uleb128 0x20
	.long	.LASF532
	.byte	0x1
	.value	0x4fc
	.long	0x3c7
	.uleb128 0x9
	.byte	0x3
	.quad	nets_to_update.4807
	.uleb128 0x20
	.long	.LASF533
	.byte	0x1
	.value	0x4fc
	.long	0x3c7
	.uleb128 0x9
	.byte	0x3
	.quad	net_block_moved.4808
	.byte	0
	.uleb128 0x25
	.long	.LASF550
	.byte	0x1
	.value	0x48c
	.long	0x303
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x2b99
	.uleb128 0x1f
	.long	.LASF551
	.byte	0x1
	.value	0x48c
	.long	0x51e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1f
	.long	.LASF552
	.byte	0x1
	.value	0x48d
	.long	0x51e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1f
	.long	.LASF553
	.byte	0x1
	.value	0x48e
	.long	0x51e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1f
	.long	.LASF209
	.byte	0x1
	.value	0x48f
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x1f
	.long	.LASF450
	.byte	0x1
	.value	0x490
	.long	0x518
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x1f
	.long	.LASF451
	.byte	0x1
	.value	0x491
	.long	0x518
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x1f
	.long	.LASF215
	.byte	0x1
	.value	0x492
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1f
	.long	.LASF538
	.byte	0x1
	.value	0x493
	.long	0x397
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1f
	.long	.LASF554
	.byte	0x1
	.value	0x494
	.long	0xa26
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1f
	.long	.LASF555
	.byte	0x1
	.value	0x495
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x1f
	.long	.LASF518
	.byte	0x1
	.value	0x496
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1f
	.long	.LASF206
	.byte	0x1
	.value	0x497
	.long	0xa75
	.uleb128 0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x1f
	.long	.LASF207
	.byte	0x1
	.value	0x498
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x1f
	.long	.LASF539
	.byte	0x1
	.value	0x499
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x1f
	.long	.LASF540
	.byte	0x1
	.value	0x49a
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -124
	.uleb128 0x1f
	.long	.LASF556
	.byte	0x1
	.value	0x49b
	.long	0x51e
	.uleb128 0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0x4a0
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x20
	.long	.LASF557
	.byte	0x1
	.value	0x4a0
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.long	.LASF558
	.byte	0x1
	.value	0x4a0
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x20
	.long	.LASF559
	.byte	0x1
	.value	0x4a1
	.long	0x30f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x21
	.string	"av"
	.byte	0x1
	.value	0x4a1
	.long	0x30f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.long	.LASF560
	.byte	0x1
	.value	0x4a1
	.long	0x30f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.long	.LASF519
	.byte	0x1
	.value	0x4a2
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x24
	.long	.LASF561
	.byte	0x1
	.value	0x46b
	.long	0x62
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x2be7
	.uleb128 0x26
	.string	"t"
	.byte	0x1
	.value	0x46b
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1f
	.long	.LASF184
	.byte	0x1
	.value	0x46c
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1f
	.long	.LASF554
	.byte	0x1
	.value	0x46d
	.long	0xa26
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x23
	.long	.LASF562
	.byte	0x1
	.value	0x434
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x2c4f
	.uleb128 0x26
	.string	"t"
	.byte	0x1
	.value	0x434
	.long	0x51e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1f
	.long	.LASF559
	.byte	0x1
	.value	0x435
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1f
	.long	.LASF518
	.byte	0x1
	.value	0x436
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1f
	.long	.LASF563
	.byte	0x1
	.value	0x437
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1f
	.long	.LASF554
	.byte	0x1
	.value	0x438
	.long	0xa26
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x23
	.long	.LASF564
	.byte	0x1
	.value	0x422
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x2c9b
	.uleb128 0x1f
	.long	.LASF518
	.byte	0x1
	.value	0x422
	.long	0x51e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1f
	.long	.LASF563
	.byte	0x1
	.value	0x423
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.long	.LASF565
	.byte	0x1
	.value	0x429
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x25
	.long	.LASF566
	.byte	0x1
	.value	0x407
	.long	0x30f
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x2cf8
	.uleb128 0x26
	.string	"n"
	.byte	0x1
	.value	0x407
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1f
	.long	.LASF567
	.byte	0x1
	.value	0x408
	.long	0x30f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1f
	.long	.LASF568
	.byte	0x1
	.value	0x409
	.long	0x30f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x20
	.long	.LASF559
	.byte	0x1
	.value	0x411
	.long	0x30f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x23
	.long	.LASF569
	.byte	0x1
	.value	0x3e4
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x2d71
	.uleb128 0x20
	.long	.LASF410
	.byte	0x1
	.value	0x3e9
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x20
	.long	.LASF570
	.byte	0x1
	.value	0x3e9
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x21
	.string	"blk"
	.byte	0x1
	.value	0x3e9
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.long	.LASF405
	.byte	0x1
	.value	0x3e9
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x20
	.long	.LASF426
	.byte	0x1
	.value	0x3e9
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.long	.LASF152
	.byte	0x1
	.value	0x3ea
	.long	0x798
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x24
	.long	.LASF571
	.byte	0x1
	.value	0x3d0
	.long	0x62
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x2db2
	.uleb128 0x20
	.long	.LASF408
	.byte	0x1
	.value	0x3d4
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x20
	.long	.LASF410
	.byte	0x1
	.value	0x3d4
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x27
	.long	.LASF610
	.byte	0x1
	.value	0x128
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x3149
	.uleb128 0x1f
	.long	.LASF452
	.byte	0x1
	.value	0x128
	.long	0xa99
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1f
	.long	.LASF554
	.byte	0x1
	.value	0x129
	.long	0xa26
	.uleb128 0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x1f
	.long	.LASF572
	.byte	0x1
	.value	0x12a
	.long	0x930
	.uleb128 0x3
	.byte	0x91
	.sleb128 96
	.uleb128 0x1f
	.long	.LASF573
	.byte	0x1
	.value	0x12b
	.long	0xbdd
	.uleb128 0x3
	.byte	0x91
	.sleb128 144
	.uleb128 0x1f
	.long	.LASF574
	.byte	0x1
	.value	0x12c
	.long	0xd03
	.uleb128 0x3
	.byte	0x91
	.sleb128 208
	.uleb128 0x1f
	.long	.LASF575
	.byte	0x1
	.value	0x12d
	.long	0x3149
	.uleb128 0x3
	.byte	0x91
	.sleb128 -584
	.uleb128 0x1f
	.long	.LASF576
	.byte	0x1
	.value	0x12e
	.long	0x560
	.uleb128 0x3
	.byte	0x91
	.sleb128 -600
	.uleb128 0x1f
	.long	.LASF577
	.byte	0x1
	.value	0x12f
	.long	0x314f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -608
	.uleb128 0x26
	.string	"mst"
	.byte	0x1
	.value	0x130
	.long	0x3155
	.uleb128 0x3
	.byte	0x91
	.sleb128 -616
	.uleb128 0x20
	.long	.LASF578
	.byte	0x1
	.value	0x13b
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x20
	.long	.LASF579
	.byte	0x1
	.value	0x13b
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.long	.LASF580
	.byte	0x1
	.value	0x13b
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.long	.LASF558
	.byte	0x1
	.value	0x13c
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.long	.LASF581
	.byte	0x1
	.value	0x13c
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x20
	.long	.LASF582
	.byte	0x1
	.value	0x13c
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -164
	.uleb128 0x21
	.string	"t"
	.byte	0x1
	.value	0x13d
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -204
	.uleb128 0x20
	.long	.LASF563
	.byte	0x1
	.value	0x13d
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x20
	.long	.LASF518
	.byte	0x1
	.value	0x13d
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x20
	.long	.LASF583
	.byte	0x1
	.value	0x13d
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x20
	.long	.LASF584
	.byte	0x1
	.value	0x13d
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x20
	.long	.LASF184
	.byte	0x1
	.value	0x13e
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -212
	.uleb128 0x20
	.long	.LASF390
	.byte	0x1
	.value	0x13e
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0x20
	.long	.LASF389
	.byte	0x1
	.value	0x13e
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -220
	.uleb128 0x20
	.long	.LASF585
	.byte	0x1
	.value	0x13e
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -180
	.uleb128 0x20
	.long	.LASF586
	.byte	0x1
	.value	0x13e
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x20
	.long	.LASF391
	.byte	0x1
	.value	0x13f
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -228
	.uleb128 0x20
	.long	.LASF587
	.byte	0x1
	.value	0x13f
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x20
	.long	.LASF588
	.byte	0x1
	.value	0x13f
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x20
	.long	.LASF539
	.byte	0x1
	.value	0x140
	.long	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x20
	.long	.LASF540
	.byte	0x1
	.value	0x140
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x20
	.long	.LASF589
	.byte	0x1
	.value	0x141
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -196
	.uleb128 0x20
	.long	.LASF590
	.byte	0x1
	.value	0x142
	.long	0x30f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x20
	.long	.LASF591
	.byte	0x1
	.value	0x142
	.long	0x30f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x20
	.long	.LASF592
	.byte	0x1
	.value	0x142
	.long	0x30f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x20
	.long	.LASF593
	.byte	0x1
	.value	0x142
	.long	0x30f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x20
	.long	.LASF560
	.byte	0x1
	.value	0x143
	.long	0x30f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x20
	.long	.LASF559
	.byte	0x1
	.value	0x143
	.long	0x30f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x20
	.long	.LASF450
	.byte	0x1
	.value	0x144
	.long	0x518
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x20
	.long	.LASF451
	.byte	0x1
	.value	0x144
	.long	0x518
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0x21
	.string	"msg"
	.byte	0x1
	.value	0x145
	.long	0x3167
	.uleb128 0x3
	.byte	0x91
	.sleb128 -560
	.uleb128 0x20
	.long	.LASF538
	.byte	0x1
	.value	0x146
	.long	0x397
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x20
	.long	.LASF594
	.byte	0x1
	.value	0x147
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x20
	.long	.LASF410
	.byte	0x1
	.value	0x148
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -124
	.uleb128 0x20
	.long	.LASF426
	.byte	0x1
	.value	0x148
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x20
	.long	.LASF595
	.byte	0x1
	.value	0x148
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -132
	.uleb128 0x20
	.long	.LASF596
	.byte	0x1
	.value	0x148
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x20
	.long	.LASF597
	.byte	0x1
	.value	0x149
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -140
	.uleb128 0x20
	.long	.LASF598
	.byte	0x1
	.value	0x14a
	.long	0x518
	.uleb128 0x3
	.byte	0x91
	.sleb128 -568
	.uleb128 0x20
	.long	.LASF599
	.byte	0x1
	.value	0x14a
	.long	0x518
	.uleb128 0x3
	.byte	0x91
	.sleb128 -576
	.uleb128 0x20
	.long	.LASF600
	.byte	0x1
	.value	0x14b
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x20
	.long	.LASF601
	.byte	0x1
	.value	0x14c
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x20
	.long	.LASF602
	.byte	0x1
	.value	0x14c
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -172
	.uleb128 0x20
	.long	.LASF603
	.byte	0x1
	.value	0x14c
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x20
	.long	.LASF604
	.byte	0x1
	.value	0x14d
	.long	0x518
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x20
	.long	.LASF519
	.byte	0x1
	.value	0x14f
	.long	0x3c7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x22
	.long	.LASF508
	.long	0x3188
	.uleb128 0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.4679
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xe7e
	.uleb128 0x6
	.byte	0x8
	.long	0xa1a
	.uleb128 0x6
	.byte	0x8
	.long	0x315b
	.uleb128 0x6
	.byte	0x8
	.long	0x3161
	.uleb128 0x6
	.byte	0x8
	.long	0x12d9
	.uleb128 0xc
	.long	0x95
	.long	0x3178
	.uleb128 0x28
	.long	0x86
	.value	0x12b
	.byte	0
	.uleb128 0xc
	.long	0x9c
	.long	0x3188
	.uleb128 0xd
	.long	0x86
	.byte	0x9
	.byte	0
	.uleb128 0x7
	.long	0x3178
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF306:
	.string	"iswitch"
.LASF315:
	.string	"fan_in"
.LASF327:
	.string	"ortho_cost_index"
.LASF155:
	.string	"s_block"
.LASF462:
	.string	"inv_region_len"
.LASF7:
	.string	"size_t"
.LASF384:
	.string	"place_region_bounds_x"
.LASF289:
	.string	"Tdel"
.LASF10:
	.string	"sizetype"
.LASF356:
	.string	"FILL_TYPE"
.LASF459:
	.string	"net_xmax"
.LASF541:
	.string	"z_to"
.LASF568:
	.string	"av_x"
.LASF537:
	.string	"try_swap"
.LASF350:
	.string	"rr_node_indices"
.LASF399:
	.string	"check_place"
.LASF498:
	.string	"update_td_cost"
.LASF571:
	.string	"count_connections"
.LASF320:
	.string	"drivers"
.LASF95:
	.string	"USER"
.LASF145:
	.string	"grid_loc_def"
.LASF126:
	.string	"repeat"
.LASF189:
	.string	"t_subblock"
.LASF386:
	.string	"chanx_place_cost_fac"
.LASF48:
	.string	"_IO_2_1_stderr_"
.LASF361:
	.string	"to_node"
.LASF221:
	.string	"td_place_exp_last"
.LASF553:
	.string	"timing_cost_ptr"
.LASF403:
	.string	"initial_placement"
.LASF326:
	.string	"saved_base_cost"
.LASF464:
	.string	"inv_bb_len"
.LASF527:
	.string	"max_x"
.LASF529:
	.string	"max_y"
.LASF23:
	.string	"_IO_save_end"
.LASF525:
	.string	"iplace"
.LASF101:
	.string	"is_global"
.LASF495:
	.string	"delta_timing_cost"
.LASF59:
	.string	"_XOPEN_"
.LASF531:
	.string	"find_affected_nets"
.LASF121:
	.string	"COL_REPEAT"
.LASF352:
	.string	"switch_inf"
.LASF519:
	.string	"x_lookup"
.LASF148:
	.string	"num_drivers"
.LASF278:
	.string	"frac_cb"
.LASF102:
	.string	"s_T_subblock"
.LASF262:
	.string	"num_switch"
.LASF284:
	.string	"sb_len"
.LASF581:
	.string	"moves_since_cost_recompute"
.LASF246:
	.string	"max_criticality"
.LASF364:
	.string	"delta_fb_to_fb"
.LASF526:
	.string	"min_x"
.LASF290:
	.string	"mux_trans_size"
.LASF16:
	.string	"_IO_write_base"
.LASF456:
	.string	"update_region_occ"
.LASF406:
	.string	"choice"
.LASF476:
	.string	"jmin"
.LASF533:
	.string	"net_block_moved"
.LASF137:
	.string	"is_global_pin"
.LASF32:
	.string	"_lock"
.LASF257:
	.string	"FULL"
.LASF466:
	.string	"overlap_xlow"
.LASF431:
	.string	"n_pins"
.LASF319:
	.string	"direction"
.LASF215:
	.string	"num_regions"
.LASF88:
	.string	"pfreq"
.LASF103:
	.string	"T_comb"
.LASF378:
	.string	"temp_point_to_point_delay_cost"
.LASF330:
	.string	"T_linear"
.LASF152:
	.string	"type"
.LASF149:
	.string	"num_receivers"
.LASF340:
	.string	"block"
.LASF21:
	.string	"_IO_save_base"
.LASF506:
	.string	"sink_type"
.LASF191:
	.string	"subblock_inf"
.LASF206:
	.string	"place_algorithm"
.LASF223:
	.string	"GLOBAL"
.LASF123:
	.string	"s_grid_loc_def"
.LASF347:
	.string	"rr_node"
.LASF234:
	.string	"first_iter_pres_fac"
.LASF380:
	.string	"bb_coords"
.LASF304:
	.string	"t_rr_type"
.LASF272:
	.string	"SINGLE"
.LASF25:
	.string	"_chain"
.LASF346:
	.string	"num_rr_nodes"
.LASF29:
	.string	"_cur_column"
.LASF52:
	.string	"sys_nerr"
.LASF465:
	.string	"inv_bb_height"
.LASF216:
	.string	"recompute_crit_iter"
.LASF60:
	.string	"_POSIX_"
.LASF322:
	.string	"num_opin_drivers"
.LASF444:
	.string	"high_lim"
.LASF227:
	.string	"TIMING_DRIVEN"
.LASF201:
	.string	"e_place_algorithm"
.LASF260:
	.string	"switch_block_type"
.LASF463:
	.string	"inv_region_height"
.LASF296:
	.string	"e_rr_type"
.LASF75:
	.string	"DRIVER"
.LASF338:
	.string	"num_nets"
.LASF261:
	.string	"num_segment"
.LASF521:
	.string	"y_to"
.LASF566:
	.string	"get_std_dev"
.LASF139:
	.string	"is_Fc_out_full_flex"
.LASF494:
	.string	"net_pin"
.LASF134:
	.string	"num_class"
.LASF203:
	.string	"NET_TIMING_DRIVEN_PLACE"
.LASF550:
	.string	"starting_t"
.LASF6:
	.string	"long int"
.LASF240:
	.string	"bb_factor"
.LASF409:
	.string	"update_bb"
.LASF332:
	.string	"C_load"
.LASF253:
	.string	"e_switch_block_type"
.LASF87:
	.string	"NONLINEAR_CONG"
.LASF473:
	.string	"y_occupancy"
.LASF269:
	.string	"MULTI_BUFFERED"
.LASF534:
	.string	"affected_index"
.LASF398:
	.string	"delay_cost_check"
.LASF42:
	.string	"_IO_marker"
.LASF106:
	.string	"t_T_subblock"
.LASF365:
	.string	"delta_fb_to_io"
.LASF122:
	.string	"COL_REL"
.LASF288:
	.string	"Cout"
.LASF472:
	.string	"x_occupancy"
.LASF393:
	.string	"error"
.LASF559:
	.string	"std_dev"
.LASF217:
	.string	"enable_timing_computations"
.LASF438:
	.string	"any_dup"
.LASF169:
	.string	"PULSE"
.LASF401:
	.string	"high"
.LASF220:
	.string	"seed"
.LASF193:
	.string	"num_ff"
.LASF179:
	.string	"chan_y_dist"
.LASF588:
	.string	"place_delay_value"
.LASF124:
	.string	"grid_loc_type"
.LASF166:
	.string	"e_stat"
.LASF210:
	.string	"place_cost_exp"
.LASF442:
	.string	"rnum"
.LASF270:
	.string	"MULTI_MUXED"
.LASF452:
	.string	"placer_opts"
.LASF231:
	.string	"DELAY_NORMALIZED"
.LASF4:
	.string	"signed char"
.LASF73:
	.string	"t_ivec"
.LASF200:
	.string	"exit_t"
.LASF163:
	.string	"xmax"
.LASF311:
	.string	"ylow"
.LASF41:
	.string	"_IO_FILE"
.LASF564:
	.string	"update_rlim"
.LASF185:
	.string	"s_subblock"
.LASF69:
	.string	"boolean"
.LASF508:
	.string	"__PRETTY_FUNCTION__"
.LASF487:
	.string	"temp_timing_cost"
.LASF175:
	.string	"t_chan"
.LASF172:
	.string	"peak"
.LASF1:
	.string	"unsigned char"
.LASF94:
	.string	"RANDOM"
.LASF117:
	.string	"t_type_timing_inf"
.LASF518:
	.string	"rlim"
.LASF589:
	.string	"oldt"
.LASF604:
	.string	"remember_net_delay_original_ptr"
.LASF447:
	.string	"height_fac"
.LASF92:
	.string	"e_pad_loc_type"
.LASF457:
	.string	"add_or_sub"
.LASF93:
	.string	"FREE"
.LASF416:
	.string	"ynew"
.LASF182:
	.string	"inv_capacity"
.LASF422:
	.string	"get_net_wirelength_estimate"
.LASF502:
	.string	"sink_block"
.LASF377:
	.string	"point_to_point_delay_cost"
.LASF229:
	.string	"e_base_cost_type"
.LASF362:
	.string	"t_mst_edge"
.LASF318:
	.string	"switches"
.LASF100:
	.string	"node_block_pin"
.LASF397:
	.string	"timing_cost_check"
.LASF609:
	.string	"_IO_FILE_plus"
.LASF256:
	.string	"UNIVERSAL"
.LASF301:
	.string	"CHANX"
.LASF302:
	.string	"CHANY"
.LASF299:
	.string	"IPIN"
.LASF410:
	.string	"inet"
.LASF441:
	.string	"high_block"
.LASF11:
	.string	"char"
.LASF142:
	.string	"max_subblocks"
.LASF381:
	.string	"bb_num_on_edges"
.LASF241:
	.string	"route_type"
.LASF268:
	.string	"e_drivers"
.LASF184:
	.string	"cost"
.LASF509:
	.string	"recompute_bb_cost"
.LASF583:
	.string	"d_max"
.LASF458:
	.string	"net_xmin"
.LASF592:
	.string	"av_timing_cost"
.LASF109:
	.string	"C_ipin_cblock"
.LASF198:
	.string	"init_t"
.LASF230:
	.string	"INTRINSIC_DELAY"
.LASF455:
	.string	"free_place_regions"
.LASF131:
	.string	"capacity"
.LASF81:
	.string	"pic_type"
.LASF608:
	.string	"_IO_lock_t"
.LASF497:
	.string	"temp_delay"
.LASF440:
	.string	"low_block"
.LASF146:
	.string	"num_grid_loc_def"
.LASF428:
	.string	"xmax_edge"
.LASF298:
	.string	"SINK"
.LASF348:
	.string	"num_rr_indexed_data"
.LASF593:
	.string	"av_delay_cost"
.LASF528:
	.string	"min_y"
.LASF339:
	.string	"num_blocks"
.LASF478:
	.string	"nonlinear_cong_cost"
.LASF13:
	.string	"_IO_read_ptr"
.LASF475:
	.string	"imax"
.LASF375:
	.string	"point_to_point_timing_cost"
.LASF281:
	.string	"Rmetal"
.LASF45:
	.string	"_pos"
.LASF49:
	.string	"stdin"
.LASF212:
	.string	"pad_loc_type"
.LASF79:
	.string	"AUTO_SCHED"
.LASF574:
	.string	"det_routing_arch"
.LASF337:
	.string	"ipin_mux_trans_size"
.LASF575:
	.string	"segment_inf"
.LASF418:
	.string	"bbptr"
.LASF516:
	.string	"x_from"
.LASF82:
	.string	"NO_PICTURE"
.LASF110:
	.string	"T_ipin_cblock"
.LASF53:
	.string	"sys_errlist"
.LASF426:
	.string	"ipin"
.LASF404:
	.string	"s_pos"
.LASF267:
	.string	"R_minW_pmos"
.LASF238:
	.string	"bend_cost"
.LASF252:
	.string	"BI_DIRECTIONAL"
.LASF236:
	.string	"pres_fac_mult"
.LASF436:
	.string	"times_listed"
.LASF24:
	.string	"_markers"
.LASF294:
	.string	"DEC_DIRECTION"
.LASF505:
	.string	"source_type"
.LASF286:
	.string	"s_switch_inf"
.LASF513:
	.string	"prob_fac"
.LASF391:
	.string	"delay_cost"
.LASF538:
	.string	"fixed_pins"
.LASF225:
	.string	"e_router_algorithm"
.LASF76:
	.string	"RECEIVER"
.LASF328:
	.string	"seg_index"
.LASF580:
	.string	"success_sum"
.LASF89:
	.string	"PLACE_NEVER"
.LASF437:
	.string	"free_unique_pin_list"
.LASF407:
	.string	"type_index"
.LASF600:
	.string	"crit_exponent"
.LASF446:
	.string	"len_fac"
.LASF202:
	.string	"BOUNDING_BOX_PLACE"
.LASF544:
	.string	"num_nets_affected"
.LASF597:
	.string	"inner_recompute_limit"
.LASF248:
	.string	"verify_binary_search"
.LASF140:
	.string	"Fc_in"
.LASF480:
	.string	"method"
.LASF33:
	.string	"_offset"
.LASF254:
	.string	"SUBSET"
.LASF287:
	.string	"buffered"
.LASF536:
	.string	"save_region_occ"
.LASF595:
	.string	"outer_crit_iter_count"
.LASF74:
	.string	"OPEN"
.LASF111:
	.string	"t_timing_inf"
.LASF90:
	.string	"PLACE_ONCE"
.LASF150:
	.string	"index"
.LASF279:
	.string	"frac_sb"
.LASF125:
	.string	"start_col"
.LASF277:
	.string	"opin_switch"
.LASF313:
	.string	"ptc_num"
.LASF190:
	.string	"s_subblock_data"
.LASF247:
	.string	"criticality_exp"
.LASF554:
	.string	"annealing_sched"
.LASF276:
	.string	"wire_switch"
.LASF46:
	.string	"_IO_2_1_stdin_"
.LASF0:
	.string	"long unsigned int"
.LASF577:
	.string	"subblock_data_ptr"
.LASF245:
	.string	"astar_fac"
.LASF285:
	.string	"t_segment_inf"
.LASF291:
	.string	"buf_size"
.LASF484:
	.string	"loc_timing_cost"
.LASF351:
	.string	"net_rr_terminals"
.LASF606:
	.string	"./SRC/place.c"
.LASF265:
	.string	"wire_to_ipin_switch"
.LASF27:
	.string	"_flags2"
.LASF499:
	.string	"blkpin"
.LASF305:
	.string	"s_trace"
.LASF545:
	.string	"bb_index"
.LASF258:
	.string	"s_det_routing_arch"
.LASF15:
	.string	"_IO_read_base"
.LASF341:
	.string	"chan_width_x"
.LASF342:
	.string	"chan_width_y"
.LASF129:
	.string	"s_type_descriptor"
.LASF167:
	.string	"UNIFORM"
.LASF58:
	.string	"_SVID_"
.LASF143:
	.string	"max_subblock_inputs"
.LASF344:
	.string	"trace_head"
.LASF40:
	.string	"_unused2"
.LASF197:
	.string	"inner_num"
.LASF308:
	.string	"s_rr_node"
.LASF425:
	.string	"num_on_edges"
.LASF405:
	.string	"iblk"
.LASF153:
	.string	"pinlist"
.LASF91:
	.string	"PLACE_ALWAYS"
.LASF310:
	.string	"xhigh"
.LASF396:
	.string	"usage_check"
.LASF293:
	.string	"INC_DIRECTION"
.LASF181:
	.string	"s_place_region"
.LASF461:
	.string	"net_ymax"
.LASF186:
	.string	"clock"
.LASF115:
	.string	"T_sblk_opin_to_fb_opin"
.LASF174:
	.string	"xpeak"
.LASF567:
	.string	"sum_x_squared"
.LASF162:
	.string	"xmin"
.LASF28:
	.string	"_old_offset"
.LASF414:
	.string	"yold"
.LASF331:
	.string	"T_quadratic"
.LASF488:
	.string	"comp_delta_td_cost"
.LASF196:
	.string	"s_annealing_sched"
.LASF572:
	.string	"chan_width_dist"
.LASF222:
	.string	"e_route_type"
.LASF85:
	.string	"place_c_types"
.LASF483:
	.string	"connection_delay_sum"
.LASF602:
	.string	"final_rlim"
.LASF557:
	.string	"num_accepted"
.LASF445:
	.string	"block_capacity"
.LASF549:
	.string	"newcost"
.LASF99:
	.string	"node_block"
.LASF558:
	.string	"move_lim"
.LASF249:
	.string	"full_stats"
.LASF492:
	.string	"delta_timing"
.LASF563:
	.string	"success_rat"
.LASF64:
	.string	"long long int"
.LASF173:
	.string	"width"
.LASF449:
	.string	"alloc_and_load_placement_structs"
.LASF450:
	.string	"old_region_occ_x"
.LASF451:
	.string	"old_region_occ_y"
.LASF98:
	.string	"num_sinks"
.LASF390:
	.string	"timing_cost"
.LASF430:
	.string	"ymax_edge"
.LASF501:
	.string	"source_block"
.LASF489:
	.string	"b_from"
.LASF108:
	.string	"timing_analysis_enabled"
.LASF55:
	.string	"double"
.LASF314:
	.string	"cost_index"
.LASF300:
	.string	"OPIN"
.LASF18:
	.string	"_IO_write_end"
.LASF573:
	.string	"router_opts"
.LASF579:
	.string	"inner_iter"
.LASF448:
	.string	"alloc_place_regions"
.LASF280:
	.string	"longline"
.LASF86:
	.string	"LINEAR_CONG"
.LASF493:
	.string	"delta_delay"
.LASF105:
	.string	"T_seq_out"
.LASF274:
	.string	"frequency"
.LASF415:
	.string	"xnew"
.LASF412:
	.string	"bb_edge_new"
.LASF176:
	.string	"s_chan_width_dist"
.LASF316:
	.string	"num_edges"
.LASF54:
	.string	"float"
.LASF232:
	.string	"DEMAND_ONLY"
.LASF603:
	.string	"inverse_delta_rlim"
.LASF408:
	.string	"count"
.LASF427:
	.string	"xmin_edge"
.LASF104:
	.string	"T_seq_in"
.LASF19:
	.string	"_IO_buf_base"
.LASF601:
	.string	"first_rlim"
.LASF542:
	.string	"z_from"
.LASF3:
	.string	"unsigned int"
.LASF343:
	.string	"grid"
.LASF151:
	.string	"s_class"
.LASF317:
	.string	"edges"
.LASF218:
	.string	"inner_loop_recompute_divider"
.LASF474:
	.string	"imin"
.LASF490:
	.string	"b_to"
.LASF500:
	.string	"comp_td_point_to_point_delay"
.LASF165:
	.string	"ymax"
.LASF34:
	.string	"__pad1"
.LASF35:
	.string	"__pad2"
.LASF36:
	.string	"__pad3"
.LASF37:
	.string	"__pad4"
.LASF38:
	.string	"__pad5"
.LASF376:
	.string	"temp_point_to_point_timing_cost"
.LASF44:
	.string	"_sbuf"
.LASF471:
	.string	"x_overlap"
.LASF214:
	.string	"place_freq"
.LASF539:
	.string	"inverse_prev_bb_cost"
.LASF388:
	.string	"cross_count"
.LASF417:
	.string	"get_non_updateable_bb"
.LASF468:
	.string	"overlap_ylow"
.LASF70:
	.string	"s_ivec"
.LASF228:
	.string	"DIRECTED_SEARCH"
.LASF283:
	.string	"cb_len"
.LASF584:
	.string	"est_crit"
.LASF560:
	.string	"sum_of_squares"
.LASF435:
	.string	"any_dups"
.LASF114:
	.string	"T_fb_ipin_to_sblk_ipin"
.LASF586:
	.string	"new_timing_cost"
.LASF250:
	.string	"e_directionality"
.LASF96:
	.string	"s_net"
.LASF515:
	.string	"find_to"
.LASF12:
	.string	"_flags"
.LASF158:
	.string	"offset"
.LASF72:
	.string	"list"
.LASF171:
	.string	"s_chan"
.LASF39:
	.string	"_mode"
.LASF610:
	.string	"try_place"
.LASF482:
	.string	"comp_td_costs"
.LASF605:
	.string	"GNU C11 6.3.0 20170516 -mtune=generic -march=x86-64 -g"
.LASF187:
	.string	"outputs"
.LASF367:
	.string	"timing_place_crit"
.LASF303:
	.string	"NUM_RR_TYPES"
.LASF57:
	.string	"_IEEE_"
.LASF394:
	.string	"bnum"
.LASF522:
	.string	"x_rel"
.LASF369:
	.string	"NORMAL"
.LASF433:
	.string	"alloc_and_load_unique_pin_list"
.LASF67:
	.string	"FALSE"
.LASF358:
	.string	"type_descriptors"
.LASF297:
	.string	"SOURCE"
.LASF357:
	.string	"num_types"
.LASF119:
	.string	"BOUNDARY"
.LASF510:
	.string	"assess_swap"
.LASF485:
	.string	"loc_connection_delay_sum"
.LASF61:
	.string	"_ISOC_"
.LASF366:
	.string	"delta_io_to_io"
.LASF530:
	.string	"num_col_same_type"
.LASF144:
	.string	"max_subblock_outputs"
.LASF325:
	.string	"base_cost"
.LASF546:
	.string	"bb_delta_c"
.LASF138:
	.string	"is_Fc_frac"
.LASF439:
	.string	"load_place_regions"
.LASF479:
	.string	"comp_bb_cost"
.LASF120:
	.string	"FILL"
.LASF582:
	.string	"width_fac"
.LASF555:
	.string	"max_moves"
.LASF556:
	.string	"delay_cost_ptr"
.LASF323:
	.string	"t_rr_node"
.LASF596:
	.string	"inner_crit_iter_count"
.LASF373:
	.string	"net_cost"
.LASF382:
	.string	"place_region_x"
.LASF383:
	.string	"place_region_y"
.LASF576:
	.string	"timing_inf"
.LASF591:
	.string	"av_bb_cost"
.LASF569:
	.string	"compute_net_pin_index_values"
.LASF136:
	.string	"pin_class"
.LASF273:
	.string	"s_segment_inf"
.LASF71:
	.string	"nelem"
.LASF594:
	.string	"num_connections"
.LASF204:
	.string	"PATH_TIMING_DRIVEN_PLACE"
.LASF578:
	.string	"tot_iter"
.LASF65:
	.string	"long long unsigned int"
.LASF56:
	.string	"signgam"
.LASF370:
	.string	"CHECK"
.LASF275:
	.string	"length"
.LASF8:
	.string	"__off_t"
.LASF211:
	.string	"place_chan_width"
.LASF118:
	.string	"e_grid_loc_type"
.LASF133:
	.string	"pinloc"
.LASF469:
	.string	"overlap_yhigh"
.LASF355:
	.string	"EMPTY_TYPE"
.LASF372:
	.string	"unique_pin_list"
.LASF135:
	.string	"class_inf"
.LASF239:
	.string	"max_router_iterations"
.LASF374:
	.string	"temp_net_cost"
.LASF423:
	.string	"get_bb_from_scratch"
.LASF243:
	.string	"router_algorithm"
.LASF587:
	.string	"new_delay_cost"
.LASF419:
	.string	"ncost"
.LASF354:
	.string	"IO_TYPE"
.LASF570:
	.string	"netpin"
.LASF421:
	.string	"get_net_cost"
.LASF532:
	.string	"nets_to_update"
.LASF590:
	.string	"av_cost"
.LASF22:
	.string	"_IO_backup_base"
.LASF31:
	.string	"_shortbuf"
.LASF503:
	.string	"delta_x"
.LASF496:
	.string	"delta_delay_cost"
.LASF562:
	.string	"update_t"
.LASF47:
	.string	"_IO_2_1_stdout_"
.LASF130:
	.string	"num_pins"
.LASF349:
	.string	"rr_indexed_data"
.LASF329:
	.string	"inv_length"
.LASF454:
	.string	"free_placement_structs"
.LASF432:
	.string	"plist"
.LASF43:
	.string	"_next"
.LASF251:
	.string	"UNI_DIRECTIONAL"
.LASF9:
	.string	"__off64_t"
.LASF116:
	.string	"T_subblock"
.LASF84:
	.string	"ROUTING"
.LASF177:
	.string	"chan_width_io"
.LASF387:
	.string	"chany_place_cost_fac"
.LASF434:
	.string	"num_dup"
.LASF157:
	.string	"s_grid_tile"
.LASF183:
	.string	"occupancy"
.LASF66:
	.string	"linenum"
.LASF429:
	.string	"ymin_edge"
.LASF255:
	.string	"WILTON"
.LASF207:
	.string	"timing_tradeoff"
.LASF20:
	.string	"_IO_buf_end"
.LASF368:
	.string	"cost_methods"
.LASF224:
	.string	"DETAILED"
.LASF97:
	.string	"name"
.LASF178:
	.string	"chan_x_dist"
.LASF470:
	.string	"y_overlap"
.LASF585:
	.string	"new_bb_cost"
.LASF271:
	.string	"MULTI_MERGED"
.LASF511:
	.string	"delta_c"
.LASF321:
	.string	"num_wire_drivers"
.LASF264:
	.string	"delayless_switch"
.LASF477:
	.string	"jmax"
.LASF51:
	.string	"stderr"
.LASF5:
	.string	"short int"
.LASF242:
	.string	"fixed_channel_width"
.LASF491:
	.string	"num_of_pins"
.LASF411:
	.string	"bb_coord_new"
.LASF561:
	.string	"exit_crit"
.LASF128:
	.string	"priority"
.LASF504:
	.string	"delta_y"
.LASF180:
	.string	"t_chan_width_dist"
.LASF324:
	.string	"s_rr_indexed_data"
.LASF333:
	.string	"t_rr_indexed_data"
.LASF78:
	.string	"sched_type"
.LASF547:
	.string	"timing_delta_c"
.LASF226:
	.string	"BREADTH_FIRST"
.LASF159:
	.string	"usage"
.LASF359:
	.string	"s_mst_edge"
.LASF336:
	.string	"grid_logic_tile_area"
.LASF154:
	.string	"t_type_ptr"
.LASF371:
	.string	"duplicate_pins"
.LASF424:
	.string	"coords"
.LASF68:
	.string	"TRUE"
.LASF30:
	.string	"_vtable_offset"
.LASF312:
	.string	"yhigh"
.LASF514:
	.string	"fnum"
.LASF156:
	.string	"nets"
.LASF335:
	.string	"OutFilePrefix"
.LASF77:
	.string	"e_pin_type"
.LASF512:
	.string	"accept"
.LASF481:
	.string	"expected_wirelength"
.LASF467:
	.string	"overlap_xhigh"
.LASF209:
	.string	"place_cost_type"
.LASF192:
	.string	"num_subblocks_per_block"
.LASF295:
	.string	"BI_DIRECTION"
.LASF205:
	.string	"s_placer_opts"
.LASF62:
	.string	"_LIB_VERSION_TYPE"
.LASF548:
	.string	"delay_delta_c"
.LASF161:
	.string	"s_bb"
.LASF147:
	.string	"type_timing_inf"
.LASF524:
	.string	"iside"
.LASF400:
	.string	"alloc_and_load_for_fast_cost_update"
.LASF235:
	.string	"initial_pres_fac"
.LASF14:
	.string	"_IO_read_end"
.LASF213:
	.string	"pad_loc_file"
.LASF160:
	.string	"blocks"
.LASF395:
	.string	"bb_cost_check"
.LASF194:
	.string	"num_const_gen"
.LASF443:
	.string	"low_lim"
.LASF385:
	.string	"place_region_bounds_y"
.LASF80:
	.string	"USER_SCHED"
.LASF26:
	.string	"_fileno"
.LASF389:
	.string	"bb_cost"
.LASF453:
	.string	"max_pins_per_fb"
.LASF63:
	.string	"_LIB_VERSION"
.LASF127:
	.string	"col_rel"
.LASF141:
	.string	"Fc_out"
.LASF282:
	.string	"Cmetal"
.LASF195:
	.string	"t_subblock_data"
.LASF551:
	.string	"cost_ptr"
.LASF83:
	.string	"PLACEMENT"
.LASF543:
	.string	"keep_switch"
.LASF292:
	.string	"e_direction"
.LASF420:
	.string	"crossing"
.LASF244:
	.string	"base_cost_type"
.LASF392:
	.string	"bdone"
.LASF2:
	.string	"short unsigned int"
.LASF50:
	.string	"stdout"
.LASF599:
	.string	"net_delay"
.LASF413:
	.string	"xold"
.LASF309:
	.string	"xlow"
.LASF334:
	.string	"WMF_DEBUG"
.LASF266:
	.string	"R_minW_nmos"
.LASF486:
	.string	"temp_delay_cost"
.LASF517:
	.string	"y_from"
.LASF263:
	.string	"global_route_switch"
.LASF17:
	.string	"_IO_write_ptr"
.LASF379:
	.string	"net_pin_index"
.LASF507:
	.string	"delay_source_to_sink"
.LASF363:
	.string	"delta_io_to_fb"
.LASF199:
	.string	"alpha_t"
.LASF112:
	.string	"s_type_timing_inf"
.LASF259:
	.string	"directionality"
.LASF353:
	.string	"rr_blk_source"
.LASF107:
	.string	"s_timing_inf"
.LASF219:
	.string	"td_place_exp_first"
.LASF607:
	.string	"/homes/z/zhang823/ece454/hw1"
.LASF345:
	.string	"trace_tail"
.LASF208:
	.string	"block_dist"
.LASF523:
	.string	"y_rel"
.LASF540:
	.string	"inverse_prev_timing_cost"
.LASF237:
	.string	"acc_fac"
.LASF188:
	.string	"inputs"
.LASF164:
	.string	"ymin"
.LASF460:
	.string	"net_ymin"
.LASF402:
	.string	"free_fast_cost_update_structs"
.LASF552:
	.string	"bb_cost_ptr"
.LASF307:
	.string	"next"
.LASF168:
	.string	"GAUSSIAN"
.LASF598:
	.string	"net_slack"
.LASF233:
	.string	"s_router_opts"
.LASF520:
	.string	"x_to"
.LASF113:
	.string	"T_sblk_opin_to_sblk_ipin"
.LASF535:
	.string	"restore_region_occ"
.LASF170:
	.string	"DELTA"
.LASF360:
	.string	"from_node"
.LASF565:
	.string	"upper_lim"
.LASF132:
	.string	"height"
	.ident	"GCC: (Debian 6.3.0-18) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
