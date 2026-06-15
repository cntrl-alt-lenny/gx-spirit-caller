; func_0209240c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02091a0c
        .extern func_02091a8c
        .extern func_020b3870
        .global func_0209240c
        .arm
func_0209240c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r0
    mov r5, r1
    mov r7, r2
    bl OS_DisableIrq
    ldr r1, [r6, #0x14]
    ldr r2, [r6, #0x1c]
    mov r4, r0
    cmp r1, r2
    bgt .L_ec
    and r7, r7, #0x1
.L_b4:
    cmp r7, #0x0
    bne .L_d4
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_d4:
    mov r0, r6
    bl func_02091a8c
    ldr r1, [r6, #0x14]
    ldr r0, [r6, #0x1c]
    cmp r1, r0
    ble .L_b4
.L_ec:
    ldr r0, [r6, #0x18]
    add r0, r0, r1
    sub r0, r0, #0x1
    bl func_020b3870
    str r1, [r6, #0x18]
    ldr r2, [r6, #0x10]
    ldr r1, [r6, #0x18]
    add r0, r6, #0x8
    str r5, [r2, r1, lsl #0x2]
    ldr r1, [r6, #0x1c]
    add r1, r1, #0x1
    str r1, [r6, #0x1c]
    bl func_02091a0c
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
