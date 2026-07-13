; func_020a8d50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102a94
        .extern func_020a72f0
        .extern func_020a73e8
        .extern func_020a7530
        .extern func_020a7ac0
        .extern func_020a7d0c
        .extern func_020a7fec
        .extern func_020a85ec
        .extern func_020aaddc
        .extern func_020ab088
        .global func_020a8d50
        .arm
func_020a8d50:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x22c
    mov r3, #0x20
    mov fp, r2
    strb r3, [sp, #0x19]
    ldrsb r2, [fp]
    mov r9, r0
    mov r8, r1
    cmp r2, #0x0
    mov sl, #0x0
    beq .L_808
.L_30:
    mov r0, fp
    mov r1, #0x25
    bl func_020ab088
    str r0, [sp, #0xc]
    cmp r0, #0x0
    bne .L_84
    mov r0, fp
    bl func_020aaddc
    movs r2, r0
    add sl, sl, r2
    beq .L_808
    mov r0, r8
    mov r1, fp
    blx r9
    cmp r0, #0x0
    bne .L_808
    add sp, sp, #0x22c
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_84:
    subs r2, r0, fp
    add sl, sl, r2
    beq .L_b4
    mov r0, r8
    mov r1, fp
    blx r9
    cmp r0, #0x0
    addeq sp, sp, #0x22c
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addeq sp, sp, #0x10
    bxeq lr
.L_b4:
    ldr r0, [sp, #0xc]
    add r1, sp, #0x25c
    add r2, sp, #0x1c
    bl func_020a7530
    ldrb r1, [sp, #0x21]
    mov fp, r0
    cmp r1, #0x61
    bgt .L_120
    bge .L_484
    cmp r1, #0x47
    bgt .L_114
    subs r0, r1, #0x41
    addpl pc, pc, r0, lsl #0x2
    b .L_108
    b .L_484
    b .L_66c
    b .L_66c
    b .L_66c
    b .L_41c
    b .L_41c
    b .L_41c
.L_108:
    cmp r1, #0x25
    beq .L_658
    b .L_66c
.L_114:
    cmp r1, #0x58
    beq .L_2e0
    b .L_66c
.L_120:
    cmp r1, #0x75
    bgt .L_188
    subs r0, r1, #0x64
    addpl pc, pc, r0, lsl #0x2
    b .L_17c
    b .L_1a0
    b .L_41c
    b .L_41c
    b .L_41c
    b .L_66c
    b .L_1a0
    b .L_66c
    b .L_66c
    b .L_66c
    b .L_66c
    b .L_5ac
    b .L_2e0
    b .L_66c
    b .L_66c
    b .L_66c
    b .L_4ec
    b .L_66c
    b .L_2e0
.L_17c:
    cmp r1, #0x63
    beq .L_638
    b .L_66c
.L_188:
    cmp r1, #0x78
    bgt .L_198
    beq .L_2e0
    b .L_66c
.L_198:
    cmp r1, #0xff
    b .L_66c
.L_1a0:
    ldrb r0, [sp, #0x20]
    cmp r0, #0x3
    bne .L_1c0
    ldr r1, [sp, #0x25c]
    add r1, r1, #0x4
    str r1, [sp, #0x25c]
    ldr r5, [r1, #-4]
    b .L_258
.L_1c0:
    cmp r0, #0x4
    bne .L_1e8
    ldr r1, [sp, #0x25c]
    add r2, r1, #0x8
    str r2, [sp, #0x25c]
    ldr r1, [r2, #-8]
    str r1, [sp, #0x10]
    ldr r1, [r2, #-4]
    str r1, [sp, #0x14]
    b .L_258
.L_1e8:
    cmp r0, #0x6
    bne .L_210
    ldr r1, [sp, #0x25c]
    add r2, r1, #0x8
    str r2, [sp, #0x25c]
    ldr r1, [r2, #-8]
    str r1, [sp, #0x10]
    ldr r1, [r2, #-4]
    str r1, [sp, #0x14]
    b .L_258
.L_210:
    cmp r0, #0x7
    bne .L_22c
    ldr r1, [sp, #0x25c]
    add r1, r1, #0x4
    str r1, [sp, #0x25c]
    ldr r5, [r1, #-4]
    b .L_258
.L_22c:
    cmp r0, #0x8
    bne .L_248
    ldr r1, [sp, #0x25c]
    add r1, r1, #0x4
    str r1, [sp, #0x25c]
    ldr r5, [r1, #-4]
    b .L_258
.L_248:
    ldr r1, [sp, #0x25c]
    add r1, r1, #0x4
    str r1, [sp, #0x25c]
    ldr r5, [r1, #-4]
.L_258:
    cmp r0, #0x2
    moveq r1, r5, lsl #0x10
    moveq r5, r1, asr #0x10
    cmp r0, #0x1
    moveq r1, r5, lsl #0x18
    moveq r5, r1, asr #0x18
    cmp r0, #0x4
    cmpne r0, #0x6
    add r0, sp, #0x1c
    bne .L_2ac
    sub r4, sp, #0x4
    ldmia r0, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    ldr r3, [r4]
    ldr r0, [sp, #0x10]
    ldr r1, [sp, #0x14]
    add r2, sp, #0x22c
    bl func_020a7d0c
    movs r7, r0
    beq .L_66c
    b .L_2d0
.L_2ac:
    sub r4, sp, #0x8
    ldmia r0, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    add r1, sp, #0x22c
    mov r0, r5
    ldmia r4, {r2, r3}
    bl func_020a7ac0
    movs r7, r0
    beq .L_66c
.L_2d0:
    add r0, sp, #0x200
    add r0, r0, #0x2b
    sub r6, r0, r7
    b .L_6b8
.L_2e0:
    ldrb r0, [sp, #0x20]
    cmp r0, #0x3
    bne .L_300
    ldr r1, [sp, #0x25c]
    add r1, r1, #0x4
    str r1, [sp, #0x25c]
    ldr r5, [r1, #-4]
    b .L_398
.L_300:
    cmp r0, #0x4
    bne .L_328
    ldr r1, [sp, #0x25c]
    add r2, r1, #0x8
    str r2, [sp, #0x25c]
    ldr r1, [r2, #-8]
    str r1, [sp, #0x10]
    ldr r1, [r2, #-4]
    str r1, [sp, #0x14]
    b .L_398
.L_328:
    cmp r0, #0x6
    bne .L_350
    ldr r1, [sp, #0x25c]
    add r2, r1, #0x8
    str r2, [sp, #0x25c]
    ldr r1, [r2, #-8]
    str r1, [sp, #0x10]
    ldr r1, [r2, #-4]
    str r1, [sp, #0x14]
    b .L_398
.L_350:
    cmp r0, #0x7
    bne .L_36c
    ldr r1, [sp, #0x25c]
    add r1, r1, #0x4
    str r1, [sp, #0x25c]
    ldr r5, [r1, #-4]
    b .L_398
.L_36c:
    cmp r0, #0x8
    bne .L_388
    ldr r1, [sp, #0x25c]
    add r1, r1, #0x4
    str r1, [sp, #0x25c]
    ldr r5, [r1, #-4]
    b .L_398
.L_388:
    ldr r1, [sp, #0x25c]
    add r1, r1, #0x4
    str r1, [sp, #0x25c]
    ldr r5, [r1, #-4]
.L_398:
    cmp r0, #0x2
    moveq r1, r5, lsl #0x10
    moveq r5, r1, lsr #0x10
    cmp r0, #0x1
    andeq r5, r5, #0xff
    cmp r0, #0x4
    cmpne r0, #0x6
    add r0, sp, #0x1c
    bne .L_3e8
    sub r4, sp, #0x4
    ldmia r0, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    ldr r3, [r4]
    ldr r0, [sp, #0x10]
    ldr r1, [sp, #0x14]
    add r2, sp, #0x22c
    bl func_020a7d0c
    movs r7, r0
    beq .L_66c
    b .L_40c
.L_3e8:
    sub r4, sp, #0x8
    ldmia r0, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    add r1, sp, #0x22c
    mov r0, r5
    ldmia r4, {r2, r3}
    bl func_020a7ac0
    movs r7, r0
    beq .L_66c
.L_40c:
    add r0, sp, #0x200
    add r0, r0, #0x2b
    sub r6, r0, r7
    b .L_6b8
.L_41c:
    ldrb r0, [sp, #0x20]
    cmp r0, #0x9
    ldrne r0, [sp, #0x25c]
    addne r0, r0, #0x8
    strne r0, [sp, #0x25c]
    bne .L_440
    ldr r0, [sp, #0x25c]
    add r0, r0, #0x8
    str r0, [sp, #0x25c]
.L_440:
    ldr r7, [r0, #-8]
    ldr r6, [r0, #-4]
    add r0, sp, #0x1c
    sub r4, sp, #0x4
    ldmia r0, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    ldr r3, [r4]
    mov r0, r7
    mov r1, r6
    add r2, sp, #0x22c
    bl func_020a85ec
    movs r7, r0
    beq .L_66c
    add r0, sp, #0x200
    add r0, r0, #0x2b
    sub r6, r0, r7
    b .L_6b8
.L_484:
    ldrb r0, [sp, #0x20]
    cmp r0, #0x9
    ldrne r0, [sp, #0x25c]
    addne r0, r0, #0x8
    strne r0, [sp, #0x25c]
    bne .L_4a8
    ldr r0, [sp, #0x25c]
    add r0, r0, #0x8
    str r0, [sp, #0x25c]
.L_4a8:
    ldr r7, [r0, #-8]
    ldr r6, [r0, #-4]
    add r0, sp, #0x1c
    sub r4, sp, #0x4
    ldmia r0, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    ldr r3, [r4]
    mov r0, r7
    mov r1, r6
    add r2, sp, #0x22c
    bl func_020a7fec
    movs r7, r0
    beq .L_66c
    add r0, sp, #0x200
    add r0, r0, #0x2b
    sub r6, r0, r7
    b .L_6b8
.L_4ec:
    ldrb r0, [sp, #0x20]
    cmp r0, #0x5
    bne .L_52c
    ldr r0, [sp, #0x25c]
    mov r2, #0x200
    add r0, r0, #0x4
    str r0, [sp, #0x25c]
    ldr r1, [r0, #-4]
    add r0, sp, #0x2c
    cmp r1, #0x0
    ldreq r1, _LIT0
    bl func_020a72f0
    cmp r0, #0x0
    blt .L_66c
    add r7, sp, #0x2c
    b .L_53c
.L_52c:
    ldr r0, [sp, #0x25c]
    add r0, r0, #0x4
    str r0, [sp, #0x25c]
    ldr r7, [r0, #-4]
.L_53c:
    ldrb r0, [sp, #0x1f]
    cmp r7, #0x0
    ldreq r7, _LIT1
    cmp r0, #0x0
    beq .L_570
    ldrb r0, [sp, #0x1e]
    ldrb r6, [r7], #0x1
    cmp r0, #0x0
    beq .L_6b8
    ldr r0, [sp, #0x28]
    cmp r6, r0
    movgt r6, r0
    b .L_6b8
.L_570:
    ldrb r0, [sp, #0x1e]
    cmp r0, #0x0
    beq .L_59c
    ldr r6, [sp, #0x28]
    mov r0, r7
    mov r2, r6
    mov r1, #0x0
    bl func_020a73e8
    cmp r0, #0x0
    subne r6, r0, r7
    b .L_6b8
.L_59c:
    mov r0, r7
    bl func_020aaddc
    mov r6, r0
    b .L_6b8
.L_5ac:
    ldr r1, [sp, #0x25c]
    ldrb r0, [sp, #0x20]
    add r1, r1, #0x4
    str r1, [sp, #0x25c]
    ldr r1, [r1, #-4]
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_7fc
    b .L_5f0
    b .L_7fc
    b .L_5f8
    b .L_600
    b .L_628
    b .L_7fc
    b .L_608
    b .L_618
    b .L_620
.L_5f0:
    str sl, [r1]
    b .L_7fc
.L_5f8:
    strh sl, [r1]
    b .L_7fc
.L_600:
    str sl, [r1]
    b .L_7fc
.L_608:
    str sl, [r1]
    mov r0, sl, asr #0x1f
    str r0, [r1, #0x4]
    b .L_7fc
.L_618:
    str sl, [r1]
    b .L_7fc
.L_620:
    str sl, [r1]
    b .L_7fc
.L_628:
    str sl, [r1]
    mov r0, sl, asr #0x1f
    str r0, [r1, #0x4]
    b .L_7fc
.L_638:
    ldr r0, [sp, #0x25c]
    add r7, sp, #0x2c
    add r0, r0, #0x4
    str r0, [sp, #0x25c]
    ldr r0, [r0, #-4]
    mov r6, #0x1
    strb r0, [sp, #0x2c]
    b .L_6b8
.L_658:
    mov r0, #0x25
    strb r0, [sp, #0x2c]
    add r7, sp, #0x2c
    mov r6, #0x1
    b .L_6b8
.L_66c:
    ldr r0, [sp, #0xc]
    bl func_020aaddc
    movs r4, r0
    beq .L_6a4
    ldr r1, [sp, #0xc]
    mov r0, r8
    mov r2, r4
    blx r9
    cmp r0, #0x0
    addeq sp, sp, #0x22c
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addeq sp, sp, #0x10
    bxeq lr
.L_6a4:
    add sp, sp, #0x22c
    add r0, sl, r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_6b8:
    ldrb r0, [sp, #0x1c]
    mov r4, r6
    cmp r0, #0x0
    beq .L_76c
    cmp r0, #0x2
    moveq r0, #0x30
    movne r0, #0x20
    strb r0, [sp, #0x19]
    ldrsb r0, [r7]
    cmp r0, #0x2b
    cmpne r0, #0x2d
    cmpne r0, #0x20
    bne .L_728
    ldrsb r0, [sp, #0x19]
    cmp r0, #0x30
    bne .L_728
    mov r0, r8
    mov r1, r7
    mov r2, #0x1
    blx r9
    cmp r0, #0x0
    addeq sp, sp, #0x22c
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addeq sp, sp, #0x10
    bxeq lr
    add r7, r7, #0x1
    sub r6, r6, #0x1
.L_728:
    ldr r0, [sp, #0x24]
    cmp r4, r0
    bge .L_76c
.L_734:
    mov r0, r8
    add r1, sp, #0x19
    mov r2, #0x1
    blx r9
    cmp r0, #0x0
    addeq sp, sp, #0x22c
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addeq sp, sp, #0x10
    bxeq lr
    ldr r0, [sp, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_734
.L_76c:
    cmp r6, #0x0
    beq .L_79c
    mov r0, r8
    mov r1, r7
    mov r2, r6
    blx r9
    cmp r0, #0x0
    addeq sp, sp, #0x22c
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addeq sp, sp, #0x10
    bxeq lr
.L_79c:
    ldrb r0, [sp, #0x1c]
    cmp r0, #0x0
    bne .L_7f8
    ldr r0, [sp, #0x24]
    cmp r4, r0
    bge .L_7f8
    mov r6, #0x20
    add r7, sp, #0x18
.L_7bc:
    mov r0, r8
    mov r1, r7
    mov r2, #0x1
    strb r6, [sp, #0x18]
    blx r9
    cmp r0, #0x0
    addeq sp, sp, #0x22c
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addeq sp, sp, #0x10
    bxeq lr
    ldr r0, [sp, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_7bc
.L_7f8:
    add sl, sl, r4
.L_7fc:
    ldrsb r0, [fp]
    cmp r0, #0x0
    bne .L_30
.L_808:
    mov r0, sl
    add sp, sp, #0x22c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word data_02102a94+0x4
_LIT1: .word data_02102a94+0x8
