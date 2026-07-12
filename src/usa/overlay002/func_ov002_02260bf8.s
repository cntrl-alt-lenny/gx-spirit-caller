; func_ov002_02260bf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd340
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0c6
        .extern data_ov002_022cf0c8
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern data_ov002_022d0570
        .extern func_ov002_021b3dec
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b3f74
        .extern func_ov002_021b9dd8
        .extern func_ov002_021babc8
        .extern func_ov002_021be3c0
        .extern func_ov002_021d46ac
        .extern func_ov002_021d58dc
        .extern func_ov002_021d6780
        .extern func_ov002_021de390
        .extern func_ov002_021df53c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021e2fc4
        .extern func_ov002_02266568
        .extern func_ov002_0229acd0
        .global func_ov002_02260bf8
        .arm
func_ov002_02260bf8:
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
    bne .L_4b9c
    ldr r1, _LIT3
    add r1, r1, r5
    ldrh r0, [r0, r1]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
.L_4b9c:
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
    bne .L_4c18
    ldr r2, _LIT3
    ldr r1, [sp, #0x8]
    add r1, r2, r1
    ldrh r0, [r0, r1]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0xc]
.L_4c18:
    ldr r1, _LIT5
    ldr r0, [r1, #0xd30]
    cmp r0, #0x0
    beq .L_4c34
    cmp r0, #0x1
    beq .L_58d4
    b .L_59f0
.L_4c34:
    bl func_ov002_021e2a4c
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_4d14
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
    beq .L_4d14
    ldr r2, [r4, #0x10]
    ldr r0, _LIT7
    cmp r2, r0
    ldrne r0, _LIT8
    cmpne r2, r0
    bne .L_4d14
    ldr r2, _LIT7
    mov r0, sl
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_4d14
    ldr r0, _LIT2
    ldr r3, _LIT9
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r2, r1, r0
    add r0, r3, r5
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    bne .L_4d14
    ldr r2, [r4, #0xc]
    mov r0, sl
    bl func_ov002_021df53c
    ldr r0, [r4, #0x10]
    mov r2, #0x0
    str r0, [sp]
    ldr r0, _LIT2
    str r2, [sp, #0x4]
    ldr r1, [r0, #0x1c]
    mov r0, sl
    mov r3, r2
    bl func_ov002_021d6780
.L_4d14:
    ldr r1, _LIT2
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    bne .L_4e08
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_4e08
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
    beq .L_4e08
    ldr r2, [sp, #0x14]
    ldr r6, _LIT10
    ldr r2, [r2, #0x10]
    cmp r2, r6
    bne .L_4e08
    cmp r0, #0x0
    beq .L_4e08
    ldr r6, _LIT9
    ldr r0, [sp, #0x8]
    add r0, r6, r0
    ldrh r0, [r3, r0]
    cmp r0, #0x0
    beq .L_4e08
    mov r0, r9
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_4e08
    ldr r1, _LIT2
    ldr r0, [sp, #0x14]
    ldr r1, [r1, #0x20]
    ldr r2, [r0, #0xc]
    mov r0, r9
    bl func_ov002_021df53c
    ldr r0, [sp, #0x14]
    mov r2, #0x0
    ldr r0, [r0, #0x10]
    mov r3, #0x1
    str r0, [sp]
    ldr r0, _LIT2
    str r2, [sp, #0x4]
    ldr r1, [r0, #0x20]
    mov r0, r9
    bl func_ov002_021d6780
.L_4e08:
    ldr r0, _LIT2
    ldr r2, _LIT11
    ldr r1, [r0, #0x20]
    mov r0, r9
    mov r3, #0x4
    bl func_ov002_021b3f74
    cmp r0, #0x0
    beq .L_4e40
    ldr r0, _LIT2
    ldr r3, _LIT11
    ldr r1, [r0, #0x20]
    mov r0, r9
    mov r2, #0x1
    bl func_ov002_021de390
.L_4e40:
    ldr r0, _LIT2
    ldr r2, _LIT11
    ldr r1, [r0, #0x1c]
    mov r0, sl
    mov r3, #0x4
    bl func_ov002_021b3f74
    cmp r0, #0x0
    beq .L_4e78
    ldr r0, _LIT2
    ldr r3, _LIT11
    ldr r1, [r0, #0x1c]
    mov r0, sl
    mov r2, #0x1
    bl func_ov002_021de390
.L_4e78:
    ldr r2, [r4, #0x10]
    ldr r1, _LIT12
    cmp r2, r1
    bgt .L_4f00
    bge .L_4fec
    ldr r1, _LIT13
    cmp r2, r1
    bgt .L_4ed0
    bge .L_4f64
    sub r0, r1, #0x2cc
    cmp r2, r0
    bgt .L_4eb0
    beq .L_4f64
    b .L_5190
.L_4eb0:
    sub r0, r1, #0xa
    cmp r2, r0
    bgt .L_5190
    cmp r2, #0x1700
    blt .L_5190
    cmpne r2, r0
    beq .L_4f64
    b .L_5190
.L_4ed0:
    ldr r0, _LIT14
    cmp r2, r0
    bgt .L_4ef0
    bge .L_4fec
    add r0, r1, #0x1
    cmp r2, r0
    beq .L_4f64
    b .L_5190
.L_4ef0:
    add r0, r0, #0xdc
    cmp r2, r0
    beq .L_4fec
    b .L_5190
.L_4f00:
    add r0, r1, #0x65
    cmp r2, r0
    bgt .L_4f34
    bge .L_50cc
    add r0, r1, #0x44
    cmp r2, r0
    bgt .L_4f24
    beq .L_4f64
    b .L_5190
.L_4f24:
    add r0, r1, #0x5d
    cmp r2, r0
    beq .L_4fec
    b .L_5190
.L_4f34:
    add r0, r1, #0x118
    cmp r2, r0
    bgt .L_4f54
    bge .L_5148
    add r0, r1, #0xf0
    cmp r2, r0
    beq .L_5148
    b .L_5190
.L_4f54:
    ldr r0, _LIT15
    cmp r2, r0
    beq .L_5148
    b .L_5190
.L_4f64:
    ldr r1, _LIT2
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    bne .L_5190
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_5190
    ldr r1, [r1, #0x20]
    mov r0, r9
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_5190
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
    bl func_ov002_021e2fc4
    b .L_5190
.L_4fec:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_5190
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
    beq .L_5190
    mov r0, sl
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_5190
    ldr r0, _LIT2
    ldr r3, _LIT16
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r2, r1, r0
    add r0, r3, r5
    ldr r0, [r2, r0]
    cmp r0, #0x0
    beq .L_50b8
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
    bl func_ov002_021e2fc4
    b .L_5190
.L_50b8:
    mov r2, #0x0
    mov r0, sl
    mov r3, r2
    bl func_ov002_021de390
    b .L_5190
.L_50cc:
    ldr r3, [r4, #0xc]
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    beq .L_5190
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
    bl func_ov002_021e2fc4
    b .L_5190
.L_5148:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_5190
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
    bl func_ov002_021e2fc4
.L_5190:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_53c0
    ldr r4, _LIT2
    ldr r3, _LIT17
    ldr r1, [r4, #0x1c]
    mov r0, #0x14
    mul r2, r1, r0
    add r0, r3, r5
    ldrh r5, [r2, r0]
    cmp r5, #0x0
    beq .L_53c0
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
.L_51f0:
    ldr r0, _LIT19
    add r1, r0, r5, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r5, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0xa
    bne .L_53b8
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
    beq .L_53b8
    ldr r0, [sp, #0x1c]
    cmp r2, r0
    bgt .L_52a0
    ldr r0, [sp, #0x20]
    cmp r2, r0
    bge .L_52c0
    ldr r0, _LIT20
    cmp r2, r0
    beq .L_5310
    b .L_53b8
.L_52a0:
    ldr r0, _LIT18
    cmp r2, r0
    bgt .L_52b4
    beq .L_52c0
    b .L_53b8
.L_52b4:
    ldr r0, [sp, #0x24]
    cmp r2, r0
    bne .L_53b8
.L_52c0:
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
    bl func_ov002_021e2fc4
    b .L_53b8
.L_5310:
    cmp sl, r6
    ldreq r0, [r4, #0x8]
    cmpeq r0, #0x0
    bne .L_53b8
    cmp sl, r9
    ldrne r0, [sp, #0xc]
    cmpne r0, #0x0
    beq .L_53b8
    mov r0, r9
    ldr r1, [r4, #0x20]
    bl func_ov002_021b9dd8
    cmp r0, #0x0
    beq .L_53b8
    ldr r0, [r4, #0xa8]
    cmp r0, sl
    bne .L_535c
    ldr r0, [r4, #0x9c]
    cmp r0, #0x0
    bne .L_5374
.L_535c:
    ldr r0, [r4, #0xbc]
    cmp r0, sl
    bne .L_53b8
    ldr r0, [r4, #0xb0]
    cmp r0, #0x0
    beq .L_53b8
.L_5374:
    add r0, r8, #0x30
    ldr r2, [r0, r7]
    mov r0, r6
    mov r3, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    mov r1, fp
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    ldr r0, [sp, #0x18]
    ldr r2, _LIT20
    str r0, [sp]
    ldr r1, [r4, #0x20]
    mov r0, r9
    mov r3, #0x5
    bl func_ov002_021d58dc
.L_53b8:
    cmp r5, #0x0
    bne .L_51f0
.L_53c0:
    ldr r0, _LIT21
    ldr r7, _LIT1
    ldr r5, _LIT4
    ldr r6, _LIT5
    mov r8, #0x0
    add r4, r0, #0x2a0000
    mov fp, #0xa
.L_53dc:
    ldr r2, _LIT21
    mov r0, r8
    mov r1, fp
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_544c
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
    bl func_ov002_021e2fc4
.L_544c:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_53dc
    ldr r3, _LIT2
    ldr r0, [r3, #0x8]
    cmp r0, #0x0
    bne .L_58b4
    ldr r0, [sp, #0x14]
    ldr r2, [r0, #0x10]
    ldr r0, _LIT14
    cmp r2, r0
    bgt .L_54e8
    bge .L_55d0
    ldr r1, _LIT13
    cmp r2, r1
    bgt .L_54c4
    bge .L_554c
    sub r0, r1, #0x2cc
    cmp r2, r0
    bgt .L_54a4
    beq .L_554c
    b .L_578c
.L_54a4:
    sub r0, r1, #0xa
    cmp r2, r0
    bgt .L_578c
    cmp r2, #0x1700
    blt .L_578c
    cmpne r2, r0
    beq .L_554c
    b .L_578c
.L_54c4:
    add r0, r1, #0x1
    cmp r2, r0
    bgt .L_54d8
    beq .L_554c
    b .L_578c
.L_54d8:
    add r0, r1, #0x3c
    cmp r2, r0
    beq .L_554c
    b .L_578c
.L_54e8:
    ldr r1, _LIT22
    cmp r2, r1
    bgt .L_551c
    bge .L_554c
    sub r0, r1, #0x93
    cmp r2, r0
    bgt .L_550c
    beq .L_55d0
    b .L_578c
.L_550c:
    sub r0, r1, #0x44
    cmp r2, r0
    beq .L_55d0
    b .L_578c
.L_551c:
    add r0, r1, #0x21
    cmp r2, r0
    bgt .L_553c
    bge .L_56c0
    add r0, r1, #0x19
    cmp r2, r0
    beq .L_55d0
    b .L_578c
.L_553c:
    add r0, r1, #0xac
    cmp r2, r0
    beq .L_5744
    b .L_578c
.L_554c:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_578c
    ldr r1, _LIT2
    mov r0, sl
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_578c
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
    bl func_ov002_021e2fc4
    b .L_578c
.L_55d0:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_578c
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
    beq .L_578c
    mov r0, r9
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_578c
    ldr r0, _LIT2
    ldr r3, _LIT16
    ldr r1, [r0, #0x20]
    mov r0, #0x14
    mul r2, r1, r0
    ldr r0, [sp, #0x8]
    add r0, r3, r0
    ldr r0, [r2, r0]
    cmp r0, #0x0
    beq .L_56ac
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
    bl func_ov002_021e2fc4
    b .L_578c
.L_56ac:
    mov r2, #0x0
    mov r0, r9
    mov r3, r2
    bl func_ov002_021de390
    b .L_578c
.L_56c0:
    ldr r0, [sp, #0x14]
    mov r1, #0xb
    ldr r3, [r0, #0xc]
    mov r0, r9
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    beq .L_578c
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
    bl func_ov002_021e2fc4
    b .L_578c
.L_5744:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_578c
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
    bl func_ov002_021e2fc4
.L_578c:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_58b4
    ldr r0, _LIT2
    ldr r3, _LIT17
    ldr r1, [r0, #0x20]
    mov r0, #0x14
    mul r2, r1, r0
    ldr r0, [sp, #0x8]
    add r0, r3, r0
    ldrh r6, [r2, r0]
    cmp r6, #0x0
    beq .L_58b4
    ldr r0, _LIT23
    ldr r4, _LIT1
    ldr r5, _LIT19
    ldr r8, _LIT4
    sub r7, r0, #0x60
.L_57d4:
    add r1, r5, r6, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r6, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0xa
    bne .L_58ac
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
    beq .L_58ac
    cmp r9, r7
    ldrne r0, _LIT23
    cmpne r9, r0
    bne .L_58ac
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
    bl func_ov002_021e2fc4
.L_58ac:
    cmp r6, #0x0
    bne .L_57d4
.L_58b4:
    bl func_ov002_021e2b6c
    ldr r1, _LIT5
    add sp, sp, #0x28
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_58d4:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x1e
    bl func_ov002_021d46ac
    bl func_ov002_02266568
    cmp r0, #0x0
    beq .L_5914
    ldr r1, _LIT5
    mov r0, #0xc
    str r0, [r1, #0xd2c]
    mov r0, #0x0
    str r0, [r1, #0xd30]
    str r0, [r1, #0xd34]
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5914:
    ldr r0, _LIT2
    ldr r2, _LIT24
    ldr r1, [r0, #0x1c]
    mov r0, sl
    mov r3, #0x4
    bl func_ov002_021b3f74
    cmp r0, #0x0
    beq .L_59d4
    ldr r0, _LIT2
    ldr r3, _LIT6
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r2, r1, r0
    add r0, r3, r5
    ldr r0, [r2, r0]
    mov r0, r0, lsr #0x17
    tst r0, #0x1
    bne .L_59d4
    mov r0, sl
    mov r2, #0x1
    bl func_ov002_021be3c0
    cmp r0, #0x0
    beq .L_59d4
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    ldr r2, _LIT24
    mov r0, sl
    mov r3, #0x4
    bl func_ov002_021d58dc
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
    bl func_ov002_0229acd0
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_59d4:
    ldr r1, _LIT5
    add sp, sp, #0x28
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_59f0:
    mov r0, #0x1
    str r0, [r1, #0xd2c]
    mov r0, #0x0
    str r0, [r1, #0xd30]
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd340
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cd314
_LIT3: .word data_ov002_022cf0c4
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022d008c
_LIT6: .word data_ov002_022cf0cc
_LIT7: .word 0x000014d6
_LIT8: .word 0x00001993
_LIT9: .word data_ov002_022cf0c2
_LIT10: .word 0x0000129c
_LIT11: .word 0x000018cd
_LIT12: .word 0x00001962
_LIT13: .word 0x0000170d
_LIT14: .word 0x00001837
_LIT15: .word 0x00001ab9
_LIT16: .word data_ov002_022cf0c8
_LIT17: .word data_ov002_022cf0c6
_LIT18: .word 0x00001abc
_LIT19: .word data_ov002_022d0570
_LIT20: .word 0x0000143a
_LIT21: .word 0x0000143e
_LIT22: .word 0x000019a6
_LIT23: .word 0x00001b1c
_LIT24: .word 0x000016cb
