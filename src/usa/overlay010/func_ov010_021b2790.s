; func_ov010_021b2790 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov010_021b2790
        .arm
func_ov010_021b2790:
    strh r1, [r0, #0x1c]
    strh r2, [r0, #0x1e]
    ldrh r1, [sp]
    strh r3, [r0, #0x20]
    strh r1, [r0, #0x22]
    bx lr
