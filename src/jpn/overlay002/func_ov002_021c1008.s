; func_ov002_021c1008 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c6
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d0570
        .extern func_0202b824
        .extern func_0202b83c
        .extern func_0202f994
        .extern func_ov002_021b9dec
        .extern func_ov002_021baf88
        .extern func_ov002_021bb184
        .extern func_ov002_021c19f0
        .extern func_ov002_021c1d40
        .extern func_ov002_021c92ec
        .global func_ov002_021c1008
        .arm
func_ov002_021c1008:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xd4
    mov r4, r0
    ldr r3, _LIT0
    and r6, r4, #0x1
    mul r7, r6, r3
    mov r5, #0x14
    mov r3, r1
    mul r5, r3, r5
    ldr r6, _LIT1
    mov sl, r2
    add r3, r6, r7
    add r3, r3, r5
    ldr r3, [r3, #0x30]
    str r1, [sp]
    mov r2, r3, lsl #0x12
    mov r6, r2, lsr #0x1f
    mov fp, r6
    bl func_ov002_021c19f0
    str r0, [sp, #0x4]
    ldr r0, _LIT2
    ldr r2, [sp, #0x4]
    mov r1, r4
    bl func_ov002_021bb184
    cmp r0, #0x0
    addne sp, sp, #0xd4
    movne r0, r6
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT3
    ldr r0, _LIT4
    add r1, r1, r7
    add r0, r0, r7
    ldr r1, [r5, r1]
    ldrh r7, [r5, r0]
    and r0, r1, #0x1
    eor r6, r6, r0
    cmp r7, #0x0
    beq .L_834
    ldr r0, _LIT5
    sub r0, r0, #0x4c
    str r0, [sp, #0x8]
    ldr r0, _LIT6
    sub r0, r0, #0xf4
    str r0, [sp, #0x20]
    ldr r0, _LIT6
    add r0, r0, #0x1f
    str r0, [sp, #0x30]
    ldr r0, _LIT6
    add r0, r0, #0x5f
    str r0, [sp, #0x1c]
    ldr r0, _LIT6
    add r0, r0, #0x1f
    str r0, [sp, #0x2c]
    ldr r0, _LIT6
    add r0, r0, #0xed
    str r0, [sp, #0x48]
    ldr r0, _LIT5
    sub r0, r0, #0xb0
    str r0, [sp, #0x40]
    ldr r0, _LIT6
    add r0, r0, #0xed
    str r0, [sp, #0x44]
    ldr r0, _LIT5
    sub r0, r0, #0xa0
    str r0, [sp, #0x58]
    ldr r0, _LIT5
    sub r0, r0, #0x22
    str r0, [sp, #0x14]
    ldr r0, _LIT6
    add r0, r0, #0x5f
    str r0, [sp, #0x18]
    ldr r0, _LIT5
    sub r0, r0, #0xb0
    str r0, [sp, #0x3c]
    ldr r0, _LIT5
    sub r0, r0, #0xa0
    str r0, [sp, #0x54]
    ldr r0, _LIT5
    add r0, r0, #0xa7
    str r0, [sp, #0x70]
    ldr r0, _LIT5
    add r0, r0, #0xa7
    str r0, [sp, #0x6c]
    ldr r0, _LIT7
    add r0, r0, #0x1
    str r0, [sp, #0xa4]
    ldr r0, _LIT7
    sub r0, r0, #0x1
    str r0, [sp, #0xa0]
    ldr r0, _LIT8
    sub r0, r0, #0xa8
    str r0, [sp, #0x94]
    ldr r0, _LIT5
    add r0, r0, #0x1c0
    str r0, [sp, #0x84]
    ldr r0, _LIT5
    sub r0, r0, #0xc
    str r0, [sp, #0x80]
    ldr r0, _LIT8
    sub r0, r0, #0x490
    str r0, [sp, #0x7c]
    ldr r0, _LIT5
    sub r0, r0, #0x74
    str r0, [sp, #0x60]
    ldr r0, _LIT9
    sub r0, r0, #0x3b0
    str r0, [sp, #0x5c]
    ldr r0, _LIT5
    sub r0, r0, #0xf0
    str r0, [sp, #0x50]
    ldr r0, _LIT6
    add r0, r0, #0xe8
    str r0, [sp, #0x4c]
    ldr r0, _LIT6
    add r0, r0, #0x39
    str r0, [sp, #0x38]
    ldr r0, _LIT6
    add r0, r0, #0xe
    str r0, [sp, #0x34]
    ldr r0, _LIT6
    sub r0, r0, #0x9c
    str r0, [sp, #0x28]
    ldr r0, _LIT6
    sub r0, r0, #0xf4
    str r0, [sp, #0x24]
    ldr r0, _LIT8
    sub r0, r0, #0x9e
    str r0, [sp, #0x68]
    ldr r0, _LIT8
    sub r0, r0, #0xe6
    str r0, [sp, #0x88]
    ldr r0, _LIT8
    sub r0, r0, #0xe6
    str r0, [sp, #0x8c]
    ldr r0, _LIT9
    add r0, r0, #0x77
    str r0, [sp, #0x90]
    ldr r0, _LIT9
    sub r0, r0, #0x328
    str r0, [sp, #0x10]
    ldr r0, _LIT8
    sub r0, r0, #0x9e
    str r0, [sp, #0x64]
    ldr r0, _LIT8
    sub r0, r0, #0x38
    str r0, [sp, #0x98]
    ldr r0, _LIT8
    sub r0, r0, #0x38
    str r0, [sp, #0x9c]
    ldr r0, _LIT5
    add r0, r0, #0x1c0
    str r0, [sp, #0xbc]
    ldr r0, _LIT8
    sub r0, r0, #0xe6
    str r0, [sp, #0xc4]
    ldr r0, _LIT5
    add r0, r0, #0x1c0
    str r0, [sp, #0xc0]
    ldr r0, _LIT7
    sub r0, r0, #0x820
    str r0, [sp, #0xb4]
    ldr r0, _LIT5
    sub r0, r0, #0x74
    str r0, [sp, #0xa8]
    ldr r0, _LIT5
    sub r0, r0, #0x74
    str r0, [sp, #0xac]
    ldr r0, _LIT7
    sub r0, r0, #0x820
    str r0, [sp, #0xb0]
    ldr r0, _LIT5
    sub r0, r0, #0xf0
    str r0, [sp, #0xb8]
    ldr r0, _LIT8
    sub r0, r0, #0x9b
    str r0, [sp, #0xc8]
    ldr r0, _LIT7
    sub r0, r0, #0xa6
    str r0, [sp, #0xd0]
    ldr r0, _LIT8
    sub r0, r0, #0x9e
    str r0, [sp, #0xcc]
    ldr r0, _LIT8
    sub r0, r0, #0x490
    str r0, [sp, #0x78]
    ldr r0, _LIT5
    sub r0, r0, #0xc
    str r0, [sp, #0x74]
.L_2f0:
    ldr r0, _LIT10
    mov r1, r7, lsl #0x3
    add r5, r0, r7, lsl #0x3
    ldrh r8, [r0, r1]
    ldrh r0, [r5, #0x2]
    ldrh r7, [r5, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b .L_82c
    b .L_82c
    b .L_348
    b .L_82c
    b .L_82c
    b .L_82c
    b .L_350
    b .L_72c
    b .L_72c
    b .L_82c
    b .L_82c
    b .L_60c
.L_348:
    cmp sl, #0x0
    bne .L_82c
.L_350:
    mov r0, r8
    bl func_0202f994
    cmp r0, #0x1
    bne .L_380
    ldr r0, [sp, #0x8]
    bl func_ov002_021baf88
    cmp r0, #0x0
    bne .L_82c
    ldr r0, _LIT5
    bl func_ov002_021baf88
    cmp r0, #0x0
    bne .L_82c
.L_380:
    ldr r0, [sp, #0x10]
    cmp r8, r0
    bgt .L_4ac
    ldr r0, [sp, #0x14]
    cmp r8, r0
    bge .L_5f0
    ldr r0, [sp, #0x18]
    cmp r8, r0
    bgt .L_424
    ldr r0, [sp, #0x1c]
    cmp r8, r0
    bge .L_5f0
    ldr r0, _LIT6
    cmp r8, r0
    bgt .L_3ec
    bge .L_5f0
    ldr r0, [sp, #0x20]
    cmp r8, r0
    bgt .L_3dc
    ldr r0, [sp, #0x24]
    cmp r8, r0
    beq .L_5f0
    b .L_82c
.L_3dc:
    ldr r0, [sp, #0x28]
    cmp r8, r0
    beq .L_5f0
    b .L_82c
.L_3ec:
    ldr r0, [sp, #0x2c]
    cmp r8, r0
    bgt .L_414
    ldr r0, [sp, #0x30]
    cmp r8, r0
    bge .L_5f0
    ldr r0, [sp, #0x34]
    cmp r8, r0
    beq .L_5f0
    b .L_82c
.L_414:
    ldr r0, [sp, #0x38]
    cmp r8, r0
    beq .L_5f0
    b .L_82c
.L_424:
    ldr r0, [sp, #0x3c]
    cmp r8, r0
    bgt .L_474
    ldr r0, [sp, #0x40]
    cmp r8, r0
    bge .L_5f0
    ldr r0, [sp, #0x44]
    cmp r8, r0
    bgt .L_464
    ldr r0, [sp, #0x48]
    cmp r8, r0
    bge .L_5f0
    ldr r0, [sp, #0x4c]
    cmp r8, r0
    beq .L_5f0
    b .L_82c
.L_464:
    ldr r0, [sp, #0x50]
    cmp r8, r0
    beq .L_5f0
    b .L_82c
.L_474:
    ldr r0, [sp, #0x54]
    cmp r8, r0
    bgt .L_49c
    ldr r0, [sp, #0x58]
    cmp r8, r0
    bge .L_5f0
    ldr r0, [sp, #0x5c]
    cmp r8, r0
    beq .L_5f0
    b .L_82c
.L_49c:
    ldr r0, [sp, #0x60]
    cmp r8, r0
    beq .L_5f0
    b .L_82c
.L_4ac:
    ldr r0, [sp, #0x64]
    cmp r8, r0
    bgt .L_564
    ldr r0, [sp, #0x68]
    cmp r8, r0
    bge .L_5f0
    ldr r0, _LIT9
    cmp r8, r0
    bgt .L_52c
    bge .L_5f0
    ldr r0, [sp, #0x6c]
    cmp r8, r0
    bgt .L_51c
    ldr r0, [sp, #0x70]
    cmp r8, r0
    bge .L_5f0
    ldr r0, [sp, #0x74]
    cmp r8, r0
    bgt .L_82c
    ldr r0, [sp, #0x78]
    cmp r8, r0
    blt .L_82c
    ldr r0, [sp, #0x7c]
    cmp r8, r0
    ldrne r0, [sp, #0x80]
    cmpne r8, r0
    beq .L_5f0
    b .L_82c
.L_51c:
    ldr r0, [sp, #0x84]
    cmp r8, r0
    beq .L_5f0
    b .L_82c
.L_52c:
    ldr r0, [sp, #0x88]
    cmp r8, r0
    bgt .L_554
    ldr r0, [sp, #0x8c]
    cmp r8, r0
    bge .L_5f0
    ldr r0, [sp, #0x90]
    cmp r8, r0
    moveq r6, fp
    b .L_82c
.L_554:
    ldr r0, [sp, #0x94]
    cmp r8, r0
    beq .L_5f0
    b .L_82c
.L_564:
    cmp r8, #0x19c0
    bgt .L_5c4
    bge .L_5f0
    ldr r0, [sp, #0x98]
    cmp r8, r0
    bgt .L_5b4
    ldr r0, [sp, #0x9c]
    cmp r8, r0
    bge .L_5fc
    sub r0, r8, #0x18c0
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_82c
    b .L_5f0
    b .L_5f0
    b .L_5f0
    b .L_82c
    b .L_82c
    b .L_82c
    b .L_5f0
.L_5b4:
    ldr r0, _LIT8
    cmp r8, r0
    beq .L_5f0
    b .L_82c
.L_5c4:
    ldr r0, _LIT7
    cmp r8, r0
    bgt .L_5e4
    bge .L_5f0
    ldr r0, [sp, #0xa0]
    cmp r8, r0
    beq .L_5f0
    b .L_82c
.L_5e4:
    ldr r0, [sp, #0xa4]
    cmp r8, r0
    bne .L_82c
.L_5f0:
    ldrh r0, [r5, #0x4]
    and r6, r0, #0x1
    b .L_82c
.L_5fc:
    ldrh r0, [r5, #0x4]
    and r0, r0, #0x1
    rsb r6, r0, #0x1
    b .L_82c
.L_60c:
    cmp sl, #0x0
    bne .L_82c
    mov r0, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r1, r0, #0xff
    mov r0, #0x14
    smulbb r5, r1, r0
    and r9, r8, #0xff
    ldr r1, _LIT0
    ldr r0, _LIT1
    and r2, r9, #0x1
    mla r1, r2, r1, r0
    add r0, r1, #0x30
    str r0, [sp, #0xc]
    ldr r0, [r0, r5]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    addne r8, r1, r5
    ldrneh r1, [r8, #0x38]
    cmpne r1, #0x0
    beq .L_82c
    ldr r1, [r8, #0x40]
    mov r1, r1, lsr #0x6
    tst r1, #0x1
    bne .L_82c
    cmp r4, r9
    movne r1, #0x1
    moveq r1, #0x0
    add r2, r1, #0x1
    ldr r1, [sp, #0x4]
    and r1, r1, r2
    cmp r1, #0x0
    ble .L_6a0
    bl func_0202b824
    cmp r0, #0x17
    bne .L_82c
.L_6a0:
    ldr r0, [sp, #0xc]
    ldr r0, [r0, r5]
    mov r1, r0, lsl #0x13
    ldr r0, [sp, #0xa8]
    cmp r0, r1, lsr #0x13
    mov r0, r1, lsr #0x13
    bcc .L_6f8
    ldr r1, [sp, #0xac]
    cmp r0, r1
    bcs .L_720
    ldr r1, [sp, #0xb0]
    cmp r0, r1
    bhi .L_6e4
    ldr r1, [sp, #0xb4]
    cmp r0, r1
    beq .L_720
    b .L_82c
.L_6e4:
    ldr r1, [sp, #0xb8]
    cmp r0, r1
    ldreq fp, [r8, #0x3c]
    moveq r6, fp
    b .L_82c
.L_6f8:
    ldr r1, [sp, #0xbc]
    cmp r0, r1
    bhi .L_714
    ldr r1, [sp, #0xc0]
    cmp r0, r1
    beq .L_720
    b .L_82c
.L_714:
    ldr r1, [sp, #0xc4]
    cmp r0, r1
    bne .L_82c
.L_720:
    mov fp, r9
    mov r6, r9
    b .L_82c
.L_72c:
    cmp sl, #0x0
    bne .L_82c
    mov r0, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r9, r8, #0xff
    and r8, r0, #0xff
    ldr r1, _LIT0
    ldr r0, _LIT1
    and r2, r9, #0x1
    mla r1, r2, r1, r0
    mov r0, #0x14
    mla r1, r8, r0, r1
    ldr r0, [r1, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r1, #0x38]
    cmpne r0, #0x0
    beq .L_82c
    ldr r0, [r1, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_82c
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b9dec
    ldr r1, [sp, #0xc8]
    cmp r0, r1
    bgt .L_7c0
    ldr r1, [sp, #0xcc]
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_82c
    b .L_7d0
    b .L_7d0
    b .L_7d0
    b .L_7d0
.L_7c0:
    ldr r1, [sp, #0xd0]
    cmp r0, r1
    beq .L_808
    b .L_82c
.L_7d0:
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b9dec
    bl func_0202b83c
    mov r2, r0
    ldr r1, [sp]
    mov r0, r4
    bl func_ov002_021c92ec
    cmp r0, #0x0
    beq .L_82c
    ldrh r0, [r5, #0x4]
    and fp, r0, #0x1
    mov r6, fp
    b .L_82c
.L_808:
    cmp r4, r9
    movne r2, #0x1
    ldr r1, [sp]
    moveq r2, #0x0
    mov r0, r4
    bl func_ov002_021c1d40
    cmp r0, #0x0
    moveq fp, r9
    moveq r6, r9
.L_82c:
    cmp r7, #0x0
    bne .L_2f0
.L_834:
    mov r0, r6
    add sp, sp, #0xd4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00001632
_LIT3: .word data_ov002_022cf0cc
_LIT4: .word data_ov002_022cf0c6
_LIT5: .word 0x000014da
_LIT6: .word 0x000012c3
_LIT7: .word 0x00001b42
_LIT8: .word 0x0000195d
_LIT9: .word 0x000017e0
_LIT10: .word data_ov002_022d0570
