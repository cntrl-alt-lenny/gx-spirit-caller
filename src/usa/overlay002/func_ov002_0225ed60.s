; func_ov002_0225ed60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd340
        .extern data_ov002_022cd3d8
        .extern data_ov002_022cd3ec
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d008c
        .extern data_ov002_022d0570
        .extern func_0202e1e0
        .extern func_0202e2a4
        .extern func_ov002_021b3dec
        .extern func_ov002_021b3e2c
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b9af4
        .extern func_ov002_021bacd0
        .extern func_ov002_021baf88
        .extern func_ov002_021bb82c
        .extern func_ov002_021bd77c
        .extern func_ov002_021ca4dc
        .extern func_ov002_021d58dc
        .extern func_ov002_021d9054
        .extern func_ov002_021de390
        .extern func_ov002_021dec9c
        .extern func_ov002_021deda4
        .extern func_ov002_021df53c
        .extern func_ov002_021df5e4
        .extern func_ov002_021e267c
        .extern func_ov002_021e277c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021e2fc4
        .extern func_ov002_02254fd0
        .global func_ov002_0225ed60
        .arm
func_ov002_0225ed60:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xa0
    ldr r5, _LIT0
    mov r4, r0
    mov r2, #0x38
    rsb r0, r4, #0x1
    str r0, [sp, #0x14]
    mla r6, r4, r2, r5
    ldr r1, [sp, #0x14]
    ldr r0, [r6, #0x2c]
    mla r7, r1, r2, r5
    ldr r3, _LIT1
    cmp r0, #0x0
    ldr r5, [r3, #0x4]
    ldrne sl, _LIT2
    bne .L_2cd0
    ldr r8, _LIT3
    and r3, r4, #0x1
    add r1, r2, #0x830
    mla r1, r3, r1, r8
    ldr r2, [r6, #0x4]
    add r3, r1, #0x30
    mov r1, #0x14
    mla sl, r2, r1, r3
.L_2cd0:
    ldr r1, [r7, #0x2c]
    cmp r1, #0x0
    ldrne r2, _LIT4
    strne r2, [sp, #0x4]
    bne .L_2d08
    ldr r8, _LIT3
    ldr r2, _LIT5
    and r3, r5, #0x1
    mla r2, r3, r2, r8
    add r8, r2, #0x30
    ldr r3, [r7, #0x4]
    mov r2, #0x14
    mla r2, r3, r2, r8
    str r2, [sp, #0x4]
.L_2d08:
    ldr r2, [r6, #0x30]
    mov r8, #0x0
    cmp r2, #0x0
    bne .L_2d34
    cmp r0, #0x0
    beq .L_2d34
    ldr r0, _LIT1
    ldr r0, [r0, #0xc4]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    movne r8, #0x1
.L_2d34:
    ldr r2, [r7, #0x30]
    mov r0, #0x0
    str r0, [sp, #0x24]
    cmp r2, #0x0
    bne .L_2d68
    cmp r1, #0x0
    beq .L_2d68
    ldr r0, _LIT1
    ldr r0, [r0, #0xd8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    movne r0, #0x1
    strne r0, [sp, #0x24]
.L_2d68:
    ldr r0, _LIT5
    and r1, r4, #0x1
    mul r0, r1, r0
    ldr r2, _LIT3
    ldr r3, [r6, #0x4]
    mov r1, #0x14
    str r0, [sp, #0x18]
    add r2, r2, r0
    mul r0, r3, r1
    add r1, r2, #0x30
    ldr r3, [r1, r0]
    ldr r1, [r6, #0xc]
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp r1, r2
    mov r2, #0x0
    str r2, [sp, #0x20]
    bne .L_2dd8
    ldr r3, _LIT6
    ldr r2, [sp, #0x18]
    add r2, r3, r2
    ldrh r0, [r0, r2]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x20]
.L_2dd8:
    ldr r0, _LIT5
    and r2, r5, #0x1
    mul r9, r2, r0
    mov r0, #0x0
    ldr r2, _LIT3
    str r0, [sp, #0x1c]
    add r0, r2, r9
    add r2, r0, #0x30
    ldr fp, [r7, #0x4]
    mov r0, #0x14
    mul r3, fp, r0
    ldr fp, [r2, r3]
    ldr r2, [r7, #0xc]
    mov r0, fp, lsl #0x12
    mov fp, fp, lsl #0x2
    mov fp, fp, lsr #0x18
    mov fp, fp, lsl #0x1
    add r0, fp, r0, lsr #0x1f
    cmp r2, r0
    bne .L_2e40
    ldr r0, _LIT6
    add r0, r0, r9
    ldrh r0, [r3, r0]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x1c]
.L_2e40:
    ldr r0, _LIT1
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    addne sp, sp, #0xa0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT7
    ldr r0, [r0, #0xd30]
    cmp r0, #0x0
    beq .L_2e7c
    cmp r0, #0x1
    beq .L_2f58
    cmp r0, #0x2
    beq .L_3674
    b .L_4ad0
.L_2e7c:
    mov r0, r6
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_2edc
    ldr r2, [r6, #0x10]
    ldr r1, _LIT8
    cmp r2, r1
    beq .L_2eac
    add r0, r1, #0xd6
    cmp r2, r0
    beq .L_2ec4
    b .L_2edc
.L_2eac:
    mov r0, r4
    bl func_ov002_02254fd0
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r6, #0x30]
    b .L_2edc
.L_2ec4:
    mov r0, r4
    add r1, r1, #0xcb
    bl func_ov002_021bb82c
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [r6, #0x30]
.L_2edc:
    mov r0, r7
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_2f3c
    ldr r2, [r7, #0x10]
    ldr r1, _LIT8
    cmp r2, r1
    beq .L_2f0c
    add r0, r1, #0xd6
    cmp r2, r0
    beq .L_2f24
    b .L_2f3c
.L_2f0c:
    mov r0, r5
    bl func_ov002_02254fd0
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r7, #0x30]
    b .L_2f3c
.L_2f24:
    mov r0, r5
    add r1, r1, #0xcb
    bl func_ov002_021bb82c
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [r7, #0x30]
.L_2f3c:
    ldr r1, _LIT7
    add sp, sp, #0xa0
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2f58:
    cmp r8, #0x0
    beq .L_2fc0
    ldr r0, [r6, #0x10]
    bl func_ov002_021bd77c
    cmp r0, #0x0
    bne .L_2fc0
    ldr r0, _LIT7
    ldr r3, [r6, #0xc]
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT9
    mov r1, #0xb
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_2fc0
    ldr r1, [r6, #0x10]
    ldr r0, _LIT10
    cmp r1, r0
    bne .L_2fc0
    ldr r0, [r6, #0xc]
    mov r1, r1, lsl #0x10
    mov r2, r0, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e267c
.L_2fc0:
    cmp r8, #0x0
    beq .L_32c8
    ldr r0, [r7, #0x10]
    ldr r2, _LIT11
    cmp r0, r2
    bgt .L_300c
    bge .L_3144
    ldr r1, _LIT12
    cmp r0, r1
    bgt .L_2ffc
    bge .L_30b4
    sub r1, r1, #0x6
    cmp r0, r1
    beq .L_3080
    b .L_32c8
.L_2ffc:
    sub r1, r2, #0x68
    cmp r0, r1
    beq .L_3100
    b .L_32c8
.L_300c:
    ldr r2, _LIT13
    cmp r0, r2
    bgt .L_305c
    sub r1, r2, #0x8
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_304c
    b .L_31e4
    b .L_31e4
    b .L_32c8
    b .L_32c8
    b .L_32c8
    b .L_31e4
    b .L_31e4
    b .L_32c8
    b .L_31e4
.L_304c:
    ldr r1, _LIT14
    cmp r0, r1
    beq .L_31a0
    b .L_32c8
.L_305c:
    ldr r1, _LIT15
    cmp r0, r1
    bgt .L_3070
    beq .L_3214
    b .L_32c8
.L_3070:
    add r1, r1, #0x1
    cmp r0, r1
    beq .L_326c
    b .L_32c8
.L_3080:
    ldr r1, [sp, #0x1c]
    cmp r1, #0x0
    beq .L_32c8
    mov r2, #0x0
    ldr r1, _LIT1
    str r2, [sp]
    mov r2, r0, lsl #0x10
    ldr r1, [r1, #0x20]
    mov r0, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x1
    bl func_ov002_021d58dc
    b .L_32c8
.L_30b4:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_32c8
    ldr r0, [r6, #0x10]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_32c8
    ldr r0, [r6, #0xc]
    ldr r1, _LIT1
    add r0, r5, r0, lsl #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldr r1, [r1, #0x20]
    ldr r2, _LIT12
    mov r0, r5
    mov r3, #0x2
    bl func_ov002_021d58dc
    b .L_32c8
.L_3100:
    mov r0, r7
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_32c8
    ldr r2, [sl]
    ldr r1, _LIT16
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    mov r2, r0, lsl #0x10
    mov r0, r5
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e267c
    b .L_32c8
.L_3144:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_32c8
    mov r0, r7
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_32c8
    ldr r0, _LIT1
    ldr r2, [r7, #0xc]
    ldr r1, [r0, #0x20]
    mov r0, r5
    bl func_ov002_021df53c
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r7, #0x10]
    ldr r0, _LIT1
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x20]
    mov r0, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x3
    bl func_ov002_021d58dc
    b .L_32c8
.L_31a0:
    ldr r1, _LIT1
    mov r0, r5
    ldr r1, [r1, #0x20]
    bl func_ov002_021b9af4
    cmp r0, #0x2
    bge .L_32c8
    ldr r0, _LIT1
    ldr r2, [r7, #0xc]
    ldr r1, [r0, #0x20]
    mov r0, r5
    bl func_ov002_021df53c
    ldr r1, _LIT1
    mov r0, r5
    ldr r1, [r1, #0x20]
    mov r2, #0x1
    bl func_ov002_021d9054
    b .L_32c8
.L_31e4:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_32c8
    mov r1, #0x0
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, #0x20]
    mov r0, r5
    sub r2, r2, #0x8
    mov r3, #0x2
    bl func_ov002_021d58dc
    b .L_32c8
.L_3214:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_32c8
    ldr r0, _LIT7
    mov r1, #0x0
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT17
    cmp r0, r5
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x1
    and r0, r0, #0xff
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x2
    mov r3, r0, lsl #0x10
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, #0x20]
    mov r0, r5
    mov r3, r3, lsr #0x10
    bl func_ov002_021d58dc
    b .L_32c8
.L_326c:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    ldrne r0, [r6, #0x34]
    cmpne r0, #0x0
    beq .L_32c8
    ldr r0, _LIT7
    mov r1, #0x0
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT17
    cmp r0, r5
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x1
    and r0, r0, #0xff
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x2
    mov r3, r0, lsl #0x10
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, #0x20]
    mov r0, r5
    mov r3, r3, lsr #0x10
    bl func_ov002_021d58dc
.L_32c8:
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    beq .L_3348
    ldr r0, [r7, #0x10]
    ldr r1, [r7, #0xc]
    bl func_ov002_021bd77c
    cmp r0, #0x0
    bne .L_3348
    ldr r0, _LIT7
    ldr r3, [r7, #0xc]
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT9
    mov r1, #0xb
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_3348
    ldr r1, [r7, #0x10]
    ldr r0, _LIT10
    cmp r1, r0
    bne .L_3348
    ldr r0, _LIT1
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    bne .L_3348
    ldr r0, [r7, #0xc]
    mov r1, r1, lsl #0x10
    mov r2, r0, lsl #0x10
    mov r0, r5
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e267c
.L_3348:
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    beq .L_3658
    ldr r0, [r6, #0x10]
    ldr r2, _LIT11
    cmp r0, r2
    bgt .L_3398
    bge .L_34d4
    ldr r1, _LIT12
    cmp r0, r1
    bgt .L_3388
    bge .L_3440
    sub r1, r1, #0x6
    cmp r0, r1
    beq .L_340c
    b .L_3658
.L_3388:
    sub r1, r2, #0x68
    cmp r0, r1
    beq .L_348c
    b .L_3658
.L_3398:
    ldr r2, _LIT13
    cmp r0, r2
    bgt .L_33e8
    sub r1, r2, #0x8
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_33d8
    b .L_3574
    b .L_3574
    b .L_3658
    b .L_3658
    b .L_3658
    b .L_3574
    b .L_3574
    b .L_3658
    b .L_3574
.L_33d8:
    ldr r1, _LIT14
    cmp r0, r1
    beq .L_3530
    b .L_3658
.L_33e8:
    ldr r1, _LIT15
    cmp r0, r1
    bgt .L_33fc
    beq .L_35a4
    b .L_3658
.L_33fc:
    add r1, r1, #0x1
    cmp r0, r1
    beq .L_35fc
    b .L_3658
.L_340c:
    ldr r1, [sp, #0x20]
    cmp r1, #0x0
    beq .L_3658
    mov r2, #0x0
    ldr r1, _LIT1
    str r2, [sp]
    mov r2, r0, lsl #0x10
    ldr r1, [r1, #0x1c]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x1
    bl func_ov002_021d58dc
    b .L_3658
.L_3440:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_3658
    ldr r0, [r7, #0x10]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_3658
    ldr r0, [r7, #0xc]
    ldr r1, _LIT1
    add r0, r4, r0, lsl #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldr r1, [r1, #0x1c]
    ldr r2, _LIT12
    mov r0, r4
    mov r3, #0x2
    bl func_ov002_021d58dc
    b .L_3658
.L_348c:
    mov r0, r6
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_3658
    ldr r0, [sp, #0x4]
    ldr r1, _LIT16
    ldr r2, [r0]
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    mov r2, r0, lsl #0x10
    mov r3, r2, lsr #0x10
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_021e267c
    b .L_3658
.L_34d4:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_3658
    mov r0, r6
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_3658
    ldr r0, _LIT1
    ldr r2, [r6, #0xc]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021df53c
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r6, #0x10]
    ldr r0, _LIT1
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x3
    bl func_ov002_021d58dc
    b .L_3658
.L_3530:
    ldr r1, _LIT1
    mov r0, r4
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b9af4
    cmp r0, #0x2
    bge .L_3658
    ldr r0, _LIT1
    ldr r2, [r6, #0xc]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021df53c
    ldr r1, _LIT1
    mov r0, r4
    ldr r1, [r1, #0x1c]
    mov r2, #0x1
    bl func_ov002_021d9054
    b .L_3658
.L_3574:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_3658
    mov r1, #0x0
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    sub r2, r2, #0x8
    mov r3, #0x2
    bl func_ov002_021d58dc
    b .L_3658
.L_35a4:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_3658
    ldr r0, _LIT7
    mov r1, #0x0
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT17
    cmp r0, r4
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x1
    and r0, r0, #0xff
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x2
    mov r3, r0, lsl #0x10
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r3, r3, lsr #0x10
    bl func_ov002_021d58dc
    b .L_3658
.L_35fc:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    ldrne r0, [r7, #0x34]
    cmpne r0, #0x0
    beq .L_3658
    ldr r0, _LIT7
    mov r1, #0x0
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT17
    cmp r0, r4
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x1
    and r0, r0, #0xff
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x2
    mov r3, r0, lsl #0x10
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r3, r3, lsr #0x10
    bl func_ov002_021d58dc
.L_3658:
    ldr r1, _LIT7
    add sp, sp, #0xa0
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3674:
    bl func_ov002_021e2a4c
    ldr r1, [r6, #0x30]
    mov r0, #0x0
    str r0, [sp, #0x2c]
    cmp r1, #0x0
    beq .L_36fc
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    beq .L_36e4
    ldr r1, [sp, #0x2c]
    add r0, sp, #0x88
    str r1, [r0]
    ldrh r3, [sp, #0x8a]
    mov r2, r4, lsl #0x10
    mov r1, r2, lsr #0x10
    and r1, r1, #0x1
    bic r2, r3, #0x1
    orr r2, r2, r1
    ldr r1, [sp, #0x2c]
    strh r2, [sp, #0x8a]
    mov r2, r1
    str r2, [r0, #0x4]
    str r2, [r0, #0x8]
    str r2, [r0, #0xc]
    str r2, [r0, #0x10]
    str r2, [r0, #0x14]
    bl func_ov002_021deda4
    b .L_3f14
.L_36e4:
    ldr r2, [sp, #0x2c]
    ldr r1, [r6, #0x4]
    mov r0, r4
    mov r3, r2
    bl func_ov002_021de390
    b .L_3f14
.L_36fc:
    cmp r8, #0x0
    beq .L_3f14
    add r3, sp, #0x6c
    sub r1, r0, #0x200
    str r0, [r3]
    and r3, r0, r1
    ldr r2, [r6, #0xc]
    ldr r0, _LIT18
    mov r1, r5, lsl #0x1f
    and r0, r2, r0
    orr r0, r3, r0
    bic r0, r0, #0x40000
    orr r0, r0, r1, lsr #0xd
    bic r1, r0, #0x200
    mov r0, r4, lsl #0x1f
    orr r0, r1, r0, lsr #0x16
    ldr r1, [r6, #0x4]
    bic r2, r0, #0x3c00
    mov r1, r1, lsl #0x1c
    ldr r0, [r6, #0x8]
    orr r1, r2, r1, lsr #0x12
    orr r1, r1, #0x20000
    bic r1, r1, #0x4000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x11
    orr r0, r0, #0x18000
    bic r0, r0, #0x780000
    orr r0, r0, #0x700000
    str r0, [sp, #0x6c]
    ldr r0, [r6, #0x10]
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_37b0
    ldr r1, [r6, #0x10]
    ldr r0, _LIT19
    cmp r1, r0
    bne .L_37a0
    mov r0, r6
    bl func_ov002_021bacd0
    cmp r0, #0x0
    bne .L_37b0
.L_37a0:
    ldr r0, [r6, #0xc]
    bl func_ov002_021ca4dc
    cmp r0, #0x0
    bne .L_37c0
.L_37b0:
    ldr r0, [sp, #0x6c]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x6c]
.L_37c0:
    mov r0, r7
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_38cc
    ldr r2, [r7, #0x10]
    ldr r0, _LIT20
    cmp r2, r0
    bgt .L_3808
    bge .L_386c
    ldr r0, _LIT21
    cmp r2, r0
    bgt .L_37f8
    beq .L_384c
    b .L_38cc
.L_37f8:
    add r0, r0, #0x3d
    cmp r2, r0
    beq .L_384c
    b .L_38cc
.L_3808:
    ldr r0, _LIT22
    cmp r2, r0
    bgt .L_3828
    bge .L_386c
    ldr r0, _LIT19
    cmp r2, r0
    beq .L_3838
    b .L_38cc
.L_3828:
    add r0, r0, #0x1f8
    cmp r2, r0
    beq .L_3898
    b .L_38cc
.L_3838:
    ldr r0, [sp, #0x6c]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x6c]
    b .L_38cc
.L_384c:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_38cc
    ldr r0, [sp, #0x6c]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x6c]
    b .L_38cc
.L_386c:
    mov r0, r5
    mov r1, #0xb
    ldr r3, [r7, #0xc]
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    beq .L_38cc
    ldr r0, [sp, #0x6c]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x6c]
    b .L_38cc
.L_3898:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_38cc
    mov r0, r5
    ldr r1, _LIT1
    ldr r1, [r1, #0x20]
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_38cc
    ldr r0, [sp, #0x6c]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x6c]
.L_38cc:
    ldr r0, [r6, #0x10]
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_3918
    ldr r0, _LIT23
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_3918
    ldr r0, [sp, #0x6c]
    mov r2, #0x1
    bic r0, r0, #0x780000
    orr r0, r0, #0x680000
    str r0, [sp, #0x6c]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x17
    and r1, r0, #0x1
    ldr r0, [sp, #0x2c]
    orr r0, r0, r2, lsl r1
    str r0, [sp, #0x2c]
.L_3918:
    ldr r1, [sp, #0x6c]
    mov r0, sl
    bl func_ov002_021dec9c
    ldr r1, [r7, #0x10]
    ldr r0, _LIT24
    mov r8, #0x0
    cmp r1, r0
    bgt .L_3a54
    bge .L_3b68
    sub r2, r0, #0xc3
    cmp r1, r2
    bgt .L_39e4
    sub r0, r0, #0xc3
    cmp r1, r0
    bge .L_3b60
    ldr r0, _LIT25
    cmp r1, r0
    bgt .L_39b4
    bge .L_3b68
    sub r2, r0, #0xbc
    cmp r1, r2
    bgt .L_398c
    sub r0, r0, #0xbc
    cmp r1, r0
    bge .L_3b60
    ldr r0, _LIT21
    cmp r1, r0
    beq .L_3b60
    b .L_3c5c
.L_398c:
    sub r2, r0, #0x4a
    cmp r1, r2
    bgt .L_3c5c
    sub r2, r0, #0x4d
    cmp r1, r2
    blt .L_3c5c
    subne r0, r0, #0x4a
    cmpne r1, r0
    beq .L_3b60
    b .L_3c5c
.L_39b4:
    add r2, r0, #0xe9
    cmp r1, r2
    bgt .L_39d4
    bge .L_3b60
    add r0, r0, #0x71
    cmp r1, r0
    beq .L_3b60
    b .L_3c5c
.L_39d4:
    add r0, r0, #0xea
    cmp r1, r0
    beq .L_3b68
    b .L_3c5c
.L_39e4:
    sub r2, r0, #0x7d
    cmp r1, r2
    bgt .L_3a24
    bge .L_3b60
    sub r2, r0, #0x9d
    cmp r1, r2
    bgt .L_3a14
    bge .L_3b60
    sub r0, r0, #0xbc
    cmp r1, r0
    beq .L_3b60
    b .L_3c5c
.L_3a14:
    sub r0, r0, #0x9c
    cmp r1, r0
    beq .L_3b60
    b .L_3c5c
.L_3a24:
    sub r2, r0, #0x36
    cmp r1, r2
    bgt .L_3a44
    bge .L_3b60
    sub r0, r0, #0x7c
    cmp r1, r0
    beq .L_3b60
    b .L_3c5c
.L_3a44:
    sub r0, r0, #0x35
    cmp r1, r0
    beq .L_3b60
    b .L_3c5c
.L_3a54:
    ldr r0, _LIT26
    cmp r1, r0
    bgt .L_3ad4
    bge .L_3b60
    sub r2, r0, #0x69
    cmp r1, r2
    bgt .L_3aa4
    bge .L_3b60
    sub r2, r0, #0xf6
    cmp r1, r2
    bgt .L_3a94
    bge .L_3b60
    sub r0, r0, #0x1dc
    cmp r1, r0
    beq .L_3b68
    b .L_3c5c
.L_3a94:
    sub r0, r0, #0xdc
    cmp r1, r0
    beq .L_3b60
    b .L_3c5c
.L_3aa4:
    sub r2, r0, #0x55
    cmp r1, r2
    bgt .L_3ac4
    bge .L_3b60
    sub r0, r0, #0x61
    cmp r1, r0
    beq .L_3b60
    b .L_3c5c
.L_3ac4:
    sub r0, r0, #0x1d
    cmp r1, r0
    beq .L_3b60
    b .L_3c5c
.L_3ad4:
    add r2, r0, #0xf1
    cmp r1, r2
    bgt .L_3b14
    bge .L_3be8
    add r2, r0, #0x78
    cmp r1, r2
    bgt .L_3b04
    bge .L_3b68
    add r0, r0, #0x2f
    cmp r1, r0
    beq .L_3b60
    b .L_3c5c
.L_3b04:
    add r0, r0, #0x7f
    cmp r1, r0
    beq .L_3b60
    b .L_3c5c
.L_3b14:
    add r2, r0, #0x10c
    cmp r1, r2
    bgt .L_3b3c
    add r0, r0, #0x10c
    cmp r1, r0
    bge .L_3b68
    ldr r0, _LIT27
    cmp r1, r0
    beq .L_3b68
    b .L_3c5c
.L_3b3c:
    ldr r0, _LIT28
    cmp r1, r0
    bgt .L_3b50
    beq .L_3b68
    b .L_3c5c
.L_3b50:
    add r0, r0, #0x52
    cmp r1, r0
    beq .L_3b68
    b .L_3c5c
.L_3b60:
    ldr r8, [sp, #0x1c]
    b .L_3c5c
.L_3b68:
    mov r8, #0x1
    b .L_3c5c
_LIT0: .word data_ov002_022cd340
_LIT1: .word data_ov002_022cd314
_LIT2: .word data_ov002_022cd3d8
_LIT3: .word data_ov002_022cf08c
_LIT4: .word data_ov002_022cd3ec
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022cf0c4
_LIT7: .word data_ov002_022d008c
_LIT8: .word 0x000013a4
_LIT9: .word 0x000015ff
_LIT10: .word 0x00001836
_LIT11: .word 0x0000147d
_LIT12: .word 0x000012a6
_LIT13: .word 0x000017da
_LIT14: .word 0x00001529
_LIT15: .word 0x00001adc
_LIT16: .word 0x00001415
_LIT17: .word 0x000017d2
_LIT18: .word 0x000001ff
_LIT19: .word 0x000016f8
_LIT20: .word 0x000015d9
_LIT21: .word 0x0000147a
_LIT22: .word 0x000018e6
_LIT23: .word 0x00001797
_LIT24: .word 0x000017c7
_LIT25: .word 0x000015dc
_LIT26: .word 0x000019a4
_LIT27: .word 0x00001aad
_LIT28: .word 0x00001b2d
_LIT29: .word 0x00001a90
.L_3be8:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_3c5c
    ldr r0, [sp, #0x6c]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    bne .L_3c5c
    mov r0, r7
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_3c5c
    ldr r1, [r6, #0x4]
    mov r0, r4
    ldr r2, _LIT29
    bl func_ov002_021b3e2c
    cmp r0, #0x0
    beq .L_3c5c
    ldr r1, [r6, #0xc]
    mov r0, r5
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [sp]
    ldr r1, [r7, #0x4]
    ldr r2, [r7, #0x10]
    mov r3, #0x2
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d58dc
.L_3c5c:
    cmp r8, #0x0
    beq .L_3ca8
    ldr r1, [r7]
    ldr r0, [r7, #0x4]
    mov r1, r1, lsl #0x1f
    and r1, r1, #-2147483648
    orr r1, r1, #0xc200000
    mov r0, r0, lsl #0x10
    and r0, r0, #0x1f0000
    ldr r2, [r7, #0x10]
    orr r1, r1, #0x20000000
    orr r1, r1, r0
    mov r0, r2, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    ldr r1, [r7, #0xc]
    ldr r2, [sp, #0x6c]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_3ca8:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_3f14
    ldr r0, _LIT1
    ldr r1, _LIT30
    ldr r2, [r0, #0x20]
    add r1, r1, r9
    mov r0, #0x14
    mul r0, r2, r0
    ldrh r8, [r0, r1]
    cmp r8, #0x0
    beq .L_3f14
    ldr r0, _LIT31
    add r0, r0, #0x1e
    str r0, [sp, #0x38]
    ldr r0, _LIT31
    add r0, r0, #0x22
    str r0, [sp, #0x3c]
    ldr r0, _LIT32
    sub r0, r0, #0xed
    str r0, [sp, #0x40]
    ldr r0, _LIT32
    sub r0, r0, #0xed
    str r0, [sp, #0x44]
    ldr r0, _LIT31
    add r0, r0, #0x1e
    str r0, [sp, #0x34]
    ldr r0, _LIT31
    add r0, r0, #0x22
    str r0, [sp, #0x30]
.L_3d20:
    ldr r0, _LIT33
    add r1, r0, r8, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r8, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r3, r0, lsr #0x1c
    cmp r3, #0xa
    cmpne r3, #0xb
    bne .L_3f0c
    ldrh r0, [r1]
    ldr r1, _LIT5
    and r9, r0, #0xff
    mov r0, r0, asr #0x8
    and sl, r0, #0xff
    mov r0, #0x14
    smulbb fp, sl, r0
    ldr r0, _LIT3
    and r2, r9, #0x1
    mla r0, r2, r1, r0
    add ip, r0, fp
    str r0, [sp, #0x10]
    ldr r0, [ip, #0x30]
    ldr r1, [ip, #0x40]
    mov r0, r0, lsl #0x13
    mov r2, r0, lsr #0x13
    ldrh r0, [ip, #0x38]
    mov ip, r1, lsr #0x6
    and ip, ip, #0x1
    mvn ip, ip
    and r0, r0, ip
    mov ip, r1, lsr #0x2
    orr r1, ip, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_3f0c
    ldr r0, _LIT34
    cmp r2, r0
    mov r0, #0x0
    bgt .L_3e00
    ldr r1, _LIT34
    cmp r2, r1
    bge .L_3e84
    ldr r1, [sp, #0x30]
    cmp r2, r1
    bgt .L_3ea8
    ldr r1, [sp, #0x34]
    cmp r2, r1
    blt .L_3ea8
    ldr r1, [sp, #0x38]
    cmp r2, r1
    beq .L_3e2c
    ldr r1, [sp, #0x3c]
    cmp r2, r1
    beq .L_3e58
    b .L_3ea8
.L_3e00:
    ldr r1, [sp, #0x40]
    cmp r2, r1
    bgt .L_3e1c
    ldr r1, [sp, #0x44]
    cmp r2, r1
    moveq r0, #0x1
    b .L_3ea8
.L_3e1c:
    ldr r1, _LIT32
    cmp r2, r1
    beq .L_3e84
    b .L_3ea8
.L_3e2c:
    cmp r4, r9
    beq .L_3e50
    ldr r2, _LIT31
    mov r0, r9
    mov r1, sl
    bl func_ov002_021b3dec
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_3ea8
.L_3e50:
    mov r0, #0x0
    b .L_3ea8
.L_3e58:
    cmp r3, #0xb
    bne .L_3e7c
    ldr r2, _LIT31
    mov r0, r9
    mov r1, sl
    bl func_ov002_021b3dec
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_3ea8
.L_3e7c:
    mov r0, #0x0
    b .L_3ea8
.L_3e84:
    cmp r4, r9
    beq .L_3ea4
    ldr r0, [sp, #0x6c]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    moveq r0, #0x1
    beq .L_3ea8
.L_3ea4:
    mov r0, #0x0
.L_3ea8:
    cmp r0, #0x0
    beq .L_3f0c
    ldr r0, [sp, #0x10]
    add r0, r0, #0x30
    ldr r1, [r0, fp]
    mov r0, r9, lsl #0x1f
    and r2, r0, #-2147483648
    orr r2, r2, #0xc200000
    mov r0, sl, lsl #0x10
    orr r2, r2, #0x20000000
    and r0, r0, #0x1f0000
    orr r2, r2, r0
    mov r0, r1, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r0, r0, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    ldr r2, [sp, #0x6c]
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_3f0c:
    cmp r8, #0x0
    bne .L_3d20
.L_3f14:
    ldr r0, [r7, #0x30]
    cmp r0, #0x0
    beq .L_3f8c
    ldr r0, [r7, #0x2c]
    cmp r0, #0x0
    beq .L_3f74
    add r0, sp, #0x70
    mov r3, #0x0
    str r3, [r0]
    ldrh r2, [sp, #0x72]
    mov r1, r5, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0x1
    and r1, r1, #0x1
    orr r2, r2, r1
    mov r1, #0x1
    str r3, [r0, #0x4]
    str r3, [r0, #0x8]
    str r3, [r0, #0xc]
    str r3, [r0, #0x10]
    str r3, [r0, #0x14]
    strh r2, [sp, #0x72]
    bl func_ov002_021deda4
    b .L_47d0
.L_3f74:
    mov r2, #0x0
    ldr r1, [r7, #0x4]
    mov r0, r5
    mov r3, r2
    bl func_ov002_021de390
    b .L_47d0
.L_3f8c:
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    beq .L_47d0
    mov r0, #0x0
    sub r1, r0, #0x200
    ldr r3, [r7, #0xc]
    ldr r2, _LIT18
    and r8, r1, #0x0
    and r1, r3, r2
    orr r1, r8, r1
    bic r3, r1, #0x40000
    mov r1, r4, lsl #0x1f
    orr r3, r3, r1, lsr #0xd
    ldr r2, [r7, #0x4]
    bic r8, r3, #0x200
    add r9, sp, #0x68
    ldr r1, [r7, #0x8]
    mov r3, r5, lsl #0x1f
    str r0, [r9]
    orr r0, r8, r3, lsr #0x16
    mov r2, r2, lsl #0x1c
    bic r0, r0, #0x3c00
    orr r0, r0, r2, lsr #0x12
    orr r0, r0, #0x20000
    mov r1, r1, lsl #0x1f
    bic r0, r0, #0x4000
    orr r0, r0, r1, lsr #0x11
    orr r0, r0, #0x18000
    bic r0, r0, #0x780000
    orr r1, r0, #0x700000
    ldr r0, [r7, #0x10]
    str r1, [sp, #0x68]
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_4048
    ldr r1, [r7, #0x10]
    ldr r0, _LIT19
    cmp r1, r0
    bne .L_4038
    mov r0, r7
    bl func_ov002_021bacd0
    cmp r0, #0x0
    bne .L_4048
.L_4038:
    ldr r0, [r7, #0xc]
    bl func_ov002_021ca4dc
    cmp r0, #0x0
    bne .L_4058
.L_4048:
    ldr r0, [sp, #0x68]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x68]
.L_4058:
    mov r0, r6
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_4164
    ldr r2, [r6, #0x10]
    ldr r0, _LIT20
    cmp r2, r0
    bgt .L_40a0
    bge .L_4104
    ldr r0, _LIT21
    cmp r2, r0
    bgt .L_4090
    beq .L_40e4
    b .L_4164
.L_4090:
    add r0, r0, #0x3d
    cmp r2, r0
    beq .L_40e4
    b .L_4164
.L_40a0:
    ldr r0, _LIT22
    cmp r2, r0
    bgt .L_40c0
    bge .L_4104
    ldr r0, _LIT19
    cmp r2, r0
    beq .L_40d0
    b .L_4164
.L_40c0:
    add r0, r0, #0x1f8
    cmp r2, r0
    beq .L_4130
    b .L_4164
.L_40d0:
    ldr r0, [sp, #0x68]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x68]
    b .L_4164
.L_40e4:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_4164
    ldr r0, [sp, #0x68]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x68]
    b .L_4164
.L_4104:
    ldr r3, [r6, #0xc]
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    beq .L_4164
    ldr r0, [sp, #0x68]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x68]
    b .L_4164
.L_4130:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_4164
    ldr r1, _LIT1
    mov r0, r4
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_4164
    ldr r0, [sp, #0x68]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x68]
.L_4164:
    ldr r0, [r7, #0x10]
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_41b0
    ldr r0, _LIT23
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_41b0
    ldr r0, [sp, #0x68]
    mov r2, #0x1
    bic r0, r0, #0x780000
    orr r3, r0, #0x680000
    mov r0, r3, lsl #0x17
    mov r0, r0, lsr #0x17
    and r1, r0, #0x1
    ldr r0, [sp, #0x2c]
    str r3, [sp, #0x68]
    orr r0, r0, r2, lsl r1
    str r0, [sp, #0x2c]
.L_41b0:
    ldr r1, [r6, #0x10]
    ldr r0, _LIT24
    mov r8, #0x0
    cmp r1, r0
    bgt .L_430c
    bge .L_4420
    ldr r0, _LIT35
    cmp r1, r0
    bgt .L_4268
    bge .L_4420
    sub r2, r0, #0xea
    cmp r1, r2
    bgt .L_4238
    sub r0, r0, #0xea
    cmp r1, r0
    bge .L_4420
    ldr r2, _LIT36
    cmp r1, r2
    bgt .L_4210
    bge .L_4418
    sub r0, r2, #0xa6
    cmp r1, r0
    beq .L_4418
    b .L_449c
.L_4210:
    add r0, r2, #0x72
    cmp r1, r0
    bgt .L_449c
    add r0, r2, #0x6f
    cmp r1, r0
    blt .L_449c
    addne r0, r2, #0x72
    cmpne r1, r0
    beq .L_4418
    b .L_449c
.L_4238:
    sub r2, r0, #0x79
    cmp r1, r2
    bgt .L_4258
    bge .L_4418
    sub r0, r0, #0x85
    cmp r1, r0
    beq .L_4418
    b .L_449c
.L_4258:
    sub r0, r0, #0x1
    cmp r1, r0
    beq .L_4418
    b .L_449c
.L_4268:
    add r2, r0, #0x65
    cmp r1, r2
    bgt .L_42a8
    bge .L_4418
    add r2, r0, #0x45
    cmp r1, r2
    bgt .L_4298
    bge .L_4418
    add r0, r0, #0x3e
    cmp r1, r0
    beq .L_4418
    b .L_449c
.L_4298:
    add r0, r0, #0x64
    cmp r1, r0
    beq .L_4418
    b .L_449c
.L_42a8:
    add r2, r0, #0x85
    cmp r1, r2
    bgt .L_42c8
    bge .L_4418
    add r0, r0, #0x84
    cmp r1, r0
    beq .L_4418
    b .L_449c
.L_42c8:
    add r2, r0, #0xc7
    cmp r1, r2
    bgt .L_42e4
    add r0, r0, #0xc7
    cmp r1, r0
    beq .L_4418
    b .L_449c
.L_42e4:
    add r2, r0, #0xcc
    cmp r1, r2
    bgt .L_449c
    add r2, r0, #0xcb
    cmp r1, r2
    blt .L_449c
    addne r0, r0, #0xcc
    cmpne r1, r0
    beq .L_4418
    b .L_449c
.L_430c:
    ldr r0, _LIT26
    cmp r1, r0
    bgt .L_438c
    bge .L_4418
    sub r2, r0, #0x69
    cmp r1, r2
    bgt .L_435c
    bge .L_4418
    sub r2, r0, #0xf6
    cmp r1, r2
    bgt .L_434c
    bge .L_4418
    sub r0, r0, #0x1dc
    cmp r1, r0
    beq .L_4420
    b .L_449c
.L_434c:
    sub r0, r0, #0xdc
    cmp r1, r0
    beq .L_4418
    b .L_449c
.L_435c:
    sub r2, r0, #0x55
    cmp r1, r2
    bgt .L_437c
    bge .L_4418
    sub r0, r0, #0x61
    cmp r1, r0
    beq .L_4418
    b .L_449c
.L_437c:
    sub r0, r0, #0x1d
    cmp r1, r0
    beq .L_4418
    b .L_449c
.L_438c:
    add r2, r0, #0xf1
    cmp r1, r2
    bgt .L_43cc
    bge .L_4428
    add r2, r0, #0x78
    cmp r1, r2
    bgt .L_43bc
    bge .L_4420
    add r0, r0, #0x2f
    cmp r1, r0
    beq .L_4418
    b .L_449c
.L_43bc:
    add r0, r0, #0x7f
    cmp r1, r0
    beq .L_4418
    b .L_449c
.L_43cc:
    add r2, r0, #0x10c
    cmp r1, r2
    bgt .L_43f4
    add r0, r0, #0x10c
    cmp r1, r0
    bge .L_4420
    ldr r0, _LIT27
    cmp r1, r0
    beq .L_4420
    b .L_449c
.L_43f4:
    ldr r0, _LIT28
    cmp r1, r0
    bgt .L_4408
    beq .L_4420
    b .L_449c
.L_4408:
    add r0, r0, #0x52
    cmp r1, r0
    beq .L_4420
    b .L_449c
.L_4418:
    ldr r8, [sp, #0x20]
    b .L_449c
.L_4420:
    mov r8, #0x1
    b .L_449c
.L_4428:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_449c
    ldr r0, [sp, #0x68]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    bne .L_449c
    mov r0, r6
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_449c
    ldr r1, [r7, #0x4]
    ldr r2, _LIT29
    mov r0, r5
    bl func_ov002_021b3e2c
    cmp r0, #0x0
    beq .L_449c
    ldr r1, [r7, #0xc]
    mov r0, r4
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [sp]
    ldr r2, [r6, #0x10]
    ldr r1, [r6, #0x4]
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x2
    bl func_ov002_021d58dc
.L_449c:
    cmp r8, #0x0
    beq .L_44e8
    ldr r1, [r6]
    ldr r0, [r6, #0x4]
    mov r1, r1, lsl #0x1f
    and r1, r1, #-2147483648
    orr r3, r1, #0xc200000
    mov r2, r0, lsl #0x10
    ldr r0, [r6, #0x10]
    ldr r1, [r6, #0xc]
    mov r0, r0, lsl #0x10
    and r2, r2, #0x1f0000
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    orr r3, r3, #0x20000000
    orr r2, r3, r2
    orr r0, r2, r0, lsr #0x10
    ldr r2, [sp, #0x68]
    bl func_ov002_021e2fc4
.L_44e8:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_47c4
    ldr r0, _LIT1
    ldr r3, _LIT30
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r2, r1, r0
    ldr r0, [sp, #0x18]
    add r0, r3, r0
    ldrh fp, [r2, r0]
    cmp fp, #0x0
    beq .L_47c4
    ldr r0, _LIT31
    add r0, r0, #0x1e
    str r0, [sp, #0x58]
    ldr r0, _LIT31
    add r0, r0, #0x22
    str r0, [sp, #0x5c]
    ldr r0, _LIT31
    add r0, r0, #0x22
    str r0, [sp, #0x50]
    ldr r0, _LIT34
    add r0, r0, #0xac
    str r0, [sp, #0x4c]
    ldr r0, _LIT34
    add r0, r0, #0xac
    str r0, [sp, #0x48]
    ldr r0, _LIT34
    add r0, r0, #0x108
    str r0, [sp, #0x60]
    ldr r0, _LIT34
    add r0, r0, #0x108
    str r0, [sp, #0x64]
    ldr r0, _LIT31
    add r0, r0, #0x1e
    str r0, [sp, #0x54]
.L_457c:
    ldr r0, _LIT33
    add r1, r0, fp, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh fp, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r3, r0, lsr #0x1c
    cmp r3, #0xa
    cmpne r3, #0xb
    bne .L_47bc
    ldrh r0, [r1]
    ldr r1, _LIT5
    and r8, r0, #0xff
    mov r0, r0, asr #0x8
    and r9, r0, #0xff
    mov r0, #0x14
    smulbb r0, r9, r0
    str r0, [sp, #0xc]
    ldr r0, _LIT3
    and r2, r8, #0x1
    mla r1, r2, r1, r0
    ldr r0, [sp, #0xc]
    str r1, [sp, #0x8]
    add sl, r1, r0
    ldr r0, [sl, #0x30]
    ldr r1, [sl, #0x40]
    mov r0, r0, lsl #0x13
    mov r2, r0, lsr #0x13
    ldrh r0, [sl, #0x38]
    mov sl, r1, lsr #0x6
    and sl, sl, #0x1
    mvn sl, sl
    and r0, r0, sl
    mov sl, r1, lsr #0x2
    orr r1, sl, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_47bc
    ldr r0, [sp, #0x48]
    mov sl, #0x0
    cmp r2, r0
    bgt .L_4674
    ldr r0, [sp, #0x4c]
    cmp r2, r0
    bge .L_4720
    ldr r0, [sp, #0x50]
    cmp r2, r0
    bgt .L_4664
    ldr r0, [sp, #0x54]
    cmp r2, r0
    blt .L_4754
    ldr r0, [sp, #0x58]
    cmp r2, r0
    beq .L_46a0
    ldr r0, [sp, #0x5c]
    cmp r2, r0
    beq .L_46cc
    b .L_4754
.L_4664:
    ldr r0, _LIT34
    cmp r2, r0
    beq .L_46f8
    b .L_4754
.L_4674:
    ldr r0, [sp, #0x60]
    cmp r2, r0
    bgt .L_4690
    ldr r0, [sp, #0x64]
    cmp r2, r0
    beq .L_4728
    b .L_4754
.L_4690:
    ldr r0, _LIT32
    cmp r2, r0
    beq .L_46f8
    b .L_4754
.L_46a0:
    cmp r5, r8
    beq .L_46c4
    ldr r2, _LIT31
    mov r0, r8
    mov r1, r9
    bl func_ov002_021b3dec
    cmp r0, #0x0
    moveq sl, #0x1
    beq .L_4754
.L_46c4:
    mov sl, #0x0
    b .L_4754
.L_46cc:
    cmp r3, #0xb
    bne .L_46f0
    ldr r2, _LIT31
    mov r0, r8
    mov r1, r9
    bl func_ov002_021b3dec
    cmp r0, #0x0
    moveq sl, #0x1
    beq .L_4754
.L_46f0:
    mov sl, #0x0
    b .L_4754
.L_46f8:
    cmp r5, r8
    beq .L_4718
    ldr r0, [sp, #0x68]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    moveq sl, #0x1
    beq .L_4754
.L_4718:
    mov sl, #0x0
    b .L_4754
.L_4720:
    mov sl, #0x1
    b .L_4754
.L_4728:
    ldr r0, [r7, #0x28]
    cmp r0, #0x5
    blt .L_4754
    mov r0, r2, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, sl
    str r0, [sp]
    mov r0, r8
    mov r1, r9
    mov r3, #0x1
    bl func_ov002_021d58dc
.L_4754:
    cmp sl, #0x0
    beq .L_47bc
    ldr r0, [sp, #0x8]
    add r1, r0, #0x30
    ldr r0, [sp, #0xc]
    ldr r1, [r1, r0]
    mov r0, r8, lsl #0x1f
    and r2, r0, #-2147483648
    orr r2, r2, #0xc200000
    mov r0, r9, lsl #0x10
    orr r2, r2, #0x20000000
    and r0, r0, #0x1f0000
    orr r2, r2, r0
    mov r0, r1, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r0, r0, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    ldr r2, [sp, #0x68]
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_47bc:
    cmp fp, #0x0
    bne .L_457c
.L_47c4:
    ldr r1, [sp, #0x68]
    ldr r0, [sp, #0x4]
    bl func_ov002_021dec9c
.L_47d0:
    mov r0, #0x0
    ldr fp, _LIT31
    str r0, [sp, #0x28]
.L_47dc:
    ldr r0, _LIT7
    mov r9, #0x5
    ldr r1, [r0, #0xcec]
    ldr r0, [sp, #0x28]
    eor r8, r1, r0
    ldr r1, _LIT5
    ldr r0, _LIT3
    and r2, r8, #0x1
    mla r0, r2, r1, r0
    add sl, r0, #0x94
.L_4804:
    ldr r0, [sl]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_4848
    mov r0, r8
    mov r1, r9
    mov r2, fp
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_4848
    ldr r3, [sl]
    mov r0, r8
    mov r3, r3, lsl #0x13
    mov r1, r9
    mov r2, #0x0
    mov r3, r3, lsr #0x13
    bl func_ov002_021de390
.L_4848:
    add sl, sl, #0x14
    add r9, r9, #0x1
    cmp r9, #0xa
    blt .L_4804
    ldr r0, [sp, #0x28]
    add r0, r0, #0x1
    str r0, [sp, #0x28]
    cmp r0, #0x2
    blt .L_47dc
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_4944
    ldr r1, [r6, #0x1c]
    ldr r0, [r7, #0x20]
    cmp r1, r0
    bge .L_4944
    ldr r0, [r7, #0x8]
    cmp r0, #0x0
    beq .L_4944
    mov r0, r7
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_4944
    ldr r2, [r7, #0x10]
    ldr r1, _LIT37
    mov r3, #0x0
    cmp r2, r1
    bgt .L_48cc
    bge .L_4904
    sub r0, r1, #0x12c
    cmp r2, r0
    beq .L_48f0
    b .L_4910
.L_48cc:
    add r0, r1, #0x5f
    cmp r2, r0
    bgt .L_48e0
    moveq r3, #0x1
    b .L_4910
.L_48e0:
    add r0, r1, #0xf9
    cmp r2, r0
    beq .L_4904
    b .L_4910
.L_48f0:
    ldr r0, _LIT1
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    movgt r3, #0x1
    b .L_4910
.L_4904:
    cmp r4, r5
    movne r3, #0x1
    moveq r3, #0x0
.L_4910:
    cmp r3, #0x0
    beq .L_4944
    ldr r0, _LIT1
    ldr r2, [r7, #0xc]
    ldr r1, [r0, #0x20]
    mov r0, r5
    bl func_ov002_021df53c
    ldr r0, _LIT1
    ldr r3, [r7, #0x10]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_021de390
.L_4944:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_4990
    ldr r0, _LIT1
    ldr r2, _LIT38
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_4990
    ldr r1, _LIT38
    ldr r0, [sp, #0x14]
    bl func_ov002_021df5e4
    ldr r0, _LIT1
    ldr r3, _LIT38
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_021de390
.L_4990:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_49dc
    ldr r0, _LIT1
    ldr r2, _LIT39
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_49dc
    ldr r1, _LIT39
    ldr r0, [sp, #0x14]
    bl func_ov002_021df5e4
    ldr r0, _LIT1
    ldr r3, _LIT39
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_021de390
.L_49dc:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_4a28
    ldr r0, _LIT1
    ldr r2, _LIT40
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_4a28
    ldr r1, _LIT40
    ldr r0, [sp, #0x14]
    bl func_ov002_021df5e4
    ldr r0, _LIT1
    ldr r3, _LIT40
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_021de390
.L_4a28:
    ldr r1, _LIT1
    mov r0, r5
    ldr r1, [r1, #0x20]
    mov r2, #0x1140
    bl func_ov002_021b3dec
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_4a78
    ldr r0, _LIT1
    ldr r2, [r6, #0xc]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021df53c
    ldr r0, _LIT1
    ldr r3, [r6, #0x10]
    ldr r1, [r0, #0x20]
    mov r0, r5
    mov r2, #0x1
    bl func_ov002_021de390
.L_4a78:
    ldr r0, [sp, #0x2c]
    cmp r0, #0x0
    beq .L_4ab0
    mov r1, #0x1
    tst r0, r1, lsl r4
    beq .L_4a98
    mov r0, r4
    bl func_ov002_021e277c
.L_4a98:
    ldr r0, [sp, #0x2c]
    mov r1, #0x1
    tst r0, r1, lsl r5
    beq .L_4ab0
    mov r0, r5
    bl func_ov002_021e277c
.L_4ab0:
    bl func_ov002_021e2b6c
    ldr r1, _LIT7
    add sp, sp, #0xa0
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4ad0:
    mov r0, #0x1
    add sp, sp, #0xa0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT30: .word data_ov002_022cf0c6
_LIT31: .word 0x000015b3
_LIT32: .word 0x00001a69
_LIT33: .word data_ov002_022d0570
_LIT34: .word 0x000018d0
_LIT35: .word 0x000016c6
_LIT36: .word 0x00001520
_LIT37: .word 0x00001658
_LIT38: .word 0x00001493
_LIT39: .word 0x0000162e
_LIT40: .word 0x00001883
