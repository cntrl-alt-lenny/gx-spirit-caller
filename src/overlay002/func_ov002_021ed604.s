; func_ov002_021ed604 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern func_0202e2f8
        .extern func_0202e340
        .extern func_0202e42c
        .extern func_0202e864
        .extern func_0202eac8
        .extern func_0202f050
        .extern func_ov002_021b90a8
        .extern func_ov002_021b9ecc
        .extern func_ov002_021ba104
        .extern func_ov002_021bc8c8
        .extern func_ov002_021be4a0
        .extern func_ov002_021bff50
        .extern func_ov002_021c1e44
        .extern func_ov002_021c1ef0
        .extern func_ov002_021c8470
        .extern func_ov002_021c84e0
        .extern func_ov002_021c8940
        .global func_ov002_021ed604
        .arm
func_ov002_021ed604:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r1
    ldr r4, _LIT0
    and r5, r8, #0x1
    mov r7, r2
    mov r3, #0x14
    mul r6, r5, r4
    mov r9, r0
    mul r5, r7, r3
    ldr ip, _LIT1
    ldrh r4, [r9, #0x2]
    add r3, ip, r6
    add r3, r3, r5
    ldr ip, [r3, #0x30]
    mov r3, r4, lsl #0x1f
    mov r4, ip, lsl #0x13
    cmp r8, r3, lsr #0x1f
    mov r4, r4, lsr #0x13
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r7, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r3, _LIT2
    add r3, r3, r6
    ldrh r3, [r5, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r4, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021c1e44
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r0, [r9]
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_158
    bge .L_3b8
    ldr r3, _LIT4
    cmp r0, r3
    bgt .L_114
    bge .L_2c4
    ldr r2, _LIT5
    cmp r0, r2
    bgt .L_f0
    bge .L_258
    sub r1, r2, #0x87
    cmp r0, r1
    beq .L_220
    b .L_574
.L_f0:
    add r1, r2, #0xfb
    cmp r0, r1
    bgt .L_104
    beq .L_26c
    b .L_574
.L_104:
    sub r1, r3, #0x9c
    cmp r0, r1
    beq .L_278
    b .L_574
.L_114:
    add r1, r3, #0xc2
    cmp r0, r1
    bgt .L_134
    bge .L_2ec
    add r1, r3, #0x7
    cmp r0, r1
    beq .L_2d8
    b .L_574
.L_134:
    add r1, r3, #0x104
    cmp r0, r1
    bgt .L_148
    beq .L_314
    b .L_574
.L_148:
    sub r1, r2, #0x3e
    cmp r0, r1
    beq .L_35c
    b .L_574
.L_158:
    add r1, r2, #0xd5
    cmp r0, r1
    bgt .L_1c8
    bge .L_4ec
    add r1, r2, #0x23
    cmp r0, r1
    bgt .L_188
    bge .L_3e0
    add r1, r2, #0x9
    cmp r0, r1
    beq .L_3cc
    b .L_574
.L_188:
    add r1, r2, #0x93
    cmp r0, r1
    bgt .L_19c
    beq .L_414
    b .L_574
.L_19c:
    add r1, r2, #0x9d
    cmp r0, r1
    bgt .L_574
    add r1, r2, #0x9a
    cmp r0, r1
    blt .L_574
    beq .L_430
    add r1, r2, #0x9d
    cmp r0, r1
    beq .L_48c
    b .L_574
.L_1c8:
    ldr r3, _LIT6
    cmp r0, r3
    bgt .L_1fc
    bge .L_534
    sub r1, r3, #0x81
    cmp r0, r1
    bgt .L_1ec
    beq .L_50c
    b .L_574
.L_1ec:
    sub r1, r3, #0x31
    cmp r0, r1
    beq .L_520
    b .L_574
.L_1fc:
    add r1, r3, #0x56
    cmp r0, r1
    bgt .L_210
    beq .L_54c
    b .L_574
.L_210:
    add r1, r3, #0xdf
    cmp r0, r1
    beq .L_560
    b .L_574
.L_220:
    mov r0, r8
    mov r1, r7
    sub r2, r2, #0x540
    bl func_ov002_021ba104
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8940
    cmp r0, #0x13
    bne .L_574
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_258:
    mov r0, r8
    mov r1, r7
    sub r2, r2, #0xe8
    bl func_ov002_021ba104
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_26c:
    mov r0, r4
    bl func_0202e340
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_278:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8940
    cmp r0, #0x12
    bne .L_2bc
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c84e0
    cmp r0, #0x7
    blt .L_2bc
    mov r0, r8
    mov r1, r7
    mov r2, #0x1
    bl func_ov002_021be4a0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2bc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2c4:
    mov r0, r8
    mov r1, r7
    sub r2, r3, #0xa
    bl func_ov002_021ba104
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2d8:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b9ecc
    bl func_0202e42c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2ec:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8940
    cmp r0, #0x7
    cmpne r0, #0xf
    bne .L_30c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_30c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_314:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b90a8
    cmp r0, #0x0
    beq .L_354
    mov r0, r4
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_354
    mov r0, r8
    mov r1, r8
    mov r2, r7
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_354:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_35c:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b90a8
    cmp r0, #0x0
    beq .L_3b0
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c84e0
    cmp r0, #0x2
    bgt .L_3b0
    mov r0, r4
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_3b0
    mov r0, r8
    mov r1, r8
    mov r2, r7
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_3b0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_3b8:
    ldr r2, _LIT7
    mov r0, r8
    mov r1, r7
    bl func_ov002_021ba104
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_3cc:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b9ecc
    bl func_0202e864
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_3e0:
    ldr r0, _LIT8
    add r0, r0, r6
    ldrh r0, [r5, r0]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8940
    cmp r0, #0x12
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_414:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8940
    cmp r0, #0xb
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_430:
    ldr r0, _LIT1
    mov r1, #0x0
    add r3, r0, r6
    add r2, r3, #0x30
.L_440:
    cmp r1, r7
    beq .L_470
    ldr r0, [r2]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r3, #0x38]
    cmpne r0, #0x0
    beq .L_470
    ldrh r0, [r3, #0x36]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_470:
    add r1, r1, #0x1
    cmp r1, #0x4
    add r2, r2, #0x14
    add r3, r3, #0x14
    ble .L_440
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_48c:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021bff50
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r0, [r9, #0x4]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8940
    cmp r0, #0x2
    bne .L_4e4
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8470
    cmp r0, #0x7d0
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_4e4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_4ec:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c84e0
    ldrh r1, [r9, #0xc]
    cmp r0, r1
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_50c:
    mov r0, r8
    mov r1, r7
    add r2, r2, #0xb0
    bl func_ov002_021ba104
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_520:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b9ecc
    bl func_0202eac8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_534:
    mov r0, r4
    bl func_0202e2f8
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_54c:
    mov r0, r8
    mov r1, r7
    add r2, r3, #0x40
    bl func_ov002_021ba104
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_560:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b9ecc
    bl func_0202f050
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_574:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word 0x000017f6
_LIT4: .word 0x0000169b
_LIT5: .word 0x000014fc
_LIT6: .word 0x000019dc
_LIT7: .word 0x00000ff8
_LIT8: .word data_ov002_022cf1a2
