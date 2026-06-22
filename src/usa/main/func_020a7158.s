; func_020a7158 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102878
        .global func_020a7158
        .arm
func_020a7158:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    ldr r2, [r2, #0x8]
    ldr r2, [r2, #0x4]
    blx r2
    ldmia sp!, {r3, pc}
_LIT0: .word data_02102878
