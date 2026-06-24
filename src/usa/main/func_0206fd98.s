; func_0206fd98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219edf8
        .extern data_0219edfc
        .extern data_0219ee18
        .extern data_0219ee28
        .extern data_0219ee2c
        .extern data_0219ee30
        .extern data_0219ee34
        .extern data_0219eeb0
        .extern data_0219ef10
        .extern data_0219f158
        .extern data_0219f2d8
        .extern data_0219f458
        .extern data_021a62f0
        .extern func_0206f418
        .extern func_0206f488
        .extern func_0206f5b0
        .extern func_02070190
        .extern func_02070f28
        .extern func_02070f40
        .extern func_02073650
        .extern func_020743b0
        .extern func_02074514
        .extern func_02091680
        .extern func_020918f0
        .extern func_02092fc8
        .extern func_02094500
        .global func_0206fd98
        .arm
func_0206fd98:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x54
    ldr r3, _LIT0
    mov r1, #0x0
    ldr r0, _LIT1
    mov r2, #0x64
    str r1, [r3]
    bl func_02094500
    ldr r0, _LIT1
    mov r3, #0x180
    ldr r2, _LIT2
    ldr r1, _LIT3
    str r3, [r0, #0x3c]
    str r2, [r0, #0x40]
    str r3, [r0, #0x48]
    str r1, [r0, #0x4c]
    bl func_02070f40
    mov fp, #0x0
    mov r0, #0x1
    str r0, [sp]
    str r0, [sp, #0x4]
    str r0, [sp, #0x4c]
    mov r1, r0
    ldr r0, _LIT4
    ldr r5, [sp]
    str r1, [r0]
    mov r0, #0x2
    str r0, [sp, #0x10]
    mov r0, r5
    str r0, [sp, #0x34]
    str r0, [sp, #0x3c]
    mov r0, #0x3
    str r0, [sp, #0x1c]
    mov r0, r5
    str r0, [sp, #0x30]
    str r0, [sp, #0x28]
    str r0, [sp, #0x24]
    str r0, [sp, #0x20]
    str r0, [sp, #0xc]
    mov r0, #0x69
    str r0, [sp, #0x44]
    mov r0, #0x3e8
    mov r6, fp
    mov r4, fp
    mov sl, fp
    str fp, [sp, #0x14]
    str fp, [sp, #0x18]
    str fp, [sp, #0x38]
    str fp, [sp, #0x2c]
    str fp, [sp, #0x40]
    str fp, [sp, #0x48]
    str r0, [sp, #0x8]
.L_d0:
    ldr r0, [sp, #0x8]
    bl func_02091680
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_394
    bl func_02092fc8
    mov r9, r0, lsr #0x10
    ldr r0, _LIT5
    orr r9, r9, r1, lsl #0x10
    ldr r0, [r0]
    blx r0
    cmp r0, #0x0
    beq .L_20c
    ldr r0, [sp, #0x4c]
    subs r0, r0, #0x1
    str r0, [sp, #0x4c]
    bne .L_224
    ldr r0, _LIT6
    ldr r0, [r0]
    ands r0, r0, #0x1
    beq .L_13c
    cmp fp, #0x0
    bne .L_224
    bl func_02070190
    ldr fp, [sp, #0xc]
    b .L_224
.L_13c:
    cmp fp, #0x3
    addls pc, pc, fp, lsl #0x2
    b .L_224
    b .L_158
    b .L_1a8
    b .L_1cc
    b .L_224
.L_158:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    ldrne r1, [sp, #0x10]
    ldrne r0, _LIT4
    strne r1, [r0]
    ldrne r0, [sp, #0x14]
    strne r0, [sp, #0x4]
    bl func_0206f5b0
    cmp r0, #0x0
    beq .L_194
    ldr r1, [sp, #0x18]
    add r0, sp, #0x4c
    bl func_0206f488
    cmp r0, #0x0
    bne .L_1a0
.L_194:
    bl func_02070190
    ldr fp, [sp, #0x1c]
    b .L_224
.L_1a0:
    ldr fp, [sp, #0x20]
    b .L_224
.L_1a8:
    ldr r1, [sp, #0x24]
    add r0, sp, #0x4c
    bl func_0206f488
    cmp r0, #0x0
    bne .L_224
    ldr r0, [sp, #0x4c]
    cmp r0, #0x3c
    ldrcc fp, [sp, #0x10]
    b .L_224
.L_1cc:
    ldr r1, [sp, #0x10]
    add r0, sp, #0x4c
    bl func_0206f488
    cmp r0, #0x0
    ldrne fp, [sp, #0x28]
    bne .L_224
    ldr r0, [sp, #0x4c]
    cmp r0, #0x3c
    bcs .L_224
    ldr r0, [sp, #0x1c]
    bl func_020743b0
    ldr r0, [sp, #0x30]
    ldr fp, [sp, #0x2c]
    str r0, [sp, #0x4c]
    str r0, [sp]
    b .L_224
.L_20c:
    ldr r0, [sp, #0x34]
    bl func_020743b0
    ldr r0, [sp, #0x3c]
    ldr fp, [sp, #0x38]
    str r0, [sp, #0x4c]
    str r0, [sp]
.L_224:
    ldr r1, [sp, #0x40]
    ldr r0, _LIT7
.L_22c:
    ldr r2, [r0]
    cmp r2, #0x0
    beq .L_254
    ldrh r2, [r0, #0xa]
    sub r2, r9, r2
    mov r2, r2, lsl #0x10
    mov r3, r2, asr #0x10
    ldr r2, _LIT8
    cmp r3, r2
    strgt r6, [r0]
.L_254:
    add r0, r0, #0xc
    add r1, r1, #0x1
    cmp r1, #0x8
    blt .L_22c
    ldr r0, _LIT9
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_290
    ldr r1, [sp]
    subs r1, r1, #0x1
    str r1, [sp]
    bne .L_290
    bl func_02073650
    ldr r0, [sp, #0x44]
    str r0, [sp]
.L_290:
    ldr r0, _LIT10
    ldr r7, [r0, #0x8]
    cmp r7, #0x0
    beq .L_32c
.L_2a0:
    ldr r0, [r7, #0xa4]
    cmp r0, #0x0
    beq .L_320
    ldr r1, [r0]
    cmp r1, #0x0
    beq .L_320
    ldrb r2, [r0, #0x8]
    cmp r2, #0x3
    bne .L_2ec
    ldr r1, [r0, #0x10]
    sub r1, r9, r1
    cmp r1, #0x27
    ble .L_2ec
    strb r5, [r0, #0x8]
    ldrh r1, [r0, #0x1a]
    strh r1, [r0, #0x18]
    ldr r1, [r0, #0x20]
    str r1, [r0, #0x1c]
    b .L_320
.L_2ec:
    cmp r2, #0x2
    bne .L_320
    ldr r1, [r0, #0x10]
    sub r1, r9, r1
    cmp r1, #0x27
    ble .L_320
    ldr r1, [r0, #0x4]
    cmp r1, #0x1
    bne .L_320
    strb r4, [r0, #0x8]
    str r4, [r0, #0x4]
    ldr r0, [r0]
    bl func_020918f0
.L_320:
    ldr r7, [r7, #0x68]
    cmp r7, #0x0
    bne .L_2a0
.L_32c:
    ldr r7, [sp, #0x48]
    ldr r8, _LIT11
.L_334:
    ldrh r0, [r8, #0x4]
    cmp r0, #0x0
    beq .L_364
    ldr r0, [r8, #0x2c]
    sub r0, r9, r0
    cmp r0, #0xef
    ble .L_364
    ldr r1, _LIT12
    ldr r0, [r8, #0x34]
    ldr r1, [r1]
    blx r1
    strh sl, [r8, #0x4]
.L_364:
    add r8, r8, #0x38
    add r7, r7, #0x1
    cmp r7, #0x8
    blt .L_334
    mov r0, r9
    bl func_02074514
    ldr r0, _LIT13
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_d0
    blx r0
    b .L_d0
.L_394:
    ldr r0, _LIT6
    ldr r0, [r0]
    ands r0, r0, #0x1
    bne .L_3b0
    cmp fp, #0x3
    beq .L_3b0
    bl func_0206f418
.L_3b0:
    bl func_02070f28
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_0219ee30
_LIT1: .word data_0219ef10
_LIT2: .word data_0219f2d8
_LIT3: .word data_0219f158
_LIT4: .word data_0219edf8
_LIT5: .word data_0219ee34
_LIT6: .word data_0219edfc
_LIT7: .word data_0219eeb0
_LIT8: .word 0x000003bd
_LIT9: .word data_0219ee18
_LIT10: .word data_021a62f0
_LIT11: .word data_0219f458
_LIT12: .word data_0219ee2c
_LIT13: .word data_0219ee28
