        .text
        .extern func_020945f4
        .global func_ov004_021dbe5c
        .thumb
func_ov004_021dbe5c:
    lsl r1, r1, #0x18
    lsr r1, r1, #0x18
    ldr r3, .L_021dbe64
    bx r3
.L_021dbe64: .word func_020945f4
