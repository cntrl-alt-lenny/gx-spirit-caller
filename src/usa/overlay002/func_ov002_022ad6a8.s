; func_ov002_022ad6a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov002_022d0eb8
        .extern data_ov002_022d0f34
        .extern func_0202b824
        .extern func_0202b83c
        .extern func_0202b86c
        .extern func_0202e1e0
        .extern func_0207ef74
        .extern func_020b377c
        .extern func_ov002_021afa10
        .extern func_ov002_021afae4
        .extern func_ov002_0229cfa0
        .extern func_ov002_022a15a0
        .extern func_ov002_022a2930
        .extern func_ov002_022abe4c
        .extern func_ov002_022abe84
        .extern func_ov002_022abeb8
        .extern func_ov002_022abeec
        .extern func_ov002_022abf00
        .global func_ov002_022ad6a8
        .arm
func_ov002_022ad6a8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x88
    mov r9, r0
    ldr r1, [r9, #0x38]
    cmp r1, #0x8
    addlt sp, sp, #0x88
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [r9, #0x48]
    cmp r1, #0x0
    beq .L_e24
    bl func_ov002_022abf00
.L_e24:
    ldr r1, _LIT0
    mov r0, #0x1000
    mov r6, #0x0
    mov r5, #0x400
    ldr r8, _LIT1
    ldr sl, _LIT2
    ldr r4, _LIT3
    mov r7, r6
    str r1, [sp, #0x50]
    strh r0, [sp, #0x54]
    rsb r5, r5, #0x0
    add fp, sp, #0x50
.L_e54:
    mov r0, r9
    bl func_ov002_022a15a0
    ldr r1, [sp, #0x50]
    add r0, r0, #0x18
    add r2, r7, #0x3c
    and r0, r0, #0xff
    and r1, r1, r4
    orr r0, r1, r0
    ldrh r1, [sp, #0x54]
    mov r2, r2, lsl #0x17
    orr r0, r0, r2, lsr #0x7
    str r0, [sp, #0x50]
    mov r0, r8, asr #0x6
    and r1, r1, r5
    add r0, r8, r0, lsr #0x19
    orr r1, r1, r0, asr #0x7
    strh r1, [sp, #0x54]
    mov r0, sl
    mov r1, fp
    mov r2, #0x1
    bl func_0207ef74
    add r6, r6, #0x1
    cmp r6, #0x7
    add r7, r7, #0x18
    add r8, r8, #0x100
    blt .L_e54
    ldr r1, _LIT4
    ldr r0, _LIT5
    str r1, [sp, #0x50]
    strh r0, [sp, #0x54]
    ldr r1, [r9, #0x60]
    mvn r4, #0x0
    cmp r1, #0x2
    blt .L_f38
    ldr r0, _LIT6
    sub r4, r1, #0x2
    ldr r0, [r0, #0x38]
    tst r0, #0x4
    beq .L_f38
    mov r0, r9
    bl func_ov002_022a15a0
    mov r1, #0x18
    mul r1, r4, r1
    add r5, r0, #0x18
    add r3, r1, #0x20
    ldr r2, [sp, #0x50]
    ldr r0, _LIT3
    and r1, r5, #0xff
    and r0, r2, r0
    orr r0, r0, r1
    mov r2, r3, lsl #0x17
    orr r3, r0, r2, lsr #0x7
    ldr r0, _LIT2
    add r1, sp, #0x50
    mov r2, #0x1
    str r3, [sp, #0x50]
    bl func_0207ef74
.L_f38:
    ldr r0, [r9, #0x64]
    cmp r4, r0
    beq .L_f90
    mov r0, r9
    bl func_ov002_022a15a0
    ldr r2, [r9, #0x64]
    mov r1, #0x18
    mul r1, r2, r1
    add r4, r0, #0x18
    add r3, r1, #0x20
    ldr r2, [sp, #0x50]
    ldr r0, _LIT3
    and r1, r4, #0xff
    and r0, r2, r0
    orr r0, r0, r1
    mov r2, r3, lsl #0x17
    orr r3, r0, r2, lsr #0x7
    ldr r0, _LIT2
    add r1, sp, #0x50
    mov r2, #0x1
    str r3, [sp, #0x50]
    bl func_0207ef74
.L_f90:
    ldr r1, _LIT7
    mov r0, #0x0
    str r1, [sp, #0x50]
    strh r0, [sp, #0x54]
    bl func_ov002_021afae4
    cmp r0, #0x6
    movgt r0, #0x6
    strgt r0, [sp, #0x4]
    bgt .L_fbc
    bl func_ov002_021afae4
    str r0, [sp, #0x4]
.L_fbc:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    mov r0, #0x0
    str r0, [sp, #0x1c]
    ble .L_1828
    ldr r0, _LIT8
    str r0, [sp, #0x8]
.L_fd8:
    ldr r2, [sp, #0x1c]
    add r0, sp, #0x20
    mov r1, r9
    bl func_ov002_022a2930
    ldr r1, [sp, #0x24]
    ldr r3, [sp, #0x20]
    str r1, [sp, #0x4c]
    ldr r2, [r9, #0x28]
    ldr r1, [sp, #0x1c]
    mov r0, r9
    add r1, r2, r1
    str r3, [sp, #0x48]
    str r1, [sp, #0x18]
    bl func_ov002_022a15a0
    ldr r2, [sp, #0x4c]
    ldr r1, [sp, #0x18]
    add r0, r2, r0
    str r0, [sp, #0x14]
    mov r0, r9
    bl func_ov002_022abe4c
    mov sl, r0
    ldr r1, [sp, #0x18]
    mov r0, r9
    bl func_ov002_022abe84
    mov r5, r0
    tst r5, #0x8000
    movne r0, #0x1
    strne r0, [sp]
    moveq r0, #0x0
    streq r0, [sp]
    ldr r1, [sp, #0x18]
    mov r0, r9
    bl func_ov002_022abeb8
    str r0, [sp, #0x10]
    bl func_ov002_021afa10
    cmp r0, #0x1
    bgt .L_107c
    ldr r1, [r9, #0x4]
    mvn r0, #0x47
    cmp r1, r0
    bne .L_1230
.L_107c:
    ldr r1, [sp, #0x18]
    mov r0, r9
    bl func_ov002_022abeec
    cmp r0, #0x0
    beq .L_1230
    ldr r2, [sp, #0x48]
    ldr r1, [sp, #0x18]
    mov r0, r9
    add r6, r2, #0x2
    bl func_ov002_022abeec
    ldr r3, _LIT9
    mov r1, r0, lsr #0x1f
    smull r2, r7, r3, r0
    add r7, r1, r7, asr #0x5
    mov r3, #0x64
    smull r1, r2, r3, r7
    sub r7, r0, r1
    ldr r0, [sp, #0x14]
    ldr r1, [sp, #0x48]
    add r0, r0, #0x5
    and r8, r0, #0xff
    add r1, r1, #0x2
    ldr r2, _LIT10
    orr r0, r8, #0x400
    mov r1, r1, lsl #0x17
    orr r0, r0, r1, lsr #0x7
    smull r1, r3, r2, r7
    str r0, [sp, #0x40]
    mov r0, r7, lsr #0x1f
    add r3, r0, r3, asr #0x2
    mov r2, #0xa
    smull r0, r1, r2, r3
    sub r3, r7, r0
    mov r0, r3, lsl #0x7
    add r1, r0, #0x3600
    mov r0, r1, asr #0x6
    add r0, r1, r0, lsr #0x19
    mov r0, r0, asr #0x7
    orr r0, r0, #0x5000
    strh r0, [sp, #0x44]
    ldr r0, _LIT2
    add r1, sp, #0x40
    mov r2, #0x1
    bl func_0207ef74
    cmp r7, #0xa
    blt .L_11c0
    mov r4, #0x400
    ldr fp, _LIT10
    rsb r4, r4, #0x0
.L_1140:
    mov r1, r7
    smull r0, r7, fp, r1
    mov r0, r1, lsr #0x1f
    ldr r3, [sp, #0x40]
    ldr r1, _LIT3
    sub r6, r6, #0x4
    and r1, r3, r1
    add r7, r0, r7, asr #0x2
    ldrh r2, [sp, #0x44]
    mov r0, r6, lsl #0x17
    orr r1, r1, r8
    orr r0, r1, r0, lsr #0x7
    str r0, [sp, #0x40]
    and r1, r2, r4
    smull r2, r0, fp, r7
    mov r2, r7, lsr #0x1f
    add r0, r2, r0, asr #0x2
    mov r2, #0xa
    smull r0, r3, r2, r0
    sub r0, r7, r0
    mov r0, r0, lsl #0x7
    add r2, r0, #0x3600
    mov r0, r2, asr #0x6
    add r0, r2, r0, lsr #0x19
    orr r0, r1, r0, asr #0x7
    strh r0, [sp, #0x44]
    ldr r0, _LIT2
    add r1, sp, #0x40
    mov r2, #0x1
    bl func_0207ef74
    cmp r7, #0xa
    bge .L_1140
.L_11c0:
    ldr r0, [sp, #0x14]
    ldr r2, [sp, #0x48]
    sub r1, r0, #0x10
    ldr r0, _LIT6
    and r1, r1, #0xff
    ldr r0, [r0, #0x38]
    sub r2, r2, #0x10
    and r0, r0, #0x10
    cmp r0, #0x0
    movgt r0, #0x1
    orr r1, r1, #0x400
    movle r0, #0x0
    mov r0, r0, lsl #0x9
    mov r2, r2, lsl #0x17
    orr r1, r1, #-2147483648
    orr r1, r1, r2, lsr #0x7
    add r0, r0, #0x1a80
    str r1, [sp, #0x40]
    add r1, r0, #0xc000
    mov r0, r1, asr #0x6
    add r0, r1, r0, lsr #0x19
    mov r0, r0, asr #0x7
    orr r3, r0, #0x3000
    ldr r0, _LIT2
    add r1, sp, #0x40
    mov r2, #0x1
    strh r3, [sp, #0x44]
    bl func_0207ef74
.L_1230:
    ldr r1, [r9, #0x20]
    ldr r0, [sp, #0x18]
    cmp r0, r1
    ldreq r0, [r9, #0x18]
    cmpeq r0, #0x0
    bne .L_1378
    ldr r0, [sp, #0x14]
    ldr r1, [sp, #0x48]
    sub r0, r0, #0x10
    and r0, r0, #0xff
    sub r1, r1, #0x10
    orr r0, r0, #0x400
    mov r3, #0xb000
    mov r1, r1, lsl #0x17
    orr r0, r0, #-2147483648
    orr r2, r0, r1, lsr #0x7
    str r2, [sp, #0x38]
    ldr r0, _LIT2
    add r1, sp, #0x38
    mov r2, #0x1
    strh r3, [sp, #0x3c]
    bl func_0207ef74
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_12c4
    mov r4, #0x1f
    mov r3, #0x18
    mov r2, #0x1c
    mov r1, #0x3
    mov r0, #0x12
    str r3, [sp, #0x74]
    str r4, [sp, #0x70]
    str r2, [sp, #0x78]
    str r4, [sp, #0x7c]
    str r1, [sp, #0x80]
    str r0, [sp, #0x84]
    b .L_12ec
.L_12c4:
    mov r3, #0x0
    mov r2, #0x1f
    mov r1, #0x1e
    mov r0, #0xe
    str r3, [sp, #0x70]
    str r2, [sp, #0x74]
    str r1, [sp, #0x78]
    str r3, [sp, #0x7c]
    str r0, [sp, #0x80]
    str r2, [sp, #0x84]
.L_12ec:
    ldr r0, [r9, #0x60]
    cmp r0, #0x0
    bne .L_1344
    ldr r0, _LIT6
    mov r2, #0x0
    ldr r0, [r0, #0x38]
    add r1, sp, #0x70
    and r0, r0, #0x1f
    subs r0, r0, #0x8
    rsbmi r0, r0, #0x0
    mov r3, r0, lsl #0x5
    cmp r3, #0x100
    movge r3, #0x100
.L_1320:
    ldr r0, [r1, r2, lsl #0x2]
    sub r0, r0, #0x1f
    mul r0, r3, r0
    mov r0, r0, asr #0x8
    add r0, r0, #0x1f
    str r0, [r1, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0x6
    blt .L_1320
.L_1344:
    ldr r1, [sp, #0x70]
    ldr r0, [sp, #0x74]
    ldr r4, [sp, #0x78]
    orr r3, r1, r0, lsl #0x5
    ldr r1, [sp, #0x7c]
    ldr r0, [sp, #0x80]
    ldr r2, [sp, #0x84]
    orr r4, r3, r4, lsl #0xa
    ldr r3, _LIT11
    orr r0, r1, r0, lsl #0x5
    strh r4, [r3]
    orr r0, r0, r2, lsl #0xa
    strh r0, [r3, #-2]
.L_1378:
    ldr r2, [sp, #0x48]
    ldr r0, [sp, #0x14]
    sub r3, r2, #0x10
    sub r1, r0, #0x10
    ldr r2, [sp, #0x50]
    ldr r0, _LIT3
    and r1, r1, #0xff
    and r0, r2, r0
    orr r0, r0, r1
    mov fp, r3, lsl #0x17
    orr r2, r0, fp, lsr #0x7
    ldr r0, _LIT12
    mov r1, sl
    str r2, [sp, #0x50]
    bl func_ov002_0229cfa0
    mov r2, #0x400
    ldrh r3, [sp, #0x54]
    rsb r2, r2, #0x0
    add r1, sp, #0x50
    and r2, r3, r2
    orr r0, r2, r0, lsr #0x7
    strh r0, [sp, #0x54]
    ldr r0, _LIT2
    mov r2, #0x1
    bl func_0207ef74
    ldr r0, [sp, #0x14]
    add r4, r0, #0xf
    ldr r0, [r9, #0x64]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_15e0
    b .L_1414
    b .L_1414
    b .L_1454
    b .L_1454
    b .L_1454
    b .L_1414
    b .L_14a4
    b .L_14a4
.L_1414:
    ldr r0, [sp, #0x8]
    and r2, r4, #0xff
    mov r1, r0, asr #0x6
    add r0, r0, r1, lsr #0x19
    orr r2, r2, #0x6400
    orr r2, r2, #-2147483648
    mov r0, r0, asr #0x7
    orr r3, r0, #0x6000
    orr r2, r2, fp, lsr #0x7
    str r2, [sp, #0x30]
    ldr r0, _LIT2
    add r1, sp, #0x30
    mov r2, #0x1
    strh r3, [sp, #0x34]
    bl func_0207ef74
    b .L_15e0
.L_1454:
    mov r0, sl
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_15e0
    ldr r0, [sp, #0x8]
    and r2, r4, #0xff
    mov r1, r0, asr #0x6
    add r0, r0, r1, lsr #0x19
    orr r2, r2, #0x6400
    orr r2, r2, #-2147483648
    mov r0, r0, asr #0x7
    orr r3, r0, #0x1000
    orr r2, r2, fp, lsr #0x7
    str r2, [sp, #0x30]
    ldr r0, _LIT2
    add r1, sp, #0x30
    mov r2, #0x1
    strh r3, [sp, #0x34]
    bl func_0207ef74
    b .L_15e0
.L_14a4:
    ldr r1, [sp, #0x48]
    and r0, r4, #0xff
    sub r2, r1, #0x8
    orr r1, r0, #0x2400
    mov r2, r2, lsl #0x17
    orr r1, r1, #0x40000000
    orr r1, r1, r2, lsr #0x7
    mov r0, #0x1000
    str r1, [sp, #0x30]
    strh r0, [sp, #0x34]
    ldr r0, [r9, #0x64]
    cmp r0, #0x6
    mov r0, sl
    bne .L_1534
    bl func_0202b83c
    cmp r0, #0x0
    beq .L_15e0
    mov r0, sl
    bl func_0202b83c
    sub r0, r0, #0x1
    mov r0, r0, lsl #0x8
    add r0, r0, #0x2a80
    add r1, r0, #0xc000
    mov r2, #0x400
    mov r0, r1, asr #0x6
    add r1, r1, r0, lsr #0x19
    ldrh r3, [sp, #0x34]
    rsb r2, r2, #0x0
    ldr r0, _LIT2
    and r2, r3, r2
    orr r1, r2, r1, asr #0x7
    strh r1, [sp, #0x34]
    add r1, sp, #0x30
    mov r2, #0x1
    bl func_0207ef74
    b .L_15e0
.L_1534:
    bl func_0202e1e0
    cmp r0, #0x0
    mov r0, sl
    beq .L_158c
    bl func_0202b824
    sub r0, r0, #0x1
    mov r0, r0, lsl #0x8
    add r0, r0, #0x3380
    add r1, r0, #0xc000
    mov r2, #0x400
    mov r0, r1, asr #0x6
    add r1, r1, r0, lsr #0x19
    ldrh r3, [sp, #0x34]
    rsb r2, r2, #0x0
    ldr r0, _LIT2
    and r2, r3, r2
    orr r1, r2, r1, asr #0x7
    strh r1, [sp, #0x34]
    add r1, sp, #0x30
    mov r2, #0x1
    bl func_0207ef74
    b .L_15e0
.L_158c:
    bl func_0202b86c
    cmp r0, #0x0
    beq .L_15e0
    mov r0, sl
    bl func_0202b86c
    sub r0, r0, #0x1
    mov r0, r0, lsl #0x8
    add r0, r0, #0x880
    add r1, r0, #0x10000
    mov r2, #0x400
    mov r0, r1, asr #0x6
    add r1, r1, r0, lsr #0x19
    ldrh r3, [sp, #0x34]
    rsb r2, r2, #0x0
    ldr r0, _LIT2
    and r2, r3, r2
    orr r1, r2, r1, asr #0x7
    strh r1, [sp, #0x34]
    add r1, sp, #0x30
    mov r2, #0x1
    bl func_0207ef74
.L_15e0:
    mov r0, #0x1000
    strh r0, [sp, #0x2c]
    ldr r0, [sp, #0x14]
    ldr r1, _LIT0
    sub r0, r0, #0x1e
    str r1, [sp, #0x28]
    tst r5, #0x3f
    str r0, [sp, #0xc]
    beq .L_1798
    tst r5, #0x1
    mov r1, #0x0
    beq .L_1620
    ldr r0, _LIT13
    add r6, r1, #0x1
    str r0, [sp, #0x58]
    b .L_163c
.L_1620:
    ldr r0, [sp, #0x10]
    add r6, r1, #0x1
    sub r0, r0, #0xb
    mov r0, r0, lsl #0x8
    add r0, r0, #0xe80
    add r0, r0, #0xc000
    str r0, [sp, #0x58]
.L_163c:
    tst r5, #0x80
    beq .L_1658
    ldr r1, _LIT14
    mov r2, r6
    add r0, sp, #0x58
    add r6, r6, #0x1
    str r1, [r0, r2, lsl #0x2]
.L_1658:
    tst r5, #0x40
    beq .L_1674
    ldr r1, _LIT15
    mov r2, r6
    add r0, sp, #0x58
    add r6, r6, #0x1
    str r1, [r0, r2, lsl #0x2]
.L_1674:
    tst r5, #0x300
    beq .L_1690
    ldr r1, _LIT16
    mov r2, r6
    add r0, sp, #0x58
    add r6, r6, #0x1
    str r1, [r0, r2, lsl #0x2]
.L_1690:
    tst r5, #0x400
    beq .L_16ac
    ldr r1, _LIT17
    mov r2, r6
    add r0, sp, #0x58
    add r6, r6, #0x1
    str r1, [r0, r2, lsl #0x2]
.L_16ac:
    tst r5, #0x800
    beq .L_16c8
    ldr r1, _LIT18
    mov r2, r6
    add r0, sp, #0x58
    add r6, r6, #0x1
    str r1, [r0, r2, lsl #0x2]
.L_16c8:
    tst r5, #0x1000
    beq .L_16e4
    ldr r1, _LIT19
    mov r2, r6
    add r0, sp, #0x58
    add r6, r6, #0x1
    str r1, [r0, r2, lsl #0x2]
.L_16e4:
    cmp r6, #0x2
    ble .L_1714
    ldr r0, _LIT6
    sub r1, r6, #0x1
    ldr r0, [r0, #0x38]
    mov r0, r0, asr #0x5
    bl func_020b377c
    add r0, sp, #0x58
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0x4]
    mov r6, #0x2
    str r0, [sp, #0x5c]
.L_1714:
    cmp r6, #0x0
    mov r5, #0x0
    ble .L_1798
    ldr r1, [sp, #0x48]
    ldr r0, [sp, #0xc]
    mov r4, #0x400
    and r8, r0, #0xff
    sub r7, r1, r6, lsl #0x3
    rsb r4, r4, #0x0
    add sl, sp, #0x58
.L_173c:
    ldr r3, [sp, #0x28]
    ldr r1, _LIT3
    add r0, r7, #0x1
    and r1, r3, r1
    ldrh r2, [sp, #0x2c]
    ldr r3, [sl, r5, lsl #0x2]
    mov r0, r0, lsl #0x17
    orr r1, r1, r8
    orr r0, r1, r0, lsr #0x7
    and r1, r2, r4
    mov r2, r3, asr #0x6
    add r2, r3, r2, lsr #0x19
    orr r1, r1, r2, asr #0x7
    str r0, [sp, #0x28]
    strh r1, [sp, #0x2c]
    ldr r0, _LIT2
    add r1, sp, #0x28
    mov r2, #0x1
    bl func_0207ef74
    add r5, r5, #0x1
    add r7, r7, #0xf
    cmp r5, r6
    blt .L_173c
.L_1798:
    ldr r0, [sp]
    ldr r2, [sp, #0x28]
    ldr r1, _LIT20
    mov r0, r0, lsl #0x9
    and r1, r2, r1
    orr r5, r1, #0x4000
    add r0, r0, #0xa80
    add r3, r0, #0xc000
    ldr r0, _LIT3
    orr r5, r5, #-2147483648
    and r5, r5, r0
    ldr r0, [sp, #0xc]
    ldrh r4, [sp, #0x2c]
    ldr r1, _LIT21
    and r0, r0, #0xff
    orr r0, r5, r0
    orr r5, r0, fp, lsr #0x7
    mov r2, r3, asr #0x6
    add r0, r3, r2, lsr #0x19
    and r1, r4, r1, asr #0x15
    orr r3, r1, r0, asr #0x7
    ldr r0, _LIT2
    add r1, sp, #0x28
    mov r2, #0x1
    str r5, [sp, #0x28]
    strh r3, [sp, #0x2c]
    bl func_0207ef74
    ldr r0, [sp, #0x1c]
    add r1, r0, #0x1
    ldr r0, [sp, #0x4]
    str r1, [sp, #0x1c]
    cmp r1, r0
    ldr r0, [sp, #0x8]
    add r0, r0, #0x200
    str r0, [sp, #0x8]
    blt .L_fd8
.L_1828:
    add r0, r9, #0x1f8
    ldr r1, [r0]
    ldr r1, [r1]
    blx r1
    add sp, sp, #0x88
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x40002400
_LIT1: .word 0x0000c380
_LIT2: .word data_ov002_022d0eb8
_LIT3: .word 0xfe00ff00
_LIT4: .word 0x80006400
_LIT5: .word 0x00003183
_LIT6: .word data_02103fcc
_LIT7: .word 0x80002400
_LIT8: .word 0x0000de80
_LIT9: .word 0x51eb851f
_LIT10: .word 0x66666667
_LIT11: .word 0x0500077e
_LIT12: .word data_ov002_022d0f34
_LIT13: .word 0x0000d380
_LIT14: .word 0x0000d480
_LIT15: .word 0x0000d580
_LIT16: .word 0x0000d680
_LIT17: .word 0x0000d780
_LIT18: .word 0x0000d880
_LIT19: .word 0x0000d980
_LIT20: .word 0x3fff3fff
_LIT21: .word 0x80004000
