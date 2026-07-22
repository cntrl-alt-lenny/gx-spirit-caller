; func_02034094 — brief 655 review: no duplicate-address evidence.
; Taxonomy citation removed; never assessed as a C-match target.

        .text
        .global func_02034094
        .arm
func_02034094:
    cmp r1, #0xc800
    blt .L_020340ac
    ldr r0, .L_020340b4
    cmp r1, r0
    movle r0, #0x1
    bxle lr
.L_020340ac:
    mov r0, #0x0
    bx lr
.L_020340b4:
        .word   0xc863
