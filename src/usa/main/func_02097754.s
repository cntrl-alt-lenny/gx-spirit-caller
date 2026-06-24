; func_02097754 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_020919a4
        .extern func_02096634
        .extern func_02097910
        .extern func_02097958
        .global func_02097754
        .arm
func_02097754:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldr r6, [r7, #0x8]
    mov r2, #0x1
    str r1, [r7, #0x10]
    mov r0, #0x2
    str r0, [r7, #0x14]
    ldr r0, [r7, #0xc]
    mov r5, r2, lsl r1
    orr r0, r0, #0x1
    str r0, [r7, #0xc]
    bl OS_DisableIrq
    ldr r1, [r6, #0x1c]
    mov r4, r0
    ands r0, r1, #0x80
    beq .L_68
    mov r0, r7
    mov r1, #0x3
    bl func_02096634
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_68:
    ands r0, r5, #0x1fc
    ldrne r0, [r7, #0xc]
    add r2, r6, #0x20
    orrne r0, r0, #0x4
    strne r0, [r7, #0xc]
    ldr r1, [r7]
    ldr r0, [r7, #0x4]
    cmp r1, #0x0
    strne r0, [r1, #0x4]
    cmp r0, #0x0
    strne r1, [r0]
    ldr r0, [r2, #0x4]
    cmp r0, #0x0
    beq .L_b0
.L_a0:
    mov r2, r0
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    bne .L_a0
.L_b0:
    str r7, [r2, #0x4]
    str r2, [r7]
    mov r1, #0x0
    str r1, [r7, #0x4]
    ldr r0, [r6, #0x1c]
    ands r0, r0, #0x8
    movne r1, #0x1
    cmp r1, #0x0
    bne .L_15c
    ldr r0, [r6, #0x1c]
    ands r0, r0, #0x10
    bne .L_15c
    ldr r1, [r6, #0x1c]
    mov r0, r4
    orr r1, r1, #0x10
    str r1, [r6, #0x1c]
    bl OS_RestoreIrq
    ldr r0, [r6, #0x58]
    ands r0, r0, #0x200
    beq .L_110
    ldr r2, [r6, #0x54]
    mov r0, r7
    mov r1, #0x9
    blx r2
.L_110:
    bl OS_DisableIrq
    ldr r1, [r7, #0xc]
    orr r1, r1, #0x40
    str r1, [r7, #0xc]
    ldr r1, [r7, #0xc]
    ands r1, r1, #0x4
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    bne .L_154
    bl OS_RestoreIrq
    mov r0, r7
    bl func_02097958
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_154:
    bl OS_RestoreIrq
    b .L_1a8
.L_15c:
    ldr r0, [r7, #0xc]
    ands r0, r0, #0x4
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_18c
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_18c:
    add r0, r7, #0x18
    bl func_020919a4
    ldr r0, [r7, #0xc]
    ands r0, r0, #0x40
    beq .L_18c
    mov r0, r4
    bl OS_RestoreIrq
.L_1a8:
    mov r0, r7
    bl func_02097910
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
