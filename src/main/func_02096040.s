        .text
        .global func_02096040
        .arm
func_02096040:
    sub sp, sp, #0x8
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    str r1, [r0, #0x0]
    str r1, [r0, #0x4]
    add sp, sp, #0x8
    bx lr
