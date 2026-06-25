; func_020a986c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3660
        .extern data_020c3760
        .global func_020a986c
        .arm
func_020a986c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x28
    ldr r6, _LIT0
    add r5, sp, #0x0
    mov r7, r0
    mov lr, r1
    mov r4, r5
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r6, {r0, r1}
    stmia r5, {r0, r1}
    ldrsb r0, [r7, #0x1]
    add ip, r7, #0x1
    cmp r0, #0x25
    bne .L_6c
    strb r0, [sp, #0x3]
    ldmia r4!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    ldmia r4!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    ldmia r4, {r0, r1}
    stmia lr, {r0, r1}
    add sp, sp, #0x28
    add r0, ip, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_6c:
    cmp r0, #0x2a
    moveq r0, #0x1
    streqb r0, [sp]
    ldreqsb r0, [ip, #0x1]!
    cmp r0, #0x0
    blt .L_8c
    cmp r0, #0x80
    blt .L_94
.L_8c:
    mov r1, #0x0
    b .L_a4
.L_94:
    ldr r1, _LIT1
    mov r2, r0, lsl #0x1
    ldrh r1, [r1, r2]
    and r1, r1, #0x8
.L_a4:
    cmp r1, #0x0
    beq .L_144
    mov r1, #0x0
    ldr r3, _LIT1
    str r1, [sp, #0x4]
    mov r4, r1
    mov r1, #0xa
.L_c0:
    ldr r2, [sp, #0x4]
    sub r0, r0, #0x30
    mla r0, r2, r1, r0
    str r0, [sp, #0x4]
    ldrsb r0, [ip, #0x1]!
    cmp r0, #0x0
    blt .L_e4
    cmp r0, #0x80
    blt .L_ec
.L_e4:
    mov r2, r4
    b .L_f8
.L_ec:
    mov r2, r0, lsl #0x1
    ldrh r2, [r3, r2]
    and r2, r2, #0x8
.L_f8:
    cmp r2, #0x0
    bne .L_c0
    ldr r1, [sp, #0x4]
    cmp r1, #0x0
    bne .L_13c
    mov r0, #0xff
    add r4, sp, #0x0
    strb r0, [sp, #0x3]
    ldmia r4!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    ldmia r4!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    ldmia r4, {r0, r1}
    stmia lr, {r0, r1}
    add sp, sp, #0x28
    add r0, ip, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_13c:
    mov r1, #0x1
    strb r1, [sp, #0x1]
.L_144:
    cmp r0, #0x6c
    mov r1, #0x1
    bgt .L_17c
    cmp r0, #0x68
    blt .L_170
    beq .L_198
    cmp r0, #0x6a
    beq .L_1e4
    cmp r0, #0x6c
    beq .L_1b4
    b .L_208
.L_170:
    cmp r0, #0x4c
    beq .L_1d8
    b .L_208
.L_17c:
    cmp r0, #0x74
    bgt .L_18c
    beq .L_1fc
    b .L_208
.L_18c:
    cmp r0, #0x7a
    beq .L_1f0
    b .L_208
.L_198:
    mov r2, #0x2
    strb r2, [sp, #0x2]
    ldrsb r2, [ip, #0x1]
    cmp r2, #0x68
    streqb r1, [sp, #0x2]
    ldreqsb r0, [ip, #0x1]!
    b .L_20c
.L_1b4:
    mov r2, #0x3
    strb r2, [sp, #0x2]
    ldrsb r2, [ip, #0x1]
    cmp r2, #0x6c
    bne .L_20c
    mov r0, #0x7
    strb r0, [sp, #0x2]
    ldrsb r0, [ip, #0x1]!
    b .L_20c
.L_1d8:
    mov r2, #0x9
    strb r2, [sp, #0x2]
    b .L_20c
.L_1e4:
    mov r2, #0x4
    strb r2, [sp, #0x2]
    b .L_20c
.L_1f0:
    mov r2, #0x5
    strb r2, [sp, #0x2]
    b .L_20c
.L_1fc:
    mov r2, #0x6
    strb r2, [sp, #0x2]
    b .L_20c
.L_208:
    mov r1, #0x0
.L_20c:
    cmp r1, #0x0
    ldrnesb r0, [ip, #0x1]!
    strb r0, [sp, #0x3]
    cmp r0, #0x5b
    bgt .L_260
    bge .L_3b0
    cmp r0, #0x47
    bgt .L_254
    subs r1, r0, #0x41
    addpl pc, pc, r1, lsl #0x2
    b .L_4c0
    b .L_2ec
    b .L_4c0
    b .L_4c0
    b .L_4c0
    b .L_2ec
    b .L_2ec
    b .L_2ec
.L_254:
    cmp r0, #0x58
    beq .L_2d8
    b .L_4c0
.L_260:
    cmp r0, #0x61
    bgt .L_270
    beq .L_2ec
    b .L_4c0
.L_270:
    sub r0, r0, #0x63
    cmp r0, #0x15
    addls pc, pc, r0, lsl #0x2
    b .L_4c0
    b .L_33c
    b .L_2d8
    b .L_2ec
    b .L_2ec
    b .L_2ec
    b .L_4c0
    b .L_2d8
    b .L_4c0
    b .L_4c0
    b .L_4c0
    b .L_4c0
    b .L_4c8
    b .L_2d8
    b .L_328
    b .L_4c0
    b .L_4c0
    b .L_360
    b .L_4c0
    b .L_2d8
    b .L_4c0
    b .L_4c0
    b .L_2d8
.L_2d8:
    ldrb r0, [sp, #0x2]
    cmp r0, #0x9
    moveq r0, #0xff
    streqb r0, [sp, #0x3]
    b .L_4c8
.L_2ec:
    ldrb r1, [sp, #0x2]
    cmp r1, #0x1
    cmpne r1, #0x2
    beq .L_30c
    add r0, r1, #0xfc
    and r0, r0, #0xff
    cmp r0, #0x3
    bhi .L_318
.L_30c:
    mov r0, #0xff
    strb r0, [sp, #0x3]
    b .L_4c8
.L_318:
    cmp r1, #0x3
    moveq r0, #0x8
    streqb r0, [sp, #0x2]
    b .L_4c8
.L_328:
    mov r1, #0x3
    mov r0, #0x78
    strb r1, [sp, #0x2]
    strb r0, [sp, #0x3]
    b .L_4c8
.L_33c:
    ldrb r0, [sp, #0x2]
    cmp r0, #0x3
    moveq r0, #0xa
    streqb r0, [sp, #0x2]
    beq .L_4c8
    cmp r0, #0x0
    movne r0, #0xff
    strneb r0, [sp, #0x3]
    b .L_4c8
.L_360:
    ldrb r0, [sp, #0x2]
    cmp r0, #0x3
    moveq r0, #0xa
    streqb r0, [sp, #0x2]
    beq .L_380
    cmp r0, #0x0
    movne r0, #0xff
    strneb r0, [sp, #0x3]
.L_380:
    add r2, sp, #0x8
    mov r1, #0x20
    mov r0, #0xff
.L_38c:
    sub r1, r1, #0x1
    cmp r1, #0x0
    strb r0, [r2], #0x1
    bgt .L_38c
    mov r1, #0xc1
    mov r0, #0xfe
    strb r1, [sp, #0x9]
    strb r0, [sp, #0xc]
    b .L_4c8
.L_3b0:
    ldrb r0, [sp, #0x2]
    cmp r0, #0x3
    moveq r0, #0xa
    streqb r0, [sp, #0x2]
    beq .L_3d0
    cmp r0, #0x0
    movne r0, #0xff
    strneb r0, [sp, #0x3]
.L_3d0:
    ldrsb r2, [ip, #0x1]!
    mov r1, #0x0
    cmp r2, #0x5e
    ldreqsb r2, [ip, #0x1]!
    moveq r1, #0x1
    cmp r2, #0x5d
    bne .L_478
    ldrb r0, [sp, #0x13]
    orr r0, r0, #0x20
    strb r0, [sp, #0x13]
    ldrsb r2, [ip, #0x1]!
    b .L_478
.L_400:
    add r0, sp, #0x0
    and r3, r2, #0xff
    add r6, r0, r3, asr #0x3
    ldrb r5, [r6, #0x8]
    and r3, r2, #0x7
    mov r4, #0x1
    orr r3, r5, r4, lsl r3
    strb r3, [r6, #0x8]
    ldrsb r3, [ip, #0x1]
    cmp r3, #0x2d
    bne .L_474
    ldrsb r7, [ip, #0x2]
    cmp r7, #0x0
    cmpne r7, #0x5d
    beq .L_474
    add r2, r2, #0x1
    cmp r2, r7
    bgt .L_46c
.L_448:
    and r3, r2, #0xff
    add r6, r0, r3, asr #0x3
    ldrb r5, [r6, #0x8]
    and r3, r2, #0x7
    add r2, r2, #0x1
    orr r3, r5, r4, lsl r3
    strb r3, [r6, #0x8]
    cmp r2, r7
    ble .L_448
.L_46c:
    ldrsb r2, [ip, #0x3]!
    b .L_478
.L_474:
    ldrsb r2, [ip, #0x1]!
.L_478:
    cmp r2, #0x0
    cmpne r2, #0x5d
    bne .L_400
    cmp r2, #0x0
    moveq r0, #0xff
    streqb r0, [sp, #0x3]
    beq .L_4c8
    cmp r1, #0x0
    beq .L_4c8
    add r2, sp, #0x8
    mov r1, #0x20
.L_4a4:
    ldrb r0, [r2]
    sub r1, r1, #0x1
    cmp r1, #0x0
    mvn r0, r0
    strb r0, [r2], #0x1
    bgt .L_4a4
    b .L_4c8
.L_4c0:
    mov r0, #0xff
    strb r0, [sp, #0x3]
.L_4c8:
    add r4, sp, #0x0
    ldmia r4!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    ldmia r4!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    ldmia r4, {r0, r1}
    stmia lr, {r0, r1}
    add r0, ip, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_020c3760
_LIT1: .word data_020c3660
