; func_0206cb6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219ecd8
        .extern func_0206e4a4
        .extern func_02091a8c
        .extern func_02094688
        .global func_0206cb6c
        .arm
func_0206cb6c:
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
    bne .L_918
    ldr r0, [sp, #0x3c]
    and r7, r0, #0x1
    add r6, r9, #0x10c
    mov r4, #0x1
    mov r5, #0x0
.L_8c0:
    cmp r7, #0x0
    mvneq fp, #0x5
    beq .L_918
    mov r0, r6
    bl func_02091a8c
    mov r0, sl
    bl func_0206e4a4
    cmp r0, #0x0
    bne .L_904
    mov r1, r5
    cmp sl, #0x0
    beq .L_8fc
    ldrsh r0, [sl, #0x70]
    ands r0, r0, #0x1
    movne r1, r4
.L_8fc:
    cmp r1, #0x0
    bne .L_90c
.L_904:
    mvn fp, #0x37
    b .L_918
.L_90c:
    ldr r8, [r9, #0x104]
    cmp r8, #0x0
    beq .L_8c0
.L_918:
    cmp r8, #0x0
    beq .L_9ac
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
    bne .L_9ac
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
.L_9ac:
    ldr r0, [sp, #0xc]
    bl OS_RestoreIrq
    mov r0, fp
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_0219ecd8
