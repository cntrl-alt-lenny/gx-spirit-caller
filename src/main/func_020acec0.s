; func_020acec0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c398c
        .global func_020acec0
        .arm
func_020acec0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    ldrh r3, [r0, #0x2]
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
    add ip, r0, #0x2
    bne .L_84
    add r0, sp, #0x0
    strh r3, [sp, #0x6]
    ldmia r0, {r0, r1, r2, r3}
    stmia lr, {r0, r1, r2, r3}
    add sp, sp, #0x10
    add r0, ip, #0x2
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_84:
    mov r2, #0x2
    mov r0, r4
    mov r5, r2
    mov r6, r4
    mov r7, #0x1
.L_98:
    mov r8, r7
    cmp r3, #0x2b
    bgt .L_c8
    bge .L_f0
    cmp r3, #0x23
    bgt .L_120
    cmp r3, #0x20
    blt .L_120
    beq .L_f8
    cmp r3, #0x23
    beq .L_108
    b .L_120
.L_c8:
    cmp r3, #0x30
    bgt .L_120
    cmp r3, #0x2d
    blt .L_120
    beq .L_e8
    cmp r3, #0x30
    beq .L_110
    b .L_120
.L_e8:
    strb r6, [sp]
    b .L_124
.L_f0:
    strb r7, [sp, #0x1]
    b .L_124
.L_f8:
    ldrb r4, [sp, #0x1]
    cmp r4, #0x1
    strneb r5, [sp, #0x1]
    b .L_124
.L_108:
    strb r7, [sp, #0x3]
    b .L_124
.L_110:
    ldrb r4, [sp]
    cmp r4, #0x0
    strneb r2, [sp]
    b .L_124
.L_120:
    mov r8, r0
.L_124:
    cmp r8, #0x0
    ldrneh r3, [ip, #0x2]!
    bne .L_98
    cmp r3, #0x2a
    bne .L_16c
    ldr r0, [r1]
    add r0, r0, #0x4
    str r0, [r1]
    ldr r0, [r0, #-4]
    str r0, [sp, #0x8]
    cmp r0, #0x0
    bge .L_164
    rsb r0, r0, #0x0
    mov r2, #0x0
    strb r2, [sp]
    str r0, [sp, #0x8]
.L_164:
    ldrh r3, [ip, #0x2]!
    b .L_1b0
.L_16c:
    mov r2, #0x0
    ldr r5, _LIT0
    mov r0, #0xa
    b .L_190
.L_17c:
    ldr r4, [sp, #0x8]
    sub r3, r3, #0x30
    mla r6, r4, r0, r3
    ldrh r3, [ip, #0x2]!
    str r6, [sp, #0x8]
.L_190:
    cmp r3, #0x80
    movcs r4, r2
    bcs .L_1a8
    mov r4, r3, lsl #0x1
    ldrh r4, [r5, r4]
    and r4, r4, #0x8
.L_1a8:
    cmp r4, #0x0
    bne .L_17c
.L_1b0:
    ldr r2, [sp, #0x8]
    ldr r0, _LIT1
    cmp r2, r0
    ble .L_1e0
    ldr r1, _LIT2
    add r0, sp, #0x0
    strh r1, [sp, #0x6]
    ldmia r0, {r0, r1, r2, r3}
    stmia lr, {r0, r1, r2, r3}
    add sp, sp, #0x10
    add r0, ip, #0x2
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1e0:
    cmp r3, #0x2e
    bne .L_268
    ldrh r3, [ip, #0x2]!
    mov r0, #0x1
    strb r0, [sp, #0x2]
    cmp r3, #0x2a
    bne .L_224
    ldr r0, [r1]
    add r0, r0, #0x4
    str r0, [r1]
    ldr r0, [r0, #-4]
    ldrh r3, [ip, #0x2]!
    str r0, [sp, #0xc]
    cmp r0, #0x0
    movlt r0, #0x0
    strltb r0, [sp, #0x2]
    b .L_268
.L_224:
    mov r1, #0x0
    ldr r4, _LIT0
    mov r0, #0xa
    b .L_248
.L_234:
    ldr r2, [sp, #0xc]
    sub r3, r3, #0x30
    mla r5, r2, r0, r3
    ldrh r3, [ip, #0x2]!
    str r5, [sp, #0xc]
.L_248:
    cmp r3, #0x80
    movcs r2, r1
    bcs .L_260
    mov r2, r3, lsl #0x1
    ldrh r2, [r4, r2]
    and r2, r2, #0x8
.L_260:
    cmp r2, #0x0
    bne .L_234
.L_268:
    cmp r3, #0x6c
    mov r0, #0x1
    bgt .L_2a0
    cmp r3, #0x68
    blt .L_294
    beq .L_2bc
    cmp r3, #0x6a
    beq .L_308
    cmp r3, #0x6c
    beq .L_2d8
    b .L_32c
.L_294:
    cmp r3, #0x4c
    beq .L_2fc
    b .L_32c
.L_2a0:
    cmp r3, #0x74
    bgt .L_2b0
    beq .L_314
    b .L_32c
.L_2b0:
    cmp r3, #0x7a
    beq .L_320
    b .L_32c
.L_2bc:
    ldrh r1, [ip, #0x2]
    mov r2, #0x2
    strb r2, [sp, #0x4]
    cmp r1, #0x68
    streqb r0, [sp, #0x4]
    ldreqh r3, [ip, #0x2]!
    b .L_330
.L_2d8:
    ldrh r1, [ip, #0x2]
    mov r2, #0x3
    strb r2, [sp, #0x4]
    cmp r1, #0x6c
    bne .L_330
    mov r1, #0x4
    strb r1, [sp, #0x4]
    ldrh r3, [ip, #0x2]!
    b .L_330
.L_2fc:
    mov r1, #0x9
    strb r1, [sp, #0x4]
    b .L_330
.L_308:
    mov r1, #0x6
    strb r1, [sp, #0x4]
    b .L_330
.L_314:
    mov r1, #0x8
    strb r1, [sp, #0x4]
    b .L_330
.L_320:
    mov r1, #0x7
    strb r1, [sp, #0x4]
    b .L_330
.L_32c:
    mov r0, #0x0
.L_330:
    cmp r0, #0x0
    ldrneh r3, [ip, #0x2]!
    strh r3, [sp, #0x6]
    cmp r3, #0x61
    bgt .L_384
    bge .L_468
    cmp r3, #0x47
    bgt .L_378
    subs r0, r3, #0x41
    addpl pc, pc, r0, lsl #0x2
    b .L_574
    b .L_468
    b .L_574
    b .L_574
    b .L_574
    b .L_4b0
    b .L_430
    b .L_4a0
.L_378:
    cmp r3, #0x58
    beq .L_3f8
    b .L_574
.L_384:
    cmp r3, #0x63
    bgt .L_394
    beq .L_510
    b .L_574
.L_394:
    sub r0, r3, #0x64
    cmp r0, #0x14
    addls pc, pc, r0, lsl #0x2
    b .L_574
    b .L_3f8
    b .L_4b0
    b .L_430
    b .L_4a0
    b .L_574
    b .L_3f8
    b .L_574
    b .L_574
    b .L_574
    b .L_574
    b .L_560
    b .L_3f8
    b .L_4ec
    b .L_574
    b .L_574
    b .L_53c
    b .L_574
    b .L_3f8
    b .L_574
    b .L_574
    b .L_3f8
.L_3f8:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x9
    moveq r0, #0x4
    streqb r0, [sp, #0x4]
    ldrb r0, [sp, #0x2]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0xc]
    beq .L_57c
    ldrb r0, [sp]
    cmp r0, #0x2
    moveq r0, #0x1
    streqb r0, [sp]
    b .L_57c
.L_430:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x2
    cmpne r0, #0x6
    cmpne r0, #0x7
    cmpne r0, #0x8
    cmpne r0, #0x4
    ldreq r0, _LIT2
    streqh r0, [sp, #0x6]
    beq .L_57c
    ldrb r0, [sp, #0x2]
    cmp r0, #0x0
    moveq r0, #0x6
    streq r0, [sp, #0xc]
    b .L_57c
.L_468:
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
    ldreq r0, _LIT2
    streqh r0, [sp, #0x6]
    b .L_57c
.L_4a0:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0xc]
.L_4b0:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x2
    cmpne r0, #0x6
    cmpne r0, #0x7
    cmpne r0, #0x8
    cmpne r0, #0x4
    cmpne r0, #0x1
    ldreq r0, _LIT2
    streqh r0, [sp, #0x6]
    beq .L_57c
    ldrb r0, [sp, #0x2]
    cmp r0, #0x0
    moveq r0, #0x6
    streq r0, [sp, #0xc]
    b .L_57c
.L_4ec:
    mov r3, #0x3
    mov r2, #0x1
    mov r1, #0x78
    mov r0, #0x8
    strb r3, [sp, #0x4]
    strb r2, [sp, #0x3]
    strh r1, [sp, #0x6]
    str r0, [sp, #0xc]
    b .L_57c
.L_510:
    ldrb r1, [sp, #0x4]
    cmp r1, #0x3
    moveq r0, #0x5
    streqb r0, [sp, #0x4]
    beq .L_57c
    ldrb r0, [sp, #0x2]
    cmp r0, #0x0
    cmpeq r1, #0x0
    ldrne r0, _LIT2
    strneh r0, [sp, #0x6]
    b .L_57c
.L_53c:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x3
    moveq r0, #0x5
    streqb r0, [sp, #0x4]
    beq .L_57c
    cmp r0, #0x0
    ldrne r0, _LIT2
    strneh r0, [sp, #0x6]
    b .L_57c
.L_560:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x9
    moveq r0, #0x4
    streqb r0, [sp, #0x4]
    b .L_57c
.L_574:
    ldr r0, _LIT2
    strh r0, [sp, #0x6]
.L_57c:
    add r0, sp, #0x0
    ldmia r0, {r0, r1, r2, r3}
    stmia lr, {r0, r1, r2, r3}
    add r0, ip, #0x2
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_020c398c
_LIT1: .word 0x000001fd
_LIT2: .word 0x0000ffff
