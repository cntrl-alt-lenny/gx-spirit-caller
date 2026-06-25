; func_0205af1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021006a0
        .extern data_021006c8
        .extern data_021006f8
        .extern data_02100714
        .extern data_0210071c
        .extern data_0210072c
        .extern data_02100740
        .extern data_0210074c
        .extern data_02100758
        .extern data_02100764
        .extern data_02100788
        .extern data_021007a4
        .extern data_021007ac
        .extern data_021007ec
        .extern data_021007f4
        .extern data_021007fc
        .extern data_02100804
        .extern data_0210080c
        .extern data_02100814
        .extern data_0210081c
        .extern data_02100824
        .extern data_021008f8
        .extern data_02100900
        .extern data_02100930
        .extern data_02100940
        .extern data_0210094c
        .extern data_02100954
        .extern data_0210095c
        .extern data_02100964
        .extern data_0210096c
        .extern data_02100974
        .extern data_0210097c
        .extern func_02045364
        .extern func_02045398
        .extern func_02055268
        .extern func_020584b4
        .extern func_02058560
        .extern func_02059de8
        .extern func_0205b734
        .extern func_0205b938
        .extern func_0205bce4
        .extern func_0205d648
        .extern func_0205d684
        .extern func_0205ff4c
        .extern func_0205ff60
        .extern func_02060250
        .extern func_02060358
        .extern func_020a6c60
        .extern func_020aaf60
        .extern func_020ac368
        .extern func_020acd0c
        .extern func_020b1b88
        .global func_0205af1c
        .arm
func_0205af1c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x26c
    mov r4, r2
    mov sl, r0
    mov fp, r1
    mov r1, r4
    mov r2, #0x1
    ldr r8, [sl]
    bl func_02060358
    cmp r0, #0x0
    addne sp, sp, #0x26c
    movne r0, #0x4
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT0
    mov r0, r4
    mov r2, #0x4
    bl func_020aaf60
    cmp r0, #0x0
    beq .L_78
    ldr r2, _LIT1
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x26c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_78:
    ldr r1, _LIT2
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_02060250
    cmp r0, #0x0
    bne .L_c0
    ldr r2, _LIT1
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x26c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c0:
    add r0, sp, #0x14
    bl func_020acd0c
    mov r9, r0
    cmp r9, #0x0
    bgt .L_e8
    ldr r0, _LIT3
    ldr r1, _LIT4
    ldr r3, _LIT5
    mov r2, #0x0
    bl func_020a6c60
.L_e8:
    add r2, sp, #0x8
    mov r0, sl
    mov r1, r9
    bl func_0205d648
    mov r0, #0x0
    add r6, sp, #0x12c
    mov r1, r0
    mov r2, r0
    mov r3, r0
    mov r5, #0x7
.L_110:
    stmia r6!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    subs r5, r5, #0x1
    bne .L_110
    stmia r6!, {r0, r1, r2, r3}
    add r3, sp, #0x73
    add r1, sp, #0xbb
    add r2, sp, #0x54
    add r5, sp, #0x88
    add r0, sp, #0xda
    str r3, [sp, #0x130]
    add r3, sp, #0x21c
    str r1, [sp, #0x138]
    str r5, [sp, #0x134]
    add r5, sp, #0xf9
    str r0, [sp, #0x13c]
    str r3, [sp, #0x140]
    ldr r1, _LIT6
    mov r0, r4
    mov r3, #0x1f
    str r2, [sp, #0x12c]
    str r5, [sp, #0x1f4]
    bl func_02060250
    cmp r0, #0x0
    ldreq r0, [sp, #0x12c]
    moveq r1, #0x0
    streqb r1, [r0]
    ldr r2, [sp, #0x130]
    ldr r1, _LIT7
    mov r0, r4
    mov r3, #0x15
    bl func_02060250
    cmp r0, #0x0
    ldreq r0, [sp, #0x130]
    moveq r1, #0x0
    streqb r1, [r0]
    ldr r2, [sp, #0x134]
    ldr r1, _LIT8
    mov r0, r4
    mov r3, #0x33
    bl func_02060250
    cmp r0, #0x0
    ldreq r0, [sp, #0x134]
    moveq r1, #0x0
    streqb r1, [r0]
    ldr r2, [sp, #0x138]
    ldr r1, _LIT9
    mov r0, r4
    mov r3, #0x1f
    bl func_02060250
    cmp r0, #0x0
    ldreq r0, [sp, #0x138]
    moveq r1, #0x0
    streqb r1, [r0]
    ldr r2, [sp, #0x13c]
    ldr r1, _LIT10
    mov r0, r4
    mov r3, #0x1f
    bl func_02060250
    cmp r0, #0x0
    ldreq r0, [sp, #0x13c]
    moveq r1, #0x0
    streqb r1, [r0]
    ldr r1, _LIT11
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_02060250
    cmp r0, #0x0
    mvneq r0, #0x0
    streq r0, [sp, #0x144]
    beq .L_23c
    add r0, sp, #0x14
    bl func_020acd0c
    str r0, [sp, #0x144]
.L_23c:
    ldr r2, [sp, #0x140]
    ldr r1, _LIT12
    mov r0, r4
    mov r3, #0x4c
    bl func_02060250
    cmp r0, #0x0
    ldreq r0, [sp, #0x140]
    moveq r1, #0x0
    streqb r1, [r0]
    ldr r1, _LIT13
    add r2, sp, #0x148
    mov r0, r4
    mov r3, #0xb
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    add r2, sp, #0x100
    streqb r0, [sp, #0x148]
    ldr r1, _LIT14
    add r2, r2, #0x53
    mov r0, r4
    mov r3, #0x3
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    streqb r0, [sp, #0x153]
    ldr r1, _LIT15
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x158]
    beq .L_2d8
    add r0, sp, #0x14
    bl func_020ac368
    bl func_020b1b88
    str r0, [sp, #0x158]
.L_2d8:
    ldr r1, _LIT16
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x15c]
    beq .L_30c
    add r0, sp, #0x14
    bl func_020ac368
    bl func_020b1b88
    str r0, [sp, #0x15c]
.L_30c:
    ldr r1, _LIT17
    add r2, sp, #0x160
    mov r0, r4
    mov r3, #0x80
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    streqb r0, [sp, #0x160]
    ldr r1, _LIT18
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x1e0]
    streq r0, [sp, #0x1e4]
    streq r0, [sp, #0x1e8]
    beq .L_388
    add r0, sp, #0x14
    bl func_020acd0c
    add r5, sp, #0x1e8
    mov r1, r0
    add r2, sp, #0x1e0
    add r3, sp, #0x1e4
    mov r0, sl
    str r5, [sp]
    bl func_0205b938
    cmp r0, #0x0
    addne sp, sp, #0x26c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_388:
    ldr r1, _LIT19
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_02060250
    cmp r0, #0x0
    ldreq r0, _LIT20
    streq r0, [sp, #0x1ec]
    beq .L_3d4
    ldrsb r0, [sp, #0x14]
    cmp r0, #0x30
    moveq r0, #0x500
    streq r0, [sp, #0x1ec]
    beq .L_3d4
    cmp r0, #0x31
    ldreq r0, _LIT21
    streq r0, [sp, #0x1ec]
    ldrne r0, _LIT20
    strne r0, [sp, #0x1ec]
.L_3d4:
    ldr r1, _LIT22
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_02060250
    cmp r0, #0x0
    mvneq r0, #0x0
    streq r0, [sp, #0x1f0]
    beq .L_404
    add r0, sp, #0x14
    bl func_020acd0c
    str r0, [sp, #0x1f0]
.L_404:
    ldr r2, [sp, #0x1f4]
    ldr r1, _LIT23
    mov r0, r4
    mov r3, #0x33
    bl func_02060250
    cmp r0, #0x0
    ldreq r0, [sp, #0x1f4]
    moveq r1, #0x0
    streqb r1, [r0]
    ldr r1, _LIT24
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x1f8]
    beq .L_458
    add r0, sp, #0x14
    bl func_020acd0c
    str r0, [sp, #0x1f8]
.L_458:
    ldr r1, _LIT25
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x1fc]
    beq .L_488
    add r0, sp, #0x14
    bl func_020acd0c
    str r0, [sp, #0x1fc]
.L_488:
    ldr r1, _LIT26
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x200]
    beq .L_4b8
    add r0, sp, #0x14
    bl func_020acd0c
    str r0, [sp, #0x200]
.L_4b8:
    ldr r1, _LIT27
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x204]
    beq .L_4e8
    add r0, sp, #0x14
    bl func_020acd0c
    str r0, [sp, #0x204]
.L_4e8:
    ldr r1, _LIT28
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x208]
    beq .L_518
    add r0, sp, #0x14
    bl func_020acd0c
    str r0, [sp, #0x208]
.L_518:
    ldr r1, _LIT29
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x20c]
    beq .L_548
    add r0, sp, #0x14
    bl func_020acd0c
    str r0, [sp, #0x20c]
.L_548:
    ldr r1, _LIT30
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x210]
    beq .L_578
    add r0, sp, #0x14
    bl func_020acd0c
    str r0, [sp, #0x210]
.L_578:
    ldr r1, _LIT31
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x214]
    beq .L_5a8
    add r0, sp, #0x14
    bl func_020acd0c
    str r0, [sp, #0x214]
.L_5a8:
    ldr r1, _LIT32
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x218]
    beq .L_5d8
    add r0, sp, #0x14
    bl func_020acd0c
    str r0, [sp, #0x218]
.L_5d8:
    ldr r1, _LIT33
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_02060250
    cmp r0, #0x0
    bne .L_620
    ldr r2, _LIT1
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x26c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_620:
    ldr r7, [r8, #0x434]
    ldr r6, [r8, #0x100]
    cmp r7, #0x0
    beq .L_680
    mov r5, #0x66
    mov r4, #0x1
.L_638:
    ldr r0, [r7, #0xc]
    cmp r0, r9
    bne .L_674
    ldr r0, [r7]
    cmp r0, #0x65
    bne .L_674
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_66c
    mov r0, sl
    mov r1, r9
    bl func_0205d684
    str r0, [sp, #0x8]
.L_66c:
    mov r6, r4
    str r5, [r7]
.L_674:
    ldr r7, [r7, #0x3c]
    cmp r7, #0x0
    bne .L_638
.L_680:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_6a8
    ldr r0, [r8, #0x100]
    cmp r0, #0x0
    beq .L_6a8
    mov r0, sl
    mov r1, r9
    bl func_0205d684
    str r0, [sp, #0x8]
.L_6a8:
    cmp r6, #0x0
    beq .L_6d8
    ldr r0, [sp, #0x8]
    ldr r0, [r0, #0x18]
    bl func_02045364
    ldr r1, [sp, #0x8]
    mov r2, #0x0
    add r0, sp, #0x14
    str r2, [r1, #0x18]
    bl func_02055268
    ldr r1, [sp, #0x8]
    str r0, [r1, #0x18]
.L_6d8:
    ldr r0, [r8, #0x100]
    cmp r0, #0x0
    beq .L_6f4
    ldr r1, [sp, #0x8]
    add r2, sp, #0x12c
    mov r0, sl
    bl func_02059de8
.L_6f4:
    ldr r1, [fp, #0xc]
    ldr r0, [fp, #0x10]
    cmp r1, #0x0
    str r1, [sp, #0xc]
    str r0, [sp, #0x10]
    beq .L_774
    mov r0, #0x204
    bl func_02045398
    movs r4, r0
    bne .L_734
    ldr r1, _LIT34
    mov r0, sl
    bl func_0205ff4c
    add sp, sp, #0x26c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_734:
    add r0, sp, #0x12c
    mov r1, r4
    bl func_0205b734
    mov r0, #0x0
    str r0, [r4]
    str r9, [r4, #0x4]
    str fp, [sp]
    str r0, [sp, #0x4]
    add r1, sp, #0xc
    mov r0, sl
    mov r3, r4
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    addne sp, sp, #0x26c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_774:
    mov r0, sl
    mov r1, fp
    bl func_0205bce4
    mov r0, #0x0
    add sp, sp, #0x26c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_021008f8
_LIT1: .word data_02100900
_LIT2: .word data_021006c8
_LIT3: .word data_02100930
_LIT4: .word data_02100940
_LIT5: .word 0x0000015a
_LIT6: .word data_02100714
_LIT7: .word data_0210071c
_LIT8: .word data_0210072c
_LIT9: .word data_02100740
_LIT10: .word data_0210074c
_LIT11: .word data_021007ac
_LIT12: .word data_02100758
_LIT13: .word data_02100764
_LIT14: .word data_02100788
_LIT15: .word data_0210094c
_LIT16: .word data_02100954
_LIT17: .word data_0210095c
_LIT18: .word data_021006f8
_LIT19: .word data_021007a4
_LIT20: .word 0x00000502
_LIT21: .word 0x00000501
_LIT22: .word data_02100964
_LIT23: .word data_021007ec
_LIT24: .word data_021007f4
_LIT25: .word data_021007fc
_LIT26: .word data_02100804
_LIT27: .word data_0210080c
_LIT28: .word data_02100814
_LIT29: .word data_0210081c
_LIT30: .word data_02100824
_LIT31: .word data_0210096c
_LIT32: .word data_02100974
_LIT33: .word data_0210097c
_LIT34: .word data_021006a0
