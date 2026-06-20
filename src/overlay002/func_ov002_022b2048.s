; func_ov002_022b2048 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104bac
        .extern data_02104f4c
        .extern data_0210599e
        .extern data_021059a0
        .extern data_021059a4
        .extern data_021059a8
        .extern data_021059cc
        .extern data_021059d0
        .extern data_ov002_022cc822
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d1400
        .extern func_02006164
        .extern func_02009758
        .extern func_020117ac
        .extern func_0202ba94
        .extern func_02034784
        .extern func_02037208
        .extern func_ov002_0229a04c
        .extern func_ov002_022a3918
        .extern func_ov002_022a57b8
        .extern func_ov002_022b18a0
        .extern func_ov002_022b1bac
        .global func_ov002_022b2048
        .arm
func_ov002_022b2048:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, [sl, #0x4c]
    cmp r0, #0x75
    bgt .L_4dc
    bl func_02034784
    cmp r0, #0x2
    bne .L_34
    ldr r0, _LIT0
    ldr r0, [r0, #0xbac]
    cmp r0, #0x0
    ldrlt r8, _LIT1
    blt .L_38
.L_34:
    ldr r8, _LIT2
.L_38:
    bl func_02034784
    cmp r0, #0x2
    bne .L_58
    ldr r0, _LIT0
    ldr r0, [r0, #0xbac]
    cmp r0, #0x0
    ldrlt r9, _LIT3
    blt .L_5c
.L_58:
    ldr r9, _LIT4
.L_5c:
    ldr r0, _LIT5
    ldr r2, [sl, #0x28]
    ldr r0, [r0, #0xa64]
    ldr r1, [sl, #0x24]
    and r0, r0, #0x1f00000
    mov r0, r0, lsr #0x14
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
    add r0, r2, #0x68
    cmp r0, r1, lsl #0x4
    addlt r0, r2, #0x2
    strlt r0, [sl, #0x28]
    mov r6, #0x0
    ldr r3, _LIT6
    sub r7, r4, #0x1
    ldr r0, [sl, #0x54]
    movlt r6, #0x1
    add r5, r3, r7, lsl #0x3
    ldr fp, _LIT7
    cmp r0, #0x0
    beq .L_c0
    sub r0, r0, #0x1
    str r0, [sl, #0x54]
    mov r6, #0x1
    b .L_2dc
.L_c0:
    ldr r0, _LIT8
    bl func_ov002_022a3918
    cmp r0, #0x0
    movne r6, #0x1
    bne .L_2dc
    ldr r1, [sl, #0x50]
    cmp r1, #0x0
    beq .L_178
    ldr r0, [sl, #0x4c]
    cmp r0, #0x1
    bne .L_178
    sub r0, r1, #0x1
    str r0, [sl, #0x50]
    ldr r0, [r9]
    add r0, r0, #0x1
    str r0, [r9]
    ldr r0, [sl, #0x50]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    adds r0, r1, r0, ror #0x1d
    bne .L_128
    mov r0, #0x40
    sub r1, r0, #0x41
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_128:
    ldrh r0, [r8]
    bl func_020117ac
    ldr r1, [r9]
    cmp r0, r1
    bhi .L_170
    ldrh r0, [r8]
    cmp r0, #0x63
    bcs .L_170
    add r0, r0, #0x1
    strh r0, [r8]
    mov r2, #0x0
    str r2, [r9]
    ldr r1, [sl, #0x8]
    ldr r0, _LIT8
    add r3, r1, #0x1
    mov r1, #0xa
    str r3, [sl, #0x8]
    bl func_ov002_022a57b8
.L_170:
    mov r6, #0x1
    b .L_2dc
.L_178:
    cmp r1, #0x0
    beq .L_228
    ldr r0, [sl, #0x4c]
    cmp r0, #0x2
    bne .L_228
    ldr r0, [sl, #0x50]
    sub r0, r0, #0x1
    str r0, [sl, #0x50]
    ldr r0, [fp, r7, lsl #0x3]
    add r0, r0, #0x1
    str r0, [fp, r7, lsl #0x3]
    ldr r0, [sl, #0x50]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    adds r0, r1, r0, ror #0x1d
    bne .L_1cc
    mov r0, #0x40
    sub r1, r0, #0x41
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_1cc:
    ldrh r3, [r5]
    ldr r1, _LIT9
    ldr r0, [fp, r7, lsl #0x3]
    mov r2, r3, lsl #0x1
    add r1, r1, r4, lsl #0x3
    ldrh r1, [r2, r1]
    cmp r1, r0
    bhi .L_220
    cmp r3, #0x2
    bcs .L_220
    add r1, r3, #0x1
    ldr r0, _LIT8
    strh r1, [r5]
    mov r2, #0x0
    mov r1, #0xa
    str r2, [fp, r7, lsl #0x3]
    bl func_ov002_022a57b8
    mov r0, r7
    bl func_ov002_0229a04c
    mov r1, #0x1
    bl func_0202ba94
.L_220:
    mov r6, #0x1
    b .L_2dc
.L_228:
    cmp r1, #0x0
    beq .L_2dc
    ldr r0, [sl, #0x4c]
    cmp r0, #0x75
    bne .L_2dc
    bl func_02006164
    cmp r0, #0x0
    bne .L_258
    ldr r0, _LIT10
    ldrh r0, [r0, #0x54]
    tst r0, #0x1
    beq .L_278
.L_258:
    ldr r0, _LIT5
    ldr r2, [sl, #0x50]
    ldr r3, [r0, #0xa60]
    mov r1, #0x0
    add r2, r3, r2
    str r2, [r0, #0xa60]
    str r1, [sl, #0x50]
    b .L_294
.L_278:
    ldr r1, [sl, #0x50]
    ldr r0, _LIT5
    sub r1, r1, #0x1
    str r1, [sl, #0x50]
    ldr r1, [r0, #0xa60]
    add r1, r1, #0x1
    str r1, [r0, #0xa60]
.L_294:
    ldr r1, _LIT5
    ldr r0, _LIT11
    ldr r1, [r1, #0xa60]
    cmp r1, r0
    bcc .L_2b0
    mov r0, #0x8
    bl func_02009758
.L_2b0:
    ldr r0, [sl, #0x50]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    adds r0, r1, r0, ror #0x1d
    bne .L_2d8
    mov r0, #0x40
    sub r1, r0, #0x41
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_2d8:
    mov r6, #0x1
.L_2dc:
    cmp r6, #0x0
    movne r0, #0x0
    strne r0, [sl, #0x20]
    bne .L_4b4
    ldr r1, [sl, #0x4c]
    cmp r1, #0x75
    addeq r0, r1, #0x1
    streq r0, [sl, #0x4c]
    beq .L_4b4
    ldr r0, _LIT0
    ldr r4, _LIT12
    ldr r7, [r0, #0x38]
    mov r3, #0x18
    mov r0, r7, lsr #0x1f
    smull r2, r9, r4, r7
    add r9, r0, r9, asr #0x2
    smull r0, r2, r3, r9
    subs r9, r7, r0
    bne .L_4b4
    cmp r1, #0x75
    bge .L_4b4
.L_330:
    mov r0, sl
    add r1, r1, #0x1
    bl func_ov002_022b18a0
    ldr r2, [sl, #0x4c]
    mov r4, r0
    cmp r2, #0x3
    blt .L_360
    add r0, r2, #0x1
    cmp r0, #0x75
    beq .L_360
    cmp r4, #0x0
    beq .L_4a0
.L_360:
    ldr r1, [sl, #0x24]
    mov r0, sl
    add r2, r2, #0x1
    bl func_ov002_022b1bac
    ldr r1, [sl, #0x4c]
    cmp r1, #0x0
    bne .L_3a8
    ldrh r1, [r8]
    cmp r1, #0x63
    bcs .L_398
    str r4, [sl, #0x50]
    mov r1, #0x3c
    str r1, [sl, #0x54]
    b .L_418
.L_398:
    mov r1, #0x0
    str r1, [sl, #0x50]
    str r1, [sl, #0x54]
    b .L_418
.L_3a8:
    add r2, r1, #0x1
    cmp r2, #0x2
    bne .L_3f8
    ldr r1, _LIT5
    ldr r1, [r1, #0xa64]
    and r1, r1, #0x1f00000
    movs r1, r1, lsr #0x14
    streq r2, [sl, #0x4c]
    beq .L_4b4
    ldrh r1, [r5]
    cmp r1, #0x2
    bcs .L_3e8
    str r4, [sl, #0x50]
    mov r1, #0x3c
    str r1, [sl, #0x54]
    b .L_418
.L_3e8:
    mov r1, #0x0
    str r1, [sl, #0x50]
    str r1, [sl, #0x54]
    b .L_418
.L_3f8:
    cmp r2, #0x75
    ldrne r1, [sl, #0x58]
    addne r1, r1, r4
    strne r1, [sl, #0x58]
    bne .L_418
    str r4, [sl, #0x50]
    mov r1, #0x1e
    str r1, [sl, #0x54]
.L_418:
    ldr r2, [sl, #0x24]
    cmp r0, #0x1
    add r0, r2, #0x1
    str r0, [sl, #0x24]
    ldr r1, [sl, #0x4c]
    add r0, sl, r2, lsl #0x1
    add r1, r1, #0x1
    strh r1, [r0, #0x94]
    ble .L_460
    ldr r0, [sl, #0x24]
    mov r2, r0
    add r0, r0, #0x1
    str r0, [sl, #0x24]
    ldr r1, [sl, #0x4c]
    add r0, sl, r2, lsl #0x1
    add r1, r1, #0x1
    orr r1, r1, #0x8000
    strh r1, [r0, #0x94]
.L_460:
    ldr r0, [sl, #0x4c]
    add r1, r0, #0x1
    add r0, r1, #0x1
    str r1, [sl, #0x4c]
    cmp r0, #0x75
    bge .L_488
    ldr r0, [sl, #0x24]
    cmp r0, #0x5b
    movge r0, #0x74
    strge r0, [sl, #0x4c]
.L_488:
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_4b4
.L_4a0:
    mov r0, r2
    add r1, r0, #0x1
    str r1, [sl, #0x4c]
    cmp r1, #0x75
    blt .L_330
.L_4b4:
    ldr r0, _LIT13
    ldr r1, [r0, #0xd4]
    ldr r0, _LIT13
    cmp r1, #0x2
    movlt r1, #0x2
    cmp r6, #0x0
    str r1, [r0, #0xd4]
    moveq r0, #0x2
    streq r0, [sl, #0x20]
    b .L_5d4
.L_4dc:
    ldr r1, [sl, #0x28]
    cmp r1, #0x0
    ble .L_4f8
    ldr r0, [sl, #0x20]
    cmp r0, #0x1
    subeq r0, r1, #0x2
    streq r0, [sl, #0x28]
.L_4f8:
    ldr r1, [sl, #0x28]
    ldr r0, [sl, #0x24]
    add r2, r1, #0x68
    cmp r2, r0, lsl #0x4
    bge .L_51c
    ldr r0, [sl, #0x20]
    cmp r0, #0x2
    addeq r0, r1, #0x2
    streq r0, [sl, #0x28]
.L_51c:
    ldr r2, [sl, #0x2c]
    ldr r1, [sl, #0x28]
    cmp r1, r2
    bge .L_57c
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r4, r0, asr #0x4
    mov r0, r2, asr #0x3
    add r0, r2, r0, lsr #0x1c
    add r1, r4, #0x10
    mov r5, r0, asr #0x4
    cmp r1, r0, asr #0x4
    movle r5, r1
    cmp r4, r5
    bge .L_5d4
.L_558:
    add r0, sl, r4, lsl #0x1
    ldrh r2, [r0, #0x94]
    mov r0, sl
    mov r1, r4
    bl func_ov002_022b1bac
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_558
    b .L_5d4
.L_57c:
    ble .L_5d4
    add r1, r1, #0x67
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r4, r0, asr #0x4
    add r1, r2, #0x67
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    sub r5, r4, #0x10
    cmp r5, r0, asr #0x4
    mov r0, r0, asr #0x4
    movle r5, r0
    cmp r4, r5
    ble .L_5d4
.L_5b4:
    add r0, sl, r4, lsl #0x1
    ldrh r2, [r0, #0x94]
    mov r0, sl
    mov r1, r4
    bl func_ov002_022b1bac
    sub r4, r4, #0x1
    cmp r4, r5
    bgt .L_5b4
.L_5d4:
    ldr r0, [sl, #0x28]
    str r0, [sl, #0x2c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_021059a4
_LIT2: .word data_0210599e
_LIT3: .word data_021059a8
_LIT4: .word data_021059a0
_LIT5: .word data_02104f4c
_LIT6: .word data_021059cc
_LIT7: .word data_021059d0
_LIT8: .word data_ov002_022d1400
_LIT9: .word data_ov002_022cc822
_LIT10: .word data_02104bac
_LIT11: .word 0x000186a0
_LIT12: .word 0x2aaaaaab
_LIT13: .word data_ov002_022d0f2c
