; func_020139a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201396c
        .extern func_020190f0
        .global func_020139a0
        .arm
func_020139a0:
    stmdb sp!, {r3, lr}
    bl func_020190f0
    bl func_0201396c
    ldmia sp!, {r3, pc}
