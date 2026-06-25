; func_02070a64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_020919a4
        .global func_02070a64
        .arm
func_02070a64:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r8, r1
    mov r9, r0
    bl OS_DisableIrq
    ldr r7, [r8, #0x44]
    mov r6, r0
    cmp r7, #0x0
    bne .L_210
    mov r5, #0x3
    mov r4, #0x0
.L_1f8:
    mov r0, r4
    str r5, [r8, #0x4]
    bl func_020919a4
    ldr r7, [r8, #0x44]
    cmp r7, #0x0
    beq .L_1f8
.L_210:
    mov r0, r6
    bl OS_RestoreIrq
    str r7, [r9]
    ldr r0, [r8, #0x40]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
