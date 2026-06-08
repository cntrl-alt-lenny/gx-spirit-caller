; func_ov002_0226acf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_0226ac94
        .global func_ov002_0226acf8
        .arm
func_ov002_0226acf8:
    stmdb sp!, {r3, lr}
    ldr lr, _LIT0
    ldr ip, _LIT1
    str r0, [lr, #0xd94]
    str r1, [lr, #0xd98]
    strh r2, [ip, #0xa0]
    strh r3, [ip, #0xa2]
    bl func_ov002_0226ac94
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022d0e6c
