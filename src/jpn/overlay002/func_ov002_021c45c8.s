; func_ov002_021c45c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0c6
        .extern data_ov002_022cf0c8
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern data_ov002_022d0570
        .extern func_0202b89c
        .extern func_0202b8cc
        .extern func_0202f1c4
        .extern func_ov002_021b3538
        .extern func_ov002_021b8eec
        .extern func_ov002_021b9dec
        .extern func_ov002_021bbf20
        .extern func_ov002_021bd49c
        .extern func_ov002_021c2e44
        .extern func_ov002_021c4bbc
        .global func_ov002_021c45c8
        .arm
func_ov002_021c45c8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    mov sl, r0
    ldr r3, _LIT0
    and r4, sl, #0x1
    mul r7, r4, r3
    mov r9, r1
    mov r0, #0x14
    ldr r1, _LIT1
    ldr r3, _LIT2
    mul r6, r9, r0
    ldr r4, _LIT3
    add r1, r1, r7
    add r0, r4, r7
    ldr r0, [r6, r0]
    add r1, r1, r6
    add fp, r3, r7
    ldr r3, [r1, #0x30]
    mov r4, r0, lsr #0x2
    mov r1, r0, lsr #0x6
    orr r4, r4, r0, lsr #0x1
    mov r0, r3, lsl #0x13
    and r3, r4, #0x1
    and r1, r1, #0x1
    ldrh r4, [fp, r6]
    mov r0, r0, lsr #0x13
    mov r8, r2
    mvn r1, r1
    and r2, r4, r1
    mvn r1, r3
    str r0, [r8]
    and r4, r2, r1
    mov r5, #0x0
    bl func_0202b89c
    str r0, [r8, #0x1c]
    ldr r0, [r8]
    bl func_0202b8cc
    str r0, [r8, #0x20]
    ldrh r0, [fp, r6]
    cmp r0, #0x0
    addeq sp, sp, #0x2c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b9dec
    ldr r1, _LIT4
    str r0, [r8]
    cmp r0, r1
    bgt .L_148
    bge .L_308
    ldr r3, _LIT5
    cmp r0, r3
    bgt .L_110
    bge .L_270
    sub r2, r3, #0x1c4
    cmp r0, r2
    bgt .L_100
    mov r1, r2
    cmp r0, r1
    bge .L_248
    ldr r1, _LIT6
    cmp r0, r1
    beq .L_1e8
    b .L_490
.L_100:
    sub r1, r1, #0x368
    cmp r0, r1
    moveq r5, #0x1
    b .L_490
.L_110:
    sub r2, r1, #0x5b
    cmp r0, r2
    bgt .L_138
    sub r1, r1, #0x5b
    cmp r0, r1
    bge .L_2b4
    add r1, r3, #0xf9
    cmp r0, r1
    beq .L_28c
    b .L_490
.L_138:
    sub r1, r1, #0x2c
    cmp r0, r1
    beq .L_2d0
    b .L_490
.L_148:
    add r2, r1, #0xb7
    cmp r0, r2
    bgt .L_1a4
    bge .L_39c
    add r2, r1, #0x61
    cmp r0, r2
    bgt .L_194
    bge .L_348
    add r2, r1, #0x50
    cmp r0, r2
    bgt .L_490
    add r2, r1, #0x4c
    cmp r0, r2
    blt .L_490
    beq .L_324
    add r1, r1, #0x50
    cmp r0, r1
    beq .L_380
    b .L_490
.L_194:
    add r1, r1, #0x97
    cmp r0, r1
    beq .L_380
    b .L_490
.L_1a4:
    ldr r2, _LIT7
    cmp r0, r2
    bgt .L_1c4
    bge .L_448
    sub r1, r2, #0x1b
    cmp r0, r1
    beq .L_3c0
    b .L_490
.L_1c4:
    add r1, r2, #0x31
    cmp r0, r1
    bgt .L_1d8
    beq .L_3e8
    b .L_490
.L_1d8:
    add r1, r2, #0x61
    cmp r0, r1
    beq .L_420
    b .L_490
.L_1e8:
    ldr r0, _LIT8
    add r0, r0, r7
    ldr r1, [r6, r0]
    cmp r1, #0x0
    beq .L_490
    ldr r0, _LIT9
    ldr r0, [r0, #0xcf0]
    cmp r0, r1
    ldr r0, [r8, #0x1c]
    bls .L_228
    mov r0, r0, lsl #0x1
    str r0, [r8, #0x1c]
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x1
    str r0, [r8, #0x20]
    b .L_490
.L_228:
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    str r0, [r8, #0x1c]
    ldr r0, [r8, #0x20]
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    str r0, [r8, #0x20]
    b .L_490
.L_248:
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b8eec
    cmp r0, #0x0
    beq .L_490
    mov r0, #0x640
    str r0, [r8, #0x1c]
    add r0, r0, #0xc8
    str r0, [r8, #0x20]
    b .L_490
.L_270:
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b8eec
    cmp r0, #0x0
    ldrne r0, _LIT10
    strne r0, [r8, #0x20]
    b .L_490
.L_28c:
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b8eec
    cmp r0, #0x0
    beq .L_490
    ldr r1, _LIT11
    mov r0, #0x1f4
    str r1, [r8, #0x1c]
    str r0, [r8, #0x20]
    b .L_490
.L_2b4:
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b8eec
    cmp r0, #0x0
    movne r0, #0x7d0
    strne r0, [r8, #0x20]
    b .L_490
.L_2d0:
    ldr r0, _LIT8
    add r0, r0, r7
    ldr r0, [r6, r0]
    cmp r0, #0x0
    beq .L_490
    ldr r0, [r8, #0x1c]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r8, #0x1c]
    ldr r0, [r8, #0x20]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r8, #0x20]
    b .L_490
.L_308:
    ldr r0, _LIT8
    add r0, r0, r7
    ldr r0, [r6, r0]
    cmp r0, #0x0
    movne r0, #0x7d0
    strne r0, [r8, #0x1c]
    b .L_490
.L_324:
    cmp r4, #0x0
    beq .L_490
    mov r0, sl
    mov r1, #0x6
    bl func_ov002_021bd49c
    mov r1, #0x2bc
    mul r1, r0, r1
    str r1, [r8, #0x20]
    b .L_490
.L_348:
    cmp r4, #0x0
    beq .L_490
    ldr r1, _LIT12
    mov r0, sl
    bl func_ov002_021c2e44
    mov r4, r0
    ldr r1, _LIT13
    mov r0, sl
    bl func_ov002_021c2e44
    mov r1, #0x3e8
    mul r2, r0, r1
    mla r0, r4, r1, r2
    str r0, [r8, #0x1c]
    b .L_490
.L_380:
    ldr r0, _LIT8
    add r1, r0, r7
    ldr r0, [r1, r6]
    str r0, [r8, #0x1c]
    ldr r0, [r1, r6]
    str r0, [r8, #0x20]
    b .L_490
.L_39c:
    cmp r4, #0x0
    beq .L_490
    mov r0, sl
    mov r1, #0x9
    bl func_ov002_021bd49c
    mov r1, #0x3e8
    mul r1, r0, r1
    str r1, [r8, #0x1c]
    b .L_490
.L_3c0:
    ldr r0, _LIT8
    add r0, r0, r7
    ldr r0, [r6, r0]
    cmp r0, #0x0
    beq .L_490
    ldr r1, [r8, #0x1c]
    ldr r0, [r8, #0x20]
    str r0, [r8, #0x1c]
    str r1, [r8, #0x20]
    b .L_490
.L_3e8:
    cmp r4, #0x0
    beq .L_490
    ldr r1, _LIT14
    mov r0, sl
    bl func_ov002_021bbf20
    cmp r0, #0x2
    blt .L_490
    ldr r0, [r8, #0x1c]
    mov r0, r0, lsl #0x1
    str r0, [r8, #0x1c]
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x1
    str r0, [r8, #0x20]
    b .L_490
.L_420:
    ldr r1, _LIT8
    mov r0, #0x320
    add r3, r1, r7
    ldr r1, [r3, r6]
    mul r2, r1, r0
    str r2, [r8, #0x1c]
    ldr r1, [r3, r6]
    mul r0, r1, r0
    str r0, [r8, #0x20]
    b .L_490
.L_448:
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3538
    ldr r1, _LIT15
    cmp r0, r1
    beq .L_48c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    add r2, sp, #0x0
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c4bbc
    ldr r0, [sp, #0x14]
    str r0, [r8, #0x1c]
    ldr r0, [sp, #0x18]
    str r0, [r8, #0x20]
.L_48c:
    mov r5, #0x1
.L_490:
    ldr r0, _LIT16
    add r0, r0, r7
    ldrh r3, [r6, r0]
    cmp r3, #0x0
    addeq sp, sp, #0x2c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr fp, _LIT17
    ldr r0, _LIT18
    add r7, fp, #0x1f
    ldr sl, _LIT19
    ldr r9, _LIT20
    mov ip, #0xc8
    add r4, fp, #0x6
    mov r6, r7
.L_4c8:
    add r1, r0, r3, lsl #0x3
    ldrh lr, [r1, #0x2]
    mov r2, r3, lsl #0x3
    ldrh r2, [r0, r2]
    mov r3, lr, lsl #0x1c
    mov lr, r3, lsr #0x1c
    cmp lr, #0x2
    cmpne lr, #0x4
    ldrh r3, [r1, #0x6]
    cmpne lr, #0x5
    bne .L_58c
    cmp r2, fp
    bgt .L_520
    bge .L_564
    cmp r2, sl
    bgt .L_510
    beq .L_548
    b .L_58c
.L_510:
    cmp r2, r9
    ldreqh r1, [r1, #0x4]
    streq r1, [r8, #0x1c]
    b .L_58c
.L_520:
    cmp r2, r7
    bgt .L_53c
    cmp r2, r6
    bge .L_588
    cmp r2, r4
    beq .L_564
    b .L_58c
.L_53c:
    ldr r1, _LIT21
    cmp r2, r1
    bne .L_58c
.L_548:
    cmp r5, #0x0
    bne .L_58c
    ldr r2, [r8, #0x1c]
    ldr r1, [r8, #0x20]
    str r1, [r8, #0x1c]
    str r2, [r8, #0x20]
    b .L_58c
.L_564:
    add r2, r0, r3, lsl #0x3
    ldrh r1, [r2, #0x4]
    str r1, [r8, #0x1c]
    ldrh r1, [r2, #0x6]
    add r2, r0, r1, lsl #0x3
    ldrh r1, [r2, #0x4]
    str r1, [r8, #0x20]
    ldrh r3, [r2, #0x6]
    b .L_58c
.L_588:
    str ip, [r8, #0x1c]
.L_58c:
    cmp r3, #0x0
    bne .L_4c8
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022cf0cc
_LIT4: .word 0x00001864
_LIT5: .word 0x00001636
_LIT6: .word 0x0000120e
_LIT7: .word 0x000019ed
_LIT8: .word data_ov002_022cf0c8
_LIT9: .word data_ov002_022d008c
_LIT10: .word 0x00000bb8
_LIT11: .word 0x00000708
_LIT12: .word 0x00000fbe
_LIT13: .word 0x000018c5
_LIT14: .word func_0202f1c4
_LIT15: .word 0x0000ffff
_LIT16: .word data_ov002_022cf0c6
_LIT17: .word 0x00001602
_LIT18: .word data_ov002_022d0570
_LIT19: .word 0x000012cb
_LIT20: .word 0x000014b0
_LIT21: .word 0x000019f1
