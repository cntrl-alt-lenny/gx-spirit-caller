; func_ov002_022719c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd230
        .extern data_ov002_022cd238
        .extern data_ov002_022cd664
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae3a4
        .extern func_ov002_021bc920
        .extern func_ov002_021c37e4
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_02270094
        .extern func_ov002_022903f0
        .extern func_ov002_0229acd0
        .extern func_ov002_0229ce00
        .global func_ov002_022719c4
        .arm
func_ov002_022719c4:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x200
    ldr r1, _LIT0
    ldr r0, [r1, #0x18]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    bne .L_28
    cmp r0, #0x0
    beq .L_98
    b .L_934
.L_28:
    sub r0, r0, #0xa
    cmp r0, #0x17
    addls pc, pc, r0, lsl #0x2
    b .L_934
    b .L_798
    b .L_7fc
    b .L_878
    b .L_934
    b .L_934
    b .L_934
    b .L_934
    b .L_934
    b .L_934
    b .L_934
    b .L_484
    b .L_500
    b .L_57c
    b .L_710
    b .L_934
    b .L_934
    b .L_934
    b .L_934
    b .L_934
    b .L_934
    b .L_170
    b .L_1ec
    b .L_268
    b .L_3fc
.L_98:
    ldr r0, _LIT0
    ldr r1, [r0]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_021c37e4
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_130
    b .L_d8
    b .L_d8
    b .L_d8
    b .L_d8
    b .L_d8
    b .L_f0
    b .L_f0
.L_d8:
    ldr r0, _LIT0
    mov r1, #0x0
    strb r1, [r0, #0x8]
    add sp, sp, #0x200
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_f0:
    ldr r1, _LIT0
    ldrh r0, [r1, #0x16]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    mov r0, #0x0
    streqb r0, [r1, #0x8]
    addeq sp, sp, #0x200
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, [r1, #0x18]
    add sp, sp, #0x200
    bic r2, r2, #0xff
    orr r2, r2, #0xa
    str r2, [r1, #0x18]
    ldmia sp!, {r3, r4, r5, pc}
.L_130:
    ldr r1, _LIT0
    ldrh r0, [r1, #0x16]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    mov r0, #0x0
    streqb r0, [r1, #0x8]
    addeq sp, sp, #0x200
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, [r1, #0x18]
    add sp, sp, #0x200
    bic r2, r2, #0xff
    orr r2, r2, #0x14
    str r2, [r1, #0x18]
    ldmia sp!, {r3, r4, r5, pc}
.L_170:
    ldr r1, [r1]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_19c
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_1b4
.L_19c:
    add r0, sp, #0x100
    mov r1, #0x2
    mov r2, #0x3
    bl func_ov002_0229ce00
    add r0, sp, #0x100
    bl func_ov002_021ae3a4
.L_1b4:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r3, _LIT3
    strb r0, [r1, #0x8]
    ldr r2, [r3]
    add sp, sp, #0x200
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_1ec:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    addeq sp, sp, #0x200
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r1]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_230
    ldr r2, _LIT4
    mov r1, #0x1
    bl func_ov002_022903f0
    b .L_238
.L_230:
    ldr r0, _LIT4
    bl func_ov002_02259204
.L_238:
    ldr r3, _LIT3
    add sp, sp, #0x200
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_268:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_3c8
    ldr r0, _LIT2
    ldr r2, _LIT5
    ldr r4, [r0, #0xd70]
    ldr r5, [r0, #0xd74]
    ldr r3, [r0, #0xd78]
    ldr r0, _LIT6
    and r1, r4, #0x1
    add r5, r5, r3
    mla r2, r1, r0, r2
    mov r0, #0x14
    mul r0, r5, r0
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r1, r4
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r2, r5
    add r3, r0, r3, lsr #0x1f
    mov r0, #0x28
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    and ip, r4, #0xff
    ldrb r2, [r0, #0x8]
    and r3, r5, #0xff
    ldr r1, _LIT7
    orr r3, ip, r3, lsl #0x8
    mov r2, r2, lsl #0x1
    strh r3, [r1, r2]
    ldrb r1, [r0, #0x8]
    add r2, r1, #0x1
    and r1, r2, #0xff
    strb r2, [r0, #0x8]
    cmp r1, #0x3
    bcs .L_3bc
    ldr r0, [r0]
    mov r2, r4
    mov r4, r0, lsl #0x1f
    mov r1, r0, lsl #0x9
    mov r3, r5
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x11
    bl func_ov002_021bc920
    cmp r0, #0x0
    beq .L_38c
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x1
    bne .L_35c
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_364
.L_35c:
    mov r0, #0x124
    bl func_ov002_021ae3a4
.L_364:
    ldr r2, _LIT3
    ldr r1, [r2]
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0
    str r0, [r2]
    b .L_3b0
.L_38c:
    ldr r2, _LIT3
    ldr r1, [r2]
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    sub r0, r0, #0x1
    bic r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0
    str r0, [r2]
.L_3b0:
    add sp, sp, #0x200
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_3bc:
    add sp, sp, #0x200
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_3c8:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x29
    bl func_ov002_0229acd0
    ldr r1, _LIT0
    add sp, sp, #0x200
    ldr r2, [r1, #0x18]
    mov r0, #0x0
    bic r2, r2, #0xff
    orr r2, r2, #0x1e
    str r2, [r1, #0x18]
    ldmia sp!, {r3, r4, r5, pc}
.L_3fc:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    beq .L_448
    ldrb r4, [r1, #0x8]
    ldr r3, _LIT7
    sub r0, r4, #0x1
    mov r0, r0, lsl #0x1
    ldrh r2, [r3, r0]
    mov r0, r4, lsl #0x1
    strh r2, [r3, r0]
    ldrb r0, [r1, #0x8]
    add r2, r0, #0x1
    and r0, r2, #0xff
    cmp r0, #0x3
    strb r2, [r1, #0x8]
    addcs sp, sp, #0x200
    movcs r0, #0x1
    ldmcsia sp!, {r3, r4, r5, pc}
.L_448:
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    ldr r3, _LIT3
    add sp, sp, #0x200
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    sub r1, r1, #0x2
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_484:
    ldr r1, [r1]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_4b0
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_4c8
.L_4b0:
    mov r1, #0x2
    add r0, sp, #0x0
    mov r2, r1
    bl func_ov002_0229ce00
    add r0, sp, #0x0
    bl func_ov002_021ae3a4
.L_4c8:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r3, _LIT3
    strb r0, [r1, #0x8]
    ldr r2, [r3]
    add sp, sp, #0x200
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_500:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    addeq sp, sp, #0x200
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r1]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_544
    ldr r2, _LIT4
    mov r1, #0x1
    bl func_ov002_022903f0
    b .L_54c
.L_544:
    ldr r0, _LIT4
    bl func_ov002_02259204
.L_54c:
    ldr r3, _LIT3
    add sp, sp, #0x200
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_57c:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_6dc
    ldr r0, _LIT2
    ldr r2, _LIT5
    ldr r4, [r0, #0xd70]
    ldr r5, [r0, #0xd74]
    ldr r3, [r0, #0xd78]
    ldr r0, _LIT6
    and r1, r4, #0x1
    add r5, r5, r3
    mla r2, r1, r0, r2
    mov r0, #0x14
    mul r0, r5, r0
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r1, r4
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r2, r5
    add r3, r0, r3, lsr #0x1f
    mov r0, #0x28
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    and ip, r4, #0xff
    ldrb r2, [r0, #0x8]
    and r3, r5, #0xff
    ldr r1, _LIT7
    orr r3, ip, r3, lsl #0x8
    mov r2, r2, lsl #0x1
    strh r3, [r1, r2]
    ldrb r1, [r0, #0x8]
    add r2, r1, #0x1
    and r1, r2, #0xff
    strb r2, [r0, #0x8]
    cmp r1, #0x2
    bcs .L_6d0
    ldr r0, [r0]
    mov r2, r4
    mov r4, r0, lsl #0x1f
    mov r1, r0, lsl #0x9
    mov r3, r5
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x11
    bl func_ov002_021bc920
    cmp r0, #0x0
    beq .L_6a0
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x1
    bne .L_670
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_678
.L_670:
    mov r0, #0x124
    bl func_ov002_021ae3a4
.L_678:
    ldr r2, _LIT3
    ldr r1, [r2]
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0
    str r0, [r2]
    b .L_6c4
.L_6a0:
    ldr r2, _LIT3
    ldr r1, [r2]
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    sub r0, r0, #0x1
    bic r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0
    str r0, [r2]
.L_6c4:
    add sp, sp, #0x200
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_6d0:
    add sp, sp, #0x200
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_6dc:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x29
    bl func_ov002_0229acd0
    ldr r1, _LIT0
    add sp, sp, #0x200
    ldr r2, [r1, #0x18]
    mov r0, #0x0
    bic r2, r2, #0xff
    orr r2, r2, #0x14
    str r2, [r1, #0x18]
    ldmia sp!, {r3, r4, r5, pc}
.L_710:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    beq .L_75c
    ldrb r4, [r1, #0x8]
    ldr r3, _LIT7
    sub r0, r4, #0x1
    mov r0, r0, lsl #0x1
    ldrh r2, [r3, r0]
    mov r0, r4, lsl #0x1
    strh r2, [r3, r0]
    ldrb r0, [r1, #0x8]
    add r2, r0, #0x1
    and r0, r2, #0xff
    cmp r0, #0x2
    strb r2, [r1, #0x8]
    addcs sp, sp, #0x200
    movcs r0, #0x1
    ldmcsia sp!, {r3, r4, r5, pc}
.L_75c:
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    ldr r3, _LIT3
    add sp, sp, #0x200
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    sub r1, r1, #0x2
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_798:
    ldr r1, [r1]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_7c4
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_7cc
.L_7c4:
    mov r0, #0x1
    bl func_ov002_021ae3a4
.L_7cc:
    ldr r3, _LIT3
    add sp, sp, #0x200
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_7fc:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    addeq sp, sp, #0x200
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r1]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_840
    ldr r2, _LIT4
    mov r1, #0x1
    bl func_ov002_022903f0
    b .L_848
.L_840:
    ldr r0, _LIT4
    bl func_ov002_02259204
.L_848:
    ldr r3, _LIT3
    add sp, sp, #0x200
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_878:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_900
    ldr r0, _LIT2
    ldr r2, _LIT5
    ldr r4, [r0, #0xd70]
    ldr r5, [r0, #0xd74]
    ldr r3, [r0, #0xd78]
    ldr r0, _LIT6
    and r1, r4, #0x1
    mla r2, r1, r0, r2
    add r5, r5, r3
    mov r0, #0x14
    mul r0, r5, r0
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r1, r4
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r3, r0, r3, lsr #0x1f
    mov r2, r5
    mov r0, #0x28
    bl func_ov002_0229acd0
    ldr r1, _LIT0
    mov r0, #0x1
    and r3, r4, #0xff
    and r2, r5, #0xff
    strb r0, [r1, #0x8]
    orr r2, r3, r2, lsl #0x8
    strh r2, [r1, #0x10]
    add sp, sp, #0x200
    ldmia sp!, {r3, r4, r5, pc}
.L_900:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x29
    bl func_ov002_0229acd0
    ldr r1, _LIT0
    add sp, sp, #0x200
    ldr r2, [r1, #0x18]
    mov r0, #0x0
    bic r2, r2, #0xff
    orr r2, r2, #0xa
    str r2, [r1, #0x18]
    ldmia sp!, {r3, r4, r5, pc}
.L_934:
    mvn r0, #0x0
    add sp, sp, #0x200
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d008c
_LIT3: .word data_ov002_022cd238
_LIT4: .word func_ov002_02270094
_LIT5: .word data_ov002_022cf08c
_LIT6: .word 0x00000868
_LIT7: .word data_ov002_022cd230
