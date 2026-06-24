; func_02096754 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021023d4
        .extern func_02094688
        .extern func_020964b8
        .extern func_02096f80
        .extern func_02098294
        .global func_02096754
        .arm
func_02096754:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xe4
    mov r4, r0
    ldr r1, [r4, #0x8]
    add r0, sp, #0x98
    add fp, r4, #0x30
    str r1, [sp]
    bl func_02098294
    ldr r0, [r4, #0x8]
    str r0, [sp, #0xa0]
    ldr r0, [r4, #0xc]
    ands r0, r0, #0x20
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldrneh r5, [r4, #0x24]
    movne r4, #0x10000
    bne .L_ec
    ldrh r0, [fp, #0x8]
    ldr r4, [r4, #0x20]
    cmp r0, #0x0
    ldrneh r5, [fp, #0xa]
    bne .L_ec
    mov sl, #0x0
    mov r9, sl
    mov r5, #0x10000
    add r8, sp, #0x98
    mov r6, #0x3
    mov r7, #0x1
.L_74:
    mov r0, r8
    mov r1, sl
    bl func_02096f80
    add r2, sp, #0x4
    cmp sl, #0x0
    mov r0, r8
    mov r1, r6
    ldreq r9, [sp, #0xc4]
    str r2, [sp, #0xc8]
    str r7, [sp, #0xcc]
    bl func_020964b8
    cmp r0, #0x0
    bne .L_d8
.L_a8:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    bne .L_c4
    ldr r0, [sp, #0x8]
    cmp r0, r4
    ldreqh r5, [sp, #0xbc]
    beq .L_d8
.L_c4:
    mov r0, r8
    mov r1, r6
    bl func_020964b8
    cmp r0, #0x0
    beq .L_a8
.L_d8:
    cmp r5, #0x10000
    bne .L_ec
    add sl, sl, #0x1
    cmp sl, r9
    bcc .L_74
.L_ec:
    cmp r5, #0x10000
    moveq r0, #0x0
    streqh r0, [fp, #0x8]
    addeq sp, sp, #0xe4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    ldrh r0, [fp, #0x8]
    cmp r0, #0x0
    bne .L_1e8
    ldr r0, [sp]
    mov r1, #0x0
    ldr r0, [r0]
    cmp r0, #0xff
    addls r9, r1, #0x1
    bls .L_138
    cmp r0, #0xff00
    addls r9, r1, #0x2
    addhi r9, r1, #0x3
.L_138:
    cmp r4, #0x10000
    ldrne r0, [sp, #0x14]
    add r9, r9, #0x2
    addne r9, r9, r0
    mov sl, r5
    cmp r5, #0x0
    beq .L_1dc
    add r0, sp, #0x98
    mov r1, r5
    bl func_02096f80
    add r8, sp, #0x98
    mov r6, #0x3
    mov r7, #0x1
.L_16c:
    ldr r1, [sp, #0xc4]
    mov r0, r8
    bl func_02096f80
    add r2, sp, #0x4
    mov r0, r8
    mov r1, r6
    str r2, [sp, #0xc8]
    str r7, [sp, #0xcc]
    bl func_020964b8
    cmp r0, #0x0
    bne .L_1d0
.L_198:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_1bc
    ldrh r0, [sp, #0x8]
    cmp r0, sl
    ldreq r0, [sp, #0x14]
    addeq r0, r0, #0x1
    addeq r9, r9, r0
    beq .L_1d0
.L_1bc:
    mov r0, r8
    mov r1, r6
    bl func_020964b8
    cmp r0, #0x0
    beq .L_198
.L_1d0:
    ldrh sl, [sp, #0xbc]
    cmp sl, #0x0
    bne .L_16c
.L_1dc:
    add r0, r9, #0x1
    strh r0, [fp, #0x8]
    strh r5, [fp, #0xa]
.L_1e8:
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
    bls .L_240
    cmp r0, #0xff00
    movls r8, #0x2
    movhi r8, #0x3
.L_240:
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
    bl func_02096f80
    cmp r4, #0x10000
    beq .L_2f4
    add r3, sp, #0x4
    mov r2, #0x0
    add r0, sp, #0x98
    mov r1, #0x3
    str r3, [sp, #0xc8]
    str r2, [sp, #0xcc]
    bl func_020964b8
    cmp r0, #0x0
    bne .L_2d0
    add r9, sp, #0x98
    mov r8, #0x3
.L_2a4:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    bne .L_2bc
    ldr r0, [sp, #0x8]
    cmp r0, r4
    beq .L_2d0
.L_2bc:
    mov r0, r9
    mov r1, r8
    bl func_020964b8
    cmp r0, #0x0
    beq .L_2a4
.L_2d0:
    ldr r0, [sp, #0x14]
    add r1, r7, r6
    add r4, r0, #0x1
    add r0, sp, #0x18
    mov r2, r4
    sub r1, r1, r4
    bl func_02094688
    sub r6, r6, r4
    b .L_304
.L_2f4:
    add r0, r7, r6
    mov r1, #0x0
    strb r1, [r0, #-1]
    sub r6, r6, #0x1
.L_304:
    cmp r5, #0x0
    beq .L_3ac
    add sl, sp, #0x98
    add fp, sp, #0x4
    mov r4, #0x3
    mov r9, #0x0
    mov r8, #0x2f
.L_320:
    ldr r1, [sp, #0xc4]
    mov r0, sl
    bl func_02096f80
    add r2, r7, r6
    mov r0, sl
    mov r1, r4
    str fp, [sp, #0xc8]
    str r9, [sp, #0xcc]
    strb r8, [r2, #-1]
    sub r6, r6, #0x1
    bl func_020964b8
    cmp r0, #0x0
    bne .L_3a0
.L_354:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_38c
    ldrh r0, [sp, #0x8]
    cmp r0, r5
    bne .L_38c
    ldr r5, [sp, #0x14]
    add r1, r7, r6
    add r0, sp, #0x18
    mov r2, r5
    sub r1, r1, r5
    bl func_02094688
    sub r6, r6, r5
    b .L_3a0
.L_38c:
    mov r0, sl
    mov r1, r4
    bl func_020964b8
    cmp r0, #0x0
    beq .L_354
.L_3a0:
    ldrh r5, [sp, #0xbc]
    cmp r5, #0x0
    bne .L_320
.L_3ac:
    mov r0, #0x0
    add sp, sp, #0xe4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_021023d4
