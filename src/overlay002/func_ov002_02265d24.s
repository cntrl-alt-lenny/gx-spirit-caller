; func_ov002_02265d24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021ae5d4
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b9ecc
        .extern func_ov002_021d479c
        .extern func_ov002_021e30b4
        .extern func_ov002_02244fe4
        .extern func_ov002_022592b8
        .extern func_ov002_02259f74
        .extern func_ov002_0225a098
        .extern func_ov002_0225a0e0
        .extern func_ov002_022627ac
        .extern func_ov002_02299c9c
        .global func_ov002_02265d24
        .arm
func_ov002_02265d24:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r5, [r1, #0xcec]
    ldr r1, _LIT2
    and r2, r5, #0x1
    mul r4, r2, r0
    ldr r0, [r1, r4]
    ldr r2, _LIT3
    mov r3, r0, lsr #0x18
    mov r0, r5
    mov r1, #0xb
    and r6, r3, #0x1
    bl func_ov002_021b3ecc
    ldr r1, _LIT0
    ldr r2, [r1, #0xd20]
    cmp r2, #0x15
    bhi .L_94
    bcs .L_37c
    cmp r2, #0xb
    addls pc, pc, r2, lsl #0x2
    b .L_88
    b .L_b0
    b .L_11c
    b .L_124
    b .L_170
    b .L_4d4
    b .L_4d4
    b .L_4d4
    b .L_4d4
    b .L_4d4
    b .L_4d4
    b .L_254
    b .L_2b4
.L_88:
    cmp r2, #0x14
    beq .L_30c
    b .L_4d4
.L_94:
    cmp r2, #0x16
    bhi .L_a4
    beq .L_3b0
    b .L_4d4
.L_a4:
    cmp r2, #0x1e
    beq .L_410
    b .L_4d4
.L_b0:
    mov r3, #0x0
    str r3, [r1, #0xd34]
    cmp r6, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r0, #0x0
    beq .L_dc
    mov r2, #0xa
    str r2, [r1, #0xd20]
    mov r0, r3
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_dc:
    cmp r5, #0x0
    movne r3, #0x8000
    orr r0, r3, #0xe
    mov r1, #0x0
    mov r0, r0, lsl #0x10
    mov r2, r1
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d479c
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r1, #0xd50]
    ldr r2, [r1, #0xd20]
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_11c:
    add r0, r2, #0x1
    str r0, [r1, #0xd20]
.L_124:
    ldr r0, _LIT4
    ldr r0, [r0, r5, lsl #0x2]
    cmp r0, #0x1
    bne .L_150
    bl func_ov002_02299c9c
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0x1e
    strne r1, [r0, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_150:
    mov r0, #0x2
    bl func_ov002_022592b8
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd20]
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_170:
    ldr r0, [r1, #0xd50]
    cmp r0, #0x0
    beq .L_194
    mov r0, #0x1
    str r0, [r1, #0xd54]
    sub r0, r2, #0x1
    str r0, [r1, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_194:
    ldr r0, [r1, #0xd64]
    sub r0, r0, #0xd
    cmp r0, #0x3
    beq .L_1b0
    cmp r0, #0x5
    beq .L_1dc
    b .L_200
.L_1b0:
    mov r0, r5
    bl func_ov002_02259f74
    cmp r0, #0x0
    beq .L_200
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r1, #0xd34]
    str r0, [r1, #0xd2c]
    mov r2, #0x15
    str r2, [r1, #0xd20]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1dc:
    mov r0, r5
    bl func_ov002_0225a0e0
    cmp r0, #0x0
    beq .L_200
    ldr r0, _LIT0
    mov r1, #0x1e
    str r1, [r0, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_200:
    mov r0, r5
    bl func_ov002_0225a0e0
    cmp r0, #0x0
    movne r4, #0x20
    mov r0, r5
    moveq r4, #0x0
    bl func_ov002_02259f74
    cmp r0, #0x0
    ldr r0, _LIT0
    movne r2, #0x8
    ldr r0, [r0, #0xcf8]
    moveq r2, #0x0
    mov r1, #0x1
    orr r0, r2, r1, lsl r0
    orr r0, r0, r4
    bl func_ov002_021ae5d4
    ldr r0, _LIT0
    mov r1, #0x14
    str r1, [r0, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_254:
    ldr r0, _LIT4
    ldr r0, [r0, r5, lsl #0x2]
    cmp r0, #0x1
    bne .L_290
    mov r0, r5
    bl func_ov002_02259f74
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0x3
    ldreq r0, _LIT0
    moveq r1, #0x5
    str r1, [r0, #0xd44]
    ldr r0, _LIT0
    mov r1, #0x14
    b .L_2a8
.L_290:
    ldr r1, _LIT5
    mov r0, r5
    bl func_ov002_021ae400
    ldr r0, _LIT0
    ldr r1, [r0, #0xd20]
    add r1, r1, #0x1
.L_2a8:
    str r1, [r0, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_2b4:
    mov r0, r5
    bl func_ov002_0225a098
    cmp r0, #0x0
    bne .L_2d8
    mov r0, r5
    bl func_ov002_02259f74
    cmp r0, #0x0
    movne r4, #0x8
    bne .L_2dc
.L_2d8:
    mov r4, #0x0
.L_2dc:
    mov r0, r5
    bl func_ov002_0225a0e0
    cmp r0, #0x0
    movne r0, #0x20
    moveq r0, #0x0
    orr r0, r0, r4
    bl func_ov002_021ae5d4
    ldr r0, _LIT0
    mov r1, #0x14
    str r1, [r0, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_30c:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd44]
    cmp r1, #0x3
    beq .L_328
    cmp r1, #0x5
    beq .L_358
    b .L_368
.L_328:
    mov r0, r5
    bl func_ov002_02259f74
    cmp r0, #0x0
    beq .L_368
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r1, #0xd34]
    str r0, [r1, #0xd2c]
    ldr r2, [r1, #0xd20]
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_358:
    mov r1, #0x1e
    str r1, [r0, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_368:
    ldr r0, _LIT0
    mov r1, #0x2
    str r1, [r0, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_37c:
    ldr r0, [r1, #0xcf8]
    cmp r0, #0x2
    cmpne r0, #0x4
    bne .L_398
    mov r0, #0x3
    mov r1, #0x0
    bl func_ov002_02244fe4
.L_398:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd20]
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_3b0:
    mov r0, r5
    bl func_ov002_022627ac
    cmp r0, #0x0
    beq .L_408
    ldr r0, _LIT0
    ldr r0, [r0, #0xd34]
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r5, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    mov r1, #0x0
    orr r0, r0, #0x10
    mov r0, r0, lsl #0x10
    mov r2, r1
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d479c
    ldr r0, _LIT0
    mov r1, #0x2
    str r1, [r0, #0xd20]
.L_408:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_410:
    ldr r0, [r1, #0xcf8]
    cmp r0, #0x2
    cmpne r0, #0x4
    bne .L_4cc
    ldr r1, _LIT6
    mov r0, r5, lsl #0x1f
    add r6, r1, r4
    and r0, r0, #-2147483648
    mov r4, #0x0
    ldr r9, _LIT7
    add r7, r6, #0x30
    orr r8, r0, #0x600000
    mov sl, r4
.L_444:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9ecc
    cmp r0, r9
    bne .L_4ac
    ldrh r1, [r6, #0x38]
    cmp r1, #0x0
    beq .L_4ac
    ldr r3, [r7]
    mov r1, r4, lsl #0x10
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    and r1, r1, #0x1f0000
    add r2, r2, r3, lsr #0x1f
    mov r3, r2, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r1, r8, r1
    orr r0, r1, r0, lsr #0x10
    mov r2, sl
    mov r1, r3, lsr #0x10
    bl func_ov002_021e30b4
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_4ac:
    add r4, r4, #0x1
    cmp r4, #0x4
    add r6, r6, #0x14
    add r7, r7, #0x14
    ble .L_444
    mov r0, #0x4
    mov r1, #0x0
    bl func_ov002_02244fe4
.L_4cc:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_4d4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf288
_LIT3: .word 0x000013b1
_LIT4: .word data_ov002_022cd744
_LIT5: .word 0x00000135
_LIT6: .word data_ov002_022cf16c
_LIT7: .word 0x00001954
