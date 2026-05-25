        .text
        .extern data_020beefc
        .global func_0208147c
        .arm
func_0208147c:
    ldrb r3, [r0, #0x1]
    ldr r2, .L_02081494
    ldrb r1, [r0, #0x0]
    add r0, r2, r3, lsl #0x4
    ldr r0, [r0, r1, lsl #0x2]
    bx lr
.L_02081494: .word data_020beefc
