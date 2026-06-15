; func_020924c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02091a0c
        .extern func_02091a8c
        .extern func_020b3870
        .global func_020924c0
        .arm
func_020924c0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    mov r5, r1
    mov r7, r2
    bl OS_DisableIrq
    ldr r1, [r6, #0x1c]
    mov r4, r0
    cmp r1, #0x0
    bne .L_194
    and r8, r7, #0x1
    add r7, r6, #0x8
.L_164:
    cmp r8, #0x0
    bne .L_180
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_180:
    mov r0, r7
    bl func_02091a8c
    ldr r0, [r6, #0x1c]
    cmp r0, #0x0
    beq .L_164
.L_194:
    cmp r5, #0x0
    ldrne r1, [r6, #0x10]
    ldrne r0, [r6, #0x18]
    ldrne r0, [r1, r0, lsl #0x2]
    strne r0, [r5]
    ldr r0, [r6, #0x18]
    ldr r1, [r6, #0x14]
    add r0, r0, #0x1
    bl func_020b3870
    str r1, [r6, #0x18]
    ldr r1, [r6, #0x1c]
    mov r0, r6
    sub r1, r1, #0x1
    str r1, [r6, #0x1c]
    bl func_02091a0c
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
