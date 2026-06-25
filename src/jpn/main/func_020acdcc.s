; func_020acdcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3898
        .global func_020acdcc
        .arm
func_020acdcc:
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
    bne .L_5c
    add r0, sp, #0x0
    strh r3, [sp, #0x6]
    ldmia r0, {r0, r1, r2, r3}
    stmia lr, {r0, r1, r2, r3}
    add sp, sp, #0x10
    add r0, ip, #0x2
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
    ldrneh r3, [ip, #0x2]!
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
    ldrh r3, [ip, #0x2]!
    b .L_188
.L_144:
    mov r2, #0x0
    ldr r5, _LIT0
    mov r0, #0xa
    b .L_168
.L_154:
    ldr r4, [sp, #0x8]
    sub r3, r3, #0x30
    mla r6, r4, r0, r3
    ldrh r3, [ip, #0x2]!
    str r6, [sp, #0x8]
.L_168:
    cmp r3, #0x80
    movcs r4, r2
    bcs .L_180
    mov r4, r3, lsl #0x1
    ldrh r4, [r5, r4]
    and r4, r4, #0x8
.L_180:
    cmp r4, #0x0
    bne .L_154
.L_188:
    ldr r2, [sp, #0x8]
    ldr r0, _LIT1
    cmp r2, r0
    ble .L_1b8
    ldr r1, _LIT2
    add r0, sp, #0x0
    strh r1, [sp, #0x6]
    ldmia r0, {r0, r1, r2, r3}
    stmia lr, {r0, r1, r2, r3}
    add sp, sp, #0x10
    add r0, ip, #0x2
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1b8:
    cmp r3, #0x2e
    bne .L_240
    ldrh r3, [ip, #0x2]!
    mov r0, #0x1
    strb r0, [sp, #0x2]
    cmp r3, #0x2a
    bne .L_1fc
    ldr r0, [r1]
    add r0, r0, #0x4
    str r0, [r1]
    ldr r0, [r0, #-4]
    ldrh r3, [ip, #0x2]!
    str r0, [sp, #0xc]
    cmp r0, #0x0
    movlt r0, #0x0
    strltb r0, [sp, #0x2]
    b .L_240
.L_1fc:
    mov r1, #0x0
    ldr r4, _LIT0
    mov r0, #0xa
    b .L_220
.L_20c:
    ldr r2, [sp, #0xc]
    sub r3, r3, #0x30
    mla r5, r2, r0, r3
    ldrh r3, [ip, #0x2]!
    str r5, [sp, #0xc]
.L_220:
    cmp r3, #0x80
    movcs r2, r1
    bcs .L_238
    mov r2, r3, lsl #0x1
    ldrh r2, [r4, r2]
    and r2, r2, #0x8
.L_238:
    cmp r2, #0x0
    bne .L_20c
.L_240:
    cmp r3, #0x6c
    mov r0, #0x1
    bgt .L_278
    cmp r3, #0x68
    blt .L_26c
    beq .L_294
    cmp r3, #0x6a
    beq .L_2e0
    cmp r3, #0x6c
    beq .L_2b0
    b .L_304
.L_26c:
    cmp r3, #0x4c
    beq .L_2d4
    b .L_304
.L_278:
    cmp r3, #0x74
    bgt .L_288
    beq .L_2ec
    b .L_304
.L_288:
    cmp r3, #0x7a
    beq .L_2f8
    b .L_304
.L_294:
    ldrh r1, [ip, #0x2]
    mov r2, #0x2
    strb r2, [sp, #0x4]
    cmp r1, #0x68
    streqb r0, [sp, #0x4]
    ldreqh r3, [ip, #0x2]!
    b .L_308
.L_2b0:
    ldrh r1, [ip, #0x2]
    mov r2, #0x3
    strb r2, [sp, #0x4]
    cmp r1, #0x6c
    bne .L_308
    mov r1, #0x4
    strb r1, [sp, #0x4]
    ldrh r3, [ip, #0x2]!
    b .L_308
.L_2d4:
    mov r1, #0x9
    strb r1, [sp, #0x4]
    b .L_308
.L_2e0:
    mov r1, #0x6
    strb r1, [sp, #0x4]
    b .L_308
.L_2ec:
    mov r1, #0x8
    strb r1, [sp, #0x4]
    b .L_308
.L_2f8:
    mov r1, #0x7
    strb r1, [sp, #0x4]
    b .L_308
.L_304:
    mov r0, #0x0
.L_308:
    cmp r0, #0x0
    ldrneh r3, [ip, #0x2]!
    strh r3, [sp, #0x6]
    cmp r3, #0x61
    bgt .L_35c
    bge .L_440
    cmp r3, #0x47
    bgt .L_350
    subs r0, r3, #0x41
    addpl pc, pc, r0, lsl #0x2
    b .L_54c
    b .L_440
    b .L_54c
    b .L_54c
    b .L_54c
    b .L_488
    b .L_408
    b .L_478
.L_350:
    cmp r3, #0x58
    beq .L_3d0
    b .L_54c
.L_35c:
    cmp r3, #0x63
    bgt .L_36c
    beq .L_4e8
    b .L_54c
.L_36c:
    sub r0, r3, #0x64
    cmp r0, #0x14
    addls pc, pc, r0, lsl #0x2
    b .L_54c
    b .L_3d0
    b .L_488
    b .L_408
    b .L_478
    b .L_54c
    b .L_3d0
    b .L_54c
    b .L_54c
    b .L_54c
    b .L_54c
    b .L_538
    b .L_3d0
    b .L_4c4
    b .L_54c
    b .L_54c
    b .L_514
    b .L_54c
    b .L_3d0
    b .L_54c
    b .L_54c
    b .L_3d0
.L_3d0:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x9
    moveq r0, #0x4
    streqb r0, [sp, #0x4]
    ldrb r0, [sp, #0x2]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0xc]
    beq .L_554
    ldrb r0, [sp]
    cmp r0, #0x2
    moveq r0, #0x1
    streqb r0, [sp]
    b .L_554
.L_408:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x2
    cmpne r0, #0x6
    cmpne r0, #0x7
    cmpne r0, #0x8
    cmpne r0, #0x4
    ldreq r0, _LIT2
    streqh r0, [sp, #0x6]
    beq .L_554
    ldrb r0, [sp, #0x2]
    cmp r0, #0x0
    moveq r0, #0x6
    streq r0, [sp, #0xc]
    b .L_554
.L_440:
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
    b .L_554
.L_478:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0xc]
.L_488:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x2
    cmpne r0, #0x6
    cmpne r0, #0x7
    cmpne r0, #0x8
    cmpne r0, #0x4
    cmpne r0, #0x1
    ldreq r0, _LIT2
    streqh r0, [sp, #0x6]
    beq .L_554
    ldrb r0, [sp, #0x2]
    cmp r0, #0x0
    moveq r0, #0x6
    streq r0, [sp, #0xc]
    b .L_554
.L_4c4:
    mov r3, #0x3
    mov r2, #0x1
    mov r1, #0x78
    mov r0, #0x8
    strb r3, [sp, #0x4]
    strb r2, [sp, #0x3]
    strh r1, [sp, #0x6]
    str r0, [sp, #0xc]
    b .L_554
.L_4e8:
    ldrb r1, [sp, #0x4]
    cmp r1, #0x3
    moveq r0, #0x5
    streqb r0, [sp, #0x4]
    beq .L_554
    ldrb r0, [sp, #0x2]
    cmp r0, #0x0
    cmpeq r1, #0x0
    ldrne r0, _LIT2
    strneh r0, [sp, #0x6]
    b .L_554
.L_514:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x3
    moveq r0, #0x5
    streqb r0, [sp, #0x4]
    beq .L_554
    cmp r0, #0x0
    ldrne r0, _LIT2
    strneh r0, [sp, #0x6]
    b .L_554
.L_538:
    ldrb r0, [sp, #0x4]
    cmp r0, #0x9
    moveq r0, #0x4
    streqb r0, [sp, #0x4]
    b .L_554
.L_54c:
    ldr r0, _LIT2
    strh r0, [sp, #0x6]
.L_554:
    add r0, sp, #0x0
    ldmia r0, {r0, r1, r2, r3}
    stmia lr, {r0, r1, r2, r3}
    add r0, ip, #0x2
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_020c3898
_LIT1: .word 0x000001fd
_LIT2: .word 0x0000ffff
