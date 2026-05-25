        .text
        .extern data_020c6418
        .extern data_020c6484
        .global func_0201f11c
        .arm
func_0201f11c:
    cmp r0, #0x1b
    ldrlo r1, .L_0201f130
    ldrlo r0, [r1, r0, lsl #0x2]
    ldrhs r0, .L_0201f134
    bx lr
.L_0201f130: .word data_020c6418
.L_0201f134: .word data_020c6484
