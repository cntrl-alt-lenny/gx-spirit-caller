; func_ov002_022863c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_0202e1e0
        .extern func_ov002_021bc538
        .extern func_ov002_021bc920
        .extern func_ov002_021c37e4
        .extern func_ov002_0226ea58
        .extern func_ov002_0227b084
        .extern func_ov002_0227b8c8
        .extern func_ov002_0227c588
        .extern func_ov002_0227d570
        .extern func_ov002_0227d608
        .extern func_ov002_0227d7d4
        .extern func_ov002_0228090c
        .extern func_ov002_02286000
        .extern func_ov002_0228624c
        .extern func_ov002_0228c350
        .global func_ov002_022863c0
        .arm
func_ov002_022863c0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x60
    mov r9, r1
    mvn r2, #0x0
    mov r1, #0x1
    mov sl, r0
    str r2, [sp, #0x18]
    bl func_ov002_0227d570
    mvn r1, #0x0
    cmp r0, r1
    movne r0, #0x1
    strne r0, [sp, #0x8]
    moveq r0, #0x0
    streq r0, [sp, #0x8]
    add r1, sp, #0x2c
    add r2, sp, #0x30
    rsb r0, sl, #0x1
    mov r3, #0x0
    bl func_ov002_0228090c
    add r1, sp, #0x28
    add r2, sp, #0x24
    mov r0, sl
    mov r3, #0x0
    bl func_ov002_0228090c
    ldr r0, [sp, #0x28]
    ldr r1, [sp, #0x24]
    mov r2, #0x0
    str r0, [sp, #0x4]
    cmp r0, r1
    strle r1, [sp, #0x4]
    ldr r0, _LIT0
    and r1, sl, #0x1
    mul r0, r1, r0
    ldr r1, _LIT1
    str r0, [sp, #0xc]
    ldr r0, [r1, r0]
    str r2, [sp, #0x30]
    cmp r0, #0x0
    bls .L_364
    ldr r1, _LIT2
    ldr r0, [sp, #0xc]
    add fp, r1, r0
.L_a8:
    ldr r0, [sp, #0x30]
    add r0, fp, r0, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_34c
    mov r1, r5, lsl #0x10
    mov r0, sl
    mov r2, r1, lsr #0x10
    mov r1, #0x2
    bl func_ov002_0227c588
    cmp r0, #0x0
    bne .L_34c
    ldr r0, [sp, #0x30]
    add r1, fp, #0x120
    ldr r2, [r1, r0, lsl #0x2]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_0226ea58
    str r0, [sp, #0x14]
    cmp r0, #0x0
    beq .L_34c
    ldr r0, [sp, #0x30]
    add r1, fp, #0x120
    ldr r2, [r1, r0, lsl #0x2]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r2, #0x1
    bl func_ov002_0227d7d4
    mov r6, r0
    mov r0, #0x1
    cmp r6, #0x0
    str r0, [sp, #0x10]
    mov r8, #0x0
    ble .L_1d0
    add r4, sp, #0x1c
.L_164:
    mov r0, sl
    mov r1, r5
    mov r2, #0x0
    mov r3, r8
    str r4, [sp]
    bl func_ov002_0227d608
    movs r7, r0
    movmi r0, #0x0
    strmi r0, [sp, #0x10]
    bmi .L_1d0
    mov r3, r7, lsl #0x10
    mov r3, r3, lsr #0x10
    mov r3, r3, asr #0x8
    mov r0, sl
    mov r1, r5
    and r2, r7, #0xff
    and r3, r3, #0xff
    bl func_ov002_021bc920
    cmp r0, #0x0
    movne r0, r8, lsl #0x1
    addne r8, r8, #0x1
    strneh r7, [r4, r0]
    mov r0, r8, lsl #0x1
    add r8, r8, #0x1
    strh r7, [r4, r0]
    cmp r8, r6
    blt .L_164
.L_1d0:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_34c
    mov r2, #0x0
    mov r0, sl
    mov r1, r5
    mov r3, r2
    bl func_ov002_0227b8c8
    add r1, sp, #0x34
    mov r4, r0
    str r1, [sp]
    mov r0, sl
    mov r1, r5
    mov r2, r6
    add r3, sp, #0x1c
    bl func_ov002_02286000
    mvn r0, #0x0
    cmp r4, r0
    bne .L_250
    ldr r1, [sp, #0x48]
    ldr r2, [sp, #0x4c]
    mov r0, sl
    bl func_ov002_0227b084
    mov r4, r0
    mvn r0, #0x0
    cmp r4, r0
    bne .L_250
    ldr r1, [sp, #0x48]
    ldr r0, [sp, #0x4c]
    cmp r1, r0
    movle r4, #0x1
    movgt r4, #0x0
.L_250:
    cmp r4, #0x0
    moveq r4, #0x1
    ldr r0, [sp, #0x14]
    movne r4, #0x0
    cmp r0, #0x10
    cmpeq r4, #0x0
    beq .L_34c
    ldr r0, [sp, #0x14]
    cmp r0, #0x40
    bne .L_280
    cmp r4, #0x0
    bne .L_34c
.L_280:
    ldr r0, [sp, #0x4c]
    ldr r7, [sp, #0x48]
    cmp r7, r0
    movle r7, r0
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    cmpne r6, #0x0
    beq .L_2b8
    ldr r0, [sp, #0x30]
    cmp r4, #0x0
    str r0, [sp, #0x18]
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r9]
.L_2b8:
    ldr r0, [sp, #0x2c]
    cmp r7, r0
    ble .L_2dc
    ldr r0, [sp, #0x30]
    cmp r4, #0x0
    str r0, [sp, #0x18]
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r9]
.L_2dc:
    mov r0, sl
    mov r1, r5
    bl func_ov002_0228624c
    cmp r0, #0x0
    beq .L_308
    ldr r0, [sp, #0x30]
    cmp r4, #0x0
    str r0, [sp, #0x18]
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r9]
.L_308:
    ldr r0, [sp, #0x4]
    cmp r7, r0
    ble .L_32c
    ldr r0, [sp, #0x30]
    cmp r4, #0x0
    str r0, [sp, #0x18]
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r9]
.L_32c:
    cmp r6, #0x0
    bne .L_34c
    ldr r0, [sp, #0x30]
    cmp r4, #0x0
    str r0, [sp, #0x18]
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r9]
.L_34c:
    ldr r1, [sp, #0x30]
    ldr r0, [fp, #0xc]
    add r1, r1, #0x1
    str r1, [sp, #0x30]
    cmp r1, r0
    bcc .L_a8
.L_364:
    ldr r0, [sp, #0x18]
    mvn r1, #0x0
    cmp r0, r1
    addgt sp, sp, #0x60
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, sl
    bl func_ov002_021bc538
    cmp r0, #0x0
    beq .L_490
    mov r0, sl
    bl func_ov002_0228c350
    cmp r0, #0x0
    movne r7, #0x1
    mov r2, #0x0
    ldr r1, _LIT1
    ldr r0, [sp, #0xc]
    moveq r7, #0x2
    ldr r0, [r1, r0]
    str r2, [sp, #0x30]
    cmp r0, #0x0
    bls .L_490
    ldr r1, _LIT2
    ldr r0, [sp, #0xc]
    add r6, r1, r0
    add r4, r6, #0x120
.L_3c8:
    add r0, r6, r2, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_478
    ldr r1, [sp, #0x30]
    mov r0, sl
    ldr r2, [r4, r1, lsl #0x2]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021c37e4
    cmp r0, #0x4
    bgt .L_478
    mov r2, r5, lsl #0x10
    mov r0, sl
    mov r1, r7
    mov r2, r2, lsr #0x10
    bl func_ov002_0227c588
    cmp r0, #0x0
    bne .L_478
    ldr r1, [sp, #0x30]
    mov r0, sl
    ldr r2, [r4, r1, lsl #0x2]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_0226ea58
    cmp r0, #0x0
    beq .L_478
    tst r0, #0x40
    movne r0, #0x1
    moveq r0, #0x0
    str r0, [r9]
    ldr r0, [sp, #0x30]
    add sp, sp, #0x60
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_478:
    ldr r1, [sp, #0x30]
    ldr r0, [r6, #0xc]
    add r2, r1, #0x1
    str r2, [sp, #0x30]
    cmp r2, r0
    bcc .L_3c8
.L_490:
    mvn r0, #0x0
    add sp, sp, #0x60
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
