; func_ov008_021b0294 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b269c
        .extern data_ov008_021b2cc4
        .extern func_ov008_021abf8c
        .extern func_ov008_021aecd8
        .extern func_ov008_021aed30
        .extern func_ov008_021af030
        .extern func_ov008_021af214
        .global func_ov008_021b0294
        .arm
func_ov008_021b0294:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    add r1, sp, #0x0
    ldrh r3, [r2]
    str r3, [sp]
    ldrh r2, [r2, #0xa8]
    sub r2, r2, #0x3
    bl func_ov008_021abf8c
    ldr r0, _LIT0
    ldr r1, [sp]
    ldrh r2, [r0]
    cmp r1, r2
    ldmeqia sp!, {r3, r4, r5, pc}
    strh r1, [r0]
    ldrh r1, [r0]
    str r2, [sp]
    subs r0, r1, r2
    movpl r3, r0
    rsbmi r3, r0, #0x0
    cmp r3, #0x5
    blt .L_770
    bl func_ov008_021af214
    b .L_790
.L_770:
    cmp r1, r2
    ble .L_784
    mov r1, #0x1
    bl func_ov008_021af030
    b .L_790
.L_784:
    sub r0, r2, r1
    mov r1, #0x0
    bl func_ov008_021af030
.L_790:
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aed30
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aecd8
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aed30
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    add r0, r1, r0, ror #0x1b
    ldr r5, _LIT1
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    mov r1, #0x1
    tst r2, r1, lsl r0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streqh r1, [r0, #0x4]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov008_021b2cc4
_LIT1: .word data_ov008_021b269c
