        .text
        .global func_02078ec8
        .arm
func_02078ec8:
    ldrh r1, [r0, #0x0]
    ldrh r0, [r0, #-0x2]
    mov r0, r0, lsl #0x10
    bx lr
