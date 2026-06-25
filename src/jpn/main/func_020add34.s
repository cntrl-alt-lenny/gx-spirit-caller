; func_020add34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3898
        .extern data_021029d0
        .extern data_021029dc
        .extern data_021029e8
        .extern data_021029f0
        .extern data_021029f8
        .extern data_02102a04
        .extern data_02102a10
        .extern data_02102a18
        .extern func_020a7174
        .extern func_020aace8
        .extern func_020adc10
        .extern func_020aed64
        .extern func_020b0fec
        .extern func_020b29c0
        .global func_020add34
        .arm
func_020add34:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x22c
    mov sl, r0
    add r0, sp, #0x250
    ldr r7, [sp, #0x268]
    ldr r3, _LIT0
    ldrh r6, [r0, #0x12]
    cmp r7, r3
    ldrb r5, [sp, #0x25f]
    ldrb r4, [sp, #0x25d]
    mov r8, r1
    mov r9, r2
    addgt sp, sp, #0x22c
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addgt sp, sp, #0x10
    bxgt lr
    mov ip, #0x0
    mov fp, #0x20
    add r0, sp, #0x0
    add r3, sp, #0x4
    mov r1, sl
    mov r2, r8
    strb ip, [sp]
    strh fp, [sp, #0x2]
    bl func_020b0fec
    ldrb r0, [sp, #0x8]
    add r1, sp, #0x9
    add r0, r1, r0
    b .L_94
.L_7c:
    ldrb r2, [sp, #0x8]
    ldrsh r1, [sp, #0x6]
    sub r2, r2, #0x1
    add r1, r1, #0x1
    strb r2, [sp, #0x8]
    strh r1, [sp, #0x6]
.L_94:
    ldrb r1, [sp, #0x8]
    cmp r1, #0x1
    bls .L_ac
    ldrsb r1, [r0, #-1]!
    cmp r1, #0x30
    beq .L_7c
.L_ac:
    ldrb r0, [sp, #0x9]
    cmp r0, #0x30
    beq .L_cc
    cmp r0, #0x49
    beq .L_d8
    cmp r0, #0x4e
    beq .L_190
    b .L_23c
.L_cc:
    mov r0, #0x0
    strh r0, [sp, #0x6]
    b .L_23c
.L_d8:
    mov r2, #0x0
    mov r0, sl
    mov r1, r8
    mov r3, r2
    bl func_020b29c0
    bcs .L_138
    cmp r6, #0x80
    sub r4, r9, #0xa
    movcs r0, #0x0
    bcs .L_110
    ldr r0, _LIT1
    mov r1, r6, lsl #0x1
    ldrh r0, [r0, r1]
    and r0, r0, #0x200
.L_110:
    cmp r0, #0x0
    beq .L_128
    ldr r1, _LIT2
    mov r0, r4
    bl func_020aed64
    b .L_17c
.L_128:
    ldr r1, _LIT3
    mov r0, r4
    bl func_020aed64
    b .L_17c
.L_138:
    cmp r6, #0x80
    sub r4, r9, #0x8
    movcs r0, #0x0
    bcs .L_158
    ldr r0, _LIT1
    mov r1, r6, lsl #0x1
    ldrh r0, [r0, r1]
    and r0, r0, #0x200
.L_158:
    cmp r0, #0x0
    beq .L_170
    ldr r1, _LIT4
    mov r0, r4
    bl func_020aed64
    b .L_17c
.L_170:
    ldr r1, _LIT5
    mov r0, r4
    bl func_020aed64
.L_17c:
    add sp, sp, #0x22c
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_190:
    ldrsb r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_1e4
    cmp r6, #0x80
    sub r4, r9, #0xa
    movcs r0, #0x0
    bcs .L_1bc
    ldr r0, _LIT1
    mov r1, r6, lsl #0x1
    ldrh r0, [r0, r1]
    and r0, r0, #0x200
.L_1bc:
    cmp r0, #0x0
    beq .L_1d4
    ldr r1, _LIT6
    mov r0, r4
    bl func_020aed64
    b .L_228
.L_1d4:
    ldr r1, _LIT7
    mov r0, r4
    bl func_020aed64
    b .L_228
.L_1e4:
    cmp r6, #0x80
    sub r4, r9, #0x8
    movcs r0, #0x0
    bcs .L_204
    ldr r0, _LIT1
    mov r1, r6, lsl #0x1
    ldrh r0, [r0, r1]
    and r0, r0, #0x200
.L_204:
    cmp r0, #0x0
    beq .L_21c
    ldr r1, _LIT8
    mov r0, r4
    bl func_020aed64
    b .L_228
.L_21c:
    ldr r1, _LIT9
    mov r0, r4
    bl func_020aed64
.L_228:
    add sp, sp, #0x22c
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_23c:
    ldrb r1, [sp, #0x8]
    ldrsh r2, [sp, #0x6]
    add r0, sp, #0x200
    sub r1, r1, #0x1
    add r0, r0, #0x2a
    add r1, r2, r1
    sub r8, r0, #0x1
    strh r1, [sp, #0x6]
    mov r0, #0x0
    strb r0, [r8]
    cmp r6, #0x65
    bgt .L_298
    bge .L_324
    cmp r6, #0x47
    bgt .L_5e4
    cmp r6, #0x45
    blt .L_5e4
    beq .L_324
    cmp r6, #0x46
    beq .L_470
    cmp r6, #0x47
    beq .L_2b0
    b .L_5e4
.L_298:
    cmp r6, #0x66
    bgt .L_2a8
    beq .L_470
    b .L_5e4
.L_2a8:
    cmp r6, #0x67
    bne .L_5e4
.L_2b0:
    ldrb r0, [sp, #0x8]
    cmp r0, r7
    ble .L_2c8
    add r0, sp, #0x4
    mov r1, r7
    bl func_020adc10
.L_2c8:
    ldrsh r2, [sp, #0x6]
    mvn r0, #0x3
    cmp r2, r0
    blt .L_2e0
    cmp r2, r7
    blt .L_300
.L_2e0:
    cmp r5, #0x0
    ldreqb r0, [sp, #0x8]
    subne r7, r7, #0x1
    subeq r7, r0, #0x1
    cmp r6, #0x67
    moveq r6, #0x65
    movne r6, #0x45
    b .L_324
.L_300:
    cmp r5, #0x0
    addne r0, r2, #0x1
    subne r7, r7, r0
    bne .L_470
    ldrb r1, [sp, #0x8]
    add r0, r2, #0x1
    subs r7, r1, r0
    movmi r7, #0x0
    b .L_470
.L_324:
    ldrb r0, [sp, #0x8]
    add r1, r7, #0x1
    cmp r0, r1
    ble .L_33c
    add r0, sp, #0x4
    bl func_020adc10
.L_33c:
    ldrsh lr, [sp, #0x6]
    mov fp, #0x2b
    mov sl, #0x0
    cmp lr, #0x0
    rsblt lr, lr, #0x0
    movlt fp, #0x2d
    ldr r3, _LIT10
    mov r0, #0xa
    b .L_390
.L_360:
    mov r1, lr, lsr #0x1f
    smull r2, ip, r3, lr
    add ip, r1, ip, asr #0x2
    smull r1, r2, r0, ip
    sub ip, lr, r1
    add r1, ip, #0x30
    strb r1, [r8, #-1]!
    mov r2, lr
    smull r1, lr, r3, r2
    mov r1, r2, lsr #0x1f
    add lr, r1, lr, asr #0x2
    add sl, sl, #0x1
.L_390:
    cmp lr, #0x0
    bne .L_360
    cmp sl, #0x2
    blt .L_360
    add r0, sp, #0x2a
    strb fp, [r8, #-1]
    strb r6, [r8, #-2]!
    sub r1, r0, r8
    ldr r0, _LIT0
    add r1, r1, r7
    cmp r1, r0
    addgt sp, sp, #0x22c
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addgt sp, sp, #0x10
    bxgt lr
    ldrb r1, [sp, #0x8]
    add r0, r7, #0x1
    cmp r1, r0
    bge .L_400
    add r0, r7, #0x2
    sub r0, r0, r1
    subs r1, r0, #0x1
    beq .L_400
    mov r0, #0x30
.L_3f4:
    strb r0, [r8, #-1]!
    subs r1, r1, #0x1
    bne .L_3f4
.L_400:
    ldrb r1, [sp, #0x8]
    add r0, sp, #0x9
    add r2, r0, r1
    subs r1, r1, #0x1
    beq .L_424
.L_414:
    ldrsb r0, [r2, #-1]!
    subs r1, r1, #0x1
    strb r0, [r8, #-1]!
    bne .L_414
.L_424:
    cmp r7, #0x0
    cmpeq r5, #0x0
    movne r0, #0x2e
    strneb r0, [r8, #-1]!
    ldrb r0, [sp, #0x9]
    strb r0, [r8, #-1]!
    ldrsb r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x2d
    strneb r0, [r8, #-1]!
    bne .L_5e4
    cmp r4, #0x1
    moveq r0, #0x2b
    streqb r0, [r8, #-1]!
    beq .L_5e4
    cmp r4, #0x2
    moveq r0, #0x20
    streqb r0, [r8, #-1]!
    b .L_5e4
.L_470:
    ldrsh r3, [sp, #0x6]
    ldrb r2, [sp, #0x8]
    sub r0, r2, r3
    subs r1, r0, #0x1
    movmi r1, #0x0
    cmp r1, r7
    ble .L_4b0
    sub r1, r1, r7
    add r0, sp, #0x4
    sub r1, r2, r1
    bl func_020adc10
    ldrsh r3, [sp, #0x6]
    ldrb r2, [sp, #0x8]
    sub r0, r2, r3
    subs r1, r0, #0x1
    movmi r1, #0x0
.L_4b0:
    adds r0, r3, #0x1
    movmi r0, #0x0
    ldr r3, _LIT0
    add r6, r0, r1
    cmp r6, r3
    addgt sp, sp, #0x22c
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addgt sp, sp, #0x10
    bxgt lr
    add r3, sp, #0x9
    sub r6, r7, r1
    cmp r6, #0x0
    add r2, r3, r2
    mov sl, #0x0
    ble .L_504
    mov r3, #0x30
.L_4f4:
    add sl, sl, #0x1
    cmp sl, r6
    strb r3, [r8, #-1]!
    blt .L_4f4
.L_504:
    mov r6, #0x0
    b .L_518
.L_50c:
    ldrsb r3, [r2, #-1]!
    add r6, r6, #0x1
    strb r3, [r8, #-1]!
.L_518:
    cmp r6, r1
    ldrltb r3, [sp, #0x8]
    cmplt r6, r3
    blt .L_50c
    cmp r6, r1
    bge .L_544
    mov r3, #0x30
.L_534:
    add r6, r6, #0x1
    cmp r6, r1
    strb r3, [r8, #-1]!
    blt .L_534
.L_544:
    cmp r7, #0x0
    cmpeq r5, #0x0
    movne r1, #0x2e
    strneb r1, [r8, #-1]!
    cmp r0, #0x0
    beq .L_5ac
    ldrb r1, [sp, #0x8]
    mov r5, #0x0
    sub r1, r0, r1
    cmp r1, #0x0
    ble .L_58c
    mov r3, #0x30
.L_574:
    strb r3, [r8, #-1]!
    ldrb r1, [sp, #0x8]
    add r5, r5, #0x1
    sub r1, r0, r1
    cmp r5, r1
    blt .L_574
.L_58c:
    cmp r5, r0
    bge .L_5b4
.L_594:
    ldrsb r1, [r2, #-1]!
    add r5, r5, #0x1
    cmp r5, r0
    strb r1, [r8, #-1]!
    blt .L_594
    b .L_5b4
.L_5ac:
    mov r0, #0x30
    strb r0, [r8, #-1]!
.L_5b4:
    ldrsb r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x2d
    strneb r0, [r8, #-1]!
    bne .L_5e4
    cmp r4, #0x1
    moveq r0, #0x2b
    streqb r0, [r8, #-1]!
    beq .L_5e4
    cmp r4, #0x2
    moveq r0, #0x20
    streqb r0, [r8, #-1]!
.L_5e4:
    mov r0, r8
    bl func_020aace8
    sub r1, r9, r0, lsl #0x1
    mov r0, r8
    sub r4, r1, #0x2
    bl func_020aace8
    mov r2, r0
    mov r0, r4
    mov r1, r8
    bl func_020a7174
    mov r0, r4
    add sp, sp, #0x22c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word 0x000001fd
_LIT1: .word data_020c3898
_LIT2: .word data_021029d0
_LIT3: .word data_021029dc
_LIT4: .word data_021029e8
_LIT5: .word data_021029f0
_LIT6: .word data_021029f8
_LIT7: .word data_02102a04
_LIT8: .word data_02102a10
_LIT9: .word data_02102a18
_LIT10: .word 0x66666667
