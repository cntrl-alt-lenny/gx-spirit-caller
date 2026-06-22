; func_02032810 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02032810
        .arm
func_02032810:
    stmdb sp!, {r3, lr}
    ldr r2, [r1, #0xeac]
    orr r2, r2, #0x100
    str r2, [r1, #0xeac]
    ldr r1, [r1, #0xec0]
    cmp r1, #0x0
    ldmeqia sp!, {r3, pc}
    blx r1
    ldmia sp!, {r3, pc}
