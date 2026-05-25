        .text
        .global func_02078eec
        .arm
func_02078eec:
    ldrh r2, [r0, #0x0]
    ldrh r3, [r0, #-0x2]
    orr r1, r3, r2, lsl #0x10
    ldrh r2, [r0, #-0x4]
    ldrh r3, [r0, #-0x6]
    orr r0, r3, r2, lsl #0x10
    bx lr
