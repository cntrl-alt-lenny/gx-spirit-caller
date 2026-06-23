; func_ov006_021b2b9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cf020
        .extern func_ov005_021acea8
        .global func_ov006_021b2b9c
        .arm
func_ov006_021b2b9c:
    stmdb sp!, {r3, lr}
    bl func_ov005_021acea8
    cmp r0, #0x0
    ldrne r1, _LIT0
    movne r2, #0xc
    strne r2, [r1]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov006_021cf020
