; func_ov002_021f7ef0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ff310
        .global func_ov002_021f7ef0
        .arm
func_ov002_021f7ef0:
    stmdb sp!, {r3, lr}
    bl func_ov002_021ff310
    cmp r0, #0x0
    movne r0, #0x1
    mvneq r0, #0x0
    ldmia sp!, {r3, pc}
