        .text
        .extern data_ov000_021c7530
        .global func_ov000_021ab6cc
        .arm
func_ov000_021ab6cc:
    ldr r0, .L_021ab6e8
    ldr r0, [r0, #0x58]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_021ab6e8: .word data_ov000_021c7530
