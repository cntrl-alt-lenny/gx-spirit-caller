; func_020a85ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3754
        .extern data_02102a68
        .extern data_02102a70
        .extern data_02102a78
        .extern data_02102a7c
        .extern data_02102a80
        .extern data_02102a88
        .extern data_02102a90
        .extern data_02102a94
        .extern func_020a84c8
        .extern func_020b10e0
        .extern func_020b2ab4
        .global func_020a85ec
        .arm
func_020a85ec:
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
    bl func_020b10e0
    ldrb r0, [sp, #0x8]
    add r1, sp, #0x9
    add r0, r1, r0
    b .L_1294
.L_127c:
    ldrb r2, [sp, #0x8]
    ldrsh r1, [sp, #0x6]
    sub r2, r2, #0x1
    add r1, r1, #0x1
    strb r2, [sp, #0x8]
    strh r1, [sp, #0x6]
.L_1294:
    ldrb r1, [sp, #0x8]
    cmp r1, #0x1
    bls .L_12ac
    ldrsb r1, [r0, #-1]!
    cmp r1, #0x30
    beq .L_127c
.L_12ac:
    ldrb r0, [sp, #0x9]
    cmp r0, #0x30
    beq .L_12cc
    cmp r0, #0x49
    beq .L_12d8
    cmp r0, #0x4e
    beq .L_1438
    b .L_158c
.L_12cc:
    mov r0, #0x0
    strh r0, [sp, #0x6]
    b .L_158c
.L_12d8:
    mov r2, #0x0
    mov r0, sl
    mov r1, r8
    mov r3, r2
    bl func_020b2ab4
    bcs .L_139c
    cmp r6, #0x0
    sub r0, r9, #0x5
    blt .L_1304
    cmp r6, #0x80
    blt .L_130c
.L_1304:
    mov r1, #0x0
    b .L_131c
.L_130c:
    ldr r1, _LIT1
    mov r2, r6, lsl #0x1
    ldrh r1, [r1, r2]
    and r1, r1, #0x200
.L_131c:
    cmp r1, #0x0
    beq .L_1360
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
.L_1360:
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
.L_139c:
    cmp r6, #0x0
    sub r0, r9, #0x4
    blt .L_13b0
    cmp r6, #0x80
    blt .L_13b8
.L_13b0:
    mov r1, #0x0
    b .L_13c8
.L_13b8:
    ldr r1, _LIT1
    mov r2, r6, lsl #0x1
    ldrh r1, [r1, r2]
    and r1, r1, #0x200
.L_13c8:
    cmp r1, #0x0
    beq .L_1404
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
.L_1404:
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
.L_1438:
    ldrsb r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_14f0
    cmp r6, #0x0
    sub r0, r9, #0x5
    blt .L_1458
    cmp r6, #0x80
    blt .L_1460
.L_1458:
    mov r1, #0x0
    b .L_1470
.L_1460:
    ldr r1, _LIT1
    mov r2, r6, lsl #0x1
    ldrh r1, [r1, r2]
    and r1, r1, #0x200
.L_1470:
    cmp r1, #0x0
    beq .L_14b4
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
.L_14b4:
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
.L_14f0:
    cmp r6, #0x0
    sub r0, r9, #0x4
    blt .L_1504
    cmp r6, #0x80
    blt .L_150c
.L_1504:
    mov r1, #0x0
    b .L_151c
.L_150c:
    ldr r1, _LIT1
    mov r2, r6, lsl #0x1
    ldrh r1, [r1, r2]
    and r1, r1, #0x200
.L_151c:
    cmp r1, #0x0
    beq .L_1558
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
.L_1558:
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
.L_158c:
    ldrb r0, [sp, #0x8]
    ldrsh r1, [sp, #0x6]
    sub r8, r9, #0x1
    sub r0, r0, #0x1
    add r0, r1, r0
    strh r0, [sp, #0x6]
    mov r0, #0x0
    strb r0, [r8]
    cmp r6, #0x65
    bgt .L_15e0
    bge .L_166c
    cmp r6, #0x47
    bgt .L_1928
    cmp r6, #0x45
    blt .L_1928
    beq .L_166c
    cmp r6, #0x46
    beq .L_17b4
    cmp r6, #0x47
    beq .L_15f8
    b .L_1928
.L_15e0:
    cmp r6, #0x66
    bgt .L_15f0
    beq .L_17b4
    b .L_1928
.L_15f0:
    cmp r6, #0x67
    bne .L_1928
.L_15f8:
    ldrb r0, [sp, #0x8]
    cmp r0, r7
    ble .L_1610
    add r0, sp, #0x4
    mov r1, r7
    bl func_020a84c8
.L_1610:
    ldrsh r2, [sp, #0x6]
    mvn r0, #0x3
    cmp r2, r0
    blt .L_1628
    cmp r2, r7
    blt .L_1648
.L_1628:
    cmp r5, #0x0
    ldreqb r0, [sp, #0x8]
    subne r7, r7, #0x1
    subeq r7, r0, #0x1
    cmp r6, #0x67
    moveq r6, #0x65
    movne r6, #0x45
    b .L_166c
.L_1648:
    cmp r5, #0x0
    addne r0, r2, #0x1
    subne r7, r7, r0
    bne .L_17b4
    ldrb r1, [sp, #0x8]
    add r0, r2, #0x1
    subs r7, r1, r0
    movmi r7, #0x0
    b .L_17b4
.L_166c:
    ldrb r0, [sp, #0x8]
    add r1, r7, #0x1
    cmp r0, r1
    ble .L_1684
    add r0, sp, #0x4
    bl func_020a84c8
.L_1684:
    ldrsh lr, [sp, #0x6]
    mov fp, #0x2b
    mov sl, #0x0
    cmp lr, #0x0
    rsblt lr, lr, #0x0
    movlt fp, #0x2d
    ldr r3, _LIT10
    mov r0, #0xa
    b .L_16d8
.L_16a8:
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
.L_16d8:
    cmp lr, #0x0
    bne .L_16a8
    cmp sl, #0x2
    blt .L_16a8
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
    bge .L_1744
    add r0, r7, #0x2
    sub r0, r0, r1
    subs r1, r0, #0x1
    beq .L_1744
    mov r0, #0x30
.L_1738:
    strb r0, [r8, #-1]!
    subs r1, r1, #0x1
    bne .L_1738
.L_1744:
    ldrb r1, [sp, #0x8]
    add r0, sp, #0x9
    add r2, r0, r1
    subs r1, r1, #0x1
    beq .L_1768
.L_1758:
    ldrsb r0, [r2, #-1]!
    subs r1, r1, #0x1
    strb r0, [r8, #-1]!
    bne .L_1758
.L_1768:
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
    bne .L_1928
    cmp r4, #0x1
    moveq r0, #0x2b
    streqb r0, [r8, #-1]!
    beq .L_1928
    cmp r4, #0x2
    moveq r0, #0x20
    streqb r0, [r8, #-1]!
    b .L_1928
.L_17b4:
    ldrsh r3, [sp, #0x6]
    ldrb r2, [sp, #0x8]
    sub r0, r2, r3
    subs r1, r0, #0x1
    movmi r1, #0x0
    cmp r1, r7
    ble .L_17f4
    sub r1, r1, r7
    add r0, sp, #0x4
    sub r1, r2, r1
    bl func_020a84c8
    ldrsh r3, [sp, #0x6]
    ldrb r2, [sp, #0x8]
    sub r0, r2, r3
    subs r1, r0, #0x1
    movmi r1, #0x0
.L_17f4:
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
    ble .L_1848
    mov r3, #0x30
.L_1838:
    add r9, r9, #0x1
    cmp r9, r6
    strb r3, [r8, #-1]!
    blt .L_1838
.L_1848:
    mov r6, #0x0
    b .L_185c
.L_1850:
    ldrsb r3, [r2, #-1]!
    add r6, r6, #0x1
    strb r3, [r8, #-1]!
.L_185c:
    cmp r6, r1
    ldrltb r3, [sp, #0x8]
    cmplt r6, r3
    blt .L_1850
    cmp r6, r1
    bge .L_1888
    mov r3, #0x30
.L_1878:
    add r6, r6, #0x1
    cmp r6, r1
    strb r3, [r8, #-1]!
    blt .L_1878
.L_1888:
    cmp r7, #0x0
    cmpeq r5, #0x0
    movne r1, #0x2e
    strneb r1, [r8, #-1]!
    cmp r0, #0x0
    beq .L_18f0
    ldrb r1, [sp, #0x8]
    mov r5, #0x0
    sub r1, r0, r1
    cmp r1, #0x0
    ble .L_18d0
    mov r3, #0x30
.L_18b8:
    strb r3, [r8, #-1]!
    ldrb r1, [sp, #0x8]
    add r5, r5, #0x1
    sub r1, r0, r1
    cmp r5, r1
    blt .L_18b8
.L_18d0:
    cmp r5, r0
    bge .L_18f8
.L_18d8:
    ldrsb r1, [r2, #-1]!
    add r5, r5, #0x1
    cmp r5, r0
    strb r1, [r8, #-1]!
    blt .L_18d8
    b .L_18f8
.L_18f0:
    mov r0, #0x30
    strb r0, [r8, #-1]!
.L_18f8:
    ldrsb r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x2d
    strneb r0, [r8, #-1]!
    bne .L_1928
    cmp r4, #0x1
    moveq r0, #0x2b
    streqb r0, [r8, #-1]!
    beq .L_1928
    cmp r4, #0x2
    moveq r0, #0x20
    streqb r0, [r8, #-1]!
.L_1928:
    mov r0, r8
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word 0x000001fd
_LIT1: .word data_020c3754
_LIT2: .word data_02102a68
_LIT3: .word data_02102a70
_LIT4: .word data_02102a78
_LIT5: .word data_02102a7c
_LIT6: .word data_02102a80
_LIT7: .word data_02102a88
_LIT8: .word data_02102a90
_LIT9: .word data_02102a94
_LIT10: .word 0x66666667
