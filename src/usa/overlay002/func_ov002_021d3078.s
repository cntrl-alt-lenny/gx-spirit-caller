; func_ov002_021d3078 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce870
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021afff0
        .extern func_ov002_021b2d24
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .extern func_ov002_0229cc60
        .global func_ov002_021d3078
        .arm
func_ov002_021d3078:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8c
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne sl, #0x1
    ldrh r3, [r0, #0x2]
    ldrh r2, [r0, #0x4]
    ldr r1, [r0, #0x810]
    moveq sl, #0x0
    ldrh r8, [r0, #0x6]
    cmp r1, #0x0
    orr r3, r3, r2, lsl #0x10
    beq .L_4c
    cmp r1, #0x1
    beq .L_290
    add sp, sp, #0x8c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4c:
    mov r7, #0x0
    mov r4, r7
    add r1, sp, #0x0
    add r0, sp, #0x14
.L_5c:
    mov r2, r8, asr r4
    tst r2, #0x1
    strne r4, [r1, r7, lsl #0x2]
    strne r4, [r0, r7, lsl #0x2]
    add r4, r4, #0x1
    addne r7, r7, #0x1
    cmp r4, #0x5
    blt .L_5c
    cmp r7, #0x1
    bgt .L_98
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    add sp, sp, #0x8c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_98:
    ldr r0, _LIT1
    sub r4, r7, #0x1
    str r3, [r0, #0xce4]
    cmp r4, #0x0
    ble .L_d4
    add r5, sp, #0x0
.L_b0:
    add r0, r4, #0x1
    bl func_ov002_021afff0
    ldr r2, [r5, r4, lsl #0x2]
    ldr r1, [r5, r0, lsl #0x2]
    str r1, [r5, r4, lsl #0x2]
    sub r4, r4, #0x1
    str r2, [r5, r0, lsl #0x2]
    cmp r4, #0x0
    bgt .L_b0
.L_d4:
    cmp r7, #0x0
    mov r9, #0x0
    ble .L_120
    add r0, sl, #0x2
    and r5, r0, #0xff
    and r6, sl, #0xff
    add r4, sp, #0x14
.L_f0:
    ldr r0, [r4, r9, lsl #0x2]
    and r1, r0, #0xff
    orr r0, r6, r1, lsl #0x8
    orr r1, r5, r1, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021b2d24
    add r9, r9, #0x1
    cmp r9, r7
    blt .L_f0
.L_120:
    cmp r7, #0x0
    mov r9, #0x0
    ble .L_170
    ldr r2, _LIT2
    ldr r0, _LIT3
    and r1, sl, #0x1
    mla r0, r1, r0, r2
    add r4, r0, #0x30
    add r6, sp, #0x14
    add r5, sp, #0x28
    mov fp, #0x14
.L_14c:
    ldr r0, [r6, r9, lsl #0x2]
    mov r2, #0x14
    mul r1, r0, fp
    add r0, r5, r1
    add r1, r4, r1
    bl func_ov002_0229cc60
    add r9, r9, #0x1
    cmp r9, r7
    blt .L_14c
.L_170:
    cmp r7, #0x0
    mov r9, #0x0
    ble .L_1c8
    ldr r2, _LIT2
    ldr r0, _LIT3
    and r1, sl, #0x1
    mla r0, r1, r0, r2
    add r6, r0, #0x30
    add r5, sp, #0x0
    add r4, sp, #0x28
    add fp, sp, #0x14
.L_19c:
    ldr r1, [r5, r9, lsl #0x2]
    mov r0, #0x14
    mla r0, r1, r0, r6
    ldr r2, [fp, r9, lsl #0x2]
    mov r1, #0x14
    mla r1, r2, r1, r4
    mov r2, #0x14
    bl func_ov002_0229cc60
    add r9, r9, #0x1
    cmp r9, r7
    blt .L_19c
.L_1c8:
    cmp r7, #0x0
    mov r9, #0x0
    ble .L_220
    add r0, sl, #0x2
    and r5, sl, #0xff
    and r6, r0, #0xff
    add r4, sp, #0x14
    add fp, sp, #0x0
.L_1e8:
    ldr r1, [r4, r9, lsl #0x2]
    ldr r0, [fp, r9, lsl #0x2]
    and r1, r1, #0xff
    and r0, r0, #0xff
    orr r2, r6, r1, lsl #0x8
    orr r1, r5, r0, lsl #0x8
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021b2d24
    add r9, r9, #0x1
    cmp r9, r7
    blt .L_1e8
.L_220:
    cmp r7, #0x0
    mov r0, #0x0
    ble .L_264
    ldr r3, _LIT2
    ldr r1, _LIT3
    and r2, sl, #0x1
    mla r5, r2, r1, r3
    add r3, sp, #0x0
    mov r1, #0x14
.L_244:
    ldr r2, [r3, r0, lsl #0x2]
    add r0, r0, #0x1
    mla r4, r2, r1, r5
    ldr r2, [r4, #0x40]
    cmp r0, r7
    bic r2, r2, #0x100
    str r2, [r4, #0x40]
    blt .L_244
.L_264:
    mov r1, sl
    mov r2, r8
    mov r0, #0x27
    mov r3, #0x0
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    add sp, sp, #0x8c
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_290:
    mov r0, #0x27
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    add sp, sp, #0x8c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
