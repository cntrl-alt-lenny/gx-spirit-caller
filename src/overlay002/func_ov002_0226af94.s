        .text
        .extern func_ov002_0226acf8
        .global func_ov002_0226af94
        .arm
func_ov002_0226af94:
    ldr ip, .L_0226afb0
    mov r3, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r1, #0x6
    bx ip
.L_0226afb0: .word func_ov002_0226acf8
