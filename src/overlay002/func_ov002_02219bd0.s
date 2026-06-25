; func_ov002_02219bd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdc88
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern data_ov002_022d016c
        .extern func_0202b8a8
        .extern func_0202e234
        .extern func_0202e2c8
        .extern func_0202e2f8
        .extern func_0203058c
        .extern func_ov002_021b91c4
        .extern func_ov002_021bc618
        .extern func_ov002_021bc6c4
        .extern func_ov002_021c988c
        .extern func_ov002_021c9df0
        .extern func_ov002_021ca2b8
        .extern func_ov002_021ca440
        .extern func_ov002_021d87dc
        .extern func_ov002_021d8840
        .extern func_ov002_021dea34
        .extern func_ov002_021df708
        .extern func_ov002_021e13f4
        .extern func_ov002_021e2818
        .extern func_ov002_021e286c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0227ac64
        .global func_ov002_02219bd0
        .arm
func_ov002_02219bd0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r4, r0
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT0
    ldr r0, [r2, #0x5a8]
    sub r0, r0, #0x78
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_388
    b .L_354
    b .L_388
    b .L_388
    b .L_318
    b .L_2f8
    b .L_294
    b .L_178
    b .L_138
    b .L_58
.L_58:
    mov r7, #0x0
    strh r7, [r4, #0x8]
    ldr r6, _LIT1
    ldr r5, _LIT2
    strh r7, [r4, #0xa]
    mov fp, r7
.L_70:
    and r0, r7, #0x1
    mla r1, r0, r5, r6
    mov r8, fp
    add sl, r1, #0x30
.L_80:
    ldr r0, [sl]
    mov r0, r0, lsl #0x13
    mov r9, r0, lsr #0x13
    mov r0, r9
    bl func_0202e234
    cmp r0, #0x0
    beq .L_d8
    mov r0, r9
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_d8
    mov r0, r9
    bl func_0202e2c8
    cmp r0, #0x0
    bne .L_d8
    ldr r0, [sl]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    add r1, r4, r0, lsl #0x1
    ldrh r0, [r1, #0x8]
    add r0, r0, #0x1
    strh r0, [r1, #0x8]
.L_d8:
    add r8, r8, #0x1
    cmp r8, #0x5
    add sl, sl, #0x14
    blt .L_80
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_70
    ldr r1, _LIT3
    mov r0, r4
    bl func_ov002_021dea34
    ldr r5, _LIT4
    mov r6, #0x0
.L_108:
    ldr r0, [r5, #0xcec]
    eor r0, r0, r6
    add r1, r4, r0, lsl #0x1
    ldrh r1, [r1, #0x8]
    cmp r1, #0x0
    beq .L_124
    bl func_ov002_021e286c
.L_124:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_108
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_138:
    ldr r1, _LIT4
    mov r0, #0x0
    ldr r1, [r1, #0xcec]
    str r1, [r2, #0x5ac]
    strh r0, [r4, #0xc]
    strh r0, [r4, #0xe]
    bl func_ov002_021ca2b8
    mov r4, r0
    mov r0, #0x1
    bl func_ov002_021ca2b8
    ldr r1, _LIT0
    orr r0, r4, r0, lsl #0x1
    str r0, [r1, #0x5b0]
    bl func_ov002_021e2b3c
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_178:
    ldr r6, [r2, #0x5ac]
    ldr r0, _LIT2
    and r1, r6, #0x1
    mul r2, r1, r0
    ldr r0, _LIT5
    ldr r0, [r0, r2]
    cmp r0, #0x0
    addne r0, r4, r6, lsl #0x1
    ldrneh r0, [r0, #0x8]
    cmpne r0, #0x0
    beq .L_28c
    ldr r1, _LIT1
    mov r0, r6
    add r5, r1, r2
    ldr r2, [r5, #0x260]
    mov r1, r2, lsl #0x13
    mov r8, r1, lsr #0x13
    mov r2, r2, lsl #0x12
    mov r1, r8
    mov r7, r2, lsr #0x1f
    bl func_ov002_021df708
    mov r0, r6
    mov r1, #0xd
    mov r2, #0x0
    bl func_ov002_021c988c
    cmp r0, #0x0
    bne .L_1ec
    mov r0, r6
    bl func_ov002_021e2818
.L_1ec:
    mov r0, r6
    bl func_ov002_021d87dc
    mov r0, r8
    bl func_0202e234
    cmp r0, #0x0
    beq .L_284
    add r3, r4, #0x8
    mov r2, r6, lsl #0x1
    ldrh r1, [r3, r2]
    mov r0, r8
    sub r1, r1, #0x1
    strh r1, [r3, r2]
    bl func_0202b8a8
    cmp r0, #0x5
    bge .L_284
    mov r0, r6
    mov r1, r8
    bl func_ov002_021ca440
    cmp r0, #0x0
    beq .L_284
    mov r0, r6
    bl func_ov002_021c9df0
    cmp r0, #0x0
    beq .L_284
    mov r0, r7
    bl func_ov002_021bc618
    cmp r0, #0x0
    ble .L_284
    ldr r0, _LIT0
    ldr r0, [r0, #0x5b0]
    mov r0, r0, asr r7
    tst r0, #0x1
    beq .L_284
    ldr r0, _LIT6
    add r1, r5, #0x260
    bl func_ov002_021b91c4
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_284:
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_28c:
    mov r0, #0x7b
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_294:
    ldr r6, _LIT6
    ldr r0, [r6]
    mov r1, r0, lsl #0x12
    mov r0, r0, lsl #0x13
    mov r7, r1, lsr #0x1f
    mov r0, r0, lsr #0x13
    bl func_0203058c
    mov r2, r0
    mov r5, #0x0
    mov r0, r7
    mov r1, r6
    mov r3, #0x1
    str r5, [sp]
    bl func_ov002_0227ac64
    mov r0, r7
    bl func_ov002_021bc6c4
    add r1, r7, #0x2
    mov r3, r1, lsl #0x1
    add r4, r4, #0x8
    ldrh r2, [r4, r3]
    mov r1, #0x1
    orr r0, r2, r1, lsl r0
    strh r0, [r4, r3]
    mov r0, #0x7b
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2f8:
    ldrh r1, [r4, #0x2]
    ldr r0, [r2, #0x5ac]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    movne r2, #0x1
    moveq r2, #0x0
    mov r1, #0x1
    bl func_ov002_021e13f4
.L_318:
    ldr r1, _LIT0
    ldr r2, [r1, #0x5ac]
    add r0, r4, r2, lsl #0x1
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    movne r0, #0x7e
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    rsb r2, r2, #0x1
    ldr r0, _LIT4
    str r2, [r1, #0x5ac]
    ldr r0, [r0, #0xcec]
    cmp r2, r0
    movne r0, #0x7e
    moveq r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_354:
    ldr r5, _LIT4
    mov r6, #0x0
.L_35c:
    ldr r0, [r5, #0xcec]
    eor r0, r0, r6
    add r1, r4, r0, lsl #0x1
    ldrh r1, [r1, #0xc]
    bl func_ov002_021d8840
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_35c
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_388:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word 0x001f001f
_LIT4: .word data_ov002_022d016c
_LIT5: .word data_ov002_022cf17c
_LIT6: .word data_ov002_022cdc88
