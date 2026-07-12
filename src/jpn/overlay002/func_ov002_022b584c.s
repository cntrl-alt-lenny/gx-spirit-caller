; func_ov002_022b584c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_ov002_022ccbc8
        .extern data_ov002_022ccee4
        .extern data_ov002_022ccef8
        .extern data_ov002_022ccf0c
        .extern data_ov002_022cd65c
        .extern data_ov002_022d0d90
        .extern data_ov002_022d0e4c
        .extern data_ov002_022d10dc
        .extern data_ov002_022d1330
        .extern data_ov002_022d281c
        .extern func_02021278
        .extern func_02021584
        .extern func_0202160c
        .extern func_0202165c
        .extern func_02021668
        .extern func_020221e0
        .extern func_020221f8
        .extern func_02023cf0
        .extern func_020257ec
        .extern func_0202c95c
        .extern func_0202e2bc
        .extern func_02036540
        .extern func_02037d70
        .extern func_020a9698
        .extern func_020aad04
        .extern func_020aae4c
        .extern func_ov002_0229d950
        .extern func_ov002_022a1674
        .extern func_ov002_022a61e8
        .extern func_ov002_022a69c0
        .extern func_ov002_022a6aa0
        .extern func_ov002_022b856c
        .extern func_ov002_022b87b4
        .extern func_ov002_022b9310
        .extern func_ov002_022b93a8
        .extern func_ov002_022b94bc
        .extern func_ov002_022b9c94
        .extern func_ov002_022bacd4
        .extern func_ov002_022bae34
        .extern func_ov002_022baf64
        .extern func_ov002_022bb184
        .extern func_ov002_022bb3a8
        .extern func_ov002_022bb5ec
        .extern func_ov002_022bb73c
        .extern func_ov002_022bb8c8
        .extern func_ov002_022bba08
        .extern func_ov002_022bbba4
        .extern func_ov002_022bbd78
        .extern func_ov002_022bbfa8
        .extern func_ov002_022bc1a4
        .extern func_ov002_022bc3ec
        .extern func_ov002_022bc688
        .extern func_ov002_022bc970
        .extern func_ov002_022bcbdc
        .extern func_ov002_022bcdc8
        .extern func_ov002_022bcf70
        .extern func_ov002_022bd0ec
        .extern func_ov002_022bd1b4
        .extern func_ov002_022bd318
        .extern func_ov002_022bd494
        .extern func_ov002_022bd6f4
        .extern func_ov002_022bd830
        .extern func_ov002_022bd8b0
        .extern func_ov002_022bda78
        .global func_ov002_022b584c
        .arm
func_ov002_022b584c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x110
    mov r9, r0
    ldr r0, [r9, #0xc54]
    str r0, [sp, #0x50]
    cmp r0, #0x14
    addls pc, pc, r0, lsl #0x2
    b .L_84
    b .L_84
    b .L_74
    b .L_74
    b .L_74
    b .L_74
    b .L_74
    b .L_74
    b .L_74
    b .L_74
    b .L_74
    b .L_74
    b .L_74
    b .L_84
    b .L_84
    b .L_74
    b .L_84
    b .L_84
    b .L_84
    b .L_84
    b .L_84
    b .L_74
.L_74:
    add r0, r9, #0xc00
    ldrh r0, [r0, #0x68]
    strh r0, [sp, #0xdc]
    b .L_94
.L_84:
    ldr r0, _LIT0
    add r0, r0, #0x500
    ldrh r0, [r0, #0x90]
    strh r0, [sp, #0xdc]
.L_94:
    ldrh r1, [sp, #0xdc]
    add r5, sp, #0x104
    mov r0, r9
    mov r6, r1, lsl #0x12
    mov r3, r1, lsl #0x1a
    mov r2, r1, lsl #0x1f
    mov r1, r6, lsr #0x18
    str r1, [sp, #0x4c]
    mov r1, r3, lsr #0x1b
    str r1, [sp, #0x44]
    mov r1, r2, lsr #0x1f
    ldr r3, [sp, #0x4c]
    ldr r2, [sp, #0x44]
    str r1, [sp, #0x48]
    str r5, [sp]
    bl func_ov002_022b856c
    ldr r0, _LIT0
    ldr r1, [sp, #0x48]
    ldr r2, [sp, #0x44]
    ldr r3, [sp, #0x4c]
    bl func_ov002_022a61e8
    str r0, [sp, #0x8c]
    cmp r0, #0x0
    ldrne r0, [r0, #0xc]
    strne r0, [sp, #0x2c]
    moveq r0, #0x0
    streq r0, [sp, #0x2c]
    ldr r0, _LIT1
    ldr r1, [r0, #0x4]
    ldr r0, [sp, #0x48]
    cmp r0, r1
    ldreq r0, [sp, #0x44]
    cmpeq r0, #0xb
    moveq r0, #0x1
    streq r0, [sp, #0x28]
    movne r0, #0x0
    strne r0, [sp, #0x28]
    ldr r0, [sp, #0x44]
    cmp r0, #0xb
    moveq r0, #0x1
    streq r0, [sp, #0x24]
    movne r0, #0x0
    strne r0, [sp, #0x24]
    ldr r0, [sp, #0x44]
    cmp r0, #0x4
    bhi .L_17c
    ldr r0, [sp, #0x8c]
    cmp r0, #0x0
    ldrnesb r0, [r0]
    cmpne r0, #0x0
    beq .L_17c
    ldr r0, [sp, #0x8c]
    ldrh r0, [r0, #0xa]
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    movne r0, #0x1
    strne r0, [sp, #0x20]
    bne .L_184
.L_17c:
    mov r0, #0x0
    str r0, [sp, #0x20]
.L_184:
    ldr r0, [r9]
    mov r1, #0x1
    mov r2, #0x0
    bl func_0202160c
    mov r2, #0x0
    add r1, sp, #0xf8
    mov r3, r2
    str r0, [sp, #0x84]
    bl func_02023cf0
    ldr r0, [r9, #0x4]
    mov r1, #0x3
    mov r2, #0xa
    bl func_0202160c
    bl func_020257ec
    str r0, [sp, #0x88]
    ldr r0, [r9, #0xc54]
    cmp r0, #0x1b
    addls pc, pc, r0, lsl #0x2
    b .L_380
    b .L_380
    b .L_240
    b .L_24c
    b .L_258
    b .L_264
    b .L_270
    b .L_27c
    b .L_288
    b .L_294
    b .L_2a0
    b .L_2ac
    b .L_2b8
    b .L_2c4
    b .L_2d0
    b .L_2dc
    b .L_2e8
    b .L_2f4
    b .L_300
    b .L_30c
    b .L_318
    b .L_324
    b .L_330
    b .L_33c
    b .L_348
    b .L_354
    b .L_360
    b .L_36c
    b .L_378
.L_240:
    mov r0, r9
    bl func_ov002_022b94bc
    b .L_380
.L_24c:
    mov r0, r9
    bl func_ov002_022b9c94
    b .L_380
.L_258:
    mov r0, r9
    bl func_ov002_022bacd4
    b .L_380
.L_264:
    mov r0, r9
    bl func_ov002_022bae34
    b .L_380
.L_270:
    mov r0, r9
    bl func_ov002_022baf64
    b .L_380
.L_27c:
    mov r0, r9
    bl func_ov002_022bb184
    b .L_380
.L_288:
    mov r0, r9
    bl func_ov002_022bb3a8
    b .L_380
.L_294:
    mov r0, r9
    bl func_ov002_022bb5ec
    b .L_380
.L_2a0:
    mov r0, r9
    bl func_ov002_022bb73c
    b .L_380
.L_2ac:
    mov r0, r9
    bl func_ov002_022bb8c8
    b .L_380
.L_2b8:
    mov r0, r9
    bl func_ov002_022bba08
    b .L_380
.L_2c4:
    mov r0, r9
    bl func_ov002_022bbba4
    b .L_380
.L_2d0:
    mov r0, r9
    bl func_ov002_022bbd78
    b .L_380
.L_2dc:
    mov r0, r9
    bl func_ov002_022bbfa8
    b .L_380
.L_2e8:
    mov r0, r9
    bl func_ov002_022bc3ec
    b .L_380
.L_2f4:
    mov r0, r9
    bl func_ov002_022bc688
    b .L_380
.L_300:
    mov r0, r9
    bl func_ov002_022bc970
    b .L_380
.L_30c:
    mov r0, r9
    bl func_ov002_022bcbdc
    b .L_380
.L_318:
    mov r0, r9
    bl func_ov002_022bcdc8
    b .L_380
.L_324:
    mov r0, r9
    bl func_ov002_022bcf70
    b .L_380
.L_330:
    mov r0, r9
    bl func_ov002_022bd0ec
    b .L_380
.L_33c:
    mov r0, r9
    bl func_ov002_022bd1b4
    b .L_380
.L_348:
    mov r0, r9
    bl func_ov002_022bd318
    b .L_380
.L_354:
    mov r0, r9
    bl func_ov002_022bd494
    b .L_380
.L_360:
    mov r0, r9
    bl func_ov002_022bd6f4
    b .L_380
.L_36c:
    mov r0, r9
    bl func_ov002_022bd830
    b .L_380
.L_378:
    mov r0, r9
    bl func_ov002_022bd8b0
.L_380:
    ldr r0, [r9, #0xd44]
    cmp r0, #0x0
    beq .L_824
    ldr r0, [r9, #0xccc]
    cmp r0, #0x0
    bne .L_824
    add r0, r9, #0x74
    add r0, r0, #0xc00
    str r0, [sp, #0x5c]
    add r0, r9, #0x78
    mov sl, #0x0
    add r0, r0, #0xc00
    str r0, [sp, #0x58]
    str sl, [sp, #0x54]
.L_3b8:
    add r0, r9, sl, lsl #0x2
    ldr r0, [r0, #0xd50]
    cmp r0, #0x0
    beq .L_58c
    mvn r1, #0x0
    cmp r0, r1
    beq .L_7f4
    bl func_02021584
    cmp r0, #0x0
    beq .L_7f4
    ldr r0, [r9, #0xc54]
    cmp r0, #0xa
    cmpne r0, #0x9
    cmpne r0, #0x7
    ldrne r1, [sp, #0x50]
    cmpne r1, #0xc
    bne .L_434
    add r1, r9, #0xc00
    ldrh r2, [r1, #0x6a]
    ldr r1, [sp, #0x5c]
    ldrh r3, [r1]
    mov r1, r2, lsl #0x1f
    mov r5, r1, lsr #0x1f
    mov r1, r3, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    bne .L_434
    mov r1, r2, lsl #0x1a
    mov r2, r1, lsr #0x1b
    mov r1, r3, lsl #0x1a
    cmp r2, r1, lsr #0x1b
    beq .L_43c
.L_434:
    cmp r0, #0x11
    bne .L_4e0
.L_43c:
    add r0, r9, sl, lsl #0x2
    ldr r0, [r0, #0xd50]
    bl func_02021278
    mvn r1, #0x0
    add r0, r9, sl, lsl #0x2
    str r1, [r0, #0xd50]
    ldr r0, [sp, #0x5c]
    ldrh r1, [r0]
    mov r0, sl, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r1, r1, r0
    ldr r0, [sp, #0x5c]
    strh r1, [r0]
    ldrh r0, [r0]
    add r1, r9, #0xc00
    bic r0, r0, #0x3e
    orr r2, r0, #0x3e
    ldr r0, [sp, #0x5c]
    strh r2, [r0]
    ldr r0, [sp, #0x58]
    ldrh r2, [r0]
    ldrh r0, [r1, #0x6a]
    bic r2, r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r0, r0, #0x1
    orr r2, r2, r0
    ldr r0, [sp, #0x58]
    strh r2, [r0]
    ldrh r1, [r1, #0x6a]
    ldrh r2, [r0]
    mov r0, r1, lsl #0x1a
    mov r0, r0, lsr #0x1b
    bic r1, r2, #0x3e
    mov r0, r0, lsl #0x1b
    orr r1, r1, r0, lsr #0x1a
    ldr r0, [sp, #0x58]
    strh r1, [r0]
    b .L_7f4
.L_4e0:
    cmp r0, #0x5
    bne .L_564
    ldr r2, _LIT2
    mov r1, #0x0
.L_4f0:
    ldr r0, [r2]
    cmp r0, #0x0
    beq .L_50c
    ldr r0, [r2, #0x4]
    cmp r0, #0x30
    moveq r0, #0x1
    beq .L_520
.L_50c:
    add r2, r2, #0x8
    add r1, r1, #0x1
    cmp r1, #0x10
    blt .L_4f0
    mov r0, #0x0
.L_520:
    cmp r0, #0x0
    beq .L_564
    add r0, r9, #0xc00
    ldrh r1, [r0, #0x68]
    ldr r0, [sp, #0x5c]
    ldrh r2, [r0]
    mov r0, r1, lsl #0x1f
    mov r3, r0, lsr #0x1f
    mov r0, r2, lsl #0x1f
    cmp r3, r0, lsr #0x1f
    bne .L_564
    mov r0, r1, lsl #0x1a
    mov r1, r0, lsr #0x1b
    mov r0, r2, lsl #0x1a
    cmp r1, r0, lsr #0x1b
    moveq r5, #0x0
    beq .L_568
.L_564:
    mov r5, #0x1f
.L_568:
    add r0, r9, sl, lsl #0x2
    ldr r0, [r0, #0xd50]
    mov r1, #0x3
    mov r2, #0x2
    bl func_0202160c
    mov r2, r5
    mov r1, #0xb
    bl func_0202165c
    b .L_7f4
.L_58c:
    ldr r1, [r9, #0xc54]
    cmp r1, #0xa
    cmpne r1, #0x9
    cmpne r1, #0x7
    ldrne r2, [sp, #0x50]
    cmpne r2, #0xc
    bne .L_5e0
    add r2, r9, #0xc00
    ldrh r3, [r2, #0x6a]
    ldr r2, [sp, #0x5c]
    ldrh r5, [r2]
    mov r2, r3, lsl #0x1f
    mov r6, r2, lsr #0x1f
    mov r2, r5, lsl #0x1f
    cmp r6, r2, lsr #0x1f
    bne .L_5e0
    mov r2, r3, lsl #0x1a
    mov r3, r2, lsr #0x1b
    mov r2, r5, lsl #0x1a
    cmp r3, r2, lsr #0x1b
    beq .L_5e8
.L_5e0:
    cmp r1, #0x11
    bne .L_650
.L_5e8:
    mvn r1, #0x0
    add r0, r9, sl, lsl #0x2
    str r1, [r0, #0xd50]
    ldr r0, [sp, #0x58]
    add r1, r9, #0xc00
    ldrh r2, [r0]
    ldrh r0, [r1, #0x6a]
    bic r3, r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r0, r0, #0x1
    orr r3, r3, r0
    ldr r0, [sp, #0x58]
    mov r2, #0x0
    strh r3, [r0]
    ldrh r1, [r1, #0x6a]
    ldrh r3, [r0]
    mov r0, r1, lsl #0x1a
    mov r0, r0, lsr #0x1b
    bic r1, r3, #0x3e
    mov r0, r0, lsl #0x1b
    orr r1, r1, r0, lsr #0x1a
    ldr r0, [sp, #0x58]
    strh r1, [r0]
    str r2, [r9, #0xd44]
    b .L_7f4
.L_650:
    cmp r0, #0x0
    bne .L_7f4
    mov r6, #0x0
    add r5, r9, #0xc00
.L_660:
    ldr r0, _LIT3
    cmp sl, #0x1
    smull r1, r7, r0, r6
    smull r2, r8, r0, r6
    mov r1, r6, lsr #0x1f
    add r8, r1, r8, asr #0x1
    mov r0, #0x5
    add r7, r1, r7, asr #0x1
    smull r1, r2, r0, r8
    ldreqh r0, [r5, #0x74]
    sub r8, r6, r1
    moveq r1, r0, lsl #0x1f
    cmpeq r7, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    moveq r0, r0, lsr #0x1b
    cmpeq r0, r8
    beq .L_7e8
    ldrh r0, [r5, #0x78]
    mov r1, r0, lsl #0x1f
    cmp r7, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    moveq r0, r0, lsr #0x1b
    cmpeq r0, r8
    beq .L_7e8
    ldrh r0, [r5, #0x7a]
    mov r1, r0, lsl #0x1f
    cmp r7, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    moveq r0, r0, lsr #0x1b
    cmpeq r0, r8
    beq .L_7e8
    ldr r0, _LIT0
    mov r1, r7
    mov r2, r8
    mov r3, #0x100
    bl func_ov002_022a61e8
    movs fp, r0
    ldrnesb r0, [fp]
    cmpne r0, #0x0
    beq .L_7e8
    add r1, sp, #0xec
    str r1, [sp]
    mov r0, r9
    mov r1, r7
    mov r2, r8
    mov r3, #0x0
    bl func_ov002_022b856c
    mov r0, #0x0
    str r0, [sp]
    ldr r0, _LIT2
    mov r1, #0x32
    mov r2, sl
    add r3, sp, #0xec
    bl func_ov002_022bda78
    mov r1, r7, lsl #0x10
    mov r1, r1, lsr #0x10
    and r5, r1, #0x1
    mov r1, r8, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, lsl #0x1b
    add r1, r9, sl, lsl #0x2
    str r0, [r1, #0xd50]
    add r0, r9, sl, lsl #0x1
    ldrh r1, [sp, #0xd8]
    add r2, r0, #0xc00
    bic r0, r1, #0x1
    orr r0, r0, r5
    strh r0, [sp, #0xd8]
    add r0, r9, #0x124
    ldrh r5, [sp, #0xd8]
    add r1, r0, #0x800
    bic r0, r5, #0x3e
    orr r0, r0, r3, lsr #0x1a
    strh r0, [sp, #0xd8]
    ldr r0, [sp, #0x54]
    ldrh r3, [sp, #0xd8]
    add r0, r0, #0x78
    add r0, r1, r0
    bic r1, r3, #0x3fc0
    strh r1, [sp, #0xd8]
    ldrh r3, [sp, #0xd8]
    ldr r1, _LIT4
    bic r3, r3, #0x4000
    strh r3, [sp, #0xd8]
    ldrh r3, [sp, #0xd8]
    bic r3, r3, #0x8000
    strh r3, [sp, #0xd8]
    ldrh r3, [sp, #0xd8]
    strh r3, [r2, #0x74]
    ldr r2, [fp, #0xc]
    bl func_020a9698
    add r0, r9, #0x174
    ldr r1, _LIT5
    add r0, r0, #0x800
    bl func_020a9698
    mov r0, #0x1
    str r0, [r9, #0xd44]
    b .L_7f4
.L_7e8:
    add r6, r6, #0x1
    cmp r6, #0xa
    blt .L_660
.L_7f4:
    ldr r0, [sp, #0x5c]
    add sl, sl, #0x1
    add r0, r0, #0x2
    str r0, [sp, #0x5c]
    ldr r0, [sp, #0x58]
    cmp sl, #0x2
    add r0, r0, #0x2
    str r0, [sp, #0x58]
    ldr r0, [sp, #0x54]
    add r0, r0, #0x28
    str r0, [sp, #0x54]
    blt .L_3b8
.L_824:
    ldr r0, [r9, #0xd44]
    cmp r0, #0x0
    bne .L_908
    mov r6, #0x0
    mov r7, r6
    mov r5, #0x100
    mov fp, #0x1
    mov sl, r6
.L_844:
    mov r8, sl
.L_848:
    ldr r0, _LIT0
    mov r1, r7
    mov r2, r8
    mov r3, r5
    bl func_ov002_022a61e8
    cmp r0, #0x0
    ldrnesb r0, [r0]
    cmpne r0, #0x0
    movne r6, fp
    bne .L_87c
    add r8, r8, #0x1
    cmp r8, #0x4
    ble .L_848
.L_87c:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_844
    cmp r6, #0x0
    bne .L_908
    add r0, r9, #0x74
    add r1, r0, #0xc00
    add r0, r9, #0x78
    mov r3, #0x0
    add r2, r0, #0xc00
    mov r0, r3
.L_8a8:
    add r5, r9, r3, lsl #0x2
    str r0, [r5, #0xd50]
    ldrh r6, [r1]
    mov r5, r3, lsl #0x10
    mov r5, r5, lsr #0x10
    bic r7, r6, #0x1
    and r6, r5, #0x1
    orr r5, r7, r6
    strh r5, [r1]
    ldrh r5, [r1]
    add r3, r3, #0x1
    cmp r3, #0x2
    bic r5, r5, #0x3e
    orr r5, r5, #0x3e
    strh r5, [r1], #0x2
    ldrh r5, [r2]
    bic r5, r5, #0x1
    orr r5, r5, r6
    strh r5, [r2]
    ldrh r5, [r2]
    bic r5, r5, #0x3e
    orr r5, r5, #0x3e
    strh r5, [r2], #0x2
    blt .L_8a8
.L_908:
    ldr r0, [r9, #0xcc8]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r9, #0xcc8]
    ldr r0, [r9, #0xccc]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r9, #0xccc]
    ldr r0, [r9, #0xcd0]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r9, #0xcd0]
    ldr r0, [r9, #0xc50]
    cmp r0, #0x0
    ble .L_974
    subs r0, r0, #0x1
    str r0, [r9, #0xc50]
    bne .L_974
    ldr r0, [r9, #0xc4c]
    bl func_ov002_022bc1a4
    mov r1, #0x1e0
    bl func_02036540
    ldr r0, _LIT6
    mov r1, #0x7f
    ldr r0, [r0, #0xd8]
    mov r2, #0x1e0
    bl func_02037d70
.L_974:
    ldr r0, [r9, #0xcd4]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r9, #0xcd4]
    add r0, r9, #0xc00
    ldrh r2, [r0, #0x6e]
    ldr r0, [sp, #0x48]
    mov r1, r2, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    ldreq r0, [sp, #0x44]
    moveq r1, r2, lsl #0x1a
    cmpeq r0, r1, lsr #0x1b
    ldreq r0, [sp, #0x4c]
    moveq r1, r2, lsl #0x12
    cmpeq r0, r1, lsr #0x18
    movne r0, #0x3
    strne r0, [r9, #0xcd8]
    ldr r0, [r9, #0xcd8]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r9, #0xcd8]
    mov r0, #0x0
    bl func_020221f8
    tst r0, #0x1
    bne .L_d0c
    ldrh r2, [sp, #0xdc]
    add r0, r9, #0xc00
    mov r1, #0x0
    strh r2, [r0, #0x6e]
    str r1, [r9, #0xc44]
    str r1, [r9, #0xcf4]
    ldr r0, [r9, #0xc54]
    cmp r0, #0x1
    bne .L_a20
    ldr r1, [r9, #0xd18]
    cmp r1, #0x0
    beq .L_a20
    ldr sl, [sp, #0x108]
    ldr r8, [sp, #0x104]
    ldr r5, [sp, #0x10c]
    mov r6, sl
    mov r7, r5
    b .L_c88
.L_a20:
    cmp r0, #0x0
    ldreq r1, [r9, #0xcc8]
    cmpeq r1, #0x0
    ldreq r1, [r9, #0xccc]
    cmpeq r1, #0x0
    bne .L_a64
    ldr r1, [r9, #0xd3c]
    cmp r1, #0x0
    beq .L_a64
    mov r8, #0x0
    mov sl, r8
    sub r5, r8, #0x20
    mov r6, #0xc0
    mov r7, r6
    mov r0, #0x1
    str r0, [r9, #0xcf4]
    b .L_c88
.L_a64:
    cmp r0, #0x5
    cmpne r0, #0xe
    bne .L_a9c
    ldr r1, [r9, #0xcf0]
    cmp r1, #0x0
    beq .L_a9c
    mov r8, #0x0
    mov sl, r8
    mov r5, #0x20
    mov r6, #0xc0
    mov r7, #0x120
    mov r0, #0x1
    str r0, [r9, #0xcf4]
    b .L_c88
.L_a9c:
    cmp r0, #0x2
    cmpne r0, #0x3
    cmpne r0, #0x5
    cmpne r0, #0x6
    cmpne r0, #0xa
    cmpne r0, #0xb
    beq .L_b00
    cmp r0, #0xd
    ldreq r1, [r9, #0xd0c]
    cmpeq r1, #0x0
    beq .L_b00
    cmp r0, #0xe
    beq .L_b00
    cmp r0, #0x1
    bne .L_ae4
    ldr r1, [r9, #0xd2c]
    cmp r1, #0x0
    bne .L_b00
.L_ae4:
    ldr r1, [r9, #0xcf8]
    cmp r1, #0x0
    bne .L_b00
    ldr r1, [r9, #0xd3c]
    cmp r1, #0x0
    cmpne r0, #0x14
    beq .L_b60
.L_b00:
    cmp r0, #0x5
    bne .L_b24
    add r0, r9, #0xc00
    ldrh r0, [r0, #0x68]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xe
    moveq r0, #0x1
    beq .L_b28
.L_b24:
    mov r0, #0x0
.L_b28:
    cmp r0, #0x0
    movne r2, #0x38
    moveq r2, #0x28
    ldr r1, [sp, #0x10c]
    cmp r0, #0x0
    ldr r0, [sp, #0x108]
    ldr r8, [sp, #0x104]
    add sl, r0, r2
    movne r2, #0x38
    moveq r2, #0x28
    sub r5, r1, #0x30
    add r6, r0, r2
    add r7, r1, #0x40
    b .L_c88
.L_b60:
    cmp r0, #0xd
    bne .L_b88
    ldr r0, [sp, #0x108]
    ldr r8, [sp, #0x104]
    add sl, r0, #0x18
    add r6, r0, #0x20
    ldr r0, [sp, #0x10c]
    sub r5, r0, #0x30
    add r7, r0, #0x40
    b .L_c88
.L_b88:
    cmp r0, #0x9
    bne .L_bb0
    ldr r0, [sp, #0x108]
    ldr r8, [sp, #0x104]
    add sl, r0, #0x60
    ldr r0, [sp, #0x10c]
    mov r6, sl
    sub r5, r0, #0x30
    add r7, r0, #0x60
    b .L_c88
.L_bb0:
    ldr r1, [sp, #0x20]
    cmp r1, #0x0
    beq .L_c20
    cmp r0, #0x1
    ldreq r1, [r9, #0xd24]
    cmpeq r1, #0x0
    beq .L_c20
    cmp r0, #0x16
    beq .L_c20
    ldr r0, [r9, #0xc40]
    cmp r0, #0x1e
    blt .L_bfc
    ldr r0, [sp, #0x10c]
    ldr r8, [sp, #0x104]
    mov sl, #0x34
    sub r5, r0, #0x40
    add r7, r0, #0x28
    mov r6, #0x4c
    b .L_c14
.L_bfc:
    ldr r0, [sp, #0x10c]
    ldr r8, [sp, #0x104]
    mov sl, #0x20
    sub r5, r0, #0x30
    add r7, r0, #0x38
    mov r6, #0x38
.L_c14:
    mov r0, #0x1
    str r0, [r9, #0xc44]
    b .L_c88
.L_c20:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_c48
    ldr r0, [sp, #0x10c]
    ldr r8, [sp, #0x104]
    mov sl, #0x10
    sub r5, r0, #0x40
    add r7, r0, #0x58
    mov r6, #0x58
    b .L_c88
.L_c48:
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    beq .L_c70
    ldr r0, [sp, #0x10c]
    ldr r8, [sp, #0x104]
    mov sl, #0x10
    sub r5, r0, #0x40
    add r7, r0, #0x6e
    mov r6, #0x3e
    b .L_c88
.L_c70:
    ldr r0, [sp, #0x10c]
    ldr r8, [sp, #0x104]
    ldr sl, [sp, #0x108]
    sub r5, r0, #0x40
    add r7, r0, #0x60
    mov r6, #0x60
.L_c88:
    ldr r0, [sp, #0x84]
    mov r1, #0x0
    mov r2, r8
    bl func_0202165c
    ldr r0, [sp, #0x84]
    mov r2, sl
    mov r1, #0x1
    bl func_0202165c
    ldr r0, [sp, #0x84]
    mov r2, r5
    mov r1, #0x2
    bl func_0202165c
    ldr r0, [sp, #0x84]
    mov r2, r8
    mov r1, #0x3
    bl func_0202165c
    ldr r0, [sp, #0x84]
    mov r2, r6
    mov r1, #0x4
    bl func_0202165c
    ldr r0, [sp, #0x84]
    mov r2, r7
    mov r1, #0x5
    bl func_0202165c
    mov r0, #0x0
    bl func_020221f8
    orr r1, r0, #0x1
    ldr r0, [r9, #0xcf4]
    cmp r0, #0x0
    orrne r1, r1, #0x2
    biceq r1, r1, #0x2
    mov r0, #0x0
    bl func_020221e0
.L_d0c:
    ldr r0, [r9, #0xc44]
    cmp r0, #0x0
    beq .L_d58
    ldr r2, _LIT7
    ldr r0, [sp, #0x2c]
    cmp r0, r2
    addne r1, r2, #0x1
    cmpne r0, r1
    addne r1, r2, #0x2
    cmpne r0, r1
    beq .L_d48
    ldr r1, _LIT8
    add r0, r0, r1
    cmp r0, #0x2
    bhi .L_d58
.L_d48:
    ldr r0, [r9, #0xc40]
    add r0, r0, #0x1
    str r0, [r9, #0xc40]
    b .L_d60
.L_d58:
    mov r0, #0x0
    str r0, [r9, #0xc40]
.L_d60:
    ldr r0, _LIT0
    bl func_ov002_022a69c0
    mov sl, r0
    ldr r0, _LIT0
    bl func_ov002_022a6aa0
    mov fp, r0
    mov r0, #0x18
    mul r0, fp, r0
    mov r5, #0x0
    mov r6, r0, asr #0x8
.L_d88:
    ldr r0, [r9]
    mov r1, #0x3
    add r2, r5, #0x31
    bl func_0202160c
    mov r7, r0
    ldr r0, [sp, #0x44]
    cmp r0, #0xb
    mov r0, #0x0
    orr r8, r0, #0x3
    bne .L_dd8
    orr r8, r8, #0x40
    bl func_0202c95c
    cmp r0, #0x0
    beq .L_dd0
    ldr r0, _LIT9
    bl func_ov002_022a1674
    cmp r0, #0x0
    bne .L_df8
.L_dd0:
    orr r8, r8, #0x8
    b .L_df8
.L_dd8:
    ldr r0, [sp, #0x44]
    cmp r0, #0x4
    bls .L_df4
    cmp r0, #0x5
    bcc .L_df8
    cmp r0, #0x9
    bhi .L_df8
.L_df4:
    orr r8, r8, #0x80
.L_df8:
    ldr r0, [sp, #0x44]
    mov r1, #0x3
    cmp r0, #0xb
    mov r0, r7
    bne .L_e3c
    ldr r2, [sp, #0x104]
    bl func_0202165c
    ldr r2, [sp, #0x108]
    mov r0, r7
    mov r1, #0x4
    bl func_0202165c
    ldr r2, [sp, #0x10c]
    mov r0, r7
    mov r1, #0x5
    add r2, r2, #0x1
    bl func_0202165c
    b .L_e6c
.L_e3c:
    ldr r2, [sp, #0x104]
    bl func_0202165c
    ldr r2, [sp, #0x108]
    mov r0, r7
    mov r1, #0x4
    add r2, r2, #0x2
    bl func_0202165c
    ldr r2, [sp, #0x10c]
    mov r0, r7
    mov r1, #0x5
    add r2, r2, #0x1
    bl func_0202165c
.L_e6c:
    orr r2, r8, #0x200
    mov r0, r7
    mov r1, #0x0
    bl func_0202165c
    ldr r1, _LIT2
    mov r2, #0x0
.L_e84:
    ldr r0, [r1, r2, lsl #0x3]
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_ea4
    add r2, r2, #0x1
    cmp r2, #0x10
    blt .L_e84
    mov r0, #0x0
.L_ea4:
    cmp r0, #0x0
    ldreq r0, [r9, #0xc54]
    cmpeq r0, #0x0
    ldreq r0, [r9, #0xd3c]
    cmpeq r0, #0x0
    movne r2, #0x0
    bne .L_f08
    cmp r5, sl
    bne .L_ed0
    cmp fp, #0x0
    bge .L_f04
.L_ed0:
    mov r2, #0x0
    b .L_f08
_LIT0: .word data_ov002_022d1330
_LIT1: .word data_ov002_022cd65c
_LIT2: .word data_ov002_022d281c
_LIT3: .word 0x66666667
_LIT4: .word data_ov002_022ccee4
_LIT5: .word data_ov002_022ccef8
_LIT6: .word data_ov002_022d0e4c
_LIT7: .word 0x00001386
_LIT8: .word 0xffffe65d
_LIT9: .word data_ov002_022d10dc
_LIT10: .word data_ov002_022ccf0c
.L_f04:
    mov r2, r6
.L_f08:
    mov r0, r7
    mov r1, #0xb
    bl func_0202165c
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_d88
    ldr r0, _LIT0
    mov r5, #0x0
    add r0, r0, #0x3e0
    str r0, [sp, #0x68]
    mov r0, #0x10
    str r5, [sp, #0x64]
    str r0, [sp, #0x60]
.L_f3c:
    ldr r0, [sp, #0x68]
    mov r8, #0x0
    ldr r0, [r0, #0xa4]
    str r0, [sp, #0x1c]
    cmp r0, #0x8
    movge r0, #0x8
    strge r0, [sp, #0x1c]
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    ble .L_1208
    mvn r0, #0x0
    str r0, [sp, #0x9c]
    add r0, r9, #0x14
    str r0, [sp, #0x98]
.L_f74:
    ldr r0, [sp, #0x68]
    ldr r0, [r0, #0xa8]
    str r0, [sp, #0x90]
    ldr r1, [sp, #0x90]
    ldr r0, [sp, #0x68]
    add r1, r8, r1
    bl func_ov002_0229d950
    str r0, [sp, #0x94]
    ldr r0, [sp, #0x64]
    mov r1, #0x28
    add r2, r8, r0
    ldr r0, [sp, #0x98]
    mla sl, r2, r1, r0
    ldr r0, [r9]
    mov r1, #0x3
    bl func_0202160c
    mov r1, #0x1
    mov r7, r0
    bl func_02021668
    mov r6, r0
    mov r0, #0x0
    orr fp, r0, #0x1
    ldr r0, [sp, #0x94]
    ldrh r0, [r0, #0xa]
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    ldrne r0, [sp, #0x94]
    ldrne r2, [r0, #0xc]
    moveq r2, #0x0
    tst r6, #0x100
    strne r2, [sl, #0x20]
    bicne r6, r6, #0x100
    bne .L_1014
    ldr r0, [sl, #0x20]
    cmp r2, r0
    beq .L_1014
    ldr r1, _LIT10
    mov r0, sl
    bl func_020a9698
    orr fp, fp, #0x100
.L_1014:
    ldr r0, [sp, #0x90]
    mov r1, r5
    add r3, r8, r0
    add r0, sp, #0xec
    str r0, [sp]
    mov r0, r9
    mov r2, #0xb
    bl func_ov002_022b856c
    ldr r0, [r9, #0xc54]
    cmp r0, #0x15
    ldreq r0, [r9, #0xce0]
    cmpeq r0, r5
    bne .L_10a0
    ldr r1, _LIT1
    ldr r3, [r9, #0xcdc]
    ldr r2, [r1, #0x4]
    mov r1, r3, lsl #0x6
    cmp r5, r2
    rsb r2, r1, #0x0
    mov r1, r2, asr #0x7
    add r1, r2, r1, lsr #0x18
    ldr r0, [sp, #0xf0]
    moveq r2, #0x1
    add r0, r0, r1, asr #0x8
    str r0, [sp, #0xf0]
    ldrne r2, [sp, #0x9c]
    mov r0, #0x28
    mul r1, r2, r0
    ldr r2, [r9, #0xcdc]
    ldr r0, [sp, #0xf4]
    mul r3, r2, r1
    mov r1, r3, asr #0x7
    add r1, r3, r1, lsr #0x18
    add r0, r0, r1, asr #0x8
    str r0, [sp, #0xf4]
.L_10a0:
    ldr r2, [sp, #0xec]
    mov r0, r7
    mov r1, #0x3
    bl func_0202165c
    ldr r2, [sp, #0xf0]
    mov r0, r7
    mov r1, #0x4
    bl func_0202165c
    ldr r2, [sp, #0xf4]
    mov r0, r7
    mov r1, #0x5
    bl func_0202165c
    orr r2, fp, #0x200
    mov r0, r7
    mov r1, #0x0
    bl func_0202165c
    mov r2, r6
    mov r0, r7
    mov r1, #0x1
    bl func_0202165c
    ldr r0, [r9, #0xc54]
    cmp r0, #0x2
    beq .L_1110
    ldr r1, [r9, #0xccc]
    cmp r1, #0x0
    bgt .L_1110
    cmp r0, #0xf
    bne .L_1118
.L_1110:
    mov r2, #0x0
    b .L_11ec
.L_1118:
    ldr r1, _LIT1
    ldr r1, [r1, #0x4]
    cmp r5, r1
    bne .L_11c0
    cmp r0, #0x1
    ldr r1, [sp, #0x100]
    mov r2, r1, asr #0x4
    beq .L_1188
    cmp r0, #0x5
    ldreq r1, [r9, #0xcf0]
    cmpeq r1, #0x0
    beq .L_1188
    cmp r0, #0x6
    cmpne r0, #0x9
    cmpne r0, #0xa
    beq .L_1188
    ldr r1, [r9, #0xcd0]
    cmp r1, #0x0
    bgt .L_1188
    cmp r0, #0xb
    beq .L_1188
    cmp r0, #0xe
    ldreq r1, [r9, #0xcf0]
    cmpeq r1, #0x0
    beq .L_1188
    sub r0, r0, #0x10
    cmp r0, #0x3
    bhi .L_1190
.L_1188:
    mov r2, #0x0
    b .L_11ec
.L_1190:
    cmp r2, #0x110
    movge r2, #0x1f
    bge .L_11ec
    cmp r2, #0xf0
    movle r2, #0x0
    ble .L_11ec
    sub r0, r2, #0xf0
    rsb r1, r0, r0, lsl #0x5
    mov r0, r1, asr #0x4
    add r0, r1, r0, lsr #0x1b
    mov r2, r0, asr #0x5
    b .L_11ec
.L_11c0:
    ldrne r1, [sp, #0x24]
    cmpne r1, #0x0
    beq .L_11e8
    ldr r1, [sp, #0x28]
    cmp r1, #0x0
    bne .L_11e8
    sub r0, r0, #0x9
    cmp r0, #0x1
    movls r2, #0x0
    bls .L_11ec
.L_11e8:
    mov r2, #0x1f
.L_11ec:
    mov r0, r7
    mov r1, #0xb
    bl func_0202165c
    ldr r0, [sp, #0x1c]
    add r8, r8, #0x1
    cmp r8, r0
    blt .L_f74
.L_1208:
    cmp r8, #0x8
    bge .L_1274
    add r7, r9, #0x14
    mov fp, #0x0
    mvn sl, #0x0
.L_121c:
    ldr r0, [sp, #0x64]
    mov r1, #0x3
    add r2, r8, r0
    mov r0, #0x28
    mul r0, r2, r0
    strb fp, [r7, r0]
    add r0, r7, r0
    str sl, [r0, #0x20]
    str fp, [r0, #0x24]
    ldr r0, [r9]
    bl func_0202160c
    mov r1, #0x0
    mov r6, r0
    mov r2, r1
    bl func_0202165c
    mov r0, r6
    mov r1, #0x1
    mov r2, #0x0
    bl func_0202165c
    add r8, r8, #0x1
    cmp r8, #0x8
    blt .L_121c
.L_1274:
    add r0, r9, #0x14
    str r0, [sp, #0xa0]
    mvn r0, #0x0
    str r0, [sp, #0xa4]
    add r0, r9, #0xc00
    mov r6, #0x0
    str r0, [sp, #0xc8]
.L_1290:
    cmp r6, #0xb
    beq .L_15f8
    sub r0, r6, #0xa
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_12e8
    b .L_12c0
    b .L_12e8
    b .L_12c8
    b .L_12d0
    b .L_12d8
    b .L_12e0
.L_12c0:
    mov r4, #0xa
    b .L_130c
.L_12c8:
    mov r4, #0xc
    b .L_130c
.L_12d0:
    mov r4, #0xd
    b .L_130c
.L_12d8:
    mov r4, #0xe
    b .L_130c
.L_12e0:
    mov r4, #0xf
    b .L_130c
.L_12e8:
    cmp r6, #0x0
    blt .L_12fc
    cmp r6, #0x4
    movle r4, r6
    ble .L_130c
.L_12fc:
    cmp r6, #0x5
    blt .L_130c
    cmp r6, #0x9
    movle r4, r6
.L_130c:
    ldr r0, _LIT0
    mov r1, r5
    mov r2, r4
    mov r3, #0x0
    bl func_ov002_022a61e8
    mov fp, r0
    sub r0, r4, #0xc
    cmp r0, #0x3
    movls r0, #0x1
    strls r0, [sp, #0x18]
    movhi r0, #0x0
    strhi r0, [sp, #0x18]
    cmp r4, #0x0
    blt .L_1354
    cmp r4, #0x4
    movle r0, #0x1
    strle r0, [sp, #0x14]
    ble .L_135c
.L_1354:
    mov r0, #0x0
    str r0, [sp, #0x14]
.L_135c:
    ldr r0, [sp, #0x60]
    cmp r6, #0xb
    add r2, r6, r0
    ldr r0, [sp, #0xa0]
    subgt r2, r2, #0x1
    mov r1, #0x28
    mla r7, r2, r1, r0
    ldr r0, [r9]
    mov r1, #0x3
    bl func_0202160c
    mov r1, #0x1
    mov sl, r0
    mov r8, #0x0
    bl func_02021668
    str r0, [sp, #0x34]
    ldrsb r0, [fp]
    cmp r0, #0x0
    mov r0, r8
    beq .L_1480
    orr r8, r0, #0x1
    ldrh r0, [fp, #0xa]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    ldrh r0, [fp, #0xa]
    orrne r8, r8, #0x10
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    ldrne r2, [fp, #0xc]
    ldr r0, [sp, #0x34]
    moveq r2, #0x0
    tst r0, #0x100
    beq .L_13ec
    bic r0, r0, #0x100
    str r2, [r7, #0x20]
    str r0, [sp, #0x34]
    b .L_1408
.L_13ec:
    ldr r0, [r7, #0x20]
    cmp r2, r0
    beq .L_1408
    ldr r1, _LIT10
    mov r0, r7
    bl func_020a9698
    orr r8, r8, #0x100
.L_1408:
    ldr r0, [r7, #0x24]
    tst r0, #0x200
    beq .L_1420
    sub r0, r6, #0xc
    cmp r0, #0x3
    bhi .L_1494
.L_1420:
    add r0, sp, #0xec
    str r0, [sp]
    mov r0, r9
    mov r1, r5
    mov r2, r6
    mov r3, #0x0
    bl func_ov002_022b856c
    ldr r2, [sp, #0xec]
    mov r0, sl
    mov r1, #0x3
    bl func_0202165c
    ldr r2, [sp, #0xf0]
    mov r0, sl
    mov r1, #0x4
    bl func_0202165c
    ldr r2, [sp, #0xf4]
    mov r0, sl
    mov r1, #0x5
    bl func_0202165c
    ldr r0, [r7, #0x24]
    orr r8, r8, #0x200
    orr r0, r0, #0x200
    str r0, [r7, #0x24]
    b .L_1494
.L_1480:
    strb r0, [r7]
    ldr r0, [sp, #0xa4]
    str r0, [r7, #0x20]
    mov r0, r8
    str r0, [r7, #0x24]
.L_1494:
    mov r2, r8
    mov r0, sl
    mov r1, #0x0
    bl func_0202165c
    ldr r2, [sp, #0x34]
    mov r0, sl
    mov r1, #0x1
    bl func_0202165c
    ldr r0, [r9, #0xc54]
    cmp r0, #0x2
    beq .L_14cc
    ldr r1, [r9, #0xccc]
    cmp r1, #0x0
    ble .L_14d4
.L_14cc:
    mov r2, #0x0
    b .L_15ec
.L_14d4:
    cmp r0, #0x5
    cmpne r0, #0x9
    cmpne r0, #0xa
    beq .L_1524
    ldr r1, [r9, #0xcd0]
    cmp r1, #0x0
    bgt .L_1524
    cmp r0, #0xb
    ldreq r1, [r9, #0xd38]
    cmpeq r1, #0x0
    beq .L_1524
    cmp r0, #0xe
    ldreq r1, [sp, #0x14]
    cmpeq r1, #0x0
    beq .L_1524
    cmp r0, #0x1
    bne .L_1544
    ldr r1, [r9, #0xd30]
    cmp r1, #0x0
    beq .L_1544
.L_1524:
    ldr r1, [sp, #0x48]
    cmp r1, r5
    ldreq r1, [sp, #0x44]
    cmpeq r1, r4
    ldreq r1, [sp, #0x18]
    cmpeq r1, #0x0
    moveq r2, #0x0
    beq .L_15ec
.L_1544:
    ldr r1, [r9, #0xcd4]
    cmp r1, #0x0
    ble .L_159c
    ldr r1, [sp, #0xc8]
    ldrh r1, [r1, #0x6a]
    mov r2, r1, lsl #0x1f
    cmp r5, r2, lsr #0x1f
    moveq r1, r1, lsl #0x1a
    moveq r1, r1, lsr #0x1b
    cmpeq r1, r4
    beq .L_158c
    ldr r1, [sp, #0xc8]
    ldrh r1, [r1, #0x6c]
    mov r2, r1, lsl #0x1f
    cmp r5, r2, lsr #0x1f
    moveq r1, r1, lsl #0x1a
    cmpeq r4, r1, lsr #0x1b
    bne .L_159c
.L_158c:
    ldr r1, [sp, #0x18]
    cmp r1, #0x0
    moveq r2, #0x0
    beq .L_15ec
.L_159c:
    cmp r0, #0x14
    ldreq r1, [r9, #0xc60]
    cmpeq r1, #0x2
    cmpeq r4, #0xd
    moveq r2, #0x0
    beq .L_15ec
    cmp r0, #0x16
    bne .L_15e8
    ldr r0, [r9, #0xcec]
    cmp r0, #0x0
    beq .L_15e8
    ldr r0, [r9, #0xce8]
    cmp r0, r5
    bne .L_15e8
    ldr r1, [r9, #0xce4]
    mov r0, #0x1
    tst r1, r0, lsl r4
    movne r2, #0x0
    bne .L_15ec
.L_15e8:
    mov r2, #0x1f
.L_15ec:
    mov r0, sl
    mov r1, #0xb
    bl func_0202165c
.L_15f8:
    add r6, r6, #0x1
    cmp r6, #0x10
    blt .L_1290
    ldr r0, [sp, #0x68]
    add r5, r5, #0x1
    add r0, r0, #0xcc
    str r0, [sp, #0x68]
    ldr r0, [sp, #0x64]
    cmp r5, #0x2
    add r0, r0, #0x8
    str r0, [sp, #0x64]
    ldr r0, [sp, #0x60]
    add r0, r0, #0xf
    str r0, [sp, #0x60]
    blt .L_f3c
    add r0, r9, #0x214
    add r0, r0, #0x800
    str r0, [sp, #0xb4]
    ldr r0, _LIT0
    mov r7, #0x0
    add r0, r0, #0x3e0
    str r0, [sp, #0xac]
    add r0, r9, #0xc00
    str r0, [sp, #0xcc]
    ldrh r0, [sp, #0xdc]
    str r0, [sp, #0xa8]
    mvn r0, #0x0
    str r0, [sp, #0xb8]
.L_1668:
    ldr r0, [sp, #0xa8]
    mov r1, #0xcc
    strh r0, [sp, #0xda]
    ldrh r3, [sp, #0xda]
    mov r5, #0x0
    mov r0, r3, lsl #0x1f
    mov r2, r0, lsr #0x1f
    ldr r0, [sp, #0xac]
    str r2, [sp, #0x30]
    mla r0, r2, r1, r0
    str r0, [sp, #0x78]
    mov r0, r2
    str r0, [sp, #0x40]
    mov r0, r3, lsl #0x1a
    mov r6, r0, lsr #0x1b
    mov r0, r3, lsl #0x12
    str r0, [sp, #0xb0]
    cmp r6, #0xb
    mov r4, r6
    bne .L_16cc
    ldr r0, [sp, #0x78]
    ldr r1, [r0, #0xa8]
    ldr r0, [sp, #0xb0]
    rsb r0, r1, r0, lsr #0x18
    b .L_16dc
.L_16cc:
    ldr r0, _LIT11
    mov r1, #0x6
    mla r0, r6, r1, r0
    ldrsh r0, [r0, #0x4]
.L_16dc:
    add r3, r7, r0
    ldr r0, _LIT12
    smull r1, sl, r0, r3
    add sl, sl, r3, lsr #0x1f
    mov r0, #0x3
    smull r1, r2, r0, sl
    sub sl, r3, r1
    ldr r0, [sp, #0xb4]
    mov r1, #0x28
    mla r0, sl, r1, r0
    str r0, [sp, #0x3c]
    ldr r0, [r9]
    mov r1, #0x3
    add r2, sl, #0x2e
    bl func_0202160c
    mov r1, #0x1
    mov fp, r0
    mov r8, #0x0
    bl func_02021668
    str r0, [sp, #0x38]
    cmp r7, #0x0
    bne .L_174c
    add r0, sp, #0x104
    add r1, sp, #0xe0
    mov r2, #0xc
    ldr r5, [sp, #0x8c]
    bl Copy32
    b .L_18a0
.L_174c:
    cmp r6, #0xb
    bne .L_1800
    cmp r7, #0x1
    moveq r1, #0x1
    ldrne r1, [sp, #0xb8]
    ldr r0, [sp, #0xb0]
    add r1, r1, r0, lsr #0x18
    ldr r0, [sp, #0x78]
    ldr r2, [r0, #0xa8]
    cmp r1, r2
    blt .L_18a0
    ldr r3, [r0, #0xa4]
    sub r0, r1, r2
    cmp r3, #0x8
    movge r3, #0x8
    cmp r0, r3
    bge .L_18a0
    ldrh r2, [sp, #0xda]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, lsl #0x18
    bic r2, r2, #0x3fc0
    orr r1, r2, r1, lsr #0x12
    strh r1, [sp, #0xda]
    ldrh r2, [sp, #0xda]
    ldr r0, _LIT0
    mov r1, r2, lsl #0x12
    mov r5, r1, lsr #0x18
    mov r1, r2, lsl #0x1a
    mov r6, r1, lsr #0x1b
    mov r1, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r2, r6
    mov r3, r5
    str r1, [sp, #0x30]
    bl func_ov002_022a61e8
    add r1, sp, #0xe0
    str r1, [sp]
    mov r3, r5
    mov r5, r0
    ldr r1, [sp, #0x30]
    mov r0, r9
    mov r2, r6
    bl func_ov002_022b856c
    b .L_18a0
.L_1800:
    cmp r7, #0x1
    moveq r0, #0x1
    movne r0, r8
    mov r2, r0, lsl #0x1
    ldr r0, _LIT11
    mov r1, #0x6
    mla r0, r4, r1, r0
    ldrsh r4, [r2, r0]
    cmp r4, #0x0
    blt .L_18a0
    ldrh r1, [sp, #0xda]
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0xda]
    ldrh r1, [sp, #0xda]
    ldr r0, _LIT0
    bic r1, r1, #0x3fc0
    strh r1, [sp, #0xda]
    ldrh r2, [sp, #0xda]
    mov r1, r2, lsl #0x12
    mov r5, r1, lsr #0x18
    mov r1, r2, lsl #0x1a
    mov r6, r1, lsr #0x1b
    mov r1, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r2, r6
    mov r3, r5
    str r1, [sp, #0x30]
    bl func_ov002_022a61e8
    add r1, sp, #0xe0
    str r1, [sp]
    mov r3, r5
    mov r5, r0
    ldr r1, [sp, #0x30]
    mov r0, r9
    mov r2, r6
    bl func_ov002_022b856c
.L_18a0:
    cmp r5, #0x0
    ldrnesb r0, [r5]
    cmpne r0, #0x0
    beq .L_1c1c
    sub r0, r4, #0xc
    cmp r0, #0x3
    movls r0, #0x1
    strls r0, [sp, #0x10]
    movhi r0, #0x0
    strhi r0, [sp, #0x10]
    cmp r4, #0x0
    blt .L_18e0
    cmp r4, #0x4
    movle r0, #0x1
    strle r0, [sp, #0xc]
    ble .L_18e8
.L_18e0:
    mov r0, #0x0
    str r0, [sp, #0xc]
.L_18e8:
    cmp r6, #0xb
    orr r8, r8, #0x5
    bne .L_1904
    cmp r7, #0x0
    orreq r8, r8, #0x8
    orr r8, r8, #0x40
    b .L_1918
.L_1904:
    ldr r0, _LIT1
    ldr r1, [r0, #0x4]
    ldr r0, [sp, #0x30]
    cmp r0, r1
    orrne r8, r8, #0x20
.L_1918:
    ldrh r0, [r5, #0xa]
    ldr r2, [sp, #0xe0]
    mov r1, #0x3
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    mov r0, fp
    orrne r8, r8, #0x10
    bl func_0202165c
    ldr r2, [sp, #0xe4]
    mov r0, fp
    mov r1, #0x4
    bl func_0202165c
    ldr r2, [sp, #0xe8]
    mov r0, fp
    mov r1, #0x5
    bl func_0202165c
    mov r0, #0x1
    str r0, [sp, #0x74]
    ldrh r0, [r5, #0xa]
    orr r8, r8, #0x200
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    bne .L_19e0
    mov r0, #0x0
    cmp r7, #0x0
    str r0, [sp, #0x70]
    mov r6, r0
    bne .L_1994
    bl func_0202c95c
    cmp r0, #0x0
    movne r6, #0x1
.L_1994:
    cmp r6, #0x0
    beq .L_19d0
    ldr r0, _LIT1
    ldr r1, [r0, #0x4]
    ldr r0, [sp, #0x40]
    cmp r0, r1
    bne .L_19b8
    cmp r4, #0xd
    bne .L_19c8
.L_19b8:
    ldr r0, _LIT13
    ldr r0, [r0]
    cmp r0, #0x3
    bne .L_19d0
.L_19c8:
    mov r0, #0x1
    str r0, [sp, #0x70]
.L_19d0:
    ldr r0, [sp, #0x70]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x74]
.L_19e0:
    ldr r0, [sp, #0x74]
    cmp r0, #0x0
    ldrne r5, [r5, #0xc]
    ldr r0, [sp, #0x38]
    moveq r5, #0x0
    tst r0, #0x100
    beq .L_1a20
    add r2, r9, sl, lsl #0x2
    bic r0, r0, #0x100
    str r0, [sp, #0x38]
    ldr r1, [r2, #0xc28]
    ldr r0, [sp, #0x3c]
    str r1, [r0, #0x20]
    ldr r0, [r2, #0xc28]
    str r0, [r2, #0xc1c]
    b .L_1a4c
.L_1a20:
    add r0, r9, sl, lsl #0x2
    ldr r0, [r0, #0xc1c]
    cmp r5, r0
    beq .L_1a4c
    ldr r0, [sp, #0x3c]
    ldr r1, _LIT4
    mov r2, r5
    bl func_020a9698
    add r0, r9, sl, lsl #0x2
    str r5, [r0, #0xc28]
    orr r8, r8, #0x100
.L_1a4c:
    ldr r0, [r9, #0xc54]
    cmp r0, #0x2
    beq .L_1a6c
    ldr r1, [r9, #0xccc]
    cmp r1, #0x0
    bgt .L_1a6c
    cmp r0, #0x3
    bne .L_1a7c
.L_1a6c:
    add r1, r9, sl, lsl #0x2
    mov r0, #0x0
    str r0, [r1, #0xd00]
    b .L_1c28
.L_1a7c:
    cmp r0, #0x5
    cmpne r0, #0x9
    cmpne r0, #0xa
    beq .L_1aec
    ldr r1, [r9, #0xcd0]
    cmp r1, #0x0
    bgt .L_1aec
    cmp r0, #0xb
    ldreq r1, [r9, #0xd38]
    cmpeq r1, #0x0
    beq .L_1aec
    cmp r0, #0xe
    ldreq r1, [sp, #0xc]
    cmpeq r1, #0x0
    beq .L_1aec
    cmp r0, #0x1
    bne .L_1acc
    ldr r1, [r9, #0xd30]
    cmp r1, #0x0
    bne .L_1aec
.L_1acc:
    cmp r0, #0x10
    cmpne r0, #0x11
    cmpne r0, #0x12
    cmpne r0, #0x13
    beq .L_1aec
    sub r1, r0, #0x15
    cmp r1, #0x1
    bhi .L_1afc
.L_1aec:
    add r1, r9, sl, lsl #0x2
    mov r0, #0x0
    str r0, [r1, #0xd00]
    b .L_1c28
.L_1afc:
    cmp r7, #0x0
    bne .L_1b78
    ldr r1, [r9, #0xcd4]
    cmp r1, #0x0
    ble .L_1b78
    ldr r1, [sp, #0xcc]
    ldrh r2, [r1, #0x6a]
    ldr r1, [sp, #0x40]
    mov r3, r2, lsl #0x1f
    cmp r1, r3, lsr #0x1f
    moveq r1, r2, lsl #0x1a
    moveq r1, r1, lsr #0x1b
    cmpeq r1, r4
    beq .L_1b54
    ldr r1, [sp, #0xcc]
    ldrh r2, [r1, #0x6c]
    ldr r1, [sp, #0x40]
    mov r3, r2, lsl #0x1f
    cmp r1, r3, lsr #0x1f
    moveq r1, r2, lsl #0x1a
    cmpeq r4, r1, lsr #0x1b
    bne .L_1b78
.L_1b54:
    cmp r4, #0xb
    beq .L_1b78
    ldr r1, [sp, #0x10]
    cmp r1, #0x0
    bne .L_1b78
    add r1, r9, sl, lsl #0x2
    mov r0, #0x0
    str r0, [r1, #0xd00]
    b .L_1c28
.L_1b78:
    cmp r0, #0x14
    ldreq r1, [r9, #0xc60]
    cmpeq r1, #0x2
    cmpeq r4, #0xd
    bne .L_1b9c
    add r1, r9, sl, lsl #0x2
    mov r0, #0x0
    str r0, [r1, #0xd00]
    b .L_1c28
.L_1b9c:
    cmp r0, #0x16
    bne .L_1be0
    ldr r0, [r9, #0xcec]
    cmp r0, #0x0
    beq .L_1be0
    ldr r1, [r9, #0xce8]
    ldr r0, [sp, #0x40]
    cmp r1, r0
    bne .L_1be0
    ldr r1, [r9, #0xce4]
    mov r0, #0x1
    tst r1, r0, lsl r4
    beq .L_1be0
    add r1, r9, sl, lsl #0x2
    mov r0, #0x0
    str r0, [r1, #0xd00]
    b .L_1c28
.L_1be0:
    bl func_0202c95c
    cmp r0, #0x0
    beq .L_1c0c
    ldr r0, _LIT9
    bl func_ov002_022a1674
    cmp r0, #0x0
    beq .L_1c0c
    add r1, r9, sl, lsl #0x2
    mov r0, #0x0
    str r0, [r1, #0xd00]
    b .L_1c28
.L_1c0c:
    add r1, r9, sl, lsl #0x2
    mov r0, #0x1
    str r0, [r1, #0xd00]
    b .L_1c28
.L_1c1c:
    add r1, r9, sl, lsl #0x2
    mov r0, #0x0
    str r0, [r1, #0xd00]
.L_1c28:
    add r0, r9, sl, lsl #0x2
    ldr r1, [r0, #0xd00]
    cmp r1, #0x0
    movne r4, #0x1f
    bne .L_1c74
    ldr r1, [sp, #0x3c]
    mov r2, #0x0
    strb r2, [r1]
    ldr r2, [sp, #0xb8]
    str r2, [r1, #0x20]
    mov r2, #0x0
    str r2, [r1, #0x24]
    ldr r1, [sp, #0xb8]
    mov r8, r2
    str r1, [r0, #0xc1c]
    str r1, [r0, #0xc28]
    mov r0, r2
    str r0, [sp, #0x38]
    mov r4, r2
.L_1c74:
    mov r2, r8
    mov r0, fp
    mov r1, #0x0
    bl func_0202165c
    ldr r2, [sp, #0x38]
    mov r0, fp
    mov r1, #0x1
    bl func_0202165c
    mov r0, fp
    mov r2, r4
    mov r1, #0xb
    bl func_0202165c
    add r7, r7, #0x1
    cmp r7, #0x3
    blt .L_1668
    mov r0, #0x17
    bl func_020221f8
    add r1, r9, #0xc00
    ldrh r3, [r1, #0x72]
    mov r1, r0
    ldr r0, [sp, #0x48]
    mov r2, r3, lsl #0x1f
    cmp r0, r2, lsr #0x1f
    ldreq r0, [sp, #0x44]
    moveq r2, r3, lsl #0x1a
    cmpeq r0, r2, lsr #0x1b
    ldreq r0, [sp, #0x4c]
    moveq r2, r3, lsl #0x12
    cmpeq r0, r2, lsr #0x18
    beq .L_1d00
    ldr r0, [sp, #0x44]
    cmp r0, #0xb
    moveq r1, #0x8
    movne r1, #0x0
    b .L_1d08
.L_1d00:
    cmp r1, #0x0
    subgt r1, r1, #0x1
.L_1d08:
    mov r0, #0x17
    bl func_020221e0
    mov r5, #0x0
    ldrh r1, [sp, #0xdc]
    add r0, r9, #0xc00
    str r5, [sp, #0x6c]
    strh r1, [r0, #0x72]
.L_1d24:
    add r0, r9, #0x2dc
    add r0, r0, #0x800
    add r1, r9, #0x344
    str r0, [sp, #0xc4]
    add r0, r1, #0x400
    str r0, [sp, #0xbc]
    ldr r0, _LIT14
    mov r6, #0x0
    sub r0, r0, #0x1
    str r0, [sp, #0xd4]
    mvn r0, #0x0
    str r0, [sp, #0xc0]
    ldr r0, _LIT14
    add r4, r9, #0xc00
    sub r0, r0, #0x2
    str r0, [sp, #0xd0]
.L_1d64:
    ldr r0, _LIT0
    mov r1, r5
    mov r2, r6
    mov r3, #0x0
    bl func_ov002_022a61e8
    mov r7, r0
    ldr r0, [sp, #0x6c]
    mov r1, #0x28
    add r2, r6, r0
    ldr r0, [sp, #0xbc]
    str r2, [sp, #0x80]
    mla r8, r2, r1, r0
    ldr r0, [r9, #0x4]
    mov r1, #0x3
    bl func_0202160c
    add r1, sp, #0xec
    mov sl, #0x0
    str r1, [sp]
    mov fp, r0
    mov r0, r9
    mov r1, r5
    mov r2, r6
    mov r3, sl
    bl func_ov002_022b856c
    ldrsb r0, [r7]
    cmp r0, #0x0
    beq .L_1f3c
    ldrh r0, [r7, #0xa]
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    beq .L_1f3c
    mov r0, sl
    orr sl, r0, #0x1
    ldr r0, [r9, #0xc54]
    cmp r0, #0x2
    ldreq r0, [sp, #0xc0]
    streq r0, [sp, #0x7c]
    beq .L_1e58
    mov r0, #0x1
    bl func_020221f8
    tst r0, #0x2
    ldrne r0, [sp, #0xc0]
    strne r0, [sp, #0x7c]
    bne .L_1e58
    ldrh r0, [r7, #0xa]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    ldr r0, _LIT1
    moveq r2, #0x1
    ldr r0, [r0, #0x4]
    movne r2, #0x0
    str r8, [sp]
    stmib sp, {r5, r6}
    eor r0, r0, #0x1
    cmp r5, r0
    moveq r3, #0x1
    ldr r1, [r7, #0xc]
    movne r3, #0x0
    mov r0, r9
    bl func_ov002_022b87b4
    str r0, [sp, #0x7c]
.L_1e58:
    ldr r0, [sp, #0x7c]
    cmp r0, #0x0
    blt .L_1eec
    ldr r2, [sp, #0xc4]
    ldr r1, [sp, #0x80]
    mov r0, r8
    add r1, r2, r1, lsl #0x5
    bl func_020aae4c
    cmp r0, #0x0
    beq .L_1e98
    ldr r1, [sp, #0xc4]
    ldr r0, [sp, #0x80]
    orr sl, sl, #0x100
    add r0, r1, r0, lsl #0x5
    mov r1, r8
    bl func_020aad04
.L_1e98:
    ldr r0, [sp, #0x7c]
    orr sl, sl, #0x1000
    tst r0, #0x100
    beq .L_1eb8
    tst r0, #0xff
    moveq r0, #0x2000
    movne r0, #0x4000
    orr sl, sl, r0
.L_1eb8:
    ldr r1, [r7, #0xc]
    ldr r0, [sp, #0xd0]
    cmp r1, r0
    ldrne r0, [sp, #0xd4]
    cmpne r1, r0
    ldrne r0, _LIT14
    cmpne r1, r0
    beq .L_1ee8
    ldr r0, _LIT15
    add r0, r1, r0
    cmp r0, #0x2
    bhi .L_1eec
.L_1ee8:
    orr sl, sl, #0x8000
.L_1eec:
    ldr r0, [r8, #0x24]
    tst r0, #0x200
    bne .L_1f60
    ldr r2, [sp, #0xec]
    mov r0, fp
    mov r1, #0x3
    bl func_0202165c
    ldr r2, [sp, #0xf0]
    mov r0, fp
    mov r1, #0x4
    bl func_0202165c
    ldr r2, [sp, #0xf4]
    mov r0, fp
    mov r1, #0x5
    bl func_0202165c
    ldr r0, [r8, #0x24]
    orr sl, sl, #0x200
    orr r0, r0, #0x200
    str r0, [r8, #0x24]
    b .L_1f60
.L_1f3c:
    ldr r0, [sp, #0x80]
    add r1, r9, r0, lsl #0x5
    mov r0, #0x0
    strb r0, [r8]
    ldr r0, [sp, #0xc0]
    str r0, [r8, #0x20]
    mov r0, #0x0
    str r0, [r8, #0x24]
    strb r0, [r1, #0xadc]
.L_1f60:
    mov r2, sl
    mov r0, fp
    mov r1, #0x0
    bl func_0202165c
    ldr r1, [r9, #0xc54]
    cmp r1, #0x2
    beq .L_1f94
    ldr r0, [r9, #0xccc]
    cmp r0, #0x0
    bgt .L_1f94
    sub r0, r1, #0x11
    cmp r0, #0x2
    bhi .L_1f9c
.L_1f94:
    mov r2, #0x0
    b .L_2130
.L_1f9c:
    ldrh r0, [r4, #0x74]
    mov r1, r0, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    cmpeq r6, r0, lsr #0x1b
    beq .L_1fcc
    ldrh r0, [r4, #0x76]
    mov r1, r0, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    cmpeq r6, r0, lsr #0x1b
    bne .L_1fd4
.L_1fcc:
    mov r2, #0x0
    b .L_2130
.L_1fd4:
    mov r0, #0x1
    bl func_020221f8
    tst r0, #0x2
    movne r2, #0x0
    bne .L_2130
    mov r0, #0x1
    bl func_020221f8
    tst r0, #0x1
    bne .L_2020
    ldr r1, [r9, #0xc54]
    cmp r1, #0x1
    cmpne r1, #0x9
    cmpne r1, #0xa
    beq .L_2020
    ldr r0, [r9, #0xcd0]
    cmp r0, #0x0
    bgt .L_2020
    cmp r1, #0xb
    bne .L_203c
.L_2020:
    ldrh r0, [r4, #0x70]
    mov r1, r0, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    cmpeq r6, r0, lsr #0x1b
    moveq r2, #0x0
    beq .L_2130
.L_203c:
    ldr r0, [r9, #0xcd4]
    cmp r0, #0x0
    ble .L_2084
    ldrh r0, [r4, #0x6a]
    mov r1, r0, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    moveq r0, r0, lsr #0x1b
    cmpeq r0, r6
    beq .L_207c
    ldrh r0, [r4, #0x6c]
    mov r1, r0, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    cmpeq r6, r0, lsr #0x1b
    bne .L_2084
.L_207c:
    mov r2, #0x0
    b .L_2130
.L_2084:
    mov r0, #0x1
    bl func_020221f8
    tst r0, #0x1
    ldreq r0, [r9, #0xc44]
    cmpeq r0, #0x0
    beq .L_2114
    ldr r0, [r9, #0xc48]
    cmp r0, #0x0
    beq .L_2114
    ldrh r0, [r4, #0x70]
    mov r1, r0, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    bne .L_2114
    mov r0, r0, lsl #0x1a
    cmp r6, r0, lsr #0x1b
    mov r0, r0, lsr #0x1b
    beq .L_2114
    cmp r0, #0x4
    bhi .L_2114
    ldr r1, [sp, #0xec]
    ldr r0, [sp, #0xf8]
    subs r0, r1, r0, asr #0x4
    rsbmi r0, r0, #0x0
    cmp r0, #0x24
    movle r2, #0x1f
    ble .L_2130
    cmp r0, #0x48
    movge r2, #0x0
    bge .L_2130
    sub r0, r0, #0x24
    rsb r3, r0, r0, lsl #0x5
    ldr r0, _LIT16
    smull r1, r2, r0, r3
    mov r0, r3, lsr #0x1f
    add r2, r0, r2, asr #0x3
    b .L_2130
.L_2114:
    ldr r0, [sp, #0x100]
    ldr r1, [sp, #0xf4]
    mov r0, r0, asr #0x4
    sub r0, r0, #0x28
    cmp r1, r0
    movgt r2, #0x0
    movle r2, #0x1f
.L_2130:
    mov r0, fp
    mov r1, #0xb
    bl func_0202165c
    add r6, r6, #0x1
    cmp r6, #0x4
    ble .L_1d64
    ldr r0, [sp, #0x6c]
    add r5, r5, #0x1
    add r0, r0, #0x5
    cmp r5, #0x2
    str r0, [sp, #0x6c]
    blt .L_1d24
    ldr r0, [r9, #0x4]
    mov r1, #0x3
    mov r2, #0xa
    bl func_0202160c
    mov r1, #0x1
    mov r6, r0
    mov r7, #0x0
    bl func_02021668
    ldr r1, [r9, #0xc54]
    mov r8, r0
    cmp r1, #0x1
    ldreq r0, [r9, #0xd24]
    cmpeq r0, #0x0
    beq .L_22a4
    cmp r1, #0x3
    cmpne r1, #0x9
    cmpne r1, #0xa
    beq .L_22a4
    ldr r0, [r9, #0xcd0]
    cmp r0, #0x0
    bgt .L_22a4
    cmp r1, #0xb
    ldreq r0, [r9, #0xd38]
    cmpeq r0, #0x0
    beq .L_22a4
    cmp r1, #0x11
    cmpne r1, #0x12
    cmpne r1, #0x13
    beq .L_22a4
    add r0, r9, #0xc00
    ldrh r2, [r0, #0x70]
    ldrh r3, [r0, #0x74]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r3, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    bne .L_2208
    mov r1, r2, lsl #0x1a
    mov r2, r1, lsr #0x1b
    mov r1, r3, lsl #0x1a
    cmp r2, r1, lsr #0x1b
    beq .L_22a4
.L_2208:
    add r1, r9, #0xc00
    ldrh r3, [r1, #0x76]
    mov r2, r3, lsl #0x1f
    cmp r0, r2, lsr #0x1f
    bne .L_2234
    ldrh r2, [r1, #0x70]
    mov r1, r3, lsl #0x1a
    mov r2, r2, lsl #0x1a
    mov r2, r2, lsr #0x1b
    cmp r2, r1, lsr #0x1b
    beq .L_22a4
.L_2234:
    ldr r1, [r9, #0xcd4]
    cmp r1, #0x0
    ble .L_2298
    add r1, r9, #0xc00
    ldrh r3, [r1, #0x6a]
    mov r2, r3, lsl #0x1f
    cmp r0, r2, lsr #0x1f
    bne .L_226c
    ldrh r2, [r1, #0x70]
    mov r1, r3, lsl #0x1a
    mov r2, r2, lsl #0x1a
    mov r2, r2, lsr #0x1b
    cmp r2, r1, lsr #0x1b
    beq .L_22a4
.L_226c:
    add r1, r9, #0xc00
    ldrh r2, [r1, #0x6c]
    mov r3, r2, lsl #0x1f
    cmp r0, r3, lsr #0x1f
    bne .L_2298
    ldrh r1, [r1, #0x70]
    mov r0, r2, lsl #0x1a
    mov r1, r1, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, r0, lsr #0x1b
    beq .L_22a4
.L_2298:
    ldr r0, [r9, #0xcf4]
    cmp r0, #0x0
    beq .L_22d4
.L_22a4:
    mvn r0, #0x0
    str r0, [r9, #0xc34]
    mov r1, #0x0
    str r0, [r9, #0xc38]
    ldrh r4, [sp, #0xdc]
    mov r0, r6
    mov r2, r1
    str r1, [r9, #0xc3c]
    add r3, r9, #0xc00
    strh r4, [r3, #0x70]
    bl func_0202165c
    b .L_24f0
.L_22d4:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_24a8
    ldr r0, [sp, #0x8c]
    ldr r3, [sp, #0x48]
    ldr r1, [r0, #0xc]
    ldr r4, [sp, #0x44]
    mov r0, r9
    mov r2, #0x1
    str r4, [sp]
    bl func_ov002_022b9310
    mov r4, r0
    ldrsh r5, [r4]
    orr r7, r7, #0x1
    mov r0, r5
    bl func_0202e2bc
    cmp r0, #0x0
    ldr r0, [sp, #0x8c]
    orrne r7, r7, #0x2000
    ldrh r0, [r0, #0xa]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    orrne r7, r7, #0x10
    tst r8, #0x800
    ldr r0, [r9, #0xc3c]
    beq .L_235c
    bic r0, r0, #0x10
    tst r7, #0x10
    str r0, [r9, #0xc3c]
    ldrne r0, [r9, #0xc3c]
    bic r8, r8, #0x800
    orrne r0, r0, #0x10
    strne r0, [r9, #0xc3c]
    b .L_2368
.L_235c:
    eor r0, r7, r0
    tst r0, #0x10
    orrne r7, r7, #0x800
.L_2368:
    tst r8, #0x100
    beq .L_2380
    ldr r0, [r9, #0xc38]
    bic r8, r8, #0x100
    str r0, [r9, #0xc34]
    b .L_23c4
.L_2380:
    ldr r1, [r9, #0xc34]
    cmp r5, r1
    strne r5, [r9, #0xc38]
    orrne r7, r7, #0x100
    bne .L_23c4
    ldr r0, [sp, #0x88]
    cmp r0, #0x0
    beq .L_23c4
    ldr r0, [r9, #0xc38]
    cmp r1, r0
    bne .L_23c4
    mov r0, #0x15
    bl func_020221f8
    ldrsh r1, [r4, #0x2]
    cmp r1, r0
    strne r5, [r9, #0xc38]
    orrne r7, r7, #0x100
.L_23c4:
    ldr r0, [r9, #0xcd8]
    cmp r0, #0x0
    bne .L_24f0
    ldrsh r2, [r4, #0x2]
    mov r0, r6
    mov r1, #0xe
    bl func_0202165c
    ldrsh r2, [r4, #0x4]
    mov r0, r6
    mov r1, #0xf
    bl func_0202165c
    ldrb r2, [r4, #0x17]
    mov r0, r6
    mov r1, #0xd
    bl func_0202165c
    ands r5, r7, #0x10
    ldrnesh r2, [r4, #0xc]
    ldr r1, [sp, #0x104]
    mov r0, r6
    ldreqsh r2, [r4, #0x6]
    add r2, r1, r2
    mov r1, #0x3
    bl func_0202165c
    cmp r5, #0x0
    ldrnesh r2, [r4, #0xe]
    ldr r1, [sp, #0x108]
    mov r0, r6
    ldreqsh r2, [r4, #0x8]
    add r2, r1, r2
    mov r1, #0x4
    bl func_0202165c
    cmp r5, #0x0
    ldrnesh r0, [r4, #0x10]
    ldr r2, [sp, #0x10c]
    ldreqsh r0, [r4, #0xa]
    sub r1, r0, #0x6
    add r2, r2, r1
    mov r0, r6
    mov r1, #0x5
    bl func_0202165c
    ldrsh r2, [r4, #0x12]
    mov r0, r6
    mov r1, #0xa
    bl func_0202165c
    ldrh r1, [sp, #0xdc]
    add r0, r9, #0xc00
    orr r7, r7, #0x200
    strh r1, [r0, #0x70]
    b .L_24f0
_LIT11: .word data_ov002_022ccbc8
_LIT12: .word 0x55555556
_LIT13: .word data_ov002_022d0d90
_LIT14: .word 0x00001388
_LIT15: .word 0xffffe65d
_LIT16: .word 0x38e38e39
_LIT17: .word data_ov002_022d1330
_LIT18: .word data_ov002_022cd65c
.L_24a8:
    ldr r0, [r9, #0xcd8]
    cmp r0, #0x0
    bne .L_24dc
    ldrh r2, [sp, #0xdc]
    mvn r0, #0x0
    str r0, [r9, #0xc34]
    bic r1, r2, #0x3e
    str r0, [r9, #0xc38]
    mov r0, #0x0
    str r0, [r9, #0xc3c]
    add r0, r9, #0xc00
    orr r1, r1, #0x3e
    strh r1, [r0, #0x70]
.L_24dc:
    mov r0, #0x1
    bl func_020221f8
    bic r1, r0, #0x1
    mov r0, #0x1
    bl func_020221e0
.L_24f0:
    ldr r0, [r9, #0xd28]
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9, #0xd28]
    ldr r0, [r9, #0xd34]
    orrne r7, r7, #0x4000
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9, #0xd34]
    ldr r0, [r9, #0xcd8]
    orrne r7, r7, #0x8000
    cmp r0, #0x0
    bne .L_2544
    mov r0, r6
    mov r2, r7
    mov r1, #0x0
    bl func_0202165c
    mov r0, r6
    mov r2, r8
    mov r1, #0x1
    bl func_0202165c
.L_2544:
    ldr r0, [r9, #0x4]
    mov r1, #0x3
    mov r2, #0xb
    bl func_0202160c
    ldr r1, [r9, #0xd1c]
    mov r5, r0
    cmp r1, #0x0
    mov r6, #0x0
    beq .L_2640
    sub r3, r6, #0x1
    str r3, [sp]
    ldr r1, [r9, #0xd14]
    mov r0, r9
    mov r2, r6
    bl func_ov002_022b93a8
    mov r4, r0
    ldrsh r2, [r4, #0x2]
    mov r0, r5
    mov r1, #0xe
    orr r6, r6, #0x1
    bl func_0202165c
    ldr r2, [r4, #0x20]
    mov r0, r5
    mov r1, #0xd
    bl func_0202165c
    mov r0, r5
    mov r1, #0x3
    ldr r3, [sp, #0x104]
    ldrsh r2, [r4, #0x8]
    add r2, r3, r2
    bl func_0202165c
    mov r0, r5
    mov r1, #0x4
    ldr r3, [sp, #0x108]
    ldrsh r2, [r4, #0xa]
    add r2, r3, r2
    bl func_0202165c
    mov r0, r5
    mov r1, #0x5
    ldr r3, [sp, #0x10c]
    ldrsh r2, [r4, #0xc]
    add r2, r3, r2
    bl func_0202165c
    mov r0, r5
    mov r1, #0x6
    ldrsh r2, [r4, #0xe]
    bl func_0202165c
    mov r0, r5
    mov r1, #0x7
    ldrsh r2, [r4, #0x10]
    bl func_0202165c
    mov r0, r5
    mov r1, #0x8
    ldrsh r2, [r4, #0x12]
    bl func_0202165c
    mov r0, r5
    mov r1, #0xa
    ldrsh r2, [r4, #0x4]
    bl func_0202165c
    ldrsh r2, [r4, #0x6]
    mov r0, r5
    mov r1, #0xc
    bl func_0202165c
.L_2640:
    mov r0, r5
    mov r2, r6
    mov r1, #0x0
    bl func_0202165c
    ldr r0, [r9, #0xd1c]
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9, #0xd1c]
    ldr r1, [r9, #0xc54]
    mov r0, #0x2
    bl func_020221e0
    ldr r1, [r9, #0xc60]
    mov r0, #0x3
    bl func_020221e0
    ldr r0, _LIT17
    mov r7, #0x28
    ldr r4, _LIT18
    add r8, r0, #0x280
    mov sl, #0x0
    mov r5, #0xb
    mov r6, #0xa
    mov fp, r7
.L_2698:
    ldrsh r1, [r8, #0x56]
    ldr r0, [r4, #0x4]
    cmp r1, #0x28
    movgt r1, r7
    cmp sl, r0
    moveq r0, r6
    movne r0, r5
    bl func_020221e0
    ldrsh r1, [r8, #0x2a]
    ldr r0, [r4, #0x4]
    cmp r1, #0x28
    movgt r1, fp
    cmp sl, r0
    moveq r0, #0xc
    movne r0, #0xd
    bl func_020221e0
    ldrsh r1, [r8, #0x82]
    ldr r0, [r4, #0x4]
    cmp r1, #0x28
    movgt r1, #0x28
    cmp sl, r0
    moveq r0, #0xe
    movne r0, #0xf
    bl func_020221e0
    ldrsh r1, [r8, #0xae]
    ldr r0, [r4, #0x4]
    cmp r1, #0x28
    movgt r1, #0x28
    cmp sl, r0
    moveq r0, #0x10
    movne r0, #0x11
    bl func_020221e0
    add sl, sl, #0x1
    add r8, r8, #0xb0
    cmp sl, #0x2
    blt .L_2698
    ldr r0, [r9, #0x10]
    add r0, r0, #0x1
    str r0, [r9, #0x10]
    add sp, sp, #0x110
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
