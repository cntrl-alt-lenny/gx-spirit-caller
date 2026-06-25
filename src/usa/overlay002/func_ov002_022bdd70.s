; func_ov002_022bdd70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022bdd70
        .arm
func_ov002_022bdd70:
    ldrsh r2, [r0]
    ldrsh r0, [r1]
    sub r0, r2, r0
    bx lr
