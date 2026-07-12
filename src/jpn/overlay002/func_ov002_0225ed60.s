; func_ov002_0225ed60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd340
        .extern data_ov002_022cd3d8
        .extern data_ov002_022cd3ec
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d008c
        .extern data_ov002_022d0570
        .extern func_0202e1e0
        .extern func_0202e2a4
        .extern func_ov002_021b3dec
        .extern func_ov002_021b3e2c
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b9af4
        .extern func_ov002_021bacd0
        .extern func_ov002_021baf88
        .extern func_ov002_021bb82c
        .extern func_ov002_021bd77c
        .extern func_ov002_021ca4dc
        .extern func_ov002_021d58dc
        .extern func_ov002_021d9054
        .extern func_ov002_021de390
        .extern func_ov002_021dec9c
        .extern func_ov002_021deda4
        .extern func_ov002_021df53c
        .extern func_ov002_021df5e4
        .extern func_ov002_021e267c
        .extern func_ov002_021e277c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021e2fc4
        .extern func_ov002_02254fd0
        .global func_ov002_0225ed60
        .arm
func_ov002_0225ed60:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xa0
    ldr r5, _LIT0
    mov r4, r0
    mov r2, #0x38
    rsb r0, r4, #0x1
    str r0, [sp, #0x14]
    mla r6, r4, r2, r5
    ldr r1, [sp, #0x14]
    ldr r0, [r6, #0x2c]
    mla r7, r1, r2, r5
    ldr r3, _LIT1
    cmp r0, #0x0
    ldr r5, [r3, #0x4]
    ldrne sl, _LIT2
    bne .L_60
    ldr r8, _LIT3
    and r3, r4, #0x1
    add r1, r2, #0x830
    mla r1, r3, r1, r8
    ldr r2, [r6, #0x4]
    add r3, r1, #0x30
    mov r1, #0x14
    mla sl, r2, r1, r3
.L_60:
    ldr r1, [r7, #0x2c]
    cmp r1, #0x0
    ldrne r2, _LIT4
    strne r2, [sp, #0x4]
    bne .L_98
    ldr r8, _LIT3
    ldr r2, _LIT5
    and r3, r5, #0x1
    mla r2, r3, r2, r8
    add r8, r2, #0x30
    ldr r3, [r7, #0x4]
    mov r2, #0x14
    mla r2, r3, r2, r8
    str r2, [sp, #0x4]
.L_98:
    ldr r2, [r6, #0x30]
    mov r8, #0x0
    cmp r2, #0x0
    bne .L_c4
    cmp r0, #0x0
    beq .L_c4
    ldr r0, _LIT1
    ldr r0, [r0, #0xc4]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    movne r8, #0x1
.L_c4:
    ldr r2, [r7, #0x30]
    mov r0, #0x0
    str r0, [sp, #0x24]
    cmp r2, #0x0
    bne .L_f8
    cmp r1, #0x0
    beq .L_f8
    ldr r0, _LIT1
    ldr r0, [r0, #0xd8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    movne r0, #0x1
    strne r0, [sp, #0x24]
.L_f8:
    ldr r0, _LIT5
    and r1, r4, #0x1
    mul r0, r1, r0
    ldr r2, _LIT3
    ldr r3, [r6, #0x4]
    mov r1, #0x14
    str r0, [sp, #0x18]
    add r2, r2, r0
    mul r0, r3, r1
    add r1, r2, #0x30
    ldr r3, [r1, r0]
    ldr r1, [r6, #0xc]
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp r1, r2
    mov r2, #0x0
    str r2, [sp, #0x20]
    bne .L_168
    ldr r3, _LIT6
    ldr r2, [sp, #0x18]
    add r2, r3, r2
    ldrh r0, [r0, r2]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x20]
.L_168:
    ldr r0, _LIT5
    and r2, r5, #0x1
    mul r9, r2, r0
    mov r0, #0x0
    ldr r2, _LIT3
    str r0, [sp, #0x1c]
    add r0, r2, r9
    add r2, r0, #0x30
    ldr fp, [r7, #0x4]
    mov r0, #0x14
    mul r3, fp, r0
    ldr fp, [r2, r3]
    ldr r2, [r7, #0xc]
    mov r0, fp, lsl #0x12
    mov fp, fp, lsl #0x2
    mov fp, fp, lsr #0x18
    mov fp, fp, lsl #0x1
    add r0, fp, r0, lsr #0x1f
    cmp r2, r0
    bne .L_1d0
    ldr r0, _LIT6
    add r0, r0, r9
    ldrh r0, [r3, r0]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x1c]
.L_1d0:
    ldr r0, _LIT1
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    addne sp, sp, #0xa0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT7
    ldr r0, [r0, #0xd30]
    cmp r0, #0x0
    beq .L_20c
    cmp r0, #0x1
    beq .L_2e8
    cmp r0, #0x2
    beq .L_a04
    b .L_1e60
.L_20c:
    mov r0, r6
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_26c
    ldr r2, [r6, #0x10]
    ldr r1, _LIT8
    cmp r2, r1
    beq .L_23c
    add r0, r1, #0xd6
    cmp r2, r0
    beq .L_254
    b .L_26c
.L_23c:
    mov r0, r4
    bl func_ov002_02254fd0
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r6, #0x30]
    b .L_26c
.L_254:
    mov r0, r4
    add r1, r1, #0xcb
    bl func_ov002_021bb82c
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [r6, #0x30]
.L_26c:
    mov r0, r7
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_2cc
    ldr r2, [r7, #0x10]
    ldr r1, _LIT8
    cmp r2, r1
    beq .L_29c
    add r0, r1, #0xd6
    cmp r2, r0
    beq .L_2b4
    b .L_2cc
.L_29c:
    mov r0, r5
    bl func_ov002_02254fd0
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r7, #0x30]
    b .L_2cc
.L_2b4:
    mov r0, r5
    add r1, r1, #0xcb
    bl func_ov002_021bb82c
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [r7, #0x30]
.L_2cc:
    ldr r1, _LIT7
    add sp, sp, #0xa0
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2e8:
    cmp r8, #0x0
    beq .L_350
    ldr r0, [r6, #0x10]
    bl func_ov002_021bd77c
    cmp r0, #0x0
    bne .L_350
    ldr r0, _LIT7
    ldr r3, [r6, #0xc]
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT9
    mov r1, #0xb
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_350
    ldr r1, [r6, #0x10]
    ldr r0, _LIT10
    cmp r1, r0
    bne .L_350
    ldr r0, [r6, #0xc]
    mov r1, r1, lsl #0x10
    mov r2, r0, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e267c
.L_350:
    cmp r8, #0x0
    beq .L_658
    ldr r0, [r7, #0x10]
    ldr r2, _LIT11
    cmp r0, r2
    bgt .L_39c
    bge .L_4d4
    ldr r1, _LIT12
    cmp r0, r1
    bgt .L_38c
    bge .L_444
    sub r1, r1, #0x6
    cmp r0, r1
    beq .L_410
    b .L_658
.L_38c:
    sub r1, r2, #0x68
    cmp r0, r1
    beq .L_490
    b .L_658
.L_39c:
    ldr r2, _LIT13
    cmp r0, r2
    bgt .L_3ec
    sub r1, r2, #0x8
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_3dc
    b .L_574
    b .L_574
    b .L_658
    b .L_658
    b .L_658
    b .L_574
    b .L_574
    b .L_658
    b .L_574
.L_3dc:
    ldr r1, _LIT14
    cmp r0, r1
    beq .L_530
    b .L_658
.L_3ec:
    ldr r1, _LIT15
    cmp r0, r1
    bgt .L_400
    beq .L_5a4
    b .L_658
.L_400:
    add r1, r1, #0x1
    cmp r0, r1
    beq .L_5fc
    b .L_658
.L_410:
    ldr r1, [sp, #0x1c]
    cmp r1, #0x0
    beq .L_658
    mov r2, #0x0
    ldr r1, _LIT1
    str r2, [sp]
    mov r2, r0, lsl #0x10
    ldr r1, [r1, #0x20]
    mov r0, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x1
    bl func_ov002_021d58dc
    b .L_658
.L_444:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_658
    ldr r0, [r6, #0x10]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_658
    ldr r0, [r6, #0xc]
    ldr r1, _LIT1
    add r0, r5, r0, lsl #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldr r1, [r1, #0x20]
    ldr r2, _LIT12
    mov r0, r5
    mov r3, #0x2
    bl func_ov002_021d58dc
    b .L_658
.L_490:
    mov r0, r7
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_658
    ldr r2, [sl]
    ldr r1, _LIT16
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    mov r2, r0, lsl #0x10
    mov r0, r5
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e267c
    b .L_658
.L_4d4:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_658
    mov r0, r7
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_658
    ldr r0, _LIT1
    ldr r2, [r7, #0xc]
    ldr r1, [r0, #0x20]
    mov r0, r5
    bl func_ov002_021df53c
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r7, #0x10]
    ldr r0, _LIT1
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x20]
    mov r0, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x3
    bl func_ov002_021d58dc
    b .L_658
.L_530:
    ldr r1, _LIT1
    mov r0, r5
    ldr r1, [r1, #0x20]
    bl func_ov002_021b9af4
    cmp r0, #0x2
    bge .L_658
    ldr r0, _LIT1
    ldr r2, [r7, #0xc]
    ldr r1, [r0, #0x20]
    mov r0, r5
    bl func_ov002_021df53c
    ldr r1, _LIT1
    mov r0, r5
    ldr r1, [r1, #0x20]
    mov r2, #0x1
    bl func_ov002_021d9054
    b .L_658
.L_574:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_658
    mov r1, #0x0
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, #0x20]
    mov r0, r5
    sub r2, r2, #0x8
    mov r3, #0x2
    bl func_ov002_021d58dc
    b .L_658
.L_5a4:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_658
    ldr r0, _LIT7
    mov r1, #0x0
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT17
    cmp r0, r5
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x1
    and r0, r0, #0xff
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x2
    mov r3, r0, lsl #0x10
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, #0x20]
    mov r0, r5
    mov r3, r3, lsr #0x10
    bl func_ov002_021d58dc
    b .L_658
.L_5fc:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    ldrne r0, [r6, #0x34]
    cmpne r0, #0x0
    beq .L_658
    ldr r0, _LIT7
    mov r1, #0x0
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT17
    cmp r0, r5
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x1
    and r0, r0, #0xff
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x2
    mov r3, r0, lsl #0x10
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, #0x20]
    mov r0, r5
    mov r3, r3, lsr #0x10
    bl func_ov002_021d58dc
.L_658:
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    beq .L_6d8
    ldr r0, [r7, #0x10]
    ldr r1, [r7, #0xc]
    bl func_ov002_021bd77c
    cmp r0, #0x0
    bne .L_6d8
    ldr r0, _LIT7
    ldr r3, [r7, #0xc]
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT9
    mov r1, #0xb
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_6d8
    ldr r1, [r7, #0x10]
    ldr r0, _LIT10
    cmp r1, r0
    bne .L_6d8
    ldr r0, _LIT1
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    bne .L_6d8
    ldr r0, [r7, #0xc]
    mov r1, r1, lsl #0x10
    mov r2, r0, lsl #0x10
    mov r0, r5
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e267c
.L_6d8:
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    beq .L_9e8
    ldr r0, [r6, #0x10]
    ldr r2, _LIT11
    cmp r0, r2
    bgt .L_728
    bge .L_864
    ldr r1, _LIT12
    cmp r0, r1
    bgt .L_718
    bge .L_7d0
    sub r1, r1, #0x6
    cmp r0, r1
    beq .L_79c
    b .L_9e8
.L_718:
    sub r1, r2, #0x68
    cmp r0, r1
    beq .L_81c
    b .L_9e8
.L_728:
    ldr r2, _LIT13
    cmp r0, r2
    bgt .L_778
    sub r1, r2, #0x8
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_768
    b .L_904
    b .L_904
    b .L_9e8
    b .L_9e8
    b .L_9e8
    b .L_904
    b .L_904
    b .L_9e8
    b .L_904
.L_768:
    ldr r1, _LIT14
    cmp r0, r1
    beq .L_8c0
    b .L_9e8
.L_778:
    ldr r1, _LIT15
    cmp r0, r1
    bgt .L_78c
    beq .L_934
    b .L_9e8
.L_78c:
    add r1, r1, #0x1
    cmp r0, r1
    beq .L_98c
    b .L_9e8
.L_79c:
    ldr r1, [sp, #0x20]
    cmp r1, #0x0
    beq .L_9e8
    mov r2, #0x0
    ldr r1, _LIT1
    str r2, [sp]
    mov r2, r0, lsl #0x10
    ldr r1, [r1, #0x1c]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x1
    bl func_ov002_021d58dc
    b .L_9e8
.L_7d0:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_9e8
    ldr r0, [r7, #0x10]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_9e8
    ldr r0, [r7, #0xc]
    ldr r1, _LIT1
    add r0, r4, r0, lsl #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldr r1, [r1, #0x1c]
    ldr r2, _LIT12
    mov r0, r4
    mov r3, #0x2
    bl func_ov002_021d58dc
    b .L_9e8
.L_81c:
    mov r0, r6
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_9e8
    ldr r0, [sp, #0x4]
    ldr r1, _LIT16
    ldr r2, [r0]
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    mov r2, r0, lsl #0x10
    mov r3, r2, lsr #0x10
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_021e267c
    b .L_9e8
.L_864:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_9e8
    mov r0, r6
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_9e8
    ldr r0, _LIT1
    ldr r2, [r6, #0xc]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021df53c
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r6, #0x10]
    ldr r0, _LIT1
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x3
    bl func_ov002_021d58dc
    b .L_9e8
.L_8c0:
    ldr r1, _LIT1
    mov r0, r4
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b9af4
    cmp r0, #0x2
    bge .L_9e8
    ldr r0, _LIT1
    ldr r2, [r6, #0xc]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021df53c
    ldr r1, _LIT1
    mov r0, r4
    ldr r1, [r1, #0x1c]
    mov r2, #0x1
    bl func_ov002_021d9054
    b .L_9e8
.L_904:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_9e8
    mov r1, #0x0
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    sub r2, r2, #0x8
    mov r3, #0x2
    bl func_ov002_021d58dc
    b .L_9e8
.L_934:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_9e8
    ldr r0, _LIT7
    mov r1, #0x0
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT17
    cmp r0, r4
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x1
    and r0, r0, #0xff
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x2
    mov r3, r0, lsl #0x10
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r3, r3, lsr #0x10
    bl func_ov002_021d58dc
    b .L_9e8
.L_98c:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    ldrne r0, [r7, #0x34]
    cmpne r0, #0x0
    beq .L_9e8
    ldr r0, _LIT7
    mov r1, #0x0
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT17
    cmp r0, r4
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x1
    and r0, r0, #0xff
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x2
    mov r3, r0, lsl #0x10
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r3, r3, lsr #0x10
    bl func_ov002_021d58dc
.L_9e8:
    ldr r1, _LIT7
    add sp, sp, #0xa0
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a04:
    bl func_ov002_021e2a4c
    ldr r1, [r6, #0x30]
    mov r0, #0x0
    str r0, [sp, #0x2c]
    cmp r1, #0x0
    beq .L_a8c
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    beq .L_a74
    ldr r1, [sp, #0x2c]
    add r0, sp, #0x88
    str r1, [r0]
    ldrh r3, [sp, #0x8a]
    mov r2, r4, lsl #0x10
    mov r1, r2, lsr #0x10
    and r1, r1, #0x1
    bic r2, r3, #0x1
    orr r2, r2, r1
    ldr r1, [sp, #0x2c]
    strh r2, [sp, #0x8a]
    mov r2, r1
    str r2, [r0, #0x4]
    str r2, [r0, #0x8]
    str r2, [r0, #0xc]
    str r2, [r0, #0x10]
    str r2, [r0, #0x14]
    bl func_ov002_021deda4
    b .L_12a4
.L_a74:
    ldr r2, [sp, #0x2c]
    ldr r1, [r6, #0x4]
    mov r0, r4
    mov r3, r2
    bl func_ov002_021de390
    b .L_12a4
.L_a8c:
    cmp r8, #0x0
    beq .L_12a4
    add r3, sp, #0x6c
    sub r1, r0, #0x200
    str r0, [r3]
    and r3, r0, r1
    ldr r2, [r6, #0xc]
    ldr r0, _LIT18
    mov r1, r5, lsl #0x1f
    and r0, r2, r0
    orr r0, r3, r0
    bic r0, r0, #0x40000
    orr r0, r0, r1, lsr #0xd
    bic r1, r0, #0x200
    mov r0, r4, lsl #0x1f
    orr r0, r1, r0, lsr #0x16
    ldr r1, [r6, #0x4]
    bic r2, r0, #0x3c00
    mov r1, r1, lsl #0x1c
    ldr r0, [r6, #0x8]
    orr r1, r2, r1, lsr #0x12
    orr r1, r1, #0x20000
    bic r1, r1, #0x4000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x11
    orr r0, r0, #0x18000
    bic r0, r0, #0x780000
    orr r0, r0, #0x700000
    str r0, [sp, #0x6c]
    ldr r0, [r6, #0x10]
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_b40
    ldr r1, [r6, #0x10]
    ldr r0, _LIT19
    cmp r1, r0
    bne .L_b30
    mov r0, r6
    bl func_ov002_021bacd0
    cmp r0, #0x0
    bne .L_b40
.L_b30:
    ldr r0, [r6, #0xc]
    bl func_ov002_021ca4dc
    cmp r0, #0x0
    bne .L_b50
.L_b40:
    ldr r0, [sp, #0x6c]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x6c]
.L_b50:
    mov r0, r7
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_c5c
    ldr r2, [r7, #0x10]
    ldr r0, _LIT20
    cmp r2, r0
    bgt .L_b98
    bge .L_bfc
    ldr r0, _LIT21
    cmp r2, r0
    bgt .L_b88
    beq .L_bdc
    b .L_c5c
.L_b88:
    add r0, r0, #0x3d
    cmp r2, r0
    beq .L_bdc
    b .L_c5c
.L_b98:
    ldr r0, _LIT22
    cmp r2, r0
    bgt .L_bb8
    bge .L_bfc
    ldr r0, _LIT19
    cmp r2, r0
    beq .L_bc8
    b .L_c5c
.L_bb8:
    add r0, r0, #0x1f8
    cmp r2, r0
    beq .L_c28
    b .L_c5c
.L_bc8:
    ldr r0, [sp, #0x6c]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x6c]
    b .L_c5c
.L_bdc:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_c5c
    ldr r0, [sp, #0x6c]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x6c]
    b .L_c5c
.L_bfc:
    mov r0, r5
    mov r1, #0xb
    ldr r3, [r7, #0xc]
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    beq .L_c5c
    ldr r0, [sp, #0x6c]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x6c]
    b .L_c5c
.L_c28:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_c5c
    mov r0, r5
    ldr r1, _LIT1
    ldr r1, [r1, #0x20]
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_c5c
    ldr r0, [sp, #0x6c]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x6c]
.L_c5c:
    ldr r0, [r6, #0x10]
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_ca8
    ldr r0, _LIT23
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_ca8
    ldr r0, [sp, #0x6c]
    mov r2, #0x1
    bic r0, r0, #0x780000
    orr r0, r0, #0x680000
    str r0, [sp, #0x6c]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x17
    and r1, r0, #0x1
    ldr r0, [sp, #0x2c]
    orr r0, r0, r2, lsl r1
    str r0, [sp, #0x2c]
.L_ca8:
    ldr r1, [sp, #0x6c]
    mov r0, sl
    bl func_ov002_021dec9c
    ldr r1, [r7, #0x10]
    ldr r0, _LIT24
    mov r8, #0x0
    cmp r1, r0
    bgt .L_de4
    bge .L_ef8
    sub r2, r0, #0xc3
    cmp r1, r2
    bgt .L_d74
    sub r0, r0, #0xc3
    cmp r1, r0
    bge .L_ef0
    ldr r0, _LIT25
    cmp r1, r0
    bgt .L_d44
    bge .L_ef8
    sub r2, r0, #0xbc
    cmp r1, r2
    bgt .L_d1c
    sub r0, r0, #0xbc
    cmp r1, r0
    bge .L_ef0
    ldr r0, _LIT21
    cmp r1, r0
    beq .L_ef0
    b .L_fec
.L_d1c:
    sub r2, r0, #0x4a
    cmp r1, r2
    bgt .L_fec
    sub r2, r0, #0x4d
    cmp r1, r2
    blt .L_fec
    subne r0, r0, #0x4a
    cmpne r1, r0
    beq .L_ef0
    b .L_fec
.L_d44:
    add r2, r0, #0xe9
    cmp r1, r2
    bgt .L_d64
    bge .L_ef0
    add r0, r0, #0x71
    cmp r1, r0
    beq .L_ef0
    b .L_fec
.L_d64:
    add r0, r0, #0xea
    cmp r1, r0
    beq .L_ef8
    b .L_fec
.L_d74:
    sub r2, r0, #0x7d
    cmp r1, r2
    bgt .L_db4
    bge .L_ef0
    sub r2, r0, #0x9d
    cmp r1, r2
    bgt .L_da4
    bge .L_ef0
    sub r0, r0, #0xbc
    cmp r1, r0
    beq .L_ef0
    b .L_fec
.L_da4:
    sub r0, r0, #0x9c
    cmp r1, r0
    beq .L_ef0
    b .L_fec
.L_db4:
    sub r2, r0, #0x36
    cmp r1, r2
    bgt .L_dd4
    bge .L_ef0
    sub r0, r0, #0x7c
    cmp r1, r0
    beq .L_ef0
    b .L_fec
.L_dd4:
    sub r0, r0, #0x35
    cmp r1, r0
    beq .L_ef0
    b .L_fec
.L_de4:
    ldr r0, _LIT26
    cmp r1, r0
    bgt .L_e64
    bge .L_ef0
    sub r2, r0, #0x69
    cmp r1, r2
    bgt .L_e34
    bge .L_ef0
    sub r2, r0, #0xf6
    cmp r1, r2
    bgt .L_e24
    bge .L_ef0
    sub r0, r0, #0x1dc
    cmp r1, r0
    beq .L_ef8
    b .L_fec
.L_e24:
    sub r0, r0, #0xdc
    cmp r1, r0
    beq .L_ef0
    b .L_fec
.L_e34:
    sub r2, r0, #0x55
    cmp r1, r2
    bgt .L_e54
    bge .L_ef0
    sub r0, r0, #0x61
    cmp r1, r0
    beq .L_ef0
    b .L_fec
.L_e54:
    sub r0, r0, #0x1d
    cmp r1, r0
    beq .L_ef0
    b .L_fec
.L_e64:
    add r2, r0, #0xf1
    cmp r1, r2
    bgt .L_ea4
    bge .L_f78
    add r2, r0, #0x78
    cmp r1, r2
    bgt .L_e94
    bge .L_ef8
    add r0, r0, #0x2f
    cmp r1, r0
    beq .L_ef0
    b .L_fec
.L_e94:
    add r0, r0, #0x7f
    cmp r1, r0
    beq .L_ef0
    b .L_fec
.L_ea4:
    add r2, r0, #0x10c
    cmp r1, r2
    bgt .L_ecc
    add r0, r0, #0x10c
    cmp r1, r0
    bge .L_ef8
    ldr r0, _LIT27
    cmp r1, r0
    beq .L_ef8
    b .L_fec
.L_ecc:
    ldr r0, _LIT28
    cmp r1, r0
    bgt .L_ee0
    beq .L_ef8
    b .L_fec
.L_ee0:
    add r0, r0, #0x52
    cmp r1, r0
    beq .L_ef8
    b .L_fec
.L_ef0:
    ldr r8, [sp, #0x1c]
    b .L_fec
.L_ef8:
    mov r8, #0x1
    b .L_fec
_LIT0: .word data_ov002_022cd340
_LIT1: .word data_ov002_022cd314
_LIT2: .word data_ov002_022cd3d8
_LIT3: .word data_ov002_022cf08c
_LIT4: .word data_ov002_022cd3ec
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022cf0c4
_LIT7: .word data_ov002_022d008c
_LIT8: .word 0x000013a4
_LIT9: .word 0x000015ff
_LIT10: .word 0x00001836
_LIT11: .word 0x0000147d
_LIT12: .word 0x000012a6
_LIT13: .word 0x000017da
_LIT14: .word 0x00001529
_LIT15: .word 0x00001adc
_LIT16: .word 0x00001415
_LIT17: .word 0x000017d2
_LIT18: .word 0x000001ff
_LIT19: .word 0x000016f8
_LIT20: .word 0x000015d9
_LIT21: .word 0x0000147a
_LIT22: .word 0x000018e6
_LIT23: .word 0x00001797
_LIT24: .word 0x000017c7
_LIT25: .word 0x000015dc
_LIT26: .word 0x000019a4
_LIT27: .word 0x00001aad
_LIT28: .word 0x00001b2d
_LIT29: .word 0x00001a90
.L_f78:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_fec
    ldr r0, [sp, #0x6c]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    bne .L_fec
    mov r0, r7
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_fec
    ldr r1, [r6, #0x4]
    mov r0, r4
    ldr r2, _LIT29
    bl func_ov002_021b3e2c
    cmp r0, #0x0
    beq .L_fec
    ldr r1, [r6, #0xc]
    mov r0, r5
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [sp]
    ldr r1, [r7, #0x4]
    ldr r2, [r7, #0x10]
    mov r3, #0x2
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d58dc
.L_fec:
    cmp r8, #0x0
    beq .L_1038
    ldr r1, [r7]
    ldr r0, [r7, #0x4]
    mov r1, r1, lsl #0x1f
    and r1, r1, #-2147483648
    orr r1, r1, #0xc200000
    mov r0, r0, lsl #0x10
    and r0, r0, #0x1f0000
    ldr r2, [r7, #0x10]
    orr r1, r1, #0x20000000
    orr r1, r1, r0
    mov r0, r2, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    ldr r1, [r7, #0xc]
    ldr r2, [sp, #0x6c]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_1038:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_12a4
    ldr r0, _LIT1
    ldr r1, _LIT30
    ldr r2, [r0, #0x20]
    add r1, r1, r9
    mov r0, #0x14
    mul r0, r2, r0
    ldrh r8, [r0, r1]
    cmp r8, #0x0
    beq .L_12a4
    ldr r0, _LIT31
    add r0, r0, #0x1e
    str r0, [sp, #0x38]
    ldr r0, _LIT31
    add r0, r0, #0x22
    str r0, [sp, #0x3c]
    ldr r0, _LIT32
    sub r0, r0, #0xed
    str r0, [sp, #0x40]
    ldr r0, _LIT32
    sub r0, r0, #0xed
    str r0, [sp, #0x44]
    ldr r0, _LIT31
    add r0, r0, #0x1e
    str r0, [sp, #0x34]
    ldr r0, _LIT31
    add r0, r0, #0x22
    str r0, [sp, #0x30]
.L_10b0:
    ldr r0, _LIT33
    add r1, r0, r8, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r8, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r3, r0, lsr #0x1c
    cmp r3, #0xa
    cmpne r3, #0xb
    bne .L_129c
    ldrh r0, [r1]
    ldr r1, _LIT5
    and r9, r0, #0xff
    mov r0, r0, asr #0x8
    and sl, r0, #0xff
    mov r0, #0x14
    smulbb fp, sl, r0
    ldr r0, _LIT3
    and r2, r9, #0x1
    mla r0, r2, r1, r0
    add ip, r0, fp
    str r0, [sp, #0x10]
    ldr r0, [ip, #0x30]
    ldr r1, [ip, #0x40]
    mov r0, r0, lsl #0x13
    mov r2, r0, lsr #0x13
    ldrh r0, [ip, #0x38]
    mov ip, r1, lsr #0x6
    and ip, ip, #0x1
    mvn ip, ip
    and r0, r0, ip
    mov ip, r1, lsr #0x2
    orr r1, ip, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_129c
    ldr r0, _LIT34
    cmp r2, r0
    mov r0, #0x0
    bgt .L_1190
    ldr r1, _LIT34
    cmp r2, r1
    bge .L_1214
    ldr r1, [sp, #0x30]
    cmp r2, r1
    bgt .L_1238
    ldr r1, [sp, #0x34]
    cmp r2, r1
    blt .L_1238
    ldr r1, [sp, #0x38]
    cmp r2, r1
    beq .L_11bc
    ldr r1, [sp, #0x3c]
    cmp r2, r1
    beq .L_11e8
    b .L_1238
.L_1190:
    ldr r1, [sp, #0x40]
    cmp r2, r1
    bgt .L_11ac
    ldr r1, [sp, #0x44]
    cmp r2, r1
    moveq r0, #0x1
    b .L_1238
.L_11ac:
    ldr r1, _LIT32
    cmp r2, r1
    beq .L_1214
    b .L_1238
.L_11bc:
    cmp r4, r9
    beq .L_11e0
    ldr r2, _LIT31
    mov r0, r9
    mov r1, sl
    bl func_ov002_021b3dec
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_1238
.L_11e0:
    mov r0, #0x0
    b .L_1238
.L_11e8:
    cmp r3, #0xb
    bne .L_120c
    ldr r2, _LIT31
    mov r0, r9
    mov r1, sl
    bl func_ov002_021b3dec
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_1238
.L_120c:
    mov r0, #0x0
    b .L_1238
.L_1214:
    cmp r4, r9
    beq .L_1234
    ldr r0, [sp, #0x6c]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    moveq r0, #0x1
    beq .L_1238
.L_1234:
    mov r0, #0x0
.L_1238:
    cmp r0, #0x0
    beq .L_129c
    ldr r0, [sp, #0x10]
    add r0, r0, #0x30
    ldr r1, [r0, fp]
    mov r0, r9, lsl #0x1f
    and r2, r0, #-2147483648
    orr r2, r2, #0xc200000
    mov r0, sl, lsl #0x10
    orr r2, r2, #0x20000000
    and r0, r0, #0x1f0000
    orr r2, r2, r0
    mov r0, r1, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r0, r0, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    ldr r2, [sp, #0x6c]
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_129c:
    cmp r8, #0x0
    bne .L_10b0
.L_12a4:
    ldr r0, [r7, #0x30]
    cmp r0, #0x0
    beq .L_131c
    ldr r0, [r7, #0x2c]
    cmp r0, #0x0
    beq .L_1304
    add r0, sp, #0x70
    mov r3, #0x0
    str r3, [r0]
    ldrh r2, [sp, #0x72]
    mov r1, r5, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0x1
    and r1, r1, #0x1
    orr r2, r2, r1
    mov r1, #0x1
    str r3, [r0, #0x4]
    str r3, [r0, #0x8]
    str r3, [r0, #0xc]
    str r3, [r0, #0x10]
    str r3, [r0, #0x14]
    strh r2, [sp, #0x72]
    bl func_ov002_021deda4
    b .L_1b60
.L_1304:
    mov r2, #0x0
    ldr r1, [r7, #0x4]
    mov r0, r5
    mov r3, r2
    bl func_ov002_021de390
    b .L_1b60
.L_131c:
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    beq .L_1b60
    mov r0, #0x0
    sub r1, r0, #0x200
    ldr r3, [r7, #0xc]
    ldr r2, _LIT18
    and r8, r1, #0x0
    and r1, r3, r2
    orr r1, r8, r1
    bic r3, r1, #0x40000
    mov r1, r4, lsl #0x1f
    orr r3, r3, r1, lsr #0xd
    ldr r2, [r7, #0x4]
    bic r8, r3, #0x200
    add r9, sp, #0x68
    ldr r1, [r7, #0x8]
    mov r3, r5, lsl #0x1f
    str r0, [r9]
    orr r0, r8, r3, lsr #0x16
    mov r2, r2, lsl #0x1c
    bic r0, r0, #0x3c00
    orr r0, r0, r2, lsr #0x12
    orr r0, r0, #0x20000
    mov r1, r1, lsl #0x1f
    bic r0, r0, #0x4000
    orr r0, r0, r1, lsr #0x11
    orr r0, r0, #0x18000
    bic r0, r0, #0x780000
    orr r1, r0, #0x700000
    ldr r0, [r7, #0x10]
    str r1, [sp, #0x68]
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_13d8
    ldr r1, [r7, #0x10]
    ldr r0, _LIT19
    cmp r1, r0
    bne .L_13c8
    mov r0, r7
    bl func_ov002_021bacd0
    cmp r0, #0x0
    bne .L_13d8
.L_13c8:
    ldr r0, [r7, #0xc]
    bl func_ov002_021ca4dc
    cmp r0, #0x0
    bne .L_13e8
.L_13d8:
    ldr r0, [sp, #0x68]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x68]
.L_13e8:
    mov r0, r6
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_14f4
    ldr r2, [r6, #0x10]
    ldr r0, _LIT20
    cmp r2, r0
    bgt .L_1430
    bge .L_1494
    ldr r0, _LIT21
    cmp r2, r0
    bgt .L_1420
    beq .L_1474
    b .L_14f4
.L_1420:
    add r0, r0, #0x3d
    cmp r2, r0
    beq .L_1474
    b .L_14f4
.L_1430:
    ldr r0, _LIT22
    cmp r2, r0
    bgt .L_1450
    bge .L_1494
    ldr r0, _LIT19
    cmp r2, r0
    beq .L_1460
    b .L_14f4
.L_1450:
    add r0, r0, #0x1f8
    cmp r2, r0
    beq .L_14c0
    b .L_14f4
.L_1460:
    ldr r0, [sp, #0x68]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x68]
    b .L_14f4
.L_1474:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_14f4
    ldr r0, [sp, #0x68]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x68]
    b .L_14f4
.L_1494:
    ldr r3, [r6, #0xc]
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    beq .L_14f4
    ldr r0, [sp, #0x68]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x68]
    b .L_14f4
.L_14c0:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_14f4
    ldr r1, _LIT1
    mov r0, r4
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_14f4
    ldr r0, [sp, #0x68]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x68]
.L_14f4:
    ldr r0, [r7, #0x10]
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_1540
    ldr r0, _LIT23
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_1540
    ldr r0, [sp, #0x68]
    mov r2, #0x1
    bic r0, r0, #0x780000
    orr r3, r0, #0x680000
    mov r0, r3, lsl #0x17
    mov r0, r0, lsr #0x17
    and r1, r0, #0x1
    ldr r0, [sp, #0x2c]
    str r3, [sp, #0x68]
    orr r0, r0, r2, lsl r1
    str r0, [sp, #0x2c]
.L_1540:
    ldr r1, [r6, #0x10]
    ldr r0, _LIT24
    mov r8, #0x0
    cmp r1, r0
    bgt .L_169c
    bge .L_17b0
    ldr r0, _LIT35
    cmp r1, r0
    bgt .L_15f8
    bge .L_17b0
    sub r2, r0, #0xea
    cmp r1, r2
    bgt .L_15c8
    sub r0, r0, #0xea
    cmp r1, r0
    bge .L_17b0
    ldr r2, _LIT36
    cmp r1, r2
    bgt .L_15a0
    bge .L_17a8
    sub r0, r2, #0xa6
    cmp r1, r0
    beq .L_17a8
    b .L_182c
.L_15a0:
    add r0, r2, #0x72
    cmp r1, r0
    bgt .L_182c
    add r0, r2, #0x6f
    cmp r1, r0
    blt .L_182c
    addne r0, r2, #0x72
    cmpne r1, r0
    beq .L_17a8
    b .L_182c
.L_15c8:
    sub r2, r0, #0x79
    cmp r1, r2
    bgt .L_15e8
    bge .L_17a8
    sub r0, r0, #0x85
    cmp r1, r0
    beq .L_17a8
    b .L_182c
.L_15e8:
    sub r0, r0, #0x1
    cmp r1, r0
    beq .L_17a8
    b .L_182c
.L_15f8:
    add r2, r0, #0x65
    cmp r1, r2
    bgt .L_1638
    bge .L_17a8
    add r2, r0, #0x45
    cmp r1, r2
    bgt .L_1628
    bge .L_17a8
    add r0, r0, #0x3e
    cmp r1, r0
    beq .L_17a8
    b .L_182c
.L_1628:
    add r0, r0, #0x64
    cmp r1, r0
    beq .L_17a8
    b .L_182c
.L_1638:
    add r2, r0, #0x85
    cmp r1, r2
    bgt .L_1658
    bge .L_17a8
    add r0, r0, #0x84
    cmp r1, r0
    beq .L_17a8
    b .L_182c
.L_1658:
    add r2, r0, #0xc7
    cmp r1, r2
    bgt .L_1674
    add r0, r0, #0xc7
    cmp r1, r0
    beq .L_17a8
    b .L_182c
.L_1674:
    add r2, r0, #0xcc
    cmp r1, r2
    bgt .L_182c
    add r2, r0, #0xcb
    cmp r1, r2
    blt .L_182c
    addne r0, r0, #0xcc
    cmpne r1, r0
    beq .L_17a8
    b .L_182c
.L_169c:
    ldr r0, _LIT26
    cmp r1, r0
    bgt .L_171c
    bge .L_17a8
    sub r2, r0, #0x69
    cmp r1, r2
    bgt .L_16ec
    bge .L_17a8
    sub r2, r0, #0xf6
    cmp r1, r2
    bgt .L_16dc
    bge .L_17a8
    sub r0, r0, #0x1dc
    cmp r1, r0
    beq .L_17b0
    b .L_182c
.L_16dc:
    sub r0, r0, #0xdc
    cmp r1, r0
    beq .L_17a8
    b .L_182c
.L_16ec:
    sub r2, r0, #0x55
    cmp r1, r2
    bgt .L_170c
    bge .L_17a8
    sub r0, r0, #0x61
    cmp r1, r0
    beq .L_17a8
    b .L_182c
.L_170c:
    sub r0, r0, #0x1d
    cmp r1, r0
    beq .L_17a8
    b .L_182c
.L_171c:
    add r2, r0, #0xf1
    cmp r1, r2
    bgt .L_175c
    bge .L_17b8
    add r2, r0, #0x78
    cmp r1, r2
    bgt .L_174c
    bge .L_17b0
    add r0, r0, #0x2f
    cmp r1, r0
    beq .L_17a8
    b .L_182c
.L_174c:
    add r0, r0, #0x7f
    cmp r1, r0
    beq .L_17a8
    b .L_182c
.L_175c:
    add r2, r0, #0x10c
    cmp r1, r2
    bgt .L_1784
    add r0, r0, #0x10c
    cmp r1, r0
    bge .L_17b0
    ldr r0, _LIT27
    cmp r1, r0
    beq .L_17b0
    b .L_182c
.L_1784:
    ldr r0, _LIT28
    cmp r1, r0
    bgt .L_1798
    beq .L_17b0
    b .L_182c
.L_1798:
    add r0, r0, #0x52
    cmp r1, r0
    beq .L_17b0
    b .L_182c
.L_17a8:
    ldr r8, [sp, #0x20]
    b .L_182c
.L_17b0:
    mov r8, #0x1
    b .L_182c
.L_17b8:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_182c
    ldr r0, [sp, #0x68]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    bne .L_182c
    mov r0, r6
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_182c
    ldr r1, [r7, #0x4]
    ldr r2, _LIT29
    mov r0, r5
    bl func_ov002_021b3e2c
    cmp r0, #0x0
    beq .L_182c
    ldr r1, [r7, #0xc]
    mov r0, r4
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [sp]
    ldr r2, [r6, #0x10]
    ldr r1, [r6, #0x4]
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x2
    bl func_ov002_021d58dc
.L_182c:
    cmp r8, #0x0
    beq .L_1878
    ldr r1, [r6]
    ldr r0, [r6, #0x4]
    mov r1, r1, lsl #0x1f
    and r1, r1, #-2147483648
    orr r3, r1, #0xc200000
    mov r2, r0, lsl #0x10
    ldr r0, [r6, #0x10]
    ldr r1, [r6, #0xc]
    mov r0, r0, lsl #0x10
    and r2, r2, #0x1f0000
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    orr r3, r3, #0x20000000
    orr r2, r3, r2
    orr r0, r2, r0, lsr #0x10
    ldr r2, [sp, #0x68]
    bl func_ov002_021e2fc4
.L_1878:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_1b54
    ldr r0, _LIT1
    ldr r3, _LIT30
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r2, r1, r0
    ldr r0, [sp, #0x18]
    add r0, r3, r0
    ldrh fp, [r2, r0]
    cmp fp, #0x0
    beq .L_1b54
    ldr r0, _LIT31
    add r0, r0, #0x1e
    str r0, [sp, #0x58]
    ldr r0, _LIT31
    add r0, r0, #0x22
    str r0, [sp, #0x5c]
    ldr r0, _LIT31
    add r0, r0, #0x22
    str r0, [sp, #0x50]
    ldr r0, _LIT34
    add r0, r0, #0xac
    str r0, [sp, #0x4c]
    ldr r0, _LIT34
    add r0, r0, #0xac
    str r0, [sp, #0x48]
    ldr r0, _LIT34
    add r0, r0, #0x108
    str r0, [sp, #0x60]
    ldr r0, _LIT34
    add r0, r0, #0x108
    str r0, [sp, #0x64]
    ldr r0, _LIT31
    add r0, r0, #0x1e
    str r0, [sp, #0x54]
.L_190c:
    ldr r0, _LIT33
    add r1, r0, fp, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh fp, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r3, r0, lsr #0x1c
    cmp r3, #0xa
    cmpne r3, #0xb
    bne .L_1b4c
    ldrh r0, [r1]
    ldr r1, _LIT5
    and r8, r0, #0xff
    mov r0, r0, asr #0x8
    and r9, r0, #0xff
    mov r0, #0x14
    smulbb r0, r9, r0
    str r0, [sp, #0xc]
    ldr r0, _LIT3
    and r2, r8, #0x1
    mla r1, r2, r1, r0
    ldr r0, [sp, #0xc]
    str r1, [sp, #0x8]
    add sl, r1, r0
    ldr r0, [sl, #0x30]
    ldr r1, [sl, #0x40]
    mov r0, r0, lsl #0x13
    mov r2, r0, lsr #0x13
    ldrh r0, [sl, #0x38]
    mov sl, r1, lsr #0x6
    and sl, sl, #0x1
    mvn sl, sl
    and r0, r0, sl
    mov sl, r1, lsr #0x2
    orr r1, sl, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_1b4c
    ldr r0, [sp, #0x48]
    mov sl, #0x0
    cmp r2, r0
    bgt .L_1a04
    ldr r0, [sp, #0x4c]
    cmp r2, r0
    bge .L_1ab0
    ldr r0, [sp, #0x50]
    cmp r2, r0
    bgt .L_19f4
    ldr r0, [sp, #0x54]
    cmp r2, r0
    blt .L_1ae4
    ldr r0, [sp, #0x58]
    cmp r2, r0
    beq .L_1a30
    ldr r0, [sp, #0x5c]
    cmp r2, r0
    beq .L_1a5c
    b .L_1ae4
.L_19f4:
    ldr r0, _LIT34
    cmp r2, r0
    beq .L_1a88
    b .L_1ae4
.L_1a04:
    ldr r0, [sp, #0x60]
    cmp r2, r0
    bgt .L_1a20
    ldr r0, [sp, #0x64]
    cmp r2, r0
    beq .L_1ab8
    b .L_1ae4
.L_1a20:
    ldr r0, _LIT32
    cmp r2, r0
    beq .L_1a88
    b .L_1ae4
.L_1a30:
    cmp r5, r8
    beq .L_1a54
    ldr r2, _LIT31
    mov r0, r8
    mov r1, r9
    bl func_ov002_021b3dec
    cmp r0, #0x0
    moveq sl, #0x1
    beq .L_1ae4
.L_1a54:
    mov sl, #0x0
    b .L_1ae4
.L_1a5c:
    cmp r3, #0xb
    bne .L_1a80
    ldr r2, _LIT31
    mov r0, r8
    mov r1, r9
    bl func_ov002_021b3dec
    cmp r0, #0x0
    moveq sl, #0x1
    beq .L_1ae4
.L_1a80:
    mov sl, #0x0
    b .L_1ae4
.L_1a88:
    cmp r5, r8
    beq .L_1aa8
    ldr r0, [sp, #0x68]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    moveq sl, #0x1
    beq .L_1ae4
.L_1aa8:
    mov sl, #0x0
    b .L_1ae4
.L_1ab0:
    mov sl, #0x1
    b .L_1ae4
.L_1ab8:
    ldr r0, [r7, #0x28]
    cmp r0, #0x5
    blt .L_1ae4
    mov r0, r2, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, sl
    str r0, [sp]
    mov r0, r8
    mov r1, r9
    mov r3, #0x1
    bl func_ov002_021d58dc
.L_1ae4:
    cmp sl, #0x0
    beq .L_1b4c
    ldr r0, [sp, #0x8]
    add r1, r0, #0x30
    ldr r0, [sp, #0xc]
    ldr r1, [r1, r0]
    mov r0, r8, lsl #0x1f
    and r2, r0, #-2147483648
    orr r2, r2, #0xc200000
    mov r0, r9, lsl #0x10
    orr r2, r2, #0x20000000
    and r0, r0, #0x1f0000
    orr r2, r2, r0
    mov r0, r1, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r0, r0, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    ldr r2, [sp, #0x68]
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_1b4c:
    cmp fp, #0x0
    bne .L_190c
.L_1b54:
    ldr r1, [sp, #0x68]
    ldr r0, [sp, #0x4]
    bl func_ov002_021dec9c
.L_1b60:
    mov r0, #0x0
    ldr fp, _LIT31
    str r0, [sp, #0x28]
.L_1b6c:
    ldr r0, _LIT7
    mov r9, #0x5
    ldr r1, [r0, #0xcec]
    ldr r0, [sp, #0x28]
    eor r8, r1, r0
    ldr r1, _LIT5
    ldr r0, _LIT3
    and r2, r8, #0x1
    mla r0, r2, r1, r0
    add sl, r0, #0x94
.L_1b94:
    ldr r0, [sl]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_1bd8
    mov r0, r8
    mov r1, r9
    mov r2, fp
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_1bd8
    ldr r3, [sl]
    mov r0, r8
    mov r3, r3, lsl #0x13
    mov r1, r9
    mov r2, #0x0
    mov r3, r3, lsr #0x13
    bl func_ov002_021de390
.L_1bd8:
    add sl, sl, #0x14
    add r9, r9, #0x1
    cmp r9, #0xa
    blt .L_1b94
    ldr r0, [sp, #0x28]
    add r0, r0, #0x1
    str r0, [sp, #0x28]
    cmp r0, #0x2
    blt .L_1b6c
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_1cd4
    ldr r1, [r6, #0x1c]
    ldr r0, [r7, #0x20]
    cmp r1, r0
    bge .L_1cd4
    ldr r0, [r7, #0x8]
    cmp r0, #0x0
    beq .L_1cd4
    mov r0, r7
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_1cd4
    ldr r2, [r7, #0x10]
    ldr r1, _LIT37
    mov r3, #0x0
    cmp r2, r1
    bgt .L_1c5c
    bge .L_1c94
    sub r0, r1, #0x12c
    cmp r2, r0
    beq .L_1c80
    b .L_1ca0
.L_1c5c:
    add r0, r1, #0x5f
    cmp r2, r0
    bgt .L_1c70
    moveq r3, #0x1
    b .L_1ca0
.L_1c70:
    add r0, r1, #0xf9
    cmp r2, r0
    beq .L_1c94
    b .L_1ca0
.L_1c80:
    ldr r0, _LIT1
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    movgt r3, #0x1
    b .L_1ca0
.L_1c94:
    cmp r4, r5
    movne r3, #0x1
    moveq r3, #0x0
.L_1ca0:
    cmp r3, #0x0
    beq .L_1cd4
    ldr r0, _LIT1
    ldr r2, [r7, #0xc]
    ldr r1, [r0, #0x20]
    mov r0, r5
    bl func_ov002_021df53c
    ldr r0, _LIT1
    ldr r3, [r7, #0x10]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_021de390
.L_1cd4:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_1d20
    ldr r0, _LIT1
    ldr r2, _LIT38
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_1d20
    ldr r1, _LIT38
    ldr r0, [sp, #0x14]
    bl func_ov002_021df5e4
    ldr r0, _LIT1
    ldr r3, _LIT38
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_021de390
.L_1d20:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_1d6c
    ldr r0, _LIT1
    ldr r2, _LIT39
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_1d6c
    ldr r1, _LIT39
    ldr r0, [sp, #0x14]
    bl func_ov002_021df5e4
    ldr r0, _LIT1
    ldr r3, _LIT39
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_021de390
.L_1d6c:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_1db8
    ldr r0, _LIT1
    ldr r2, _LIT40
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_1db8
    ldr r1, _LIT40
    ldr r0, [sp, #0x14]
    bl func_ov002_021df5e4
    ldr r0, _LIT1
    ldr r3, _LIT40
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_021de390
.L_1db8:
    ldr r1, _LIT1
    mov r0, r5
    ldr r1, [r1, #0x20]
    mov r2, #0x1140
    bl func_ov002_021b3dec
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_1e08
    ldr r0, _LIT1
    ldr r2, [r6, #0xc]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021df53c
    ldr r0, _LIT1
    ldr r3, [r6, #0x10]
    ldr r1, [r0, #0x20]
    mov r0, r5
    mov r2, #0x1
    bl func_ov002_021de390
.L_1e08:
    ldr r0, [sp, #0x2c]
    cmp r0, #0x0
    beq .L_1e40
    mov r1, #0x1
    tst r0, r1, lsl r4
    beq .L_1e28
    mov r0, r4
    bl func_ov002_021e277c
.L_1e28:
    ldr r0, [sp, #0x2c]
    mov r1, #0x1
    tst r0, r1, lsl r5
    beq .L_1e40
    mov r0, r5
    bl func_ov002_021e277c
.L_1e40:
    bl func_ov002_021e2b6c
    ldr r1, _LIT7
    add sp, sp, #0xa0
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e60:
    mov r0, #0x1
    add sp, sp, #0xa0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT30: .word data_ov002_022cf0c6
_LIT31: .word 0x000015b3
_LIT32: .word 0x00001a69
_LIT33: .word data_ov002_022d0570
_LIT34: .word 0x000018d0
_LIT35: .word 0x000016c6
_LIT36: .word 0x00001520
_LIT37: .word 0x00001658
_LIT38: .word 0x00001493
_LIT39: .word 0x0000162e
_LIT40: .word 0x00001883
