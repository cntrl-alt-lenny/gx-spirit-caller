        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c1ef0
        .global func_ov002_021eec48
        .arm
func_ov002_021eec48:
	stmdb sp!, {r3, lr}
	ldr r3, .Lfunc_ov002_021eec48_p0
	and	lr, r1, #1
	mov	ip, #20
	mul	r3, lr, r3
	ldr lr, .Lfunc_ov002_021eec48_p1
	mul	ip, r2, ip
	add	lr, lr, r3
	add	lr, lr, ip
	ldr	lr, [lr, #48]
	mov lr, lr, lsl #19
	movs lr, lr, lsr #19
	moveq	r0, #0
	ldmeqia sp!, {r3, pc}
	ldrh	lr, [r0, #2]
	mov lr, lr, lsl #31
	cmp	r1, lr, lsr #31
	moveq	r0, #0
	ldmeqia sp!, {r3, pc}
	cmp	r2, #4
	movgt	r0, #0
	ldmgtia sp!, {r3, pc}
	ldr lr, .Lfunc_ov002_021eec48_p2
	add	r3, lr, r3
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	movne	r0, #0
	ldmneia sp!, {r3, pc}
	bl	func_ov002_021c1ef0
	cmp	r0, #0
	movne	r0, #1
	moveq	r0, #0
	ldmia sp!, {r3, pc}
.Lfunc_ov002_021eec48_p0: .word 0x00000868
.Lfunc_ov002_021eec48_p1: .word data_ov002_022cf16c
.Lfunc_ov002_021eec48_p2: .word data_ov002_022cf1a4
