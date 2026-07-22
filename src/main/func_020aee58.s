; func_020aee58 — brief 655 review: no duplicate-address evidence.
; Taxonomy citation removed; never assessed as a C-match target.

        .text
        .global func_020aee58
        .arm
func_020aee58:
    mov r3, r0
.L_020aee5c:
    ldrh r2, [r1], #0x2
    mov ip, r3
    strh r2, [r3], #0x2
    ldrh r2, [ip, #0x0]
    cmp r2, #0x0
    bne .L_020aee5c
    bx lr
