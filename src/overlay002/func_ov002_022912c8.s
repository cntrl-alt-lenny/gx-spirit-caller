        .text
        .extern func_ov002_0227da98
        .global func_ov002_022912c8
        .arm
func_ov002_022912c8:
    ldrh r0, [r0, #0x2]
    ldr ip, .L_022912dc
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bx ip
.L_022912dc: .word func_ov002_0227da98
