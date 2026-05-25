        .text
        .extern data_ov000_021c758c
        .global func_ov000_021af5c0
        .arm
func_ov000_021af5c0:
    ldr r0, .L_021af5dc
    ldr r0, [r0, #0x34]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_021af5dc: .word data_ov000_021c758c
