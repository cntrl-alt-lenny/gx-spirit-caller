; func_ov002_021dd950 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce93c
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern func_0202b878
        .extern func_0202b8c0
        .extern func_0202e234
        .extern func_0202e2f8
        .extern func_ov002_021b30ac
        .extern func_ov002_021b39c4
        .extern func_ov002_021b3ecc
        .extern func_ov002_021baca8
        .extern func_ov002_021bb068
        .extern func_ov002_021c1d28
        .extern func_ov002_021c1e20
        .extern func_ov002_021d479c
        .extern func_ov002_021d9828
        .extern func_ov002_021dcc48
        .extern func_ov002_021dd950
        .extern func_ov002_02244fe4
        .global func_ov002_021dd950
        .arm
func_ov002_021dd950:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    mov r9, r0
    and r0, r9, #0x1
    ldr r4, _LIT0
    mov r6, r3
    mul sl, r0, r4
    str r0, [sp, #0x14]
    ldr r4, _LIT1
    mov r8, r1
    mov r0, #0x14
    add r1, r4, sl
    mul r4, r8, r0
    add r0, r1, #0x30
    str r0, [sp, #0x24]
    ldr r0, [r0, r4]
    mov r7, r2
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    tst r6, #0x10000
    str r0, [sp, #0x20]
    ldr r5, [sp, #0x50]
    bne .L_d8
    mov r0, r5
    bl func_0202b878
    cmp r0, #0x16
    bne .L_9c
    and r0, r6, #0x1
    cmp r0, #0x0
    movgt r2, #0x1
    movle r2, #0x0
    mov r0, r9
    mov r1, r8
    bl func_ov002_021c1d28
    cmp r0, #0x0
    beq .L_d8
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9c:
    mov r0, r5
    bl func_0202b878
    cmp r0, #0x17
    bne .L_d8
    and r0, r6, #0x1
    cmp r0, #0x0
    movgt r2, #0x1
    movle r2, #0x0
    mov r0, r9
    mov r1, r8
    bl func_ov002_021c1e20
    cmp r0, #0x0
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d8:
    cmp r8, #0x4
    bgt .L_144
    tst r6, #0x2
    beq .L_144
    ldr r2, _LIT2
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b30ac
    cmp r0, #0x0
    beq .L_144
    mov r0, r9
    mov r1, r8
    mov r2, #0x1
    bl func_ov002_021b39c4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    mov r4, #0x0
    and r0, r0, #0xff
    and r1, r1, #0xff
    mov r2, #0xe
    mov r3, #0x2
    str r4, [sp]
    bl func_ov002_021dd950
    add sp, sp, #0x2c
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_144:
    cmp r8, #0x5
    blt .L_178
    tst r6, #0x2
    cmpne r5, #0x0
    beq .L_178
    ldr r2, _LIT3
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_178:
    cmp r7, #0xe
    cmpne r7, #0xf
    beq .L_1b4
    ldr r0, _LIT4
    add r0, r0, sl
    ldr r0, [r4, r0]
    mov r0, r0, lsr #0x3
    tst r0, #0x1
    ldrne r0, _LIT5
    cmpne r5, r0
    ldrne r0, _LIT6
    cmpne r5, r0
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1b4:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_79c
    ldr r0, _LIT7
    add r1, r8, r9, lsl #0x4
    ldr r0, [r0, #0xd4]
    mov fp, #0x1
    tst r0, fp, lsl r1
    mov r0, fp, lsl r1
    str r0, [sp, #0x18]
    bne .L_79c
    ldr r1, _LIT0
    ldr r0, [sp, #0x14]
    mov r2, #0x14
    mul r1, r0, r1
    mul r0, r8, r2
    str r1, [sp, #0xc]
    str r0, [sp, #0x10]
    ldr r1, _LIT1
    ldr r0, [sp, #0xc]
    tst r6, #0x1
    add r0, r1, r0
    add r1, r0, #0x30
    ldr r0, [sp, #0x10]
    moveq fp, #0x0
    ldr r0, [r1, r0]
    tst r6, #0x8
    mov r1, r0, lsl #0x12
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    moveq sl, #0x1
    movne sl, #0x0
    str r0, [sp, #0x1c]
    cmp r7, #0xe
    bne .L_260
    ldr r0, [sp, #0x20]
    bl func_0202e2f8
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0x8]
    beq .L_268
.L_260:
    mov r0, #0x0
    str r0, [sp, #0x8]
.L_268:
    tst r6, #0x2
    movne r0, #0x1
    strne r0, [sp, #0x4]
    moveq r0, #0x0
    streq r0, [sp, #0x4]
    add r1, sp, #0x28
    mov r0, #0x0
    cmp r7, #0xe
    str r0, [r1]
    bne .L_2f8
    ldr r0, _LIT7
    ldr r0, [r0, #0xd8]
    tst r0, #0x1
    movne r7, #0xf
    tst r0, #0x2
    beq .L_2b8
    ldr r0, [sp, #0x20]
    bl func_0202e234
    cmp r0, #0x0
    movne r7, #0xf
.L_2b8:
    ldr r0, _LIT7
    ldr r1, [r0, #0xd8]
    tst r1, #0x4
    beq .L_2d4
    ldr r0, [sp, #0x1c]
    tst r0, #0x1
    moveq r7, #0xf
.L_2d4:
    tst r1, #0x8
    beq .L_2ec
    ldr r0, [sp, #0x1c]
    and r0, r0, #0x1
    cmp r0, #0x1
    moveq r7, #0xf
.L_2ec:
    cmp r7, #0xf
    moveq r0, #0x0
    streq r0, [sp, #0x8]
.L_2f8:
    cmp sl, #0x0
    beq .L_328
    cmp r7, #0xa
    ble .L_328
    ldr r2, _LIT8
    mov r0, r9
    mov r1, r8
    bl func_ov002_021baca8
    cmp r0, #0x0
    movne r0, #0x0
    movne r7, #0xf
    strne r0, [sp, #0x8]
.L_328:
    mov r0, r5
    bl func_0202b8c0
    cmp r0, #0x6
    bne .L_350
    ldr r0, _LIT9
    bl func_ov002_021bb068
    cmp r0, #0x0
    movne r0, #0x0
    movne r7, #0xd
    strne r0, [sp, #0x8]
.L_350:
    cmp sl, #0x0
    beq .L_380
    cmp r7, #0xb
    bne .L_380
    ldr r0, [sp, #0x20]
    bl func_0202e234
    cmp r0, #0x0
    beq .L_380
    ldr r0, _LIT10
    bl func_ov002_021bb068
    cmp r0, #0x0
    movne r7, #0xf
.L_380:
    mov r1, #0x200
    ldr r0, [sp, #0x28]
    rsb r1, r1, #0x0
    and r2, r0, r1
    ldr r0, [sp, #0x1c]
    ldr r3, _LIT11
    and r0, r0, r1, lsr #0x17
    orr r0, r2, r0
    bic r1, r0, #0x200
    mov r0, r9, lsl #0x1f
    orr r0, r1, r0, lsr #0x16
    bic r1, r0, #0x3c00
    mov r0, r8, lsl #0x1c
    orr r0, r1, r0, lsr #0x12
    bic r2, r0, #0x4000
    ldr r1, _LIT12
    ldr r0, [sp, #0xc]
    cmp sl, #0x0
    add r1, r1, r0
    add r0, r3, r0
    ldr r3, [sp, #0x10]
    ldrh r1, [r3, r1]
    ldrh r3, [r3, r0]
    eor r0, r9, fp
    mov r1, r1, lsl #0x1f
    orr r1, r2, r1, lsr #0x11
    bic r2, r1, #0x20000
    mov r1, r3, lsl #0x1f
    orr r1, r2, r1, lsr #0xe
    bic r1, r1, #0x40000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0xd
    bic r1, r0, #0x8000
    ldr r0, [sp, #0x4]
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x10
    str r0, [sp, #0x28]
    moveq r0, #0x1
    movne r0, #0x0
    ldr r2, [sp, #0x28]
    mov r1, r0, lsl #0x1f
    bic r2, r2, #0x800000
    orr r1, r2, r1, lsr #0x8
    mov r0, r7, lsl #0x1c
    bic r1, r1, #0x780000
    orr r0, r1, r0, lsr #0x9
    str r0, [sp, #0x28]
    ldr r1, _LIT7
    ldr r0, [sp, #0x18]
    ldr r2, [r1, #0xd4]
    tst r6, #0x30
    orr r0, r2, r0
    str r0, [r1, #0xd4]
    beq .L_4a0
    ldr r1, [sp, #0x28]
    ldr r2, _LIT13
    cmp r9, #0x0
    movne r0, #0x8000
    mov r1, r1, lsl #0x17
    moveq r0, #0x0
    mov r1, r1, lsr #0x17
    ldr r2, [r2, r8, lsl #0x2]
    orr r0, r0, #0x4c
    mov r1, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r3, r1, lsr #0x10
    mov r1, r8, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d479c
.L_4a0:
    tst r6, #0x1000
    beq .L_4ec
    ldr r0, [sp, #0x28]
    cmp r9, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    mov r0, r0, lsl #0x17
    mov r3, r0, lsr #0x17
    orr r1, r1, #0x46
    mov r0, r1, lsl #0x10
    mov r1, r8, lsl #0x10
    mov r2, r7, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d479c
    b .L_71c
.L_4ec:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_55c
    ldr r1, [sp, #0x28]
    cmp r9, #0x0
    mov r2, r1, lsl #0x8
    mov r2, r2, lsr #0x1f
    and r3, fp, #0xf
    and r2, r2, #0xf
    movne r0, #0x8000
    orr r2, r3, r2, lsl #0x4
    moveq r0, #0x0
    mov r1, r1, lsl #0x17
    mov r3, r1, lsr #0x17
    orr r0, r0, #0x31
    mov r0, r0, lsl #0x10
    mov r1, r8, lsl #0x10
    mov r3, r3, lsl #0x10
    and sl, r7, #0xff
    and r2, r2, #0xff
    orr r2, sl, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d479c
    b .L_71c
.L_55c:
    cmp r7, #0xa
    bgt .L_5c4
    and r0, r6, #0x40000
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    eor r2, r9, r0
    cmp r9, #0x0
    movne r3, #0x8000
    moveq r3, #0x0
    and r1, r9, #0xff
    and r0, r8, #0xff
    orr r1, r1, r0, lsl #0x8
    orr r3, r3, #0x3d
    mov r0, r3, lsl #0x10
    mov r1, r1, lsl #0x10
    and r3, r7, #0xff
    and r2, r2, #0xff
    orr r2, r2, r3, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d479c
    b .L_71c
.L_5c4:
    ldr r0, [sp, #0x20]
    bl func_0202e2f8
    cmp r0, #0x0
    beq .L_614
    ldr r0, [sp, #0x28]
    cmp r9, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    mov r0, r0, lsl #0x17
    mov r2, r0, lsr #0x17
    orr r1, r1, #0x31
    mov r0, r1, lsl #0x10
    mov r1, r8, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r2, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x10
    bl func_ov002_021d479c
    b .L_71c
.L_614:
    cmp r7, #0xf
    bne .L_668
    tst r6, #0x20
    bicne r0, r6, #0x20
    orrne r6, r0, #0x10
    ldr r0, [sp, #0x28]
    cmp r9, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    mov r0, r0, lsl #0x17
    mov r3, r0, lsr #0x17
    orr r1, r1, #0x33
    mov r0, r1, lsl #0x10
    mov r2, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    and r1, r8, #0xff
    mov r0, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d479c
    b .L_71c
.L_668:
    and r0, r6, #0x40000
    cmp r0, #0x0
    ldr r0, [sp, #0x24]
    movgt r1, #0x1
    ldr r0, [r0, r4]
    movle r1, #0x0
    sub r2, r7, #0xb
    mov r0, r0, lsl #0x12
    eor r0, r1, r0, lsr #0x1f
    cmp r2, #0x3
    mov r1, #0x0
    addls pc, pc, r2, lsl #0x2
    b .L_6dc
    b .L_6ac
    b .L_6c4
    b .L_6cc
    b .L_6d8
.L_6ac:
    ldr r1, _LIT0
    and r2, r0, #0x1
    mul r3, r2, r1
    ldr r1, _LIT14
    ldr r1, [r1, r3]
    b .L_6dc
.L_6c4:
    mov r1, #0x1
    b .L_6dc
.L_6cc:
    tst r6, #0x800000
    movne r1, #0x1
    b .L_6dc
.L_6d8:
    mov r1, #0x1
.L_6dc:
    and sl, r0, #0x1
    mov r2, r7, lsl #0x1b
    ldr r0, [sp, #0x14]
    mov r3, r8, lsl #0x1b
    orr r0, r0, r3, lsr #0x1a
    mov r3, r6, lsl #0x10
    orr r2, sl, r2, lsr #0x1a
    mov r1, r1, lsl #0x16
    orr r1, r2, r1, lsr #0x10
    mov r2, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r0, #0x40
    bl func_ov002_021d479c
.L_71c:
    cmp r7, #0xa
    ble .L_768
    cmp r5, #0x0
    movne r3, #0x80000
    add r0, sp, #0x28
    ldr r1, [sp, #0x24]
    moveq r3, #0x0
    ldr r0, [r0]
    mov r2, r5
    add r1, r1, r4
    orr r3, r6, r3
    bl func_ov002_021d9828
    ldr r0, [sp, #0x20]
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_768
    ldr r1, [sp, #0x28]
    mov r0, #0x1b
    bl func_ov002_02244fe4
.L_768:
    ldr r0, [sp, #0x8]
    mov r1, r9
    cmp r0, #0x0
    movne r3, #0x1400000
    ldr r0, [sp, #0x24]
    moveq r3, #0x0
    mov r2, r8
    add r0, r0, r4
    orr r3, r6, r3
    bl func_ov002_021dcc48
    add sp, sp, #0x2c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_79c:
    mov r0, #0x0
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00001825
_LIT3: .word 0x00001513
_LIT4: .word data_ov002_022cf1ac
_LIT5: .word 0x000014fb
_LIT6: .word 0x000019e1
_LIT7: .word data_ov002_022d016c
_LIT8: .word 0x000016f8
_LIT9: .word 0x000019da
_LIT10: .word 0x00001afc
_LIT11: .word data_ov002_022cf1a4
_LIT12: .word data_ov002_022cf1a2
_LIT13: .word data_ov002_022ce93c
_LIT14: .word data_ov002_022cf178
