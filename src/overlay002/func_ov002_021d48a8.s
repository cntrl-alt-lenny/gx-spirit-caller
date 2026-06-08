; func_ov002_021d48a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd968
        .extern data_ov002_022cdc68
        .extern data_ov002_022cdc6c
        .extern func_ov002_0229cd40
        .global func_ov002_021d48a8
        .arm
func_ov002_021d48a8:
    stmdb sp!, {r3, lr}
    ldr lr, _LIT0
    ldr ip, _LIT1
    strh r0, [lr, #0x4]
    strh r1, [lr, #0x6]
    strh r2, [lr, #0x8]
    strh r3, [lr, #0xa]
    ldr r1, [ip, #0x300]
    ldr r0, _LIT2
    orr r1, r1, #0x4
    str r1, [ip, #0x300]
    ldrh r1, [lr, #0xc]
    bic r1, r1, #0xff
    strh r1, [lr, #0xc]
    bl func_ov002_0229cd40
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cdc68
_LIT1: .word data_ov002_022cd968
_LIT2: .word data_ov002_022cdc6c
