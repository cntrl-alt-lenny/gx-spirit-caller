; func_ov016_021b52c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov016_021b52c0
        .arm
func_ov016_021b52c0:
    cmp r1, #0xa
    subge r0, r1, #0x9
    addlt r0, r1, #0x5
    bx lr
