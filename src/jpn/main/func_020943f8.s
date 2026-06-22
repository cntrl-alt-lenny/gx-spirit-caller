; func_020943f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020943f8
        .arm
func_020943f8:
    add ip, r0, r2
.L_6b8:
    cmp r0, ip
    ldmltia r0!, {r2}
    strlt r2, [r1]
    blt .L_6b8
    bx lr
