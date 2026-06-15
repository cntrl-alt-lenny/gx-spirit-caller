; func_02097af0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02091a0c
        .extern func_02096728
        .extern func_02098388
        .global func_02097af0
        .arm
func_02097af0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4c
    mov r6, r0
    bl OS_DisableIrq
    ldr r1, [r6, #0x1c]
    mov r5, r0
    ands r0, r1, #0x20
    beq .L_330
    ldr r0, [r6, #0x1c]
    bic r0, r0, #0x20
    str r0, [r6, #0x1c]
    ldr r0, [r6, #0x24]
    cmp r0, #0x0
    beq .L_330
    mov r8, #0x0
    mov r9, #0x1
    mov r7, #0x3
.L_2ec:
    ldr r1, [r0, #0xc]
    ldr r4, [r0, #0x4]
    ands r1, r1, #0x2
    movne r1, r9
    moveq r1, r8
    cmp r1, #0x0
    beq .L_324
    ldr r1, [r6, #0x24]
    cmp r1, r0
    mov r1, r7
    streq r4, [r6, #0x24]
    bl func_02096728
    cmp r4, #0x0
    ldreq r4, [r6, #0x24]
.L_324:
    mov r0, r4
    cmp r4, #0x0
    bne .L_2ec
.L_330:
    ldr r0, [r6, #0x1c]
    ands r0, r0, #0x40
    bne .L_41c
    ldr r0, [r6, #0x1c]
    ands r0, r0, #0x8
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_41c
    ldr r4, [r6, #0x24]
    cmp r4, #0x0
    beq .L_41c
    ldr r0, [r6, #0x1c]
    ands r0, r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    moveq r7, #0x1
    movne r7, #0x0
    cmp r7, #0x0
    ldrne r0, [r6, #0x1c]
    orrne r0, r0, #0x10
    strne r0, [r6, #0x1c]
    mov r0, r5
    bl OS_RestoreIrq
    cmp r7, #0x0
    beq .L_3b8
    ldr r0, [r6, #0x58]
    ands r0, r0, #0x200
    beq .L_3b8
    ldr r2, [r6, #0x54]
    mov r0, r4
    mov r1, #0x9
    blx r2
.L_3b8:
    bl OS_DisableIrq
    ldr r1, [r4, #0xc]
    mov r5, r0
    orr r0, r1, #0x40
    str r0, [r4, #0xc]
    ldr r0, [r4, #0xc]
    ands r0, r0, #0x4
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_404
    add r0, r4, #0x18
    bl func_02091a0c
    mov r0, r5
    bl OS_RestoreIrq
    add sp, sp, #0x4c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_404:
    mov r0, r5
    bl OS_RestoreIrq
    add sp, sp, #0x4c
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_41c:
    ldr r0, [r6, #0x1c]
    ands r0, r0, #0x10
    beq .L_45c
    ldr r0, [r6, #0x1c]
    bic r0, r0, #0x10
    str r0, [r6, #0x1c]
    ldr r0, [r6, #0x58]
    ands r0, r0, #0x400
    beq .L_45c
    add r0, sp, #0x0
    bl func_02098388
    str r6, [sp, #0x8]
    ldr r2, [r6, #0x54]
    add r0, sp, #0x0
    mov r1, #0xa
    blx r2
.L_45c:
    ldr r0, [r6, #0x1c]
    ands r0, r0, #0x40
    beq .L_488
    ldr r1, [r6, #0x1c]
    add r0, r6, #0x14
    bic r1, r1, #0x40
    str r1, [r6, #0x1c]
    ldr r1, [r6, #0x1c]
    orr r1, r1, #0x8
    str r1, [r6, #0x1c]
    bl func_02091a0c
.L_488:
    mov r0, r5
    bl OS_RestoreIrq
    mov r0, #0x0
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
