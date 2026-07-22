; func_0209aa48 — brief 655 review: no duplicate-address evidence.
; Taxonomy citation removed; never assessed as a C-match target.

        .text
        .global func_0209aa48
        .arm
func_0209aa48:
    ldr r0, .L_0209aa60
    ldrh r0, [r0, #0x0]
    ands r0, r0, #0x1
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_0209aa60:
        .word   0x4000304
