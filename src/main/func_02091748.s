        .text
        .extern func_020919d8
        .global func_02091748
        .arm
func_02091748:
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    str r1, [r0, #0x0]
    ldr ip, .L_02091764
    mov r0, r2
    str r1, [r2, #0xb0]
    bx ip
.L_02091764: .word func_020919d8
