        .text
        .global func_0203d6c4
        .arm
func_0203d6c4:
    ldrb r0, [r0, #0xd0b]
    mov r0, r0, lsl #0x1e
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    moveq r0, #0x30000
    movne r0, #0x20000
    bx lr
