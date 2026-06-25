; func_020a84f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3660
        .extern data_02102988
        .extern data_02102990
        .extern data_02102998
        .extern data_0210299c
        .extern data_021029a0
        .extern data_021029a8
        .extern data_021029b0
        .extern data_021029b4
        .extern func_020a83d4
        .extern func_020b0fec
        .extern func_020b29c0
        .global func_020a84f8
        .arm
func_020a84f8:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    ldr r7, [sp, #0x68]
    ldr r3, _LIT0
    ldrb r6, [sp, #0x61]
    ldrb r5, [sp, #0x5f]
    ldrb r4, [sp, #0x5d]
    cmp r7, r3
    mov sl, r0
    mov r8, r1
    mov r9, r2
    addgt sp, sp, #0x2c
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
    b .L_90
.L_78:
    ldrb r2, [sp, #0x8]
    ldrsh r1, [sp, #0x6]
    sub r2, r2, #0x1
    add r1, r1, #0x1
    strb r2, [sp, #0x8]
    strh r1, [sp, #0x6]
.L_90:
    ldrb r1, [sp, #0x8]
    cmp r1, #0x1
    bls .L_a8
    ldrsb r1, [r0, #-1]!
    cmp r1, #0x30
    beq .L_78
.L_a8:
    ldrb r0, [sp, #0x9]
    cmp r0, #0x30
    beq .L_c8
    cmp r0, #0x49
    beq .L_d4
    cmp r0, #0x4e
    beq .L_234
    b .L_388
.L_c8:
    mov r0, #0x0
    strh r0, [sp, #0x6]
    b .L_388
.L_d4:
    mov r2, #0x0
    mov r0, sl
    mov r1, r8
    mov r3, r2
    bl func_020b29c0
    bcs .L_198
    cmp r6, #0x0
    sub r0, r9, #0x5
    blt .L_100
    cmp r6, #0x80
    blt .L_108
.L_100:
    mov r1, #0x0
    b .L_118
.L_108:
    ldr r1, _LIT1
    mov r2, r6, lsl #0x1
    ldrh r1, [r1, r2]
    and r1, r1, #0x200
.L_118:
    cmp r1, #0x0
    beq .L_15c
    ldr r3, _LIT2
    add sp, sp, #0x2c
    ldrb r2, [r3]
    ldrb r1, [r3, #0x1]
    strb r2, [r0]
    strb r1, [r0, #0x1]
    ldrb r2, [r3, #0x2]
    ldrb r1, [r3, #0x3]
    strb r2, [r0, #0x2]
    strb r1, [r0, #0x3]
    ldrb r1, [r3, #0x4]
    strb r1, [r0, #0x4]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_15c:
    ldr r3, _LIT3
    add sp, sp, #0x2c
    ldrb r2, [r3]
    ldrb r1, [r3, #0x1]
    strb r2, [r0]
    strb r1, [r0, #0x1]
    ldrb r2, [r3, #0x2]
    ldrb r1, [r3, #0x3]
    strb r2, [r0, #0x2]
    strb r1, [r0, #0x3]
    ldrb r1, [r3, #0x4]
    strb r1, [r0, #0x4]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_198:
    cmp r6, #0x0
    sub r0, r9, #0x4
    blt .L_1ac
    cmp r6, #0x80
    blt .L_1b4
.L_1ac:
    mov r1, #0x0
    b .L_1c4
.L_1b4:
    ldr r1, _LIT1
    mov r2, r6, lsl #0x1
    ldrh r1, [r1, r2]
    and r1, r1, #0x200
.L_1c4:
    cmp r1, #0x0
    beq .L_200
    ldr r3, _LIT4
    add sp, sp, #0x2c
    ldrb r2, [r3]
    ldrb r1, [r3, #0x1]
    strb r2, [r0]
    strb r1, [r0, #0x1]
    ldrb r2, [r3, #0x2]
    ldrb r1, [r3, #0x3]
    strb r2, [r0, #0x2]
    strb r1, [r0, #0x3]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_200:
    ldr r3, _LIT5
    add sp, sp, #0x2c
    ldrb r2, [r3]
    ldrb r1, [r3, #0x1]
    strb r2, [r0]
    strb r1, [r0, #0x1]
    ldrb r2, [r3, #0x2]
    ldrb r1, [r3, #0x3]
    strb r2, [r0, #0x2]
    strb r1, [r0, #0x3]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_234:
    ldrsb r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_2ec
    cmp r6, #0x0
    sub r0, r9, #0x5
    blt .L_254
    cmp r6, #0x80
    blt .L_25c
.L_254:
    mov r1, #0x0
    b .L_26c
.L_25c:
    ldr r1, _LIT1
    mov r2, r6, lsl #0x1
    ldrh r1, [r1, r2]
    and r1, r1, #0x200
.L_26c:
    cmp r1, #0x0
    beq .L_2b0
    ldr r3, _LIT6
    add sp, sp, #0x2c
    ldrb r2, [r3]
    ldrb r1, [r3, #0x1]
    strb r2, [r0]
    strb r1, [r0, #0x1]
    ldrb r2, [r3, #0x2]
    ldrb r1, [r3, #0x3]
    strb r2, [r0, #0x2]
    strb r1, [r0, #0x3]
    ldrb r1, [r3, #0x4]
    strb r1, [r0, #0x4]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_2b0:
    ldr r3, _LIT7
    add sp, sp, #0x2c
    ldrb r2, [r3]
    ldrb r1, [r3, #0x1]
    strb r2, [r0]
    strb r1, [r0, #0x1]
    ldrb r2, [r3, #0x2]
    ldrb r1, [r3, #0x3]
    strb r2, [r0, #0x2]
    strb r1, [r0, #0x3]
    ldrb r1, [r3, #0x4]
    strb r1, [r0, #0x4]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_2ec:
    cmp r6, #0x0
    sub r0, r9, #0x4
    blt .L_300
    cmp r6, #0x80
    blt .L_308
.L_300:
    mov r1, #0x0
    b .L_318
.L_308:
    ldr r1, _LIT1
    mov r2, r6, lsl #0x1
    ldrh r1, [r1, r2]
    and r1, r1, #0x200
.L_318:
    cmp r1, #0x0
    beq .L_354
    ldr r3, _LIT8
    add sp, sp, #0x2c
    ldrb r2, [r3]
    ldrb r1, [r3, #0x1]
    strb r2, [r0]
    strb r1, [r0, #0x1]
    ldrb r2, [r3, #0x2]
    ldrb r1, [r3, #0x3]
    strb r2, [r0, #0x2]
    strb r1, [r0, #0x3]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_354:
    ldr r3, _LIT9
    add sp, sp, #0x2c
    ldrb r2, [r3]
    ldrb r1, [r3, #0x1]
    strb r2, [r0]
    strb r1, [r0, #0x1]
    ldrb r2, [r3, #0x2]
    ldrb r1, [r3, #0x3]
    strb r2, [r0, #0x2]
    strb r1, [r0, #0x3]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_388:
    ldrb r0, [sp, #0x8]
    ldrsh r1, [sp, #0x6]
    sub r8, r9, #0x1
    sub r0, r0, #0x1
    add r0, r1, r0
    strh r0, [sp, #0x6]
    mov r0, #0x0
    strb r0, [r8]
    cmp r6, #0x65
    bgt .L_3dc
    bge .L_468
    cmp r6, #0x47
    bgt .L_724
    cmp r6, #0x45
    blt .L_724
    beq .L_468
    cmp r6, #0x46
    beq .L_5b0
    cmp r6, #0x47
    beq .L_3f4
    b .L_724
.L_3dc:
    cmp r6, #0x66
    bgt .L_3ec
    beq .L_5b0
    b .L_724
.L_3ec:
    cmp r6, #0x67
    bne .L_724
.L_3f4:
    ldrb r0, [sp, #0x8]
    cmp r0, r7
    ble .L_40c
    add r0, sp, #0x4
    mov r1, r7
    bl func_020a83d4
.L_40c:
    ldrsh r2, [sp, #0x6]
    mvn r0, #0x3
    cmp r2, r0
    blt .L_424
    cmp r2, r7
    blt .L_444
.L_424:
    cmp r5, #0x0
    ldreqb r0, [sp, #0x8]
    subne r7, r7, #0x1
    subeq r7, r0, #0x1
    cmp r6, #0x67
    moveq r6, #0x65
    movne r6, #0x45
    b .L_468
.L_444:
    cmp r5, #0x0
    addne r0, r2, #0x1
    subne r7, r7, r0
    bne .L_5b0
    ldrb r1, [sp, #0x8]
    add r0, r2, #0x1
    subs r7, r1, r0
    movmi r7, #0x0
    b .L_5b0
.L_468:
    ldrb r0, [sp, #0x8]
    add r1, r7, #0x1
    cmp r0, r1
    ble .L_480
    add r0, sp, #0x4
    bl func_020a83d4
.L_480:
    ldrsh lr, [sp, #0x6]
    mov fp, #0x2b
    mov sl, #0x0
    cmp lr, #0x0
    rsblt lr, lr, #0x0
    movlt fp, #0x2d
    ldr r3, _LIT10
    mov r0, #0xa
    b .L_4d4
.L_4a4:
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
.L_4d4:
    cmp lr, #0x0
    bne .L_4a4
    cmp sl, #0x2
    blt .L_4a4
    strb fp, [r8, #-1]
    strb r6, [r8, #-2]!
    sub r1, r9, r8
    ldr r0, _LIT0
    add r1, r7, r1
    cmp r1, r0
    addgt sp, sp, #0x2c
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addgt sp, sp, #0x10
    bxgt lr
    ldrb r1, [sp, #0x8]
    add r0, r7, #0x1
    cmp r1, r0
    bge .L_540
    add r0, r7, #0x2
    sub r0, r0, r1
    subs r1, r0, #0x1
    beq .L_540
    mov r0, #0x30
.L_534:
    strb r0, [r8, #-1]!
    subs r1, r1, #0x1
    bne .L_534
.L_540:
    ldrb r1, [sp, #0x8]
    add r0, sp, #0x9
    add r2, r0, r1
    subs r1, r1, #0x1
    beq .L_564
.L_554:
    ldrsb r0, [r2, #-1]!
    subs r1, r1, #0x1
    strb r0, [r8, #-1]!
    bne .L_554
.L_564:
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
    bne .L_724
    cmp r4, #0x1
    moveq r0, #0x2b
    streqb r0, [r8, #-1]!
    beq .L_724
    cmp r4, #0x2
    moveq r0, #0x20
    streqb r0, [r8, #-1]!
    b .L_724
.L_5b0:
    ldrsh r3, [sp, #0x6]
    ldrb r2, [sp, #0x8]
    sub r0, r2, r3
    subs r1, r0, #0x1
    movmi r1, #0x0
    cmp r1, r7
    ble .L_5f0
    sub r1, r1, r7
    add r0, sp, #0x4
    sub r1, r2, r1
    bl func_020a83d4
    ldrsh r3, [sp, #0x6]
    ldrb r2, [sp, #0x8]
    sub r0, r2, r3
    subs r1, r0, #0x1
    movmi r1, #0x0
.L_5f0:
    adds r0, r3, #0x1
    movmi r0, #0x0
    ldr r3, _LIT0
    add r6, r0, r1
    cmp r6, r3
    addgt sp, sp, #0x2c
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addgt sp, sp, #0x10
    bxgt lr
    add r3, sp, #0x9
    sub r6, r7, r1
    cmp r6, #0x0
    add r2, r3, r2
    mov r9, #0x0
    ble .L_644
    mov r3, #0x30
.L_634:
    add r9, r9, #0x1
    cmp r9, r6
    strb r3, [r8, #-1]!
    blt .L_634
.L_644:
    mov r6, #0x0
    b .L_658
.L_64c:
    ldrsb r3, [r2, #-1]!
    add r6, r6, #0x1
    strb r3, [r8, #-1]!
.L_658:
    cmp r6, r1
    ldrltb r3, [sp, #0x8]
    cmplt r6, r3
    blt .L_64c
    cmp r6, r1
    bge .L_684
    mov r3, #0x30
.L_674:
    add r6, r6, #0x1
    cmp r6, r1
    strb r3, [r8, #-1]!
    blt .L_674
.L_684:
    cmp r7, #0x0
    cmpeq r5, #0x0
    movne r1, #0x2e
    strneb r1, [r8, #-1]!
    cmp r0, #0x0
    beq .L_6ec
    ldrb r1, [sp, #0x8]
    mov r5, #0x0
    sub r1, r0, r1
    cmp r1, #0x0
    ble .L_6cc
    mov r3, #0x30
.L_6b4:
    strb r3, [r8, #-1]!
    ldrb r1, [sp, #0x8]
    add r5, r5, #0x1
    sub r1, r0, r1
    cmp r5, r1
    blt .L_6b4
.L_6cc:
    cmp r5, r0
    bge .L_6f4
.L_6d4:
    ldrsb r1, [r2, #-1]!
    add r5, r5, #0x1
    cmp r5, r0
    strb r1, [r8, #-1]!
    blt .L_6d4
    b .L_6f4
.L_6ec:
    mov r0, #0x30
    strb r0, [r8, #-1]!
.L_6f4:
    ldrsb r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x2d
    strneb r0, [r8, #-1]!
    bne .L_724
    cmp r4, #0x1
    moveq r0, #0x2b
    streqb r0, [r8, #-1]!
    beq .L_724
    cmp r4, #0x2
    moveq r0, #0x20
    streqb r0, [r8, #-1]!
.L_724:
    mov r0, r8
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word 0x000001fd
_LIT1: .word data_020c3660
_LIT2: .word data_02102988
_LIT3: .word data_02102990
_LIT4: .word data_02102998
_LIT5: .word data_0210299c
_LIT6: .word data_021029a0
_LIT7: .word data_021029a8
_LIT8: .word data_021029b0
_LIT9: .word data_021029b4
_LIT10: .word 0x66666667
