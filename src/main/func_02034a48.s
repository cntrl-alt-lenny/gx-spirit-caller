        .text
        .extern Task_InvokeLocked
        .extern func_02033054
        .extern func_02034a38
        .global func_02034a48
        .arm
func_02034a48:
    ldr ip, .L_02034a5c
    ldr r0, .L_02034a60
    ldr r1, .L_02034a64
    mov r2, #0x0
    bx ip
.L_02034a5c: .word func_02033054
.L_02034a60: .word func_02034a38
.L_02034a64: .word Task_InvokeLocked
