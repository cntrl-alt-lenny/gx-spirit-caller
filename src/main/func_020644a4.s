; func_020644a4 — brief 655 review: no duplicate-address evidence.
; Taxonomy citation removed; never assessed as a C-match target.

        .text
        .global func_020644a4
        .arm
func_020644a4:
    ldrb r2, [r0, r1]
    add r1, r1, #0x1
    ldrb r1, [r0, r1]
    mov r0, r2, lsl #0x8
    and r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    bx lr
