; func_020712c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee00
        .extern data_0219ee2c
        .extern data_0219f458
        .extern func_02092fc8
        .extern func_02094688
        .global func_020712c4
        .arm
func_020712c4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov r6, #0x0
    mov sl, r0
    str r6, [r1]
    ldrh r3, [sl, #0x6]
    str r1, [sp]
    ldr r2, _LIT0
    mov r1, r3, asr #0x8
    orr r1, r1, r3, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [sp, #0x4]
    ands r1, r1, r2
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    ldrh r1, [sl, #0xc]
    ldrh r3, [sl, #0xe]
    ldrb r4, [sl]
    mov r0, r1, asr #0x8
    orr r0, r0, r1, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r1, r3, asr #0x8
    mov r2, r0, lsr #0x10
    orr r0, r1, r3, lsl #0x8
    and r3, r4, #0xf
    ldrh r9, [sl, #0x4]
    mov r2, r2, lsl #0x10
    mov r1, r0, lsl #0x10
    ldr r5, _LIT1
    mov r0, r6
    mov r7, r3, lsl #0x2
    orr r4, r2, r1, lsr #0x10
.L_88:
    ldrh r2, [r5, #0x4]
    cmp r2, #0x0
    beq .L_ac
    ldr r1, [r5]
    cmp r1, r4
    bne .L_ac
    ldrh r1, [r5, #0x6]
    cmp r1, r9
    beq .L_cc
.L_ac:
    cmp r2, #0x0
    bne .L_bc
    cmp r6, #0x0
    moveq r6, r5
.L_bc:
    add r0, r0, #0x1
    cmp r0, #0x8
    add r5, r5, #0x38
    bcc .L_88
.L_cc:
    ldrh r2, [sl, #0x2]
    cmp r0, #0x8
    ldr r1, _LIT2
    mov r0, r2, asr #0x8
    orr r0, r0, r2, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, [sp, #0x4]
    and r8, r0, r1
    sub r0, r2, r7
    str r0, [sp, #0x8]
    mov r0, r8, lsl #0x3
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x8]
    add fp, r0, r8, lsl #0x3
    bne .L_1a4
    cmp r6, #0x0
    beq .L_11c
    cmp fp, #0x1000
    bls .L_12c
.L_11c:
    add sp, sp, #0x14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_12c:
    ldr r1, _LIT3
    ldr r0, _LIT4
    ldr r1, [r1]
    add r0, r7, r0
    mov r5, r6
    blx r1
    str r0, [r6, #0x34]
    ldr r0, [r6, #0x34]
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    str r4, [r6]
    strh r9, [r6, #0x6]
    mov r0, #0x0
    strh r0, [r6, #0x8]
    bl func_02092fc8
    mov r0, r0, lsr #0x10
    orr r0, r0, r1, lsl #0x10
    str r0, [r6, #0x2c]
    ldr r1, [r6, #0x34]
    mov r0, sl
    add r1, r1, #0xe
    add r1, r1, r7
    str r1, [r6, #0x30]
    ldr r1, [r6, #0x34]
    mov r2, r7
    add r1, r1, #0xe
    bl func_02094688
.L_1a4:
    ldrh r0, [r5, #0x4]
    cmp r0, #0x8
    beq .L_1b8
    cmp fp, #0x1000
    bls .L_1e0
.L_1b8:
    mov r0, #0x0
    strh r0, [r5, #0x4]
    ldr r1, _LIT5
    ldr r0, [r5, #0x34]
    ldr r1, [r1]
    blx r1
    add sp, sp, #0x14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_1e0:
    ldr r0, [sp, #0x8]
    ldr r2, [sp, #0x8]
    add r0, r0, #0x7
    add r1, r8, r0, lsr #0x3
    ldr r0, [sp, #0x4]
    ands r0, r0, #0x2000
    streqh fp, [r5, #0xa]
    streqh r1, [r5, #0x8]
    ldrh r3, [r5, #0x4]
    add r0, sl, r7
    add r3, r5, r3, lsl #0x1
    strh r8, [r3, #0xc]
    ldrh r3, [r5, #0x4]
    add r3, r5, r3, lsl #0x1
    strh r1, [r3, #0x1c]
    ldrh r1, [r5, #0x4]
    add r1, r1, #0x1
    strh r1, [r5, #0x4]
    ldr r3, [r5, #0x30]
    ldr r1, [sp, #0xc]
    add r1, r3, r1
    bl func_02094688
    ldrh r6, [r5, #0x8]
    cmp r6, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    ldrh r7, [r5, #0x4]
    mov r3, #0x0
    mov r4, r3
    cmp r7, #0x0
    bls .L_298
    mov r0, r3
.L_268:
    add r2, r5, r4, lsl #0x1
    ldrh r1, [r2, #0xc]
    cmp r1, r3
    bhi .L_28c
    ldrh r1, [r2, #0x1c]
    cmp r3, r1
    movcc r3, r1
    movcc r4, r0
    bcc .L_290
.L_28c:
    add r4, r4, #0x1
.L_290:
    cmp r4, r7
    bcc .L_268
.L_298:
    cmp r3, r6
    addcc sp, sp, #0x14
    movcc r0, #0x0
    ldmccia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxcc lr
    ldr r0, [r5, #0x34]
    ldrh r3, [r5, #0xa]
    ldrb r1, [r0, #0xe]
    add r0, r0, #0xe
    mov r2, #0x0
    and r1, r1, #0xf
    add r1, r3, r1, lsl #0x2
    mov r1, r1, lsl #0x10
    mov r3, r1, lsr #0x10
    mov r1, r3, asr #0x8
    orr r1, r1, r3, lsl #0x8
    strh r1, [r0, #0x2]
    strh r2, [r5, #0x4]
    ldr r1, [sp]
    mov r2, #0x1
    str r2, [r1]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word 0x00003fff
_LIT1: .word data_0219f458
_LIT2: .word 0x00001fff
_LIT3: .word data_0219ee00
_LIT4: .word 0x0000100e
_LIT5: .word data_0219ee2c
