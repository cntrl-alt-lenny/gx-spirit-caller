; func_ov002_0229d148 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bfe8c
        .extern data_020c1e8c
        .extern data_ov002_022d0eb8
        .extern data_ov002_022d0f2c
        .extern func_0207eea8
        .extern func_0208b014
        .global func_ov002_0229d148
        .arm
func_ov002_0229d148:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    ldr r2, _LIT0
    add r0, sp, #0x0
    ldrsh r1, [r2]
    ldrsh r2, [r2, #0x2]
    bl func_0208b014
    ldr r0, _LIT1
    add r1, sp, #0x0
    bl func_0207eea8
    ldr r2, _LIT2
    ldr r3, _LIT3
    ldrsh r1, [r2]
    str r0, [r3]
    ldrsh r2, [r2, #0x2]
    add r0, sp, #0x0
    bl func_0208b014
    ldr r0, _LIT1
    add r1, sp, #0x0
    bl func_0207eea8
    ldr r1, _LIT3
    str r0, [r1, #0x4]
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
_LIT0: .word data_020bfe8c
_LIT1: .word data_ov002_022d0eb8
_LIT2: .word data_020c1e8c
_LIT3: .word data_ov002_022d0f2c
