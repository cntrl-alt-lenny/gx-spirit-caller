; func_02096848 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021024b4
        .extern func_02094688
        .extern func_020965ac
        .extern func_02097074
        .extern func_02098388
        .global func_02096848
        .arm
func_02096848:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xe4
    mov r4, r0
    ldr r1, [r4, #0x8]
    add r0, sp, #0x98
    add fp, r4, #0x30
    str r1, [sp]
    bl func_02098388
    ldr r0, [r4, #0x8]
    str r0, [sp, #0xa0]
    ldr r0, [r4, #0xc]
    ands r0, r0, #0x20
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldrneh r5, [r4, #0x24]
    movne r4, #0x10000
    bne .L_178
    ldrh r0, [fp, #0x8]
    ldr r4, [r4, #0x20]
    cmp r0, #0x0
    ldrneh r5, [fp, #0xa]
    bne .L_178
    mov sl, #0x0
    mov r9, sl
    mov r5, #0x10000
    add r8, sp, #0x98
    mov r6, #0x3
    mov r7, #0x1
.L_100:
    mov r0, r8
    mov r1, sl
    bl func_02097074
    add r2, sp, #0x4
    cmp sl, #0x0
    mov r0, r8
    mov r1, r6
    ldreq r9, [sp, #0xc4]
    str r2, [sp, #0xc8]
    str r7, [sp, #0xcc]
    bl func_020965ac
    cmp r0, #0x0
    bne .L_164
.L_134:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    bne .L_150
    ldr r0, [sp, #0x8]
    cmp r0, r4
    ldreqh r5, [sp, #0xbc]
    beq .L_164
.L_150:
    mov r0, r8
    mov r1, r6
    bl func_020965ac
    cmp r0, #0x0
    beq .L_134
.L_164:
    cmp r5, #0x10000
    bne .L_178
    add sl, sl, #0x1
    cmp sl, r9
    bcc .L_100
.L_178:
    cmp r5, #0x10000
    moveq r0, #0x0
    streqh r0, [fp, #0x8]
    addeq sp, sp, #0xe4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    ldrh r0, [fp, #0x8]
    cmp r0, #0x0
    bne .L_274
    ldr r0, [sp]
    mov r1, #0x0
    ldr r0, [r0]
    cmp r0, #0xff
    addls r9, r1, #0x1
    bls .L_1c4
    cmp r0, #0xff00
    addls r9, r1, #0x2
    addhi r9, r1, #0x3
.L_1c4:
    cmp r4, #0x10000
    ldrne r0, [sp, #0x14]
    add r9, r9, #0x2
    addne r9, r9, r0
    mov sl, r5
    cmp r5, #0x0
    beq .L_268
    add r0, sp, #0x98
    mov r1, r5
    bl func_02097074
    add r8, sp, #0x98
    mov r6, #0x3
    mov r7, #0x1
.L_1f8:
    ldr r1, [sp, #0xc4]
    mov r0, r8
    bl func_02097074
    add r2, sp, #0x4
    mov r0, r8
    mov r1, r6
    str r2, [sp, #0xc8]
    str r7, [sp, #0xcc]
    bl func_020965ac
    cmp r0, #0x0
    bne .L_25c
.L_224:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_248
    ldrh r0, [sp, #0x8]
    cmp r0, sl
    ldreq r0, [sp, #0x14]
    addeq r0, r0, #0x1
    addeq r9, r9, r0
    beq .L_25c
.L_248:
    mov r0, r8
    mov r1, r6
    bl func_020965ac
    cmp r0, #0x0
    beq .L_224
.L_25c:
    ldrh sl, [sp, #0xbc]
    cmp sl, #0x0
    bne .L_1f8
.L_268:
    add r0, r9, #0x1
    strh r0, [fp, #0x8]
    strh r5, [fp, #0xa]
.L_274:
    ldr r7, [fp]
    cmp r7, #0x0
    addeq sp, sp, #0xe4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    ldrh r6, [fp, #0x8]
    ldr r0, [fp, #0x4]
    cmp r0, r6
    addcc sp, sp, #0xe4
    movcc r0, #0x1
    ldmccia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxcc lr
    ldr r0, [sp]
    mov r9, #0x0
    ldr r0, [r0]
    cmp r0, #0xff
    movls r8, #0x1
    bls .L_2cc
    cmp r0, #0xff00
    movls r8, #0x2
    movhi r8, #0x3
.L_2cc:
    ldr r0, [sp]
    mov r1, r7
    mov r2, r8
    bl func_02094688
    add r1, r9, r8
    ldr r0, _LIT0
    add r1, r7, r1
    mov r2, #0x2
    bl func_02094688
    add r0, sp, #0x98
    mov r1, r5
    bl func_02097074
    cmp r4, #0x10000
    beq .L_380
    add r3, sp, #0x4
    mov r2, #0x0
    add r0, sp, #0x98
    mov r1, #0x3
    str r3, [sp, #0xc8]
    str r2, [sp, #0xcc]
    bl func_020965ac
    cmp r0, #0x0
    bne .L_35c
    add r9, sp, #0x98
    mov r8, #0x3
.L_330:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    bne .L_348
    ldr r0, [sp, #0x8]
    cmp r0, r4
    beq .L_35c
.L_348:
    mov r0, r9
    mov r1, r8
    bl func_020965ac
    cmp r0, #0x0
    beq .L_330
.L_35c:
    ldr r0, [sp, #0x14]
    add r1, r7, r6
    add r4, r0, #0x1
    add r0, sp, #0x18
    mov r2, r4
    sub r1, r1, r4
    bl func_02094688
    sub r6, r6, r4
    b .L_390
.L_380:
    add r0, r7, r6
    mov r1, #0x0
    strb r1, [r0, #-1]
    sub r6, r6, #0x1
.L_390:
    cmp r5, #0x0
    beq .L_438
    add sl, sp, #0x98
    add fp, sp, #0x4
    mov r4, #0x3
    mov r9, #0x0
    mov r8, #0x2f
.L_3ac:
    ldr r1, [sp, #0xc4]
    mov r0, sl
    bl func_02097074
    add r2, r7, r6
    mov r0, sl
    mov r1, r4
    str fp, [sp, #0xc8]
    str r9, [sp, #0xcc]
    strb r8, [r2, #-1]
    sub r6, r6, #0x1
    bl func_020965ac
    cmp r0, #0x0
    bne .L_42c
.L_3e0:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_418
    ldrh r0, [sp, #0x8]
    cmp r0, r5
    bne .L_418
    ldr r5, [sp, #0x14]
    add r1, r7, r6
    add r0, sp, #0x18
    mov r2, r5
    sub r1, r1, r5
    bl func_02094688
    sub r6, r6, r5
    b .L_42c
.L_418:
    mov r0, sl
    mov r1, r4
    bl func_020965ac
    cmp r0, #0x0
    beq .L_3e0
.L_42c:
    ldrh r5, [sp, #0xbc]
    cmp r5, #0x0
    bne .L_3ac
.L_438:
    mov r0, #0x0
    add sp, sp, #0xe4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_021024b4
