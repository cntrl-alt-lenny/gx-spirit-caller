        .text
        .global func_02078ed8
        .arm
func_02078ed8:
    ldrh r1, [r0, #0x0]
    ldrh r2, [r0, #-0x2]
    ldrh r3, [r0, #-0x4]
    orr r0, r3, r2, lsl #0x10
    bx lr
