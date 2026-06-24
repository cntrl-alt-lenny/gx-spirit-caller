; func_ov002_0226ac08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_0226aba4
        .global func_ov002_0226ac08
        .arm
func_ov002_0226ac08:
    stmdb sp!, {r3, lr}
    ldr lr, _LIT0
    ldr ip, _LIT1
    str r0, [lr, #0xd94]
    str r1, [lr, #0xd98]
    strh r2, [ip, #0xa0]
    strh r3, [ip, #0xa2]
    bl func_ov002_0226aba4
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022d0d8c
