        .text
        .global func_ov002_022b3434
        .arm
func_ov002_022b3434:
    ldr r1, [r0, #0x4]
    cmp r1, #0x0
    ldrne r0, [r0, #0xc]
    cmpne r0, #0x0
    bx lr
