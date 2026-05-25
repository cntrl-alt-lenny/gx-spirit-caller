        .text
        .global func_02087d10
        .arm
func_02087d10:
    ldr r3, [r0, #0x0]
    cmp r3, #0x0
    movne r2, #0x1
    strneh r2, [r3, #0x34]
    ldrne r0, [r0, #0x0]
    strneh r1, [r0, #0x38]
    bx lr
