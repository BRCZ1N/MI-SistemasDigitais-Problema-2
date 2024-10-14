	.syntax unified
	.arch armv7-a
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfpv3-d16
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.file	"gpu_lib.c"
	.global	fd
	.bss
	.align	2
	.type	fd, %object
	.size	fd, 4
fd:
	.space	4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"/dev/gpu_driver\000"
	.align	2
.LC1:
	.ascii	"Failed to open the device\000"
	.text
	.align	2
	.global	open_gpu_device
	.thumb
	.thumb_func
	.type	open_gpu_device, %function
open_gpu_device:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	mov	r1, #1
	bl	open
	mov	r2, r0
	movw	r3, #:lower16:fd
	movt	r3, #:upper16:fd
	str	r2, [r3, #0]
	movw	r3, #:lower16:fd
	movt	r3, #:upper16:fd
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bge	.L2
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	perror
	mov	r3, #0
	b	.L3
.L2:
	mov	r3, #1
.L3:
	mov	r0, r3
	pop	{r7, pc}
	.size	open_gpu_device, .-open_gpu_device
	.align	2
	.global	close_gpu_devide
	.thumb
	.thumb_func
	.type	close_gpu_devide, %function
close_gpu_devide:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	movw	r3, #:lower16:fd
	movt	r3, #:upper16:fd
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	close
	pop	{r7, pc}
	.size	close_gpu_devide, .-close_gpu_devide
	.section	.rodata
	.align	2
.LC2:
	.ascii	"Failed to write to the device\000"
	.text
	.align	2
	.global	set_background_color
	.thumb
	.thumb_func
	.type	set_background_color, %function
set_background_color:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	mov	r3, r2
	mov	r2, r0
	strb	r2, [r7, #7]
	mov	r2, r1
	strb	r2, [r7, #6]
	strb	r3, [r7, #5]
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r3, [r3, #0]
	str	r3, [r7, #12]
	mov	r3, #0
	strb	r3, [r7, #8]
	ldrb	r3, [r7, #7]
	strb	r3, [r7, #9]
	ldrb	r3, [r7, #5]
	strb	r3, [r7, #10]
	ldrb	r3, [r7, #6]
	strb	r3, [r7, #11]
	movw	r3, #:lower16:fd
	movt	r3, #:upper16:fd
	ldr	r2, [r3, #0]
	add	r3, r7, #8
	mov	r0, r2
	mov	r1, r3
	mov	r2, #4
	bl	write
	mov	r3, r0
	cmp	r3, #0
	bge	.L6
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	perror
	mov	r3, #0
	b	.L7
.L6:
	mov	r3, #1
.L7:
	mov	r0, r3
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r2, [r7, #12]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	.L8
	bl	__stack_chk_fail
.L8:
	add	r7, r7, #16
	mov	sp, r7
	pop	{r7, pc}
	.size	set_background_color, .-set_background_color
	.align	2
	.global	set_sprite
	.thumb
	.thumb_func
	.type	set_sprite, %function
set_sprite:
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	strb	r0, [r7, #7]
	strh	r1, [r7, #4]	@ movhi
	strh	r2, [r7, #2]	@ movhi
	strb	r3, [r7, #6]
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r3, [r3, #0]
	str	r3, [r7, #20]
	mov	r3, #1
	strb	r3, [r7, #12]
	ldrb	r3, [r7, #7]
	strb	r3, [r7, #13]
	ldrb	r3, [r7, #6]	@ zero_extendqisi2
	lsr	r3, r3, #1
	uxtb	r3, r3
	strb	r3, [r7, #14]
	ldrb	r3, [r7, #6]	@ zero_extendqisi2
	lsl	r3, r3, #7
	uxtb	r2, r3
	ldrh	r3, [r7, #4]
	lsr	r3, r3, #3
	uxth	r3, r3
	uxtb	r3, r3
	and	r3, r3, #127
	uxtb	r3, r3
	orrs	r3, r3, r2
	uxtb	r3, r3
	uxtb	r3, r3
	strb	r3, [r7, #15]
	ldrh	r3, [r7, #4]
	lsl	r3, r3, #5
	uxtb	r2, r3
	ldrh	r3, [r7, #2]
	lsr	r3, r3, #5
	uxth	r3, r3
	uxtb	r3, r3
	and	r3, r3, #31
	uxtb	r3, r3
	orrs	r3, r3, r2
	uxtb	r3, r3
	uxtb	r3, r3
	strb	r3, [r7, #16]
	ldrh	r3, [r7, #2]
	lsl	r3, r3, #3
	uxtb	r3, r3
	strb	r3, [r7, #17]
	ldrb	r3, [r7, #32]
	strb	r3, [r7, #18]
	movw	r3, #:lower16:fd
	movt	r3, #:upper16:fd
	ldr	r2, [r3, #0]
	add	r3, r7, #12
	mov	r0, r2
	mov	r1, r3
	mov	r2, #7
	bl	write
	mov	r3, r0
	cmp	r3, #0
	bge	.L10
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	perror
	mov	r3, #0
	b	.L11
.L10:
	mov	r3, #1
.L11:
	mov	r0, r3
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r2, [r7, #20]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	.L12
	bl	__stack_chk_fail
.L12:
	add	r7, r7, #24
	mov	sp, r7
	pop	{r7, pc}
	.size	set_sprite, .-set_sprite
	.align	2
	.global	set_poligono
	.thumb
	.thumb_func
	.type	set_poligono, %function
set_poligono:
	@ args = 16, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	strh	r0, [r7, #6]	@ movhi
	strh	r1, [r7, #4]	@ movhi
	strh	r2, [r7, #2]	@ movhi
	strb	r3, [r7, #1]
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r3, [r3, #0]
	str	r3, [r7, #20]
	mov	r3, #4
	strb	r3, [r7, #12]
	ldrh	r3, [r7, #6]	@ movhi
	uxtb	r3, r3
	strb	r3, [r7, #13]
	ldrh	r3, [r7, #4]
	lsr	r3, r3, #1
	uxth	r3, r3
	uxtb	r3, r3
	strb	r3, [r7, #14]
	ldrh	r3, [r7, #4]
	lsl	r3, r3, #7
	uxtb	r2, r3
	ldrh	r3, [r7, #2]
	lsr	r3, r3, #2
	uxth	r3, r3
	uxtb	r3, r3
	orrs	r3, r3, r2
	uxtb	r3, r3
	uxtb	r3, r3
	strb	r3, [r7, #15]
	ldrh	r3, [r7, #2]
	lsl	r3, r3, #6
	uxtb	r2, r3
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	and	r3, r3, #15
	uxtb	r3, r3
	orrs	r3, r3, r2
	uxtb	r3, r3
	uxtb	r3, r3
	strb	r3, [r7, #16]
	ldrb	r3, [r7, #32]	@ zero_extendqisi2
	lsl	r3, r3, #5
	uxtb	r2, r3
	ldrb	r3, [r7, #36]	@ zero_extendqisi2
	and	r3, r3, #7
	lsl	r3, r3, #2
	uxtb	r3, r3
	orrs	r3, r3, r2
	uxtb	r3, r3
	uxtb	r3, r3
	strb	r3, [r7, #17]
	ldrb	r3, [r7, #40]	@ zero_extendqisi2
	lsl	r3, r3, #5
	uxtb	r2, r3
	ldrb	r3, [r7, #44]	@ zero_extendqisi2
	and	r3, r3, #1
	uxtb	r3, r3
	orrs	r3, r3, r2
	uxtb	r3, r3
	uxtb	r3, r3
	strb	r3, [r7, #18]
	movw	r3, #:lower16:fd
	movt	r3, #:upper16:fd
	ldr	r2, [r3, #0]
	add	r3, r7, #12
	mov	r0, r2
	mov	r1, r3
	mov	r2, #7
	bl	write
	mov	r3, r0
	cmp	r3, #0
	bge	.L14
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	perror
	mov	r3, #0
	b	.L15
.L14:
	mov	r3, #1
.L15:
	mov	r0, r3
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r2, [r7, #20]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	.L16
	bl	__stack_chk_fail
.L16:
	add	r7, r7, #24
	mov	sp, r7
	pop	{r7, pc}
	.size	set_poligono, .-set_poligono
	.align	2
	.global	set_background_block
	.thumb
	.thumb_func
	.type	set_background_block, %function
set_background_block:
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #32
	add	r7, sp, #0
	strb	r0, [r7, #7]
	strb	r1, [r7, #6]
	strb	r2, [r7, #5]
	strb	r3, [r7, #4]
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r3, [r3, #0]
	str	r3, [r7, #28]
	mov	r3, #0
	str	r3, [r7, #12]
	ldrb	r1, [r7, #7]	@ zero_extendqisi2
	ldrb	r2, [r7, #6]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #2
	adds	r3, r3, r2
	lsl	r3, r3, #4
	adds	r3, r1, r3
	str	r3, [r7, #16]
	mov	r3, #2
	strb	r3, [r7, #20]
	ldr	r3, [r7, #16]
	asr	r3, r3, #5
	uxtb	r3, r3
	strb	r3, [r7, #21]
	ldr	r3, [r7, #16]
	lsl	r3, r3, #3
	uxtb	r2, r3
	ldrb	r3, [r7, #5]	@ zero_extendqisi2
	orrs	r3, r3, r2
	uxtb	r3, r3
	uxtb	r3, r3
	strb	r3, [r7, #22]
	ldrb	r3, [r7, #4]
	strb	r3, [r7, #23]
	ldrb	r3, [r7, #40]
	strb	r3, [r7, #24]
	movw	r3, #:lower16:fd
	movt	r3, #:upper16:fd
	ldr	r2, [r3, #0]
	add	r3, r7, #20
	mov	r0, r2
	mov	r1, r3
	mov	r2, #5
	bl	write
	mov	r3, r0
	cmp	r3, #0
	bge	.L18
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	perror
	mov	r3, #0
	b	.L19
.L18:
	mov	r3, #1
.L19:
	mov	r0, r3
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r2, [r7, #28]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	.L20
	bl	__stack_chk_fail
.L20:
	add	r7, r7, #32
	mov	sp, r7
	pop	{r7, pc}
	.size	set_background_block, .-set_background_block
	.align	2
	.global	set_sprite_pixel_color
	.thumb
	.thumb_func
	.type	set_sprite_pixel_color, %function
set_sprite_pixel_color:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	strh	r0, [r7, #6]	@ movhi
	strb	r1, [r7, #5]
	strb	r2, [r7, #4]
	strb	r3, [r7, #3]
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r3, [r3, #0]
	str	r3, [r7, #20]
	mov	r3, #3
	strb	r3, [r7, #12]
	ldrh	r3, [r7, #6]
	lsr	r3, r3, #6
	uxth	r3, r3
	uxtb	r3, r3
	strb	r3, [r7, #13]
	ldrh	r3, [r7, #6]	@ movhi
	uxtb	r3, r3
	and	r3, r3, #63
	uxtb	r3, r3
	strb	r3, [r7, #14]
	ldrb	r3, [r7, #5]
	and	r3, r3, #7
	uxtb	r3, r3
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #4]
	and	r3, r3, #7
	uxtb	r3, r3
	strb	r3, [r7, #16]
	ldrb	r3, [r7, #3]
	and	r3, r3, #7
	uxtb	r3, r3
	strb	r3, [r7, #17]
	movw	r3, #:lower16:fd
	movt	r3, #:upper16:fd
	ldr	r2, [r3, #0]
	add	r3, r7, #12
	mov	r0, r2
	mov	r1, r3
	mov	r2, #6
	bl	write
	mov	r3, r0
	cmp	r3, #0
	bge	.L22
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	perror
	mov	r3, #0
	b	.L23
.L22:
	mov	r3, #1
.L23:
	mov	r0, r3
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r2, [r7, #20]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	.L24
	bl	__stack_chk_fail
.L24:
	add	r7, r7, #24
	mov	sp, r7
	pop	{r7, pc}
	.size	set_sprite_pixel_color, .-set_sprite_pixel_color
	.align	2
	.global	increase_coordinate
	.thumb
	.thumb_func
	.type	increase_coordinate, %function
increase_coordinate:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #28
	add	r7, sp, #8
	str	r0, [r7, #4]
	mov	r3, r1
	strb	r3, [r7, #3]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	cmp	r3, #0
	bne	.L26
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #10]
	subs	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #0]	@ movhi
	b	.L27
.L26:
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	cmp	r3, #4
	bne	.L28
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #10]
	adds	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #0]	@ movhi
	b	.L27
.L28:
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	cmp	r3, #2
	bne	.L29
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #2]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #12]
	subs	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #2]	@ movhi
	b	.L27
.L29:
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	cmp	r3, #6
	bne	.L30
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #2]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #12]
	adds	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #2]	@ movhi
	b	.L27
.L30:
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	cmp	r3, #1
	bne	.L31
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #2]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #12]
	subs	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #10]
	adds	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #0]	@ movhi
	b	.L27
.L31:
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	cmp	r3, #3
	bne	.L32
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #2]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #12]
	subs	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #10]
	subs	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #0]	@ movhi
	b	.L27
.L32:
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	cmp	r3, #5
	bne	.L33
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #2]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #12]
	adds	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #10]
	subs	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #0]	@ movhi
	b	.L27
.L33:
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	cmp	r3, #5
	bne	.L27
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #2]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #12]
	adds	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #10]
	adds	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #0]	@ movhi
.L27:
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	uxtb	r0, r3
	ldr	r3, [r7, #4]
	ldrh	r1, [r3, #0]
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #2]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #6]
	uxtb	r3, r3
	ldr	r4, [r7, #4]
	ldrh	r4, [r4, #14]
	uxtb	r4, r4
	str	r4, [sp, #0]
	bl	set_sprite
	str	r0, [r7, #12]
	add	r7, r7, #20
	mov	sp, r7
	pop	{r4, r7, pc}
	.size	increase_coordinate, .-increase_coordinate
	.align	2
	.global	collision
	.thumb
	.thumb_func
	.type	collision, %function
collision:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #0]
	add	r3, r3, #20
	str	r3, [r7, #8]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #2]
	sub	r3, r3, #20
	str	r3, [r7, #12]
	ldr	r3, [r7, #0]
	ldrh	r3, [r3, #0]
	add	r3, r3, #20
	str	r3, [r7, #16]
	ldr	r3, [r7, #0]
	ldrh	r3, [r3, #2]
	sub	r3, r3, #20
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #16]
	cmp	r2, r3
	bge	.L35
	ldr	r3, [r7, #0]
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #8]
	cmp	r2, r3
	blt	.L36
.L35:
	mov	r3, #0
	b	.L37
.L36:
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #2]
	mov	r2, r3
	ldr	r3, [r7, #20]
	cmp	r2, r3
	ble	.L38
	ldr	r3, [r7, #0]
	ldrh	r3, [r3, #2]
	mov	r2, r3
	ldr	r3, [r7, #12]
	cmp	r2, r3
	bgt	.L39
.L38:
	mov	r3, #0
	b	.L37
.L39:
	mov	r3, #1
.L37:
	mov	r0, r3
	add	r7, r7, #28
	mov	sp, r7
	pop	{r7}
	bx	lr
	.size	collision, .-collision
	.align	2
	.global	clear_background_blocks
	.thumb
	.thumb_func
	.type	clear_background_blocks, %function
clear_background_blocks:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #8
	mov	r3, #0
	str	r3, [r7, #0]
	mov	r3, #0
	str	r3, [r7, #4]
	b	.L41
.L43:
	ldr	r3, [r7, #4]
	uxtb	r2, r3
	ldr	r3, [r7, #0]
	uxtb	r3, r3
	mov	r1, #7
	str	r1, [sp, #0]
	mov	r0, r2
	mov	r1, r3
	mov	r2, #6
	mov	r3, #7
	bl	set_background_block
	ldr	r3, [r7, #4]
	add	r3, r3, #1
	str	r3, [r7, #4]
.L42:
	ldr	r3, [r7, #4]
	cmp	r3, #79
	ble	.L43
	mov	r3, #0
	str	r3, [r7, #4]
	ldr	r3, [r7, #0]
	add	r3, r3, #1
	str	r3, [r7, #0]
.L41:
	ldr	r3, [r7, #0]
	cmp	r3, #59
	ble	.L42
	add	r7, r7, #8
	mov	sp, r7
	pop	{r7, pc}
	.size	clear_background_blocks, .-clear_background_blocks
	.align	2
	.global	fill_background_blocks
	.thumb
	.thumb_func
	.type	fill_background_blocks, %function
fill_background_blocks:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #8
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	str	r3, [r7, #8]
	mov	r3, #0
	str	r3, [r7, #12]
	b	.L46
.L48:
	ldr	r3, [r7, #12]
	uxtb	r2, r3
	ldr	r3, [r7, #8]
	uxtb	r3, r3
	mov	r1, #0
	str	r1, [sp, #0]
	mov	r0, r2
	mov	r1, r3
	mov	r2, #2
	mov	r3, #5
	bl	set_background_block
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L47:
	ldr	r3, [r7, #12]
	cmp	r3, #79
	ble	.L48
	mov	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [r7, #8]
	add	r3, r3, #1
	str	r3, [r7, #8]
.L46:
	ldr	r3, [r7, #8]
	cmp	r3, #59
	ble	.L47
	add	r7, r7, #16
	mov	sp, r7
	pop	{r7, pc}
	.size	fill_background_blocks, .-fill_background_blocks
	.align	2
	.global	clear_poligonos
	.thumb
	.thumb_func
	.type	clear_poligonos, %function
clear_poligonos:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #16
	mov	r3, #0
	str	r3, [r7, #4]
	b	.L51
.L52:
	ldr	r3, [r7, #4]
	uxth	r3, r3
	mov	r2, #0
	str	r2, [sp, #0]
	mov	r2, #0
	str	r2, [sp, #4]
	mov	r2, #0
	str	r2, [sp, #8]
	mov	r2, #0
	str	r2, [sp, #12]
	mov	r0, r3
	mov	r1, #0
	mov	r2, #0
	mov	r3, #0
	bl	set_poligono
	ldr	r3, [r7, #4]
	add	r3, r3, #1
	str	r3, [r7, #4]
.L51:
	ldr	r3, [r7, #4]
	cmp	r3, #14
	ble	.L52
	add	r7, r7, #8
	mov	sp, r7
	pop	{r7, pc}
	.size	clear_poligonos, .-clear_poligonos
	.align	2
	.global	clear_sprites
	.thumb
	.thumb_func
	.type	clear_sprites, %function
clear_sprites:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #8
	mov	r3, #1
	str	r3, [r7, #4]
	b	.L54
.L55:
	ldr	r3, [r7, #4]
	uxtb	r3, r3
	mov	r2, #0
	str	r2, [sp, #0]
	mov	r0, r3
	mov	r1, #0
	mov	r2, #0
	mov	r3, #0
	bl	set_sprite
	ldr	r3, [r7, #4]
	add	r3, r3, #1
	str	r3, [r7, #4]
.L54:
	ldr	r3, [r7, #4]
	cmp	r3, #31
	ble	.L55
	add	r7, r7, #8
	mov	sp, r7
	pop	{r7, pc}
	.size	clear_sprites, .-clear_sprites
	.align	2
	.global	draw_sprites_anfranserai
	.thumb
	.thumb_func
	.type	draw_sprites_anfranserai, %function
draw_sprites_anfranserai:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	movw	r0, #10124
	mov	r1, #7
	mov	r2, #0
	mov	r3, #0
	bl	set_sprite_pixel_color
	pop	{r7, pc}
	.size	draw_sprites_anfranserai, .-draw_sprites_anfranserai
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
