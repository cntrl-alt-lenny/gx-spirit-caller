        .text
        .global func_020944a4
        .arm
func_020944a4:
    mov ip, #0x0
.L_020944a8:
    cmp ip, r2
    ldrlth r3, [r0, ip]
    strlth r3, [r1, ip]
    addlt ip, ip, #0x2
    blt .L_020944a8
    bx lr
