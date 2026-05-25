        .text
        .extern data_021a08e4
        .global func_0207e214
        .arm
func_0207e214:
    ldr r0, .L_0207e22c
    mov r2, #0x0
    ldr r1, [r0, #0x8]
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    bx lr
.L_0207e22c: .word data_021a08e4
