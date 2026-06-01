        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c38c4
        .extern func_ov002_02253458
        .global func_ov002_0224ea54
        .arm
func_ov002_0224ea54:
	stmdb sp!, {r3, r4, r5, lr}
	mov	r5, r0
	ldr r4, .Lfunc_ov002_0224ea54_p0
	ldr r1, .Lfunc_ov002_0224ea54_p1
	and	r3, r5, #1
	mla	r1, r3, r1, r4
	mov	r4, r2
	add	r1, r1, #288
	ldr	r2, [r1, r4, lsl #2]
	mov r1, r2, lsl #2
	mov r1, r1, lsr #24
	mov r2, r2, lsl #18
	mov r1, r1, lsl #1
	add	r1, r1, r2, lsr #31
	bl	func_ov002_021c38c4
	cmp	r0, #7
	ldmltia sp!, {r3, r4, r5, pc}
	mov	r0, r5
	mov	r2, r4
	mov	r1, #11
	bl	func_ov002_02253458
	ldmia sp!, {r3, r4, r5, pc}
.Lfunc_ov002_0224ea54_p0: .word data_ov002_022cf16c
.Lfunc_ov002_0224ea54_p1: .word 0x00000868
