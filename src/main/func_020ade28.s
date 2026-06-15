; func_020ade28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c398c
        .extern data_02102ab0
        .extern data_02102abc
        .extern data_02102ac8
        .extern data_02102ad0
        .extern data_02102ad8
        .extern data_02102ae4
        .extern data_02102af0
        .extern data_02102af8
        .extern func_020a7268
        .extern func_020aaddc
        .extern func_020add04
        .extern func_020aee58
        .extern func_020b10e0
        .extern func_020b2ab4
        .global func_020ade28
        .arm
func_020ade28:
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
    bl func_020b10e0
    ldrb r0, [sp, #0x8]
    add r1, sp, #0x9
    add r0, r1, r0
    b .L_1024
.L_100c:
    ldrb r2, [sp, #0x8]
    ldrsh r1, [sp, #0x6]
    sub r2, r2, #0x1
    add r1, r1, #0x1
    strb r2, [sp, #0x8]
    strh r1, [sp, #0x6]
.L_1024:
    ldrb r1, [sp, #0x8]
    cmp r1, #0x1
    bls .L_103c
    ldrsb r1, [r0, #-1]!
    cmp r1, #0x30
    beq .L_100c
.L_103c:
    ldrb r0, [sp, #0x9]
    cmp r0, #0x30
    beq .L_105c
    cmp r0, #0x49
    beq .L_1068
    cmp r0, #0x4e
    beq .L_1120
    b .L_11cc
.L_105c:
    mov r0, #0x0
    strh r0, [sp, #0x6]
    b .L_11cc
.L_1068:
    mov r2, #0x0
    mov r0, sl
    mov r1, r8
    mov r3, r2
    bl func_020b2ab4
    bcs .L_10c8
    cmp r6, #0x80
    sub r4, r9, #0xa
    movcs r0, #0x0
    bcs .L_10a0
    ldr r0, _LIT1
    mov r1, r6, lsl #0x1
    ldrh r0, [r0, r1]
    and r0, r0, #0x200
.L_10a0:
    cmp r0, #0x0
    beq .L_10b8
    ldr r1, _LIT2
    mov r0, r4
    bl func_020aee58
    b .L_110c
.L_10b8:
    ldr r1, _LIT3
    mov r0, r4
    bl func_020aee58
    b .L_110c
.L_10c8:
    cmp r6, #0x80
    sub r4, r9, #0x8
    movcs r0, #0x0
    bcs .L_10e8
    ldr r0, _LIT1
    mov r1, r6, lsl #0x1
    ldrh r0, [r0, r1]
    and r0, r0, #0x200
.L_10e8:
    cmp r0, #0x0
    beq .L_1100
    ldr r1, _LIT4
    mov r0, r4
    bl func_020aee58
    b .L_110c
.L_1100:
    ldr r1, _LIT5
    mov r0, r4
    bl func_020aee58
.L_110c:
    add sp, sp, #0x22c
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_1120:
    ldrsb r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_1174
    cmp r6, #0x80
    sub r4, r9, #0xa
    movcs r0, #0x0
    bcs .L_114c
    ldr r0, _LIT1
    mov r1, r6, lsl #0x1
    ldrh r0, [r0, r1]
    and r0, r0, #0x200
.L_114c:
    cmp r0, #0x0
    beq .L_1164
    ldr r1, _LIT6
    mov r0, r4
    bl func_020aee58
    b .L_11b8
.L_1164:
    ldr r1, _LIT7
    mov r0, r4
    bl func_020aee58
    b .L_11b8
.L_1174:
    cmp r6, #0x80
    sub r4, r9, #0x8
    movcs r0, #0x0
    bcs .L_1194
    ldr r0, _LIT1
    mov r1, r6, lsl #0x1
    ldrh r0, [r0, r1]
    and r0, r0, #0x200
.L_1194:
    cmp r0, #0x0
    beq .L_11ac
    ldr r1, _LIT8
    mov r0, r4
    bl func_020aee58
    b .L_11b8
.L_11ac:
    ldr r1, _LIT9
    mov r0, r4
    bl func_020aee58
.L_11b8:
    add sp, sp, #0x22c
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_11cc:
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
    bgt .L_1228
    bge .L_12b4
    cmp r6, #0x47
    bgt .L_1574
    cmp r6, #0x45
    blt .L_1574
    beq .L_12b4
    cmp r6, #0x46
    beq .L_1400
    cmp r6, #0x47
    beq .L_1240
    b .L_1574
.L_1228:
    cmp r6, #0x66
    bgt .L_1238
    beq .L_1400
    b .L_1574
.L_1238:
    cmp r6, #0x67
    bne .L_1574
.L_1240:
    ldrb r0, [sp, #0x8]
    cmp r0, r7
    ble .L_1258
    add r0, sp, #0x4
    mov r1, r7
    bl func_020add04
.L_1258:
    ldrsh r2, [sp, #0x6]
    mvn r0, #0x3
    cmp r2, r0
    blt .L_1270
    cmp r2, r7
    blt .L_1290
.L_1270:
    cmp r5, #0x0
    ldreqb r0, [sp, #0x8]
    subne r7, r7, #0x1
    subeq r7, r0, #0x1
    cmp r6, #0x67
    moveq r6, #0x65
    movne r6, #0x45
    b .L_12b4
.L_1290:
    cmp r5, #0x0
    addne r0, r2, #0x1
    subne r7, r7, r0
    bne .L_1400
    ldrb r1, [sp, #0x8]
    add r0, r2, #0x1
    subs r7, r1, r0
    movmi r7, #0x0
    b .L_1400
.L_12b4:
    ldrb r0, [sp, #0x8]
    add r1, r7, #0x1
    cmp r0, r1
    ble .L_12cc
    add r0, sp, #0x4
    bl func_020add04
.L_12cc:
    ldrsh lr, [sp, #0x6]
    mov fp, #0x2b
    mov sl, #0x0
    cmp lr, #0x0
    rsblt lr, lr, #0x0
    movlt fp, #0x2d
    ldr r3, _LIT10
    mov r0, #0xa
    b .L_1320
.L_12f0:
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
.L_1320:
    cmp lr, #0x0
    bne .L_12f0
    cmp sl, #0x2
    blt .L_12f0
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
    bge .L_1390
    add r0, r7, #0x2
    sub r0, r0, r1
    subs r1, r0, #0x1
    beq .L_1390
    mov r0, #0x30
.L_1384:
    strb r0, [r8, #-1]!
    subs r1, r1, #0x1
    bne .L_1384
.L_1390:
    ldrb r1, [sp, #0x8]
    add r0, sp, #0x9
    add r2, r0, r1
    subs r1, r1, #0x1
    beq .L_13b4
.L_13a4:
    ldrsb r0, [r2, #-1]!
    subs r1, r1, #0x1
    strb r0, [r8, #-1]!
    bne .L_13a4
.L_13b4:
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
    bne .L_1574
    cmp r4, #0x1
    moveq r0, #0x2b
    streqb r0, [r8, #-1]!
    beq .L_1574
    cmp r4, #0x2
    moveq r0, #0x20
    streqb r0, [r8, #-1]!
    b .L_1574
.L_1400:
    ldrsh r3, [sp, #0x6]
    ldrb r2, [sp, #0x8]
    sub r0, r2, r3
    subs r1, r0, #0x1
    movmi r1, #0x0
    cmp r1, r7
    ble .L_1440
    sub r1, r1, r7
    add r0, sp, #0x4
    sub r1, r2, r1
    bl func_020add04
    ldrsh r3, [sp, #0x6]
    ldrb r2, [sp, #0x8]
    sub r0, r2, r3
    subs r1, r0, #0x1
    movmi r1, #0x0
.L_1440:
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
    ble .L_1494
    mov r3, #0x30
.L_1484:
    add sl, sl, #0x1
    cmp sl, r6
    strb r3, [r8, #-1]!
    blt .L_1484
.L_1494:
    mov r6, #0x0
    b .L_14a8
.L_149c:
    ldrsb r3, [r2, #-1]!
    add r6, r6, #0x1
    strb r3, [r8, #-1]!
.L_14a8:
    cmp r6, r1
    ldrltb r3, [sp, #0x8]
    cmplt r6, r3
    blt .L_149c
    cmp r6, r1
    bge .L_14d4
    mov r3, #0x30
.L_14c4:
    add r6, r6, #0x1
    cmp r6, r1
    strb r3, [r8, #-1]!
    blt .L_14c4
.L_14d4:
    cmp r7, #0x0
    cmpeq r5, #0x0
    movne r1, #0x2e
    strneb r1, [r8, #-1]!
    cmp r0, #0x0
    beq .L_153c
    ldrb r1, [sp, #0x8]
    mov r5, #0x0
    sub r1, r0, r1
    cmp r1, #0x0
    ble .L_151c
    mov r3, #0x30
.L_1504:
    strb r3, [r8, #-1]!
    ldrb r1, [sp, #0x8]
    add r5, r5, #0x1
    sub r1, r0, r1
    cmp r5, r1
    blt .L_1504
.L_151c:
    cmp r5, r0
    bge .L_1544
.L_1524:
    ldrsb r1, [r2, #-1]!
    add r5, r5, #0x1
    cmp r5, r0
    strb r1, [r8, #-1]!
    blt .L_1524
    b .L_1544
.L_153c:
    mov r0, #0x30
    strb r0, [r8, #-1]!
.L_1544:
    ldrsb r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x2d
    strneb r0, [r8, #-1]!
    bne .L_1574
    cmp r4, #0x1
    moveq r0, #0x2b
    streqb r0, [r8, #-1]!
    beq .L_1574
    cmp r4, #0x2
    moveq r0, #0x20
    streqb r0, [r8, #-1]!
.L_1574:
    mov r0, r8
    bl func_020aaddc
    sub r1, r9, r0, lsl #0x1
    mov r0, r8
    sub r4, r1, #0x2
    bl func_020aaddc
    mov r2, r0
    mov r0, r4
    mov r1, r8
    bl func_020a7268
    mov r0, r4
    add sp, sp, #0x22c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word 0x000001fd
_LIT1: .word data_020c398c
_LIT2: .word data_02102ab0
_LIT3: .word data_02102abc
_LIT4: .word data_02102ac8
_LIT5: .word data_02102ad0
_LIT6: .word data_02102ad8
_LIT7: .word data_02102ae4
_LIT8: .word data_02102af0
_LIT9: .word data_02102af8
_LIT10: .word 0x66666667
