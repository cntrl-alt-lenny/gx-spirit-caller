; Copy32 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global Copy32
        .global .L_020943f4
        .global .L_020943f8
        .global .L_020943fc
        .global .L_02094400
        .global .L_02094404
        .global .L_02094408
        .arm
Copy32:
.L_020943f4:
    add ip, r1, r2
.L_18:
.L_020943f8:
    cmp r1, ip
.L_020943fc:
    ldmltia r0!, {r2}
.L_02094400:
    stmltia r1!, {r2}
.L_02094404:
    blt .L_18
.L_02094408:
    bx lr
