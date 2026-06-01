        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern func_ov002_021c1e44
        .global func_ov002_021efc64
        .arm
func_ov002_021efc64:
	stmdb sp!, {r4, lr}
	ldrh	r3, [r0, #2]
	mov r3, r3, lsl #31
	cmp	r1, r3, lsr #31
	moveq	r0, #0
	ldmeqia sp!, {r4, pc}
	cmp	r2, #5
	movge	r0, #0
	ldmgeia sp!, {r4, pc}
	ldr ip, .Lfunc_ov002_021efc64_p0
	and	lr, r1, #1
	mul	r4, lr, ip
	mov	r3, #20
	mul	lr, r2, r3
	ldr ip, .Lfunc_ov002_021efc64_p1
	add	r3, ip, r4
	add	r3, r3, lr
	ldr	r3, [r3, #48]
	mov r3, r3, lsl #19
	movs r3, r3, lsr #19
	moveq	r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r3, .Lfunc_ov002_021efc64_p2
	add	r3, r3, r4
	ldrh	r3, [lr, r3]
	cmp	r3, #0
	moveq	r0, #0
	ldmeqia sp!, {r4, pc}
	bl	func_ov002_021c1e44
	cmp	r0, #0
	moveq	r0, #1
	movne	r0, #0
	ldmia sp!, {r4, pc}
.Lfunc_ov002_021efc64_p0: .word 0x00000868
.Lfunc_ov002_021efc64_p1: .word data_ov002_022cf16c
.Lfunc_ov002_021efc64_p2: .word data_ov002_022cf1a2
