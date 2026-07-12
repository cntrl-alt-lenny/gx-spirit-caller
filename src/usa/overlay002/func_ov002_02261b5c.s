; func_ov002_02261b5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern data_ov002_022d008c
        .extern func_0202e1e0
        .extern func_ov002_021b3dec
        .extern func_ov002_021b4040
        .extern func_ov002_021b8eec
        .extern func_ov002_021b939c
        .extern func_ov002_021b9d20
        .extern func_ov002_021b9dec
        .extern func_ov002_021babc8
        .extern func_ov002_021bcf50
        .extern func_ov002_021d58dc
        .extern func_ov002_021d5a90
        .extern func_ov002_021d5c68
        .extern func_ov002_021d6780
        .extern func_ov002_021d8324
        .extern func_ov002_021d90f0
        .extern func_ov002_021de32c
        .extern func_ov002_021de390
        .extern func_ov002_021df53c
        .extern func_ov002_021df5e4
        .extern func_ov002_021e2fc4
        .extern func_ov002_02244efc
        .global func_ov002_02261b5c
        .arm
func_ov002_02261b5c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x3c
    str r0, [sp, #0xc]
    ldr r0, _LIT0
    ldr r0, [r0, #0xd30]
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_64bc
    b .L_5ab4
    b .L_5adc
    b .L_5e40
    b .L_5ecc
    b .L_6040
    b .L_60c4
    b .L_61b8
    b .L_6244
    b .L_631c
    b .L_63f4
.L_5ab4:
    mov r0, #0x17
    mov r1, #0x0
    bl func_ov002_02244efc
    ldr r1, _LIT0
    add sp, sp, #0x3c
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5adc:
    mov r0, #0x0
    str r0, [sp, #0x10]
.L_5ae4:
    ldr r0, _LIT0
    ldr r5, _LIT1
    ldr r3, [r0, #0xcec]
    ldr r0, [sp, #0x10]
    ldr r2, _LIT2
    eor r6, r3, r0
    ldr r1, _LIT3
    and r0, r6, #0x1
    mla r9, r0, r1, r2
    sub r0, r5, #0xbd
    str r0, [sp, #0x14]
    ldr r0, _LIT4
    add fp, r5, #0xfc
    sub r0, r0, #0x3
    str r0, [sp, #0x34]
    add r0, r5, #0x90
    str r0, [sp, #0x24]
    sub r0, r5, #0xbd
    str r0, [sp, #0x20]
    add r0, r5, #0x1
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
    ldr r0, _LIT4
    add sl, r9, #0x30
    add r0, r0, #0x6e
    str r0, [sp, #0x2c]
    ldr r0, _LIT4
    mov r7, #0x0
    add r0, r0, #0x6e
    str r0, [sp, #0x28]
    ldr r0, _LIT4
    mov r4, fp
    add r0, r0, #0x14c
    str r0, [sp, #0x38]
    ldr r0, _LIT4
    sub r0, r0, #0x3
    str r0, [sp, #0x30]
.L_5b78:
    ldr r0, [r9, #0x40]
    ldrh r2, [r9, #0x38]
    mov r1, r0, lsr #0x6
    and r1, r1, #0x1
    mvn r1, r1
    and r2, r2, r1
    mov r1, r0, lsr #0x2
    orr r0, r1, r0, lsr #0x1
    and r0, r0, #0x1
    mvn r0, r0
    tst r2, r0
    beq .L_5dfc
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9dec
    mov r8, r0
    cmp r8, r4
    bgt .L_5c00
    cmp r8, fp
    bge .L_5c58
    ldr r0, [sp, #0x18]
    cmp r8, r0
    bgt .L_5bf0
    ldr r0, [sp, #0x1c]
    cmp r8, r0
    bge .L_5cf4
    ldr r0, [sp, #0x20]
    cmp r8, r0
    beq .L_5c58
    b .L_5dfc
.L_5bf0:
    ldr r0, [sp, #0x24]
    cmp r8, r0
    beq .L_5c58
    b .L_5dfc
.L_5c00:
    ldr r0, [sp, #0x28]
    cmp r8, r0
    bgt .L_5c48
    ldr r0, [sp, #0x2c]
    cmp r8, r0
    bge .L_5d24
    ldr r0, _LIT4
    cmp r8, r0
    bgt .L_5dfc
    ldr r0, [sp, #0x30]
    cmp r8, r0
    blt .L_5dfc
    ldr r0, [sp, #0x34]
    cmp r8, r0
    ldrne r0, _LIT4
    cmpne r8, r0
    beq .L_5c58
    b .L_5dfc
.L_5c48:
    ldr r0, [sp, #0x38]
    cmp r8, r0
    beq .L_5d94
    b .L_5dfc
.L_5c58:
    mov r0, r6
    mov r1, r7
    mov r2, r5
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_5dfc
    ldrh r0, [r9, #0x36]
    cmp r0, #0x0
    bne .L_5dfc
    mov r0, r6
    mov r1, r7
    mov r2, r5
    mov r3, #0x1
    bl func_ov002_021d5a90
    ldr r3, [sl]
    mov r0, r6
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r7
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    mov r2, #0x0
    str r8, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, r6
    mov r1, r7
    mov r3, r2
    bl func_ov002_021d6780
    mov r0, #0x0
    str r0, [sp]
    ldr r2, [sp, #0x14]
    mov r0, r6
    mov r1, r7
    mov r3, #0x22
    bl func_ov002_021d58dc
    b .L_5dfc
.L_5cf4:
    mov r0, r6
    mov r1, r7
    mov r2, r8
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_5dfc
    mov r2, r8
    mov r0, r6
    mov r1, r7
    mov r3, #0x1
    bl func_ov002_021d5a90
    b .L_5dfc
.L_5d24:
    mov r2, r8
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_5dfc
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9d20
    cmp r0, #0x0
    beq .L_5dfc
    ldr r3, [sl]
    mov r0, r6
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r7
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9d20
    rsb r2, r0, #0x0
    mov r0, r6
    mov r1, r7
    bl func_ov002_021d90f0
    b .L_5dfc
.L_5d94:
    mov r0, r6
    mov r1, r7
    mov r2, r5
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_5dfc
    ldrh r0, [r9, #0x36]
    cmp r0, #0x0
    bne .L_5dfc
    ldr r3, [sl]
    mov r0, r6
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r7
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    mov r2, #0x0
    str r8, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, r6
    mov r1, r7
    mov r3, r2
    bl func_ov002_021d6780
.L_5dfc:
    add r9, r9, #0x14
    add sl, sl, #0x14
    add r7, r7, #0x1
    cmp r7, #0x5
    blt .L_5b78
    ldr r0, [sp, #0x10]
    add r0, r0, #0x1
    str r0, [sp, #0x10]
    cmp r0, #0x2
    blt .L_5ae4
    ldr r1, _LIT0
    add sp, sp, #0x3c
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5e40:
    mov r7, #0x0
    ldr r5, _LIT5
    mov r4, #0x1
    mov r6, r7
.L_5e50:
    ldr r0, _LIT0
    mov r9, r6
    ldr r0, [r0, #0xcec]
    eor r8, r0, r7
.L_5e60:
    mov r0, r8
    mov r1, r9
    mov r2, r5
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_5e98
    mov r0, r8
    mov r1, r5
    bl func_ov002_021df5e4
    mov r0, r8
    mov r1, r9
    mov r2, r4
    mov r3, r5
    bl func_ov002_021de390
.L_5e98:
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_5e60
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_5e50
    ldr r1, _LIT0
    add sp, sp, #0x3c
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5ecc:
    mov r6, #0x0
    ldr r4, _LIT6
    mov r5, r6
.L_5ed8:
    ldr r0, _LIT0
    mov r9, r5
    ldr r0, [r0, #0xcec]
    eor r8, r0, r6
.L_5ee8:
    mov r0, r8
    mov r1, r9
    mov r2, r4
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_6018
    mov r0, r8
    mov r1, r9
    mov r2, r4
    bl func_ov002_021b4040
    cmp r0, #0x0
    blt .L_6018
    add r1, r0, r0, lsr #0x1f
    and r6, r0, #0x1
    mov r0, r6
    mov r5, r1, asr #0x1
    bl func_ov002_021bcf50
    mov r4, r0
    mov r0, r5
    bl func_ov002_021b939c
    cmp r4, #0x0
    and r7, r0, #0xff
    blt .L_5ff8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xe
    bne .L_5ff8
    ldr r2, _LIT2
    ldr r0, _LIT3
    and r1, r8, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mul r0, r9, r0
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r0, r8
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r9
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    str r4, [sp]
    mov r1, #0x1
    mov r0, r7
    mov r2, r5
    mov r3, r6
    str r1, [sp, #0x4]
    mov r5, #0x0
    mov r1, #0xe
    str r5, [sp, #0x8]
    bl func_ov002_021d8324
    and r1, r6, #0xff
    and r0, r4, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r1, r0, lsl #0x10
    and r2, r8, #0xff
    and r0, r9, #0xff
    orr r0, r2, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    mov r0, r6
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0xc
    bl func_ov002_021d5c68
.L_5ff8:
    ldr r2, _LIT6
    mov r0, r8
    mov r1, r9
    mov r3, #0x0
    bl func_ov002_021d5a90
    add sp, sp, #0x3c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6018:
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_5ee8
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_5ed8
    ldr r0, _LIT0
    ldr r1, [r0, #0xd30]
    add r1, r1, #0x1
    str r1, [r0, #0xd30]
.L_6040:
    ldr r4, _LIT7
    mov r6, #0x0
    mov r5, #0xb
.L_604c:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_60a8
    mov r2, r6, lsl #0x1f
    mov r1, #0x0
    ldr r0, _LIT8
    and r3, r2, #-2147483648
    mov r2, r1
    orr r0, r3, r0
    bl func_ov002_021e2fc4
    cmp r0, #0x0
    bne .L_609c
    ldr r2, _LIT7
    mov r0, r6
    mov r1, #0xb
    mov r3, #0x0
    bl func_ov002_021d5a90
.L_609c:
    add sp, sp, #0x3c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_60a8:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_604c
    ldr r0, _LIT0
    ldr r1, [r0, #0xd30]
    add r1, r1, #0x1
    str r1, [r0, #0xd30]
.L_60c4:
    mov r9, #0x0
    ldr r7, _LIT9
    ldr r6, _LIT0
    mov r8, r9
.L_60d4:
    ldr r0, [r6, #0xcec]
    mov r5, r8
    eor r4, r0, r9
.L_60e0:
    mov r0, r4
    mov r1, r5
    mov r2, r7
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_6190
    mov r0, r4
    mov r1, r5
    mov r2, r7
    bl func_ov002_021b4040
    movs r2, r0
    bmi .L_6190
    ldr r3, _LIT2
    ldr r0, _LIT3
    and r1, r4, #0x1
    mla r3, r1, r0, r3
    mov r0, #0x14
    mul r0, r5, r0
    add r1, r3, #0x30
    ldr r3, [r1, r0]
    mov r1, r4, lsl #0x1f
    mov r0, r3, lsl #0x2
    and r7, r1, #-2147483648
    mov r1, r0, lsr #0x18
    mov r6, r5, lsl #0x10
    orr r7, r7, #0x200000
    and r0, r6, #0x1f0000
    orr r0, r7, r0
    orr r0, r0, #0x95
    mov r3, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    mov r1, r1, lsl #0x10
    orr r0, r0, #0x1a00
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
    ldr r2, _LIT9
    mov r0, r4
    mov r1, r5
    mov r3, #0x0
    bl func_ov002_021d5a90
    add sp, sp, #0x3c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6190:
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_60e0
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_60d4
    ldr r0, _LIT0
    ldr r1, [r0, #0xd30]
    add r1, r1, #0x1
    str r1, [r0, #0xd30]
.L_61b8:
    ldr r5, _LIT10
    ldr r6, _LIT2
    ldr fp, _LIT0
    mov r8, #0x0
    mov r4, #0x1
.L_61cc:
    ldr r0, [fp, #0xcec]
    mov sl, #0x0
    eor r9, r0, r8
    ldr r0, _LIT3
    and r1, r9, #0x1
    mla r0, r1, r0, r6
    add r7, r0, #0x30
.L_61e8:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_620c
    mov r0, r9
    mov r1, sl
    mov r2, r5
    mov r3, r4
    bl func_ov002_021d5a90
.L_620c:
    add sl, sl, #0x1
    cmp sl, #0x5
    add r7, r7, #0x14
    blt .L_61e8
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_61cc
    ldr r1, _LIT0
    add sp, sp, #0x3c
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6244:
    mov r6, #0x0
    ldr r5, _LIT11
    mov fp, r6
    mov r4, #0x1
.L_6254:
    ldr r0, _LIT0
    ldr r1, _LIT3
    ldr r0, [r0, #0xcec]
    mov sl, #0x0
    eor r9, r0, fp
    ldr r0, _LIT2
    and r2, r9, #0x1
    mla r0, r2, r1, r0
    add r7, r0, #0x30
    mov r8, r9, lsl #0x4
.L_627c:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_62c4
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_62c4
    mov r0, r9
    mov r1, sl
    bl func_ov002_021b8eec
    cmp r0, #0x0
    bne .L_62c4
    mov r0, r9
    mov r1, sl
    mov r2, r5
    bl func_ov002_021b3dec
    cmp r0, #0x0
    orrne r6, r6, r4, lsl r8
.L_62c4:
    add sl, sl, #0x1
    cmp sl, #0x5
    add r7, r7, #0x14
    add r8, r8, #0x1
    blt .L_627c
    add fp, fp, #0x1
    cmp fp, #0x2
    blt .L_6254
    cmp r6, #0x0
    beq .L_630c
    ldr r0, [sp, #0xc]
    ldr r1, _LIT11
    mov r2, r6
    rsb r0, r0, #0x1
    bl func_ov002_021de32c
    add sp, sp, #0x3c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_630c:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd30]
    add r1, r1, #0x1
    str r1, [r0, #0xd30]
.L_631c:
    ldr r2, _LIT12
    ldr r0, [sp, #0xc]
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_63d8
    mov r6, #0x0
    ldr r5, _LIT12
    mov fp, r6
    mov r4, #0x1
.L_6344:
    ldr r0, _LIT0
    ldr r1, _LIT3
    ldr r0, [r0, #0xcec]
    mov sl, #0x0
    eor r9, r0, fp
    ldr r0, _LIT2
    and r2, r9, #0x1
    mla r0, r2, r1, r0
    add r7, r0, #0x30
    mov r8, r9, lsl #0x4
.L_636c:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_6394
    mov r0, r9
    mov r1, sl
    mov r2, r5
    bl func_ov002_021b3dec
    cmp r0, #0x0
    orrne r6, r6, r4, lsl r8
.L_6394:
    add sl, sl, #0x1
    cmp sl, #0x5
    add r7, r7, #0x14
    add r8, r8, #0x1
    blt .L_636c
    add fp, fp, #0x1
    cmp fp, #0x2
    blt .L_6344
    cmp r6, #0x0
    beq .L_63d8
    ldr r1, _LIT12
    ldr r0, [sp, #0xc]
    bl func_ov002_021df5e4
    ldr r1, _LIT12
    ldr r0, [sp, #0xc]
    mov r2, r6
    bl func_ov002_021de32c
.L_63d8:
    ldr r1, _LIT0
    add sp, sp, #0x3c
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_63f4:
    ldr r0, [sp, #0xc]
    mov r8, #0x0
    rsb r2, r0, #0x1
    ldr r0, _LIT3
    and r1, r2, #0x1
    mul r3, r1, r0
    ldr r0, _LIT13
    ldr r0, [r0, r3]
    cmp r0, #0x0
    bls .L_64a0
    ldr r0, _LIT2
    mov r2, r2, lsl #0x1f
    add r7, r0, r3
    ldr r1, _LIT14
    add r0, r7, #0x18
    and r2, r2, #-2147483648
    add r5, r0, #0x400
    orr r6, r2, r1
    sub r9, r1, #0x4e0000
    mov r4, r8
.L_6444:
    ldr r1, [r5]
    mov r0, r1, lsl #0x13
    cmp r9, r0, lsr #0x13
    bne .L_648c
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r1, r0, lsl #0x10
    mov r0, r6
    mov r2, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
    cmp r0, #0x0
    addne sp, sp, #0x3c
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_648c:
    ldr r0, [r7, #0x14]
    add r8, r8, #0x1
    cmp r8, r0
    add r5, r5, #0x4
    bcc .L_6444
.L_64a0:
    ldr r1, _LIT0
    add sp, sp, #0x3c
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_64bc:
    ldr r2, _LIT15
    ldr r0, [sp, #0xc]
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021d5a90
    ldr r2, _LIT16
    ldr r0, [sp, #0xc]
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    addeq sp, sp, #0x3c
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT16
    ldr r0, [sp, #0xc]
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021d5a90
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r1, #0xd2c]
    str r0, [r1, #0xd30]
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x000014d6
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
_LIT4: .word 0x00001915
_LIT5: .word 0x00001392
_LIT6: .word 0x000012a6
_LIT7: .word 0x00001415
_LIT8: .word 0x00501415
_LIT9: .word 0x00001a95
_LIT10: .word 0x000012e2
_LIT11: .word 0x00001362
_LIT12: .word 0x00001512
_LIT13: .word data_ov002_022cf0a0
_LIT14: .word 0x004e1571
_LIT15: .word 0x00001469
_LIT16: .word 0x000011ed
