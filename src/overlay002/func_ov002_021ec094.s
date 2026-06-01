        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c1ef0
        .extern data_ov002_022cf1a4
        .global func_ov002_021ec094
        .arm
func_ov002_021ec094:
	stmdb sp!, {r3, r4, r5, lr}
	cmp	r2, #5
	movge	r0, #0
	ldmgeia sp!, {r3, r4, r5, pc}
	ldr r4, .Lfunc_ov002_021ec094_p0
	and	ip, r1, #1
	mul	r5, ip, r4
	mov	r3, #20
	mul	r4, r2, r3
	ldr ip, .Lfunc_ov002_021ec094_p1
	add	r3, ip, r5
	add	r3, r3, r4
	ldr	r3, [r3, #48]
	mov r3, r3, lsl #19
	movs r3, r3, lsr #19
	moveq	r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl	func_ov002_021c1ef0
	cmp	r0, #0
	moveq	r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, .Lfunc_ov002_021ec094_p2
	add	r0, r0, r5
	ldrh	r0, [r4, r0]
	cmp	r0, #0
	movne	r0, #1
	moveq	r0, #0
	ldmia sp!, {r3, r4, r5, pc}
.Lfunc_ov002_021ec094_p0: .word 0x00000868
.Lfunc_ov002_021ec094_p1: .word data_ov002_022cf16c
.Lfunc_ov002_021ec094_p2: .word data_ov002_022cf1a4
