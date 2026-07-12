; func_ov002_0225c0f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd400
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern func_0202ea74
        .extern func_ov002_021b0b24
        .extern func_ov002_021b3414
        .extern func_ov002_021b3dec
        .extern func_ov002_021b9dec
        .extern func_ov002_021babc8
        .extern func_ov002_021baf88
        .extern func_ov002_021bbf20
        .extern func_ov002_021c1d40
        .extern func_ov002_021d46ac
        .extern func_ov002_021d58dc
        .extern func_ov002_021d5a90
        .extern func_ov002_021df53c
        .extern func_ov002_021df5e4
        .extern func_ov002_021e267c
        .extern func_ov002_021e2be4
        .extern func_ov002_021e2fc4
        .extern func_ov002_02244efc
        .extern func_ov002_0225a490
        .extern func_ov002_0225a584
        .global func_ov002_0225c0f0
        .arm
func_ov002_0225c0f0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldr r1, [r1, #0xd30]
    ldr r5, [r2, #0x4]
    mov r4, r0
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_828
    b .L_38
    b .L_50
    b .L_c4
    b .L_33c
    b .L_7e8
.L_38:
    ldr r0, _LIT2
    bl func_ov002_0225a490
    ldr r0, _LIT0
    ldr r1, [r0, #0xd30]
    add r1, r1, #0x1
    str r1, [r0, #0xd30]
.L_50:
    ldr r0, _LIT3
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_b4
    ldr r1, _LIT1
    ldr r3, _LIT4
    ldr r0, _LIT5
    and r2, r4, #0x1
    mla r3, r2, r0, r3
    ldr r1, [r1, #0x1c]
    mov r0, #0x14
    mul r0, r1, r0
    add r1, r3, #0x30
    ldr r2, [r1, r0]
    ldr r1, _LIT3
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    mov r2, r0, lsl #0x10
    mov r0, r4
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e267c
.L_b4:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd30]
    add r1, r1, #0x1
    str r1, [r0, #0xd30]
.L_c4:
    rsb sl, r4, #0x1
    ldr r2, _LIT4
    ldr r0, _LIT5
    and r1, sl, #0x1
    mla r0, r1, r0, r2
    ldr r5, _LIT1
    add r7, r0, #0x94
    add r8, r0, #0x64
    and r9, sl, #0xff
    mov r6, #0x5
    mov fp, #0x0
.L_f0:
    ldr r0, [r7]
    mov r1, r0, lsl #0x13
    ldr r0, _LIT6
    cmp r0, r1, lsr #0x13
    bne .L_198
    ldr r3, [r8, #0x40]
    ldrh r0, [r8, #0x38]
    mov r2, r3, lsr #0x6
    mov r1, r3, lsr #0x2
    orr r1, r1, r3, lsr #0x1
    and r2, r2, #0x1
    mvn r2, r2
    and r1, r1, #0x1
    and r2, r0, r2
    mvn r0, r1
    tst r2, r0
    beq .L_198
    ldr r1, [r5, #0x1c]
    mov r0, r4
    mov r2, sl
    mov r3, r6
    bl func_ov002_021b3414
    cmp r0, #0x0
    bne .L_198
    ldr r2, [r7]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r6
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    and r2, r6, #0xff
    str fp, [sp]
    orr r2, r9, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    ldr r1, [r5, #0x1c]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x7
    bl func_ov002_021d58dc
.L_198:
    add r6, r6, #0x1
    cmp r6, #0xa
    add r7, r7, #0x14
    add r8, r8, #0x14
    blt .L_f0
    ldr r2, _LIT7
    mov r0, sl
    mov r1, #0xb
    mov r6, #0x0
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_21c
    ldr r1, _LIT8
    mov r0, sl
    bl func_ov002_021bbf20
    cmp r0, #0x0
    beq .L_21c
    ldr r1, _LIT1
    mov r0, r4
    ldr r1, [r1, #0x1c]
    mov r2, #0x1
    bl func_ov002_021c1d40
    cmp r0, #0x0
    bne .L_21c
    ldr r1, _LIT7
    mov r0, sl
    bl func_ov002_021df5e4
    ldr r2, _LIT7
    mov r0, sl
    mov r1, #0xb
    mov r3, r6
    bl func_ov002_021d5a90
    mov r6, #0x1
.L_21c:
    ldr r0, _LIT1
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    bne .L_2e0
    ldr r2, _LIT4
    ldr r0, _LIT5
    and r1, sl, #0x1
    mla r7, r1, r0, r2
    mov r9, #0x0
    ldr r5, _LIT9
    add r8, r7, #0x30
    mov fp, r9
.L_24c:
    ldr r2, _LIT5
    mov r0, sl
    mov r1, r9
    add r2, r2, #0x1140
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_2cc
    ldrh r0, [r7, #0x36]
    cmp r0, #0x0
    bne .L_2cc
    mov r0, sl
    mov r1, r9
    mov r2, r5
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_2cc
    ldr r2, [r8]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r9
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    mov r0, sl
    mov r1, r9
    mov r2, r5
    mov r3, #0x2
    str fp, [sp]
    bl func_ov002_021d58dc
    mov r6, #0x1
.L_2cc:
    add r9, r9, #0x1
    cmp r9, #0x4
    add r7, r7, #0x14
    add r8, r8, #0x14
    ble .L_24c
.L_2e0:
    cmp r6, #0x0
    beq .L_324
    cmp r4, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, _LIT1
    orr r2, r1, #0x20
    ldr r1, [r0, #0x1c]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d46ac
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_324:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd30]
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_33c:
    bl func_ov002_0225a584
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT1
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    bne .L_4a0
    mov r0, #0x1
    mov r1, r0
    bl func_ov002_021e2be4
    ldr r0, _LIT1
    ldr r2, _LIT5
    and r3, r4, #0x1
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r6, r3, r2
    ldr r3, _LIT10
    ldr r2, _LIT11
    mul r0, r1, r0
    add r3, r3, r6
    ldr r8, [r0, r3]
    add r7, r2, r6
    mov r3, r8, lsr #0x6
    mov r2, r8, lsr #0x2
    and r3, r3, #0x1
    orr r2, r2, r8, lsr #0x1
    and r2, r2, #0x1
    ldrh r7, [r0, r7]
    mvn r3, r3
    mvn r0, r2
    and r2, r7, r3
    tst r2, r0
    beq .L_484
    mov r0, r4
    bl func_ov002_021b9dec
    ldr r2, _LIT12
    cmp r0, r2
    bgt .L_3f8
    sub r1, r2, #0x2
    cmp r0, r1
    blt .L_484
    subne r1, r2, #0x1
    cmpne r0, r1
    cmpne r0, r2
    beq .L_404
    b .L_484
.L_3f8:
    add r1, r2, #0x20c
    cmp r0, r1
    bne .L_484
.L_404:
    ldr r0, _LIT1
    ldr r2, _LIT4
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r0, r1, r0
    add r6, r2, r6
    add r2, r6, #0x30
    ldr r3, [r2, r0]
    mov r0, r4
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    ldr r1, _LIT1
    mov r0, #0x14
    ldr r1, [r1, #0x1c]
    add r2, r6, #0x30
    mul r0, r1, r0
    ldr r2, [r2, r0]
    ldr r1, _LIT13
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    mov r2, r0, lsl #0x10
    rsb r0, r4, #0x1
    mov r3, r2, lsr #0x10
    mov r2, #0x4
    bl func_ov002_021e267c
.L_484:
    ldr r0, _LIT14
    ldr r0, [r0, #0x4]
    cmp r4, r0
    bne .L_4a0
    mov r0, #0xc
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_4a0:
    ldr r1, _LIT1
    mov r0, r4
    ldr r1, [r1, #0x1c]
    mov r6, #0x0
    bl func_ov002_021b9dec
    ldr r1, _LIT15
    cmp r0, r1
    beq .L_4dc
    ldr r2, _LIT16
    cmp r0, r2
    beq .L_4f0
    add r1, r2, #0x14c
    cmp r0, r1
    beq .L_4f8
    b .L_524
.L_4dc:
    ldr r0, _LIT1
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    moveq r6, #0x1
    b .L_524
.L_4f0:
    mov r6, #0x1
    b .L_524
.L_4f8:
    ldr r0, _LIT1
    ldr r1, [r0, #0x18]
    cmp r1, #0x0
    bne .L_524
    mov r1, r6
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    add r2, r2, #0x14c
    mov r3, #0x2
    bl func_ov002_021d58dc
.L_524:
    cmp r6, #0x0
    beq .L_5bc
    ldr r2, _LIT4
    ldr r0, _LIT5
    and r1, r4, #0x1
    mla r3, r1, r0, r2
    ldr r1, _LIT1
    mov r2, #0x14
    ldr r1, [r1, #0x1c]
    mov r0, r4
    mul r6, r1, r2
    add r7, r3, #0x30
    bl func_ov002_021b9dec
    ldr r6, [r7, r6]
    ldr r1, _LIT1
    mov r7, r4, lsl #0x1f
    ldr r1, [r1, #0x18]
    and r7, r7, #-2147483648
    cmp r1, #0x0
    ldr r1, _LIT1
    orr r7, r7, #0x4200000
    ldr r4, [r1, #0x1c]
    mov r3, r6, lsl #0x2
    mov r1, r3, lsr #0x18
    moveq r2, #0x1
    mov r4, r4, lsl #0x10
    mov r3, r6, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    mov r1, r1, lsl #0x10
    orr r7, r7, #0x20000000
    and r3, r4, #0x1f0000
    orr r3, r7, r3
    mov r0, r0, lsl #0x10
    movne r2, #0x0
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_5bc:
    ldr r1, _LIT1
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    bne .L_6c8
    ldr r0, _LIT5
    and r3, r5, #0x1
    ldr r1, [r1, #0x20]
    mov r2, #0x14
    mul r4, r3, r0
    ldr r0, _LIT11
    mul r2, r1, r2
    add r0, r0, r4
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    beq .L_6c8
    mov r0, r5
    mov r6, #0x0
    bl func_ov002_021b9dec
    ldr r1, _LIT17
    cmp r0, r1
    beq .L_620
    add r1, r1, #0x52
    cmp r0, r1
    beq .L_628
    b .L_638
.L_620:
    mov r6, #0x1
    b .L_638
.L_628:
    ldr r0, _LIT1
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    moveq r6, #0x1
.L_638:
    cmp r6, #0x0
    beq .L_6c8
    ldr r0, _LIT1
    ldr r2, _LIT4
    ldr r1, [r0, #0x20]
    add r3, r2, r4
    mov r2, #0x14
    mul r4, r1, r2
    mov r0, r5
    add r6, r3, #0x30
    bl func_ov002_021b9dec
    ldr r1, _LIT1
    ldr r4, [r6, r4]
    ldr r1, [r1, #0x18]
    mov r7, r5, lsl #0x1f
    cmp r1, #0x0
    ldr r1, _LIT1
    and r7, r7, #-2147483648
    ldr r6, [r1, #0x20]
    mov r3, r4, lsl #0x2
    mov r1, r3, lsr #0x18
    orr r7, r7, #0x4200000
    moveq r2, #0x1
    mov r6, r6, lsl #0x10
    mov r3, r4, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    mov r1, r1, lsl #0x10
    orr r7, r7, #0x20000000
    and r3, r6, #0x1f0000
    orr r3, r7, r3
    mov r0, r0, lsl #0x10
    movne r2, #0x0
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_6c8:
    ldr r2, _LIT4
    ldr r0, _LIT5
    and r1, r5, #0x1
    mla r2, r1, r0, r2
    mov r0, r5, lsl #0x1f
    and r0, r0, #-2147483648
    orr r9, r0, #0x4200000
    ldr fp, _LIT18
    ldr r4, _LIT19
    ldr r6, _LIT1
    ldr r5, _LIT20
    add r7, r2, #0x94
    add r8, r2, #0x64
    orr r9, r9, #0x20000000
    mov sl, #0x5
.L_704:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    cmp r0, r5
    cmpne r0, r4
    cmpne r0, fp
    bne .L_798
    ldr r2, [r8, #0x40]
    ldrh r1, [r8, #0x38]
    mov r3, r2, lsr #0x6
    and r3, r3, #0x1
    mvn r3, r3
    and r1, r1, r3
    mov r3, r2, lsr #0x2
    orr r2, r3, r2, lsr #0x1
    and r2, r2, #0x1
    mvn r2, r2
    tst r1, r2
    beq .L_798
    ldr r1, [r6, #0x18]
    mov r3, sl, lsl #0x10
    cmp r1, #0x0
    and r3, r3, #0x1f0000
    ldr r1, [r7]
    orr r3, r9, r3
    mov r0, r0, lsl #0x10
    orr r0, r3, r0, lsr #0x10
    mov r3, r1, lsl #0x2
    mov r3, r3, lsr #0x18
    moveq r2, #0x1
    mov r1, r1, lsl #0x12
    mov r3, r3, lsl #0x1
    add r1, r3, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    movne r2, #0x0
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_798:
    add sl, sl, #0x1
    cmp sl, #0xa
    add r7, r7, #0x14
    add r8, r8, #0x14
    blt .L_704
    ldr r0, _LIT1
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    moveq r1, #0x1
    movne r1, #0x0
    mov r0, #0x12
    bl func_ov002_02244efc
    ldr r2, _LIT21
    mov r0, #0x0
    ldr r1, _LIT0
    str r0, [r2, #0x488]
    ldr r2, [r1, #0xd30]
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7e8:
    bl func_ov002_0225a584
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT21
    ldr r0, [r0, #0x488]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x13
    mov r1, #0x0
    bl func_ov002_02244efc
    ldr r1, _LIT21
    mov r0, #0x0
    str r0, [r1, #0x488]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_828:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd314
_LIT2: .word data_ov002_022cd400
_LIT3: .word 0x00001469
_LIT4: .word data_ov002_022cf08c
_LIT5: .word 0x00000868
_LIT6: .word 0x00001381
_LIT7: .word 0x0000195f
_LIT8: .word func_0202ea74
_LIT9: .word 0x00000fb6
_LIT10: .word data_ov002_022cf0cc
_LIT11: .word data_ov002_022cf0c4
_LIT12: .word 0x000018ad
_LIT13: .word 0x000018ab
_LIT14: .word data_ov002_022cd65c
_LIT15: .word 0x0000158d
_LIT16: .word 0x00001954
_LIT17: .word 0x00001a78
_LIT18: .word 0x00001931
_LIT19: .word 0x0000153f
_LIT20: .word 0x000013f9
_LIT21: .word data_ov002_022ce1a8
