        .text
        .global func_0207db74
        .arm
func_0207db74:
    ldr r1, [r0, #0x18]
    add r2, r0, #0x24
    str r1, [r0, #0x24]
    mov r0, #0x0
    str r0, [r2, #0x8]
    bx lr
