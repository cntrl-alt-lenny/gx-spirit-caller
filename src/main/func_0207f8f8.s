        .text
        .global func_0207f8f8
        .arm
func_0207f8f8:
    ldr r2, [r0, #0x0]
    cmp r2, #0x1
    ldreqh r2, [r0, #0x12]
    orreq r2, r2, #0x4
    streqh r2, [r0, #0x12]
    streqh r1, [r0, #0x10]
    bx lr
