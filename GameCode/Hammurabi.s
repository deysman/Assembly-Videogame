	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"Hammurabi.c"
	.global	bushels_of_seed_per_acre
	.data
	.align	2
	.type	bushels_of_seed_per_acre, %object
	.size	bushels_of_seed_per_acre, 4
bushels_of_seed_per_acre:
	.word	1
	.global	acres_each_person_can_plant
	.align	2
	.type	acres_each_person_can_plant, %object
	.size	acres_each_person_can_plant, 4
acres_each_person_can_plant:
	.word	10
	.global	total_starved
	.bss
	.align	2
	.type	total_starved, %object
	.size	total_starved, 4
total_starved:
        .space  4       @allocate space for integer
        .global percentage_starved @create variable name
        .align  2 
        .type   percentage_starved, %object
        .size   percentage_starved, 4
percentage_starved:
        .space  4       @allocate space for integer
        .global year @create variable name
        .align  2
        .type   year, %object
        .size   year, 4
year:
        .space  4 @allocate space for integer
        .global population @create variable name
        .data
        .align  2 @allocate space
        .type   population, %object
        .size   population, 4
population:
        .word   100 @set population to 100
        .global grain_on_hand
        .align  2 @allocate space
        .type   grain_on_hand, %object
        .size   grain_on_hand, 4
grain_on_hand:
        .word   2800 @grain_on_hand to 2800
        .global acres
        .align  2 @allocate space
        .type   acres, %object
        .size   acres, 4
acres:
        .word   1000 @set acres to 1000
        .global game_lost
        .bss
        .align  2 @allocate space
        .type   game_lost, %object
        .size   game_lost, 4
harvest:
	.word	3000
	.global	eaten_by_rats
	.align	2
	.type	eaten_by_rats, %object
	.size	eaten_by_rats, 4
	
eaten_by_rats:
	.word	200
	.global	yield_per_acre
	.align	2
	.type	yield_per_acre, %object
	.size	yield_per_acre, 4
	
yield_per_acre:
	.word	3
	.global	acres
	.align	2
	.type	acres, %object
	.size	acres, 4
	
arrivals:
	.space	4
	.global	plague
	.align	2
	.type	plague, %object
	.size	plague, 4
plague:
	.space	4
	.global	starved
	.align	2
	.type	starved, %object
	.size	starved, 4
starved:
	.space	4
	.global	bushels_per_person
	.data
	.align	2
	.type	bushels_per_person, %object
	.size	bushels_per_person, 4
bushels_per_person:
	.word	20
	.global	rat_probability
	.align	2
	.type	rat_probability, %object
	.size	rat_probability, 4
rat_probability:
	.word	1056964608
	.global	plague_probability
	.align	2
	.type	plague_probability, %object
	.size	plague_probability, 4
plague_probability:
	.word	1041865114
	.global	yield_range
	.align	2
	.type	yield_range, %object
	.size	yield_range, 8
yield_range:
	.word	1
	.word	6
	.global	game_lost
	.bss
	.align	2
	.type	game_lost, %object
	.size	game_lost, 4
game_lost:
        .space  4
        .global play_game
        .data
        .align  2 @allocate space
        .type   play_game, %object
        .size   play_game, 4
play_game:
    .word   1
    .global acres_per_person
    .bss
    .align  2 @allocate space
    .type   acres_per_person, %object
    .size   acres_per_person, 4
people_fed:
	.space	4
	.comm	bushels_for_food,4,4
	.comm	price_of_land_to_sell,4,4
	.comm	price_of_land_to_buy,4,4
	.comm	acres_to_sell,4,4
	.comm	acres_to_buy,4,4
	.comm	acres_to_plant,4,4
	.global	play_game
	.data
	.align	2
	.type	play_game, %object
	.size	play_game, 4

acres_per_person:
	.space	4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Hammurabi: think again. You only own %d acres. Now "
	.ascii	"then, how many acres do you wish to farm?\000"
	.align	2
.LC1:
	.ascii	"%d\000"
	.text
	.align	2
	.global	badacres
	.type	badacres, %function
badacres:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	fstd	d0, [fp, #-20]
	ldr	r3, .L2
	mov	r0, r3
	ldrd	r2, [fp, #-20]
	bl	printf
	ldr	r2, .L2+4
	sub	r3, fp, #12
	mov	r0, r2
	mov	r1, r3
	bl	__isoc99_scanf
	ldrd	r2, [fp, #-12]
	fmdrr	d7, r2, r3
	fcpyd	d0, d7
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L3:
	.align	2
.L2:
	.word	.LC0
	.word	.LC1
	.size	badacres, .-badacres
	.section	.rodata
	.align	2
.LC2:
	.ascii	"Hammurabi: I cannot do what you wish. Get yourself "
	.ascii	"another steward.\000"
	.text
	.align	2
	.global	cannot
	.type	cannot, %function
cannot:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	ldr	r3, .L5
	mov	r0, r3
	bl	printf
	ldmfd	sp!, {fp, pc}
.L6:
	.align	2
.L5:
	.word	.LC2
	.size	cannot, .-cannot
	.section	.rodata
	.align	2
.LC3:
	.ascii	"Unfortunately, you did not manage to make it to the"
	.ascii	" end of your 10-year term. Pathetic.\000"
	.align	2
.LC4:
	.ascii	"Press Any Key to Continue\000"
	.text
	.align	2
	.global	lost
	.type	lost, %function
lost:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	ldr	r3, .L8		@(
	mov	r0, r3
	bl	printf		@printf("Unfortunately...");)
	ldr	r0, .L8+4	@(
	bl	puts		@printf("Press...");)
	bl	getchar		@getchar();
	mov	r0, #0		@(
	bl	exit		@exit(0))
.L9:
	.align	2
.L8:
	.word	.LC3
	.word	.LC4
	.size	lost, .-lost
	.section	.rodata
	.align	2
.LC5:
	.ascii	"You starved %d people! Due to this extreme mismanag"
	.ascii	"ement, you have been ousted from your position.\012"
	.ascii	"\000"
	.text
	.align	2
	.global	impeached
	.type	impeached, %function
impeached:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8				@Set frame and stack pointers
	fstd	d0, [fp, #-12]		@d0 = x
	ldr	r3, .L11				@r3 = .LC5
	mov	r0, r3					@r0 = .LC5
	ldrd	r2, [fp, #-12]		@r2 = x
	bl	printf					@branch to print
	ldr	r0, .L11+4				
	bl	puts					@function calls
	bl	getchar					@"" "" "" "" "" 
	mov	r0, #0					@set r0 = 0
	bl	exit					@Exit program
.L12:
	.align	2
.L11:
	.word	.LC5
	.word	.LC4
	.size	impeached, .-impeached
	.section	.rodata
	.align	2
.LC6:
	.ascii	"Your heavy-handed performance could have been so mu"	@text for "bad"
	.ascii	"ch better. Everyone hates you.\000"
	.text
	.align	2
	.global	bad
	.type	bad, %function
bad:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	ldr	r3, .L14		@loads the address of .L14 to the r3 register - L14 will become the text from above.
	mov	r0, r3			@moves r3, "return value" into r0 register
	bl	printf			@finish state, will print "return"
	ldr	r0, .L14+4
	bl	puts			@prints out the characters
	bl	getchar			@will wait for keyboard input
	mov	r0, #0
	bl	exit
.L15:
	.align	2
.L14:
	.word	.LC6		@gets "your heavy handed..." text
	.word	.LC4		@"press any key" text
	.size	bad, .-bad
	.section	.rodata
	.align	2
.LC7:
	.ascii	"Your performance could have been better, but it was"		@text for "ok" function
	.ascii	"n't really that bad at all. %d people would dearly "
	.ascii	"like to see you assassinated, but we all have our p"
	.ascii	"roblems.\000"
	.text
	.align	2
	.global	ok
	.type	ok, %function
ok:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	fstmfdd	sp!, {d8}		@moves double register r8 onto stack 
	add	fp, sp, #16
	sub	sp, sp, #12			 @moves stack location to same decremented by 12
	fstd	d0, [fp, #-28]
	ldr	r4, .L17+8			@loads text from L17 into register r4
	fldd	d6, [fp, #-28]
	fldd	d7, .L17		@loads parameter for calculation 
	fmuld	d8, d6, d7
	bl	rand
	mov	r3, r0
	fmsr	s13, r3	@ int
	fsitod	d7, s13
	fmuld	d7, d8, d7
	mov	r0, r4
	fmrrd	r2, r3, d7
	bl	printf				@goes to print statement
	ldr	r0, .L17+12			@loads information in L17, which will be text
	bl	puts				@prints out text on the console
	bl	getchar				@goes to "wait for input"
	mov	r0, #0
	bl	exit
.L18:
	.align	3
.L17:
	.word	-1717986918
	.word	1072273817
	.word	.LC7			@"OK" text
	.word	.LC4			@"press any key to continue" text
	.size	ok, .-ok
	.section	.rodata
	.align	2
.LC8:
	.ascii	"Fantastic! Charlemange, Disraeli, and Jefferson com"
	.ascii	"bined could not have done better!\000"
	.text
	.align	2
	.global	fantastic
	.type	fantastic, %function
fantastic:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	ldr	r3, .L20		@loads text into register r3
	mov	r0, r3			@moves text from r3 into r0
	bl	printf			@goes to print statement
	ldr	r0, .L20+4
	bl	puts			@writes text to console
	bl	getchar			@to wait for input
	mov	r0, #0
	bl	exit
.L21:
	.align	2
.L20:
	.word	.LC8			@Fantastic ending text
	.word	.LC4			@press any key to continue
	.size	fantastic, .-fantastic
	.section	.rodata
	.align	2
.LC9:
	.ascii	"I guess this is it.\000"
	.text
	.align	2
	.global	endgame
	.type	endgame, %function
endgame:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	ldr	r3, .L23
	mov	r0, r3
	bl	printf
	ldr	r0, .L23+4
	bl	puts
	bl	getchar
	mov	r0, #0
	bl	exit
.L24:
	.align	2
.L23:
	.word	.LC9
	.word	.LC4
	.size	endgame, .-endgame
	.section	.rodata
	.align	2
.LC10:
	.ascii	"Population is now %d\012 The city owns %f acres of "
	.ascii	"land.\012 You harvested %d bushels of grain per acr"
	.ascii	"e.\012 Rats ate %d bushels.\012 You now have %d bus"
	.ascii	"hels in store.\012\000"
	.text
	.align	2
	.global	stat_rep
	.type	stat_rep, %function
stat_rep:
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r3, .L26
	ldr	r2, [fp, #-20]
	str	r2, [sp, #0]
	ldr	r2, [fp, #4]
	str	r2, [sp, #4]
	mov	r0, r3
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	bl	printf
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc
.L27:
	.align	2
.L26:
	.word	.LC10
	.size	stat_rep, .-stat_rep
	.section	.rodata
	.align	2
.LC11:
	.ascii	"Population is %d\012 Your city owns %f acres of lan"
	.ascii	"d.\012 You have %d bushels in store.\012\000"
	.text
	.align	2
	.global	mini_stat_rep
	.type	mini_stat_rep, %function
mini_stat_rep:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	ldr	r3, .L29
	mov	r0, r3
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	bl	printf
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L30:
	.align	2
.L29:
	.word	.LC11
	.size	mini_stat_rep, .-mini_stat_rep
	.global	__aeabi_idiv
	.section	.rodata
	.align	2
.LC12:
	.ascii	"You tyrant! You just starved %d people!\000"
	.text
	.align	2
	.global	pop
	.type	pop, %function
pop:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	fstmfdd	sp!, {d8}
	add	fp, sp, #12
	ldr	r3, .L34+8	@(.L34+8 = population
	ldr	r2, [r3, #0]
	ldr	r3, .L34+12	@.L34+12 = people_fed
	ldr	r3, [r3, #0]
	cmp	r2, r3		@if (population > people_fed))
	ble	.L31
	ldr	r3, .L34+8	@(.L34+8 = population
	ldr	r2, [r3, #0]
	ldr	r3, .L34+12	@.L34+12 = people_fed
	ldr	r3, [r3, #0]
	rsb	r2, r3, r2	@population - people_fed
	ldr	r3, .L34+16	@.L4+16 = starved
	str	r2, [r3, #0]	@starved = population - people_fed)
	ldr	r3, .L34+20		@(.L34+20 = year
	ldr	r3, [r3, #0]
	sub	r3, r3, #1
	fmsr	s13, r3	@ int
	fsitos	s14, s13
	ldr	r3, .L34+24		@.L34+24 = percentage_starved
	flds	s15, [r3, #0]
	fmuls	s16, s14, s15
	ldr	r3, .L34+16		@.L34+16 = starved
	ldr	r3, [r3, #0]
	mov	r2, #100
	mul	r2, r2, r3
	ldr	r3, .L34+8		@.L4+8 = population
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	fmsr	s14, r3	@ int
	fsitos	s15, s14
	fadds	s14, s16, s15
	ldr	r3, .L34+20		@.L34+20 = year
	ldr	r3, [r3, #0]
	fmsr	s13, r3	@ int
	fsitos	s15, s13
	fdivs	s15, s14, s15
	ldr	r3, .L34+24		@.L34+24 = percentage_starved
	fsts	s15, [r3, #0]	@percentage_starved = ((year-1)*percentage_starved + starved*100/population)/year;)
	ldr	r3, .L34+28		@(.L34+28 = total_starved
	ldr	r2, [r3, #0]
	ldr	r3, .L34+16		@.L34+16 = starved
	ldr	r3, [r3, #0]
	add	r2, r2, r3
	ldr	r3, .L34+28		@.L34+28 = total_starved
	str	r2, [r3, #0]	@total_starved += starved);
	ldr	r3, .L34+12		@(.L34+12 = people_fed
	ldr	r2, [r3, #0]
	ldr	r3, .L34+8		@.L34+8 = population
	str	r2, [r3, #0]	@population = people_fed);
	ldr	r3, .L34+16		@(.L34+16 = starved
	ldr	r3, [r3, #0]
	fmsr	s14, r3	@ int
	fsitod	d6, s14
	ldr	r3, .L34+8		@.L34+8 = population
	ldr	r3, [r3, #0]
	fmsr	s15, r3	@ int
	fsitod	d5, s15
	fldd	d7, .L34
	fmuld	d7, d5, d7
	fcmped	d6, d7		@if (starved > 0.5*population))
	fmstat
	movle	r3, #0		@mutually exclusive branch if (starved < 0.5*population)
	movgt	r3, #1		@mutually exclusive branch if (starved > 0.5*population)
	uxtb	r3, r3		@extend r3 to 32 bits
	cmp	r3, #0
	beq	.L33
	ldr	r2, .L34+32		@(.L34+32 = "You tyrant..."
	ldr	r3, .L34+16		@.L34+16 = starved
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, r3
	bl	printf			@printf("You tyrant...", starved);)
	ldr	r3, .L34+36		@(.L34+36 = game_lost
	mov	r2, #1
	str	r2, [r3, #0]	@game_lost = 1;)
	b	.L31
.L33:
	ldr	r3, .L34+16		@(.L34+16 = starved
	mov	r2, #0
	str	r2, [r3, #0]	@starved = 0;)
.L31:
	sub	sp, fp, #12		@(
	fldmfdd	sp!, {d8}
	ldmfd	sp!, {fp, pc}	@end pop())
.L35:
	.align	3
.L34:
	.word	0
	.word	1071644672
	.word	population
	.word	people_fed
	.word	starved
	.word	year
	.word	percentage_starved
	.word	total_starved
	.word	.LC12
	.word	game_lost
	.size	pop, .-pop
	.global	__aeabi_idivmod
	.align	2
	.global	generate_random
	.type	generate_random, %function
generate_random:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	bl	rand
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmn	r3, #-2147483647
	bne	.L37
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	bl	generate_random
	mov	r3, r0
	b	.L38
.L37:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	rsb	r3, r3, r2
	str	r3, [fp, #-12]
	mvn	r3, #-2147483648
	mov	r0, r3
	ldr	r1, [fp, #-12]
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-16]
	mvn	r0, #-2147483648
	ldr	r1, [fp, #-12]
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	mvn	r3, #-2147483648
	rsb	r3, r2, r3
	ldr	r2, [fp, #-8]
	cmp	r3, r2
	ble	.L39
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-20]
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	b	.L38
.L39:
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	bl	generate_random
	mov	r3, r0
.L38:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	generate_random, .-generate_random
	.section	.rodata
	.align	2
.LC13:
	.ascii	"You only have %d people to tend the fields.\000"
	.align	2
.LC14:
	.ascii	"You only have enough grain to plant %d acres.\000"
	.align	2
.LC15:
	.ascii	"You only have %d acres.\000"
	.align	2
.LC16:
	.ascii	"Now then, how many acres do you wish to plant with "
	.ascii	"seed? Enter here: \000"
	.text
	.align	2
	.global	fields
	.type	fields, %function
fields:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	b	.L41
.L44:		@if statement (
	ldr	r3, .L45		@loads acres_each_per_can_plant
	ldr	r3, [r3, #0]	
	ldr	r2, .L45+4		@loads population
	ldr	r2, [r2, #0]
	mul	r2, r2, r3		@multiplies acres_each_person_can_plant with population and stores result in r2
	ldr	r3, .L45+8
	ldr	r3, [r3, #0]	@loads acres_to_plant from stack
	cmp	r2, r3			@start of if statement ( 
	bge	.L42			@if acres_to_plant < r2 branch to L42
	ldr	r2, .L45+12		@otherwise, load text from L15 "you only have x people..."
	ldr	r3, .L45+4
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, r3			@loads value of population for print statement
	bl	printf			@print text onto console )
	b	.L41			@go back to L41 if if statement completed successfully
.L42:		@else if
	ldr	r3, .L45+8		@loads acres_to_plant	
	ldr	r3, [r3, #0]	
	ldr	r2, .L45+16		@loads bushels_of_seed_per_acre
	ldr	r2, [r2, #0]
	mul	r2, r2, r3		@multiplies acres_to_plant and bushels_of_seed_per_acre
	ldr	r3, .L45+20		@loads grain_on_hand from stack
	ldr	r3, [r3, #0]	
	cmp	r2, r3			@start of else if statement (
	ble	.L43			@if r2 < grain_on_hand, branch to L43
	ldr	r3, .L45+20		@otherwise, load grain_on_hand 
	ldr	r2, [r3, #0]
	ldr	r3, .L45+16		@loads bushels_of_seed_per_acre
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idiv	@division
	mov	r3, r0			@grain_on_hand
	fmsr	s13, r3	
	fsitod	d7, s13
	fstd	d7, [fp, #-12]
	ldr	r3, .L45+24		@loads data from L45, text for print statement
	mov	r0, r3
	ldrd	r2, [fp, #-12]		@loads grain_to_plant
	bl	printf
	b	.L41			@else if statement finish, branch back to L41 )
.L43:		@else 
	ldr	r2, .L45+28		@loads text from L45 "you only have..."
	ldr	r3, .L45+32
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, r3
	bl	printf				@prints out text with acres
	ldr	r3, .L45+36			@loads next piece of text from L45 "Now then..."
	mov	r0, r3
	bl	printf				@prints text onto console 
	ldr	r3, .L45+40			@gets "%d" input variable type from L45
	mov	r0, r3
	ldr	r1, .L45+8
	bl	__isoc99_scanf		@gets input from user for acres_to_plant
.L41:		@while
	ldr	r3, .L45+8			@loads acres_to_plant
	ldr	r2, [r3, #0]		
	ldr	r3, .L45+32			@loads acres
	ldr	r3, [r3, #0]
	cmp	r2, r3				@ start of true while statement, comparing values in r2 and r3 (
	bgt	.L44				@ if r2 > r3 condition is met, branch to next instruction
	ldr	r3, .L45+8			@loads acres_to_plant
	ldr	r3, [r3, #0]
	ldr	r2, .L45+16			@loads bushels_of_seed_per_person
	ldr	r2, [r2, #0]
	mul	r2, r2, r3			@multiplies the two
	ldr	r3, .L45+20			@loads grain_on_hand
	ldr	r3, [r3, #0]
	cmp	r2, r3				@next part of or statements in while loop
	bgt	.L44				@if condition is met (acres_to_plant * bushels_of_seed_per_acre) > grain_on_hand) branch to next instruction
	ldr	r3, .L45+4			@loads population
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2		@multiplication 
	add	r3, r3, r2			@places population value into r3
	mov	r3, r3, asl #1		@shift again to change population to population*10 
	mov	r2, r3				
	ldr	r3, .L45+8			@loads acres_to_plant
	ldr	r3, [r3, #0]
	cmp	r2, r3				@final part of or statements in while
	blt	.L44				@if condition is met, branch to next instruction at L44, END OF WHILE )
	ldr	r3, .L45+44			@loads harvest
	ldr	r2, [r3, #0]
	ldr	r3, .L45+48			@loads eaten_by_rats
	ldr	r3, [r3, #0]
	rsb	r2, r3, r2			@subtracts values from each other to create new grain_on_hand variable
	ldr	r3, .L45+20			@loads grain_on_hand
	ldr	r3, [r3, #0]
	add	r2, r2, r3			@adds grain_on_hand and previous grain_on_hand value
	ldr	r3, .L45+20			@stores answer as value for grain_on_hand
	str	r2, [r3, #0]
	mov	r0, #1
	mov	r1, #5
	bl	generate_random		@generates random value
	mov	r1, r0
	ldr	r3, .L45+32			@loads acres
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2		@performs an arithmetic shift on acres, part of the process to multiply it by 20
	add	r3, r3, r2			@ adds new acres value and previous acres value
	mov	r3, r3, asl #2		@arithmetic shift
	mov	r2, r3				@stores 20 *acres
	ldr	r3, .L45+20			@loads grain_on_hand
	ldr	r3, [r3, #0]	
	add	r3, r2, r3			@adds acres*20 and grain_on_hand
	mul	r2, r3, r1			@multiplies by value generated by generate_random
	ldr	r3, .L45+4			@loads population
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idiv		@division
	mov	r3, r0
	ldr	r2, .L45+52
	smull	r1, r2, r2, r3
	mov	r2, r2, asr #5		@arithmetic shift right for r2 - division - result stored in r2
	mov	r3, r3, asr #31		@shifts bits in r3 right by 31, creating value -1
	rsb	r3, r3, r2
	add	r2, r3, #1
	ldr	r3, .L45+56
	str	r2, [r3, #0]	@stores result as value for variable arrivals
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L46:
	.align	2
.L45:
	.word	acres_each_person_can_plant
	.word	population
	.word	acres_to_plant
	.word	.LC13
	.word	bushels_of_seed_per_acre
	.word	grain_on_hand
	.word	.LC14
	.word	.LC15
	.word	acres
	.word	.LC16
	.word	.LC1
	.word	harvest
	.word	eaten_by_rats
	.word	1374389535
	.word	arrivals
	.size	fields, .-fields
	.section	.rodata
	.align	2
.LC17:
	.ascii	"Hammurabi: think again. You have only %d bushels of"
	.ascii	" grain. Now then, how much grain would you like to "
	.ascii	"feed your people?\012\000"
	.text
	.align	2
	.global	badbushels
	.type	badbushels, %function
badbushels:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]	@store parameter x
	ldr	r3, .L48	@(
	mov	r0, r3
	ldr	r1, [fp, #-16]	@fp-16 = x
	bl	printf				@printf("Hammurabi..." , x);)
	ldr	r2, .L48+4			@(
	sub	r3, fp, #8			@fp-8 = returnval
	mov	r0, r2
	mov	r1, r3
	bl	__isoc99_scanf		@scanf("d", returnval);)
	ldr	r2, [fp, #-8]		@(fp-8 = returnval
	mov r0, r3				@return returnval;)		
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}	@end badbushels(int x)
.L49:
	.align	2
.L48:
	.word	.LC17
	.word	.LC1
	.size	badbushels, .-badbushels
	.section	.rodata
	.align	2
.LC18:
	.ascii	"How many bushels of food do you wish to feed your p"
	.ascii	"eople? Enter here: \000"
	.text
	.align	2
	.global	feed
	.type	feed, %function
feed:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4		@Set frame and stack pointers
	ldr	r3, .L53		@r3 = .LC18
	mov	r0, r3			@r0 = .LC18
	bl	printf			@Print the statement
	ldr	r3, .L53+4
	mov	r0, r3
	ldr	r1, .L53+8
	bl	__isoc99_scanf	@getting input from user, storing result in bushels_for_food
	b	.L51			@branch .L51
.L52:
	ldr	r3, .L53+12		@r3 = grain_on_hand
	ldr	r3, [r3, #0]	@r3 = first mem position of grain_on_hand
	mov	r0, r3		@r0 = first mem position of grain_on_hand		
	bl	badbushels		@function call badbushels
	mov	r2, r0		@r2 = first mem position of grain_on_hand
	ldr	r3, .L53+8		@r3 = bushels_for_food
	str	r2, [r3, #0]	@r2 = first mem position of bushels_for_food
.L51:
	ldr	r3, .L53+8		@r3 = bushels_for_food
	ldr	r2, [r3, #0]	@r2 = first mem location of bushels_for_food
	ldr	r3, .L53+12		@r3 = grain_on_hand
	ldr	r3, [r3, #0]	@r3 = first mem location of grain_on_hand
	cmp	r2, r3			@if bushels_for_food > grain_on_hand
	bgt	.L52			@Branch to 52 based on above cmp
	ldr	r3, .L53+12		@r3 = grain_on_hand
	ldr	r2, [r3, #0]	@r2 = first mem location of grain_on_hand
	ldr	r3, .L53+8		@r3 = bushels_for_food
	ldr	r3, [r3, #0]	@r3 = first mem location of bushels_for_food
	rsb	r2, r3, r2		@Reverse subtract grain_on_hand -= bushels_for_food
	ldr	r3, .L53+12		@r3 = grain_on_hand
	str	r2, [r3, #0]	@r2 = first mem location of grain_on_hand
	ldmfd	sp!, {fp, pc}	@restore frame and stack pointers
.L54:
	.align	2
.L53:
	.word	.LC18		@offset 0
	.word	.LC1		@offset 4
	.word	bushels_for_food		@offset 8
	.word	grain_on_hand			@offset 12
	.size	feed, .-feed
	.align	2
	.global	plagues
	.type	plagues, %function
plagues:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	mov	r0, #0				@(r0 = float 0
	mov	r1, #1				@r1 = float 1
	bl	generate_random		@generate_random(0, 1));
	mov	r3, r0
	fmsr	s14, r3	@ int
	fsitos	s15, s14
	ldr	r3, .L58		@(.L58 = plague
	fsts	s15, [r3, #0]
	ldr	r3, .L58		@.L58 = plague	
	flds	s14, [r3, #0]
	ldr	r3, .L58+4		@.L58+3 = plague_probability
	flds	s15, [r3, #0]
	fcmpes	s14, s15	@if (plague < plague_probability))
	fmstat
	movpl	r3, #0	@mutually exclusive branch if plague > plague_probability
	movmi	r3, #1	@mutually exclusive branch r3 = 1 if plague < plague_probability
	uxtb	r3, r3	@extend r3 to 32 bytes
	cmp	r3, #0
	beq	.L56
	ldr	r3, .L58	@(.L18+16 = plague
	ldr	r2, .L58+8	@.L18+24 = float 0
	str	r2, [r3, #0]	@plague = 0)
	b	.L55
.L56:
	ldr	r3, .L58		@(.L58 = plague
	ldr	r2, .L58+12		@.L58+12 = float 1
	str	r2, [r3, #0]	@plague = 1)
.L55:
	ldmfd	sp!, {fp, pc}	@end plagues()
.L59:
	.align	2
.L58:
	.word	plague
	.word	plague_probability
	.word	0
	.word	1065353216
	.size	plagues, .-plagues
	.section	.rodata
	.align	2
.LC19:
	.ascii	"You can sell land at %f bushels per acre. Please en"
	.ascii	"ter the amount of bushels you wish to sell: \000"
	.text
	.align	2
	.global	dAcres
	.type	dAcres, %function
dAcres:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	ldr	r3, .L65		@load acres_to_buy
	ldr	r3, [r3, #0]
	cmp	r3, #0			@start of if statement (
	ble	.L61			@if acres_to_buy <= 0, branch and go to L61
	ldr	r3, .L65+4		@otherwise, load acres
	ldr	r2, [r3, #0]
	ldr	r3, .L65		@load acres_to_buy
	ldr	r3, [r3, #0]
	add	r2, r2, r3		@add the two together
	ldr	r3, .L65+4		@load price_of_land_to_buy
	str	r2, [r3, #0]
	ldr	r3, .L65+8		@load acres_to_buy
	ldr	r2, [r3, #0]
	ldr	r3, .L65+12		@load grain_on_hand
	ldr	r3, [r3, #0]
	ldr	r1, .L65		@load acres_to_buy	
	ldr	r1, [r1, #0]
	mul	r3, r1, r3		@multiply acres_to_buy and grain_on_hand
	rsb	r2, r3, r2		@subtract the previously calculated value from grain_on_hand
	ldr	r3, .L65+8		@load acres_to_buy
	str	r2, [r3, #0]
	b	.L60			@) endif
.L61:		 @else (99
	ldr	r3, .L65+16		@load population
	ldr	r1, [r3, #0]
	ldr	r3, .L65+4		@loads acres
	ldr	r2, [r3, #0]
	ldr	r3, .L65+8		@load grain_on_hand
	ldr	r3, [r3, #0]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	mini_stat_rep		@execute mini_stat_rep
	ldr	r2, .L65+20
	ldr	r3, .L65+24			@loads price_of_land_to_sell
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, r3
	bl	printf			@prints out text prompt
	ldr	r3, .L65+28		@loads acres_to_sell
	mov	r0, r3	
	ldr	r1, .L65+32		@loads "%d"
	bl	__isoc99_scanf		@get user input
	b	.L63			@endelse)
.L64:
	ldr	r3, .L65+4		@loads acres
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	badacres		@passes badacres acres and executes
	mov	r2, r0
	ldr	r3, .L65+32
	str	r2, [r3, #0]	@stores the result as the value of acres_to_sell
.L63:
	ldr	r3, .L65+32		@loads acres_to_sell
	ldr	r2, [r3, #0]
	ldr	r3, .L65+4		@loads acres
	ldr	r3, [r3, #0]
	cmp	r2, r3			@ start of while loop ( 
	bgt	.L64			@if acres_to_sell > acres, go to next instruction
	ldr	r3, .L65+4		@otherwise, load acres_to_sell 
	ldr	r2, [r3, #0]
	ldr	r3, .L65+32		@load acres
	ldr	r3, [r3, #0]
	rsb	r2, r3, r2		@acres-acres_to_sell
	ldr	r3, .L65+4		@load acres_to_sell
	str	r2, [r3, #0]
	ldr	r3, .L65+24		@load price_of_land_to_sell
	ldr	r3, [r3, #0]
	ldr	r2, .L65+32		@load acres
	ldr	r2, [r2, #0]
	mul	r2, r2, r3		@acres_to_sell * price_of_land_to_sell
	ldr	r3, .L65+8		 @load grain_on_hand
	ldr	r3, [r3, #0]
	add	r2, r2, r3		@adds grain_on_hand to the previously multiplied values
	ldr	r3, .L65+8
	str	r2, [r3, #0]	@stores the result of the equation as the value for grain_on_hand ENDELSE )
.L60:
	ldmfd	sp!, {fp, pc}
.L66:
	.align	2
.L65:
	.word	acres_to_buy
	.word	acres
	.word	grain_on_hand
	.word	price_of_land_to_buy
	.word	population
	.word	.LC19
	.word	price_of_land_to_sell
	.word	.LC1
	.word	acres_to_sell
	.size	dAcres, .-dAcres
	.section	.rodata
	.align	2
.LC20:
	.ascii	"Hammurabi:\012\012I beg to report to you that in ye"
	.ascii	"ar %d ,\012 %d people starved, and %d came to the c"
	.ascii	"ity.\012\012\000"
	.align	2
.LC21:
	.ascii	"A horrible plague struck and half of your people di"
	.ascii	"ed!\000"
	.align	2
.LC22:
	.ascii	"Your land is too thinly populated. You have been co"
	.ascii	"nquered by a neighbouring city.\000"
	.text
	.align	2
	.global	badThings
	.type	badThings, %function
badThings:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r0, .L71+4
	ldr	r3, .L71+8
	ldr	r1, [r3, #0]
	ldr	r3, .L71+12
	ldr	r2, [r3, #0]
	ldr	r3, .L71+16
	ldr	r3, [r3, #0]
	bl	printf
	ldr	r3, .L71+20
	ldr	r2, [r3, #0]
	ldr	r3, .L71+16
	ldr	r3, [r3, #0]
	add	r2, r2, r3
	ldr	r3, .L71+20
	str	r2, [r3, #0]
	ldr	r3, .L71+24
	mov	r2, #10
	str	r2, [r3, #0]
	ldr	r3, .L71+20
	ldr	r0, [r3, #0]
	ldr	r3, .L71+28
	ldr	r1, [r3, #0]
	ldr	r3, .L71+32
	ldr	r2, [r3, #0]
	ldr	r3, .L71+36
	ldr	r3, [r3, #0]
	ldr	ip, .L71+40
	ldr	ip, [ip, #0]
	str	ip, [sp, #0]
	bl	stat_rep
	ldr	r3, .L71+44
	flds	s14, [r3, #0]
	flds	s15, .L71
	fcmps	s14, s15
	fmstat
	bne	.L68
	ldr	r3, .L71+20
	ldr	r3, [r3, #0]
	mov	r2, r3, lsr #31
	add	r3, r2, r3
	mov	r3, r3, asr #1
	mov	r2, r3
	ldr	r3, .L71+20
	str	r2, [r3, #0]
	ldr	r0, .L71+48
	bl	puts
	ldr	r3, .L71+24
	mov	r2, #7
	str	r2, [r3, #0]
	b	.L69
.L68:
	ldr	r3, .L71+24
	mov	r2, #10
	str	r2, [r3, #0]
.L69:
	ldr	r3, .L71+20
	ldr	r2, [r3, #0]
	ldr	r3, .L71+28
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	cmp	r3, #0
	bge	.L70
	ldr	r3, .L71+52
	mov	r0, r3
	bl	printf
	ldr	r3, .L71+56
	mov	r2, #1
	str	r2, [r3, #0]
.L70:
	ldr	r3, .L71+8
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L71+8
	str	r2, [r3, #0]
	ldmfd	sp!, {fp, pc}
.L72:
	.align	2
.L71:
	.word	1065353216
	.word	.LC20
	.word	year
	.word	starved
	.word	arrivals
	.word	population
	.word	acres_each_person_can_plant
	.word	acres
	.word	yield_per_acre
	.word	eaten_by_rats
	.word	grain_on_hand
	.word	plague
	.word	.LC21
	.word	.LC22
	.word	game_lost
	.size	badThings, .-badThings
	.section	.rodata
	.align	2
.LC23:
	.ascii	"You can buy land at %d bushels per acre. Please ent"
	.ascii	"er the amount of bushels you wish to buy: \000"
	.align	2
.LC24:
	.ascii	"How many acres do you wish to plant with seed? Ente"
	.ascii	"r here: \000"
	.text
	.align	2
	.global	playGame
	.type	playGame, %function
playGame:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, fp, lr}
	add	fp, sp, #12
	b	.L74
.L80:
	mov	r0, #0
	mov	r1, #10
	bl	generate_random
	mov	r3, r0
	add	r2, r3, #17
	ldr	r3, .L81
	str	r2, [r3, #0]
	mov	r0, #1
	mov	r1, #2
	bl	generate_random
	mov	r2, r0
	ldr	r3, .L81
	ldr	r3, [r3, #0]
	add	r2, r2, r3
	ldr	r3, .L81+4
	str	r2, [r3, #0]
	ldr	r3, .L81+8
	ldr	r1, [r3, #0]
	ldr	r3, .L81+12
	ldr	r2, [r3, #0]
	ldr	r3, .L81+16
	ldr	r3, [r3, #0]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	mini_stat_rep
	ldr	r2, .L81+20
	ldr	r3, .L81+4
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, r3
	bl	printf
	ldr	r3, .L81+24
	mov	r0, r3
	ldr	r1, .L81+28
	bl	__isoc99_scanf
	b	.L75
.L76:
	ldr	r3, .L81+16
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	badbushels
	mov	r2, r0
	ldr	r3, .L81+28
	str	r2, [r3, #0]
.L75:
	ldr	r3, .L81+4
	ldr	r3, [r3, #0]
	ldr	r2, .L81+28
	ldr	r2, [r2, #0]
	mul	r2, r2, r3
	ldr	r3, .L81+16
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bgt	.L76
	bl	dAcres
	ldr	r3, .L81+8
	ldr	r1, [r3, #0]
	ldr	r3, .L81+12
	ldr	r2, [r3, #0]
	ldr	r3, .L81+16
	ldr	r3, [r3, #0]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	mini_stat_rep
	bl	feed
	ldr	r3, .L81+8
	ldr	r1, [r3, #0]
	ldr	r3, .L81+12
	ldr	r2, [r3, #0]
	ldr	r3, .L81+16
	ldr	r3, [r3, #0]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	mini_stat_rep
	ldr	r3, .L81+32
	mov	r0, r3
	bl	printf
	ldr	r3, .L81+24
	mov	r0, r3
	ldr	r1, .L81+36
	bl	__isoc99_scanf
	bl	fields
	ldr	r3, .L81+16
	ldr	r2, [r3, #0]
	ldr	r3, .L81+36
	ldr	r3, [r3, #0]
	ldr	r1, .L81+40
	ldr	r1, [r1, #0]
	mul	r3, r1, r3
	rsb	r2, r3, r2
	ldr	r3, .L81+16
	str	r2, [r3, #0]
	ldr	r3, .L81+44
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, .L81+44
	ldr	r3, [r3, #4]
	mov	r0, r2
	mov	r1, r3
	bl	generate_random
	mov	r2, r0
	ldr	r3, .L81+48
	str	r2, [r3, #0]
	ldr	r3, .L81+36
	ldr	r3, [r3, #0]
	ldr	r2, .L81+48
	ldr	r2, [r2, #0]
	mul	r2, r2, r3
	ldr	r3, .L81+52
	str	r2, [r3, #0]
	mov	r0, #0
	mov	r1, #1
	bl	generate_random
	mov	r3, r0
	fmsr	s15, r3	@ int
	fsitos	s14, s15
	ldr	r3, .L81+56
	flds	s15, [r3, #0]
	fcmpes	s14, s15
	fmstat
	movpl	r3, #0
	movmi	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L77
	ldr	r3, .L81+16
	ldr	r4, [r3, #0]
	mov	r0, #1
	mov	r1, #5
	bl	generate_random
	mov	r3, r0
	mov	r0, r4
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L81+60
	str	r2, [r3, #0]
	b	.L78
.L77:
	ldr	r3, .L81+60
	mov	r2, #0
	str	r2, [r3, #0]
.L78:
	ldr	r3, .L81+64
	ldr	r2, [r3, #0]
	ldr	r3, .L81+68
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L81+72
	str	r2, [r3, #0]
	bl	plagues
	bl	pop
	bl	badThings
.L74:
	ldr	r3, .L81+76
	ldr	r3, [r3, #0]
	cmp	r3, #10
	bgt	.L73
	ldr	r3, .L81+80
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L80
.L73:
	ldmfd	sp!, {r3, r4, fp, pc}
.L82:
	.align	2
.L81:
	.word	price_of_land_to_sell
	.word	price_of_land_to_buy
	.word	population
	.word	acres
	.word	grain_on_hand
	.word	.LC23
	.word	.LC1
	.word	acres_to_buy
	.word	.LC24
	.word	acres_to_plant
	.word	bushels_of_seed_per_acre
	.word	yield_range
	.word	yield_per_acre
	.word	harvest
	.word	rat_probability
	.word	eaten_by_rats
	.word	bushels_for_food
	.word	bushels_per_person
	.word	people_fed
	.word	year
	.word	game_lost
	.size	playGame, .-playGame
	.section	.rodata
	.align	2
.LC25:
	.ascii	"Hammurabi:\012\012I beg to report to you that as yo" 	@print ascii statements
	.ascii	"u ascend the throne \000"
	.align	2
.LC26:
	.ascii	"your city has %d citizens, %d acres of farmland, an"	@print ascii statements
	.ascii	"d %d bushels of grain in storage.\012\012May your r"
	.ascii	"eign be blessed with bounteous harvests and peace.\012"
	.ascii	"\000"
	.align	2
.LC27:
	.ascii	"In your term of office, %d percent of the populatio"	@print ascii statements
	.ascii	"n starved per year on average.\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}	@add to descending stack
	add	fp, sp, #4			@increment frame pointer
	b	.L84				@branch to .L84
.L94:
	ldr	r3, .L95+12
	mov	r0, r3
	bl	printf		@print strings
	ldr	r0, .L95+16
	ldr	r3, .L95+20
	ldr	r1, [r3, #0]
	ldr	r3, .L95+24
	ldr	r2, [r3, #0]
	ldr	r3, .L95+28
	ldr	r3, [r3, #0]
	bl	printf		@print strings
	ldr	r3, .L95+32
	mov	r2, #1
	str	r2, [r3, #0]
	bl	playGame	@branch to playGame
	ldr	r3, .L95+20 	@(if population == 0
	ldr	r3, [r3, #0]
	cmp	r3, #0		@(population >0)
	ble	.L85		@branch to L85)
	ldr	r3, .L95+24
	ldr	r2, [r3, #0]
	ldr	r3, .L95+20
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L95+36
	str	r2, [r3, #0]
	b	.L86		@branch to L86
.L85:
	ldr	r3, .L95+36
	mov	r2, #0
	str	r2, [r3, #0]
.L86:
	ldr	r3, .L95+40
	ldr	r2, .L95+44
	flds	s15, [r2, #0]
	fcvtds	d7, s15
	mov	r0, r3
	fmrrd	r2, r3, d7
	bl	printf
	ldr	r3, .L95+48
	ldr	r3, [r3, #0]
	cmp	r3, #1		@(game_lost == 1
	bne	.L87
	bl	lost		@lost()
	b	.L84		@continue looping branch L8
.L87:
	ldr	r3, .L95+44			@(percentage_starved > 33 
	flds	s14, [r3, #0]
	flds	s15, .L95
	fcmpes	s14, s15
	fmstat
	movle	r3, #0
	movgt	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L88				@impeached(total starved))
	ldr	r3, .L95+36			@(acres_per_person < 7
	ldr	r3, [r3, #0]
	cmp	r3, #6
	bgt	.L89				@impeached(total starved)) branch to L89
.L88:
	ldr	r3, .L95+52		@L88 branches to impeached with appropriate starved value
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	impeached		@call impeached function
	b	.L84			@branch to L84 (loop)
.L89:
	ldr	r3, .L95+44		(percentage starved > 10
	flds	s14, [r3, #0]
	flds	s15, .L95+4
	fcmpes	s14, s15
	fmstat
	movle	r3, #0
	movgt	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L90			@bad()) branch to L90
	ldr	r3, .L95+36		@((acres_per_person < 7)
	ldr	r3, [r3, #0]
	cmp	r3, #8
	bgt	.L91		@bad() branch to L91)
.L90:
	bl	bad		@call bad function
	b	.L84	@branch to L8 (loop)
.L91:
	ldr	r3, .L95+44
	flds	s14, [r3, #0]
	flds	s15, .L95+8
	fcmpes	s14, s15
	fmstat
	movle	r3, #0
	movgt	r3, #1
	uxtb	r3, r3
	cmp	r3, #0			@(percentage_starved > 3
	bne	.L92			@impeached(total_starved)
	ldr	r3, .L95+36		@(acres_per_person < 10)
	ldr	r3, [r3, #0]
	cmp	r3, #9
	bgt	.L93		 @impeached(total_starved)
.L92:
	ldr	r3, .L95+20
	ldr	r3, [r3, #0]
	mov r0, r3
	bl	ok		@call ok function
	b	.L84	@branch to L84 (loop)
.L93:
	bl	fantastic	@branch to fantastic
.L84:
	ldr	r3, .L95+56
	ldr	r3, [r3, #0]
	cmp	r3, #1		@play_game == 1 (loop control)
	beq	.L94		@branch to L94 (continue loop execution)
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp!, {fp, pc}
.L96:
	.align	2
.L95:
	.word	1107558400
	.word	1092616192
	.word	1077936128
	.word	.LC25
	.word	.LC26
	.word	population
	.word	acres
	.word	grain_on_hand
	.word	year
	.word	acres_per_person
	.word	.LC27
	.word	percentage_starved
	.word	game_lost
	.word	total_starved
	.word	play_game
	.size	main, .-main
	.ident	"GCC: (Debian 4.6.3-14+rpi1) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
