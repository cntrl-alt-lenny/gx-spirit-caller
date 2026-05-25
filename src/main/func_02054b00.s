        .text
        .extern data_020ffbd4
        .global func_02054b00
        .arm
func_02054b00:
    cmp r0, #0x0
    bicne r1, r0, #0x80000000
    ldr r0, .L_02054b18
    moveq r1, #0x1
    str r1, [r0, #0x0]
    bx lr
.L_02054b18: .word data_020ffbd4
