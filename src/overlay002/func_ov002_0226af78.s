        .text
        .extern func_ov002_0226acf8
        .global func_ov002_0226af78
        .arm
func_ov002_0226af78:
    ldr ip, .L_0226af90
    mov r1, r1, lsl #0x10
    mov r3, r1, lsr #0x10
    mov r1, #0x5
    mov r2, #0x0
    bx ip
.L_0226af90: .word func_ov002_0226acf8
