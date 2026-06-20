; func_ov002_02262994 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf180
        .extern data_ov002_022cf288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b40dc
        .extern func_ov002_021b41a4
        .extern func_ov002_021baca8
        .extern func_ov002_021bae7c
        .extern func_ov002_021d479c
        .extern func_ov002_021d5c50
        .extern func_ov002_021d7970
        .extern func_ov002_021df6d4
        .extern func_ov002_021e06e4
        .extern func_ov002_021e276c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021e2d20
        .extern func_ov002_021e30b4
        .extern func_ov002_02244fe4
        .extern func_ov002_022592b8
        .extern func_ov002_022628e4
        .global func_ov002_02262994
        .arm
func_ov002_02262994:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r7, [r1, #0xcec]
    ldr r1, _LIT2
    and r2, r7, #0x1
    mul r4, r2, r0
    ldr r1, [r1, r4]
    mov r0, r1, lsr #0x18
    tst r1, #0x1
    ldr r1, _LIT0
    and r5, r0, #0x1
    cmpeq r5, #0x0
    movne r6, #0x1
    ldr r2, [r1, #0xd20]
    moveq r6, #0x0
    cmp r2, #0x8
    addls pc, pc, r2, lsl #0x2
    b .L_5e0
    b .L_70
    b .L_18c
    b .L_268
    b .L_308
    b .L_49c
    b .L_50c
    b .L_55c
    b .L_584
    b .L_5b0
.L_70:
    ldr r2, _LIT3
    mov r0, r7
    mov r1, #0xb
    bl func_ov002_021b3ecc
    orr r4, r6, r0
    ldr r2, _LIT4
    mov r0, r7
    mov r1, #0xb
    bl func_ov002_021b3ecc
    orrs r0, r4, r0
    beq .L_124
    ldr r0, _LIT5
    ldr r0, [r0, r7, lsl #0x2]
    cmp r0, #0x1
    bne .L_e8
    mov r0, r7
    bl func_ov002_022628e4
    cmp r0, #0x0
    beq .L_e8
    cmp r7, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x23
    mov r0, r0, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, #0x5
    bl func_ov002_021d479c
    b .L_10c
.L_e8:
    cmp r5, #0x0
    beq .L_100
    ldr r1, _LIT6
    mov r0, r7
    bl func_ov002_021ae400
    b .L_10c
.L_100:
    ldr r1, _LIT7
    mov r0, r7
    bl func_ov002_021ae400
.L_10c:
    mov r1, #0x0
    mov r0, r7
    mov r2, r1
    bl func_ov002_021e2d20
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_124:
    cmp r7, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    mov r1, #0x0
    orr r0, r0, #0xc
    mov r0, r0, lsl #0x10
    mov r2, r1
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d479c
    cmp r7, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x28
    mov r0, r0, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, #0xd
    bl func_ov002_021d479c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd20]
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18c:
    ldr r0, _LIT8
    ldr r0, [r0, r4]
    cmp r0, #0x0
    bne .L_1c8
    ldr r1, _LIT9
    mov r0, r7
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_1c8
    ldr r1, _LIT9
    mov r0, r7
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021e276c
.L_1c8:
    ldr r6, _LIT10
    ldr r5, _LIT11
    ldr fp, _LIT1
    mov sl, #0x0
    mov r4, #0x1
.L_1dc:
    cmp sl, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    eor r8, r7, r0
    mov r0, r8
    mov r1, #0xb
    mov r2, r6
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_244
    mov r1, r6
    rsb r0, r8, #0x1
    bl func_ov002_021df6d4
    bl func_ov002_021e2b3c
    and r1, r8, #0x1
    mla r0, r1, fp, r5
    ldr r0, [r0, #0xc]
    subs r9, r0, #0x1
    bmi .L_240
.L_228:
    mov r0, r8
    mov r1, r9
    mov r2, r4
    bl func_ov002_021d7970
    subs r9, r9, #0x1
    bpl .L_228
.L_240:
    bl func_ov002_021e2c5c
.L_244:
    add sl, sl, #0x1
    cmp sl, #0x2
    blt .L_1dc
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd20]
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_268:
    ldr r2, _LIT12
    mov r0, r7
    mov r1, #0xb
    bl func_ov002_021b41a4
    movs r5, r0
    bmi .L_2bc
    mov r2, r7, lsl #0x1f
    mov r1, r5, lsl #0x10
    ldr r0, _LIT13
    and r2, r2, #-2147483648
    orr r0, r2, r0
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
    ldr r2, _LIT12
    mov r0, r7
    mov r3, r5
    mov r1, #0xb
    bl func_ov002_021d5c50
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2bc:
    ldr r2, _LIT14
    mov r0, r7
    mov r1, #0xb
    mov r3, #0x0
    bl func_ov002_021b40dc
    cmp r0, #0x0
    beq .L_2f8
    ldr r1, _LIT14
    rsb r0, r7, #0x1
    bl func_ov002_021df6d4
    ldr r0, _LIT0
    mov r1, #0x7
    str r1, [r0, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2f8:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd20]
    add r1, r1, #0x1
    str r1, [r0, #0xd20]
.L_308:
    ldr r0, _LIT15
    ldr r0, [r0, r4]
    cmp r0, #0x0
    beq .L_484
    ldr r1, _LIT11
    mov r0, r7, lsl #0x1f
    and r0, r0, #-2147483648
    add fp, r1, r4
    mov r9, #0x0
    ldr r8, _LIT16
    str r0, [sp]
    add sl, fp, #0x30
    orr r5, r0, #0x200000
    mov r6, r9
.L_340:
    mov r0, r7
    mov r1, r9
    mov r2, r8
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_390
    ldr r2, [sl]
    mov r0, r9, lsl #0x10
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    and r3, r0, #0x1f0000
    add r0, r1, r2, lsr #0x1f
    orr r3, r5, r3
    mov r1, r0, lsl #0x10
    mov r2, r6
    orr r0, r3, r8
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_390:
    add r9, r9, #0x1
    cmp r9, #0x4
    add sl, sl, #0x14
    ble .L_340
    mov sl, #0x0
    ldr r8, _LIT17
    add r9, fp, #0x30
    mov r6, sl
.L_3b0:
    mov r0, r7
    mov r1, sl
    mov r2, r8
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_400
    ldr r2, [r9]
    mov r0, sl, lsl #0x10
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    and r3, r0, #0x1f0000
    add r0, r1, r2, lsr #0x1f
    orr r3, r5, r3
    mov r1, r0, lsl #0x10
    mov r2, r6
    orr r0, r3, r8
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_400:
    add sl, sl, #0x1
    cmp sl, #0x4
    add r9, r9, #0x14
    ble .L_3b0
    ldr r0, _LIT18
    ldr r0, [r0, r4]
    subs r6, r0, #0x1
    bmi .L_484
    add r0, fp, #0x18
    add r0, r0, #0x400
    ldr r1, _LIT19
    add r4, r0, r6, lsl #0x2
    ldr r0, [sp]
    sub r7, r1, #0x4e0000
    orr r5, r0, r1
    mov r8, #0x0
.L_440:
    ldr r1, [r4]
    mov r0, r1, lsl #0x13
    cmp r7, r0, lsr #0x13
    bne .L_478
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r1, r0, lsl #0x10
    mov r0, r5
    mov r2, r8
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_478:
    sub r4, r4, #0x4
    subs r6, r6, #0x1
    bpl .L_440
.L_484:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd20]
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_49c:
    ldr r2, _LIT16
    mov r0, r7
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_4c8
    ldr r0, _LIT0
    ldr r1, [r0, #0xd20]
    add r1, r1, #0x3
    str r1, [r0, #0xd20]
    b .L_504
.L_4c8:
    ldr r0, _LIT5
    ldr r0, [r0, r7, lsl #0x2]
    cmp r0, #0x1
    bne .L_4ec
    ldr r0, _LIT0
    ldr r1, [r0, #0xd20]
    add r1, r1, #0x2
    str r1, [r0, #0xd20]
    b .L_504
.L_4ec:
    mov r0, #0x1
    bl func_ov002_022592b8
    ldr r0, _LIT0
    ldr r1, [r0, #0xd20]
    add r1, r1, #0x1
    str r1, [r0, #0xd20]
.L_504:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_50c:
    ldr r0, [r1, #0xd50]
    cmp r0, #0x0
    beq .L_54c
    ldr r0, [r1, #0xd64]
    cmp r0, #0xc
    bne .L_534
    add r0, r2, #0x1
    str r0, [r1, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_534:
    mov r0, #0x1
    str r0, [r1, #0xd54]
    sub r0, r2, #0x1
    str r0, [r1, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_54c:
    sub r0, r2, #0x1
    str r0, [r1, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_55c:
    mov r0, r7
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_021e06e4
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd20]
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_584:
    mov r0, #0x1
    mov r1, #0x0
    bl func_ov002_02244fe4
    ldr r2, _LIT20
    mov r0, #0x0
    ldr r1, _LIT0
    str r0, [r2, #0x488]
    ldr r2, [r1, #0xd20]
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5b0:
    ldr r0, _LIT20
    ldr r0, [r0, #0x488]
    cmp r0, #0x0
    beq .L_5d0
    sub r0, r2, #0x1
    str r0, [r1, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5d0:
    add r0, r2, #0x1
    str r0, [r1, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5e0:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf288
_LIT3: .word 0x000014ff
_LIT4: .word 0x00001548
_LIT5: .word data_ov002_022cd744
_LIT6: .word 0x00000132
_LIT7: .word 0x00000133
_LIT8: .word data_ov002_022cf178
_LIT9: .word 0x00001911
_LIT10: .word 0x00001504
_LIT11: .word data_ov002_022cf16c
_LIT12: .word 0x000014fd
_LIT13: .word 0x025014fd
_LIT14: .word 0x00001885
_LIT15: .word data_ov002_022cf17c
_LIT16: .word 0x000014c4
_LIT17: .word 0x00001a97
_LIT18: .word data_ov002_022cf180
_LIT19: .word 0x004e1984
_LIT20: .word data_ov002_022ce288
