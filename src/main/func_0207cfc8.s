        .text
        .global func_0207cfc8
        .arm
func_0207cfc8:
    cmp r1, #0x0
    ldreq r0, [r0, #0x4]
    ldrneh r0, [r0, #0xa]
    ldrne r0, [r1, r0]
    bx lr
