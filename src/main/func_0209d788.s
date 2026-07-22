; func_0209d788 — brief 655 review: no duplicate-address evidence.
; Taxonomy citation removed; never assessed as a C-match target.

        .text
        .global func_0209d788
        .arm
func_0209d788:
    ldr r1, .L_0209d7a0
    ldrh r0, [r1, #0x0]
    ands r2, r0, #0x1
    bicne r0, r0, #0x1
    strneh r0, [r1, #0x0]
    bx lr
.L_0209d7a0:
        .word   0x27fff96
