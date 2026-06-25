; func_0206cf2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0206ce9c
        .extern func_02094688
        .global func_0206cf2c
        .arm
func_0206cf2c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x14
    mov r9, r0
    mov r8, r1
    mov r7, r2
    mov r6, r3
    bl OS_DisableIrq
    add r1, sp, #0xc
    mov r5, r0
    str r1, [sp]
    add r1, sp, #0x8
    mov r0, r9
    add r2, sp, #0x4
    add r3, sp, #0x6
    bl func_0206ce9c
    cmp r0, #0x0
    beq .L_a4
    ldr r4, [sp, #0x8]
    cmp r4, #0x0
    mvneq r4, #0x5
    beq .L_c0
    ldrsb r1, [r9, #0x73]
    cmp r7, r4
    movgt r7, r4
    mov r2, #0x1
    cmp r1, #0x0
    beq .L_74
    cmp r1, #0x4
    movne r2, #0x0
.L_74:
    cmp r2, #0x0
    mov r1, r8
    mov r2, r7
    movne r4, r7
    bl func_02094688
    ldr r1, [r9, #0x64]
    ldrsb r0, [r1, #0xfe]
    cmp r0, #0x0
    ldreq r0, [r1, #0xf8]
    addeq r0, r0, r4
    streq r0, [r1, #0xf8]
    b .L_c0
.L_a4:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    ldrsh r0, [r9, #0x70]
    moveq r4, #0x0
    mvnne r4, #0x1b
    bic r0, r0, #0x6
    strh r0, [r9, #0x70]
.L_c0:
    cmp r4, #0x0
    blt .L_f8
    cmp r6, #0x0
    beq .L_e8
    ldr r1, [sp, #0x30]
    cmp r1, #0x0
    ldrneh r0, [sp, #0x6]
    strneh r0, [r6]
    ldrne r0, [sp, #0xc]
    strne r0, [r1]
.L_e8:
    ldrh r0, [r9, #0x74]
    cmp r0, #0x0
    ldreqh r0, [sp, #0x4]
    streqh r0, [r9, #0x74]
.L_f8:
    mov r0, r5
    bl OS_RestoreIrq
    mov r0, r4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
