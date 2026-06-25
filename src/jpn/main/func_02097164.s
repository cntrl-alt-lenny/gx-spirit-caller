; func_02097164 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02097958
        .extern func_020979fc
        .global func_02097164
        .arm
func_02097164:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r6, #0x0
    bl OS_DisableIrq
    ldr r1, [r4, #0x1c]
    mov r5, r0
    ands r0, r1, #0x8
    movne r0, #0x1
    moveq r0, r6
    cmp r0, #0x0
    moveq r7, #0x1
    movne r7, #0x0
    cmp r7, #0x0
    bne .L_54
    ldr r1, [r4, #0x1c]
    mov r0, r4
    bic r1, r1, #0x8
    str r1, [r4, #0x1c]
    bl func_020979fc
    mov r6, r0
.L_54:
    mov r0, r5
    bl OS_RestoreIrq
    cmp r6, #0x0
    beq .L_6c
    mov r0, r6
    bl func_02097958
.L_6c:
    mov r0, r7
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
