; func_0200cf6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4914
        .extern data_020bee8c
        .extern data_02186a08
        .extern func_0200ce40
        .extern func_0200cf48
        .extern func_0208e338
        .extern func_02092800
        .extern func_020b2660
        .extern func_020b2b74
        .extern func_020b2c38
        .extern func_020b3074
        .extern func_020b30a8
        .extern func_020b30f0
        .extern func_020b32dc
        .extern func_020b377c
        .global func_0200cf6c
        .arm
func_0200cf6c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xcc
    movs sl, r0
    ldr r0, [sl, #0x27c]
    mov fp, r1
    str r0, [sp, #0x20]
    mov r0, #0x0
    str r0, [sp, #0x18]
    addeq sp, sp, #0xcc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x58
    mul r0, fp, r0
    ldr r2, [sl]
    adds r6, r2, r0
    ldreq r0, [sp, #0x18]
    addeq sp, sp, #0xcc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [sl, #0x70]
    mov r0, #0x1
    tst r1, r0, lsl fp
    ldreq r0, [sp, #0x18]
    addeq sp, sp, #0xcc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sl, #0x60]
    ldrsb r1, [r6, #0x45]
    mov r0, r0, lsl #0x1a
    movs r0, r0, lsr #0x1f
    ldrne r1, [sp, #0x18]
    bne .L_94
    ldrsb r0, [r2, #0x46]
    cmp r0, #0x1
    ldreq r1, [sp, #0x18]
    beq .L_94
    ldr r2, [sl, #0x78]
    mov r0, #0x1
    tst r2, r0, lsl fp
    ldrne r1, [sp, #0x18]
.L_94:
    ldr r0, [sl, #0x7c]
    movs r0, r0, lsr #0x1f
    bne .L_b0
    ldr r0, [sl, #0x60]
    mov r2, r0, lsl #0x18
    movs r2, r2, lsr #0x1f
    bne .L_104
.L_b0:
    ldrsb r0, [r6, #0x41]
    cmp r0, #0x0
    ldrsb r0, [r6, #0x40]
    movne r2, #0x2
    moveq r2, #0x0
    cmp r0, #0x0
    movne r3, #0x1
    ldrsb r0, [r6, #0x42]
    moveq r3, #0x0
    cmp r0, #0x0
    movne r4, #0x4
    ldrsb r0, [r6, #0x43]
    moveq r4, #0x0
    cmp r0, #0x0
    movne r5, #0x8
    orr r0, r3, r2
    moveq r5, #0x0
    orr r0, r4, r0
    orr r0, r5, r0
    str r0, [sp, #0x1c]
    b .L_110
.L_104:
    mov r0, r0, lsl #0xb
    mov r0, r0, lsr #0x1c
    str r0, [sp, #0x1c]
.L_110:
    ldrsb r5, [r6, #0x4b]
    ldrsb r4, [r6, #0x4c]
    ldrsb r3, [r6, #0x4e]
    ldrsb r2, [r6, #0x4f]
    ldrsb r0, [r6, #0x48]
    orr r5, r5, r4, lsl #0x5
    ldrsb r7, [r6, #0x4d]
    orr r3, r3, r2, lsl #0x5
    ldrsb r4, [r6, #0x50]
    orr r2, r5, r7, lsl #0xa
    mov r2, r2, lsl #0x10
    orr r3, r3, r4, lsl #0xa
    mov r3, r3, lsl #0x10
    ldrsb r5, [r6, #0x51]
    ldrsb r4, [r6, #0x52]
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    orr r4, r5, r4, lsl #0x5
    ldrsb r5, [r6, #0x53]
    cmp r0, #0x0
    ldrsb r8, [r6, #0x56]
    orr r4, r4, r5, lsl #0xa
    mov r4, r4, lsl #0x10
    mov r4, r4, lsr #0x10
    ldrsb r7, [r6, #0x54]
    ldrsb r5, [r6, #0x55]
    orr r5, r7, r5, lsl #0x5
    orr r5, r5, r8, lsl #0xa
    mov r5, r5, lsl #0x10
    mov r5, r5, lsr #0x10
    blt .L_198
    ldr r7, [sp, #0x1c]
    cmp r7, #0x0
    ldreq r5, _LIT0
.L_198:
    cmp r0, #0x0
    blt .L_1e0
    ldr r0, [sl, #0x60]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1f
    ldr r0, [sl, #0x60]
    ldrneh r2, [sl, #0x64]
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    ldr r0, [sl, #0x60]
    ldrneh r3, [sl, #0x66]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    ldr r0, [sl, #0x60]
    ldrneh r4, [sl, #0x68]
    mov r0, r0, lsl #0xf
    movs r0, r0, lsr #0x1f
    ldrneh r5, [sl, #0x6a]
.L_1e0:
    ldr r8, [sl, #0x90]
    cmp r8, #0x0
    beq .L_314
    ldr r7, [sl, #0x94]
    mov r0, #0x38
    mla r0, fp, r0, r7
    ldr r7, [r8]
    cmp fp, r7
    bcs .L_314
    ldr r7, [r8, #0x4]
    ldr r7, [r7, fp, lsl #0x2]
    str r7, [sp, #0x14]
    cmp r7, #0x0
    ldrne r7, [r7]
    cmpne r7, #0x0
    beq .L_314
    mov r4, #0x400
    add r9, sp, #0xbc
    add r8, r0, #0x4
    mov r5, #0x0
    rsb r4, r4, #0x0
.L_234:
    ldr r0, [sp, #0x14]
    ldr r0, [r0, #0xc]
    ldr r7, [r0, r5, lsl #0x2]
    mov r0, #0x0
    strb r0, [r9]
    ldr r0, [r8]
    ldrh r1, [r7, #0x2]
    mov r0, r0, lsl #0xc
    mov r0, r0, asr #0x16
    bl func_020b377c
    ldr r1, [r8]
    and r0, r0, r4, lsr #0x16
    and r1, r1, r4
    orr r0, r1, r0
    str r0, [r8]
    mov r1, r0, lsl #0x16
    ldrh r0, [r7]
    mov r2, r1, asr #0x16
    add r5, r5, #0x1
    cmp r0, r1, asr #0x16
    ldrgt r0, [r7, #0x4]
    add r8, r8, #0x4
    ldrgtb r0, [r0, r2]
    strgtb r0, [r9]
    add r9, r9, #0x1
    cmp r5, #0xd
    blt .L_234
    ldrb r3, [sp, #0xbc]
    ldrb r2, [sp, #0xbd]
    ldrb r1, [sp, #0xbf]
    ldrb r0, [sp, #0xc0]
    ldrb r5, [sp, #0xc2]
    ldrb r4, [sp, #0xc3]
    orr r3, r3, r2, lsl #0x5
    ldrb r7, [sp, #0xbe]
    orr r1, r1, r0, lsl #0x5
    ldrb r2, [sp, #0xc1]
    orr r0, r3, r7, lsl #0xa
    mov r0, r0, lsl #0x10
    orr r1, r1, r2, lsl #0xa
    mov r3, r1, lsl #0x10
    ldrb r2, [sp, #0xc5]
    ldrb r1, [sp, #0xc6]
    orr r4, r5, r4, lsl #0x5
    ldrb r5, [sp, #0xc4]
    orr r1, r2, r1, lsl #0x5
    ldrb r2, [sp, #0xc7]
    orr r4, r4, r5, lsl #0xa
    mov r4, r4, lsl #0x10
    orr r1, r1, r2, lsl #0xa
    mov r5, r1, lsl #0x10
    ldrb r1, [sp, #0xc8]
    mov r2, r0, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r4, r4, lsr #0x10
    mov r5, r5, lsr #0x10
.L_314:
    ldr r0, [sl, #0x60]
    mov r0, r0, lsl #0x19
    movs r0, r0, lsr #0x1f
    beq .L_358
    ldr r7, [sl, #0x74]
    mov r0, #0x1
    tst r7, r0, lsl fp
    beq .L_358
    ldr r7, [sl, #0x7c]
    ldr r0, _LIT1
    mov r7, r7, lsl #0x1b
    mov r7, r7, lsr #0x1b
    mul r7, r1, r7
    umull r0, r1, r7, r0
    sub r0, r7, r1
    add r1, r1, r0, lsr #0x1
    mov r1, r1, lsr #0x4
.L_358:
    ldr r0, [sl, #0x60]
    mov r0, r0, lsl #0x1a
    movs r0, r0, lsr #0x1f
    ldreq r0, [sl]
    ldreqsb r0, [r0, #0x46]
    cmpeq r0, #0x0
    bne .L_390
    ldr r7, [sl, #0x78]
    mov r0, #0x1
    tst r7, r0, lsl fp
    cmpeq r1, #0x0
    addeq sp, sp, #0xcc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_390:
    orr r2, r2, r3, lsl #0x10
    ldr r0, _LIT2
    orr r2, r2, #0x8000
    str r2, [r0]
    ldr r2, [sl, #0x60]
    mov r7, r2, lsl #0x10
    movs r7, r7, lsr #0x1f
    bne .L_3bc
    mov r2, r2, lsl #0xf
    movs r2, r2, lsr #0x1f
    beq .L_3d0
.L_3bc:
    orr r2, r4, r5, lsl #0x10
    ldr r0, _LIT3
    orr r2, r2, #0x8000
    str r2, [r0]
    b .L_3d8
.L_3d0:
    orr r2, r4, r5, lsl #0x10
    str r2, [r0, #0x4]
.L_3d8:
    ldr r0, _LIT4
    strh r3, [r0, #0x4]
    ldr r0, [sl, #0x60]
    ldr r3, [sl, #0x7c]
    mov r2, r0, lsl #0x14
    movs r2, r2, lsr #0x1f
    ldr r2, [sl, #0x60]
    movne r0, r0, lsr #0x1e
    mov r2, r2, lsl #0x17
    ldreqsb r0, [r6, #0x44]
    movs r2, r2, lsr #0x1f
    ldrne r2, [sp, #0x18]
    orrne r2, r2, #0x800
    strne r2, [sp, #0x18]
    ldr r2, [sl, #0x60]
    mov r2, r2, lsl #0x16
    movs r2, r2, lsr #0x1f
    ldrne r2, [sp, #0x18]
    orrne r2, r2, #0x8000
    strne r2, [sp, #0x18]
    ldr r2, [sl, #0x7c]
    mov r2, r2, lsl #0xb
    mov r2, r2, lsr #0x1b
    cmp r2, #0x1
    ldreq r2, [sp, #0x18]
    orreq r2, r2, #0x4000
    streq r2, [sp, #0x18]
    mov r2, r3, lsl #0x2
    movs r2, r2, lsr #0x1f
    beq .L_490
    ldr r2, _LIT4
    bic r5, r3, #0x7e0
    ldrsh r4, [r2]
    ldrsh r3, [r2, #0x2]
    add r3, r4, r3
    mov r3, r3, lsl #0x1a
    orr r3, r5, r3, lsr #0x15
    str r3, [sl, #0x7c]
    ldrsh r3, [r2, #0x2]
    add r3, r3, #0x1
    strh r3, [r2, #0x2]
    ldrsh r4, [r2, #0x2]
    ldrsh r3, [r2, #0x6]
    cmp r4, r3
    movge r3, #0x0
    strgeh r3, [r2, #0x2]
.L_490:
    ldr r4, [sl, #0x7c]
    ldr r3, _LIT5
    mov r2, r4, lsl #0xb
    mov r5, r2, lsr #0x1b
    ldr r2, [sp, #0x1c]
    mov r4, r4, lsl #0x15
    orr r2, r2, r5, lsl #0x4
    orr r2, r2, r0, lsl #0x6
    ldr r0, [sp, #0x18]
    mov r4, r4, lsr #0x1a
    orr r0, r0, r2
    orr r0, r0, r4, lsl #0x18
    orr r0, r0, r1, lsl #0x10
    str r0, [r3]
    mov r0, #0x3
    str r0, [r3, #-100]
    mov r8, #0x0
    str r8, [r3, #-80]
    ldr r1, [sl, #0x88]
    cmp r1, #0x0
    ldrne r0, [r1, #0x4]
    cmpne r0, #0x0
    ldrne r2, [r0, fp, lsl #0x2]
    cmpne r2, #0x0
    ldrne r0, [r2]
    cmpne r0, #0x0
    beq .L_834
    ldr r0, [r1]
    cmp fp, r0
    bcs .L_834
    ldr r1, [sl, #0x8c]
    mov r0, #0x18
    mla r5, fp, r0, r1
    ldr r7, [r2, #0x8]
    ldr r9, _LIT6
    add r4, sp, #0xa8
.L_520:
    ldr r1, [r7, r8, lsl #0x2]
    add r0, r5, r8, lsl #0x2
    ldr r2, [r1, #0x8]
    ldrsh r0, [r0, #0x6]
    mov r1, #0x0
    ldr r0, [r2, r0, lsl #0x2]
    str r0, [r4, r8, lsl #0x2]
    bl func_020b2b74
    mov r0, r9
    ldr r1, [r4, r8, lsl #0x2]
    bls .L_560
    bl func_020b30f0
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020b2660
    b .L_56c
.L_560:
    bl func_020b30f0
    mov r1, #0x3f000000
    bl func_020b32dc
.L_56c:
    bl func_020b3074
    add r1, sp, #0x94
    str r0, [r1, r8, lsl #0x2]
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_520
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    ldreqsb r0, [r6, #0x48]
    ldreq r1, [sl, #0x18]
    addeq r4, r1, r0, lsl #0x5
    beq .L_5a8
    ldrsb r1, [r6, #0x48]
    ldr r0, [r0, #0x18]
    add r4, r0, r1, lsl #0x5
.L_5a8:
    ldr r0, [sp, #0xa4]
    bl func_020b30a8
    ldr r1, _LIT7
    bl func_020b2c38
    mov r1, r0
    mov r0, #0x41000000
    bl func_020b30f0
    bl func_020b3074
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    mov r2, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r0, [r4, #0x4]
    ldr r5, [sp, #0xa0]
    str r0, [sp, #0x10]
    ldrsh r0, [r4, #0x6]
    ldr r4, [sp, #0x9c]
    str r0, [sp, #0x50]
    ldr r0, _LIT8
    ldrsh r9, [r0, r2]
    ldrsh r0, [r0, r1]
    mov r1, #0x4
    smull r8, r2, r4, r9
    str r0, [sp, #0x28]
    mov r0, r4, asr #0x1f
    str r0, [sp, #0x24]
    ldr r0, _LIT9
    smull ip, r9, r5, r9
    ldr r7, [r0]
    str r9, [sp, #0x30]
    mov r8, r8, lsr r7
    rsb r3, r7, #0x20
    mov r0, r5, asr #0x1f
    str r0, [sp, #0x2c]
    orr r8, r8, r2, lsl r3
    subs lr, r7, #0x20
    orrgt r8, r8, r2, asr lr
    subs r2, r7, #0x20
    str r2, [sp, #0x48]
    mov r9, ip, lsr r7
    ldr r2, [sp, #0x30]
    str r8, [sp, #0x60]
    orr r9, r9, r2, lsl r3
    ldr r2, [sp, #0x28]
    add r0, sp, #0x60
    smull r2, lr, r4, r2
    mov ip, r2, lsr r7
    ldr r2, [sp, #0x28]
    orr ip, ip, lr, lsl r3
    smull r8, r2, r5, r2
    str r2, [sp, #0x34]
    ldr r2, [sp, #0x48]
    mov r8, r8, lsr r7
    orrgt ip, ip, lr, asr r2
    ldr r2, [sp, #0x34]
    str ip, [sp, #0x5c]
    orr r8, r8, r2, lsl r3
    ldr r2, [sp, #0x30]
    subs r3, r7, #0x20
    orrgt r9, r9, r2, asr r3
    ldr r2, [sp, #0x34]
    subs r3, r7, #0x20
    orrgt r8, r8, r2, asr r3
    str r9, [sp, #0x58]
    str r8, [sp, #0x54]
    bl func_02092800
    add r0, sp, #0x5c
    mov r1, #0x4
    bl func_02092800
    add r0, sp, #0x58
    mov r1, #0x4
    bl func_02092800
    add r0, sp, #0x54
    mov r1, #0x4
    bl func_02092800
    ldr r0, [sp, #0x5c]
    ldr r8, [sp, #0x58]
    str r0, [sp, #0x8]
    str r0, [sp, #0x64]
    ldr r0, [sp, #0x50]
    ldr r1, [sp, #0x10]
    rsb r0, r0, #0x0
    mul r0, r8, r0
    bl func_020b377c
    str r0, [sp, #0x68]
    mov r0, #0x0
    str r0, [sp, #0x6c]
    ldr r0, [sp, #0x60]
    ldr r1, [sp, #0x50]
    str r0, [sp, #0x4]
    mov r2, r0
    ldr r0, [sp, #0x10]
    mul r0, r2, r0
    bl func_020b377c
    ldr r9, [sp, #0x94]
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r0, [sp, #0x70]
    add r1, r2, r1
    sub r2, r4, r1
    ldr r1, [sp, #0x10]
    umull lr, ip, r4, r9
    mul r2, r1, r2
    ldr r1, [sp, #0x54]
    str r2, [sp, #0x38]
    mov r2, #0x0
    sub r0, r8, r1
    str r1, [sp, #0x74]
    add r1, r5, r0
    mov r0, r9, asr #0x1f
    str r0, [sp, #0x3c]
    ldr r3, [sp, #0x3c]
    str r2, [sp, #0x78]
    mla ip, r4, r3, ip
    ldr r3, [sp, #0x24]
    str r2, [sp, #0x7c]
    mla ip, r3, r9, ip
    str r2, [sp, #0x80]
    str r2, [sp, #0x84]
    str r2, [sp, #0x90]
    sub r2, r7, #0x4
    subs r0, r2, #0x20
    str r0, [sp, #0x4c]
    mov r0, #0x2
    add r1, r1, r0, lsl r7
    ldr r0, [sp, #0x50]
    mov r4, lr, lsr r2
    mul r1, r0, r1
    rsb r8, r2, #0x20
    orr r4, r4, ip, lsl r8
    ldr r3, [sp, #0x4c]
    ldr r7, [sp, #0x98]
    orrgt r4, r4, ip, asr r3
    ldr r3, [sp, #0x10]
    str r1, [sp, #0x40]
    mul r4, r3, r4
    mov r1, r7, asr #0x1f
    str r1, [sp, #0x44]
    ldr r3, [sp, #0x38]
    ldr ip, [sp, #0x44]
    rsb r3, r4, r3, lsl #0x3
    umull r9, r4, r5, r7
    mla r4, r5, ip, r4
    ldr r5, [sp, #0x2c]
    str r3, [sp, #0x88]
    mla r4, r5, r7, r4
    mov r5, r9, lsr r2
    subs r3, r2, #0x20
    orr r5, r5, r4, lsl r8
    orrgt r5, r5, r4, asr r3
    ldr r2, [sp, #0x50]
    add r0, sp, #0x64
    mul r3, r2, r5
    ldr r2, [sp, #0x40]
    mov r1, #0x30
    add r2, r3, r2, lsl #0x3
    str r2, [sp, #0x8c]
    bl func_02092800
    add r0, sp, #0x64
    bl func_0208e338
.L_834:
    ldr r0, _LIT10
    mov r1, #0x2
    str r1, [r0]
    ldr r7, [sl, #0x27c]
    mov r1, #0x0
    mov r5, r1
    mov r4, r1
    cmp r7, #0x0
    beq .L_884
    ldrsb r2, [r6, #0x48]
    cmp r2, #0x0
    blt .L_884
    ldr r0, [sp, #0x20]
    ldr r0, [r0, #0x18]
    adds r1, r0, r2, lsl #0x5
    beq .L_8dc
    ldrsb r0, [r1]
    ldr r5, [r1, #0x18]
    str r0, [sp, #0xc]
    b .L_8dc
.L_884:
    ldrsb r8, [r6, #0x48]
    cmp r8, #0x0
    blt .L_8dc
    ldr r0, [sl, #0x18]
    adds r1, r0, r8, lsl #0x5
    beq .L_8dc
    mov r3, sl
    mov r2, #0x0
.L_8a4:
    ldr r0, [r3, #0xdc]
    cmp r8, r0
    bne .L_8c0
    add r1, sl, #0xbc
    mov r0, #0x24
    mla r1, r2, r0, r1
    b .L_8d0
.L_8c0:
    add r2, r2, #0x1
    cmp r2, #0x8
    add r3, r3, #0x24
    blt .L_8a4
.L_8d0:
    ldrsb r0, [r1]
    ldr r5, [r1, #0x18]
    str r0, [sp, #0xc]
.L_8dc:
    cmp r7, #0x0
    beq .L_90c
    ldrsb r3, [r6, #0x47]
    cmp r3, #0x0
    blt .L_90c
    mov r0, #0xc
    mul r2, r3, r0
    ldr r0, [sp, #0x20]
    ldr r0, [r0, #0x1c]
    adds r0, r0, r2
    ldrne r4, [r0, #0x8]
    b .L_958
.L_90c:
    ldrsb r3, [r6, #0x47]
    cmp r3, #0x0
    blt .L_958
    mov r0, #0xc
    mul r0, r3, r0
    ldr r2, [sl, #0x1c]
    adds r2, r2, r0
    beq .L_958
    mov r4, #0x0
.L_930:
    add r0, sl, r4, lsl #0x4
    ldr r0, [r0, #0x1e8]
    cmp r3, r0
    addeq r0, sl, #0x1dc
    addeq r2, r0, r4, lsl #0x4
    beq .L_954
    add r4, r4, #0x1
    cmp r4, #0x8
    blt .L_930
.L_954:
    ldr r4, [r2, #0x8]
.L_958:
    ldr r3, [sl, #0x9c]
    cmp r3, #0x0
    ldrne r2, [sl, #0x98]
    cmpne r2, #0x0
    beq .L_a24
    ldr r0, [sl, #0xa0]
    ldr r8, [r0, fp, lsl #0x3]
    add r0, r0, fp, lsl #0x3
    mov r8, r8, lsl #0x1f
    movs r8, r8, asr #0x1f
    beq .L_a24
    cmp r3, #0x1
    bne .L_a24
    ldr r2, [r2, #0x4]
    ldr r2, [r2, fp, lsl #0x2]
    cmp r2, #0x0
    ldrne r3, [r2]
    cmpne r3, #0x0
    beq .L_a24
    ldr r0, [r0, #0x4]
    ldr r3, [r2, #0x8]
    mov r0, r0, lsl #0x16
    cmp r7, #0x0
    ldrb r4, [r3, r0, asr #0x16]
    beq .L_9d8
    cmp r4, #0x0
    blt .L_9d8
    ldr r1, [sp, #0x20]
    ldr r1, [r1, #0x18]
    add r1, r1, r4, lsl #0x5
    ldr r5, [r1, #0x18]
    b .L_9e4
.L_9d8:
    ldr r3, [sl, #0x18]
    add r3, r3, r4, lsl #0x5
    ldr r5, [r3, #0x18]
.L_9e4:
    ldr r2, [r2, #0xc]
    cmp r7, #0x0
    ldrb r3, [r2, r0, asr #0x16]
    beq .L_a14
    cmp r3, #0x0
    blt .L_a14
    ldr r0, [sp, #0x20]
    ldr r2, [r0, #0x1c]
    mov r0, #0xc
    mla r0, r3, r0, r2
    ldr r4, [r0, #0x8]
    b .L_a24
.L_a14:
    ldr r2, [sl, #0x1c]
    mov r0, #0xc
    mla r0, r3, r0, r2
    ldr r4, [r0, #0x8]
.L_a24:
    ldr r0, [sl, #0x280]
    mov r2, r6
    cmp r0, #0x0
    ldrne r0, [r0, fp, lsl #0x2]
    cmpne r0, #0x0
    movne r3, #0x3
    moveq r3, #0x1
    mov r0, sl
    str r5, [sp]
    bl func_0200ce40
    ldr r1, [sp, #0xc]
    mov r0, r4
    bl func_0200cf48
    mov r0, #0x1
    add sp, sp, #0xcc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00007fff
_LIT1: .word 0x08421085
_LIT2: .word 0x040004c0
_LIT3: .word 0x040004c4
_LIT4: .word data_02186a08
_LIT5: .word 0x040004a4
_LIT6: .word 0x45800000
_LIT7: .word 0x43340000
_LIT8: .word data_020bee8c
_LIT9: .word data_020b4914
_LIT10: .word 0x04000440
