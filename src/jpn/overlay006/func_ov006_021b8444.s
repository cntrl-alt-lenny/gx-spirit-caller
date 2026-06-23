; func_ov006_021b8444 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov006_021cb204
        .extern data_ov006_021cb220
        .extern data_ov006_0224f2c8
        .extern func_0202b0ac
        .extern func_0202b824
        .extern func_0202b83c
        .extern func_0202b854
        .extern func_0202b86c
        .extern func_0202b8fc
        .extern func_0202b92c
        .extern func_0202b95c
        .extern func_0202bacc
        .extern func_0202bb24
        .extern func_0202de48
        .extern func_ov006_021b8b50
        .extern func_ov006_021b8bb8
        .extern func_ov006_021b8c08
        .extern func_ov006_021b9b98
        .extern func_ov006_021b9c58
        .global func_ov006_021b8444
        .arm
func_ov006_021b8444:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r4, r1
    mov r5, r0
    cmp r4, #0x4
    addls pc, pc, r4, lsl #0x2
    b .L_a0
    b .L_30
    b .L_44
    b .L_5c
    b .L_74
    b .L_8c
.L_30:
    add r0, r5, #0x198
    add r8, r0, #0x9800
    mov r0, #0x0
    str r0, [sp, #0x4]
    b .L_a0
.L_44:
    add r0, r5, #0x158
    add r1, r5, #0x358
    add r0, r0, #0xb400
    str r0, [sp, #0x4]
    add r8, r1, #0xb000
    b .L_a0
.L_5c:
    add r0, r5, #0x358
    add r1, r5, #0x158
    add r0, r0, #0xb800
    str r0, [sp, #0x4]
    add r8, r1, #0xb800
    b .L_a0
.L_74:
    add r0, r5, #0x158
    add r1, r5, #0x358
    add r0, r0, #0xc000
    str r0, [sp, #0x4]
    add r8, r1, #0xbc00
    b .L_a0
.L_8c:
    add r0, r5, #0x158
    add r1, r5, #0x58
    add r0, r0, #0xc400
    str r0, [sp, #0x4]
    add r8, r1, #0xc400
.L_a0:
    mov r0, #0x12
    mla r9, r4, r0, r5
    add r0, r5, r4, lsl #0x1
    add r0, r0, #0xc600
    ldrh r0, [r0, #0x62]
    mov r7, #0x0
    mov r2, r7
    str r0, [sp]
    mov r0, r7
.L_c4:
    add r1, r9, r2, lsl #0x1
    add r1, r1, #0x8100
    add r2, r2, #0x1
    strh r0, [r1, #0x7e]
    cmp r2, #0x9
    blt .L_c4
    mov r1, #0x68
    mla fp, r4, r1, r5
    mvn r3, #0x0
.L_e8:
    add r2, fp, r0, lsl #0x1
    add r1, r2, #0xc600
    add r0, r0, #0x1
    strh r3, [r1, #0x76]
    add r1, r2, #0xc800
    strh r3, [r1, #0x7e]
    cmp r0, #0x34
    blt .L_e8
    ldr r0, _LIT0
    mov r1, r4, lsl #0x1
    ldrsh r0, [r0, r1]
    cmp r0, #0x0
    bne .L_138
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_138
    mov r0, r5
    bl func_ov006_021b8b50
.L_138:
    ldr r0, [sp]
    mov sl, #0x0
    cmp r0, #0x0
    ble .L_4ec
.L_148:
    ldr r0, _LIT0
    mov r1, r4, lsl #0x1
    ldrsh r0, [r0, r1]
    mvn r6, #0x0
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_350
    b .L_18c
    b .L_24c
    b .L_25c
    b .L_290
    b .L_2d4
    b .L_2e4
    b .L_2c4
    b .L_2f4
    b .L_32c
    b .L_33c
.L_18c:
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_230
    ldrh r1, [r8]
    mov r0, r5
    bl func_ov006_021b8c08
    ldrb r1, [r0]
    cmp r1, #0x0
    beq .L_20c
.L_1b8:
    ldrb r2, [r0]
    cmp r2, #0x24
    ldreqb r1, [r0, #0x1]
    cmpeq r1, #0x52
    bne .L_1ec
    ldrb r1, [r0, #0x2]!
    cmp r1, #0x28
    beq .L_1e4
.L_1d8:
    ldrb r1, [r0, #0x2]!
    cmp r1, #0x28
    bne .L_1d8
.L_1e4:
    add r0, r0, #0x1
    b .L_200
.L_1ec:
    cmp r2, #0x81
    ldreqb r1, [r0, #0x1]
    cmpeq r1, #0x77
    bne .L_20c
    add r0, r0, #0x2
.L_200:
    ldrb r1, [r0]
    cmp r1, #0x0
    bne .L_1b8
.L_20c:
    ldrb r2, [r0, #0x1]
    ldrb r1, [r0]
    mov r0, r5
    orr r1, r2, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov006_021b9b98
    mov r6, r0
    b .L_350
.L_230:
    ldrh r0, [r8]
    bl func_0202b0ac
    ldrb r1, [r0]
    mov r0, r5
    bl func_ov006_021b9b98
    mov r6, r0
    b .L_350
.L_24c:
    ldrh r0, [r8]
    bl func_0202de48
    mov r6, r0
    b .L_350
.L_25c:
    ldrh r0, [r8]
    bl func_0202de48
    sub r0, r0, #0x7
    cmp r0, #0x1
    bls .L_350
    ldrh r0, [r8]
    bl func_0202b8fc
    mov r1, r0, lsl #0x10
    mov r0, r5
    mov r1, r1, asr #0x10
    bl func_ov006_021b9c58
    mov r6, r0
    b .L_350
.L_290:
    ldrh r0, [r8]
    bl func_0202de48
    sub r0, r0, #0x7
    cmp r0, #0x1
    bls .L_350
    ldrh r0, [r8]
    bl func_0202b92c
    mov r1, r0, lsl #0x10
    mov r0, r5
    mov r1, r1, asr #0x10
    bl func_ov006_021b9c58
    mov r6, r0
    b .L_350
.L_2c4:
    ldrh r0, [r8]
    bl func_0202b854
    mov r6, r0
    b .L_350
.L_2d4:
    ldrh r0, [r8]
    bl func_0202b83c
    mov r6, r0
    b .L_350
.L_2e4:
    ldrh r0, [r8]
    bl func_0202b824
    mov r6, r0
    b .L_350
.L_2f4:
    ldrh r0, [r8]
    bl func_0202de48
    mov r6, r0
    ldrh r0, [r8]
    bl func_0202b86c
    cmp r6, #0x7
    ldreq r1, _LIT2
    ldreq r6, [r1, r0, lsl #0x2]
    beq .L_350
    cmp r6, #0x8
    ldreq r1, _LIT3
    ldreq r6, [r1, r0, lsl #0x2]
    mvnne r6, #0x0
    b .L_350
.L_32c:
    ldrh r0, [r8]
    bl func_0202b95c
    mov r6, r0
    b .L_350
.L_33c:
    ldrh r0, [r8]
    bl func_0202bb24
    cmp r0, #0x0
    movne r6, #0x1
    moveq r6, #0x0
.L_350:
    add r0, r5, #0x6000
    ldr r0, [r0, #0x29c]
    cmp r0, #0x0
    beq .L_388
    ldrh r0, [r8]
    bl func_0202bacc
    cmp r0, #0x0
    bne .L_388
    ldr r0, _LIT0
    mov r1, r4, lsl #0x1
    ldrsh r0, [r0, r1]
    cmp r0, #0x0
    cmpne r0, #0x1
    mvnne r6, #0x0
.L_388:
    cmp r6, #0x0
    blt .L_3b4
    add r2, fp, r6, lsl #0x1
    add r0, r2, #0xc600
    ldrsh r1, [r0, #0x76]
    add r0, r2, #0x76
    add r0, r0, #0xc600
    cmp r1, #0x0
    strlth sl, [r0]
    addlt r0, r2, #0xc800
    strlth r7, [r0, #0x7e]
.L_3b4:
    cmp r4, #0x0
    ldreqb r0, [r8, #0x2]
    addeq r7, r7, r0
    beq .L_404
    ldrb r1, [r8, #0x2]
    mov r0, #0x0
    cmp r1, #0x0
    ble .L_404
    ldr r1, [sp, #0x4]
    mov r2, #0x1
    add r3, r1, r7, lsl #0x2
.L_3e0:
    ldrh r1, [r8]
    add r0, r0, #0x1
    add r7, r7, #0x1
    strh r1, [r3]
    strb r2, [r3, #0x2]
    add r3, r3, #0x4
    ldrb r1, [r8, #0x2]
    cmp r0, r1
    blt .L_3e0
.L_404:
    ldrh r0, [r8]
    bl func_0202de48
    cmp r0, #0x8
    mvn r1, #0x0
    addls pc, pc, r0, lsl #0x2
    b .L_46c
    b .L_440
    b .L_448
    b .L_450
    b .L_458
    b .L_46c
    b .L_46c
    b .L_46c
    b .L_460
    b .L_468
.L_440:
    mov r1, #0x0
    b .L_46c
.L_448:
    mov r1, #0x1
    b .L_46c
.L_450:
    mov r1, #0x2
    b .L_46c
.L_458:
    mov r1, #0x3
    b .L_46c
.L_460:
    mov r1, #0x4
    b .L_46c
.L_468:
    mov r1, #0x5
.L_46c:
    cmp r1, #0x0
    blt .L_48c
    add r0, r9, r1, lsl #0x1
    add r0, r0, #0x8100
    ldrh r2, [r0, #0x7e]
    ldrb r1, [r8, #0x2]
    add r1, r2, r1
    strh r1, [r0, #0x7e]
.L_48c:
    ldrh r0, [r8]
    bl func_0202b854
    mvn r1, #0x0
    cmp r0, #0x7
    movge r1, #0x8
    bge .L_4b8
    cmp r0, #0x5
    movge r1, #0x7
    bge .L_4b8
    cmp r0, #0x1
    movge r1, #0x6
.L_4b8:
    cmp r1, #0x0
    blt .L_4d8
    add r0, r9, r1, lsl #0x1
    add r0, r0, #0x8100
    ldrh r2, [r0, #0x7e]
    ldrb r1, [r8, #0x2]
    add r1, r2, r1
    strh r1, [r0, #0x7e]
.L_4d8:
    ldr r0, [sp]
    add sl, sl, #0x1
    cmp sl, r0
    add r8, r8, #0x4
    blt .L_148
.L_4ec:
    ldr r0, _LIT0
    mov r1, r4, lsl #0x1
    ldrsh r0, [r0, r1]
    cmp r0, #0x0
    bne .L_51c
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_51c
    mov r0, r5
    bl func_ov006_021b8bb8
.L_51c:
    add r0, r5, r4, lsl #0x1
    add r0, r0, #0xc600
    strh r7, [r0, #0x6c]
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f2c8
_LIT1: .word data_02104e6c
_LIT2: .word data_ov006_021cb204
_LIT3: .word data_ov006_021cb220
