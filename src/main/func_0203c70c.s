; func_0203c70c — brief 655 review: no duplicate-address evidence.
; Taxonomy citation removed; never assessed as a C-match target.

        .text
        .global func_0203c70c
        .arm
func_0203c70c:
    cmp r0, #0x0
    beq .L_0203c720
    ldrh r0, [r0, #0xb0]
    tst r0, #0x800
    beq .L_0203c728
.L_0203c720:
    mov r0, #0x1
    bx lr
.L_0203c728:
    mov r0, #0x0
    bx lr
