; func_020a70f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102878
        .global func_020a70f0
        .arm
func_020a70f0:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    ldr r3, [r3, #0x8]
    ldr r3, [r3]
    blx r3
    ldmia sp!, {r3, pc}
_LIT0: .word data_02102878
