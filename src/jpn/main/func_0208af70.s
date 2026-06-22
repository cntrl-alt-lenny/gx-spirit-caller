; func_0208af70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208af70
        .arm
func_0208af70:
    ldr r2, [r0, #0x8]
    ldr r1, [r0, #0xc]
    cmp r2, r1
    addlt r1, r2, #0x1
    strlt r1, [r0, #0x8]
    bx lr
