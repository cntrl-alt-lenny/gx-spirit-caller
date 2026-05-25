        .text
        .global func_ov004_021dbd1c
        .thumb
func_ov004_021dbd1c:
    asr r2, r0, #0x8
    mov r1, #0xff
    and r2, r1
    lsl r1, r0, #0x8
    ldr r0, .L_021dbd30
    and r1, r0
    orr r2, r1
    lsl r0, r2, #0x10
    lsr r0, r0, #0x10
    bx lr
.L_021dbd30: .word 0xff00
