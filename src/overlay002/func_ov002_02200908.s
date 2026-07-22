; func_ov002_02200908 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf178
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d016c
        .extern func_0202b878
        .extern func_0202b8c0
        .extern func_0202e234
        .extern func_02031358
        .extern IsValue12D3Or147E
        .extern func_ov002_021b59b0
        .extern func_ov002_021b8ecc
        .extern func_ov002_021bb90c
        .extern func_ov002_021bc8c8
        .extern func_ov002_021c24f8
        .extern func_ov002_021c8940
        .extern func_ov002_021f4194
        .extern func_ov002_021ff14c
        .extern func_ov002_021ff170
        .extern func_ov002_021ff2c8
        .extern func_ov002_021ff354
        .extern func_ov002_0220803c
        .extern func_ov002_0223de94
        .global func_ov002_02200908
        .arm
func_ov002_02200908:
    stmdb sp!, {r3, r4, r5, lr}
    movs r4, r1
    mov r5, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    movhi r0, #0x0
    ldmhiia sp!, {r3, r4, r5, pc}
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl IsValue12D3Or147E
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r2, [r5]
    ldr r1, _LIT0
    cmp r2, r1
    bgt .L_2fc
    bge .L_75c
    ldr r0, _LIT1
    cmp r2, r0
    bgt .L_27c
    bge .L_5f4
    sub r3, r1, #0x318
    cmp r2, r3
    bgt .L_24c
    sub r1, r1, #0x318
    cmp r2, r1
    bge .L_488
    ldr r3, _LIT2
    cmp r2, r3
    bgt .L_20c
    beq .L_acc
    b .L_b98
.L_20c:
    add r1, r3, #0x1b
    sub r1, r2, r1
    cmp r1, #0xa
    addls pc, pc, r1, lsl #0x2
    b .L_b98
    b .L_3e0
    b .L_418
    b .L_450
    b .L_b98
    b .L_b98
    b .L_b98
    b .L_b98
    b .L_b98
    b .L_b98
    b .L_4c4
    b .L_4e8
.L_24c:
    ldr r0, _LIT3
    cmp r2, r0
    bgt .L_26c
    bge .L_584
    sub r0, r0, #0x63
    cmp r2, r0
    beq .L_54c
    b .L_b98
.L_26c:
    add r0, r0, #0x1c
    cmp r2, r0
    beq .L_8d0
    b .L_b98
.L_27c:
    add r3, r0, #0xb2
    cmp r2, r3
    bgt .L_2c4
    mov r1, r3
    cmp r2, r1
    bge .L_6a8
    add r1, r0, #0x38
    cmp r2, r1
    bgt .L_2b4
    bge .L_97c
    add r0, r0, #0x27
    cmp r2, r0
    beq .L_950
    b .L_b98
.L_2b4:
    add r0, r0, #0xaf
    cmp r2, r0
    beq .L_620
    b .L_b98
.L_2c4:
    sub r3, r1, #0x38
    cmp r2, r3
    bgt .L_2ec
    sub r1, r1, #0x38
    cmp r2, r1
    bge .L_4c4
    rsb r0, r0, #0x2a80
    cmp r2, r0
    beq .L_6e4
    b .L_b98
.L_2ec:
    sub r0, r1, #0xa
    cmp r2, r0
    beq .L_744
    b .L_b98
.L_2fc:
    ldr r3, _LIT4
    cmp r2, r3
    bgt .L_370
    bge .L_9d8
    add r0, r1, #0xed
    cmp r2, r0
    bgt .L_340
    bge .L_500
    sub r0, r3, #0x194
    cmp r2, r0
    bgt .L_330
    beq .L_4c4
    b .L_b98
.L_330:
    add r0, r1, #0xa9
    cmp r2, r0
    beq .L_79c
    b .L_b98
.L_340:
    sub r0, r3, #0x74
    cmp r2, r0
    bgt .L_360
    bge .L_9a8
    sub r0, r3, #0xcf
    cmp r2, r0
    beq .L_7e8
    b .L_b98
.L_360:
    sub r0, r3, #0x66
    cmp r2, r0
    beq .L_9c0
    b .L_b98
.L_370:
    ldr r1, _LIT5
    cmp r2, r1
    bgt .L_3b0
    bge .L_9c0
    add r0, r3, #0xa4
    cmp r2, r0
    bgt .L_3a0
    bge .L_860
    sub r0, r1, #0x104
    cmp r2, r0
    beq .L_814
    b .L_b98
.L_3a0:
    sub r0, r1, #0x81
    cmp r2, r0
    beq .L_8ac
    b .L_b98
.L_3b0:
    add r0, r1, #0x43
    cmp r2, r0
    bgt .L_3d0
    bge .L_a44
    add r0, r1, #0x1
    cmp r2, r0
    beq .L_9a8
    b .L_b98
.L_3d0:
    add r0, r1, #0x44
    cmp r2, r0
    beq .L_a88
    b .L_b98
.L_3e0:
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r4]
    sub r0, r3, #0x1e4
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_418:
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r4]
    add r0, r3, #0x10
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_450:
    ldrh r2, [r4, #0x2]
    ldrh r1, [r5, #0x2]
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsl #0x1f
    cmp r2, r1, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r4]
    sub r0, r0, #0x398
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_488:
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r4]
    ldr r0, _LIT6
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    mov r0, r0, lsl #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_4c4:
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff354
    ldmia sp!, {r3, r4, r5, pc}
.L_4e8:
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x17
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_500:
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT7
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x3
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x17
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_54c:
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_584:
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff354
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_ov002_021b59b0
    cmp r0, #0x1
    cmpne r0, #0x4
    bne .L_5ec
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_5ec:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_5f4:
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_ov002_021b8ecc
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_620:
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_6a0
    ldrh r0, [r4]
    bl func_0202e234
    cmp r0, #0x0
    bne .L_6a0
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0x4
    and r0, r0, #0xff
    bgt .L_6a0
    ldr r2, _LIT8
    mov r3, #0x14
    ldr r4, _LIT9
    and r5, r0, #0x1
    mul r3, r1, r3
    mla r2, r5, r2, r4
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    beq .L_6a0
    bl func_ov002_021c8940
    cmp r0, #0x2
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
.L_6a0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_6a8:
    ldrh r0, [r4]
    bl func_0202e234
    cmp r0, #0x0
    bne .L_6dc
    mov r0, r4
    bl func_ov002_021b59b0
    cmp r0, #0x0
    beq .L_6dc
    mov r0, r4
    bl func_ov002_021b59b0
    cmp r0, #0x4
    movlt r0, #0x1
    ldmltia sp!, {r3, r4, r5, pc}
.L_6dc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_6e4:
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_ov002_021b8ecc
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r1, #0x1
    str r1, [sp]
    ldrh r2, [r5, #0x2]
    ldrh r0, [r5, #0x4]
    mov r3, #0x0
    mov r4, r2, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r0, r4, lsr #0x1f
    mov r2, r2, lsr #0x17
    bl func_ov002_021ff170
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_744:
    ldrh r2, [r4]
    sub r0, r1, #0x348
    cmp r2, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_75c:
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c24f8
    mov r4, r0
    mov r0, r5
    bl func_ov002_021f4194
    cmp r4, r0
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_79c:
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r1, #0x1
    str r1, [sp]
    ldrh r2, [r5, #0x2]
    ldrh r0, [r5, #0x4]
    mov r3, #0x0
    mov r4, r2, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r0, r4, lsr #0x1f
    mov r2, r2, lsr #0x17
    bl func_ov002_021ff14c
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_7e8:
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b8c0
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_814:
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b8c0
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_860:
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x17
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b8c0
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_8ac:
    ldrh r0, [r5, #0x2]
    add r1, r3, #0x6c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb90c
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_8d0:
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT7
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    eor r2, r1, r2, lsr #0x1f
    ldr r1, [r0, #0xcec]
    rsb r0, r2, #0x1
    cmp r1, r0
    bne .L_948
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x11
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r0, r0, r1, lsr #0x1f
    cmp r0, r2
    beq .L_948
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    bne .L_948
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1f
    mov r2, r0, lsl #0x1a
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x11
    eor r0, r1, r0, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021bc8c8
    ldmia sp!, {r3, r4, r5, pc}
.L_948:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_950:
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    bne .L_974
    ldrh r0, [r4]
    bl func_0202b8c0
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
.L_974:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_97c:
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x17
    bne .L_9a0
    ldrh r0, [r4]
    bl func_0202b8c0
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
.L_9a0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_9a8:
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x17
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_9c0:
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_9d8:
    ldrh r3, [r4, #0x2]
    ldrh r1, [r5, #0x2]
    mov r2, r3, lsl #0x11
    mov r0, r1, lsl #0x11
    mov r3, r3, lsl #0x1f
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r2, r2, r3, lsr #0x1f
    eor r0, r0, r1, lsr #0x1f
    cmp r2, r0
    beq .L_a3c
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x17
    bne .L_a3c
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1f
    mov r2, r0, lsl #0x1a
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x11
    eor r0, r1, r0, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021bc8c8
    ldmia sp!, {r3, r4, r5, pc}
.L_a3c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_a44:
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x17
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_0220803c
    ldmia sp!, {r3, r4, r5, pc}
.L_a88:
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_0220803c
    ldmia sp!, {r3, r4, r5, pc}
.L_acc:
    ldrh r0, [r4]
    bl func_02031358
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r2, [r4]
    ldr r1, _LIT10
    cmp r2, r1
    bgt .L_b04
    bge .L_b3c
    sub r0, r1, #0xa
    cmp r2, r0
    beq .L_b70
    b .L_b90
.L_b04:
    add r0, r1, #0x2b
    cmp r2, r0
    bgt .L_b2c
    add r0, r1, #0x2a
    cmp r2, r0
    blt .L_b90
    addne r0, r1, #0x2b
    cmpne r2, r0
    beq .L_b70
    b .L_b90
.L_b2c:
    add r0, r1, #0x31
    cmp r2, r0
    beq .L_b70
    b .L_b90
.L_b3c:
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT8
    ldr r1, _LIT11
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    rsb r2, r2, #0x1
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    bne .L_b90
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_b70:
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021ff2c8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_b90:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_b98:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001634
_LIT1: .word 0x0000148f
_LIT2: .word 0x000012da
_LIT3: .word 0x00001470
_LIT4: .word 0x0000183a
_LIT5: .word 0x000019e1
_LIT6: .word 0x00001246
_LIT7: .word data_ov002_022d016c
_LIT8: .word 0x00000868
_LIT9: .word data_ov002_022cf1a4
_LIT10: .word 0x000012fa
_LIT11: .word data_ov002_022cf178
