; func_ov002_02200818 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf098
        .extern data_ov002_022cf0c4
        .extern data_ov002_022d008c
        .extern func_0202b824
        .extern func_0202b86c
        .extern func_0202e1e0
        .extern func_02031304
        .extern func_02031740
        .extern func_ov002_021b58d0
        .extern func_ov002_021b8dec
        .extern func_ov002_021bb82c
        .extern func_ov002_021bc7e8
        .extern func_ov002_021c2418
        .extern func_ov002_021c8860
        .extern func_ov002_021f40a4
        .extern func_ov002_021ff05c
        .extern func_ov002_021ff080
        .extern func_ov002_021ff1d8
        .extern func_ov002_021ff264
        .extern func_ov002_02207f4c
        .extern func_ov002_0223dda4
        .global func_ov002_02200818
        .arm
func_ov002_02200818:
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
    bl func_02031740
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r2, [r5]
    ldr r1, _LIT0
    cmp r2, r1
    bgt .L_190
    bge .L_5f0
    ldr r0, _LIT1
    cmp r2, r0
    bgt .L_110
    bge .L_488
    sub r3, r1, #0x318
    cmp r2, r3
    bgt .L_e0
    sub r1, r1, #0x318
    cmp r2, r1
    bge .L_31c
    ldr r3, _LIT2
    cmp r2, r3
    bgt .L_a0
    beq .L_960
    b .L_a2c
.L_a0:
    add r1, r3, #0x1b
    sub r1, r2, r1
    cmp r1, #0xa
    addls pc, pc, r1, lsl #0x2
    b .L_a2c
    b .L_274
    b .L_2ac
    b .L_2e4
    b .L_a2c
    b .L_a2c
    b .L_a2c
    b .L_a2c
    b .L_a2c
    b .L_a2c
    b .L_358
    b .L_37c
.L_e0:
    ldr r0, _LIT3
    cmp r2, r0
    bgt .L_100
    bge .L_418
    sub r0, r0, #0x63
    cmp r2, r0
    beq .L_3e0
    b .L_a2c
.L_100:
    add r0, r0, #0x1c
    cmp r2, r0
    beq .L_764
    b .L_a2c
.L_110:
    add r3, r0, #0xb2
    cmp r2, r3
    bgt .L_158
    mov r1, r3
    cmp r2, r1
    bge .L_53c
    add r1, r0, #0x38
    cmp r2, r1
    bgt .L_148
    bge .L_810
    add r0, r0, #0x27
    cmp r2, r0
    beq .L_7e4
    b .L_a2c
.L_148:
    add r0, r0, #0xaf
    cmp r2, r0
    beq .L_4b4
    b .L_a2c
.L_158:
    sub r3, r1, #0x38
    cmp r2, r3
    bgt .L_180
    sub r1, r1, #0x38
    cmp r2, r1
    bge .L_358
    rsb r0, r0, #0x2a80
    cmp r2, r0
    beq .L_578
    b .L_a2c
.L_180:
    sub r0, r1, #0xa
    cmp r2, r0
    beq .L_5d8
    b .L_a2c
.L_190:
    ldr r3, _LIT4
    cmp r2, r3
    bgt .L_204
    bge .L_86c
    add r0, r1, #0xed
    cmp r2, r0
    bgt .L_1d4
    bge .L_394
    sub r0, r3, #0x194
    cmp r2, r0
    bgt .L_1c4
    beq .L_358
    b .L_a2c
.L_1c4:
    add r0, r1, #0xa9
    cmp r2, r0
    beq .L_630
    b .L_a2c
.L_1d4:
    sub r0, r3, #0x74
    cmp r2, r0
    bgt .L_1f4
    bge .L_83c
    sub r0, r3, #0xcf
    cmp r2, r0
    beq .L_67c
    b .L_a2c
.L_1f4:
    sub r0, r3, #0x66
    cmp r2, r0
    beq .L_854
    b .L_a2c
.L_204:
    ldr r1, _LIT5
    cmp r2, r1
    bgt .L_244
    bge .L_854
    add r0, r3, #0xa4
    cmp r2, r0
    bgt .L_234
    bge .L_6f4
    sub r0, r1, #0x104
    cmp r2, r0
    beq .L_6a8
    b .L_a2c
.L_234:
    sub r0, r1, #0x81
    cmp r2, r0
    beq .L_740
    b .L_a2c
.L_244:
    add r0, r1, #0x43
    cmp r2, r0
    bgt .L_264
    bge .L_8d8
    add r0, r1, #0x1
    cmp r2, r0
    beq .L_83c
    b .L_a2c
.L_264:
    add r0, r1, #0x44
    cmp r2, r0
    beq .L_91c
    b .L_a2c
.L_274:
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
.L_2ac:
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
.L_2e4:
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
.L_31c:
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
.L_358:
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff264
    ldmia sp!, {r3, r4, r5, pc}
.L_37c:
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x17
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_394:
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
    bl func_0202b824
    cmp r0, #0x17
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_3e0:
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x16
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
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff264
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_ov002_021b58d0
    cmp r0, #0x1
    cmpne r0, #0x4
    bne .L_480
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_480:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_488:
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_ov002_021b8dec
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_4b4:
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_534
    ldrh r0, [r4]
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_534
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0x4
    and r0, r0, #0xff
    bgt .L_534
    ldr r2, _LIT8
    mov r3, #0x14
    ldr r4, _LIT9
    and r5, r0, #0x1
    mul r3, r1, r3
    mla r2, r5, r2, r4
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    beq .L_534
    bl func_ov002_021c8860
    cmp r0, #0x2
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
.L_534:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_53c:
    ldrh r0, [r4]
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_570
    mov r0, r4
    bl func_ov002_021b58d0
    cmp r0, #0x0
    beq .L_570
    mov r0, r4
    bl func_ov002_021b58d0
    cmp r0, #0x4
    movlt r0, #0x1
    ldmltia sp!, {r3, r4, r5, pc}
.L_570:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_578:
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_ov002_021b8dec
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
    bl func_ov002_021ff080
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_5d8:
    ldrh r2, [r4]
    sub r0, r1, #0x348
    cmp r2, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_5f0:
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2418
    mov r4, r0
    mov r0, r5
    bl func_ov002_021f40a4
    cmp r4, r0
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_630:
    ldrh r0, [r4]
    bl func_0202b824
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
    bl func_ov002_021ff05c
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_67c:
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b86c
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_6a8:
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b86c
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_6f4:
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x17
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b86c
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_740:
    ldrh r0, [r5, #0x2]
    add r1, r3, #0x6c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb82c
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_764:
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT7
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    eor r2, r1, r2, lsr #0x1f
    ldr r1, [r0, #0xcec]
    rsb r0, r2, #0x1
    cmp r1, r0
    bne .L_7dc
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x11
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r0, r0, r1, lsr #0x1f
    cmp r0, r2
    beq .L_7dc
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x16
    bne .L_7dc
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1f
    mov r2, r0, lsl #0x1a
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x11
    eor r0, r1, r0, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021bc7e8
    ldmia sp!, {r3, r4, r5, pc}
.L_7dc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_7e4:
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x16
    bne .L_808
    ldrh r0, [r4]
    bl func_0202b86c
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
.L_808:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_810:
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x17
    bne .L_834
    ldrh r0, [r4]
    bl func_0202b86c
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
.L_834:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_83c:
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x17
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_854:
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x16
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_86c:
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
    beq .L_8d0
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x17
    bne .L_8d0
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1f
    mov r2, r0, lsl #0x1a
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x11
    eor r0, r1, r0, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021bc7e8
    ldmia sp!, {r3, r4, r5, pc}
.L_8d0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_8d8:
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x17
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_02207f4c
    ldmia sp!, {r3, r4, r5, pc}
.L_91c:
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_02207f4c
    ldmia sp!, {r3, r4, r5, pc}
.L_960:
    ldrh r0, [r4]
    bl func_02031304
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r2, [r4]
    ldr r1, _LIT10
    cmp r2, r1
    bgt .L_998
    bge .L_9d0
    sub r0, r1, #0xa
    cmp r2, r0
    beq .L_a04
    b .L_a24
.L_998:
    add r0, r1, #0x2b
    cmp r2, r0
    bgt .L_9c0
    add r0, r1, #0x2a
    cmp r2, r0
    blt .L_a24
    addne r0, r1, #0x2b
    cmpne r2, r0
    beq .L_a04
    b .L_a24
.L_9c0:
    add r0, r1, #0x31
    cmp r2, r0
    beq .L_a04
    b .L_a24
.L_9d0:
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
    bne .L_a24
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_a04:
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021ff1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_a24:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_a2c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001634
_LIT1: .word 0x0000148f
_LIT2: .word 0x000012da
_LIT3: .word 0x00001470
_LIT4: .word 0x0000183a
_LIT5: .word 0x000019e1
_LIT6: .word 0x00001246
_LIT7: .word data_ov002_022d008c
_LIT8: .word 0x00000868
_LIT9: .word data_ov002_022cf0c4
_LIT10: .word 0x000012fa
_LIT11: .word data_ov002_022cf098
