; func_0206d79c — brief 655 review: no duplicate-address evidence.
; Taxonomy citation removed; never assessed as a C-match target.

        .text
        .global func_0206d79c
        .arm
func_0206d79c:
    ldr r2, [r0, #0x68]
    add r0, r2, #0x100
    ldrh r1, [r0, #0x0]
    ldrh r0, [r0, #0x2]
    ldr r2, [r2, #0xf8]
    sub r0, r0, r1
    subs r0, r0, #0x1
    addmi r0, r0, r2
    bx lr
