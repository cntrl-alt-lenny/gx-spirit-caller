; func_ov002_02283c70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd44c
        .extern data_ov002_022cd450
        .extern data_ov002_022cd548
        .extern data_ov002_022cd54c
        .extern data_ov002_022cd550
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern func_ov002_021aa558
        .extern func_ov002_021aba60
        .extern func_ov002_021b30ac
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b9eb8
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb068
        .extern func_ov002_021bc22c
        .extern func_ov002_02283908
        .extern func_ov002_02283bc8
        .global func_ov002_02283c70
        .arm
func_ov002_02283c70:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x140
    mov r8, r2
    mov sl, r0
    cmp r8, #0x5
    movge r0, #0x1
    ldr r7, [sp, #0x168]
    movlt r0, #0x0
    str r0, [r7]
    mov r9, r1
    str r9, [r7, #0x8]
    str r8, [r7, #0xc]
    mov r0, #0x0
    str r0, [r7, #0x18]
    str r0, [r7, #0x1c]
    str r0, [r7, #0x10]
    str r0, [r7, #0x14]
    ldr r0, [r7]
    str r3, [sp]
    cmp r0, #0x0
    bne .L_d4
    ldr r1, _LIT0
    and r2, sl, #0x1
    mov r0, #0x14
    mul r3, r2, r1
    ldr r2, _LIT1
    ldr r1, _LIT2
    mul r0, r9, r0
    add r2, r2, r3
    ldr r4, [r0, r2]
    add r3, r1, r3
    mov r2, r4, lsr #0x6
    mov r1, r4, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r4, lsr #0x1
    and r1, r1, #0x1
    ldrh r3, [r0, r3]
    mvn r2, r2
    mvn r0, r1
    and r1, r3, r2
    tst r1, r0
    beq .L_d4
    mov r0, sl
    mov r1, r9
    mov r2, r8
    bl func_ov002_02283908
    cmp r0, #0x0
    beq .L_d4
    mov r0, #0x1
    str r0, [r7, #0x4]
    add sp, sp, #0x140
    str r0, [r7, #0x14]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d4:
    ldr r6, _LIT3
    add r5, sp, #0x10
    mov r4, #0x13
.L_e0:
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_e0
    ldr r1, [r7]
    ldr r2, _LIT3
    mov r0, #0x0
    str r1, [r2, #0x8]
    str sl, [r2]
    str r9, [r2, #0x1c]
    rsb r6, sl, #0x1
    str r6, [r2, #0x4]
    mov r1, #0x1
    str r0, [sp, #0x4]
    str r8, [r2, #0x20]
    bl func_ov002_021aa558
    ldr r1, _LIT4
    mov r0, r6
    rsb r2, r1, #0x1380
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_15c
    ldr r2, _LIT3
    mov r1, #0x38
    mla r2, sl, r1, r2
.L_144:
    ldr r1, [r2, #0x48]
    subs r0, r0, #0x1
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    str r1, [r2, #0x48]
    bne .L_144
.L_15c:
    mov r0, #0x0
    mov r1, #0x1
    bl func_ov002_021aba60
    ldr r1, _LIT3
    mov r0, #0x0
.L_170:
    ldr r2, [r1, #0xa8]
    cmp sl, r2
    bne .L_190
    ldr r3, [r7, #0x18]
    ldr r2, [r1, #0x9c]
    add r2, r3, r2
    str r2, [r7, #0x18]
    b .L_1a0
.L_190:
    ldr r3, [r7, #0x1c]
    ldr r2, [r1, #0x9c]
    add r2, r3, r2
    str r2, [r7, #0x1c]
.L_1a0:
    add r0, r0, #0x1
    cmp r0, #0x2
    add r1, r1, #0x14
    blt .L_170
    ldr r0, [r7]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r7, #0x4]
    bne .L_63c
    ldr r0, _LIT0
    and r2, sl, #0x1
    mov r1, #0x14
    mul r5, r2, r0
    ldr r0, _LIT1
    mul r1, r9, r1
    add r0, r0, r5
    ldr r0, [r1, r0]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_2c0
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b9ecc
    ldr r2, _LIT5
    cmp r0, r2
    bgt .L_230
    bge .L_268
    ldr r1, _LIT6
    cmp r0, r1
    bgt .L_220
    beq .L_258
    b .L_2c0
.L_220:
    sub r1, r2, #0x28c
    cmp r0, r1
    beq .L_27c
    b .L_2c0
.L_230:
    add r1, r2, #0x68
    cmp r0, r1
    bgt .L_248
    moveq r0, #0x1
    streq r0, [sp, #0x4]
    b .L_2c0
.L_248:
    add r1, r2, #0xd5
    cmp r0, r1
    beq .L_268
    b .L_2c0
.L_258:
    mov r0, #0x1
    str r0, [r7, #0x14]
    str r0, [r7, #0x10]
    b .L_2c0
.L_268:
    ldr r0, [r7, #0x10]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r7, #0x14]
    b .L_2c0
.L_27c:
    ldr r0, _LIT0
    mov r1, #0x14
    ldr r2, _LIT7
    and r3, r6, #0x1
    mul r1, r8, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    bne .L_2c0
    mov r0, sl
    mov r1, #0x0
    bl func_ov002_021bc22c
    cmp r0, #0x1
    ble .L_2c0
    ldr r0, [r7, #0x1c]
    add r0, r0, #0x1f4
    str r0, [r7, #0x1c]
.L_2c0:
    ldr r1, _LIT0
    and r2, r6, #0x1
    mul fp, r2, r1
    mov r0, #0x14
    mul r4, r8, r0
    ldr r2, _LIT1
    ldr r1, _LIT2
    add r0, r2, fp
    ldr r2, [r4, r0]
    add r0, r1, fp
    str r0, [sp, #0x8]
    mov r0, r2, lsr #0x2
    mov r1, r2, lsr #0x6
    orr r0, r0, r2, lsr #0x1
    and r2, r1, #0x1
    and r1, r0, #0x1
    ldr r0, [sp, #0x8]
    mvn r2, r2
    ldrh r3, [r0, r4]
    mvn r0, r1
    and r1, r3, r2
    tst r1, r0
    beq .L_3d0
    mov r0, r6
    mov r1, r8
    bl func_ov002_021b9ecc
    ldr r1, _LIT8
    cmp r0, r1
    bgt .L_348
    bge .L_390
    sub r1, r1, #0x1f4
    cmp r0, r1
    beq .L_36c
    b .L_3d0
.L_348:
    ldr r1, _LIT5
    cmp r0, r1
    bgt .L_35c
    beq .L_36c
    b .L_3d0
.L_35c:
    add r1, r1, #0xd5
    cmp r0, r1
    beq .L_37c
    b .L_3d0
.L_36c:
    mov r0, #0x1
    str r0, [r7, #0x14]
    str r0, [r7, #0x10]
    b .L_3d0
.L_37c:
    ldr r0, [r7, #0x14]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r7, #0x10]
    b .L_3d0
.L_390:
    ldr r0, _LIT7
    add r0, r0, fp
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    bne .L_3d0
    ldr r2, _LIT9
    mov r0, #0xdc
    mov r1, #0x2c
    mul r1, r9, r1
    mla r0, sl, r0, r2
    ldr r2, [r7, #0x18]
    ldr r1, [r1, r0]
    mov r0, #0x1
    add r1, r2, r1
    str r1, [r7, #0x18]
    str r0, [r7, #0x14]
.L_3d0:
    ldr r2, _LIT10
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x4]
    ldr r2, _LIT11
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x4]
    mov r0, #0x38
    mul ip, sl, r0
    ldr r3, _LIT12
    ldr r1, _LIT13
    ldr r2, [r3, ip]
    ldr ip, [r1, ip]
    mul r0, r6, r0
    ldr fp, [r7, #0x10]
    orr r2, r2, ip
    orr r2, fp, r2
    str r2, [r7, #0x10]
    ldr r2, [r3, r0]
    ldr r0, [r1, r0]
    ldr r1, [r7, #0x14]
    orr r0, r2, r0
    orr r0, r1, r0
    str r0, [r7, #0x14]
    ldr r0, [r7, #0x1c]
    cmp r0, #0x0
    ldrle r1, [r7, #0x14]
    ldrle r0, [r7, #0x10]
    cmple r1, r0
    movgt r0, #0x1
    movle r0, #0x0
    str r0, [r7, #0x4]
    ldr r0, [r7, #0x14]
    cmp r0, #0x0
    ldrne r0, [r7, #0x10]
    cmpne r0, #0x0
    beq .L_524
    mov r1, #0xdc
    mov r0, #0x2c
    mul ip, sl, r1
    ldr r2, _LIT9
    ldr r3, _LIT14
    add r2, r2, ip
    mul fp, r9, r0
    add r3, r3, ip
    str r2, [sp, #0xc]
    ldr r2, [r2, fp]
    ldr r3, [fp, r3]
    cmp r2, r3
    ble .L_524
    ldr r3, _LIT15
    add r2, r3, ip
    ldr r2, [fp, r2]
    cmp r2, #0x4
    ble .L_4dc
    mla r1, r6, r1, r3
    mul r0, r8, r0
    ldr r0, [r0, r1]
    cmp r2, r0
    bgt .L_524
.L_4dc:
    mov r0, sl
    mov r1, r9
    mov r2, #0x1
    bl func_ov002_02283bc8
    ldr r1, [sp, #0xc]
    ldr r1, [r1, fp]
    mov fp, r0
    cmp fp, r1
    bgt .L_524
    cmp fp, #0x640
    blt .L_524
    mov r0, r6
    mov r1, r8
    mov r2, #0x1
    bl func_ov002_02283bc8
    cmp fp, r0
    movgt r0, #0x1
    strgt r0, [r7, #0x4]
.L_524:
    ldr r0, [r7, #0x10]
    cmp r0, #0x0
    ldreq r0, [r7, #0x14]
    cmpeq r0, #0x0
    bne .L_60c
    ldr r0, _LIT16
    bl func_ov002_021bb068
    cmp r0, #0x0
    bne .L_60c
    ldr r2, _LIT17
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b30ac
    cmp r0, #0x0
    beq .L_578
    mov r0, r6
    mov r1, r8
    bl func_ov002_021b9eb8
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r7, #0x4]
.L_578:
    mov r0, r6
    mov r1, r8
    bl func_ov002_021b9ecc
    ldr r1, _LIT18
    cmp r0, r1
    beq .L_5a0
    ldr r1, _LIT19
    cmp r0, r1
    beq .L_5dc
    b .L_60c
.L_5a0:
    mov r0, sl
    mov r1, r9
    mov r2, #0x1
    bl func_ov002_02283bc8
    cmp r0, #0x3e8
    blt .L_60c
    ldr r0, _LIT20
    ldr r0, [r0, r5]
    cmp r0, #0x3e8
    ble .L_60c
    ldr r0, [r7, #0x18]
    cmp r0, #0x3e8
    movle r0, #0x1
    strle r0, [r7, #0x4]
    b .L_60c
.L_5dc:
    ldr r0, [sp, #0x8]
    ldrh r0, [r0, r4]
    cmp r0, #0x0
    bne .L_60c
    ldr r0, _LIT20
    ldr r0, [r0, r5]
    cmp r0, #0x3e8
    ble .L_60c
    ldr r0, [r7, #0x18]
    cmp r0, #0x3e8
    movle r0, #0x1
    strle r0, [r7, #0x4]
.L_60c:
    ldr r1, _LIT20
    ldr r0, [r7, #0x18]
    ldr r1, [r1, r5]
    cmp r1, r0
    movle r0, #0x0
    strle r0, [r7, #0x4]
    ldr r0, [sp]
    cmp r0, #0x0
    ldrne r0, [sp, #0x4]
    cmpne r0, #0x0
    movne r0, #0x1
    strne r0, [r7, #0x4]
.L_63c:
    ldr r5, _LIT3
    add r6, sp, #0x10
    mov r4, #0x13
.L_648:
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_648
    add sp, sp, #0x140
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1ac
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cd3f4
_LIT4: .word 0x00001381
_LIT5: .word 0x00001657
_LIT6: .word 0x000010a6
_LIT7: .word data_ov002_022cf1a2
_LIT8: .word 0x0000129a
_LIT9: .word data_ov002_022cd54c
_LIT10: .word 0x00001669
_LIT11: .word 0x000014a6
_LIT12: .word data_ov002_022cd44c
_LIT13: .word data_ov002_022cd450
_LIT14: .word data_ov002_022cd550
_LIT15: .word data_ov002_022cd548
_LIT16: .word 0x0000166c
_LIT17: .word 0x0000143a
_LIT18: .word 0x0000129c
_LIT19: .word 0x0000152e
_LIT20: .word data_ov002_022cf16c
