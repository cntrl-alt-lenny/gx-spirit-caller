; func_0207f914 — brief 655 review: no duplicate-address evidence.
; Taxonomy citation removed; never assessed as a C-match target.

        .text
        .global func_0207f914
        .arm
func_0207f914:
    ldr r3, [r0, #0x0]
    cmp r3, #0x1
    ldreqh r3, [r0, #0x12]
    orreq r3, r3, #0x8
    streqh r3, [r0, #0x12]
    streqh r1, [r0, #0xc]
    streqh r2, [r0, #0xe]
    bx lr
