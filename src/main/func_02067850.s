; func_02067850 — brief 655 review: no duplicate-address evidence.
; Taxonomy citation removed; never assessed as a C-match target.

        .text
        .extern data_02101928
        .global func_02067850
        .arm
func_02067850:
    cmp r0, #0x32
    bxlt lr
    cmp r0, #0xfe
    bxgt lr
    ldr r2, .L_0206786c
    str r1, [r2, r0, lsl #0x2]
    bx lr
.L_0206786c:
        .word   data_02101928
