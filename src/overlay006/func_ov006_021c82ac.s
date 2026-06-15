; func_ov006_021c82ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov006_021ce4a4
        .extern data_ov006_021ce650
        .extern data_ov006_021ce8a8
        .extern data_ov006_021ceb00
        .extern data_ov006_021ceb04
        .extern data_ov006_021ceb10
        .extern data_ov006_021ceb2c
        .extern data_ov006_021ceb4c
        .extern data_ov006_021cebb4
        .extern data_ov006_0224f448
        .extern data_ov006_0225e138
        .extern func_02001cd0
        .extern func_02001d0c
        .extern func_02001e94
        .extern func_02005240
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0208de4c
        .extern func_0208e0a0
        .extern func_02094504
        .extern func_020b3870
        .extern func_ov006_021b6f18
        .extern func_ov006_021b9c98
        .extern func_ov006_021c8068
        .extern func_ov006_021cb0d8
        .extern func_ov006_021cb14c
        .extern func_ov006_021cb158
        .global func_ov006_021c82ac
        .arm
func_ov006_021c82ac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x68
    ldr r1, _LIT0
    mov r4, r0
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0x410
    strh r0, [r1]
    bl func_0208e0a0
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x640
    bl func_02094504
    add r0, r4, #0x4
    mov r1, #0x20
    mov r2, #0x19
    bl func_02001d0c
    bl func_0208e0a0
    mov r1, r0
    ldr r2, [r4, #0x44]
    ldr r3, [r4, #0x48]
    add r0, r4, #0x4
    bl func_02001e94
    ldr r5, _LIT1
    bl func_0208de4c
    ldr r1, [r4, #0x44]
    mov r2, #0x6400
    add r6, r0, r1, lsl #0x5
    mov r0, #0x0
    mov r1, r6
    bl func_02094504
    ldr r0, _LIT2
    ldr r2, [r4, #0x74]
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    ldreq r1, _LIT3
    mov r0, #0x14
    ldrne r1, _LIT4
    mla r7, r2, r0, r1
    sub r0, r2, #0x15
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_82c
    b .L_e0
    b .L_6e0
    b .L_3cc
    b .L_5b8
    b .L_6e0
    b .L_6e0
    b .L_6e0
    b .L_6e0
    b .L_6e0
.L_e0:
    ldr r1, [r4, #0x7c]
    mov r0, #0x0
    str r0, [sp, #0x2c]
    cmp r1, #0x0
    ble .L_3b8
    str r0, [sp, #0x1c]
.L_f8:
    ldr r1, [r4, #0x78]
    mov r7, #0x0
    cmp r1, #0x0
    ble .L_394
    mvn r0, #0x0
    str r7, [sp, #0x18]
    str r0, [sp, #0x30]
    add r5, sp, #0x3c
.L_118:
    ldr r0, [sp, #0x2c]
    mla r9, r1, r0, r7
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    mov r0, #0x0
    bne .L_190
    strb r0, [sp, #0x3e]
    ldr r0, _LIT5
    mov r1, r9, lsl #0x1
    ldrsb r2, [r0, r1]
    add r0, r0, r9, lsl #0x1
    ldrsb r1, [r0, #0x1]
    and r0, r2, #0xff
    strb r2, [sp, #0x3c]
    strb r1, [sp, #0x3d]
    and r1, r1, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    ldr r0, _LIT6
    bl func_ov006_021b9c98
    mov r8, r0
    ldr r2, [r4, #0x90]
    ldr r0, [r4, #0x98]
    ldr r1, [r4, #0x94]
    add r0, r2, r0
    rsb fp, r0, #0x3
    b .L_1c0
.L_190:
    strb r0, [sp, #0x3d]
    ldr r0, _LIT7
    ldrsb r1, [r0, r9]
    ldr r0, _LIT6
    strb r1, [sp, #0x3c]
    bl func_ov006_021b9c98
    mov r8, r0
    ldr r2, [r4, #0x90]
    ldr r0, [r4, #0x98]
    ldr r1, [r4, #0x94]
    add r0, r2, r0
    rsb fp, r0, #0x6
.L_1c0:
    ldr r0, [r4, #0x9c]
    cmp r8, #0x0
    add r0, r1, r0
    mov r1, #0x0
    rsb sl, r0, #0x4
    ldr r0, [sp, #0x30]
    str r1, [sp, #0x8]
    blt .L_208
    ldr r0, _LIT6
    ldr r1, [r4, #0x4c]
    ldr r3, [r4, #0x50]
    mov r2, r8
    bl func_ov006_021b6f18
    cmp r0, #0x0
    movge r1, #0x1
    strge r1, [sp, #0x8]
    movlt r1, #0x0
    strlt r1, [sp, #0x8]
.L_208:
    add r1, r4, r9, lsl #0x1
    strh r0, [r1, #0xac]
    mov r1, #0x1
    add r0, r4, #0x4
    mov r2, r1
    bl func_02001cd0
    ldr r0, [sp, #0x1c]
    mov r1, r5
    add r9, sl, r0
    ldr r0, [sp, #0x18]
    sub r8, r9, #0x1
    add sl, fp, r0
    sub fp, sl, #0x1
    str r8, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    add r0, r4, #0x4
    mov r2, r6
    mov r3, fp
    bl func_02005240
    str r8, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    add r0, r4, #0x4
    mov r1, r5
    mov r2, r6
    mov r3, sl
    bl func_02005240
    str r8, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    add r0, r4, #0x4
    mov r1, r5
    mov r2, r6
    add r3, sl, #0x1
    bl func_02005240
    str r9, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    add r0, r4, #0x4
    mov r1, r5
    mov r2, r6
    mov r3, fp
    bl func_02005240
    str r9, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    add r0, r4, #0x4
    mov r1, r5
    mov r2, r6
    add r3, sl, #0x1
    bl func_02005240
    add r8, r9, #0x1
    str r8, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    mov r3, fp
    add r0, r4, #0x4
    mov r1, r5
    mov r2, r6
    bl func_02005240
    str r8, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    add r0, r4, #0x4
    mov r1, r5
    mov r2, r6
    mov r3, sl
    bl func_02005240
    str r8, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    add r0, r4, #0x4
    mov r1, r5
    mov r2, r6
    add r3, sl, #0x1
    bl func_02005240
    ldr r0, [sp, #0x8]
    mov r2, #0x1
    cmp r0, #0x0
    movne r1, #0xf
    moveq r1, #0x3
    add r0, r4, #0x4
    bl func_02001cd0
    str r9, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    mov r3, sl
    add r0, r4, #0x4
    mov r1, r5
    mov r2, r6
    bl func_02005240
    ldr r0, [sp, #0x18]
    ldr r1, [r4, #0x78]
    add r0, r0, #0x14
    add r7, r7, #0x1
    str r0, [sp, #0x18]
    cmp r7, r1
    blt .L_118
.L_394:
    ldr r0, [sp, #0x2c]
    ldr r1, [r4, #0x7c]
    add r0, r0, #0x1
    str r0, [sp, #0x2c]
    cmp r0, r1
    ldr r0, [sp, #0x1c]
    add r0, r0, #0x14
    str r0, [sp, #0x1c]
    blt .L_f8
.L_3b8:
    add r0, r4, #0x4
    mov r1, #0xf
    mov r2, #0x1
    bl func_02001cd0
    b .L_82c
.L_3cc:
    mov r0, r5
    mov r2, r6
    add r1, r4, #0x4
    bl func_ov006_021cb0d8
    ldr r1, [r4, #0x7c]
    mov r0, #0x0
    str r0, [sp, #0x10]
    cmp r1, #0x0
    ble .L_5a8
    str r0, [sp, #0x24]
.L_3f4:
    ldr r2, [r4, #0x78]
    mov r0, #0x0
    str r0, [sp, #0xc]
    cmp r2, #0x0
    ble .L_584
    str r0, [sp, #0x20]
    mvn r0, #0x0
    str r0, [sp, #0x34]
    mov fp, #0xa
.L_418:
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0xc]
    mla r6, r2, r1, r0
    ldr r0, _LIT8
    ldr r1, [r4, #0x90]
    ldrsb r9, [r0, r6]
    ldr r0, [r4, #0x98]
    ldr r2, [r4, #0x94]
    add r0, r1, r0
    ldr r1, [r4, #0x9c]
    rsb r7, r0, #0x1
    add r1, r2, r1
    cmp r9, #0x0
    ldr r0, [sp, #0x34]
    rsb r8, r1, #0x6
    mov r2, #0x0
    blt .L_47c
    ldr r0, _LIT6
    ldr r1, [r4, #0x4c]
    ldr r3, [r4, #0x50]
    mov r2, r9
    bl func_ov006_021b6f18
    cmp r0, #0x0
    movge r2, #0x1
    movlt r2, #0x0
.L_47c:
    cmp r9, #0x0
    add r1, r4, r6, lsl #0x1
    strh r0, [r1, #0xac]
    blt .L_560
    cmp r2, #0x0
    movne r1, #0xf
    moveq r1, #0x3
    mov r0, r5
    bl func_ov006_021cb14c
    ldr r0, _LIT9
    mov r1, r6, lsl #0x1
    ldrsh r6, [r0, r1]
    cmp r6, #0x0
    bge .L_4e0
    ldr r0, [sp, #0x24]
    mov r1, #0x2
    add r0, r8, r0
    str r0, [sp]
    ldr r0, [sp, #0x20]
    mov r2, #0xd
    add r0, r7, r0
    add r3, r0, #0xc
    mov r0, r5
    bl func_ov006_021cb158
    b .L_560
.L_4e0:
    ldr r0, [sp, #0x20]
    add r9, r7, r0
    ldr r0, [sp, #0x24]
    mov r7, #0x3e8
    add sl, r8, r0
    mov r8, #0x0
.L_4f8:
    cmp r6, r7
    bge .L_50c
    cmp r6, #0x0
    cmpeq r7, #0x1
    bne .L_53c
.L_50c:
    mul r1, r7, fp
    mov r0, r6
    bl func_020b3870
    mov r0, r1
    mov r1, r7
    bl func_020b3870
    mov r2, r0
    mov r0, r5
    mov r1, #0x2
    mov r3, r9
    str sl, [sp]
    bl func_ov006_021cb158
.L_53c:
    ldr r0, _LIT10
    mov r2, r7
    smull r1, r7, r0, r2
    mov r0, r2, lsr #0x1f
    add r8, r8, #0x1
    add r7, r0, r7, asr #0x2
    add r9, r9, #0x4
    cmp r8, #0x4
    blt .L_4f8
.L_560:
    ldr r0, [sp, #0x20]
    ldr r2, [r4, #0x78]
    add r0, r0, #0x14
    str r0, [sp, #0x20]
    ldr r0, [sp, #0xc]
    add r0, r0, #0x1
    str r0, [sp, #0xc]
    cmp r0, r2
    blt .L_418
.L_584:
    ldr r0, [sp, #0x10]
    ldr r1, [r4, #0x7c]
    add r0, r0, #0x1
    str r0, [sp, #0x10]
    cmp r0, r1
    ldr r0, [sp, #0x24]
    add r0, r0, #0x14
    str r0, [sp, #0x24]
    blt .L_3f4
.L_5a8:
    mov r0, r5
    mov r1, #0xf
    bl func_ov006_021cb14c
    b .L_82c
.L_5b8:
    mov r0, r5
    mov r2, r6
    add r1, r4, #0x4
    bl func_ov006_021cb0d8
    ldr r1, [r4, #0x7c]
    mov r0, #0x0
    str r0, [sp, #0x14]
    cmp r1, #0x0
    ble .L_6d0
    str r0, [sp, #0x28]
.L_5e0:
    ldr r1, [r4, #0x78]
    mov r7, #0x0
    cmp r1, #0x0
    ble .L_6ac
    mvn r0, #0x0
    mov r6, r7
    str r0, [sp, #0x38]
.L_5fc:
    ldr r0, [sp, #0x14]
    ldr r2, [r4, #0x94]
    mla fp, r1, r0, r7
    ldr r0, _LIT11
    ldr r1, [r4, #0x90]
    ldrsb r8, [r0, fp]
    ldr r0, [r4, #0x98]
    add r0, r1, r0
    ldr r1, [r4, #0x9c]
    rsb r9, r0, #0xa
    add r1, r2, r1
    rsb sl, r1, #0x9
    cmp r8, #0x0
    ldr r0, [sp, #0x38]
    mov r1, #0x0
    blt .L_65c
    ldr r0, _LIT6
    ldr r1, [r4, #0x4c]
    ldr r3, [r4, #0x50]
    mov r2, r8
    bl func_ov006_021b6f18
    cmp r0, #0x0
    movge r1, #0x1
    movlt r1, #0x0
.L_65c:
    cmp r1, #0x0
    add r1, r4, fp, lsl #0x1
    strh r0, [r1, #0xac]
    movne r1, #0xf
    moveq r1, #0x3
    mov r0, r5
    bl func_ov006_021cb14c
    ldr r0, [sp, #0x28]
    mov r2, r8
    add r0, sl, r0
    str r0, [sp]
    add r3, r9, r6
    mov r0, r5
    mov r1, #0x0
    bl func_ov006_021cb158
    ldr r1, [r4, #0x78]
    add r7, r7, #0x1
    add r6, r6, #0x14
    cmp r7, r1
    blt .L_5fc
.L_6ac:
    ldr r0, [sp, #0x14]
    ldr r1, [r4, #0x7c]
    add r0, r0, #0x1
    str r0, [sp, #0x14]
    cmp r0, r1
    ldr r0, [sp, #0x28]
    add r0, r0, #0x14
    str r0, [sp, #0x28]
    blt .L_5e0
.L_6d0:
    mov r0, r5
    mov r1, #0xf
    bl func_ov006_021cb14c
    b .L_82c
.L_6e0:
    ldr r0, [r4, #0x7c]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_82c
.L_6f0:
    ldr r0, [r4, #0x78]
    mov r6, #0x0
    cmp r0, #0x0
    ble .L_81c
    ldr fp, _LIT12
    mvn sl, #0x0
.L_708:
    mla r9, r0, r5, r6
    ldr r0, [r4, #0x74]
    sub r0, r0, #0x16
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_7e4
    b .L_740
    b .L_7e4
    b .L_7e4
    b .L_760
    b .L_780
    b .L_7a0
    b .L_7c0
    b .L_7e0
.L_740:
    ldr r3, [r7, #0xc]
    mov r2, r9, lsl #0x1
    ldrsh r2, [r3, r2]
    mov r0, r4
    mov r1, #0x3
    bl func_ov006_021c8068
    mov r8, r0
    b .L_7e4
.L_760:
    ldr r3, [r7, #0xc]
    mov r2, r9, lsl #0x1
    ldrsh r2, [r3, r2]
    mov r0, r4
    mov r1, #0x5
    bl func_ov006_021c8068
    mov r8, r0
    b .L_7e4
.L_780:
    ldr r3, [r7, #0xc]
    mov r2, r9, lsl #0x1
    ldrsh r2, [r3, r2]
    mov r0, r4
    mov r1, #0x6
    bl func_ov006_021c8068
    mov r8, r0
    b .L_7e4
.L_7a0:
    ldr r3, [r7, #0xc]
    mov r2, r9, lsl #0x1
    ldrsh r2, [r3, r2]
    mov r0, r4
    mov r1, #0x7
    bl func_ov006_021c8068
    mov r8, r0
    b .L_7e4
.L_7c0:
    ldr r3, [r7, #0xc]
    mov r2, r9, lsl #0x1
    ldrsh r2, [r3, r2]
    mov r0, r4
    mov r1, #0x9
    bl func_ov006_021c8068
    mov r8, r0
    b .L_7e4
.L_7e0:
    ldrsb r8, [fp, r9]
.L_7e4:
    cmp r8, #0x0
    mov r0, sl
    blt .L_804
    ldr r0, _LIT6
    ldr r1, [r4, #0x4c]
    ldr r3, [r4, #0x50]
    mov r2, r8
    bl func_ov006_021b6f18
.L_804:
    add r1, r4, r9, lsl #0x1
    strh r0, [r1, #0xac]
    ldr r0, [r4, #0x78]
    add r6, r6, #0x1
    cmp r6, r0
    blt .L_708
.L_81c:
    ldr r0, [r4, #0x7c]
    add r5, r5, #0x1
    cmp r5, r0
    blt .L_6f0
.L_82c:
    ldr r0, _LIT13
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r5, r0
    add r0, sp, #0x40
    bl func_0201d47c
    mvn r0, #0x0
    ldrh r1, [sp, #0x54]
    str r5, [sp, #0x40]
    str r0, [sp, #0x48]
    bic r1, r1, #0xf
    orr r1, r1, #0x7
    str r0, [sp, #0x4c]
    strh r1, [sp, #0x54]
    ldr r1, [r4, #0x48]
    add r0, sp, #0x40
    mov r1, r1, lsl #0x5
    strh r1, [sp, #0x50]
    bl func_0201e5b8
    mov r0, r5
    bl func_02006e1c
    mov r0, #0x1
    add sp, sp, #0x68
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x0400100c
_LIT1: .word data_ov006_0225e138
_LIT2: .word data_02104f4c
_LIT3: .word data_ov006_021ce650
_LIT4: .word data_ov006_021ce8a8
_LIT5: .word data_ov006_021ceb4c
_LIT6: .word data_ov006_0224f448
_LIT7: .word data_ov006_021ceb10
_LIT8: .word data_ov006_021ceb2c
_LIT9: .word data_ov006_021ce4a4
_LIT10: .word 0x66666667
_LIT11: .word data_ov006_021ceb04
_LIT12: .word data_ov006_021ceb00
_LIT13: .word data_ov006_021cebb4
