; func_0207f8d8 — brief 655 review: no duplicate-address evidence.
; Taxonomy citation removed; never assessed as a C-match target.

        .text
        .global func_0207f8d8
        .arm
func_0207f8d8:
    ldr r3, [r0, #0x0]
    cmp r3, #0x1
    ldreqh r3, [r0, #0x12]
    orreq r3, r3, #0x2
    streqh r3, [r0, #0x12]
    streq r1, [r0, #0x4]
    streq r2, [r0, #0x8]
    bx lr
