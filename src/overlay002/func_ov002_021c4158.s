; func_ov002_021c4158 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022d016c
        .extern func_0202f050
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bbc58
        .extern func_ov002_021bd5f4
        .global func_ov002_021c4158
        .arm
func_ov002_021c4158:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    mov r9, r1
    mov sl, r0
    str r2, [sp]
    mov r0, r9
    mov r1, r2
    mov r8, r3
    bl func_ov002_021b9ecc
    mov r4, r0
    ldr r0, [sp]
    mov r5, #0x0
    str r5, [sp, #0x4]
    cmp r0, #0x4
    bgt .L_384
    ldr r1, _LIT0
    cmp r4, r1
    bgt .L_cc
    bge .L_1cc
    sub r0, r1, #0x1a4
    cmp r4, r0
    bgt .L_9c
    bge .L_184
    ldr r1, _LIT1
    cmp r4, r1
    bgt .L_70
    beq .L_13c
    b .L_384
.L_70:
    add r0, r1, #0x23
    cmp r4, r0
    bgt .L_384
    add r0, r1, #0x20
    cmp r4, r0
    blt .L_384
    beq .L_16c
    add r0, r1, #0x23
    cmp r4, r0
    beq .L_19c
    b .L_384
.L_9c:
    ldr r0, _LIT2
    cmp r4, r0
    bgt .L_bc
    bge .L_154
    sub r0, r0, #0x13
    cmp r4, r0
    beq .L_1b4
    b .L_384
.L_bc:
    sub r0, r1, #0x7
    cmp r4, r0
    beq .L_20c
    b .L_384
.L_cc:
    ldr r0, _LIT3
    cmp r4, r0
    bgt .L_10c
    bge .L_280
    ldr r1, _LIT4
    cmp r4, r1
    bgt .L_fc
    bge .L_244
    sub r0, r1, #0x228
    cmp r4, r0
    beq .L_220
    b .L_384
.L_fc:
    sub r0, r0, #0x8
    cmp r4, r0
    beq .L_25c
    b .L_384
.L_10c:
    add r1, r0, #0x85
    cmp r4, r1
    bgt .L_12c
    bge .L_2b4
    add r0, r0, #0x34
    cmp r4, r0
    beq .L_290
    b .L_384
.L_12c:
    add r1, r0, #0xf2
    cmp r4, r1
    beq .L_2e8
    b .L_384
.L_13c:
    ldr r0, [sl, #0xc]
    tst r0, #0x2
    addne r5, r5, #0x1f4
    tst r0, #0x4
    subne r5, r5, #0x190
    b .L_384
.L_154:
    ldr r0, [sl, #0xc]
    tst r0, #0x4
    addne r5, r5, #0x1f4
    tst r0, #0x2
    subne r5, r5, #0x190
    b .L_384
.L_16c:
    ldr r0, [sl, #0xc]
    tst r0, #0x8
    addne r5, r5, #0x1f4
    tst r0, #0x10
    subne r5, r5, #0x190
    b .L_384
.L_184:
    ldr r0, [sl, #0xc]
    tst r0, #0x10
    addne r5, r5, #0x1f4
    tst r0, #0x8
    subne r5, r5, #0x190
    b .L_384
.L_19c:
    ldr r0, [sl, #0xc]
    tst r0, #0x20
    addne r5, r5, #0x1f4
    tst r0, #0x40
    subne r5, r5, #0x190
    b .L_384
.L_1b4:
    ldr r0, [sl, #0xc]
    tst r0, #0x40
    addne r5, r5, #0x1f4
    tst r0, #0x20
    subne r5, r5, #0x190
    b .L_384
.L_1cc:
    ldr r0, [sl, #0x4]
    cmp r0, #0xd
    cmpeq r8, r9
    bne .L_384
    ldr r1, _LIT5
    ldr r3, _LIT6
    ldr r0, [sp]
    mov r2, #0x14
    and r6, r9, #0x1
    mul r2, r0, r2
    mla r0, r6, r1, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    addne r5, r5, #0x1f4
    strne r5, [sp, #0x4]
    b .L_384
.L_20c:
    ldr r0, [sl, #0x4]
    cmp r0, #0xf
    cmpeq r8, r9
    addeq r5, r5, #0x190
    b .L_384
.L_220:
    cmp r9, r8
    beq .L_384
    ldr r0, _LIT7
    ldr r1, [r0, #0xcec]
    cmp r8, r1
    ldreq r0, [r0, #0xcf8]
    cmpeq r0, #0x3
    subeq r5, r5, #0x12c
    b .L_384
.L_244:
    cmp r9, r8
    bne .L_384
    ldr r0, [sl, #0xc]
    tst r0, #0x8
    addne r5, r5, #0xc8
    b .L_384
.L_25c:
    cmp r9, r8
    beq .L_384
    ldr r1, [sp]
    mov r0, r9
    mov r2, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    subne r5, r5, #0x12c
    b .L_384
.L_280:
    ldr r0, [sl, #0xc]
    tst r0, #0x40
    addne r5, r5, #0x12c
    b .L_384
.L_290:
    cmp r9, r8
    beq .L_384
    ldr r1, [sp]
    mov r0, r9
    mov r2, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    subne r5, r5, #0x1f4
    b .L_384
.L_2b4:
    cmp r9, r8
    beq .L_384
    ldr r1, [sp]
    mov r0, r9
    mov r2, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_384
    ldr r0, [sp, #0x4]
    sub r5, r5, #0x2bc
    sub r0, r0, #0x2bc
    str r0, [sp, #0x4]
    b .L_384
.L_2e8:
    cmp r9, r8
    ldreq r1, [sl, #0x4]
    cmpeq r1, #0x7
    bne .L_384
    ldr r3, _LIT8
    ldr r1, _LIT5
    and r2, r8, #0x1
    mla r7, r2, r1, r3
    add r1, sp, #0x8
    mov r6, r5
    str r5, [r1]
    str r5, [r1, #0x4]
    add fp, r0, #0xf2
.L_31c:
    mov r0, r8
    mov r1, r6
    bl func_ov002_021b9ecc
    cmp r0, fp
    bne .L_354
    ldrh r0, [r7, #0x38]
    cmp r0, #0x0
    beq .L_354
    ldrh r2, [r7, #0x36]
    add r0, sp, #0x8
    ldr r0, [r0, r2, lsl #0x2]
    add r1, r0, #0x1
    add r0, sp, #0x8
    str r1, [r0, r2, lsl #0x2]
.L_354:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r7, r7, #0x14
    ble .L_31c
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    ldr r0, [sp, #0x8]
    addeq r5, r5, #0x1f4
    cmp r0, #0x0
    ldreq r0, [sp, #0x4]
    addeq r0, r0, #0x1f4
    streq r0, [sp, #0x4]
.L_384:
    ldr r0, [sp]
    cmp r0, #0x5
    blt .L_4a4
    cmp r8, r9
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [sl, #0x24]
    add r0, r0, #0x1
    and r0, r1, r0
    cmp r0, #0x0
    bgt .L_4a4
    ldr r1, _LIT9
    cmp r4, r1
    bgt .L_3e4
    bge .L_418
    sub r0, r1, #0xd9
    cmp r4, r0
    bgt .L_3d4
    beq .L_408
    b .L_4a4
.L_3d4:
    sub r0, r1, #0xa6
    cmp r4, r0
    beq .L_454
    b .L_4a4
.L_3e4:
    add r0, r1, #0xd3
    cmp r4, r0
    bgt .L_3f8
    beq .L_46c
    b .L_4a4
.L_3f8:
    ldr r0, _LIT10
    cmp r4, r0
    beq .L_48c
    b .L_4a4
.L_408:
    ldr r0, [sl, #0xc]
    tst r0, #0x8
    subne r5, r5, #0x1f4
    b .L_4a4
.L_418:
    ldr r0, [sl, #0x4]
    cmp r0, #0xf
    cmpeq r8, r9
    bne .L_4a4
    mov r0, r8
    mov r1, #0xf
    bl func_ov002_021bbc58
    mov r1, #0xc8
    mla r5, r0, r1, r5
    mov r0, r8
    mov r1, #0x12
    bl func_ov002_021bbc58
    mov r1, #0xc8
    mla r5, r0, r1, r5
    b .L_4a4
.L_454:
    cmp r8, r9
    bne .L_4a4
    ldr r0, [sp, #0x4]
    add r0, r0, #0x12c
    str r0, [sp, #0x4]
    b .L_4a4
.L_46c:
    cmp r8, r9
    ldreq r0, _LIT7
    ldreq r1, [r0, #0xcec]
    cmpeq r8, r1
    ldreq r0, [r0, #0xcf8]
    cmpeq r0, #0x3
    addeq r5, r5, #0xc8
    b .L_4a4
.L_48c:
    ldr r1, [sp, #0x38]
    mov r0, r8
    bl func_ov002_021b9ecc
    bl func_0202f050
    cmp r0, #0x0
    addne r5, r5, #0x12c
.L_4a4:
    ldr r0, [sp]
    cmp r0, #0x5
    blt .L_500
    cmp r8, r9
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [sl, #0x28]
    add r0, r0, #0x1
    and r0, r1, r0
    cmp r0, #0x0
    bgt .L_500
    ldr r0, _LIT11
    cmp r4, r0
    bne .L_500
    ldr r1, [sp, #0x38]
    mov r0, r8
    bl func_ov002_021bd5f4
    cmp r0, #0x0
    beq .L_500
    ldr r0, [sp, #0x4]
    add r5, r5, #0x1f4
    add r0, r0, #0x1f4
    str r0, [sp, #0x4]
.L_500:
    ldr r0, [sp, #0x4]
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, r5, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000013a0
_LIT1: .word 0x00001192
_LIT2: .word 0x0000121a
_LIT3: .word 0x0000182a
_LIT4: .word 0x000016ab
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022cf1a2
_LIT7: .word data_ov002_022d016c
_LIT8: .word data_ov002_022cf16c
_LIT9: .word 0x000014cf
_LIT10: .word 0x000019b2
_LIT11: .word 0x0000138e
