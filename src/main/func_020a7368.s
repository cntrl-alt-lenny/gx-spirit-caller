; func_020a7368 — brief 655 review: no duplicate-address evidence.
; Taxonomy citation removed; never assessed as a C-match target.

        .text
        .global func_020a7368
        .arm
func_020a7368:
    mov ip, r0
    cmp r2, #0x0
    bxeq lr
.L_020a7374:
    ldrsb r3, [r1], #0x1
    subs r2, r2, #0x1
    strb r3, [ip], #0x1
    bne .L_020a7374
    bx lr
