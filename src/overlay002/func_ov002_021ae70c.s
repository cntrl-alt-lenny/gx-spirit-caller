        .text
        .extern func_ov002_0229ade0
        .global func_ov002_021ae70c
        .arm
func_ov002_021ae70c:
	stmdb sp!, {r3, lr}
	ldr	ip, [sp, #8]
	and	lr, r2, #15
	and	r2, ip, #15
	orr	r2, lr, r2, lsl #4
	and	r3, r3, #255
	and	r2, r2, #255
	orr	r2, r2, r3, lsl #8
	mov r2, r2, lsl #16
	mov r2, r2, lsr #16
	mov r3, r2, lsl #16
	mov r1, r1, lsl #16
	mov	r2, r0
	orr	r3, r3, r1, lsr #16
	mov	r0, #49
	mov	r1, #10
	bl	func_ov002_0229ade0
	ldmia sp!, {r3, pc}
