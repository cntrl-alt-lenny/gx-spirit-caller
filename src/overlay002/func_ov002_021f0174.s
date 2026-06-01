        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1a2
        .extern func_ov002_021c1e44
        .global func_ov002_021f0174
        .arm
func_ov002_021f0174:
	stmdb sp!, {r3, lr}
	cmp	r2, #5
	movge	r0, #0
	ldmgeia sp!, {r3, pc}
	ldr r3, .Lfunc_ov002_021f0174_p0
	and	lr, r1, #1
	mov	ip, #20
	mul	r3, lr, r3
	ldr lr, .Lfunc_ov002_021f0174_p1
	mul	ip, r2, ip
	add	lr, lr, r3
	add	lr, lr, ip
	ldr	lr, [lr, #48]
	mov lr, lr, lsl #19
	movs lr, lr, lsr #19
	moveq	r0, #0
	ldmeqia sp!, {r3, pc}
	ldr lr, .Lfunc_ov002_021f0174_p2
	add	lr, lr, r3
	ldrh	lr, [ip, lr]
	cmp	lr, #0
	moveq	r0, #0
	ldmeqia sp!, {r3, pc}
	ldr lr, .Lfunc_ov002_021f0174_p3
	add	r3, lr, r3
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	movne	r0, #0
	ldmneia sp!, {r3, pc}
	bl	func_ov002_021c1e44
	cmp	r0, #0
	moveq	r0, #1
	movne	r0, #0
	ldmia sp!, {r3, pc}
.Lfunc_ov002_021f0174_p0: .word 0x00000868
.Lfunc_ov002_021f0174_p1: .word data_ov002_022cf16c
.Lfunc_ov002_021f0174_p2: .word data_ov002_022cf1a4
.Lfunc_ov002_021f0174_p3: .word data_ov002_022cf1a2
