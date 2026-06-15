; func_02022644 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6894
        .extern func_02022224
        .extern func_020224c0
        .extern func_02022540
        .extern func_02022580
        .extern func_020225b4
        .extern func_02022608
        .global func_02022644
        .arm
func_02022644:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x20
    mov r9, r0
    mov r8, r1
    mov r7, r2
    mov r4, #0x0
    bl func_02022224
    ldr r2, [r9]
    mov r6, r0
    ldr r1, [r2]
    ldr r0, [r2, #0x4]
    mov r1, r1, lsr #0x14
    mov r2, r0, lsl #0x10
    mov r0, r9
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [sp, #0x14]
    ldr r2, [r9]
    mov r0, r9
    ldmia r2, {r1, r2}
    mov r2, r2, lsr #0x10
    mov r1, r1, lsr #0x14
    mov r2, r2, lsl #0x10
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [sp, #0x18]
    ldr r2, [r9]
    mov r0, r9
    ldr r1, [r2]
    ldr r2, [r2, #0x8]
    mov r1, r1, lsr #0x14
    mov r2, r2, lsl #0x10
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [sp, #0x1c]
    ldr r0, [r9]
    ldr r1, [r0]
    mov r0, r1, lsl #0x10
    movs r5, r0, asr #0x10
    bne .L_23c
    ldrb r0, [r8, #0xf]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_1f4
    ldrsh r0, [r8, #0xc]
    bl func_02022580
    mvn r0, #0x0
    strh r0, [r8, #0xc]
    ldrb r0, [r8, #0xf]
    bic r0, r0, #0x1
    strb r0, [r8, #0xf]
.L_1f4:
    ldrsb r0, [r8, #0xe]
    cmp r0, #0x1
    bne .L_210
    mov r0, #0x0
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
.L_210:
    add r3, sp, #0x14
    ldmia r3, {r0, r1, r2}
    stmia r8, {r0, r1, r2}
    ldmia r3, {r0, r1, r2}
    stmia r7, {r0, r1, r2}
    ldr r1, [r9]
    add sp, sp, #0x20
    add r1, r1, #0xc
    mov r0, #0x0
    str r1, [r9]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_23c:
    mov r0, r1, lsr #0x10
    ands r0, r0, #0xf
    beq .L_294
    cmp r0, #0x1
    beq .L_370
    cmp r0, #0x2
    bne .L_3bc
    ldrb r0, [r8, #0xf]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_284
    ldrsh r0, [r8, #0xc]
    bl func_02022580
    mvn r0, #0x0
    strh r0, [r8, #0xc]
    ldrb r0, [r8, #0xf]
    bic r0, r0, #0x1
    strb r0, [r8, #0xf]
.L_284:
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_3bc
.L_294:
    ldrb r0, [r8, #0xf]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r4, #0x1
    bne .L_3bc
    ldrsh r0, [r8, #0xc]
    cmp r0, #0x0
    bge .L_2c0
    mov r0, r6
    bl func_02022540
    strh r0, [r8, #0xc]
.L_2c0:
    ldrsh r0, [r8, #0xc]
    add r1, sp, #0x4
    bl func_02022608
    ldr r0, [sp, #0x4]
    sub r0, r6, r0
    cmp r0, r5
    blt .L_338
    ldrsb r0, [r8, #0xe]
    cmp r0, #0x1
    bne .L_2f8
    mov r0, #0x0
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
.L_2f8:
    add r3, sp, #0x14
    ldmia r3, {r0, r1, r2}
    stmia r8, {r0, r1, r2}
    ldmia r3, {r0, r1, r2}
    stmia r7, {r0, r1, r2}
    ldrsh r0, [r8, #0xc]
    bl func_02022580
    mvn r0, #0x0
    strh r0, [r8, #0xc]
    ldrb r0, [r8, #0xf]
    bic r0, r0, #0x1
    strb r0, [r8, #0xf]
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_3bc
.L_338:
    add r1, sp, #0x8
    str r1, [sp]
    ldrsb r4, [r8, #0xe]
    ldr r2, _LIT0
    add r3, sp, #0x14
    ldr r4, [r2, r4, lsl #0x2]
    mov r1, r5
    mov r2, r8
    blx r4
    add r0, sp, #0x8
    ldmia r0, {r0, r1, r2}
    mov r4, #0x1
    stmia r7, {r0, r1, r2}
    b .L_3bc
.L_370:
    ldrb r0, [r8, #0xf]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r4, #0x1
    bne .L_3bc
    bl func_02022224
    bl func_02022540
    strh r0, [r8, #0xc]
    ldrsh r0, [r8, #0xc]
    mov r1, r9
    mov r2, #0x1
    bl func_020225b4
    ldrb r0, [r8, #0xf]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    strb r0, [r8, #0xf]
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
.L_3bc:
    mov r0, r4
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_020c6894
