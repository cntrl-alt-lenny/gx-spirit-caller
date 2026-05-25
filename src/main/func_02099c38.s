        .text
        .extern data_021a8394
        .global func_02099c38
        .arm
func_02099c38:
    ldr r1, .L_02099c4c
.L_02099c3c:
    ldrh r2, [r1, #0x36]
    ands r2, r2, r0
    bne .L_02099c3c
    bx lr
.L_02099c4c: .word data_021a8394
