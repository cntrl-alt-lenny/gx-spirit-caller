        .text
        .global func_0209448c
        .arm
func_0209448c:
    mov r3, #0x0
.L_02094490:
    cmp r3, r2
    strlth r0, [r1, r3]
    addlt r3, r3, #0x2
    blt .L_02094490
    bx lr
