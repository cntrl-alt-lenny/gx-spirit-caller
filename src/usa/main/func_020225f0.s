; func_020225f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c67b4
        .extern func_020221d0
        .extern func_0202246c
        .extern func_020224ec
        .extern func_0202252c
        .extern func_02022560
        .extern func_020225b4
        .global func_020225f0
        .arm
func_020225f0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x20
    mov r9, r0
    mov r8, r1
    mov r7, r2
    mov r4, #0x0
    bl func_020221d0
    ldr r2, [r9]
    mov r6, r0
    ldr r1, [r2]
    ldr r0, [r2, #0x4]
    mov r1, r1, lsr #0x14
    mov r2, r0, lsl #0x10
    mov r0, r9
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_0202246c
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
    bl func_0202246c
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
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [sp, #0x1c]
    ldr r0, [r9]
    ldr r1, [r0]
    mov r0, r1, lsl #0x10
    movs r5, r0, asr #0x10
    bne .L_138
    ldrb r0, [r8, #0xf]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_f0
    ldrsh r0, [r8, #0xc]
    bl func_0202252c
    mvn r0, #0x0
    strh r0, [r8, #0xc]
    ldrb r0, [r8, #0xf]
    bic r0, r0, #0x1
    strb r0, [r8, #0xf]
.L_f0:
    ldrsb r0, [r8, #0xe]
    cmp r0, #0x1
    bne .L_10c
    mov r0, #0x0
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
.L_10c:
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
.L_138:
    mov r0, r1, lsr #0x10
    ands r0, r0, #0xf
    beq .L_190
    cmp r0, #0x1
    beq .L_26c
    cmp r0, #0x2
    bne .L_2b8
    ldrb r0, [r8, #0xf]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_180
    ldrsh r0, [r8, #0xc]
    bl func_0202252c
    mvn r0, #0x0
    strh r0, [r8, #0xc]
    ldrb r0, [r8, #0xf]
    bic r0, r0, #0x1
    strb r0, [r8, #0xf]
.L_180:
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_2b8
.L_190:
    ldrb r0, [r8, #0xf]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r4, #0x1
    bne .L_2b8
    ldrsh r0, [r8, #0xc]
    cmp r0, #0x0
    bge .L_1bc
    mov r0, r6
    bl func_020224ec
    strh r0, [r8, #0xc]
.L_1bc:
    ldrsh r0, [r8, #0xc]
    add r1, sp, #0x4
    bl func_020225b4
    ldr r0, [sp, #0x4]
    sub r0, r6, r0
    cmp r0, r5
    blt .L_234
    ldrsb r0, [r8, #0xe]
    cmp r0, #0x1
    bne .L_1f4
    mov r0, #0x0
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
.L_1f4:
    add r3, sp, #0x14
    ldmia r3, {r0, r1, r2}
    stmia r8, {r0, r1, r2}
    ldmia r3, {r0, r1, r2}
    stmia r7, {r0, r1, r2}
    ldrsh r0, [r8, #0xc]
    bl func_0202252c
    mvn r0, #0x0
    strh r0, [r8, #0xc]
    ldrb r0, [r8, #0xf]
    bic r0, r0, #0x1
    strb r0, [r8, #0xf]
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_2b8
.L_234:
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
    b .L_2b8
.L_26c:
    ldrb r0, [r8, #0xf]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r4, #0x1
    bne .L_2b8
    bl func_020221d0
    bl func_020224ec
    strh r0, [r8, #0xc]
    ldrsh r0, [r8, #0xc]
    mov r1, r9
    mov r2, #0x1
    bl func_02022560
    ldrb r0, [r8, #0xf]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    strb r0, [r8, #0xf]
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
.L_2b8:
    mov r0, r4
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_020c67b4
