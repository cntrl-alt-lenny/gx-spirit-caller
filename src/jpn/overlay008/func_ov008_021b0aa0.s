; func_ov008_021b0aa0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov008_021b2660
        .extern data_ov008_021b269c
        .extern data_ov008_021b2cc4
        .extern func_02006160
        .extern func_02006178
        .extern func_020221e0
        .extern func_020221f8
        .extern func_020371b8
        .extern func_ov008_021aecd8
        .extern func_ov008_021aed30
        .extern func_ov008_021aed88
        .extern func_ov008_021aedf4
        .extern func_ov008_021af030
        .extern func_ov008_021af910
        .extern func_ov008_021afa88
        .extern func_ov008_021b039c
        .global func_ov008_021b0aa0
        .arm
func_ov008_021b0aa0:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldrh r0, [r0, #0xaa]
    cmp r0, #0x0
    ldreq r0, _LIT1
    ldreqh r0, [r0, #0x4]
    cmpeq r0, #0x0
    bne .L_72c
    bl func_02006160
    cmp r0, #0x0
    beq .L_ac
    ldr r4, _LIT1
    ldr r0, [r4, #0x55c]
    cmp r0, #0x0
    beq .L_6c
    ldr r0, _LIT0
    ldr r0, [r0, #0xac]
    cmp r0, #0x0
    bne .L_6c
    mov r0, #0x42
    mov r2, #0x0
    sub r1, r0, #0x43
    mov r3, #0x1
    str r2, [r4, #0x55c]
    bl func_020371b8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_6c:
    ldr r4, _LIT0
    ldr r0, [r4, #0xb8]
    cmp r0, #0x0
    beq .L_72c
    ldr r0, [r4, #0xb4]
    cmp r0, #0x0
    ldreq r0, [r4, #0xac]
    cmpeq r0, #0x0
    bne .L_72c
    mov r0, #0x3a
    mov r3, #0x1
    sub r1, r0, #0x3b
    mov r2, #0x0
    str r3, [r4, #0xac]
    bl func_020371b8
    b .L_72c
.L_ac:
    bl func_02006178
    cmp r0, #0x0
    beq .L_c0
    bl func_ov008_021b039c
    b .L_72c
.L_c0:
    ldr r0, _LIT2
    ldrh r1, [r0, #0x56]
    tst r1, #0x80
    beq .L_1d4
    ldr r0, _LIT0
    ldr r4, _LIT0
    ldrh r0, [r0, #0xa8]
    ldrh r1, [r4, #0x2]
    cmp r0, #0x3
    movhi r2, #0x2
    subls r2, r0, #0x1
    cmp r1, r2
    bge .L_114
    mov r0, #0x38
    add r5, r1, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    strh r5, [r4, #0x2]
    bl func_020371b8
    b .L_14c
.L_114:
    ldrh r1, [r4]
    sub r0, r0, #0x3
    cmp r1, r0
    bge .L_14c
    mov r0, #0x1
    add r2, r1, #0x1
    mov r1, r0
    strh r2, [r4]
    bl func_ov008_021af030
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_14c:
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aed30
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aecd8
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aed30
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    add r0, r1, r0, ror #0x1b
    mov r1, #0x1
    tst r2, r1, lsl r0
    bne .L_72c
    ldr r0, _LIT0
    mov r1, #0x0
    strh r1, [r0, #0x4]
    b .L_72c
.L_1d4:
    tst r1, #0x40
    beq .L_2c8
    ldr r4, _LIT0
    ldrh r1, [r4, #0x2]
    cmp r1, #0x0
    beq .L_20c
    mov r0, #0x38
    sub r5, r1, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    strh r5, [r4, #0x2]
    bl func_020371b8
    b .L_240
.L_20c:
    ldrh r0, [r4]
    cmp r0, #0x0
    beq .L_240
    sub r2, r0, #0x1
    mov r0, #0x1
    mov r1, #0x0
    strh r2, [r4]
    bl func_ov008_021af030
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_240:
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aed30
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aecd8
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aed30
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    add r0, r1, r0, ror #0x1b
    mov r1, #0x1
    tst r2, r1, lsl r0
    bne .L_72c
    ldr r0, _LIT0
    mov r1, #0x0
    strh r1, [r0, #0x4]
    b .L_72c
.L_2c8:
    tst r1, #0x10
    beq .L_378
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aed30
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aecd8
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aed30
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    add r0, r1, r0, ror #0x1b
    mov r1, #0x1
    tst r2, r1, lsl r0
    beq .L_72c
    ldr r0, _LIT0
    mov r2, #0x0
    ldrh r1, [r0, #0x4]
    mov r3, #0x1
    cmp r1, #0x5
    moveq r1, #0x0
    addne r1, r1, #0x1
    strh r1, [r0, #0x4]
    mov r0, #0x38
    sub r1, r0, #0x39
    bl func_020371b8
    b .L_72c
.L_378:
    tst r1, #0x20
    beq .L_428
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aed30
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aecd8
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aed30
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    add r0, r1, r0, ror #0x1b
    mov r1, #0x1
    tst r2, r1, lsl r0
    beq .L_72c
    ldr r0, _LIT0
    mov r2, #0x0
    ldrh r1, [r0, #0x4]
    mov r3, #0x1
    cmp r1, #0x0
    moveq r1, #0x5
    subne r1, r1, #0x1
    strh r1, [r0, #0x4]
    mov r0, #0x38
    sub r1, r0, #0x39
    bl func_020371b8
    b .L_72c
.L_428:
    tst r1, #0x1
    beq .L_4f0
    ldr r0, _LIT0
    ldrh r1, [r0, #0x4]
    cmp r1, #0x0
    bne .L_72c
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aed30
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aecd8
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aed30
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    add r0, r1, r0, ror #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    mov r1, #0x1
    tst r2, r1, lsl r0
    ldreq r0, _LIT0
    ldreq r0, [r0, #0xac]
    cmpeq r0, #0x0
    bne .L_72c
    bl func_ov008_021aed88
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021af910
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_72c
.L_4f0:
    tst r1, #0x2
    beq .L_524
    ldr r0, _LIT0
    ldr r0, [r0, #0xb4]
    cmp r0, #0x0
    beq .L_72c
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_524:
    tst r1, #0x400
    beq .L_564
    ldr r4, _LIT0
    ldr r0, [r4, #0xb4]
    cmp r0, #0x0
    ldreq r0, [r4, #0xac]
    cmpeq r0, #0x0
    bne .L_72c
    mov r3, #0x1
    mov r0, #0x3a
    str r3, [r4, #0xb8]
    sub r1, r0, #0x3b
    mov r2, #0x0
    str r3, [r4, #0xac]
    bl func_020371b8
    b .L_72c
.L_564:
    tst r1, #0x100
    beq .L_644
    ldr r0, _LIT0
    ldrh r1, [r0, #0xa8]
    ldrh r0, [r0]
    sub r1, r1, #0x3
    cmp r0, r1
    bge .L_5bc
    ldr r2, _LIT0
    sub r0, r1, r0
    ldrh r3, [r2]
    cmp r0, #0x3
    movgt r0, #0x3
    add r3, r3, r0
    mov r1, #0x1
    strh r3, [r2]
    bl func_ov008_021af030
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_5bc:
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aed30
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aecd8
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aed30
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    add r0, r1, r0, ror #0x1b
    mov r1, #0x1
    tst r2, r1, lsl r0
    bne .L_72c
    ldr r0, _LIT0
    mov r1, #0x0
    strh r1, [r0, #0x4]
    b .L_72c
.L_644:
    tst r1, #0x200
    beq .L_718
    ldr r0, _LIT0
    ldrh r0, [r0]
    cmp r0, #0x0
    beq .L_690
    ldr r2, _LIT0
    cmp r0, #0x3
    ldrh r3, [r2]
    movgt r0, #0x3
    mov r1, #0x0
    sub r3, r3, r0
    strh r3, [r2]
    bl func_ov008_021af030
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_690:
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aed30
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aecd8
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aed30
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    add r0, r1, r0, ror #0x1b
    mov r1, #0x1
    tst r2, r1, lsl r0
    bne .L_72c
    ldr r0, _LIT0
    mov r1, #0x0
    strh r1, [r0, #0x4]
    b .L_72c
.L_718:
    ldrh r0, [r0, #0x54]
    tst r0, #0x800
    ldrne r0, _LIT0
    movne r1, #0x1
    strne r1, [r0, #0xbc]
.L_72c:
    ldr r0, _LIT0
    ldr r1, [r0, #0xac]
    cmp r1, #0x0
    beq .L_828
    ldrh r1, [r0, #0xa8]
    ldr r6, [r0, #0xb0]
    cmp r6, r1
    movge r1, #0x0
    strge r1, [r0, #0xac]
    bge .L_828
    mov r0, r6
    bl func_ov008_021aed30
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0xb0]
    bl func_ov008_021aecd8
    mov r4, r0
    mov r0, r6
    bl func_ov008_021aed30
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    add r0, r1, r0, ror #0x1b
    mov r1, #0x1
    tst r2, r1, lsl r0
    bne .L_818
    ldr r0, _LIT0
    ldr r0, [r0, #0xb0]
    bl func_ov008_021af910
    ldr r0, _LIT0
    ldr r0, [r0, #0xb0]
    bl func_ov008_021aecd8
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0xb0]
    bl func_ov008_021aed30
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0xb0]
    bl func_ov008_021aed30
    mov r1, r5, asr #0x4
    add r1, r5, r1, lsr #0x1b
    mov r3, r0, lsr #0x1f
    rsb r2, r3, r0, lsl #0x1b
    ldr r5, _LIT3
    mov r0, #0x34
    mla ip, r4, r0, r5
    mov r5, r1, asr #0x5
    ldr r4, [ip, r5, lsl #0x2]
    add r0, r3, r2, ror #0x1b
    mov r1, #0x1
    orr r0, r4, r1, lsl r0
    str r0, [ip, r5, lsl #0x2]
.L_818:
    ldr r0, _LIT0
    ldr r1, [r0, #0xb0]
    add r1, r1, #0x1
    str r1, [r0, #0xb0]
.L_828:
    ldr r0, _LIT0
    ldrh r1, [r0, #0xaa]
    cmp r1, #0x0
    beq .L_b0c
    sub r1, r1, #0x1
    strh r1, [r0, #0xaa]
    ldrh r1, [r0, #0x6]
    cmp r1, #0x1
    beq .L_860
    cmp r1, #0x2
    beq .L_8bc
    cmp r1, #0x3
    beq .L_918
    b .L_974
.L_860:
    ldrh r1, [r0, #0xaa]
    ldr r0, _LIT4
    cmp r1, r0
    cmpne r1, #0x12c
    cmpne r1, #0xf8
    cmpne r1, #0xc4
    cmpne r1, #0x90
    bne .L_894
    mov r0, #0x35
    sub r1, r0, #0x36
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_894:
    ldr r0, _LIT0
    ldrh r0, [r0, #0xaa]
    cmp r0, #0x72
    bne .L_9a8
    mov r0, #0x4a
    sub r1, r0, #0x4b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_9a8
.L_8bc:
    ldrh r1, [r0, #0xaa]
    ldr r0, _LIT5
    cmp r1, r0
    cmpne r1, #0x168
    cmpne r1, #0x134
    cmpne r1, #0x100
    cmpne r1, #0xcc
    bne .L_8f0
    mov r0, #0x35
    sub r1, r0, #0x36
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_8f0:
    ldr r0, _LIT0
    ldrh r0, [r0, #0xaa]
    cmp r0, #0xae
    bne .L_9a8
    mov r0, #0x3e
    sub r1, r0, #0x3f
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_9a8
.L_918:
    ldrh r1, [r0, #0xaa]
    ldr r0, _LIT5
    cmp r1, r0
    cmpne r1, #0x168
    cmpne r1, #0x134
    cmpne r1, #0x100
    cmpne r1, #0xcc
    bne .L_94c
    mov r0, #0x35
    sub r1, r0, #0x36
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_94c:
    ldr r0, _LIT0
    ldrh r0, [r0, #0xaa]
    cmp r0, #0xae
    bne .L_9a8
    mov r0, #0x57
    sub r1, r0, #0x58
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_9a8
.L_974:
    ldrh r1, [r0, #0xaa]
    ldr r0, _LIT5
    cmp r1, r0
    cmpne r1, #0x168
    cmpne r1, #0x134
    cmpne r1, #0x100
    cmpne r1, #0xcc
    bne .L_9a8
    mov r0, #0x35
    sub r1, r0, #0x36
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_9a8:
    ldr r1, _LIT0
    ldrh r2, [r1, #0xaa]
    cmp r2, #0x2d
    bgt .L_9c8
    bge .L_a4c
    cmp r2, #0x0
    beq .L_ae0
    b .L_ae4
.L_9c8:
    ldr r0, _LIT6
    cmp r2, r0
    bgt .L_9dc
    beq .L_a14
    b .L_ae4
.L_9dc:
    add r0, r0, #0x3c
    cmp r2, r0
    bne .L_ae4
    mov r0, #0x0
    bl func_020221f8
    orr r1, r0, #0x2
    mov r0, #0x0
    bl func_020221e0
    mov r0, #0x33
    sub r1, r0, #0x34
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_ae4
.L_a14:
    ldrh r0, [r1, #0x6]
    cmp r0, #0x1
    bne .L_ae4
    mov r0, #0x0
    bl func_020221f8
    orr r1, r0, #0x2
    mov r0, #0x0
    bl func_020221e0
    mov r0, #0x33
    sub r1, r0, #0x34
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_ae4
.L_a4c:
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aecd8
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aed30
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aed30
    ldr r2, _LIT3
    mov r1, #0x34
    mla ip, r5, r1, r2
    mov r1, r4, asr #0x4
    add r1, r4, r1, lsr #0x1b
    mov r4, r1, asr #0x5
    ldr r2, [ip, r4, lsl #0x2]
    mov r3, #0x1
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1b
    add r0, r1, r0, ror #0x1b
    orr r0, r2, r3, lsl r0
    str r0, [ip, r4, lsl #0x2]
    mov r0, #0x33
    sub r1, r0, #0x34
    mov r2, #0x0
    bl func_020371b8
    ldr r0, _LIT0
    mov r1, #0x1
    strh r1, [r0, #0x4]
    b .L_ae4
.L_ae0:
    bl func_ov008_021aedf4
.L_ae4:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x54]
    tst r0, #0x2
    beq .L_b0c
    bl func_ov008_021aedf4
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_b0c:
    bl func_ov008_021afa88
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov008_021b2cc4
_LIT1: .word data_ov008_021b2660
_LIT2: .word data_02104acc
_LIT3: .word data_ov008_021b269c
_LIT4: .word 0x0000015f
_LIT5: .word 0x0000019b
_LIT6: .word 0x0000019e
