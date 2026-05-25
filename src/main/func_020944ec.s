        .text
        .global func_020944ec
        .arm
func_020944ec:
    add ip, r0, r2
.L_020944f0:
    cmp r0, ip
    ldmltia r0!, {r2}
    strlt r2, [r1, #0x0]
    blt .L_020944f0
    bx lr
