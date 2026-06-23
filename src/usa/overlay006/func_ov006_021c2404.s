; func_ov006_021c2404 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov000_021b1c4c
        .extern data_ov006_021cdd0c
        .extern data_ov006_0224f328
        .extern data_ov006_0225df48
        .extern func_020060f4
        .extern func_02006148
        .extern func_02006160
        .extern func_02006178
        .extern func_020371b8
        .extern func_ov005_021aa3f0
        .extern func_ov006_021b5ee4
        .extern func_ov006_021b69d8
        .extern func_ov006_021c2e28
        .extern func_ov006_021c30c4
        .extern func_ov006_021c33b4
        .extern func_ov006_021c3480
        .extern func_ov006_021c3608
        .extern func_ov006_021c38ec
        .extern func_ov006_021c3b6c
        .extern func_ov006_021c3f1c
        .extern func_ov006_021c3fa4
        .extern func_ov006_021c4160
        .extern func_ov006_021c42b0
        .extern func_ov006_021c4ac8
        .extern func_ov006_021c4bb8
        .extern func_ov006_021c4db8
        .extern func_ov006_021c9df0
        .extern func_ov006_021ca294
        .global func_ov006_021c2404
        .arm
func_ov006_021c2404:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x24
    ldr r1, _LIT0
    mov r7, #0x0
    ldrh r5, [r1, #0x54]
    ldrh r6, [r1, #0x56]
    mov r9, r0
    sub r1, r7, #0x1
    str r1, [r9, #0x98]
    ldr r1, [r9, #0x7c]
    mov r8, r7
    cmp r1, #0x0
    ldr r4, _LIT1
    ldr fp, _LIT2
    ldr sl, _LIT3
    beq .L_6c
    bl func_ov006_021c3fa4
    cmp r0, #0x0
    beq .L_974
    ldr r0, [r9, #0x78]
    cmp r0, #0x0
    movne r7, #0x1
    movne r8, r7
    bne .L_974
    add sp, sp, #0x24
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6c:
    ldr r0, [r9, #0x78]
    cmp r0, #0x0
    beq .L_98
    ldr r0, [r9, #0x4c]
    add r0, r0, #0x1
    str r0, [r9, #0x4c]
    cmp r0, #0x32
    blt .L_974
    add sp, sp, #0x24
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_98:
    ldr r0, [sl]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, r7
    cmp r0, #0x0
    beq .L_17c
    mov r0, sl
    bl func_ov006_021c9df0
    cmp r0, #0x0
    beq .L_974
    ldr r0, [sl, #0x48]
    ldr r1, [sl, #0x4c]
    cmp r0, #0x0
    bne .L_170
    cmp r1, #0xd
    addls pc, pc, r1, lsl #0x2
    b .L_170
    b .L_170
    b .L_170
    b .L_170
    b .L_170
    b .L_170
    b .L_170
    b .L_114
    b .L_114
    b .L_170
    b .L_120
    b .L_12c
    b .L_138
    b .L_170
    b .L_144
.L_114:
    mov r0, #0x1
    str r0, [r9, #0x7c]
    b .L_170
.L_120:
    mov r0, #0x2
    str r0, [r9, #0x7c]
    b .L_170
.L_12c:
    mov r0, #0x3
    str r0, [r9, #0x7c]
    b .L_170
.L_138:
    mov r0, #0x4
    str r0, [r9, #0x7c]
    b .L_170
.L_144:
    mov r1, #0x5
    str r1, [r9, #0x50]
    mov r1, #0x1
    mov r0, fp
    str r1, [r9, #0x74]
    bl func_ov006_021b5ee4
    mov r0, sl
    bl func_ov006_021ca294
    add sp, sp, #0x24
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_170:
    mov r0, sl
    bl func_ov006_021ca294
    b .L_974
.L_17c:
    ldr r0, [r9, #0x68]
    cmp r0, #0x0
    beq .L_974
    bl func_02006178
    cmp r0, #0x0
    bne .L_1a0
    bl func_02006160
    cmp r0, #0x0
    beq .L_4f0
.L_1a0:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_020060f4
    ldr r0, [r9, #0x64]
    add r1, r9, #0x9c
    add r5, r1, r0, lsl #0x4
    ldr r0, [r5, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_1fc
    mov r0, r4
    ldr r6, [r5, #0x4]
    bl func_ov005_021aa3f0
    ldr r0, [r4, #0x4]
    str r0, [r5, #0x4]
    ldr r0, [r4, #0x10]
    str r0, [r5]
    ldr r0, [r5, #0x4]
    cmp r0, r6
    ldr r0, [r4, #0x18]
    movne r7, #0x1
    cmp r0, #0x0
    bne .L_974
.L_1fc:
    ldr r1, [sp, #0x4]
    ldr r2, [sp]
    add r3, sp, #0x18
    mov r0, r9
    bl func_ov006_021c42b0
    bl func_02006148
    cmp r0, #0x0
    beq .L_250
    ldr r0, [sp, #0x18]
    str r0, [r9, #0x88]
    ldr r1, [sp, #0x1c]
    ldr r0, [sp, #0x20]
    str r1, [r9, #0x8c]
    str r0, [r9, #0x90]
    ldr r0, [r9, #0x64]
    add r0, r9, r0, lsl #0x4
    ldr r1, [r0, #0xa0]
    ldr r0, [r0, #0x9c]
    add r0, r1, r0
    str r0, [r9, #0x94]
    b .L_498
.L_250:
    bl func_02006160
    cmp r0, #0x0
    beq .L_498
    ldr sl, [sp, #0x18]
    ldr r0, [r9, #0x88]
    mov r6, #0x0
    cmp sl, r0
    bne .L_28c
    ldr r3, [sp, #0x1c]
    ldr r2, [sp, #0x20]
    ldr r0, [r9, #0x90]
    ldr r1, [r9, #0x8c]
    cmp r2, r0
    cmpeq r3, r1
    moveq r6, #0x1
.L_28c:
    cmp r6, #0x0
    beq .L_498
    cmp sl, #0x1
    bne .L_3e8
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_2b4
    cmp r0, #0x1
    beq .L_338
    b .L_498
.L_2b4:
    ldr r1, [r9, #0x58]
    sub r0, r1, #0x4
    cmp r0, #0x1
    bhi .L_2d8
    mov r0, #0x5
    str r0, [r9, #0x50]
    mov r0, #0x1
    str r0, [r9, #0x74]
    b .L_310
.L_2d8:
    cmp r1, #0x6
    bne .L_310
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x7
    str r0, [r9, #0x7c]
    mov r0, #0xd
    str r0, [r9, #0x80]
    mov r0, #0x0
    str r0, [r9, #0x84]
    b .L_974
.L_310:
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, fp
    bl func_ov006_021b5ee4
    add sp, sp, #0x24
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_338:
    ldr r0, [r9, #0x64]
    cmp r0, #0x0
    add r0, r9, r0, lsl #0x4
    moveq r1, #0x0
    ldr r3, [r0, #0xa0]
    ldr r2, [r0, #0x9c]
    movne r1, #0x1
    add r2, r3, r2
    mov r0, fp
    mov r3, #0x0
    bl func_ov006_021b69d8
    cmp r0, #0x0
    mov r2, #0x0
    mov r3, #0x1
    beq .L_3d8
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
    mov r0, fp
    bl func_ov006_021b5ee4
    mov r0, #0x3
    str r0, [r9, #0x50]
    ldr r0, [r9, #0x64]
    add sp, sp, #0x24
    cmp r0, #0x0
    add r0, r9, r0, lsl #0x4
    moveq r3, #0x0
    ldr r2, [r0, #0xa0]
    ldr r1, [r0, #0x9c]
    movne r3, #0x1
    add r1, r2, r1
    mov r0, r3, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r1, lsr #0x10
    orr r0, r0, r2, lsl #0x10
    str r0, [r9, #0x54]
    mov r0, #0x1
    str r0, [r9, #0x74]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3d8:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_020371b8
    b .L_498
.L_3e8:
    cmp sl, #0x2
    bne .L_434
    ldr r0, [r9, #0x64]
    ldr r2, [r9, #0x94]
    add r0, r9, r0, lsl #0x4
    ldr r1, [r0, #0xa0]
    ldr r0, [r0, #0x9c]
    add r0, r1, r0
    cmp r2, r0
    bne .L_498
    mov r0, r9
    bl func_ov006_021c2e28
    cmp r0, #0x0
    beq .L_498
    mov r0, fp
    bl func_ov006_021b5ee4
    add sp, sp, #0x24
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_434:
    cmp sl, #0x3
    bne .L_498
    ldr r0, [sp, #0x1c]
    ldr r1, [r9, #0x64]
    str r0, [r9, #0x64]
    cmp r0, r1
    beq .L_498
    mov r0, #0x56
    sub r1, r0, #0x57
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, r9
    bl func_ov006_021c30c4
    mov r1, #0x0
    mov r0, r9
    mov r3, r1
    mov r2, #0x1
    bl func_ov006_021c3608
    mov r0, r9
    bl func_ov006_021c4db8
    mov r0, r9
    bl func_ov006_021c4160
    mov r7, #0x1
    mov r8, r7
.L_498:
    ldr r0, [sp, #0x18]
    cmp r0, #0x1
    beq .L_4b0
    cmp r0, #0x2
    beq .L_4bc
    b .L_974
.L_4b0:
    ldr r0, [sp, #0x1c]
    str r0, [r9, #0x98]
    b .L_974
.L_4bc:
    ldr r1, [sp, #0x1c]
    ldr r0, [r5]
    cmp r1, r0
    beq .L_4e4
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r8, #0x1
.L_4e4:
    ldr r0, [sp, #0x1c]
    str r0, [r5]
    b .L_974
.L_4f0:
    tst r5, #0x1
    beq .L_51c
    mov r0, r9
    bl func_ov006_021c2e28
    cmp r0, #0x0
    beq .L_974
    mov r0, fp
    bl func_ov006_021b5ee4
    add sp, sp, #0x24
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_51c:
    tst r5, #0x2
    beq .L_5a8
    ldr r1, [r9, #0x58]
    sub r0, r1, #0x4
    cmp r0, #0x1
    bhi .L_548
    mov r0, #0x5
    str r0, [r9, #0x50]
    mov r0, #0x1
    str r0, [r9, #0x74]
    b .L_580
.L_548:
    cmp r1, #0x6
    bne .L_580
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x7
    str r0, [r9, #0x7c]
    mov r0, #0xd
    str r0, [r9, #0x80]
    mov r0, #0x0
    str r0, [r9, #0x84]
    b .L_974
.L_580:
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, fp
    bl func_ov006_021b5ee4
    add sp, sp, #0x24
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5a8:
    tst r5, #0x400
    beq .L_660
    ldr r0, [r9, #0x64]
    cmp r0, #0x0
    add r0, r9, r0, lsl #0x4
    moveq r1, #0x0
    ldr r3, [r0, #0xa0]
    ldr r2, [r0, #0x9c]
    movne r1, #0x1
    add r2, r3, r2
    mov r0, fp
    mov r3, #0x0
    bl func_ov006_021b69d8
    cmp r0, #0x0
    mov r2, #0x0
    mov r3, #0x1
    beq .L_650
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
    mov r0, fp
    bl func_ov006_021b5ee4
    mov r0, #0x3
    str r0, [r9, #0x50]
    ldr r0, [r9, #0x64]
    add sp, sp, #0x24
    cmp r0, #0x0
    add r0, r9, r0, lsl #0x4
    moveq r3, #0x0
    ldr r2, [r0, #0xa0]
    ldr r1, [r0, #0x9c]
    movne r3, #0x1
    add r1, r2, r1
    mov r0, r3, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r1, lsr #0x10
    orr r0, r0, r2, lsl #0x10
    str r0, [r9, #0x54]
    mov r0, #0x1
    str r0, [r9, #0x74]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_650:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_020371b8
    b .L_974
.L_660:
    tst r5, #0x300
    beq .L_710
    ldr r1, [r9, #0x58]
    ldr r0, _LIT4
    mov r1, r1, lsl #0x2
    ldrsh r0, [r0, r1]
    ldr r1, [r9, #0x64]
    cmp r0, #0x2
    moveq r2, #0x2
    movne r2, #0x1
    tst r5, #0x200
    beq .L_6a4
    subs r0, r1, #0x1
    str r0, [r9, #0x64]
    submi r0, r2, #0x1
    strmi r0, [r9, #0x64]
    b .L_6b8
.L_6a4:
    add r0, r1, #0x1
    str r0, [r9, #0x64]
    cmp r0, r2
    movge r0, #0x0
    strge r0, [r9, #0x64]
.L_6b8:
    ldr r0, [r9, #0x64]
    cmp r0, r1
    beq .L_974
    mov r0, #0x56
    sub r1, r0, #0x57
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, r9
    bl func_ov006_021c30c4
    mov r1, #0x0
    mov r0, r9
    mov r3, r1
    mov r2, #0x1
    bl func_ov006_021c3608
    mov r0, r9
    bl func_ov006_021c4db8
    mov r0, r9
    bl func_ov006_021c4160
    mov r7, #0x1
    mov r8, r7
    b .L_974
.L_710:
    tst r6, #0xf0
    beq .L_974
    ldr r0, [r9, #0x64]
    add r1, r9, #0x9c
    add sl, r1, r0, lsl #0x4
    add r7, sp, #0x8
    ldmia sl, {r0, r1, r2, r3}
    stmia r7, {r0, r1, r2, r3}
    mov r0, r9
    bl func_ov006_021c3f1c
    mov r7, r0
    tst r6, #0x40
    beq .L_7e4
    ldr r0, [sl, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_7bc
    ldr r0, [sl, #0x4]
    cmp r0, #0x0
    ldreq r0, [sl]
    cmpeq r0, #0x0
    bne .L_770
    tst r5, #0x40
    beq .L_940
.L_770:
    ldr r0, [sl]
    subs r0, r0, #0x1
    str r0, [sl]
    bpl .L_940
    ldr r0, [sl, #0x4]
    cmp r0, #0x0
    bne .L_7a0
    ldr r1, [sl, #0x8]
    mov r0, #0x5
    sub r1, r1, #0x6
    stmia sl, {r0, r1}
    b .L_7b4
.L_7a0:
    sub r0, r0, #0x1
    str r0, [sl, #0x4]
    ldr r0, [sl]
    add r0, r0, #0x1
    str r0, [sl]
.L_7b4:
    mov r7, #0x1
    b .L_940
.L_7bc:
    ldr r0, [sl]
    subs r0, r0, #0x1
    str r0, [sl]
    bpl .L_940
    ldr r0, [sl, #0x8]
    cmp r0, #0x0
    moveq r0, #0x0
    subne r0, r0, #0x1
    str r0, [sl]
    b .L_940
.L_7e4:
    tst r6, #0x80
    beq .L_890
    ldr r0, [sl, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_870
    ldr r0, [sl, #0x8]
    ldr r1, [sl, #0x4]
    sub r0, r0, #0x6
    cmp r1, r0
    blt .L_824
    ldr r0, [sl]
    cmp r0, #0x5
    bne .L_824
    tst r5, #0x80
    beq .L_940
.L_824:
    ldr r0, [sl]
    add r0, r0, #0x1
    str r0, [sl]
    cmp r0, #0x6
    blt .L_940
    ldr r0, [sl, #0x8]
    ldr r1, [sl, #0x4]
    sub r0, r0, #0x6
    cmp r1, r0
    movge r0, #0x0
    strge r0, [sl, #0x4]
    bge .L_864
    add r0, r1, #0x1
    str r0, [sl, #0x4]
    ldr r0, [sl]
    sub r0, r0, #0x1
.L_864:
    str r0, [sl]
    mov r7, #0x1
    b .L_940
.L_870:
    ldr r0, [sl]
    add r1, r0, #0x1
    str r1, [sl]
    ldr r0, [sl, #0x8]
    cmp r1, r0
    movge r0, #0x0
    strge r0, [sl]
    b .L_940
.L_890:
    tst r6, #0x20
    beq .L_8dc
    ldr r0, [sl, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    moveq r0, #0x0
    streq r0, [sl]
    beq .L_940
    ldr r0, [sl, #0x4]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sl]
    beq .L_940
    subs r0, r0, #0x6
    str r0, [sl, #0x4]
    movmi r0, #0x0
    strmi r0, [sl, #0x4]
    mov r7, #0x1
    b .L_940
.L_8dc:
    tst r6, #0x10
    beq .L_940
    ldr r0, [sl, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldr r0, [sl, #0x8]
    bne .L_90c
    cmp r0, #0x0
    moveq r0, #0x0
    subne r0, r0, #0x1
    str r0, [sl]
    b .L_940
.L_90c:
    ldr r1, [sl, #0x4]
    sub r0, r0, #0x6
    cmp r1, r0
    movge r0, #0x5
    strge r0, [sl]
    bge .L_940
    add r1, r1, #0x6
    str r1, [sl, #0x4]
    ldr r0, [sl, #0x8]
    mov r7, #0x1
    sub r0, r0, #0x6
    cmp r1, r0
    strge r0, [sl, #0x4]
.L_940:
    ldr r1, [sl]
    ldr r0, [sp, #0x8]
    cmp r1, r0
    ldreq r1, [sl, #0x4]
    ldreq r0, [sp, #0xc]
    cmpeq r1, r0
    beq .L_974
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r8, #0x1
.L_974:
    ldr r0, [r9, #0x64]
    add r1, r9, #0x9c
    add r1, r1, r0, lsl #0x4
    ldr r0, [r1, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_9ac
    ldr r0, [r1, #0x4]
    str r0, [r4, #0x4]
    ldr r0, [r1, #0x8]
    sub r0, r0, #0x6
    str r0, [r4, #0x8]
    ldr r0, [r1]
    str r0, [r4, #0x10]
.L_9ac:
    mov r0, r9
    bl func_ov006_021c3480
    mov r1, #0x1
    mov r0, r9
    mov r3, r1
    mov r2, #0x0
    bl func_ov006_021c3608
    mov r0, r9
    bl func_ov006_021c38ec
    mov r0, r9
    bl func_ov006_021c33b4
    cmp r7, #0x0
    beq .L_9e8
    mov r0, r9
    bl func_ov006_021c4ac8
.L_9e8:
    cmp r8, #0x0
    beq .L_a04
    mov r0, r9
    bl func_ov006_021c4bb8
    mov r0, r9
    mov r1, #0x1
    bl func_ov006_021c3b6c
.L_a04:
    mov r0, #0x0
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104acc
_LIT1: .word data_ov000_021b1c4c
_LIT2: .word data_ov006_0224f328
_LIT3: .word data_ov006_0225df48
_LIT4: .word data_ov006_021cdd0c
