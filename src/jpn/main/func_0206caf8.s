; func_0206caf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219ebf8
        .extern func_0206e430
        .extern func_020919a4
        .extern func_02094688
        .global func_0206caf8
        .arm
func_0206caf8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov sl, r0
    ldr r9, [sl, #0x64]
    str r1, [sp]
    ldr r0, [r9, #0x104]
    str r2, [sp, #0x4]
    str r3, [sp, #0x8]
    bl OS_DisableIrq
    ldr r8, [r9, #0x104]
    str r0, [sp, #0xc]
    cmp r8, #0x0
    bne .L_a0
    ldr r0, [sp, #0x3c]
    and r7, r0, #0x1
    add r6, r9, #0x10c
    mov r4, #0x1
    mov r5, #0x0
.L_48:
    cmp r7, #0x0
    mvneq fp, #0x5
    beq .L_a0
    mov r0, r6
    bl func_020919a4
    mov r0, sl
    bl func_0206e430
    cmp r0, #0x0
    bne .L_8c
    mov r1, r5
    cmp sl, #0x0
    beq .L_84
    ldrsh r0, [sl, #0x70]
    ands r0, r0, #0x1
    movne r1, r4
.L_84:
    cmp r1, #0x0
    bne .L_94
.L_8c:
    mvn fp, #0x37
    b .L_a0
.L_94:
    ldr r8, [r9, #0x104]
    cmp r8, #0x0
    beq .L_48
.L_a0:
    cmp r8, #0x0
    beq .L_134
    ldrh r1, [r8, #0x4]
    ldr r0, [sp, #0x4]
    cmp r0, r1
    strgt r1, [sp, #0x4]
    ldr r1, [sp]
    ldr r2, [sp, #0x4]
    add r0, r8, #0xc
    bl func_02094688
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    ldrneh r1, [r8, #0x6]
    strneh r1, [r0]
    ldr r1, [sp, #0x38]
    cmp r1, #0x0
    ldrne r0, [r8, #0x8]
    strne r0, [r1]
    ldrsb r0, [r9, #0xfe]
    ldrh fp, [r8, #0x4]
    cmp r0, #0x0
    bne .L_134
    ldr r0, [r8]
    ldr r1, _LIT0
    str r0, [r9, #0x104]
    ldr r0, [r8]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r9, #0x100]
    ldr r1, [r1]
    mov r0, r8
    ldr r1, [r1, #0x1c]
    blx r1
    add r0, r9, #0x100
    ldrh r1, [r0, #0x8]
    sub r1, r1, fp
    strh r1, [r0, #0x8]
.L_134:
    ldr r0, [sp, #0xc]
    bl OS_RestoreIrq
    mov r0, fp
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_0219ebf8
