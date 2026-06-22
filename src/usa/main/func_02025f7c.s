; func_02025f7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02025f7c
        .arm
func_02025f7c:
    add r0, r0, #0x100
    ldrh r1, [r0, #0x6a]
    bic r1, r1, #0x400
    strh r1, [r0, #0x6a]
    bx lr
