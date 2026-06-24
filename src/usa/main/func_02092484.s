; func_02092484 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02091924
        .extern func_020919a4
        .extern func_020b377c
        .global func_02092484
        .arm
func_02092484:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r0
    mov r5, r1
    mov r7, r2
    bl OS_DisableIrq
    ldr r2, [r6, #0x1c]
    ldr r1, [r6, #0x14]
    mov r4, r0
    cmp r1, r2
    bgt .L_1c8
    and r7, r7, #0x1
.L_190:
    cmp r7, #0x0
    bne .L_1b0
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_1b0:
    mov r0, r6
    bl func_020919a4
    ldr r2, [r6, #0x1c]
    ldr r1, [r6, #0x14]
    cmp r1, r2
    ble .L_190
.L_1c8:
    ldr r0, [r6, #0x18]
    add r0, r0, r2
    bl func_020b377c
    ldr r2, [r6, #0x10]
    add r0, r6, #0x8
    str r5, [r2, r1, lsl #0x2]
    ldr r1, [r6, #0x1c]
    add r1, r1, #0x1
    str r1, [r6, #0x1c]
    bl func_02091924
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
