        .text
        .extern func_02090960
        .extern func_02090a60
        .global func_020909b0
        .arm
func_020909b0:
    ldr ip, .L_020909c4
    ldr r1, .L_020909c8
    ldr r2, .L_020909cc
    mov r3, #0x1
    bx ip
.L_020909c4: .word func_02090a60
.L_020909c8: .word 0x27fffe8
.L_020909cc: .word func_02090960
