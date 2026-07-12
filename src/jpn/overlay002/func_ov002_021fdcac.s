; func_ov002_021fdcac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021b2f34
        .extern func_ov002_021b2fcc
        .extern func_ov002_021b3dec
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b9dec
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_021bb6d0
        .extern func_ov002_021bb82c
        .extern func_ov002_021bbe70
        .extern func_ov002_021bd630
        .global func_ov002_021fdcac
        .arm
func_ov002_021fdcac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x20
    ldr r2, _LIT0
    mov sl, r0
    mov r0, #0x0
    mov r1, #0xb
    mov r3, #0x2
    str r0, [sl, #0x18]
    bl func_ov002_021b3ef8
    mov r4, r0
    mov r0, #0x1
    mov r1, #0xb
    mov r2, #0x1840
    bl func_ov002_021b3dec
    orr r1, r4, r0
    ldr r2, _LIT0
    mov r0, #0x1
    str r1, [sl]
    mov r1, #0xb
    mov r3, #0x2
    bl func_ov002_021b3ef8
    mov r4, r0
    mov r0, #0x0
    mov r1, #0xb
    mov r2, #0x1840
    bl func_ov002_021b3dec
    orr r0, r4, r0
    str r0, [sl, #0x4]
    mov r0, #0x0
    mov r1, #0xb
    ldr r2, _LIT0
    mov r3, #0x2
    bl func_ov002_021b3ef8
    str r0, [sl, #0x8]
    mov r0, #0x1
    mov r1, #0xb
    ldr r2, _LIT0
    mov r3, #0x2
    bl func_ov002_021b3ef8
    str r0, [sl, #0xc]
    mov r0, #0x0
    mov r1, #0xb
    ldr r2, _LIT0
    mov r3, #0x1
    bl func_ov002_021b3ef8
    str r0, [sl, #0x10]
    mov r0, #0x1
    mov r1, #0xb
    ldr r2, _LIT0
    mov r3, r0
    bl func_ov002_021b3ef8
    str r0, [sl, #0x14]
    mov r0, #0x0
    mov r1, #0xb
    ldr r2, _LIT1
    bl func_ov002_021b3dec
    ldr r2, _LIT2
    str r0, [sl, #0x1c]
    mov r0, #0x0
    mov r1, #0xb
    bl func_ov002_021b3dec
    str r0, [sl, #0x20]
    ldr r2, _LIT3
    mov r0, #0x0
    mov r1, #0xb
    bl func_ov002_021b3dec
    str r0, [sl, #0x24]
    ldr r2, _LIT4
    mov r0, #0x0
    mov r1, #0xb
    bl func_ov002_021b3dec
    str r0, [sl, #0x28]
    ldr r2, _LIT5
    mov r0, #0x0
    mov r1, #0xb
    bl func_ov002_021b3dec
    str r0, [sl, #0x2c]
    ldr r0, _LIT6
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_164
    ldr r0, _LIT6
    bl func_ov002_021bb6d0
    ldr r1, [sl, #0x10]
    cmp r1, #0x0
    streq r0, [sl, #0x10]
    ldr r1, [sl, #0x14]
    cmp r1, #0x0
    streq r0, [sl, #0x14]
.L_164:
    mov r6, #0x0
    mov r4, r6
    mov r7, r6
.L_170:
    ldr r2, _LIT7
    ldr r0, _LIT8
    and r1, r4, #0x1
    mla r8, r1, r0, r2
    ldr r0, _LIT9
    rsb r9, r4, #0x1
    mov r5, #0x0
    sub fp, r0, #0x118
.L_190:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9dec
    cmp r0, fp
    bne .L_248
    ldrh r0, [r8, #0x38]
    cmp r0, #0x0
    beq .L_248
    ldr r1, [r8, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_248
    ldr r0, _LIT10
    add r1, r5, r7
    ldr r2, [r0, #0xd4]
    mov r0, #0x1
    tst r2, r0, lsl r1
    bne .L_248
    ldr r0, [sl, #0x2c]
    cmp r0, #0x0
    ldrneh r0, [r8, #0x36]
    cmpne r0, #0x0
    bne .L_248
    mov r0, r4
    mov r1, r5
    bl func_ov002_021bd630
    cmp r0, #0x0
    bne .L_248
    ldr r2, _LIT9
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b2f34
    cmp r0, #0x0
    bne .L_248
    mov r0, r9
    bl func_ov002_021bbe70
    cmp r0, #0x3
    bne .L_248
    cmp r6, #0x0
    beq .L_240
    ldrh r0, [r8, #0x34]
    cmp r6, r0
    ble .L_248
.L_240:
    ldrh r6, [r8, #0x34]
    str r9, [sp]
.L_248:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r8, r8, #0x14
    ble .L_190
    add r4, r4, #0x1
    cmp r4, #0x2
    add r7, r7, #0x10
    blt .L_170
    cmp r6, #0x0
    beq .L_2a8
    ldr r0, [sp]
    add r0, sl, r0, lsl #0x2
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    beq .L_28c
    cmp r0, r6
    ble .L_2a8
.L_28c:
    ldr r0, [sp]
    mov r1, #0x1
    add r0, sl, r0, lsl #0x2
    str r1, [r0, #0x10]
    str r1, [r0, #0x8]
    ldr r0, [sp]
    str r1, [sl, r0, lsl #0x2]
.L_2a8:
    mov r8, #0x0
    mov r6, r8
.L_2b0:
    add r0, sl, r8, lsl #0x2
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    bne .L_48c
    ldr r2, _LIT7
    ldr r0, _LIT8
    and r1, r8, #0x1
    mla r7, r1, r0, r2
    ldr r0, _LIT11
    rsb r4, r8, #0x1
    rsb r0, r0, #0x2d40
    str r0, [sp, #0x4]
    ldr r0, _LIT11
    mov r9, #0x0
    sub r0, r0, #0x3d
    str r0, [sp, #0x10]
    ldr r0, _LIT11
    sub r0, r0, #0x3d
    str r0, [sp, #0xc]
    ldr r0, _LIT12
    add r0, r0, #0x100
    str r0, [sp, #0x8]
    ldr r0, _LIT12
    add r0, r0, #0x33c
    str r0, [sp, #0x18]
    ldr r0, _LIT12
    add fp, r0, #0x100
    add r0, r0, #0x33c
    str r0, [sp, #0x14]
    ldr r0, _LIT13
    add r0, r0, #0x82
    str r0, [sp, #0x1c]
.L_330:
    mov r0, r8
    mov r1, r9
    bl func_ov002_021b9dec
    movs r5, r0
    ldrneh r0, [r7, #0x38]
    cmpne r0, #0x0
    beq .L_47c
    ldr r1, [r7, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_47c
    ldr r0, _LIT10
    add r1, r9, r6
    ldr r2, [r0, #0xd4]
    mov r0, #0x1
    tst r2, r0, lsl r1
    bne .L_47c
    ldr r0, [sl, #0x2c]
    cmp r0, #0x0
    ldrneh r0, [r7, #0x36]
    cmpne r0, #0x0
    bne .L_47c
    mov r0, r8
    mov r1, r9
    bl func_ov002_021bd630
    cmp r0, #0x0
    bne .L_47c
    ldr r2, [sp, #0x4]
    mov r0, r8
    mov r1, r9
    bl func_ov002_021b2f34
    cmp r0, #0x0
    bne .L_47c
    ldr r2, _LIT13
    mov r0, r8
    mov r1, r9
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_47c
    cmp r5, fp
    bgt .L_414
    ldr r0, [sp, #0x8]
    cmp r5, r0
    bge .L_470
    ldr r0, [sp, #0xc]
    cmp r5, r0
    bgt .L_400
    ldr r0, [sp, #0x10]
    cmp r5, r0
    beq .L_448
    b .L_47c
.L_400:
    ldr r0, _LIT12
    cmp r5, r0
    moveq r0, #0x1
    streq r0, [sl, #0x18]
    b .L_47c
.L_414:
    ldr r0, [sp, #0x14]
    cmp r5, r0
    bgt .L_430
    ldr r0, [sp, #0x18]
    cmp r5, r0
    beq .L_470
    b .L_47c
.L_430:
    ldr r0, [sp, #0x1c]
    cmp r5, r0
    moveq r0, #0x1
    streq r0, [sl, #0x20]
    streq r0, [sl, #0x1c]
    b .L_47c
.L_448:
    ldr r2, _LIT11
    mov r0, r8
    mov r1, r9
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    mov r0, #0x1
    strne r0, [sl, r4, lsl #0x2]
    streq r0, [sl, #0x4]
    streq r0, [sl]
    b .L_47c
.L_470:
    mov r0, #0x1
    str r0, [sl, #0xc]
    str r0, [sl, #0x8]
.L_47c:
    add r7, r7, #0x14
    add r9, r9, #0x1
    cmp r9, #0x4
    ble .L_330
.L_48c:
    add r8, r8, #0x1
    cmp r8, #0x2
    add r6, r6, #0x10
    blt .L_2b0
    ldr r0, [sl, #0x20]
    cmp r0, #0x0
    bne .L_4f0
    ldr r6, _LIT14
    mov r7, #0x0
    mov r4, #0x1
    mvn r5, #0x0
.L_4b8:
    add r0, sl, r7, lsl #0x2
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_4e4
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_ov002_021bad9c
    cmp r0, #0x0
    strne r4, [sl, #0x4]
    strne r4, [sl]
.L_4e4:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_4b8
.L_4f0:
    ldr r0, [sl, #0x1c]
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r6, #0x2
    ldr r7, _LIT15
    mov r4, #0x0
    mov r5, r6
.L_510:
    ldr r0, [sl, r4, lsl #0x2]
    cmp r0, #0x0
    bne .L_548
    mov r0, r4
    mov r1, r7
    bl func_ov002_021bb82c
    cmp r0, #0x0
    beq .L_548
    ldr r0, [sl]
    cmp r0, #0x0
    streq r6, [sl]
    ldr r0, [sl, #0x4]
    cmp r0, #0x0
    streq r5, [sl, #0x4]
.L_548:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_510
    ldr r0, _LIT16
    mov r8, #0x1
    ldr fp, _LIT17
    mov r9, #0x0
    sub r6, r0, #0x2d0
    mov r7, r8
    mov r5, r8
    mov r4, r8
.L_574:
    ldr r0, [sl, r9, lsl #0x2]
    cmp r0, #0x0
    bne .L_5d8
    mov r0, r9
    mov r1, fp
    bl func_ov002_021bb82c
    cmp r0, #0x0
    strne r8, [sl, #0xc]
    ldr r1, _LIT16
    strne r8, [sl, #0x8]
    mov r0, r9
    bl func_ov002_021bb82c
    cmp r0, #0x0
    strne r7, [sl, #0xc]
    mov r0, r9
    mov r1, r6
    strne r7, [sl, #0x8]
    bl func_ov002_021bb82c
    cmp r0, #0x0
    ldr r1, _LIT18
    mov r0, r9
    strne r5, [sl, #0x28]
    bl func_ov002_021bb82c
    cmp r0, #0x0
    strne r4, [sl, #0x18]
.L_5d8:
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_574
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001679
_LIT1: .word 0x00001351
_LIT2: .word 0x00001350
_LIT3: .word 0x0000134f
_LIT4: .word 0x0000134e
_LIT5: .word 0x000012bf
_LIT6: .word 0x0000166c
_LIT7: .word data_ov002_022cf08c
_LIT8: .word 0x00000868
_LIT9: .word 0x00001a6d
_LIT10: .word data_ov002_022d008c
_LIT11: .word 0x000012d3
_LIT12: .word 0x000014da
_LIT13: .word 0x00001944
_LIT14: .word 0x00001760
_LIT15: .word 0x00001302
_LIT16: .word 0x00001765
_LIT17: .word 0x00001360
_LIT18: .word 0x0000148e
