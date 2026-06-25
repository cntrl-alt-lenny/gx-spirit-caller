; func_02011c38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_020b4674
        .extern func_02009730
        .extern func_0202b08c
        .extern func_0202b854
        .extern func_0202b95c
        .extern func_0202b998
        .extern func_0202df24
        .extern func_0202e1e0
        .extern func_0202e274
        .extern func_0202e2a4
        .extern func_020a9828
        .extern func_020a985c
        .extern func_020b377c
        .global func_02011c38
        .arm
func_02011c38:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    ldr r3, _LIT0
    mov r2, #0x0
    ldr r7, [r3]
    mov r3, r2
    mov r5, r0
    mov r4, r1
    mov r0, r7, lsl #0x2
    mov r1, #0x4
    mov fp, r2
    str r2, [sp, #0x20]
    str r3, [sp, #0x1c]
    str r3, [sp, #0x18]
    str r3, [sp, #0x14]
    str r3, [sp, #0x4]
    bl Task_PostLocked
    str r0, [sp, #0x10]
    mov r0, fp
    str r0, [sp, #0xc]
    bl func_02009730
    str r0, [sp, #0x8]
    mov r0, r4
    bl func_020a985c
    mov r0, fp
    str r0, [r5]
    str r0, [r5, #0x8]
    cmp r7, #0x1
    str r0, [r5, #0x4]
    mov r4, #0x1
    ble .L_154
.L_7c:
    mov r0, r4
    bl func_0202b08c
    mov r6, r0
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_148
    mov r0, r6
    bl func_0202b998
    cmp r0, #0x0
    beq .L_148
    mov r0, r6
    bl func_0202e274
    cmp r0, #0x0
    beq .L_fc
    ldr r0, [r5, #0x8]
    cmp r0, #0xf
    bcs .L_d8
    add r0, r5, r0, lsl #0x1
    ldr r1, [r5, #0x8]
    add r1, r1, #0x1
    str r1, [r5, #0x8]
    strh r6, [r0, #0xca]
    b .L_148
.L_d8:
    bl func_020a9828
    mov r1, r0, lsl #0x4
    mov r0, r1, asr #0xe
    add r0, r1, r0, lsr #0x11
    mov r0, r0, asr #0xf
    cmp r0, #0xf
    addlt r0, r5, r0, lsl #0x1
    strlth r6, [r0, #0xca]
    b .L_148
.L_fc:
    mov r0, r6
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_11c
    ldr r0, [sp, #0x1c]
    add r0, r0, #0x1
    str r0, [sp, #0x1c]
    b .L_134
.L_11c:
    mov r0, r6
    bl func_0202b854
    cmp r0, #0x5
    ldrlt r0, [sp, #0x20]
    addlt r0, r0, #0x1
    strlt r0, [sp, #0x20]
.L_134:
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0x4]
    str r6, [r1, r0, lsl #0x2]
    add r0, r0, #0x1
    str r0, [sp, #0x4]
.L_148:
    add r4, r4, #0x1
    cmp r4, r7
    blt .L_7c
.L_154:
    ldr r0, [r5]
    cmp r0, #0x28
    bcs .L_34c
.L_160:
    bl func_020a9828
    ldr r1, [sp, #0x4]
    mov r4, #0x0
    mul r2, r1, r0
    mov r0, r2, asr #0xe
    add r0, r2, r0, lsr #0x11
    mov sl, r0, asr #0xf
    mov r6, #0x1
.L_180:
    ldr r0, [sp, #0x10]
    ldr r1, [sp, #0x4]
    ldr r7, [r0, sl, lsl #0x2]
    add r0, sl, #0x1
    bl func_020b377c
    mov sl, r1
    ldr r1, [r5]
    mov r8, #0x0
    mov r2, r8
    cmp r1, #0x0
    bls .L_1d0
.L_1ac:
    add r0, r5, r2, lsl #0x1
    ldrh r0, [r0, #0xc]
    add r2, r2, #0x1
    cmp r7, r0
    moveq r0, r6
    movne r0, r4
    add r8, r8, r0
    cmp r2, r1
    bcc .L_1ac
.L_1d0:
    mov r0, r7
    bl func_0202b998
    cmp r8, r0
    bge .L_180
    mov r0, r7
    bl func_0202b95c
    cmp r0, #0x0
    bne .L_228
    ldr r1, [sp, #0x8]
    cmp r1, #0x0
    beq .L_228
    ldr r1, [sp, #0xc]
    cmp r1, #0x0
    bne .L_228
    ldr r1, [r5]
    mov r0, #0x1
    str r0, [sp, #0xc]
    add r0, r1, #0x1
    str r0, [r5]
    add r0, r5, r1, lsl #0x1
    strh r7, [r0, #0xc]
    b .L_340
.L_228:
    cmp r8, r0
    bge .L_180
    ldr r2, [r5]
    mov r9, #0x0
    mov r8, r9
    cmp r2, #0x0
    bls .L_268
.L_244:
    mov r0, r7
    add r1, r5, r8, lsl #0x1
    ldrh r1, [r1, #0xc]
    bl func_0202df24
    add r9, r9, r0
    add r8, r8, #0x1
    ldr r2, [r5]
    cmp r8, r2
    bcc .L_244
.L_268:
    cmp r9, #0x3
    bge .L_180
    ldr r0, [sp, #0x20]
    cmp r0, #0x14
    ldrge r0, [sp, #0x1c]
    cmpge r0, #0x14
    blt .L_32c
    mov r0, r7
    bl func_0202b854
    cmp r0, #0x5
    blt .L_2cc
    cmp fp, #0x1e
    ldrlt r0, [sp, #0x18]
    cmplt r0, #0x4
    bge .L_180
    ldr r1, [r5]
    add fp, fp, #0x1
    add r0, r1, #0x1
    str r0, [r5]
    add r0, r5, r1, lsl #0x1
    strh r7, [r0, #0xc]
    ldr r0, [sp, #0x18]
    add r0, r0, #0x1
    str r0, [sp, #0x18]
    b .L_340
.L_2cc:
    mov r0, r7
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_300
    cmp fp, #0x1e
    bge .L_180
    ldr r1, [r5]
    add fp, fp, #0x1
    add r0, r1, #0x1
    str r0, [r5]
    add r0, r5, r1, lsl #0x1
    strh r7, [r0, #0xc]
    b .L_340
.L_300:
    ldr r0, [sp, #0x14]
    cmp r0, #0x14
    bge .L_180
    ldr r1, [r5]
    add r0, r0, #0x1
    str r0, [sp, #0x14]
    add r0, r1, #0x1
    str r0, [r5]
    add r0, r5, r1, lsl #0x1
    strh r7, [r0, #0xc]
    b .L_340
.L_32c:
    ldr r1, [r5]
    add r0, r5, r2, lsl #0x1
    add r1, r1, #0x1
    str r1, [r5]
    strh r7, [r0, #0xc]
.L_340:
    ldr r0, [r5]
    cmp r0, #0x28
    bcc .L_160
.L_34c:
    mov r0, #0x0
    str r0, [sp, #0x28]
.L_354:
    bl func_020a9828
    ldr r1, [sp, #0x4]
    mul r2, r1, r0
    mov r0, r2, asr #0xe
    add r1, r2, r0, lsr #0x11
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    mov r0, r1, asr #0xf
    str r0, [sp]
    mov r0, #0x0
    str r0, [sp, #0x24]
    ble .L_520
    mov r8, #0x1
    mov r7, r0
    mov fp, r0
    mov r6, r8
.L_394:
    ldr r1, [sp, #0x10]
    ldr r0, [sp]
    ldr r9, [r1, r0, lsl #0x2]
    ldr r1, [sp, #0x4]
    add r0, r0, #0x1
    bl func_020b377c
    str r1, [sp]
    ldr r1, [r5]
    mov r4, #0x0
    mov r2, r4
    cmp r1, #0x0
    bls .L_3e8
.L_3c4:
    add r0, r5, r2, lsl #0x1
    ldrh r0, [r0, #0xc]
    add r2, r2, #0x1
    cmp r9, r0
    moveq r0, r8
    movne r0, r7
    add r4, r4, r0
    cmp r2, r1
    bcc .L_3c4
.L_3e8:
    ldr r1, [r5, #0x4]
    mov r2, #0x0
    cmp r1, #0x0
    bls .L_41c
.L_3f8:
    add r0, r5, r2, lsl #0x1
    ldrh r0, [r0, #0xac]
    add r2, r2, #0x1
    cmp r9, r0
    moveq r0, r6
    movne r0, fp
    add r4, r4, r0
    cmp r2, r1
    bcc .L_3f8
.L_41c:
    mov r0, r9
    bl func_0202b998
    cmp r4, r0
    bge .L_508
    mov r0, r9
    bl func_0202b95c
    cmp r0, #0x0
    bne .L_474
    ldr r1, [sp, #0x8]
    cmp r1, #0x0
    beq .L_474
    ldr r1, [sp, #0xc]
    cmp r1, #0x0
    bne .L_474
    ldr r1, [r5, #0x4]
    mov r0, #0x1
    str r0, [sp, #0xc]
    add r0, r1, #0x1
    str r0, [r5, #0x4]
    add r0, r5, r1, lsl #0x1
    strh r9, [r0, #0xac]
    b .L_520
.L_474:
    cmp r4, r0
    bge .L_508
    ldr r0, [r5]
    mov r4, #0x0
    mov sl, r4
    cmp r0, #0x0
    bls .L_4b4
.L_490:
    mov r0, r9
    add r1, r5, sl, lsl #0x1
    ldrh r1, [r1, #0xc]
    bl func_0202df24
    add r4, r4, r0
    add sl, sl, #0x1
    ldr r0, [r5]
    cmp sl, r0
    bcc .L_490
.L_4b4:
    ldr r0, [r5, #0x4]
    mov sl, #0x0
    cmp r0, #0x0
    bls .L_4e8
.L_4c4:
    mov r0, r9
    add r1, r5, sl, lsl #0x1
    ldrh r1, [r1, #0xac]
    bl func_0202df24
    add r4, r4, r0
    add sl, sl, #0x1
    ldr r0, [r5, #0x4]
    cmp sl, r0
    bcc .L_4c4
.L_4e8:
    cmp r4, #0x3
    bge .L_508
    ldr r1, [r5, #0x4]
    add r0, r5, r0, lsl #0x1
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    strh r9, [r0, #0xac]
    b .L_520
.L_508:
    ldr r0, [sp, #0x24]
    add r1, r0, #0x1
    ldr r0, [sp, #0x4]
    str r1, [sp, #0x24]
    cmp r1, r0
    blt .L_394
.L_520:
    ldr r0, [sp, #0x28]
    add r0, r0, #0x1
    str r0, [sp, #0x28]
    cmp r0, #0xf
    blt .L_354
    ldr r0, [sp, #0x10]
    bl Task_InvokeLocked
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020b4674
