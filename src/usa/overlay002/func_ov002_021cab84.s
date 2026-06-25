; func_ov002_021cab84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce870
        .extern func_ov002_021ab784
        .extern func_ov002_021ae310
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021cab84
        .arm
func_ov002_021cab84:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, _LIT0
    ldrh r2, [r0, #0x6]
    ldr r1, [r0, #0x810]
    ldrh r4, [r0, #0x2]
    cmp r1, #0x0
    and r6, r2, #0xff
    mov r7, r2, asr #0x8
    ldrh r5, [r0, #0x4]
    bne .L_490
    mov r0, #0x0
    bl func_ov002_021ab784
    mov r0, #0x0
    bl func_ov002_021ae310
    and r1, r6, #0xff
    and r0, r7, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r1, r4
    mov r2, r5
    mov r3, r0, lsr #0x10
    mov r0, #0xc
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
.L_490:
    mov r0, #0xc
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce870
