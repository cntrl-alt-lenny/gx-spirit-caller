; func_ov002_02246fdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cabc0
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf0c4
        .extern func_0202e1e0
        .extern func_ov002_021bc1a8
        .extern func_ov002_021bc5e4
        .extern func_ov002_021bc7e8
        .extern func_ov002_021c1c48
        .extern func_ov002_021c37e4
        .extern func_ov002_021c3a04
        .extern func_ov002_021c8400
        .extern func_ov002_02247588
        .global func_ov002_02246fdc
        .arm
func_ov002_02246fdc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xbc
    mov sl, r0
    ldrh r5, [sl, #0x8]
    ldr r0, _LIT0
    str r2, [sp]
    ldr r0, [r0, r5, lsl #0x2]
    ldr r4, _LIT1
    mov r2, r0, lsl #0x13
    ldr r0, [sp]
    mov fp, r1
    cmp r0, #0xb
    ldr r0, [r4, #0x5ac]
    str r3, [sp, #0x4]
    str r0, [sp, #0x10]
    ldr r0, [r4, #0x5b0]
    mov r5, r2, lsr #0x13
    str r0, [sp, #0x8]
    bne .L_114
    ldr r2, _LIT2
    ldr r0, _LIT3
    and r1, fp, #0x1
    mla r0, r1, r0, r2
    add r1, r0, #0x120
    mov r0, r3
    ldr r3, [r1, r0, lsl #0x2]
    mov r0, fp
    mov r1, r3, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    add r4, r1, r2, lsr #0x1f
    mov r2, r3, lsl #0x13
    mov r1, r4
    mov r6, r2, lsr #0x13
    bl func_ov002_021c37e4
    ldrh r1, [sl, #0x2]
    mov r7, r0
    mov r0, r1, lsl #0x1f
    cmp fp, r0, lsr #0x1f
    mov r0, r0, lsr #0x1f
    addne sp, sp, #0xbc
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r1, [sl, #0xa]
    cmp r1, #0x0
    bne .L_d0
    bl func_ov002_021bc5e4
    cmp r0, #0x0
    addlt sp, sp, #0xbc
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d0:
    mov r0, r6
    bl func_0202e1e0
    cmp r0, #0x0
    addeq sp, sp, #0xbc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r6, r5
    bne .L_23c
    mov r1, r6, lsl #0x10
    mov r0, fp
    mov r1, r1, lsr #0x10
    bl func_ov002_021c3a04
    cmp r0, #0x2
    bge .L_23c
    add sp, sp, #0xbc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_114:
    ldr r1, [sp]
    mov r0, r3
    add r8, r1, r0
    cmp r8, #0x4
    bgt .L_230
    ldr r0, _LIT3
    and r1, fp, #0x1
    mul r6, r1, r0
    mov r0, #0x14
    mul r9, r8, r0
    ldr r1, _LIT2
    add r0, r1, r6
    add r0, r0, #0x30
    ldr r3, [r0, r9]
    mov r0, fp
    mov r1, r3, lsl #0x2
    mov r2, r1, lsr #0x18
    mov r1, r8
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r4, r2, r3, lsr #0x1f
    bl func_ov002_021c8400
    mov r7, r0
    ldrh r0, [sl, #0x2]
    mov r1, fp
    mov r2, r8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc7e8
    cmp r0, #0x0
    addeq sp, sp, #0xbc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, fp
    mov r1, r8
    mov r2, #0x0
    bl func_ov002_021c1c48
    cmp r0, #0x0
    addne sp, sp, #0xbc
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    cmp fp, r0, lsr #0x1f
    mov r0, r0, lsr #0x1f
    beq .L_1e8
    ldr r1, _LIT4
    add r1, r1, r6
    ldrh r1, [r9, r1]
    cmp r1, #0x0
    addeq sp, sp, #0xbc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e8:
    ldrh r1, [sl, #0xa]
    cmp r1, #0x0
    bne .L_23c
    bl func_ov002_021bc5e4
    cmp r0, #0x0
    bge .L_23c
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    cmp fp, r0, lsr #0x1f
    bne .L_224
    mov r0, fp
    mov r1, r8
    bl func_ov002_021bc1a8
    cmp r0, #0x0
    bne .L_23c
.L_224:
    add sp, sp, #0xbc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_230:
    add sp, sp, #0xbc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_23c:
    cmp r7, #0x0
    addeq sp, sp, #0xbc
    mov r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r2, [sl, #0xa]
    cmp r2, #0x0
    ble .L_290
    ldr r6, _LIT1
    ldr r1, [r6, #0x494]
.L_260:
    add r3, r1, r0
    mov r3, r3, lsl #0x19
    add r3, r6, r3, lsr #0x18
    add r3, r3, #0x400
    ldrh r3, [r3, #0x98]
    cmp r4, r3
    addeq sp, sp, #0xbc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, r0, #0x1
    cmp r0, r2
    blt .L_260
.L_290:
    ldrh r1, [sl]
    ldr r0, _LIT5
    cmp r1, r0
    addne r0, r0, #0x7e
    cmpne r1, r0
    ldrne r0, _LIT6
    cmpne r1, r0
    moveq r0, #0x1
    streq r0, [sp, #0x8]
    ldr r0, [sp, #0x10]
    cmp r7, r0
    blt .L_2dc
    mov r1, r0
    ldr r0, [sp, #0x8]
    add r0, r1, r0
    cmp r7, r0
    addlt sp, sp, #0xbc
    movlt r0, #0x1
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2dc:
    ldrh r1, [sl, #0x2]
    ldr r0, [sp, #0x8]
    mov r6, #0x0
    mov r1, r1, lsl #0x1f
    cmp r0, r7
    mov r1, r1, lsr #0x1f
    ldr r0, _LIT3
    and r1, r1, #0x1
    mul r0, r1, r0
    ldr r1, _LIT7
    strge r7, [sp, #0x8]
    ldr r2, [r1, r0]
    ldr r1, [sp, #0x10]
    mov r8, r6
    sub r1, r1, r7
    str r1, [sp, #0x10]
    cmp r2, #0x0
    bls .L_444
    mov r4, r6
.L_328:
    ldr r2, _LIT2
    ldr r1, [sp]
    add r0, r2, r0
    add r0, r0, r4
    ldr r0, [r0, #0x120]
    cmp r1, #0xb
    mov r0, r0, lsl #0x13
    mov r7, r0, lsr #0x13
    ldreq r0, [sp, #0x4]
    cmpeq r0, r8
    beq .L_410
    mov r0, r7
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_410
    cmp r7, r5
    mvneq r5, #0x0
    beq .L_410
    ldrh r0, [sl, #0x2]
    ldrh r9, [sl, #0xa]
    ldr r3, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT3
    cmp r9, #0x0
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x120
    ldr r2, [r1, r4]
    mov r3, #0x0
    mov r1, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r1, r2, r1, lsr #0x1f
    ble .L_3ec
    ldr r2, _LIT1
    ldr r7, [r2, #0x494]
.L_3c0:
    add ip, r7, r3
    mov ip, ip, lsl #0x19
    add ip, r2, ip, lsr #0x18
    add ip, ip, #0x400
    ldrh ip, [ip, #0x98]
    cmp r1, ip
    moveq r1, #0x0
    beq .L_3ec
    add r3, r3, #0x1
    cmp r3, r9
    blt .L_3c0
.L_3ec:
    cmp r1, #0x0
    beq .L_410
    cmp r6, #0x2a
    bge .L_410
    bl func_ov002_021c37e4
    mov r2, r6
    add r1, sp, #0x14
    add r6, r6, #0x1
    str r0, [r1, r2, lsl #0x2]
.L_410:
    ldrh r2, [sl, #0x2]
    ldr r0, _LIT3
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    add r1, r1, r0
    ldr r1, [r1, #0xc]
    add r8, r8, #0x1
    cmp r8, r1
    add r4, r4, #0x4
    bcc .L_328
.L_444:
    ldr r1, [sp]
    ldr r0, [sp, #0x4]
    mov r9, #0x0
    add r0, r1, r0
    str r0, [sp, #0xc]
.L_458:
    ldr r2, _LIT2
    ldr r0, _LIT3
    and r1, r9, #0x1
    mla r7, r1, r0, r2
    ldr r4, _LIT1
    add r8, r7, #0x30
    mov r5, #0x0
.L_474:
    ldrh r0, [sl, #0x2]
    mov r1, r9
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc7e8
    cmp r0, #0x0
    beq .L_550
    mov r0, r9
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_021c1c48
    cmp r0, #0x0
    bne .L_550
    cmp fp, r9
    ldreq r0, [sp, #0xc]
    cmpeq r5, r0
    beq .L_550
    cmp fp, r9
    beq .L_4d0
    ldrh r0, [r7, #0x38]
    cmp r0, #0x0
    beq .L_550
.L_4d0:
    ldr r1, [r8]
    mov r3, #0x0
    mov r0, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r2, r1, r0, lsr #0x1f
    ldrh r1, [sl, #0xa]
    cmp r1, #0x0
    ble .L_528
    ldr r0, [r4, #0x494]
.L_4fc:
    add ip, r0, r3
    mov ip, ip, lsl #0x19
    add ip, r4, ip, lsr #0x18
    add ip, ip, #0x400
    ldrh ip, [ip, #0x98]
    cmp r2, ip
    moveq r2, #0x0
    beq .L_528
    add r3, r3, #0x1
    cmp r3, r1
    blt .L_4fc
.L_528:
    cmp r2, #0x0
    beq .L_550
    cmp r6, #0x2a
    bge .L_550
    mov r0, r9
    mov r1, r5
    bl func_ov002_021c8400
    add r1, sp, #0x14
    str r0, [r1, r6, lsl #0x2]
    add r6, r6, #0x1
.L_550:
    add r7, r7, #0x14
    add r8, r8, #0x14
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_474
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_458
    ldr r2, [sp, #0x10]
    ldr r3, [sp, #0x8]
    add r0, sp, #0x14
    sub r1, r6, #0x1
    bl func_ov002_02247588
    add sp, sp, #0xbc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cabc0
_LIT1: .word data_ov002_022ce1a8
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf0c4
_LIT5: .word 0x00001698
_LIT6: .word 0x000019d9
_LIT7: .word data_ov002_022cf098
