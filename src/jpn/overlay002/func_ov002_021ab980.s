; func_ov002_021ab980 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd340
        .extern data_ov002_022cd3b0
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c6
        .extern data_ov002_022cf0cc
        .extern data_ov002_022cf1a8
        .extern data_ov002_022d008c
        .extern data_ov002_022d0570
        .extern func_0202e2ec
        .extern func_0202e558
        .extern func_0202ed3c
        .extern func_0202f994
        .extern func_ov002_021ab794
        .extern func_ov002_021b0afc
        .extern func_ov002_021b2fcc
        .extern func_ov002_021b306c
        .extern func_ov002_021b30d8
        .extern func_ov002_021b3538
        .extern func_ov002_021b3dec
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b3f74
        .extern func_ov002_021b8f20
        .extern func_ov002_021b8fc8
        .extern func_ov002_021b9dc4
        .extern func_ov002_021babc8
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_021bb4c8
        .extern func_ov002_021bbae0
        .extern func_ov002_021bbc24
        .extern func_ov002_021bbe70
        .extern func_ov002_021bd5e8
        .extern func_ov002_021c0b04
        .extern func_ov002_021c1c6c
        .extern func_ov002_021c83ac
        .extern func_ov002_021c921c
        .extern func_ov002_021c92ec
        .extern func_ov002_021d58dc
        .extern func_ov002_021d93bc
        .extern func_ov002_021df53c
        .extern func_ov002_021e267c
        .global func_ov002_021ab980
        .arm
func_ov002_021ab980:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4c
    ldr r7, _LIT0
    str r1, [sp, #0x4]
    ldr r8, [r7]
    mov r2, #0x38
    ldr r1, [r7, #0x1c]
    mov r3, #0x14
    ldr r9, _LIT1
    and fp, r8, #0x1
    add r4, r2, #0x830
    mul r5, r1, r3
    mla r4, fp, r4, r9
    ldr r5, [r5, r4]
    ldr r4, [r7, #0x8]
    ldr r6, _LIT2
    mov fp, r5, lsr #0x6
    cmp r4, #0x0
    rsb sl, r8, #0x1
    mla r5, r8, r2, r6
    mla r6, sl, r2, r6
    mov sl, r0
    and r0, fp, #0x1
    str r0, [sp, #0x3c]
    movne r0, #0x0
    ldr r4, [r7, #0x4]
    strne r0, [sp, #0x8]
    bne .L_94
    ldr r7, [r7, #0x20]
    and r0, r4, #0x1
    add r2, r2, #0x830
    mul r3, r7, r3
    mla r2, r0, r2, r9
    ldr r0, [r3, r2]
    mov r0, r0, lsr #0x6
    and r0, r0, #0x1
    str r0, [sp, #0x8]
.L_94:
    mov r0, r8
    bl func_ov002_021c1c6c
    mov r0, #0x0
    ldr r2, _LIT0
    str r0, [sp, #0x38]
    mov r3, r2
    mov r1, r0
.L_b0:
    str r1, [r2, #0x58]
    str r1, [r2, #0x5c]
    str r1, [r2, #0x60]
    add r0, r0, #0x1
    str r1, [r3, #0x9c]
    cmp r0, #0x2
    add r2, r2, #0x38
    add r3, r3, #0x14
    blt .L_b0
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_f4
    ldr r2, [r5, #0x1c]
    mov r0, r5
    bl func_ov002_021ab794
    b .L_390
.L_f4:
    ldr r1, [r6, #0x8]
    ldr r0, [r5, #0x1c]
    cmp r1, #0x0
    ldrne r2, [r6, #0x20]
    ldreq r2, [r6, #0x1c]
    cmp r0, r2
    bne .L_130
    cmp r1, #0x0
    bne .L_390
    cmp r0, #0x0
    ble .L_390
    mov r0, #0x1
    str r0, [r5, #0x2c]
    str r0, [r6, #0x2c]
    b .L_390
.L_130:
    ble .L_254
    cmp r1, #0x0
    sub r7, r0, r2
    bne .L_154
    mov r0, r5
    mov r1, r6
    mov r2, r7
    bl func_ov002_021ab794
    b .L_248
.L_154:
    ldr r1, _LIT0
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c0b04
    cmp r0, #0x0
    beq .L_194
    cmp r8, r4
    mov r0, r5
    beq .L_188
    mov r1, r6
    mov r2, r7
    bl func_ov002_021ab794
    b .L_194
.L_188:
    mov r2, r7
    mov r1, #0x0
    bl func_ov002_021ab794
.L_194:
    ldr r0, _LIT0
    rsb r9, r8, #0x1
    ldr r1, [r0, #0x1c]
    ldr r2, _LIT3
    mov r0, r8
    mov r3, r9
    bl func_ov002_021b30d8
    cmp r0, #0x0
    bne .L_238
    ldr r0, _LIT0
    ldr r2, _LIT4
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r3, r9
    bl func_ov002_021b30d8
    cmp r0, #0x0
    bne .L_238
    ldr r0, _LIT0
    ldr r2, _LIT5
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r3, r9
    bl func_ov002_021b30d8
    cmp r0, #0x0
    bne .L_238
    ldr r0, _LIT0
    ldr r2, _LIT6
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r3, r9
    bl func_ov002_021b30d8
    cmp r0, #0x0
    bne .L_238
    ldr r0, _LIT0
    ldr r2, _LIT7
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r3, r9
    bl func_ov002_021b30d8
    cmp r0, #0x0
    beq .L_248
.L_238:
    mov r0, r5
    mov r1, r5
    mov r2, r7
    bl func_ov002_021ab794
.L_248:
    mov r0, #0x1
    str r0, [r6, #0x2c]
    b .L_390
.L_254:
    cmp r1, #0x0
    sub r7, r2, r0
    beq .L_288
    ldr r2, _LIT8
    rsb r0, r8, #0x1
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_288
    mov r0, #0x1
    mov r7, r7, lsl #0x1
    str r0, [sp, #0x38]
    b .L_2b8
.L_288:
    ldr r0, [r6, #0x8]
    cmp r0, #0x0
    beq .L_2b8
    ldr r0, [r6, #0x24]
    cmp r0, #0x6
    bne .L_2b8
    ldr r0, _LIT9
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x1
    movne r7, r7, lsl #0x1
    strne r0, [sp, #0x38]
.L_2b8:
    mov r0, r6
    mov r1, r5
    mov r2, r7
    bl func_ov002_021ab794
    ldr r0, [r6, #0x8]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [r5, #0x2c]
    beq .L_390
    cmp sl, #0x0
    beq .L_390
    rsb r7, r8, #0x1
    ldr r2, _LIT10
    mov r0, r7
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_320
    mov r1, #0x0
    ldr r0, _LIT0
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    ldr r2, _LIT10
    mov r0, r8
    mov r3, #0x4
    bl func_ov002_021d58dc
.L_320:
    ldr r2, _LIT8
    mov r0, r7
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_358
    mov r1, #0x0
    ldr r0, _LIT0
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    ldr r2, _LIT8
    mov r0, r8
    mov r3, #0x4
    bl func_ov002_021d58dc
.L_358:
    ldr r1, _LIT11
    mov r0, r7
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    beq .L_390
    mov r1, #0x0
    ldr r0, _LIT0
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    ldr r2, _LIT11
    mov r0, r8
    mov r3, #0x4
    bl func_ov002_021d58dc
.L_390:
    mov r0, #0x0
    str r0, [sp, #0xc]
    ldr r0, _LIT12
    ldr r9, _LIT13
    rsb r0, r0, #0x2980
    str r0, [sp, #0x40]
    ldr r0, _LIT14
    ldr fp, _LIT0
    sub r7, r0, #0x10000
    ldr r0, _LIT15
    sub r0, r0, #0x2f
    str r0, [sp, #0x44]
    ldr r0, _LIT16
    rsb r0, r0, #0x2b00
    str r0, [sp, #0x48]
.L_3cc:
    ldr r0, [r9]
    cmp r0, #0x0
    beq .L_714
    ldr r0, [r9, #0x4]
    ldr r1, [r9, #0xc]
    cmp r0, r1
    beq .L_48c
    ldr r1, [r9, #0x8]
    ldr r2, _LIT12
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_440
    cmp sl, #0x0
    beq .L_42c
    ldr r1, [r9]
    ldr r0, _LIT14
    mov r2, #0x4
    cmp r1, r0
    movhi r1, r0
    mov r0, r1, lsl #0x10
    mov r3, r0, lsr #0x10
    ldr r0, [r9, #0x4]
    ldr r1, _LIT12
    bl func_ov002_021e267c
.L_42c:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r9]
    b .L_714
.L_440:
    ldr r0, [r9, #0xc]
    ldr r2, _LIT17
    ldr r1, _LIT18
    and r3, r0, #0x1
    mla r1, r3, r2, r1
    ldr r1, [r1, #0x11c]
    mov r1, r1, lsr #0x17
    tst r1, #0x1
    movne r0, #0x0
    strne r0, [r9]
    bne .L_714
    ldr r2, _LIT15
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021b3f74
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9]
    bne .L_714
.L_48c:
    ldr r0, [r9, #0x4]
    cmp r0, r8
    bne .L_4c8
    ldr r0, _LIT16
    bl func_ov002_021bd5e8
    cmp r0, #0x0
    beq .L_4c8
    ldr r0, [r9, #0xc]
    ldr r1, [sp, #0x40]
    mov r2, r7
    bl func_ov002_021bad9c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9]
    bne .L_714
.L_4c8:
    ldr r0, _LIT19
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_514
    ldr r1, [r9, #0xc]
    cmp r1, r8
    ldreq r0, [r5, #0x24]
    cmpeq r0, #0x11
    moveq r0, #0x0
    streq r0, [r9]
    beq .L_714
    ldr r0, [fp, #0x8]
    cmp r0, #0x0
    cmpeq r1, r4
    ldreq r0, [r6, #0x24]
    cmpeq r0, #0x11
    moveq r0, #0x0
    streq r0, [r9]
    beq .L_714
.L_514:
    ldr r1, _LIT19
    ldr r0, [r9, #0xc]
    add r1, r1, #0x3f
    mov r2, r7
    bl func_ov002_021bad9c
    cmp r0, #0x0
    beq .L_58c
    mov r0, r8
    ldr r1, [r5, #0x4]
    bl func_ov002_021b8fc8
    cmp r0, #0x0
    beq .L_558
    ldr r0, [r5, #0x28]
    cmp r0, #0x3
    movle r0, #0x0
    strle r0, [r9]
    ble .L_714
.L_558:
    ldr r0, [fp, #0x8]
    cmp r0, #0x0
    bne .L_58c
    mov r0, r4
    ldr r1, [r6, #0x4]
    bl func_ov002_021b8fc8
    cmp r0, #0x0
    beq .L_58c
    ldr r0, [r6, #0x28]
    cmp r0, #0x3
    movle r0, #0x0
    strle r0, [r9]
    ble .L_714
.L_58c:
    ldr r2, _LIT19
    ldr r0, [r9, #0xc]
    mov r1, #0xb
    add r2, r2, #0x14c
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9]
    bne .L_714
    ldr r0, [r9, #0xc]
    bl func_ov002_021bbe70
    cmp r0, #0x0
    beq .L_5e4
    ldr r1, _LIT19
    ldr r0, [r9, #0xc]
    add r1, r1, #0xa0
    mov r2, r7
    bl func_ov002_021bad9c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9]
    bne .L_714
.L_5e4:
    ldr r0, [fp, #0x8]
    cmp r0, #0x0
    bne .L_648
    ldr r0, [r9, #0xc]
    cmp r0, r8
    bne .L_61c
    ldr r1, [fp, #0x1c]
    ldr r2, [sp, #0x44]
    mov r0, r8
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9]
    bne .L_714
.L_61c:
    ldr r0, [r9, #0xc]
    cmp r0, r4
    bne .L_648
    ldr r1, [fp, #0x20]
    ldr r2, [sp, #0x44]
    mov r0, r4
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9]
    bne .L_714
.L_648:
    ldr r1, _LIT15
    ldr r0, [r9, #0xc]
    add r1, r1, #0x4d
    bl func_ov002_021bb4c8
    cmp r0, #0x0
    beq .L_6a8
    ldr r0, [r9, #0xc]
    cmp r0, r8
    bne .L_684
    ldr r0, [r5, #0x10]
    bl func_0202ed3c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9]
    bne .L_714
.L_684:
    ldr r0, [r9, #0xc]
    cmp r0, r4
    bne .L_6a8
    ldr r0, [r6, #0x10]
    bl func_0202ed3c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9]
    bne .L_714
.L_6a8:
    ldr r0, [r9, #0xc]
    ldr r2, [sp, #0x48]
    mov r1, #0xa
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_6e8
    ldr r0, [r9, #0xc]
    ldr r1, _LIT17
    and r2, r0, #0x1
    ldr r0, _LIT18
    mla r0, r2, r1, r0
    ldr r0, [r0, #0x104]
    cmp r0, #0x4
    movcs r0, #0x0
    strcs r0, [r9]
    bcs .L_714
.L_6e8:
    ldr r0, [r9, #0xc]
    ldr r1, [r9, #0x4]
    cmp r1, r0
    beq .L_714
    ldr r2, _LIT19
    mov r1, #0xb
    add r2, r2, #0xa7
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9]
.L_714:
    ldr r0, [sp, #0xc]
    add r9, r9, #0x14
    add r0, r0, #0x1
    str r0, [sp, #0xc]
    cmp r0, #0x2
    blt .L_3cc
    ldr r2, _LIT20
    mov r0, r8
    mov r1, #0xb
    mov r3, #0x4
    bl func_ov002_021b3f74
    cmp r0, #0x0
    beq .L_768
    mov r2, #0x0
    ldr r1, _LIT0
    mov r0, r2
.L_754:
    add r2, r2, #0x1
    str r0, [r1, #0x9c]
    cmp r2, #0x2
    add r1, r1, #0x14
    blt .L_754
.L_768:
    ldr r1, [r5, #0x1c]
    ldr r0, [r6, #0x1c]
    cmp r1, r0
    bne .L_7b0
    ldr r1, _LIT21
    mov r0, r8
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    ldr r1, _LIT21
    mov r0, r4
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
.L_7b0:
    ldr r7, _LIT0
    ldr r0, [r7, #0x8]
    cmp r0, #0x0
    beq .L_920
    ldr r0, [sp, #0x3c]
    cmp r0, #0x0
    bne .L_80c
    ldr r1, [r5, #0x10]
    cmp r1, #0x1500
    ldrne r0, _LIT22
    cmpne r1, r0
    beq .L_7f8
    add r0, r0, #0xc3
    cmp r1, r0
    ldreq r0, [r7, #0x9c]
    moveq r0, r0, lsl #0x1
    streq r0, [r7, #0x9c]
    b .L_80c
.L_7f8:
    ldr r0, _LIT0
    ldr r1, [r0, #0x9c]
    add r1, r1, #0x1
    mov r1, r1, lsr #0x1
    str r1, [r0, #0x9c]
.L_80c:
    ldr r0, _LIT0
    ldr r1, [r0, #0x9c]
    cmp r1, #0x0
    beq .L_83c
    ldr r1, [r0, #0x1c]
    ldr r2, _LIT23
    mov r0, r8
    bl func_ov002_021b3dec
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0x190
    strne r1, [r0, #0x9c]
.L_83c:
    ldr r0, _LIT0
    ldr r1, [r0, #0x9c]
    cmp r1, #0x0
    beq .L_870
    ldr r1, [r0, #0x1c]
    ldr r2, _LIT24
    mov r0, r8
    mov r3, r8
    bl func_ov002_021b30d8
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0x3e8
    strne r1, [r0, #0x9c]
.L_870:
    ldr r0, _LIT0
    ldr r0, [r0, #0x9c]
    cmp r0, #0x0
    beq .L_8ac
    ldr r2, _LIT25
    mov r0, r8
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_8ac
    ldr r1, [r5, #0x4]
    mov r0, r8
    bl func_ov002_021c83ac
    ldr r1, _LIT0
    str r0, [r1, #0x9c]
.L_8ac:
    ldr r0, _LIT0
    ldr r0, [r0, #0x9c]
    cmp r0, #0x0
    beq .L_8e8
    ldr r2, _LIT26
    mov r0, r8
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_8e8
    ldr r1, [r5, #0x4]
    mov r0, r8
    bl func_ov002_021c83ac
    ldr r1, _LIT0
    str r0, [r1, #0x9c]
.L_8e8:
    ldr r0, _LIT0
    ldr r1, [r0, #0x9c]
    cmp r1, #0x0
    beq .L_2714
    ldr r1, [r0, #0x1c]
    ldr r2, _LIT27
    mov r0, r8
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_2714
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x9c]
    b .L_2714
.L_920:
    ldr r0, [sp, #0x3c]
    cmp r0, #0x0
    bne .L_10dc
    ldr r2, [r5, #0x10]
    ldr r3, _LIT22
    cmp r2, r3
    bgt .L_ad0
    bge .L_df0
    ldr r0, _LIT28
    cmp r2, r0
    bgt .L_a18
    bge .L_ef0
    sub r1, r0, #0x7b
    cmp r2, r1
    bgt .L_9cc
    bge .L_da4
    sub r1, r0, #0x210
    cmp r2, r1
    bgt .L_984
    sub r0, r0, #0x210
    cmp r2, r0
    bge .L_c60
    cmp r2, #0x1140
    beq .L_d5c
    b .L_10dc
.L_984:
    sub r1, r0, #0xf1
    cmp r2, r1
    bgt .L_9a0
    sub r0, r0, #0xf1
    cmp r2, r0
    beq .L_c74
    b .L_10dc
.L_9a0:
    sub r1, r0, #0x83
    cmp r2, r1
    bgt .L_10dc
    sub r1, r0, #0x85
    cmp r2, r1
    blt .L_10dc
    beq .L_d50
    sub r0, r0, #0x83
    cmp r2, r0
    beq .L_ec0
    b .L_10dc
.L_9cc:
    sub r1, r0, #0x10
    cmp r2, r1
    bgt .L_9ec
    bge .L_cdc
    sub r1, r0, #0x40
    cmp r2, r1
    beq .L_cc4
    b .L_10dc
.L_9ec:
    sub r1, r0, #0xd
    cmp r2, r1
    bgt .L_a08
    sub r0, r0, #0xd
    cmp r2, r0
    beq .L_dac
    b .L_10dc
.L_a08:
    sub r0, r0, #0x6
    cmp r2, r0
    beq .L_f24
    b .L_10dc
.L_a18:
    add r1, r0, #0xda
    cmp r2, r1
    bgt .L_a70
    bge .L_d50
    cmp r2, #0x1500
    bgt .L_a44
    bge .L_df0
    add r0, r0, #0x2d
    cmp r2, r0
    beq .L_dd8
    b .L_10dc
.L_a44:
    add r1, r0, #0xb4
    cmp r2, r1
    bgt .L_a60
    add r0, r0, #0xb4
    cmp r2, r0
    beq .L_cfc
    b .L_10dc
.L_a60:
    add r0, r0, #0xc2
    cmp r2, r0
    beq .L_d28
    b .L_10dc
.L_a70:
    sub r1, r3, #0x4b
    cmp r2, r1
    bgt .L_aac
    bge .L_dac
    add r1, r0, #0xdc
    cmp r2, r1
    bgt .L_a9c
    add r0, r0, #0xdc
    cmp r2, r0
    beq .L_d50
    b .L_10dc
.L_a9c:
    sub r0, r3, #0x6b
    cmp r2, r0
    beq .L_f24
    b .L_10dc
.L_aac:
    sub r0, r3, #0x48
    cmp r2, r0
    bgt .L_ac0
    beq .L_d50
    b .L_10dc
.L_ac0:
    sub r0, r3, #0x40
    cmp r2, r0
    beq .L_f24
    b .L_10dc
.L_ad0:
    ldr r1, _LIT29
    cmp r2, r1
    bgt .L_b8c
    bge .L_dac
    sub r0, r1, #0x91
    cmp r2, r0
    bgt .L_b34
    bge .L_1058
    add r0, r3, #0xb6
    cmp r2, r0
    bgt .L_b10
    bge .L_e40
    add r0, r3, #0x4
    cmp r2, r0
    beq .L_f24
    b .L_10dc
.L_b10:
    sub r0, r1, #0x148
    cmp r2, r0
    bgt .L_b24
    beq .L_d50
    b .L_10dc
.L_b24:
    sub r0, r1, #0xd4
    cmp r2, r0
    beq .L_1058
    b .L_10dc
.L_b34:
    sub r0, r1, #0x63
    cmp r2, r0
    bgt .L_b68
    bge .L_d50
    sub r0, r1, #0x8d
    cmp r2, r0
    bgt .L_b58
    beq .L_f3c
    b .L_10dc
.L_b58:
    sub r0, r1, #0x81
    cmp r2, r0
    beq .L_d44
    b .L_10dc
.L_b68:
    sub r0, r1, #0x57
    cmp r2, r0
    bgt .L_b7c
    beq .L_1058
    b .L_10dc
.L_b7c:
    sub r0, r1, #0xc
    cmp r2, r0
    beq .L_f58
    b .L_10dc
.L_b8c:
    ldr r0, _LIT30
    cmp r2, r0
    bgt .L_be8
    bge .L_d44
    sub r1, r0, #0x76
    cmp r2, r1
    bgt .L_bbc
    bge .L_1098
    sub r0, r0, #0xac
    cmp r2, r0
    beq .L_d44
    b .L_10dc
.L_bbc:
    sub r1, r0, #0x6a
    cmp r2, r1
    bgt .L_bd8
    sub r0, r0, #0x6a
    cmp r2, r0
    beq .L_10c8
    b .L_10dc
.L_bd8:
    sub r0, r0, #0x5d
    cmp r2, r0
    beq .L_d44
    b .L_10dc
.L_be8:
    add r3, r0, #0xee
    cmp r2, r3
    bgt .L_c28
    mov r1, r3
    cmp r2, r1
    bge .L_d50
    add r1, r0, #0x40
    cmp r2, r1
    bgt .L_c1c
    add r0, r0, #0x40
    cmp r2, r0
    beq .L_d50
    b .L_10dc
.L_c1c:
    cmp r2, #0x1a00
    beq .L_d50
    b .L_10dc
.L_c28:
    add r0, r1, #0x224
    cmp r2, r0
    bgt .L_c3c
    beq .L_f58
    b .L_10dc
.L_c3c:
    ldr r1, _LIT31
    cmp r2, r1
    bgt .L_10dc
    sub r0, r1, #0x1
    cmp r2, r0
    blt .L_10dc
    cmpne r2, r1
    beq .L_f88
    b .L_10dc
.L_c60:
    ldr r0, [r6, #0x28]
    cmp r0, #0x7
    movle r0, #0x0
    strle r0, [r5, #0x2c]
    b .L_10dc
.L_c74:
    ldr r0, _LIT32
    ldr r1, [r0, #0xcec]
    cmp r1, r8
    ldreq r0, [r0, #0xcf8]
    cmpeq r0, #0x3
    bne .L_10dc
    mov r3, #0x0
    str r3, [r5, #0x2c]
    mov r0, r3
.L_c98:
    ldr r1, [r7, #0xa8]
    add r3, r3, #0x1
    cmp r8, r1
    ldreq r2, [r5, #0x4]
    ldreq r1, [r7, #0xac]
    cmpeq r2, r1
    streq r0, [r7, #0x9c]
    cmp r3, #0x2
    add r7, r7, #0x14
    blt .L_c98
    b .L_10dc
.L_cc4:
    ldr r1, [r6, #0x1c]
    sub r0, r0, #0xd50
    cmp r1, r0
    movge r0, #0x0
    strge r0, [r5, #0x2c]
    b .L_10dc
.L_cdc:
    ldr r1, [r7, #0x1c]
    mov r0, r8
    bl func_ov002_021b3538
    ldr r1, _LIT14
    cmp r0, r1
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    b .L_10dc
.L_cfc:
    ldr r0, [r5]
    bl func_ov002_021bbe70
    cmp r0, #0x1
    bne .L_10dc
    ldr r0, [r6, #0x10]
    bl func_0202f994
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r6, #0x34]
    b .L_10dc
.L_d28:
    ldr r1, [r7, #0x20]
    mov r0, r4
    bl func_ov002_021c921c
    tst r0, #0x7c
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    b .L_10dc
.L_d44:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_10dc
.L_d50:
    mov r0, #0x0
    str r0, [r5, #0x2c]
    b .L_10dc
.L_d5c:
    ldr r1, [r7, #0x20]
    mov r0, r4
    mov r2, #0x2
    bl func_ov002_021c92ec
    cmp r0, #0x0
    cmpne sl, #0x0
    beq .L_10dc
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r5, #0x10]
    mov r0, r7
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x20]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x1
    bl func_ov002_021d58dc
    b .L_10dc
.L_da4:
    mov r0, #0x0
    str r0, [r5, #0x2c]
.L_dac:
    mov r3, #0x0
    ldr r2, _LIT0
    mov r0, r3
.L_db8:
    ldr r1, [r2, #0xa8]
    add r3, r3, #0x1
    cmp r8, r1
    streq r0, [r2, #0x9c]
    cmp r3, #0x2
    add r2, r2, #0x14
    blt .L_db8
    b .L_10dc
.L_dd8:
    ldr r1, [r5, #0x1c]
    ldr r0, [r6, #0x1c]
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r5, #0x2c]
    b .L_10dc
.L_df0:
    ldr r0, _LIT0
    rsb r1, r8, #0x1
    mov r2, #0x0
.L_dfc:
    ldr r3, [r0, #0xa0]
    cmp r8, r3
    ldreq r7, [r5, #0x4]
    ldreq r3, [r0, #0xa4]
    cmpeq r7, r3
    ldreq r3, [r0, #0xa8]
    cmpeq r1, r3
    bne .L_e2c
    ldr r3, [r0, #0x9c]
    add r3, r3, #0x1
    mov r3, r3, lsr #0x1
    str r3, [r0, #0x9c]
.L_e2c:
    add r2, r2, #0x1
    cmp r2, #0x2
    add r0, r0, #0x14
    blt .L_dfc
    b .L_10dc
.L_e40:
    ldr r2, [r7, #0x1c]
    mov r1, #0x14
    ldr r0, _LIT17
    ldr r3, _LIT33
    and r7, r8, #0x1
    mla r0, r7, r0, r3
    mul r1, r2, r1
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    bne .L_10dc
    mov r0, #0x0
    str r0, [r5, #0x2c]
    cmp sl, #0x0
    beq .L_10dc
    ldr r1, [r5, #0x4]
    ldr r2, [r5, #0xc]
    mov r0, r8
    bl func_ov002_021df53c
    mov r0, #0x0
    str r0, [sp]
    ldr r2, _LIT0
    mov r0, r4
    ldr r1, [r2, #0x20]
    ldr r2, [r2, #0x1c]
    and r3, r8, #0xff
    and r2, r2, #0xff
    orr r2, r3, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x6
    bl func_ov002_021d58dc
    b .L_10dc
.L_ec0:
    ldr r2, [r7, #0x1c]
    mov r1, #0x14
    ldr r0, _LIT17
    ldr r3, _LIT33
    and r7, r8, #0x1
    mla r0, r7, r0, r3
    mul r1, r2, r1
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r5, #0x2c]
    b .L_10dc
.L_ef0:
    ldr r2, [r7, #0x1c]
    mov r0, r8
    mov r1, #0x3
    bl func_ov002_021bbae0
    cmp r0, #0x0
    beq .L_10dc
    ldr r0, [r6, #0x10]
    bl func_0202f994
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r6, #0x34]
    b .L_10dc
.L_f24:
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1, #0x20]
    bl func_ov002_021b8f20
    str r0, [r6, #0x34]
    b .L_10dc
.L_f3c:
    ldr r0, [r6, #0x10]
    bl func_0202f994
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r6, #0x34]
    b .L_10dc
.L_f58:
    cmp r8, r4
    beq .L_f7c
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1, #0x20]
    bl func_ov002_021b8f20
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_f80
.L_f7c:
    mov r0, #0x0
.L_f80:
    str r0, [r6, #0x34]
    b .L_10dc
.L_f88:
    ldr r1, _LIT0
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_10dc
    cmp r8, r4
    beq .L_fc4
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1, #0x20]
    bl func_ov002_021b8f20
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_fc8
.L_fc4:
    mov r0, #0x0
.L_fc8:
    str r0, [r6, #0x34]
    b .L_10dc
_LIT0: .word data_ov002_022cd314
_LIT1: .word data_ov002_022cf0cc
_LIT2: .word data_ov002_022cd340
_LIT3: .word 0x00001408
_LIT4: .word 0x00001625
_LIT5: .word 0x00001496
_LIT6: .word 0x000015ce
_LIT7: .word 0x00001620
_LIT8: .word 0x00001883
_LIT9: .word 0x000019f2
_LIT10: .word 0x00001493
_LIT11: .word 0x0000162e
_LIT12: .word 0x00001589
_LIT13: .word data_ov002_022cd3b0
_LIT14: .word 0x0000ffff
_LIT15: .word 0x000019b8
_LIT16: .word 0x000010f4
_LIT17: .word 0x00000868
_LIT18: .word data_ov002_022cf08c
_LIT19: .word 0x0000175e
_LIT20: .word 0x0000151e
_LIT21: .word 0x000015ec
_LIT22: .word 0x0000168d
_LIT23: .word 0x000016a3
_LIT24: .word 0x00001663
_LIT25: .word 0x00001a41
_LIT26: .word 0x00001a52
_LIT27: .word 0x00001890
_LIT28: .word 0x000014bc
_LIT29: .word 0x000018b8
_LIT30: .word 0x000019bf
_LIT31: .word 0x00001ade
_LIT32: .word data_ov002_022d008c
_LIT33: .word data_ov002_022cf0c2
.L_1058:
    mov r0, #0x0
    mov r1, #0x5
    bl func_ov002_021bbc24
    cmp r0, #0x0
    bne .L_1080
    mov r0, #0x1
    mov r1, #0x5
    bl func_ov002_021bbc24
    cmp r0, #0x0
    beq .L_10dc
.L_1080:
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1, #0x20]
    bl func_ov002_021b8f20
    str r0, [r6, #0x34]
    b .L_10dc
.L_1098:
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    bne .L_10dc
    ldr r0, _LIT17
    and r1, r8, #0x1
    mul r2, r1, r0
    ldr r0, _LIT34
    ldr r0, [r0, r2]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r5, #0x2c]
    b .L_10dc
.L_10c8:
    rsb r0, r8, #0x1
    bl func_ov002_021bbe70
    cmp r0, #0x1
    moveq r0, #0x0
    streq r0, [r5, #0x2c]
.L_10dc:
    ldr r0, [r5, #0x10]
    ldr r3, _LIT35
    cmp r0, r3
    bgt .L_1134
    bge .L_11cc
    sub r1, r3, #0xb
    cmp r0, r1
    bgt .L_1124
    cmp r0, #0x1700
    blt .L_1114
    beq .L_1220
    cmp r0, r1
    beq .L_1228
    b .L_1350
.L_1114:
    ldr r1, _LIT36
    cmp r0, r1
    beq .L_1220
    b .L_1350
.L_1124:
    sub r1, r3, #0x1
    cmp r0, r1
    beq .L_1178
    b .L_1350
.L_1134:
    ldr r2, _LIT37
    cmp r0, r2
    bgt .L_1154
    bge .L_12c0
    add r1, r3, #0xc8
    cmp r0, r1
    beq .L_126c
    b .L_1350
.L_1154:
    add r1, r2, #0x56
    cmp r0, r1
    bgt .L_1168
    beq .L_1220
    b .L_1350
.L_1168:
    ldr r1, _LIT38
    cmp r0, r1
    beq .L_1300
    b .L_1350
.L_1178:
    ldr r0, [r6, #0x24]
    cmp r0, #0x2
    cmpne r0, #0x3
    bne .L_1350
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r6, #0x30]
    cmp sl, #0x0
    beq .L_1350
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r5, #0x10]
    ldr r0, _LIT0
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x20]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d58dc
    b .L_1350
.L_11cc:
    ldr r0, [r6, #0x24]
    cmp r0, #0xf
    cmpne r0, #0x12
    bne .L_1350
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r6, #0x30]
    cmp sl, #0x0
    beq .L_1350
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r5, #0x10]
    ldr r0, _LIT0
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x20]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d58dc
    b .L_1350
.L_1220:
    cmp r8, r4
    beq .L_1350
.L_1228:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r6, #0x30]
    cmp sl, #0x0
    beq .L_1350
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r5, #0x10]
    ldr r0, _LIT0
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x20]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d58dc
    b .L_1350
.L_126c:
    cmp sl, #0x0
    ldrne r0, [r5, #0x2c]
    cmpne r0, #0x0
    beq .L_1350
    ldr r1, _LIT0
    mov r0, r8
    ldr r1, [r1, #0x1c]
    add r2, r3, #0xc7
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_1350
    ldr r3, [r5, #0xc]
    ldr r0, [r5, #0x10]
    mov r2, r3, lsl #0x10
    mov r1, r0, lsl #0x10
    and r0, r3, #0x1
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x4
    bl func_ov002_021e267c
    b .L_1350
.L_12c0:
    cmp sl, #0x0
    ldrne r1, [r5, #0x2c]
    cmpne r1, #0x0
    beq .L_1350
    ldr r1, [r6, #0x24]
    cmp r1, #0x4
    bne .L_1350
    ldr r3, [r5, #0xc]
    mov r1, r0, lsl #0x10
    mov r2, r3, lsl #0x10
    and r0, r3, #0x1
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x4
    bl func_ov002_021e267c
    b .L_1350
.L_1300:
    cmp sl, #0x0
    ldrne r0, [r6, #0x2c]
    cmpne r0, #0x0
    beq .L_1350
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1, #0x20]
    bl func_ov002_021b9dc4
    cmp r0, #0x0
    beq .L_1350
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r5, #0x10]
    ldr r0, _LIT0
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d58dc
.L_1350:
    ldr r7, _LIT0
    mov r9, #0x0
    mov fp, #0x3e8
.L_135c:
    ldr r0, [r7, #0xa0]
    cmp r8, r0
    ldreq r1, [r5, #0x4]
    ldreq r0, [r7, #0xa4]
    cmpeq r1, r0
    bne .L_13c4
    ldr r0, [r7, #0x9c]
    cmp r0, #0x0
    beq .L_13c4
    ldr r3, [r7, #0xa8]
    ldr r2, _LIT24
    mov r0, r8
    rsb r3, r3, #0x1
    bl func_ov002_021b30d8
    cmp r0, #0x0
    strne fp, [r7, #0x9c]
    ldr r0, [r7, #0xa8]
    cmp r8, r0
    beq .L_13c4
    ldr r1, [r5, #0x4]
    ldr r2, _LIT27
    mov r0, r8
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r7, #0x9c]
.L_13c4:
    add r7, r7, #0x14
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_135c
    cmp r8, r4
    beq .L_143c
    ldr r0, _LIT17
    and r1, r8, #0x1
    mul r2, r1, r0
    ldr r0, _LIT39
    mov r1, #0xb
    ldr r0, [r0, r2]
    ldr r2, _LIT40
    mov r0, r0, lsr #0x17
    tst r0, #0x1
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    mov r0, r8
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    ldr r2, _LIT15
    mov r0, r8
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021b3f74
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
.L_143c:
    ldr r0, [r5, #0x2c]
    cmp r0, #0x0
    beq .L_1474
    ldr r0, [r5, #0x10]
    bl func_0202e558
    cmp r0, #0x0
    beq .L_1474
    ldr r2, _LIT41
    mov r0, r8
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
.L_1474:
    ldr r0, _LIT0
    ldr r2, _LIT42
    ldr r1, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021b306c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    ldr r0, _LIT0
    ldr r2, _LIT43
    ldr r1, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021b306c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    ldr r0, _LIT0
    ldr r2, _LIT44
    ldr r1, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021b306c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    ldr r0, _LIT0
    ldr r2, _LIT45
    ldr r1, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021b306c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    ldr r0, _LIT0
    ldr r2, _LIT46
    ldr r1, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    ldr r0, [r5, #0x10]
    bl func_0202ed3c
    cmp r0, #0x0
    beq .L_153c
    ldr r1, _LIT47
    mov r0, r8
    bl func_ov002_021bb4c8
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
.L_153c:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_1700
    ldr r0, [r5, #0x2c]
    cmp r0, #0x0
    beq .L_1700
    ldr r0, _LIT0
    ldr r3, _LIT48
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r2, r1, r0
    ldr r0, _LIT17
    and r7, r8, #0x1
    mla r0, r7, r0, r3
    ldrh fp, [r2, r0]
    cmp fp, #0x0
    beq .L_1700
.L_1580:
    ldr r0, _LIT49
    add r0, r0, fp, lsl #0x3
    str r0, [sp, #0x34]
    ldrh fp, [r0, #0x6]
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x6
    bcc .L_16f8
    cmp r0, #0xd
    ldr r0, [sp, #0x34]
    mov r7, #0x0
    ldrh r1, [r0]
    and r0, r1, #0xff
    str r0, [sp, #0x30]
    mov r0, r1, asr #0x8
    and r1, r0, #0xff
    mov r0, #0x14
    smulbb r9, r1, r0
    ldr r0, [sp, #0x30]
    str r1, [sp, #0x2c]
    and r2, r0, #0x1
    ldr r1, _LIT17
    ldr r0, _LIT18
    mla r0, r2, r1, r0
    str r0, [sp, #0x14]
    add r0, r0, r9
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    str r0, [sp, #0x28]
    ldreq r0, [sp, #0x3c]
    cmpeq r0, #0x0
    moveq r7, #0x1
    beq .L_16c8
    ldr r0, [sp, #0x28]
    bl func_0202e2ec
    cmp r0, #0x0
    beq .L_1680
    ldr r0, [sp, #0x34]
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    add r0, r0, #0xf6
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    bhi .L_1680
    ldr r0, [sp, #0x14]
    add r0, r0, r9
    ldr r1, [r0, #0x40]
    ldrh r2, [r0, #0x38]
    mov r0, r1, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r0, r2, r0
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    movne r7, #0x1
    bne .L_16c8
.L_1680:
    ldr r1, [sp, #0x28]
    ldr r0, _LIT50
    cmp r1, r0
    bne .L_16c8
    ldr r0, [sp, #0x14]
    add r1, r0, r9
    ldr r0, [r1, #0x40]
    ldrh r2, [r1, #0x38]
    mov r1, r0, lsr #0x6
    and r1, r1, #0x1
    mvn r1, r1
    and r2, r2, r1
    mov r1, r0, lsr #0x2
    orr r0, r1, r0, lsr #0x1
    and r0, r0, #0x1
    mvn r0, r0
    tst r2, r0
    movne r7, #0x1
.L_16c8:
    cmp r7, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    cmpne sl, #0x0
    beq .L_16f8
    mov r2, #0x0
    str r2, [sp]
    ldr r0, [sp, #0x30]
    ldr r1, [sp, #0x2c]
    ldr r2, _LIT51
    mov r3, #0x1
    bl func_ov002_021d58dc
.L_16f8:
    cmp fp, #0x0
    bne .L_1580
.L_1700:
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1, #0x20]
    bl func_ov002_021b8f20
    cmp r0, #0x0
    beq .L_17d0
    ldr r0, _LIT0
    ldr r2, _LIT52
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r3, #0x1
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    movne r3, #0x1
    strne r3, [r6, #0x34]
    cmpne sl, #0x0
    beq .L_1760
    ldr r1, [r6, #0xc]
    mov r0, r8
    mov r2, r1, lsl #0x10
    rsb r1, r3, #0x1600
    mov r3, r2, lsr #0x10
    mov r2, #0x4
    bl func_ov002_021e267c
.L_1760:
    ldr r0, _LIT0
    ldr r2, _LIT53
    ldr r1, [r0, #0x1c]
    mov r0, r8
    eor r3, r4, #0x1
    bl func_ov002_021b30d8
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r6, #0x34]
    ldr r0, [r5, #0x24]
    cmp r0, #0x3
    bne .L_17d0
    ldr r1, _LIT54
    mov r0, r8
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    beq .L_17d0
    ldr r0, _LIT0
    ldr r1, _LIT54
    ldr r2, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021bad9c
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    add r0, r0, #0x1
    str r0, [r6, #0x34]
.L_17d0:
    cmp sl, #0x0
    beq .L_1814
    ldr r0, _LIT0
    ldr r2, _LIT55
    ldr r1, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_1814
    mov r1, #0x0
    ldr r0, _LIT0
    str r1, [sp]
    ldr r1, [r0, #0x20]
    ldr r2, _LIT55
    mov r0, r4
    mov r3, #0x4
    bl func_ov002_021d58dc
.L_1814:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_1f40
    ldr r2, [r6, #0x10]
    ldr r0, _LIT56
    cmp r2, r0
    bgt .L_19c0
    bge .L_1e10
    sub r1, r0, #0x1a8
    cmp r2, r1
    bgt .L_1900
    bge .L_1c80
    sub r1, r0, #0x250
    cmp r2, r1
    bgt .L_18bc
    sub r0, r0, #0x250
    cmp r2, r0
    bge .L_1c4c
    ldr r0, _LIT57
    cmp r2, r0
    bgt .L_187c
    bge .L_1b44
    sub r0, r0, #0x1a
    cmp r2, r0
    beq .L_1c98
    b .L_1f40
.L_187c:
    ldr r1, _LIT58
    cmp r2, r1
    bgt .L_1890
    beq .L_1b58
    b .L_1f40
.L_1890:
    add r0, r1, #0x6e
    cmp r2, r0
    bgt .L_1f40
    add r0, r1, #0x6c
    cmp r2, r0
    blt .L_1f40
    beq .L_1c40
    add r0, r1, #0x6e
    cmp r2, r0
    beq .L_1dac
    b .L_1f40
.L_18bc:
    ldr r1, _LIT59
    cmp r2, r1
    bgt .L_18dc
    bge .L_1bc4
    sub r0, r1, #0x30
    cmp r2, r0
    beq .L_1bac
    b .L_1f40
.L_18dc:
    add r0, r1, #0x3
    cmp r2, r0
    bgt .L_18f0
    beq .L_1c54
    b .L_1f40
.L_18f0:
    add r0, r1, #0xa
    cmp r2, r0
    beq .L_1e10
    b .L_1f40
.L_1900:
    sub r1, r0, #0xf9
    cmp r2, r1
    bgt .L_1958
    sub r0, r0, #0xf9
    cmp r2, r0
    bge .L_1c40
    ldr r1, _LIT60
    cmp r2, r1
    bgt .L_1934
    bge .L_1be8
    cmp r2, #0x1500
    beq .L_1cd8
    b .L_1f40
.L_1934:
    add r0, r1, #0xe
    cmp r2, r0
    bgt .L_1948
    beq .L_1c14
    b .L_1f40
.L_1948:
    add r0, r1, #0x26
    cmp r2, r0
    beq .L_1c40
    b .L_1f40
.L_1958:
    sub r1, r0, #0x4c
    cmp r2, r1
    bgt .L_1994
    bge .L_1c40
    sub r1, r0, #0x6f
    cmp r2, r1
    bgt .L_1984
    sub r0, r0, #0x6f
    cmp r2, r0
    beq .L_1e10
    b .L_1f40
.L_1984:
    sub r0, r0, #0x4f
    cmp r2, r0
    beq .L_1c54
    b .L_1f40
.L_1994:
    sub r1, r0, #0x44
    cmp r2, r1
    bgt .L_19b0
    sub r0, r0, #0x44
    cmp r2, r0
    beq .L_1e10
    b .L_1f40
.L_19b0:
    sub r0, r0, #0x4
    cmp r2, r0
    beq .L_1cd8
    b .L_1f40
.L_19c0:
    ldr r1, _LIT29
    cmp r2, r1
    bgt .L_1a70
    bge .L_1c54
    sub r3, r1, #0x8d
    cmp r2, r3
    bgt .L_1a2c
    bge .L_1e28
    sub r3, r1, #0x148
    cmp r2, r3
    bgt .L_1a08
    sub r1, r1, #0x148
    cmp r2, r1
    bge .L_1c40
    add r0, r0, #0xb2
    cmp r2, r0
    beq .L_1d28
    b .L_1f40
.L_1a08:
    sub r0, r1, #0xd4
    cmp r2, r0
    bgt .L_1a1c
    beq .L_1ebc
    b .L_1f40
.L_1a1c:
    sub r0, r1, #0x91
    cmp r2, r0
    beq .L_1ebc
    b .L_1f40
.L_1a2c:
    sub r0, r1, #0x63
    cmp r2, r0
    bgt .L_1a4c
    bge .L_1c40
    sub r0, r1, #0x81
    cmp r2, r0
    beq .L_1c34
    b .L_1f40
.L_1a4c:
    sub r0, r1, #0x57
    cmp r2, r0
    bgt .L_1a60
    beq .L_1ebc
    b .L_1f40
.L_1a60:
    sub r0, r1, #0xc
    cmp r2, r0
    beq .L_1e44
    b .L_1f40
.L_1a70:
    ldr r0, _LIT30
    cmp r2, r0
    bgt .L_1acc
    bge .L_1c34
    sub r1, r0, #0x76
    cmp r2, r1
    bgt .L_1aa0
    bge .L_1efc
    sub r0, r0, #0xac
    cmp r2, r0
    beq .L_1c34
    b .L_1f40
.L_1aa0:
    sub r1, r0, #0x6a
    cmp r2, r1
    bgt .L_1abc
    sub r0, r0, #0x6a
    cmp r2, r0
    beq .L_1f2c
    b .L_1f40
.L_1abc:
    sub r0, r0, #0x5d
    cmp r2, r0
    beq .L_1c34
    b .L_1f40
.L_1acc:
    add r3, r0, #0xee
    cmp r2, r3
    bgt .L_1b0c
    mov r1, r3
    cmp r2, r1
    bge .L_1c40
    add r1, r0, #0x40
    cmp r2, r1
    bgt .L_1b00
    add r0, r0, #0x40
    cmp r2, r0
    beq .L_1c40
    b .L_1f40
.L_1b00:
    cmp r2, #0x1a00
    beq .L_1c40
    b .L_1f40
.L_1b0c:
    add r0, r1, #0x224
    cmp r2, r0
    bgt .L_1b20
    beq .L_1e44
    b .L_1f40
.L_1b20:
    ldr r1, _LIT31
    cmp r2, r1
    bgt .L_1f40
    sub r0, r1, #0x1
    cmp r2, r0
    blt .L_1f40
    cmpne r2, r1
    beq .L_1e74
    b .L_1f40
.L_1b44:
    ldr r0, [r5, #0x28]
    cmp r0, #0x7
    movle r0, #0x0
    strle r0, [r6, #0x2c]
    b .L_1f40
.L_1b58:
    ldr r0, _LIT32
    ldr r1, [r0, #0xcec]
    cmp r1, r4
    ldreq r0, [r0, #0xcf8]
    cmpeq r0, #0x3
    bne .L_1f40
    mov r7, #0x0
    ldr r3, _LIT0
    str r7, [r6, #0x2c]
    mov r0, r7
.L_1b80:
    ldr r1, [r3, #0xa8]
    add r7, r7, #0x1
    cmp r4, r1
    ldreq r2, [r6, #0x4]
    ldreq r1, [r3, #0xac]
    cmpeq r2, r1
    streq r0, [r3, #0x9c]
    cmp r7, #0x2
    add r3, r3, #0x14
    blt .L_1b80
    b .L_1f40
.L_1bac:
    ldr r2, [r5, #0x1c]
    sub r0, r1, #0xd40
    cmp r2, r0
    movge r0, #0x0
    strge r0, [r6, #0x2c]
    b .L_1f40
.L_1bc4:
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1, #0x20]
    bl func_ov002_021b3538
    ldr r1, _LIT14
    cmp r0, r1
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    b .L_1f40
.L_1be8:
    ldr r0, [r6]
    bl func_ov002_021bbe70
    cmp r0, #0x1
    bne .L_1f40
    ldr r0, [r5, #0x10]
    bl func_0202f994
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r5, #0x34]
    b .L_1f40
.L_1c14:
    ldr r1, _LIT0
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c921c
    tst r0, #0x7c
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    b .L_1f40
.L_1c34:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_1f40
.L_1c40:
    mov r0, #0x0
    str r0, [r6, #0x2c]
    b .L_1f40
.L_1c4c:
    mov r0, #0x0
    str r0, [r6, #0x2c]
.L_1c54:
    mov r3, #0x0
    ldr r2, _LIT0
    mov r0, r3
.L_1c60:
    ldr r1, [r2, #0xa8]
    add r3, r3, #0x1
    cmp r4, r1
    streq r0, [r2, #0x9c]
    cmp r3, #0x2
    add r2, r2, #0x14
    blt .L_1c60
    b .L_1f40
.L_1c80:
    ldr r1, [r5, #0x1c]
    ldr r0, [r6, #0x1c]
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r6, #0x2c]
    b .L_1f40
.L_1c98:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    bne .L_1f40
    ldr r1, _LIT0
    rsb r2, r4, #0x1
    mov r3, #0x0
.L_1cb0:
    ldr r0, [r1, #0xa8]
    add r3, r3, #0x1
    cmp r2, r0
    ldreq r0, [r1, #0x9c]
    moveq r0, r0, lsl #0x1
    streq r0, [r1, #0x9c]
    cmp r3, #0x2
    add r1, r1, #0x14
    blt .L_1cb0
    b .L_1f40
.L_1cd8:
    ldr r0, _LIT0
    rsb r1, r4, #0x1
    mov r2, #0x0
.L_1ce4:
    ldr r3, [r0, #0xa0]
    cmp r4, r3
    ldreq r7, [r6, #0x4]
    ldreq r3, [r0, #0xa4]
    cmpeq r7, r3
    ldreq r3, [r0, #0xa8]
    cmpeq r1, r3
    bne .L_1d14
    ldr r3, [r0, #0x9c]
    add r3, r3, #0x1
    mov r3, r3, lsr #0x1
    str r3, [r0, #0x9c]
.L_1d14:
    add r2, r2, #0x1
    cmp r2, #0x2
    add r0, r0, #0x14
    blt .L_1ce4
    b .L_1f40
.L_1d28:
    ldr r1, _LIT0
    ldr r0, _LIT17
    ldr r2, [r1, #0x20]
    mov r1, #0x14
    ldr r3, _LIT33
    and r7, r4, #0x1
    mul r1, r2, r1
    mla r0, r7, r0, r3
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    bne .L_1f40
    mov r0, #0x0
    str r0, [r6, #0x2c]
    cmp sl, #0x0
    beq .L_1f40
    ldr r1, [r6, #0x4]
    ldr r2, [r6, #0xc]
    mov r0, r4
    bl func_ov002_021df53c
    mov r1, #0x0
    ldr r0, _LIT0
    str r1, [sp]
    ldr r2, [r0, #0x20]
    ldr r1, [r0, #0x1c]
    and r2, r2, #0xff
    mov r0, r8
    and r3, r4, #0xff
    orr r2, r3, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x6
    bl func_ov002_021d58dc
    b .L_1f40
.L_1dac:
    ldr r1, _LIT0
    ldr r0, _LIT17
    ldr r2, [r1, #0x20]
    mov r1, #0x14
    ldr r3, _LIT33
    and r7, r4, #0x1
    mul r1, r2, r1
    mla r0, r7, r0, r3
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r6, #0x2c]
    cmp sl, #0x0
    beq .L_1f40
    ldr r1, [r6, #0x4]
    ldr r2, [r6, #0xc]
    mov r0, r4
    bl func_ov002_021df53c
    ldr r0, _LIT0
    ldr r3, _LIT61
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r2, #0x1
    bl func_ov002_021d93bc
    b .L_1f40
.L_1e10:
    ldr r1, _LIT0
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b8f20
    str r0, [r5, #0x34]
    b .L_1f40
.L_1e28:
    ldr r0, [r5, #0x10]
    bl func_0202f994
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r5, #0x34]
    b .L_1f40
.L_1e44:
    cmp r8, r4
    beq .L_1e68
    ldr r1, _LIT0
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b8f20
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_1e6c
.L_1e68:
    mov r0, #0x0
.L_1e6c:
    str r0, [r5, #0x34]
    b .L_1f40
.L_1e74:
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1, #0x20]
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_1f40
    cmp r8, r4
    beq .L_1eb0
    ldr r1, _LIT0
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b8f20
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_1eb4
.L_1eb0:
    mov r0, #0x0
.L_1eb4:
    str r0, [r5, #0x34]
    b .L_1f40
.L_1ebc:
    mov r0, #0x0
    mov r1, #0x5
    bl func_ov002_021bbc24
    cmp r0, #0x0
    bne .L_1ee4
    mov r0, #0x1
    mov r1, #0x5
    bl func_ov002_021bbc24
    cmp r0, #0x0
    beq .L_1f40
.L_1ee4:
    ldr r1, _LIT0
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b8f20
    str r0, [r5, #0x34]
    b .L_1f40
.L_1efc:
    ldr r0, [r6, #0x8]
    cmp r0, #0x0
    bne .L_1f40
    ldr r0, _LIT17
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT34
    ldr r0, [r0, r2]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r6, #0x2c]
    b .L_1f40
.L_1f2c:
    rsb r0, r4, #0x1
    bl func_ov002_021bbe70
    cmp r0, #0x1
    moveq r0, #0x0
    streq r0, [r6, #0x2c]
.L_1f40:
    ldr r0, [r6, #0x10]
    ldr r2, _LIT35
    cmp r0, r2
    bgt .L_1f98
    bge .L_201c
    sub r1, r2, #0xb
    cmp r0, r1
    bgt .L_1f88
    cmp r0, #0x1700
    blt .L_1f78
    beq .L_20e4
    cmp r0, r1
    beq .L_20ec
    b .L_21c0
.L_1f78:
    ldr r1, _LIT36
    cmp r0, r1
    beq .L_20e4
    b .L_21c0
.L_1f88:
    sub r1, r2, #0x1
    cmp r0, r1
    beq .L_1fc8
    b .L_21c0
.L_1f98:
    ldr r1, _LIT37
    cmp r0, r1
    bgt .L_1fb8
    bge .L_2184
    add r1, r2, #0xc8
    cmp r0, r1
    beq .L_2130
    b .L_21c0
.L_1fb8:
    add r1, r1, #0x56
    cmp r0, r1
    beq .L_20e4
    b .L_21c0
.L_1fc8:
    ldr r0, [r5, #0x24]
    cmp r0, #0x2
    cmpne r0, #0x3
    bne .L_21c0
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r5, #0x30]
    cmp sl, #0x0
    beq .L_21c0
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r6, #0x10]
    ldr r0, _LIT62
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d58dc
    b .L_21c0
.L_201c:
    ldr r0, [r5, #0x24]
    cmp r0, #0xf
    cmpne r0, #0x12
    bne .L_21c0
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r5, #0x30]
    cmp sl, #0x0
    beq .L_21c0
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r6, #0x10]
    ldr r0, _LIT62
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d58dc
    b .L_21c0
_LIT34: .word data_ov002_022cf098
_LIT35: .word 0x0000170e
_LIT36: .word 0x00001441
_LIT37: .word 0x00001950
_LIT38: .word 0x00001a93
_LIT39: .word data_ov002_022cf1a8
_LIT40: .word 0x00001805
_LIT41: .word 0x00001594
_LIT42: .word 0x0000150a
_LIT43: .word 0x000017ff
_LIT44: .word 0x00001992
_LIT45: .word 0x00001a18
_LIT46: .word 0x00001957
_LIT47: .word 0x00001a05
_LIT48: .word data_ov002_022cf0c6
_LIT49: .word data_ov002_022d0570
_LIT50: .word 0x00001989
_LIT51: .word 0x000015b3
_LIT52: .word 0x000015ff
_LIT53: .word 0x0000165f
_LIT54: .word 0x000014b5
_LIT55: .word 0x000018cd
_LIT56: .word 0x00001691
_LIT57: .word 0x000012ac
_LIT58: .word 0x000013cb
_LIT59: .word 0x000014ac
_LIT60: .word 0x00001570
_LIT61: .word 0x00001439
_LIT62: .word data_ov002_022cd314
.L_20e4:
    cmp r8, r4
    beq .L_21c0
.L_20ec:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r5, #0x30]
    cmp sl, #0x0
    beq .L_21c0
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r6, #0x10]
    ldr r0, _LIT62
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d58dc
    b .L_21c0
.L_2130:
    cmp sl, #0x0
    ldrne r0, [r6, #0x2c]
    cmpne r0, #0x0
    beq .L_21c0
    ldr r1, _LIT62
    mov r0, r4
    ldr r1, [r1, #0x20]
    add r2, r2, #0xc7
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_21c0
    ldr r3, [r6, #0xc]
    ldr r0, [r6, #0x10]
    mov r2, r3, lsl #0x10
    mov r1, r0, lsl #0x10
    and r0, r3, #0x1
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x4
    bl func_ov002_021e267c
    b .L_21c0
.L_2184:
    cmp sl, #0x0
    ldrne r1, [r6, #0x2c]
    cmpne r1, #0x0
    beq .L_21c0
    ldr r1, [r5, #0x24]
    cmp r1, #0x4
    bne .L_21c0
    ldr r3, [r6, #0xc]
    mov r1, r0, lsl #0x10
    mov r2, r3, lsl #0x10
    and r0, r3, #0x1
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x4
    bl func_ov002_021e267c
.L_21c0:
    ldr r7, _LIT62
    mov r9, #0x0
    mov fp, #0x3e8
.L_21cc:
    ldr r0, [r7, #0xa0]
    cmp r4, r0
    ldreq r1, [r6, #0x4]
    ldreq r0, [r7, #0xa4]
    cmpeq r1, r0
    bne .L_2234
    ldr r0, [r7, #0x9c]
    cmp r0, #0x0
    beq .L_2234
    ldr r3, [r7, #0xa8]
    ldr r2, _LIT63
    mov r0, r4
    rsb r3, r3, #0x1
    bl func_ov002_021b30d8
    cmp r0, #0x0
    strne fp, [r7, #0x9c]
    ldr r0, [r7, #0xa8]
    cmp r4, r0
    beq .L_2234
    ldr r1, [r6, #0x4]
    ldr r2, _LIT64
    mov r0, r4
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r7, #0x9c]
.L_2234:
    add r7, r7, #0x14
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_21cc
    cmp r8, r4
    beq .L_22ac
    ldr r0, _LIT65
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT39
    mov r1, #0xb
    ldr r0, [r0, r2]
    ldr r2, _LIT40
    mov r0, r0, lsr #0x17
    tst r0, #0x1
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    mov r0, r4
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    ldr r2, _LIT66
    mov r0, r4
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021b3f74
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
.L_22ac:
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    beq .L_22e4
    ldr r0, [r6, #0x10]
    bl func_0202e558
    cmp r0, #0x0
    beq .L_22e4
    ldr r2, _LIT41
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
.L_22e4:
    ldr r0, _LIT62
    ldr r2, _LIT42
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b306c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    ldr r0, _LIT62
    ldr r2, _LIT43
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b306c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    ldr r0, _LIT62
    ldr r2, _LIT44
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b306c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    ldr r0, _LIT62
    ldr r2, _LIT45
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b306c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    ldr r0, _LIT62
    ldr r2, _LIT46
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    ldr r0, [r6, #0x10]
    bl func_0202ed3c
    cmp r0, #0x0
    beq .L_23ac
    ldr r1, _LIT47
    mov r0, r4
    bl func_ov002_021bb4c8
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
.L_23ac:
    ldr r0, _LIT62
    ldr r2, _LIT67
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    ldr r0, _LIT62
    ldr r2, _LIT68
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_25b0
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    beq .L_25b0
    ldr r0, _LIT62
    ldr r3, _LIT48
    ldr r1, [r0, #0x20]
    mov r0, #0x14
    mul r2, r1, r0
    ldr r0, _LIT65
    and r7, r4, #0x1
    mla r0, r7, r0, r3
    ldrh fp, [r2, r0]
    cmp fp, #0x0
    beq .L_25b0
.L_2430:
    ldr r0, _LIT49
    add r0, r0, fp, lsl #0x3
    str r0, [sp, #0x24]
    ldrh fp, [r0, #0x6]
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x6
    bcc .L_25a8
    cmp r0, #0xd
    ldr r0, [sp, #0x24]
    mov r7, #0x0
    ldrh r1, [r0]
    and r0, r1, #0xff
    str r0, [sp, #0x20]
    mov r0, r1, asr #0x8
    and r1, r0, #0xff
    mov r0, #0x14
    smulbb r9, r1, r0
    ldr r0, [sp, #0x20]
    str r1, [sp, #0x1c]
    and r2, r0, #0x1
    ldr r1, _LIT65
    ldr r0, _LIT69
    mla r0, r2, r1, r0
    str r0, [sp, #0x10]
    add r0, r0, r9
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    str r0, [sp, #0x18]
    ldreq r0, [sp, #0x8]
    cmpeq r0, #0x0
    moveq r7, #0x1
    beq .L_2578
    ldr r0, [sp, #0x18]
    bl func_0202e2ec
    cmp r0, #0x0
    beq .L_2530
    ldr r0, [sp, #0x24]
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    add r0, r0, #0xf6
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    bhi .L_2530
    ldr r0, [sp, #0x10]
    add r0, r0, r9
    ldr r1, [r0, #0x40]
    ldrh r2, [r0, #0x38]
    mov r0, r1, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r0, r2, r0
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    movne r7, #0x1
    bne .L_2578
.L_2530:
    ldr r1, [sp, #0x18]
    ldr r0, _LIT50
    cmp r1, r0
    bne .L_2578
    ldr r0, [sp, #0x10]
    add r1, r0, r9
    ldr r0, [r1, #0x40]
    ldrh r2, [r1, #0x38]
    mov r1, r0, lsr #0x6
    and r1, r1, #0x1
    mvn r1, r1
    and r2, r2, r1
    mov r1, r0, lsr #0x2
    orr r0, r1, r0, lsr #0x1
    and r0, r0, #0x1
    mvn r0, r0
    tst r2, r0
    movne r7, #0x1
.L_2578:
    cmp r7, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    cmpne sl, #0x0
    beq .L_25a8
    mov r2, #0x0
    str r2, [sp]
    ldr r0, [sp, #0x20]
    ldr r1, [sp, #0x1c]
    ldr r2, _LIT51
    mov r3, #0x1
    bl func_ov002_021d58dc
.L_25a8:
    cmp fp, #0x0
    bne .L_2430
.L_25b0:
    ldr r1, _LIT62
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b8f20
    cmp r0, #0x0
    beq .L_2638
    ldr r0, _LIT62
    ldr r2, _LIT53
    ldr r1, [r0, #0x20]
    mov r0, r4
    eor r3, r8, #0x1
    bl func_ov002_021b30d8
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r5, #0x34]
    ldr r0, [r6, #0x24]
    cmp r0, #0x3
    bne .L_2638
    ldr r1, _LIT54
    mov r0, r4
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    beq .L_2638
    ldr r0, _LIT62
    ldr r1, _LIT54
    ldr r2, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021bad9c
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    add r0, r0, #0x1
    str r0, [r5, #0x34]
.L_2638:
    cmp sl, #0x0
    beq .L_267c
    ldr r0, _LIT62
    ldr r2, _LIT55
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_267c
    mov r1, #0x0
    ldr r0, _LIT62
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    ldr r2, _LIT55
    mov r0, r8
    mov r3, #0x4
    bl func_ov002_021d58dc
.L_267c:
    cmp sl, #0x0
    beq .L_2714
    ldr r0, _LIT62
    ldr r2, _LIT70
    ldr r1, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    beq .L_26cc
    ldr r0, [r6, #0x24]
    cmp r0, #0x1
    bne .L_26cc
    mov r1, #0x0
    ldr r0, _LIT62
    str r1, [sp]
    ldr r1, [r0, #0x20]
    ldr r2, _LIT70
    mov r0, r4
    mov r3, #0x1
    bl func_ov002_021d58dc
.L_26cc:
    ldr r0, _LIT62
    ldr r2, _LIT70
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    beq .L_2714
    ldr r0, [r5, #0x24]
    cmp r0, #0x1
    bne .L_2714
    mov r1, #0x0
    ldr r0, _LIT62
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    ldr r2, _LIT70
    mov r0, r8
    mov r3, #0x1
    bl func_ov002_021d58dc
.L_2714:
    ldr r1, _LIT62
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    ldreq r0, [sp, #0x4]
    cmpeq r0, #0x0
    bne .L_28ac
    ldr r0, [r5, #0x2c]
    cmp r0, #0x0
    beq .L_27ec
    ldr r0, [sp, #0x3c]
    cmp r0, #0x0
    ldreq r2, [r5, #0x10]
    ldreq r0, _LIT71
    cmpeq r2, r0
    bne .L_27ec
    ldr r1, [r1, #0x1c]
    ldr r2, _LIT72
    mov r0, r8
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_27cc
    mov r0, #0x0
    str r0, [r5, #0x2c]
    cmp sl, #0x0
    beq .L_27ec
    ldr r1, [r5, #0x4]
    ldr r2, [r5, #0xc]
    mov r0, r8
    bl func_ov002_021df53c
    mov r1, #0x0
    ldr r0, _LIT62
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    ldr r2, _LIT72
    mov r0, r8
    mov r3, #0x2
    bl func_ov002_021d58dc
    mov r0, #0x0
    str r0, [sp]
    mov r0, r8
    ldr r1, _LIT62
    ldr r2, _LIT71
    ldr r1, [r1, #0x1c]
    mov r3, #0x4
    bl func_ov002_021d58dc
    b .L_27ec
.L_27cc:
    ldr r0, _LIT62
    ldr r2, _LIT71
    ldr r1, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
.L_27ec:
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    beq .L_28ac
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    ldreq r0, [r6, #0x10]
    ldreq r2, _LIT71
    cmpeq r0, r2
    bne .L_28ac
    cmp sl, #0x0
    beq .L_2890
    ldr r0, _LIT62
    ldr r2, _LIT72
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_28ac
    mov r0, #0x0
    str r0, [r6, #0x2c]
    ldr r1, [r6, #0x4]
    ldr r2, [r6, #0xc]
    mov r0, r4
    bl func_ov002_021df53c
    mov r1, #0x0
    ldr r0, _LIT62
    str r1, [sp]
    ldr r1, [r0, #0x20]
    ldr r2, _LIT72
    mov r0, r4
    mov r3, #0x2
    bl func_ov002_021d58dc
    mov r0, #0x0
    str r0, [sp]
    ldr r1, _LIT62
    mov r0, r4
    ldr r1, [r1, #0x20]
    ldr r2, _LIT71
    mov r3, #0x4
    bl func_ov002_021d58dc
    b .L_28ac
.L_2890:
    ldr r1, _LIT62
    mov r0, r4
    ldr r1, [r1, #0x20]
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
.L_28ac:
    cmp sl, #0x0
    cmpne r8, r4
    ldrne r0, [r5, #0x2c]
    cmpne r0, #0x0
    ldrne r0, [r6, #0x2c]
    cmpne r0, #0x0
    beq .L_28d4
    mov r0, #0x11
    mov r1, #0x1
    bl func_ov002_021b0afc
.L_28d4:
    ldr r0, [r5, #0x2c]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r5, #0x34]
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r6, #0x34]
    ldr r0, [r5, #0x2c]
    cmp r0, #0x0
    ldrne r0, [r6, #0x2c]
    cmpne r0, #0x0
    beq .L_2928
    ldr r0, [r5, #0x34]
    cmp r0, #0x2
    movlt r0, #0x0
    strlt r0, [r5, #0x34]
    ldr r0, [r6, #0x34]
    cmp r0, #0x2
    movlt r0, #0x0
    strlt r0, [r6, #0x34]
.L_2928:
    ldr r1, _LIT62
    ldr r0, _LIT73
    ldr r2, [r1, #0x9c]
    ldr r1, _LIT62
    cmp r2, r0
    movhi r2, r0
    str r2, [r1, #0x9c]
    ldr r0, _LIT73
    ldr r1, [r1, #0xb0]
    cmp r1, r0
    movhi r1, r0
    ldr r0, _LIT62
    str r1, [r0, #0xb0]
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT63: .word 0x00001663
_LIT64: .word 0x00001890
_LIT65: .word 0x00000868
_LIT66: .word 0x000019b8
_LIT67: .word 0x00001aac
_LIT68: .word 0x00001b2c
_LIT69: .word data_ov002_022cf08c
_LIT70: .word 0x00001392
_LIT71: .word 0x000018f1
_LIT72: .word 0x00000fb6
_LIT73: .word 0x0000ffff
