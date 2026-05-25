        .text
        .extern data_021024b0
        .global func_02092368
        .arm
func_02092368:
    ldr r0, .L_02092378
    ldr r1, .L_0209237c
    str r0, [r1, #0x0]
    bx lr
.L_02092378: .word 0x82000001
.L_0209237c: .word data_021024b0
