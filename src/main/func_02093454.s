; func_02093454 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_020930b0
        .extern func_020934cc
        .extern func_02093bfc
        .global func_02093454
        .arm
func_02093454:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    movs r6, r0
    mov r5, r1
    mov r4, r2
    mov r7, r3
    beq .L_1d8
    ldr r0, [r6]
    cmp r0, #0x0
    beq .L_1dc
.L_1d8:
    bl func_02093bfc
.L_1dc:
    bl OS_DisableIrq
    mov r1, #0x0
    str r1, [r6, #0x1c]
    str r1, [r6, #0x20]
    str r7, [r6]
    ldr r1, [sp, #0x18]
    mov r7, r0
    str r1, [r6, #0x4]
    bl func_020930b0
    adds r3, r5, r0
    adc r2, r4, r1
    mov r0, r6
    mov r1, r3
    bl func_020934cc
    mov r0, r7
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
