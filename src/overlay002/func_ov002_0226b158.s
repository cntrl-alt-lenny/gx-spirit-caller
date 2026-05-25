        .text
        .extern func_ov002_0226acf8
        .global func_ov002_0226b158
        .arm
func_ov002_0226b158:
    ldr ip, .L_0226b170
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r1, #0xd
    mov r3, #0x0
    bx ip
.L_0226b170: .word func_ov002_0226acf8
