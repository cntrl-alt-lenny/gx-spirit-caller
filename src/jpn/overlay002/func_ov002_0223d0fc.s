; func_ov002_0223d0fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce640
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern data_ov002_022cf0a4
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d008c
        .extern data_ov002_022d0170
        .extern data_ov002_022d0570
        .extern func_0202b89c
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021aff1c
        .extern func_ov002_021b40c4
        .extern func_ov002_021ba230
        .extern func_ov002_021baf88
        .extern func_ov002_021bc5e4
        .extern func_ov002_021d46ac
        .extern func_ov002_021d58dc
        .extern func_ov002_021e15b4
        .extern func_ov002_021e1780
        .extern func_ov002_021e277c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021ff2cc
        .extern func_ov002_0223b378
        .extern func_ov002_0223b494
        .extern func_ov002_0223b4dc
        .extern func_ov002_02253600
        .extern func_ov002_0226af64
        .extern func_ov002_0226afe0
        .extern func_ov002_0227acc8
        .extern func_ov002_0229ce00
        .global func_ov002_0223d0fc
        .arm
func_ov002_0223d0fc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x108
    mov r4, r0
    ldrh r3, [r4, #0x2]
    mov r5, r1
    mov r0, r3, lsl #0x1f
    mov r1, r3, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r2, r3, lsl #0x11
    eor r8, r0, r2, lsr #0x1f
    movs r1, r1, lsr #0x1e
    bne .L_500
    ldr r5, _LIT0
    ldr r1, [r5, #0x5a8]
    sub r1, r1, #0x6d
    cmp r1, #0x13
    addls pc, pc, r1, lsl #0x2
    b .L_7a8
    b .L_4ec
    b .L_4d8
    b .L_7a8
    b .L_7a8
    b .L_7a8
    b .L_7a8
    b .L_7a8
    b .L_7a8
    b .L_7a8
    b .L_7a8
    b .L_7a8
    b .L_7a8
    b .L_418
    b .L_404
    b .L_2f0
    b .L_218
    b .L_1d0
    b .L_144
    b .L_124
    b .L_98
.L_98:
    ldr r1, _LIT1
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT2
    ldr r0, [r0, r1]
    cmp r0, #0x0
    addeq sp, sp, #0x108
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT3
    ldr r0, [r0, r1]
    cmp r0, #0x0
    addeq sp, sp, #0x108
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r1, [r4]
    mov r0, r8
    mov r2, #0x0
    bl func_ov002_02253600
    cmp r0, #0x0
    bne .L_104
    ldr r1, _LIT4
    mov r0, r8
    bl func_ov002_021ae320
    add sp, sp, #0x108
    mov r0, #0x6e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_104:
    ldrh r0, [r4, #0x2]
    mov r1, #0x5b
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    add sp, sp, #0x108
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_124:
    ldrh r2, [r4]
    mov r0, r8
    mov r1, #0x6
    mov r3, #0x0
    bl func_ov002_021af8f0
    add sp, sp, #0x108
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_144:
    bl func_ov002_021afa94
    ldr r1, [r0]
    mov r0, r5
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    str r1, [r0, #0x69c]
    bl func_ov002_021afa94
    mov r5, r0
    bl func_ov002_021afa94
    ldr r0, [r0]
    ldr r1, [r5]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    ldr r0, _LIT0
    add r1, r1, r2, lsr #0x1f
    str r1, [r0, #0x6a0]
    ldr r0, [r0, #0x69c]
    bl func_ov002_0223b378
    ldr r1, _LIT0
    mov r2, #0x1
    str r0, [r1, #0x6a4]
    str r2, [r1, #0x6b0]
    mov r0, #0x0
    str r0, [r1, #0x6ac]
    bl func_ov002_0223b494
    ldr r2, _LIT0
    ldrh r1, [r4]
    ldr r2, [r2, #0x69c]
    rsb r0, r8, #0x1
    bl func_ov002_0226afe0
    add sp, sp, #0x108
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1d0:
    ldr r1, [r5, #0x69c]
    ldr r0, _LIT5
    cmp r1, r0
    bne .L_1f0
    mov r0, r8
    mov r1, #0x5c
    bl func_ov002_021ae320
    b .L_20c
.L_1f0:
    ldr r2, [r5, #0x6a4]
    add r0, sp, #0x8
    mov r1, #0xc
    bl func_ov002_0229ce00
    add r1, sp, #0x8
    mov r0, r8
    bl func_ov002_021ae320
.L_20c:
    add sp, sp, #0x108
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_218:
    ldr r3, [r5, #0x69c]
    ldr r0, _LIT5
    cmp r3, r0
    bne .L_250
    ldr r0, [r5, #0x6ac]
    cmp r0, #0x2
    bcc .L_250
    ldrh r2, [r4]
    mov r0, r8
    mov r1, #0x48
    bl func_ov002_021af8f0
    add sp, sp, #0x108
    mov r0, #0x7b
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_250:
    ldr r0, _LIT6
    cmp r3, r0
    bne .L_278
    ldrh r2, [r4]
    mov r0, r8
    mov r1, #0xb
    bl func_ov002_021af8f0
    add sp, sp, #0x108
    mov r0, #0x7b
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_278:
    ldr r0, _LIT0
    ldrh r1, [r4]
    ldr r6, [r0, #0x6a4]
    ldr r5, [r0, #0x6ac]
    mov r0, r8
    mov r2, r3
    sub r5, r6, r5
    bl func_ov002_02253600
    cmp r5, r0
    bne .L_2cc
    ldr r0, _LIT0
    ldrh r2, [r4]
    cmp r5, #0x20
    movcs r5, #0x20
    ldr r3, [r0, #0x69c]
    mov r0, r8
    add r1, r5, #0x6
    bl func_ov002_021af8f0
    add sp, sp, #0x108
    mov r0, #0x7b
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2cc:
    ldr r0, _LIT0
    ldrh r2, [r4]
    ldr r3, [r0, #0x69c]
    mov r0, r8
    mov r1, #0x6
    bl func_ov002_021af8f0
    add sp, sp, #0x108
    mov r0, #0x7b
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2f0:
    ldr r9, _LIT7
    mov r7, #0x0
    ldr sl, [r9, #0xd44]
    cmp sl, #0x0
    bls .L_388
    mov r6, #0x1
.L_308:
    add r0, r7, #0x1
    bl func_ov002_021aff1c
    bl func_ov002_021afa94
    ldr r0, [r0]
    mov r1, r6
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_0223b4dc
    bl func_ov002_021afa94
    mov sl, r0
    bl func_ov002_021afa94
    ldr r1, [sl]
    ldr r0, [r0]
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r0, r0, lsl #0x1
    add r2, r0, r1, lsr #0x1f
    ldr r1, [r5, #0x494]
    ldr r0, [r5, #0x6ac]
    add r7, r7, #0x1
    add r0, r1, r0
    mov r0, r0, lsl #0x19
    add r0, r5, r0, lsr #0x18
    add r0, r0, #0x400
    strh r2, [r0, #0x98]
    ldr r0, [r5, #0x6ac]
    add r0, r0, #0x1
    str r0, [r5, #0x6ac]
    ldr sl, [r9, #0xd44]
    cmp r7, sl
    bcc .L_308
.L_388:
    ldr r1, _LIT0
    ldr r3, [r1, #0x6ac]
    ldr r0, [r1, #0x6a4]
    cmp r3, r0
    addcc sp, sp, #0x108
    movcc r0, #0x7c
    ldmccia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, [r1, #0x69c]
    ldr r0, _LIT5
    cmp r2, r0
    bne .L_3f8
    cmp r3, #0x2
    bne .L_3ec
    sub r0, r3, sl
    cmp r0, #0x2
    bcs .L_3ec
    mov r0, #0x7
    str r0, [r1, #0x6b8]
    ldrh r1, [r4]
    mov r0, r8
    bl func_ov002_02253600
    cmp r0, #0x0
    addne sp, sp, #0x108
    movne r0, #0x7c
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3ec:
    ldr r0, _LIT0
    ldr r1, [r0, #0x6ac]
    str r1, [r0, #0x6a4]
.L_3f8:
    add sp, sp, #0x108
    mov r0, #0x7a
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_404:
    ldr r1, [r5, #0x6ac]
    mov r0, #0x0
    str r1, [r5, #0x6a4]
    str r0, [r5, #0x6ac]
    bl func_ov002_021e2a4c
.L_418:
    ldr r0, _LIT0
    ldr r2, [r0, #0x6ac]
    ldr r1, [r0, #0x6a4]
    cmp r2, r1
    bcs .L_494
    ldr r1, [r0, #0x494]
    ldr r0, _LIT8
    add r1, r1, r2
    mov r1, r1, lsl #0x19
    mov r1, r1, lsr #0x18
    ldrh r5, [r0, r1]
    mov r0, r8
    mov r2, #0x0
    mov r1, r5
    bl func_ov002_021e1780
    str r5, [sp]
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r3, #0x3
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d58dc
    ldr r1, _LIT0
    add sp, sp, #0x108
    ldr r2, [r1, #0x6ac]
    mov r0, #0x79
    add r2, r2, #0x1
    str r2, [r1, #0x6ac]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_494:
    bl func_ov002_021e2b6c
    ldr r0, _LIT0
    mov r3, #0x41
    ldr r0, [r0, #0x69c]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d58dc
    add sp, sp, #0x108
    mov r0, #0x6d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4d8:
    rsb r0, r8, #0x1
    bl func_ov002_0226af64
    add sp, sp, #0x108
    mov r0, #0x6d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4ec:
    mov r0, r8
    bl func_ov002_021e277c
    add sp, sp, #0x108
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_500:
    ldr r1, _LIT0
    ldr r2, [r1, #0x5a8]
    cmp r2, #0x7f
    beq .L_764
    cmp r2, #0x80
    bne .L_7a8
    ldrh r2, [r4]
    mov r1, r3, lsl #0x1a
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b40c4
    mov r1, r0
    ldr r2, _LIT0
    mov r0, r8
    str r1, [r2, #0x69c]
    bl func_ov002_021ba230
    cmp r0, #0x0
    addlt sp, sp, #0x108
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r3, _LIT9
    ldr r1, _LIT1
    and r2, r8, #0x1
    mla r1, r2, r1, r3
    add r2, r1, #0x3a0
    ldr r1, [r2, r0, lsl #0x2]
    add r0, r2, r0, lsl #0x2
    str r0, [sp, #0x4]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    ldr r2, _LIT0
    mov r3, #0x0
    str r0, [r2, #0x6a0]
    str r3, [r2, #0x6a4]
    mov r0, r4
    mov r1, r5
    str r3, [r2, #0x6a8]
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    beq .L_5b8
    ldr r0, _LIT10
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_5e4
.L_5b8:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    mov r2, #0x0
    mov r4, r1, lsl #0x1f
    ldr r1, [r0, #0x69c]
    mov r3, r2
    mov r0, r4, lsr #0x1f
    bl func_ov002_021e15b4
    add sp, sp, #0x108
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5e4:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT1
    ldr r3, _LIT11
    mov r2, r1, lsl #0x1f
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsl #0x1a
    and r5, r2, #0x1
    mov r2, r1, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    mla r0, r5, r0, r3
    ldrh r9, [r1, r0]
    cmp r9, #0x0
    beq .L_6e8
    ldr r6, _LIT12
    ldr r5, _LIT0
    ldr r7, _LIT13
    ldr fp, _LIT14
.L_62c:
    add r0, r7, r9, lsl #0x3
    ldrh r1, [r0, #0x2]
    ldrh r9, [r0, #0x6]
    mov r1, r1, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0x3
    ldreqh r2, [r0]
    ldreqh r1, [r4]
    cmpeq r2, r1
    bne .L_6e0
    ldr r1, [r5, #0x69c]
    ldrh sl, [r0, #0x4]
    cmp r1, fp
    bne .L_684
    mov r0, sl, lsl #0x2
    ldrh r0, [r6, r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b89c
    ldr r1, [r5, #0x6a8]
    add r0, r1, r0
    str r0, [r5, #0x6a8]
.L_684:
    ldr r1, [r5, #0x494]
    ldr r0, [r5, #0x6a4]
    cmp r8, #0x0
    add r0, r1, r0
    mov r0, r0, lsl #0x19
    add r0, r5, r0, lsr #0x18
    add r0, r0, #0x400
    strh sl, [r0, #0x98]
    movne r0, #0x8000
    ldr r1, [r5, #0x6a4]
    moveq r0, #0x0
    orr r0, r0, #0x4c
    mov r1, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r1, sl, lsl #0x10
    mov r3, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r1, #0x10
    bl func_ov002_021d46ac
    ldr r0, [r5, #0x6a4]
    add r0, r0, #0x1
    str r0, [r5, #0x6a4]
.L_6e0:
    cmp r9, #0x0
    bne .L_62c
.L_6e8:
    ldr r0, _LIT0
    cmp r8, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    orr r5, r1, #0x4d
    ldr r1, [r0, #0x69c]
    ldr r2, [r0, #0x6a0]
    ldr r3, [r0, #0x6a4]
    mov r0, r5, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d46ac
    mov r0, r8
    bl func_ov002_021bc5e4
    ldr r2, _LIT0
    ldr r1, [sp, #0x4]
    str r0, [r2, #0x5ac]
    ldrh r3, [r4]
    mov r0, r8
    mov r2, #0x1
    mov r3, r3, lsl #0x10
    orr r3, r3, #0x1
    bl func_ov002_0227acc8
    add sp, sp, #0x108
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_764:
    mov r2, #0x0
    str r2, [sp]
    ldrh r2, [r4, #0x2]
    and r3, r0, #0xff
    ldr r1, [r1, #0x5ac]
    mov r0, r2, lsl #0x1a
    mov r0, r0, lsr #0x1b
    and r0, r0, #0xff
    orr r0, r3, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    mov r0, r8
    mov r2, r2, lsr #0x10
    mov r3, #0x7
    bl func_ov002_021d58dc
    add sp, sp, #0x108
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7a8:
    mov r0, #0x0
    add sp, sp, #0x108
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0a4
_LIT3: .word data_ov002_022cf09c
_LIT4: .word 0x00000122
_LIT5: .word 0x00001a4e
_LIT6: .word 0x0000157e
_LIT7: .word data_ov002_022d008c
_LIT8: .word data_ov002_022ce640
_LIT9: .word data_ov002_022cf08c
_LIT10: .word 0x0000197a
_LIT11: .word data_ov002_022cf0c6
_LIT12: .word data_ov002_022d0170
_LIT13: .word data_ov002_022d0570
_LIT14: .word 0x000018fb
