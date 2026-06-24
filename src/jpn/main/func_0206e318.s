; func_0206e318 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0206d728
        .extern func_0206e2c8
        .extern func_0206e430
        .global func_0206e318
        .arm
func_0206e318:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, #0x0
    mov r5, r0
    bl func_0206e430
    cmp r0, #0x0
    orrne r4, r4, #0x80
    bne .L_d0
    ldrsh r0, [r5, #0x70]
    ands r0, r0, #0x40
    ldrsb r0, [r5, #0x73]
    orrne r4, r4, #0x20
    cmp r0, #0x1
    beq .L_40
    ldrsh r0, [r5, #0x70]
    ands r0, r0, #0x4
    beq .L_70
.L_40:
    bl OS_DisableIrq
    mov r6, r0
    mov r0, r5
    bl func_0206e2c8
    cmp r0, #0x0
    mov r0, r5
    orrgt r4, r4, #0x1
    bl func_0206d728
    cmp r0, #0x0
    mov r0, r6
    orrgt r4, r4, #0x8
    bl OS_RestoreIrq
.L_70:
    ldrsb r0, [r5, #0x73]
    mov r1, #0x1
    cmp r0, #0x0
    beq .L_88
    cmp r0, #0x4
    movne r1, #0x0
.L_88:
    cmp r1, #0x0
    beq .L_d0
    ldrsh r0, [r5, #0x70]
    ands r0, r0, #0x4
    beq .L_b8
    ldrb r0, [r5, #0x8]
    cmp r0, #0x4
    beq .L_b8
    ands r0, r4, #0x1
    ldreqsh r0, [r5, #0x70]
    biceq r0, r0, #0x6
    streqh r0, [r5, #0x70]
.L_b8:
    ldrsh r0, [r5, #0x70]
    ands r0, r0, #0x2
    bne .L_d0
    ldrsh r0, [r5, #0x70]
    ands r0, r0, #0x4
    orreq r4, r4, #0x40
.L_d0:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
