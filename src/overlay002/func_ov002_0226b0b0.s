        .text
        .extern func_ov002_0226acf8
        .global func_ov002_0226b0b0
        .arm
func_ov002_0226b0b0:
    ldr ip, .L_0226b0cc
    mov r3, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r1, #0x12
    bx ip
.L_0226b0cc: .word func_ov002_0226acf8
