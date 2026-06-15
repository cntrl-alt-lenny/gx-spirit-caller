; func_02000cc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02105904
        .extern func_02000cb4
        .global func_02000cc4
        .arm
func_02000cc4:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r5, _LIT0
    ldr r4, [r5, #0x80]
    add r0, r4, #0x1
    str r0, [r5, #0x80]
    add r6, r5, r4, lsl #0x4
    bl func_02000cb4
    ldr r1, _LIT1
    str r0, [r5, r4, lsl #0x4]
    ldr r0, [r1, #0x3c]
    ldr r2, [r1, #0x40]
    str r0, [r6, #0x4]
    ldr r0, [r1, #0x44]
    str r2, [r6, #0x8]
    str r0, [r6, #0xc]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02105904
_LIT1: .word data_021040ac
