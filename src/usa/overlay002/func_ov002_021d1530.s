; func_ov002_021d1530 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce870
        .extern func_ov002_021b0afc
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021d1530
        .arm
func_ov002_021d1530:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r1, #0x1
    ldr r3, [r0, #0x810]
    moveq r1, #0x0
    ldrh r2, [r0, #0x2]
    ldrh r4, [r0, #0x4]
    cmp r3, #0x0
    mov r0, #0x2e
    bne .L_5c
    mov r3, r4
    bl func_ov002_0229acd0
    mov r1, r4
    mov r0, #0x25
    bl func_ov002_021b0afc
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, pc}
.L_5c:
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce870
