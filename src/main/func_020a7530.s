; func_020a7530 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3754
        .global func_020a7530
        .arm
func_020a7530:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    ldrsb r3, [r0, #0x1]
    mov r4, #0x0
    mov r5, #0x1
    mov lr, r2
    strb r5, [sp]
    strb r4, [sp, #0x1]
    strb r4, [sp, #0x2]
    strb r4, [sp, #0x3]
    strb r4, [sp, #0x4]
    str r4, [sp, #0x8]
    str r4, [sp, #0xc]
    cmp r3, #0x25
    add ip, r0, #0x1
    bne .L_1a4
    add r0, sp, #0x0
    strb r3, [sp, #0x5]
    ldmia r0, {r0, r1, r2, r3}
    stmia lr, {r0, r1, r2, r3}
    add sp, sp, #0x10
    add r0, ip, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1a4:
    mov r2, #0x2
    mov r0, r4
    mov r5, r2
    mov r6, r4
    mov r7, #0x1
.L_1b8:
    mov r8, r7
    cmp r3, #0x2b
    bgt .L_1e8
    bge .L_210
    cmp r3, #0x23
    bgt .L_240
    cmp r3, #0x20
    blt .L_240
    beq .L_218
    cmp r3, #0x23
    beq .L_228
    b .L_240
.L_1e8:
    cmp r3, #0x30
    bgt .L_240
    cmp r3, #0x2d
    blt .L_240
    beq .L_208
    cmp r3, #0x30
    beq .L_230
    b .L_240
.L_208:
    strb r6, [sp]
    b .L_244
.L_210:
    strb r7, [sp, #0x1]
    b .L_244
.L_218:
    ldrb r4, [sp, #0x1]
    cmp r4, #0x1
    strneb r5, [sp, #0x1]
    b .L_244
.L_228:
    strb r7, [sp, #0x3]
    b .L_244
.L_230:
    ldrb r4, [sp]
    cmp r4, #0x0
    strneb r2, [sp]
    b .L_244
.L_240:
    mov r8, r0
.L_244:
    cmp r8, #0x0
    ldrnesb r3, [ip, #0x1]!
    bne .L_1b8
    cmp r3, #0x2a
    bne .L_28c
    ldr r0, [r1]
    add r0, r0, #0x4
    str r0, [r1]
    ldr r0, [r0, #-4]
    str r0, [sp, #0x8]
    cmp r0, #0x0
    bge .L_284
    rsb r0, r0, #0x0
    mov r2, #0x0
    strb r2, [sp]
    str r0, [sp, #0x8]
.L_284:
    ldrsb r3, [ip, #0x1]!
    b .L_2dc
.L_28c:
    ldr r4, _LIT0
    mov r5, #0x0
    mov r0, #0xa
    b .L_2b0
.L_29c:
    ldr r2, [sp, #0x8]
    sub r3, r3, #0x30
    mla r6, r2, r0, r3
    ldrsb r3, [ip, #0x1]!
    str r6, [sp, #0x8]
.L_2b0:
    cmp r3, #0x0
    blt .L_2c0
    cmp r3, #0x80
    blt .L_2c8
.L_2c0:
    mov r2, r5
    b .L_2d4
.L_2c8:
    mov r2, r3, lsl #0x1
    ldrh r2, [r4, r2]
    and r2, r2, #0x8
.L_2d4:
    cmp r2, #0x0
    bne .L_29c
.L_2dc:
    ldr r2, [sp, #0x8]
    ldr r0, _LIT1
    cmp r2, r0
    ble .L_30c
    mov r1, #0xff
    add r0, sp, #0x0
    strb r1, [sp, #0x5]
    ldmia r0, {r0, r1, r2, r3}
    stmia lr, {r0, r1, r2, r3}
    add sp, sp, #0x10
    add r0, ip, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_30c:
    cmp r3, #0x2e
    bne .L_3a0
    ldrsb r3, [ip, #0x1]!
    mov r0, #0x1
    strb r0, [sp, #0x2]
    cmp r3, #0x2a
    bne .L_350
    ldr r0, [r1]
    add r0, r0, #0x4
    str r0, [r1]
    ldr r0, [r0, #-4]
    ldrsb r3, [ip, #0x1]!
    str r0, [sp, #0xc]
    cmp r0, #0x0
    movlt r0, #0x0
    strltb r0, [sp, #0x2]
    b .L_3a0
.L_350:
    ldr r2, _LIT0
    mov r4, #0x0
    mov r0, #0xa
    b .L_374
.L_360:
    ldr r1, [sp, #0xc]
    sub r3, r3, #0x30
    mla r5, r1, r0, r3
    ldrsb r3, [ip, #0x1]!
    str r5, [sp, #0xc]
.L_374:
    cmp r3, #0x0
    blt .L_384
    cmp r3, #0x80
    blt .L_38c
.L_384:
    mov r1, r4
    b .L_398
.L_38c:
    mov r1, r3, lsl #0x1
    ldrh r1, [r2, r1]
    and r1, r1, #0x8
.L_398:
    cmp r1, #0x0
    bne .L_360
.L_3a0:
    cmp r3, #0x6c
    mov r0, #0x1
    bgt .L_3d8
    cmp r3, #0x68
    blt .L_3cc
    beq .L_3f4
    cmp r3, #0x6a
    beq .L_440
    cmp r3, #0x6c
    beq .L_410
    b .L_464
.L_3cc:
    cmp r3, #0x4c
    beq .L_434
    b .L_464
.L_3d8:
    cmp r3, #0x74
    bgt .L_3e8
    beq .L_44c
    b .L_464
.L_3e8:
    cmp r3, #0x7a
    beq .L_458
    b .L_464
.L_3f4:
    ldrsb r1, [ip, #0x1]
    mov r2, #0x2
    strb r2, [sp, #0x4]
    cmp r1, #0x68
    streqb r0, [sp, #0x4]
    ldreqsb r3, [ip, #0x1]!
    b .L_468
.L_410:
    ldrsb r1, [ip, #0x1]
    mov r2, #0x3
    strb r2, [sp, #0x4]
    cmp r1, #0x6c
    bne .L_468
    mov r1, #0x4
    strb r1, [sp, #0x4]
    ldrsb r3, [ip, #0x1]!
    b .L_468
.L_434:
    mov r1, #0x9
    strb r1, [sp, #0x4]
    b .L_468
.L_440:
    mov r1, #0x6
    strb r1, [sp, #0x4]
    b .L_468
.L_44c:
    mov r1, #0x8
    strb r1, [sp, #0x4]
    b .L_468
.L_458:
    mov r1, #0x7
    strb r1, [sp, #0x4]
    b .L_468
.L_464:
    mov r0, #0x0
.L_468:
    cmp r0, #0x0
    ldrnesb r3, [ip, #0x1]!
    strb r3, [sp, #0x5]
    cmp r3, #0x61
    bgt .L_4bc
    bge .L_5a4
    cmp r3, #0x47
    bgt .L_4b0
    subs r0, r3, #0x41
    addpl pc, pc, r0, lsl #0x2
    b .L_6b0
    b .L_5a4
    b .L_6b0
    b .L_6b0
    b .L_6b0
    b .L_5ec
    b .L_56c
    b .L_5dc
.L_4b0:
    cmp r3, #0x58
    beq .L_530
    b .L_6b0
.L_4bc:
    cmp r3, #0x63
    bgt .L_4cc
    beq .L_64c
    b .L_6b0
.L_4cc:
    sub r0, r3, #0x64
    cmp r0, #0x14
    addls pc, pc, r0, lsl #0x2
    b .L_6b0
    b .L_530
    b .L_5ec
    b .L_56c
    b .L_5dc
    b .L_6b0
    b .L_530
    b .L_6b0
    b .L_6b0
    b .L_6b0
    b .L_6b0
    b .L_69c
    b .L_530
    b .L_628
    b .L_6b0
    b .L_6b0
    b .L_678
    b .L_6b0
    b .L_530
    b .L_6b0
    b .L_6b0
    b .L_530
.L_530:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x9
    moveq r0, #0xff
    streqb r0, [sp, #0x5]
    beq .L_6b8
    ldrb r0, [sp, #0x2]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0xc]
    beq .L_6b8
    ldrb r0, [sp]
    cmp r0, #0x2
    moveq r0, #0x1
    streqb r0, [sp]
    b .L_6b8
.L_56c:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x2
    cmpne r0, #0x6
    cmpne r0, #0x7
    cmpne r0, #0x8
    cmpne r0, #0x4
    moveq r0, #0xff
    streqb r0, [sp, #0x5]
    beq .L_6b8
    ldrb r0, [sp, #0x2]
    cmp r0, #0x0
    moveq r0, #0x6
    streq r0, [sp, #0xc]
    b .L_6b8
.L_5a4:
    ldrb r0, [sp, #0x2]
    cmp r0, #0x0
    moveq r0, #0xd
    streq r0, [sp, #0xc]
    ldrb r0, [sp, #0x4]
    cmp r0, #0x2
    cmpne r0, #0x6
    cmpne r0, #0x7
    cmpne r0, #0x8
    cmpne r0, #0x4
    cmpne r0, #0x1
    moveq r0, #0xff
    streqb r0, [sp, #0x5]
    b .L_6b8
.L_5dc:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0xc]
.L_5ec:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x2
    cmpne r0, #0x6
    cmpne r0, #0x7
    cmpne r0, #0x8
    cmpne r0, #0x4
    cmpne r0, #0x1
    moveq r0, #0xff
    streqb r0, [sp, #0x5]
    beq .L_6b8
    ldrb r0, [sp, #0x2]
    cmp r0, #0x0
    moveq r0, #0x6
    streq r0, [sp, #0xc]
    b .L_6b8
.L_628:
    mov r3, #0x78
    mov r2, #0x1
    mov r1, #0x3
    mov r0, #0x8
    strb r3, [sp, #0x5]
    strb r2, [sp, #0x3]
    strb r1, [sp, #0x4]
    str r0, [sp, #0xc]
    b .L_6b8
.L_64c:
    ldrb r1, [sp, #0x4]
    cmp r1, #0x3
    moveq r0, #0x5
    streqb r0, [sp, #0x4]
    beq .L_6b8
    ldrb r0, [sp, #0x2]
    cmp r0, #0x0
    cmpeq r1, #0x0
    movne r0, #0xff
    strneb r0, [sp, #0x5]
    b .L_6b8
.L_678:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x3
    moveq r0, #0x5
    streqb r0, [sp, #0x4]
    beq .L_6b8
    cmp r0, #0x0
    movne r0, #0xff
    strneb r0, [sp, #0x5]
    b .L_6b8
.L_69c:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x9
    moveq r0, #0xff
    streqb r0, [sp, #0x5]
    b .L_6b8
.L_6b0:
    mov r0, #0xff
    strb r0, [sp, #0x5]
.L_6b8:
    add r0, sp, #0x0
    ldmia r0, {r0, r1, r2, r3}
    stmia lr, {r0, r1, r2, r3}
    add r0, ip, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_020c3754
_LIT1: .word 0x000001fd
