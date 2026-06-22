; func_0200093c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0200093c
        .arm
func_0200093c:
    add ip, r1, r2
.L_940:
    cmp r1, ip
    stmltia r1!, {r0}
    blt .L_940
    bx lr
