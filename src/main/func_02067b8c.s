        .text
        .global func_02067b8c
        .arm
func_02067b8c:
    ldr r3, [r0, #0x40]
    cmp r3, #0x14
    addlt r2, r3, #0x1
    strlt r2, [r0, #0x40]
    addlt r0, r0, r3
    strltb r1, [r0, #0x2c]
    bx lr
