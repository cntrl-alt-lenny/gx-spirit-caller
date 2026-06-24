; func_020a743c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3660
        .global func_020a743c
        .arm
func_020a743c:
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
    bne .L_5c
    add r0, sp, #0x0
    strb r3, [sp, #0x5]
    ldmia r0, {r0, r1, r2, r3}
    stmia lr, {r0, r1, r2, r3}
    add sp, sp, #0x10
    add r0, ip, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_5c:
    mov r2, #0x2
    mov r0, r4
    mov r5, r2
    mov r6, r4
    mov r7, #0x1
.L_70:
    mov r8, r7
    cmp r3, #0x2b
    bgt .L_a0
    bge .L_c8
    cmp r3, #0x23
    bgt .L_f8
    cmp r3, #0x20
    blt .L_f8
    beq .L_d0
    cmp r3, #0x23
    beq .L_e0
    b .L_f8
.L_a0:
    cmp r3, #0x30
    bgt .L_f8
    cmp r3, #0x2d
    blt .L_f8
    beq .L_c0
    cmp r3, #0x30
    beq .L_e8
    b .L_f8
.L_c0:
    strb r6, [sp]
    b .L_fc
.L_c8:
    strb r7, [sp, #0x1]
    b .L_fc
.L_d0:
    ldrb r4, [sp, #0x1]
    cmp r4, #0x1
    strneb r5, [sp, #0x1]
    b .L_fc
.L_e0:
    strb r7, [sp, #0x3]
    b .L_fc
.L_e8:
    ldrb r4, [sp]
    cmp r4, #0x0
    strneb r2, [sp]
    b .L_fc
.L_f8:
    mov r8, r0
.L_fc:
    cmp r8, #0x0
    ldrnesb r3, [ip, #0x1]!
    bne .L_70
    cmp r3, #0x2a
    bne .L_144
    ldr r0, [r1]
    add r0, r0, #0x4
    str r0, [r1]
    ldr r0, [r0, #-4]
    str r0, [sp, #0x8]
    cmp r0, #0x0
    bge .L_13c
    rsb r0, r0, #0x0
    mov r2, #0x0
    strb r2, [sp]
    str r0, [sp, #0x8]
.L_13c:
    ldrsb r3, [ip, #0x1]!
    b .L_194
.L_144:
    ldr r4, _LIT0
    mov r5, #0x0
    mov r0, #0xa
    b .L_168
.L_154:
    ldr r2, [sp, #0x8]
    sub r3, r3, #0x30
    mla r6, r2, r0, r3
    ldrsb r3, [ip, #0x1]!
    str r6, [sp, #0x8]
.L_168:
    cmp r3, #0x0
    blt .L_178
    cmp r3, #0x80
    blt .L_180
.L_178:
    mov r2, r5
    b .L_18c
.L_180:
    mov r2, r3, lsl #0x1
    ldrh r2, [r4, r2]
    and r2, r2, #0x8
.L_18c:
    cmp r2, #0x0
    bne .L_154
.L_194:
    ldr r2, [sp, #0x8]
    ldr r0, _LIT1
    cmp r2, r0
    ble .L_1c4
    mov r1, #0xff
    add r0, sp, #0x0
    strb r1, [sp, #0x5]
    ldmia r0, {r0, r1, r2, r3}
    stmia lr, {r0, r1, r2, r3}
    add sp, sp, #0x10
    add r0, ip, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1c4:
    cmp r3, #0x2e
    bne .L_258
    ldrsb r3, [ip, #0x1]!
    mov r0, #0x1
    strb r0, [sp, #0x2]
    cmp r3, #0x2a
    bne .L_208
    ldr r0, [r1]
    add r0, r0, #0x4
    str r0, [r1]
    ldr r0, [r0, #-4]
    ldrsb r3, [ip, #0x1]!
    str r0, [sp, #0xc]
    cmp r0, #0x0
    movlt r0, #0x0
    strltb r0, [sp, #0x2]
    b .L_258
.L_208:
    ldr r2, _LIT0
    mov r4, #0x0
    mov r0, #0xa
    b .L_22c
.L_218:
    ldr r1, [sp, #0xc]
    sub r3, r3, #0x30
    mla r5, r1, r0, r3
    ldrsb r3, [ip, #0x1]!
    str r5, [sp, #0xc]
.L_22c:
    cmp r3, #0x0
    blt .L_23c
    cmp r3, #0x80
    blt .L_244
.L_23c:
    mov r1, r4
    b .L_250
.L_244:
    mov r1, r3, lsl #0x1
    ldrh r1, [r2, r1]
    and r1, r1, #0x8
.L_250:
    cmp r1, #0x0
    bne .L_218
.L_258:
    cmp r3, #0x6c
    mov r0, #0x1
    bgt .L_290
    cmp r3, #0x68
    blt .L_284
    beq .L_2ac
    cmp r3, #0x6a
    beq .L_2f8
    cmp r3, #0x6c
    beq .L_2c8
    b .L_31c
.L_284:
    cmp r3, #0x4c
    beq .L_2ec
    b .L_31c
.L_290:
    cmp r3, #0x74
    bgt .L_2a0
    beq .L_304
    b .L_31c
.L_2a0:
    cmp r3, #0x7a
    beq .L_310
    b .L_31c
.L_2ac:
    ldrsb r1, [ip, #0x1]
    mov r2, #0x2
    strb r2, [sp, #0x4]
    cmp r1, #0x68
    streqb r0, [sp, #0x4]
    ldreqsb r3, [ip, #0x1]!
    b .L_320
.L_2c8:
    ldrsb r1, [ip, #0x1]
    mov r2, #0x3
    strb r2, [sp, #0x4]
    cmp r1, #0x6c
    bne .L_320
    mov r1, #0x4
    strb r1, [sp, #0x4]
    ldrsb r3, [ip, #0x1]!
    b .L_320
.L_2ec:
    mov r1, #0x9
    strb r1, [sp, #0x4]
    b .L_320
.L_2f8:
    mov r1, #0x6
    strb r1, [sp, #0x4]
    b .L_320
.L_304:
    mov r1, #0x8
    strb r1, [sp, #0x4]
    b .L_320
.L_310:
    mov r1, #0x7
    strb r1, [sp, #0x4]
    b .L_320
.L_31c:
    mov r0, #0x0
.L_320:
    cmp r0, #0x0
    ldrnesb r3, [ip, #0x1]!
    strb r3, [sp, #0x5]
    cmp r3, #0x61
    bgt .L_374
    bge .L_45c
    cmp r3, #0x47
    bgt .L_368
    subs r0, r3, #0x41
    addpl pc, pc, r0, lsl #0x2
    b .L_568
    b .L_45c
    b .L_568
    b .L_568
    b .L_568
    b .L_4a4
    b .L_424
    b .L_494
.L_368:
    cmp r3, #0x58
    beq .L_3e8
    b .L_568
.L_374:
    cmp r3, #0x63
    bgt .L_384
    beq .L_504
    b .L_568
.L_384:
    sub r0, r3, #0x64
    cmp r0, #0x14
    addls pc, pc, r0, lsl #0x2
    b .L_568
    b .L_3e8
    b .L_4a4
    b .L_424
    b .L_494
    b .L_568
    b .L_3e8
    b .L_568
    b .L_568
    b .L_568
    b .L_568
    b .L_554
    b .L_3e8
    b .L_4e0
    b .L_568
    b .L_568
    b .L_530
    b .L_568
    b .L_3e8
    b .L_568
    b .L_568
    b .L_3e8
.L_3e8:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x9
    moveq r0, #0xff
    streqb r0, [sp, #0x5]
    beq .L_570
    ldrb r0, [sp, #0x2]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0xc]
    beq .L_570
    ldrb r0, [sp]
    cmp r0, #0x2
    moveq r0, #0x1
    streqb r0, [sp]
    b .L_570
.L_424:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x2
    cmpne r0, #0x6
    cmpne r0, #0x7
    cmpne r0, #0x8
    cmpne r0, #0x4
    moveq r0, #0xff
    streqb r0, [sp, #0x5]
    beq .L_570
    ldrb r0, [sp, #0x2]
    cmp r0, #0x0
    moveq r0, #0x6
    streq r0, [sp, #0xc]
    b .L_570
.L_45c:
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
    b .L_570
.L_494:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0xc]
.L_4a4:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x2
    cmpne r0, #0x6
    cmpne r0, #0x7
    cmpne r0, #0x8
    cmpne r0, #0x4
    cmpne r0, #0x1
    moveq r0, #0xff
    streqb r0, [sp, #0x5]
    beq .L_570
    ldrb r0, [sp, #0x2]
    cmp r0, #0x0
    moveq r0, #0x6
    streq r0, [sp, #0xc]
    b .L_570
.L_4e0:
    mov r3, #0x78
    mov r2, #0x1
    mov r1, #0x3
    mov r0, #0x8
    strb r3, [sp, #0x5]
    strb r2, [sp, #0x3]
    strb r1, [sp, #0x4]
    str r0, [sp, #0xc]
    b .L_570
.L_504:
    ldrb r1, [sp, #0x4]
    cmp r1, #0x3
    moveq r0, #0x5
    streqb r0, [sp, #0x4]
    beq .L_570
    ldrb r0, [sp, #0x2]
    cmp r0, #0x0
    cmpeq r1, #0x0
    movne r0, #0xff
    strneb r0, [sp, #0x5]
    b .L_570
.L_530:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x3
    moveq r0, #0x5
    streqb r0, [sp, #0x4]
    beq .L_570
    cmp r0, #0x0
    movne r0, #0xff
    strneb r0, [sp, #0x5]
    b .L_570
.L_554:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x9
    moveq r0, #0xff
    streqb r0, [sp, #0x5]
    b .L_570
.L_568:
    mov r0, #0xff
    strb r0, [sp, #0x5]
.L_570:
    add r0, sp, #0x0
    ldmia r0, {r0, r1, r2, r3}
    stmia lr, {r0, r1, r2, r3}
    add r0, ip, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_020c3660
_LIT1: .word 0x000001fd
