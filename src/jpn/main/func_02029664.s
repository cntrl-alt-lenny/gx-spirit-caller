; func_02029664 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02029664
        .arm
func_02029664:
    add r0, r0, #0x100
    ldrh r1, [r0, #0x9a]
    bic r1, r1, #0x40
    strh r1, [r0, #0x9a]
    bx lr
