; func_ov002_021d16bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce870
        .extern func_ov002_021affbc
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021d16bc
        .arm
func_ov002_021d16bc:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r6, #0x1
    ldr r1, [r0, #0x810]
    moveq r6, #0x0
    ldrh r4, [r0, #0x2]
    cmp r1, #0x0
    ldrh r5, [r0, #0x4]
    bne .L_108
    bl func_ov002_021affbc
    mov r1, r6
    mov r2, r4
    mov r3, r5
    mov r0, #0x38
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, pc}
.L_108:
    mov r0, #0x38
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce870
