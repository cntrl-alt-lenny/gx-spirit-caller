; func_02011c6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_020b4768
        .extern func_0200974c
        .extern func_0202b0e0
        .extern func_0202b8a8
        .extern func_0202b9b0
        .extern func_0202b9ec
        .extern func_0202df78
        .extern func_0202e234
        .extern func_0202e2c8
        .extern func_0202e2f8
        .extern func_020a991c
        .extern func_020a9950
        .extern func_020b3870
        .global func_02011c6c
        .arm
func_02011c6c:
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
    bl func_0200974c
    str r0, [sp, #0x8]
    mov r0, r4
    bl func_020a9950
    mov r0, fp
    str r0, [r5]
    str r0, [r5, #0x8]
    cmp r7, #0x1
    str r0, [r5, #0x4]
    mov r4, #0x1
    ble .L_224
.L_14c:
    mov r0, r4
    bl func_0202b0e0
    mov r6, r0
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_218
    mov r0, r6
    bl func_0202b9ec
    cmp r0, #0x0
    beq .L_218
    mov r0, r6
    bl func_0202e2c8
    cmp r0, #0x0
    beq .L_1cc
    ldr r0, [r5, #0x8]
    cmp r0, #0xf
    bcs .L_1a8
    add r0, r5, r0, lsl #0x1
    ldr r1, [r5, #0x8]
    add r1, r1, #0x1
    str r1, [r5, #0x8]
    strh r6, [r0, #0xca]
    b .L_218
.L_1a8:
    bl func_020a991c
    mov r1, r0, lsl #0x4
    mov r0, r1, asr #0xe
    add r0, r1, r0, lsr #0x11
    mov r0, r0, asr #0xf
    cmp r0, #0xf
    addlt r0, r5, r0, lsl #0x1
    strlth r6, [r0, #0xca]
    b .L_218
.L_1cc:
    mov r0, r6
    bl func_0202e234
    cmp r0, #0x0
    bne .L_1ec
    ldr r0, [sp, #0x1c]
    add r0, r0, #0x1
    str r0, [sp, #0x1c]
    b .L_204
.L_1ec:
    mov r0, r6
    bl func_0202b8a8
    cmp r0, #0x5
    ldrlt r0, [sp, #0x20]
    addlt r0, r0, #0x1
    strlt r0, [sp, #0x20]
.L_204:
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0x4]
    str r6, [r1, r0, lsl #0x2]
    add r0, r0, #0x1
    str r0, [sp, #0x4]
.L_218:
    add r4, r4, #0x1
    cmp r4, r7
    blt .L_14c
.L_224:
    ldr r0, [r5]
    cmp r0, #0x28
    bcs .L_41c
.L_230:
    bl func_020a991c
    ldr r1, [sp, #0x4]
    mov r4, #0x0
    mul r2, r1, r0
    mov r0, r2, asr #0xe
    add r0, r2, r0, lsr #0x11
    mov sl, r0, asr #0xf
    mov r6, #0x1
.L_250:
    ldr r0, [sp, #0x10]
    ldr r1, [sp, #0x4]
    ldr r7, [r0, sl, lsl #0x2]
    add r0, sl, #0x1
    bl func_020b3870
    mov sl, r1
    ldr r1, [r5]
    mov r8, #0x0
    mov r2, r8
    cmp r1, #0x0
    bls .L_2a0
.L_27c:
    add r0, r5, r2, lsl #0x1
    ldrh r0, [r0, #0xc]
    add r2, r2, #0x1
    cmp r7, r0
    moveq r0, r6
    movne r0, r4
    add r8, r8, r0
    cmp r2, r1
    bcc .L_27c
.L_2a0:
    mov r0, r7
    bl func_0202b9ec
    cmp r8, r0
    bge .L_250
    mov r0, r7
    bl func_0202b9b0
    cmp r0, #0x0
    bne .L_2f8
    ldr r1, [sp, #0x8]
    cmp r1, #0x0
    beq .L_2f8
    ldr r1, [sp, #0xc]
    cmp r1, #0x0
    bne .L_2f8
    ldr r1, [r5]
    mov r0, #0x1
    str r0, [sp, #0xc]
    add r0, r1, #0x1
    str r0, [r5]
    add r0, r5, r1, lsl #0x1
    strh r7, [r0, #0xc]
    b .L_410
.L_2f8:
    cmp r8, r0
    bge .L_250
    ldr r2, [r5]
    mov r9, #0x0
    mov r8, r9
    cmp r2, #0x0
    bls .L_338
.L_314:
    mov r0, r7
    add r1, r5, r8, lsl #0x1
    ldrh r1, [r1, #0xc]
    bl func_0202df78
    add r9, r9, r0
    add r8, r8, #0x1
    ldr r2, [r5]
    cmp r8, r2
    bcc .L_314
.L_338:
    cmp r9, #0x3
    bge .L_250
    ldr r0, [sp, #0x20]
    cmp r0, #0x14
    ldrge r0, [sp, #0x1c]
    cmpge r0, #0x14
    blt .L_3fc
    mov r0, r7
    bl func_0202b8a8
    cmp r0, #0x5
    blt .L_39c
    cmp fp, #0x1e
    ldrlt r0, [sp, #0x18]
    cmplt r0, #0x4
    bge .L_250
    ldr r1, [r5]
    add fp, fp, #0x1
    add r0, r1, #0x1
    str r0, [r5]
    add r0, r5, r1, lsl #0x1
    strh r7, [r0, #0xc]
    ldr r0, [sp, #0x18]
    add r0, r0, #0x1
    str r0, [sp, #0x18]
    b .L_410
.L_39c:
    mov r0, r7
    bl func_0202e234
    cmp r0, #0x0
    beq .L_3d0
    cmp fp, #0x1e
    bge .L_250
    ldr r1, [r5]
    add fp, fp, #0x1
    add r0, r1, #0x1
    str r0, [r5]
    add r0, r5, r1, lsl #0x1
    strh r7, [r0, #0xc]
    b .L_410
.L_3d0:
    ldr r0, [sp, #0x14]
    cmp r0, #0x14
    bge .L_250
    ldr r1, [r5]
    add r0, r0, #0x1
    str r0, [sp, #0x14]
    add r0, r1, #0x1
    str r0, [r5]
    add r0, r5, r1, lsl #0x1
    strh r7, [r0, #0xc]
    b .L_410
.L_3fc:
    ldr r1, [r5]
    add r0, r5, r2, lsl #0x1
    add r1, r1, #0x1
    str r1, [r5]
    strh r7, [r0, #0xc]
.L_410:
    ldr r0, [r5]
    cmp r0, #0x28
    bcc .L_230
.L_41c:
    mov r0, #0x0
    str r0, [sp, #0x28]
.L_424:
    bl func_020a991c
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
    ble .L_5f0
    mov r8, #0x1
    mov r7, r0
    mov fp, r0
    mov r6, r8
.L_464:
    ldr r1, [sp, #0x10]
    ldr r0, [sp]
    ldr r9, [r1, r0, lsl #0x2]
    ldr r1, [sp, #0x4]
    add r0, r0, #0x1
    bl func_020b3870
    str r1, [sp]
    ldr r1, [r5]
    mov r4, #0x0
    mov r2, r4
    cmp r1, #0x0
    bls .L_4b8
.L_494:
    add r0, r5, r2, lsl #0x1
    ldrh r0, [r0, #0xc]
    add r2, r2, #0x1
    cmp r9, r0
    moveq r0, r8
    movne r0, r7
    add r4, r4, r0
    cmp r2, r1
    bcc .L_494
.L_4b8:
    ldr r1, [r5, #0x4]
    mov r2, #0x0
    cmp r1, #0x0
    bls .L_4ec
.L_4c8:
    add r0, r5, r2, lsl #0x1
    ldrh r0, [r0, #0xac]
    add r2, r2, #0x1
    cmp r9, r0
    moveq r0, r6
    movne r0, fp
    add r4, r4, r0
    cmp r2, r1
    bcc .L_4c8
.L_4ec:
    mov r0, r9
    bl func_0202b9ec
    cmp r4, r0
    bge .L_5d8
    mov r0, r9
    bl func_0202b9b0
    cmp r0, #0x0
    bne .L_544
    ldr r1, [sp, #0x8]
    cmp r1, #0x0
    beq .L_544
    ldr r1, [sp, #0xc]
    cmp r1, #0x0
    bne .L_544
    ldr r1, [r5, #0x4]
    mov r0, #0x1
    str r0, [sp, #0xc]
    add r0, r1, #0x1
    str r0, [r5, #0x4]
    add r0, r5, r1, lsl #0x1
    strh r9, [r0, #0xac]
    b .L_5f0
.L_544:
    cmp r4, r0
    bge .L_5d8
    ldr r0, [r5]
    mov r4, #0x0
    mov sl, r4
    cmp r0, #0x0
    bls .L_584
.L_560:
    mov r0, r9
    add r1, r5, sl, lsl #0x1
    ldrh r1, [r1, #0xc]
    bl func_0202df78
    add r4, r4, r0
    add sl, sl, #0x1
    ldr r0, [r5]
    cmp sl, r0
    bcc .L_560
.L_584:
    ldr r0, [r5, #0x4]
    mov sl, #0x0
    cmp r0, #0x0
    bls .L_5b8
.L_594:
    mov r0, r9
    add r1, r5, sl, lsl #0x1
    ldrh r1, [r1, #0xac]
    bl func_0202df78
    add r4, r4, r0
    add sl, sl, #0x1
    ldr r0, [r5, #0x4]
    cmp sl, r0
    bcc .L_594
.L_5b8:
    cmp r4, #0x3
    bge .L_5d8
    ldr r1, [r5, #0x4]
    add r0, r5, r0, lsl #0x1
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    strh r9, [r0, #0xac]
    b .L_5f0
.L_5d8:
    ldr r0, [sp, #0x24]
    add r1, r0, #0x1
    ldr r0, [sp, #0x4]
    str r1, [sp, #0x24]
    cmp r1, r0
    blt .L_464
.L_5f0:
    ldr r0, [sp, #0x28]
    add r0, r0, #0x1
    str r0, [sp, #0x28]
    cmp r0, #0xf
    blt .L_424
    ldr r0, [sp, #0x10]
    bl Task_InvokeLocked
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020b4768
