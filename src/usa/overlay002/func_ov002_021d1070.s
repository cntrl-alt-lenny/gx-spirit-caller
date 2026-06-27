; func_ov002_021d1070 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce870
        .extern data_ov002_022d008c
        .extern func_ov002_021b28e0
        .extern func_ov002_021b29d4
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021d1070
        .arm
func_ov002_021d1070:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldrh r0, [r1]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r1, #0x1
    ldr r0, [r0, #0x810]
    moveq r1, #0x0
    cmp r0, #0x0
    mov r0, #0x4
    bne .L_210
    mov r2, r4
    mov r3, #0x0
    bl func_ov002_0229acd0
    ldr r0, _LIT1
    str r4, [r0, #0xcf8]
    bl func_ov002_021b28e0
    bl func_ov002_021b29d4
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, pc}
.L_210:
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x24
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word data_ov002_022d008c
