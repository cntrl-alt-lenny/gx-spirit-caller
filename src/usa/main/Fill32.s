; Fill32 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global Fill32
        .global .L_020943cc
        .global .L_020943d0
        .global .L_020943d4
        .global .L_020943d8
        .global .L_020943dc
        .arm
Fill32:
.L_020943cc:
    add ip, r1, r2
.L_4:
.L_020943d0:
    cmp r1, ip
.L_020943d4:
    stmltia r1!, {r0}
.L_020943d8:
    blt .L_4
.L_020943dc:
    bx lr
