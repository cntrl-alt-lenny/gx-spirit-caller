; func_ov002_02260ce0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd420
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1a6
        .extern data_ov002_022cf1a8
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern data_ov002_022d0650
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b3fd8
        .extern func_ov002_021b4054
        .extern func_ov002_021b9eb8
        .extern func_ov002_021baca8
        .extern func_ov002_021be4a0
        .extern func_ov002_021d479c
        .extern func_ov002_021d59cc
        .extern func_ov002_021d6870
        .extern func_ov002_021de480
        .extern func_ov002_021df62c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021e30b4
        .extern func_ov002_02266650
        .extern func_ov002_0229ade0
        .global func_ov002_02260ce0
        .arm
func_ov002_02260ce0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    ldr r2, _LIT0
    mov sl, r0
    mov r3, #0x38
    mla r4, sl, r3, r2
    and r1, sl, #0x1
    add r0, r3, #0x830
    mul r5, r1, r0
    ldr r0, _LIT1
    rsb r1, sl, #0x1
    add r7, r0, r5
    mla r2, r1, r3, r2
    ldr r6, _LIT2
    ldr r8, [r4, #0x4]
    mov r0, #0x14
    mul r0, r8, r0
    add r7, r7, #0x30
    ldr r7, [r7, r0]
    str r2, [sp, #0x14]
    mov r1, r7, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r7, lsl #0x12
    mov r1, r1, lsl #0x1
    ldr r3, [r4, #0xc]
    add r1, r1, r2, lsr #0x1f
    cmp r3, r1
    mov r1, #0x0
    ldr r9, [r6, #0x4]
    str r1, [sp, #0x10]
    bne .L_5028
    ldr r1, _LIT3
    add r1, r1, r5
    ldrh r0, [r0, r1]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
.L_5028:
    ldr r0, _LIT4
    and r1, r9, #0x1
    mul r0, r1, r0
    str r0, [sp, #0x8]
    ldr r0, [sp, #0x14]
    ldr r2, _LIT1
    ldr r3, [r0, #0x4]
    ldr r0, [sp, #0x8]
    mov r1, #0x14
    add r2, r2, r0
    mul r0, r3, r1
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    ldr r1, [sp, #0x14]
    ldr r3, [r1, #0xc]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    cmp r3, r1
    mov r1, #0x0
    str r1, [sp, #0xc]
    bne .L_50a4
    ldr r2, _LIT3
    ldr r1, [sp, #0x8]
    add r1, r2, r1
    ldrh r0, [r0, r1]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0xc]
.L_50a4:
    ldr r1, _LIT5
    ldr r0, [r1, #0xd30]
    cmp r0, #0x0
    beq .L_50c0
    cmp r0, #0x1
    beq .L_5d60
    b .L_5e7c
.L_50c0:
    bl func_ov002_021e2b3c
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_51a0
    ldr r0, _LIT2
    ldr r2, _LIT6
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r7, r1, r0
    add r0, r2, r5
    ldr r6, [r7, r0]
    ldr r0, _LIT3
    mov r2, r6, lsr #0x6
    add r3, r0, r5
    mov r0, r6, lsr #0x2
    ldrh r3, [r7, r3]
    and r2, r2, #0x1
    orr r0, r0, r6, lsr #0x1
    mvn r2, r2
    and r0, r0, #0x1
    and r2, r3, r2
    mvn r0, r0
    tst r2, r0
    beq .L_51a0
    ldr r2, [r4, #0x10]
    ldr r0, _LIT7
    cmp r2, r0
    ldrne r0, _LIT8
    cmpne r2, r0
    bne .L_51a0
    ldr r2, _LIT7
    mov r0, sl
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_51a0
    ldr r0, _LIT2
    ldr r3, _LIT9
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r2, r1, r0
    add r0, r3, r5
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    bne .L_51a0
    ldr r2, [r4, #0xc]
    mov r0, sl
    bl func_ov002_021df62c
    ldr r0, [r4, #0x10]
    mov r2, #0x0
    str r0, [sp]
    ldr r0, _LIT2
    str r2, [sp, #0x4]
    ldr r1, [r0, #0x1c]
    mov r0, sl
    mov r3, r2
    bl func_ov002_021d6870
.L_51a0:
    ldr r1, _LIT2
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    bne .L_5294
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_5294
    ldr r1, [r1, #0x20]
    mov r0, #0x14
    mul r3, r1, r0
    ldr r6, _LIT6
    ldr r0, [sp, #0x8]
    ldr r2, _LIT3
    add r0, r6, r0
    ldr r6, [r3, r0]
    ldr r0, [sp, #0x8]
    add r7, r2, r0
    mov r0, r6, lsr #0x2
    mov r2, r6, lsr #0x6
    orr r0, r0, r6, lsr #0x1
    and r6, r2, #0x1
    and r2, r0, #0x1
    ldrh r0, [r3, r7]
    mvn r6, r6
    mvn r2, r2
    and r6, r0, r6
    tst r6, r2
    beq .L_5294
    ldr r2, [sp, #0x14]
    ldr r6, _LIT10
    ldr r2, [r2, #0x10]
    cmp r2, r6
    bne .L_5294
    cmp r0, #0x0
    beq .L_5294
    ldr r6, _LIT9
    ldr r0, [sp, #0x8]
    add r0, r6, r0
    ldrh r0, [r3, r0]
    cmp r0, #0x0
    beq .L_5294
    mov r0, r9
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_5294
    ldr r1, _LIT2
    ldr r0, [sp, #0x14]
    ldr r1, [r1, #0x20]
    ldr r2, [r0, #0xc]
    mov r0, r9
    bl func_ov002_021df62c
    ldr r0, [sp, #0x14]
    mov r2, #0x0
    ldr r0, [r0, #0x10]
    mov r3, #0x1
    str r0, [sp]
    ldr r0, _LIT2
    str r2, [sp, #0x4]
    ldr r1, [r0, #0x20]
    mov r0, r9
    bl func_ov002_021d6870
.L_5294:
    ldr r0, _LIT2
    ldr r2, _LIT11
    ldr r1, [r0, #0x20]
    mov r0, r9
    mov r3, #0x4
    bl func_ov002_021b4054
    cmp r0, #0x0
    beq .L_52cc
    ldr r0, _LIT2
    ldr r3, _LIT11
    ldr r1, [r0, #0x20]
    mov r0, r9
    mov r2, #0x1
    bl func_ov002_021de480
.L_52cc:
    ldr r0, _LIT2
    ldr r2, _LIT11
    ldr r1, [r0, #0x1c]
    mov r0, sl
    mov r3, #0x4
    bl func_ov002_021b4054
    cmp r0, #0x0
    beq .L_5304
    ldr r0, _LIT2
    ldr r3, _LIT11
    ldr r1, [r0, #0x1c]
    mov r0, sl
    mov r2, #0x1
    bl func_ov002_021de480
.L_5304:
    ldr r2, [r4, #0x10]
    ldr r1, _LIT12
    cmp r2, r1
    bgt .L_538c
    bge .L_5478
    ldr r1, _LIT13
    cmp r2, r1
    bgt .L_535c
    bge .L_53f0
    sub r0, r1, #0x2cc
    cmp r2, r0
    bgt .L_533c
    beq .L_53f0
    b .L_561c
.L_533c:
    sub r0, r1, #0xa
    cmp r2, r0
    bgt .L_561c
    cmp r2, #0x1700
    blt .L_561c
    cmpne r2, r0
    beq .L_53f0
    b .L_561c
.L_535c:
    ldr r0, _LIT14
    cmp r2, r0
    bgt .L_537c
    bge .L_5478
    add r0, r1, #0x1
    cmp r2, r0
    beq .L_53f0
    b .L_561c
.L_537c:
    add r0, r0, #0xdc
    cmp r2, r0
    beq .L_5478
    b .L_561c
.L_538c:
    add r0, r1, #0x65
    cmp r2, r0
    bgt .L_53c0
    bge .L_5558
    add r0, r1, #0x44
    cmp r2, r0
    bgt .L_53b0
    beq .L_53f0
    b .L_561c
.L_53b0:
    add r0, r1, #0x5d
    cmp r2, r0
    beq .L_5478
    b .L_561c
.L_53c0:
    add r0, r1, #0x118
    cmp r2, r0
    bgt .L_53e0
    bge .L_55d4
    add r0, r1, #0xf0
    cmp r2, r0
    beq .L_55d4
    b .L_561c
.L_53e0:
    ldr r0, _LIT15
    cmp r2, r0
    beq .L_55d4
    b .L_561c
.L_53f0:
    ldr r1, _LIT2
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    bne .L_561c
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_561c
    ldr r1, [r1, #0x20]
    mov r0, r9
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_561c
    ldr r0, _LIT2
    mov r1, sl, lsl #0x1f
    ldr r2, [r0, #0x1c]
    ldr r3, [r0, #0x20]
    and r1, r1, #-2147483648
    mov r0, r2, lsl #0x10
    ldr r2, [r4, #0x10]
    ldr r6, [r4, #0xc]
    and r4, r9, #0xff
    and r3, r3, #0xff
    orr r4, r4, r3, lsl #0x8
    mov r3, r6, lsl #0x10
    mov r4, r4, lsl #0x10
    orr r6, r1, #0x200000
    and r1, r0, #0x1f0000
    mov r0, r2, lsl #0x10
    orr r1, r6, r1
    orr r0, r1, r0, lsr #0x10
    mov r1, r3, lsr #0x10
    mov r2, r4, lsr #0x10
    bl func_ov002_021e30b4
    b .L_561c
.L_5478:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_561c
    ldr r0, _LIT2
    ldr r3, _LIT6
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r6, r1, r0
    add r0, r3, r5
    ldr r7, [r6, r0]
    ldr r0, _LIT3
    mov r3, r7, lsr #0x6
    add r0, r0, r5
    ldrh r6, [r6, r0]
    mov r0, r7, lsr #0x2
    orr r0, r0, r7, lsr #0x1
    and r3, r3, #0x1
    mvn r3, r3
    and r0, r0, #0x1
    and r3, r6, r3
    mvn r0, r0
    tst r3, r0
    beq .L_561c
    mov r0, sl
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_561c
    ldr r0, _LIT2
    ldr r3, _LIT16
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r2, r1, r0
    add r0, r3, r5
    ldr r0, [r2, r0]
    cmp r0, #0x0
    beq .L_5544
    mov r0, sl, lsl #0x1f
    and r2, r0, #-2147483648
    mov r1, r1, lsl #0x10
    ldr r6, [r4, #0x10]
    ldr r0, [r4, #0xc]
    orr r3, r2, #0x200000
    and r2, r1, #0x1f0000
    mov r1, r0, lsl #0x10
    mov r0, r6, lsl #0x10
    orr r2, r3, r2
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
    b .L_561c
.L_5544:
    mov r2, #0x0
    mov r0, sl
    mov r3, r2
    bl func_ov002_021de480
    b .L_561c
.L_5558:
    ldr r3, [r4, #0xc]
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    beq .L_561c
    ldr r0, [sp, #0x10]
    ldr r6, [r4, #0x10]
    cmp r0, #0x0
    ldrne r0, _LIT2
    ldrne r1, [r0, #0x1c]
    ldr r0, [sp, #0x10]
    moveq r1, #0x10
    cmp r0, #0x0
    movne r0, sl
    ldreq r0, [r4, #0xc]
    mov r1, r1, lsl #0x10
    andeq r0, r0, #0x1
    mov r0, r0, lsl #0x1f
    and r2, r0, #-2147483648
    orr r3, r2, #0x200000
    and r2, r1, #0x1f0000
    ldr r0, [r4, #0xc]
    orr r2, r3, r2
    mov r1, r0, lsl #0x10
    mov r0, r6, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
    b .L_561c
.L_55d4:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_561c
    ldr r0, _LIT2
    mov r1, sl, lsl #0x1f
    ldr r0, [r0, #0x1c]
    and r6, r1, #-2147483648
    mov r3, r0, lsl #0x10
    ldr r1, [r4, #0xc]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r4, r6, #0x200000
    and r2, r3, #0x1f0000
    orr r2, r4, r2
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
.L_561c:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_584c
    ldr r4, _LIT2
    ldr r3, _LIT17
    ldr r1, [r4, #0x1c]
    mov r0, #0x14
    mul r2, r1, r0
    add r0, r3, r5
    ldrh r5, [r2, r0]
    cmp r5, #0x0
    beq .L_584c
    mov r0, sl, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x18]
    ldr r0, _LIT18
    add r0, r0, #0x60
    str r0, [sp, #0x24]
    ldr r0, _LIT18
    sub r0, r0, #0x1e
    str r0, [sp, #0x1c]
    ldr r0, _LIT18
    sub r0, r0, #0x1e
    str r0, [sp, #0x20]
.L_567c:
    ldr r0, _LIT19
    add r1, r0, r5, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r5, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0xa
    bne .L_5844
    ldrh r0, [r1]
    ldr r1, _LIT4
    and r6, r0, #0xff
    mov r0, r0, asr #0x8
    and fp, r0, #0xff
    mov r0, #0x14
    smulbb r7, fp, r0
    ldr r0, _LIT1
    and r2, r6, #0x1
    mla r8, r2, r1, r0
    add r3, r8, r7
    ldr r0, [r3, #0x30]
    ldr r1, [r3, #0x40]
    mov r0, r0, lsl #0x13
    mov r2, r0, lsr #0x13
    ldrh r0, [r3, #0x38]
    mov r3, r1, lsr #0x6
    and r3, r3, #0x1
    mvn r3, r3
    and r0, r0, r3
    mov r3, r1, lsr #0x2
    orr r1, r3, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_5844
    ldr r0, [sp, #0x1c]
    cmp r2, r0
    bgt .L_572c
    ldr r0, [sp, #0x20]
    cmp r2, r0
    bge .L_574c
    ldr r0, _LIT20
    cmp r2, r0
    beq .L_579c
    b .L_5844
.L_572c:
    ldr r0, _LIT18
    cmp r2, r0
    bgt .L_5740
    beq .L_574c
    b .L_5844
.L_5740:
    ldr r0, [sp, #0x24]
    cmp r2, r0
    bne .L_5844
.L_574c:
    add r0, r8, #0x30
    ldr r1, [r0, r7]
    mov r0, r2, lsl #0x10
    mov r2, r6, lsl #0x1f
    and r2, r2, #-2147483648
    orr r3, r2, #0x200000
    mov r2, fp, lsl #0x10
    and r2, r2, #0x1f0000
    orr r2, r3, r2
    orr r0, r2, r0, lsr #0x10
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
    b .L_5844
.L_579c:
    cmp sl, r6
    ldreq r0, [r4, #0x8]
    cmpeq r0, #0x0
    bne .L_5844
    cmp sl, r9
    ldrne r0, [sp, #0xc]
    cmpne r0, #0x0
    beq .L_5844
    mov r0, r9
    ldr r1, [r4, #0x20]
    bl func_ov002_021b9eb8
    cmp r0, #0x0
    beq .L_5844
    ldr r0, [r4, #0xa8]
    cmp r0, sl
    bne .L_57e8
    ldr r0, [r4, #0x9c]
    cmp r0, #0x0
    bne .L_5800
.L_57e8:
    ldr r0, [r4, #0xbc]
    cmp r0, sl
    bne .L_5844
    ldr r0, [r4, #0xb0]
    cmp r0, #0x0
    beq .L_5844
.L_5800:
    add r0, r8, #0x30
    ldr r2, [r0, r7]
    mov r0, r6
    mov r3, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    mov r1, fp
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    ldr r0, [sp, #0x18]
    ldr r2, _LIT20
    str r0, [sp]
    ldr r1, [r4, #0x20]
    mov r0, r9
    mov r3, #0x5
    bl func_ov002_021d59cc
.L_5844:
    cmp r5, #0x0
    bne .L_567c
.L_584c:
    ldr r0, _LIT21
    ldr r7, _LIT1
    ldr r5, _LIT4
    ldr r6, _LIT5
    mov r8, #0x0
    add r4, r0, #0x2a0000
    mov fp, #0xa
.L_5868:
    ldr r2, _LIT21
    mov r0, r8
    mov r1, fp
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_58d8
    and r0, r8, #0x1
    mla r1, r0, r5, r7
    ldr r0, [r6, #0xcec]
    ldr r2, [r1, #0xf8]
    cmp r8, r0
    movne r0, #0x1
    moveq r0, #0x0
    mov r0, r0, lsl #0x18
    mov r1, r8, lsl #0x1f
    and r0, r0, #0x1000000
    and r1, r1, #-2147483648
    orr r0, r1, r0
    mov r1, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r1, r2, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    orr r0, r0, r4
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
.L_58d8:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_5868
    ldr r3, _LIT2
    ldr r0, [r3, #0x8]
    cmp r0, #0x0
    bne .L_5d40
    ldr r0, [sp, #0x14]
    ldr r2, [r0, #0x10]
    ldr r0, _LIT14
    cmp r2, r0
    bgt .L_5974
    bge .L_5a5c
    ldr r1, _LIT13
    cmp r2, r1
    bgt .L_5950
    bge .L_59d8
    sub r0, r1, #0x2cc
    cmp r2, r0
    bgt .L_5930
    beq .L_59d8
    b .L_5c18
.L_5930:
    sub r0, r1, #0xa
    cmp r2, r0
    bgt .L_5c18
    cmp r2, #0x1700
    blt .L_5c18
    cmpne r2, r0
    beq .L_59d8
    b .L_5c18
.L_5950:
    add r0, r1, #0x1
    cmp r2, r0
    bgt .L_5964
    beq .L_59d8
    b .L_5c18
.L_5964:
    add r0, r1, #0x3c
    cmp r2, r0
    beq .L_59d8
    b .L_5c18
.L_5974:
    ldr r1, _LIT22
    cmp r2, r1
    bgt .L_59a8
    bge .L_59d8
    sub r0, r1, #0x93
    cmp r2, r0
    bgt .L_5998
    beq .L_5a5c
    b .L_5c18
.L_5998:
    sub r0, r1, #0x44
    cmp r2, r0
    beq .L_5a5c
    b .L_5c18
.L_59a8:
    add r0, r1, #0x21
    cmp r2, r0
    bgt .L_59c8
    bge .L_5b4c
    add r0, r1, #0x19
    cmp r2, r0
    beq .L_5a5c
    b .L_5c18
.L_59c8:
    add r0, r1, #0xac
    cmp r2, r0
    beq .L_5bd0
    b .L_5c18
.L_59d8:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_5c18
    ldr r1, _LIT2
    mov r0, sl
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_5c18
    ldr r0, _LIT2
    mov r2, r9, lsl #0x1f
    ldr r1, [r0, #0x20]
    ldr r3, [r0, #0x1c]
    and r0, r2, #-2147483648
    ldr r2, [sp, #0x14]
    mov r6, r1, lsl #0x10
    ldr r1, [sp, #0x14]
    ldr r5, [r2, #0xc]
    ldr r1, [r1, #0x10]
    and r4, sl, #0xff
    and r2, r3, #0xff
    orr r3, r4, r2, lsl #0x8
    mov r2, r5, lsl #0x10
    orr r5, r0, #0x200000
    and r4, r6, #0x1f0000
    mov r0, r1, lsl #0x10
    orr r1, r5, r4
    orr r0, r1, r0, lsr #0x10
    mov r3, r3, lsl #0x10
    mov r1, r2, lsr #0x10
    mov r2, r3, lsr #0x10
    bl func_ov002_021e30b4
    b .L_5c18
.L_5a5c:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_5c18
    ldr r0, _LIT2
    ldr r4, _LIT6
    ldr r1, [r0, #0x20]
    mov r0, #0x14
    mul r0, r1, r0
    ldr r3, [sp, #0x8]
    ldr r5, _LIT3
    add r3, r4, r3
    ldr r6, [r0, r3]
    ldr r3, [sp, #0x8]
    mov r4, r6, lsr #0x6
    add r5, r5, r3
    mov r3, r6, lsr #0x2
    and r4, r4, #0x1
    orr r3, r3, r6, lsr #0x1
    ldrh r5, [r0, r5]
    and r3, r3, #0x1
    mvn r4, r4
    mvn r0, r3
    and r3, r5, r4
    tst r3, r0
    beq .L_5c18
    mov r0, r9
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_5c18
    ldr r0, _LIT2
    ldr r3, _LIT16
    ldr r1, [r0, #0x20]
    mov r0, #0x14
    mul r2, r1, r0
    ldr r0, [sp, #0x8]
    add r0, r3, r0
    ldr r0, [r2, r0]
    cmp r0, #0x0
    beq .L_5b38
    mov r0, r9, lsl #0x1f
    and r2, r0, #-2147483648
    ldr r0, [sp, #0x14]
    mov r1, r1, lsl #0x10
    ldr r4, [r0, #0x10]
    orr r3, r2, #0x200000
    and r2, r1, #0x1f0000
    ldr r0, [r0, #0xc]
    orr r2, r3, r2
    mov r1, r0, lsl #0x10
    mov r0, r4, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
    b .L_5c18
.L_5b38:
    mov r2, #0x0
    mov r0, r9
    mov r3, r2
    bl func_ov002_021de480
    b .L_5c18
.L_5b4c:
    ldr r0, [sp, #0x14]
    mov r1, #0xb
    ldr r3, [r0, #0xc]
    mov r0, r9
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    beq .L_5c18
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    ldrne r0, _LIT2
    ldrne r1, [r0, #0x20]
    ldr r0, [sp, #0xc]
    moveq r1, #0x10
    cmp r0, #0x0
    ldreq r0, [sp, #0x14]
    mov r1, r1, lsl #0x10
    ldreq r0, [r0, #0xc]
    andeq r9, r0, #0x1
    mov r0, r9, lsl #0x1f
    and r2, r0, #-2147483648
    ldr r0, [sp, #0x14]
    orr r3, r2, #0x200000
    ldr r4, [r0, #0x10]
    and r2, r1, #0x1f0000
    ldr r0, [r0, #0xc]
    orr r2, r3, r2
    mov r1, r0, lsl #0x10
    mov r0, r4, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
    b .L_5c18
.L_5bd0:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_5c18
    ldr r0, [r3, #0x20]
    mov r1, r9, lsl #0x1f
    mov r3, r0, lsl #0x10
    ldr r0, [sp, #0x14]
    and r4, r1, #-2147483648
    ldr r1, [r0, #0xc]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r4, r4, #0x200000
    and r2, r3, #0x1f0000
    orr r2, r4, r2
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
.L_5c18:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_5d40
    ldr r0, _LIT2
    ldr r3, _LIT17
    ldr r1, [r0, #0x20]
    mov r0, #0x14
    mul r2, r1, r0
    ldr r0, [sp, #0x8]
    add r0, r3, r0
    ldrh r6, [r2, r0]
    cmp r6, #0x0
    beq .L_5d40
    ldr r0, _LIT23
    ldr r4, _LIT1
    ldr r5, _LIT19
    ldr r8, _LIT4
    sub r7, r0, #0x60
.L_5c60:
    add r1, r5, r6, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r6, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0xa
    bne .L_5d38
    ldrh r0, [r1]
    and r2, r0, #0xff
    and r1, r2, #0x1
    mla fp, r1, r8, r4
    mov r0, r0, asr #0x8
    and r3, r0, #0xff
    mov r0, #0x14
    smulbb sl, r3, r0
    add r0, fp, sl
    ldr r1, [r0, #0x40]
    ldr r9, [r0, #0x30]
    mov ip, r1, lsr #0x6
    and ip, ip, #0x1
    mov r9, r9, lsl #0x13
    ldrh r0, [r0, #0x38]
    mvn ip, ip
    mov r9, r9, lsr #0x13
    and r0, r0, ip
    mov ip, r1, lsr #0x2
    orr r1, ip, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_5d38
    cmp r9, r7
    ldrne r0, _LIT23
    cmpne r9, r0
    bne .L_5d38
    add r0, fp, #0x30
    ldr sl, [r0, sl]
    mov r1, r2, lsl #0x1f
    mov r0, sl, lsl #0x2
    mov r2, r0, lsr #0x18
    mov r0, r3, lsl #0x10
    mov r3, sl, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    and r1, r1, #-2147483648
    mov r3, r2, lsl #0x10
    orr r2, r1, #0x200000
    and r1, r0, #0x1f0000
    orr r1, r2, r1
    mov r0, r9, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    mov r2, #0x0
    mov r1, r3, lsr #0x10
    bl func_ov002_021e30b4
.L_5d38:
    cmp r6, #0x0
    bne .L_5c60
.L_5d40:
    bl func_ov002_021e2c5c
    ldr r1, _LIT5
    add sp, sp, #0x28
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5d60:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x1e
    bl func_ov002_021d479c
    bl func_ov002_02266650
    cmp r0, #0x0
    beq .L_5da0
    ldr r1, _LIT5
    mov r0, #0xc
    str r0, [r1, #0xd2c]
    mov r0, #0x0
    str r0, [r1, #0xd30]
    str r0, [r1, #0xd34]
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5da0:
    ldr r0, _LIT2
    ldr r2, _LIT24
    ldr r1, [r0, #0x1c]
    mov r0, sl
    mov r3, #0x4
    bl func_ov002_021b4054
    cmp r0, #0x0
    beq .L_5e60
    ldr r0, _LIT2
    ldr r3, _LIT6
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r2, r1, r0
    add r0, r3, r5
    ldr r0, [r2, r0]
    mov r0, r0, lsr #0x17
    tst r0, #0x1
    bne .L_5e60
    mov r0, sl
    mov r2, #0x1
    bl func_ov002_021be4a0
    cmp r0, #0x0
    beq .L_5e60
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    ldr r2, _LIT24
    mov r0, sl
    mov r3, #0x4
    bl func_ov002_021d59cc
    ldr r2, _LIT5
    mov r1, #0x2
    str r1, [r2, #0xd2c]
    mov r3, #0x0
    str r3, [r2, #0xd30]
    mov r0, #0xb
    ldr r1, _LIT2
    mov r2, #0x1
    str r2, [r1, #0x18]
    ldr r2, [r1]
    ldr r1, [r1, #0x1c]
    rsb r2, r2, #0x1
    sub r3, r0, #0xc
    bl func_ov002_0229ade0
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5e60:
    ldr r1, _LIT5
    add sp, sp, #0x28
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5e7c:
    mov r0, #0x1
    str r0, [r1, #0xd2c]
    mov r0, #0x0
    str r0, [r1, #0xd30]
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd420
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cd3f4
_LIT3: .word data_ov002_022cf1a4
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022d016c
_LIT6: .word data_ov002_022cf1ac
_LIT7: .word 0x000014d6
_LIT8: .word 0x00001993
_LIT9: .word data_ov002_022cf1a2
_LIT10: .word 0x0000129c
_LIT11: .word 0x000018cd
_LIT12: .word 0x00001962
_LIT13: .word 0x0000170d
_LIT14: .word 0x00001837
_LIT15: .word 0x00001ab9
_LIT16: .word data_ov002_022cf1a8
_LIT17: .word data_ov002_022cf1a6
_LIT18: .word 0x00001abc
_LIT19: .word data_ov002_022d0650
_LIT20: .word 0x0000143a
_LIT21: .word 0x0000143e
_LIT22: .word 0x000019a6
_LIT23: .word 0x00001b1c
_LIT24: .word 0x000016cb
