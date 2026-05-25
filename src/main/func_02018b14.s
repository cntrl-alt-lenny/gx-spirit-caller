        .text
        .global func_02018b14
        .arm
func_02018b14:
    cmp r0, #0x2
    mov r0, #0x1
    bxne lr
    cmp r1, #0x7
    bx lr
