        .text
        .global func_02098cdc
        .arm
func_02098cdc:
    ldrb r1, [r0, #0x1f]
    ands r1, r1, #0x1
    ldrne r0, [r0, #0x1c]
    movne r0, r0, lsl #0x8
    movne r0, r0, lsr #0x8
    ldreq r0, [r0, #0x8]
    bx lr
