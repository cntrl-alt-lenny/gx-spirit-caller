; func_ov006_021c7478 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern func_020060f4
        .extern func_02006148
        .extern func_02006160
        .extern func_02006178
        .extern func_020371b8
        .extern func_ov006_021c8e94
        .extern func_ov006_021c90d4
        .extern func_ov006_021c9abc
        .extern func_ov006_021c9bf4
        .global func_ov006_021c7478
        .arm
func_ov006_021c7478:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x14
    mov r4, r0
    ldr r0, _LIT0
    ldr r1, [r4]
    ldrh r5, [r0, #0x54]
    cmp r1, #0x0
    ldrh r6, [r0, #0x56]
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    bl func_02006178
    cmp r0, #0x0
    bne .L_50
    bl func_02006160
    cmp r0, #0x0
    beq .L_1ec
.L_50:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_020060f4
    ldr r1, [sp, #0x4]
    ldr r2, [sp]
    add r3, sp, #0x8
    mov r0, r4
    bl func_ov006_021c9abc
    bl func_02006148
    cmp r0, #0x0
    beq .L_98
    ldr r0, [sp, #0x8]
    str r0, [r4, #0x114]
    ldr r0, [sp, #0xc]
    str r0, [r4, #0x118]
    ldr r0, [sp, #0x10]
    str r0, [r4, #0x11c]
    b .L_1ac
.L_98:
    bl func_02006160
    cmp r0, #0x0
    beq .L_1ac
    ldr r5, [sp, #0x8]
    ldr r0, [r4, #0x114]
    mov r2, #0x0
    cmp r5, r0
    ldreq r1, [sp, #0xc]
    ldreq r0, [r4, #0x118]
    mov r3, r2
    cmpeq r1, r0
    moveq r3, #0x1
    cmp r3, #0x0
    beq .L_e0
    ldr r1, [sp, #0x10]
    ldr r0, [r4, #0x11c]
    cmp r1, r0
    moveq r2, #0x1
.L_e0:
    cmp r2, #0x0
    beq .L_1ac
    cmp r5, #0x1
    bne .L_110
    ldr r1, [r4, #0x80]
    ldr r2, [r4, #0x84]
    mov r0, r4
    bl func_ov006_021c9bf4
    movs r5, r0
    movpl r6, #0x1
    movmi r6, #0x0
    b .L_118
.L_110:
    mvn r5, #0x0
    mov r6, #0x1
.L_118:
    cmp r6, #0x0
    beq .L_130
    cmp r5, #0x0
    movge r0, #0x3a
    movlt r0, #0x91
    b .L_134
.L_130:
    mov r0, #0x43
.L_134:
    mvn r1, #0x0
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    cmp r6, #0x0
    beq .L_1ac
    str r5, [r4, #0x6c]
    ldr r0, [r4, #0x74]
    cmp r0, #0x7
    beq .L_168
    cmp r0, #0x8
    beq .L_18c
    b .L_1a0
.L_168:
    ldr r0, [r4, #0x84]
    cmp r0, #0x1
    moveq r0, #0x1
    beq .L_184
    cmp r0, #0x2
    moveq r0, #0x2
    movne r0, #0x0
.L_184:
    str r0, [r4, #0x70]
    b .L_1a0
.L_18c:
    ldr r0, [r4, #0x84]
    cmp r0, #0x1
    moveq r0, #0x3
    movne r0, #0x0
    str r0, [r4, #0x70]
.L_1a0:
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_1ac:
    ldr r0, [sp, #0x8]
    cmp r0, #0x1
    bne .L_1c8
    ldr r0, [sp, #0xc]
    str r0, [r4, #0x80]
    ldr r0, [sp, #0x10]
    str r0, [r4, #0x84]
.L_1c8:
    ldr r1, [r4, #0x80]
    ldr r0, [r4, #0xa0]
    cmp r1, r0
    ldreq r1, [r4, #0x84]
    ldreq r0, [r4, #0xa4]
    cmpeq r1, r0
    movne r0, #0x1
    strne r0, [r4, #0xa8]
    b .L_39c
.L_1ec:
    tst r5, #0x1
    beq .L_290
    ldr r1, [r4, #0x80]
    ldr r2, [r4, #0x84]
    mov r0, r4
    bl func_ov006_021c9bf4
    movs r5, r0
    mov r2, #0x0
    mov r3, #0x1
    bmi .L_280
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
    str r5, [r4, #0x6c]
    ldr r0, [r4, #0x74]
    cmp r0, #0x7
    beq .L_23c
    cmp r0, #0x8
    beq .L_260
    b .L_274
.L_23c:
    ldr r0, [r4, #0x84]
    cmp r0, #0x1
    moveq r0, #0x1
    beq .L_258
    cmp r0, #0x2
    moveq r0, #0x2
    movne r0, #0x0
.L_258:
    str r0, [r4, #0x70]
    b .L_274
.L_260:
    ldr r0, [r4, #0x84]
    cmp r0, #0x1
    moveq r0, #0x3
    movne r0, #0x0
    str r0, [r4, #0x70]
.L_274:
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_280:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_020371b8
    b .L_39c
.L_290:
    tst r5, #0x2
    beq .L_2c0
    mov r0, #0x91
    sub r1, r0, #0x92
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mvn r0, #0x0
    str r0, [r4, #0x6c]
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_2c0:
    tst r6, #0xf0
    beq .L_39c
    tst r6, #0x40
    beq .L_2f0
    ldr r0, [r4, #0x84]
    subs r0, r0, #0x1
    str r0, [r4, #0x84]
    bpl .L_364
    ldr r0, [r4, #0x7c]
    sub r0, r0, #0x1
    str r0, [r4, #0x84]
    b .L_364
.L_2f0:
    tst r6, #0x80
    beq .L_318
    ldr r0, [r4, #0x84]
    add r1, r0, #0x1
    str r1, [r4, #0x84]
    ldr r0, [r4, #0x7c]
    cmp r1, r0
    movge r0, #0x0
    strge r0, [r4, #0x84]
    b .L_364
.L_318:
    tst r6, #0x20
    beq .L_340
    ldr r0, [r4, #0x80]
    subs r0, r0, #0x1
    str r0, [r4, #0x80]
    bpl .L_364
    ldr r0, [r4, #0x78]
    sub r0, r0, #0x1
    str r0, [r4, #0x80]
    b .L_364
.L_340:
    tst r6, #0x10
    beq .L_364
    ldr r0, [r4, #0x80]
    add r1, r0, #0x1
    str r1, [r4, #0x80]
    ldr r0, [r4, #0x78]
    cmp r1, r0
    movge r0, #0x0
    strge r0, [r4, #0x80]
.L_364:
    ldr r1, [r4, #0x80]
    ldr r0, [r4, #0xa0]
    cmp r1, r0
    ldreq r1, [r4, #0x84]
    ldreq r0, [r4, #0xa4]
    cmpeq r1, r0
    beq .L_39c
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x1
    str r0, [r4, #0xa8]
.L_39c:
    ldr r0, [r4, #0xa8]
    cmp r0, #0x0
    beq .L_3c8
    mov r0, r4
    bl func_ov006_021c90d4
    ldr r1, [r4, #0x80]
    mov r0, #0x0
    str r1, [r4, #0xa0]
    ldr r1, [r4, #0x84]
    str r1, [r4, #0xa4]
    str r0, [r4, #0xa8]
.L_3c8:
    mov r0, r4
    bl func_ov006_021c8e94
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_02104acc
