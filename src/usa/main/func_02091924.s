; func_02091924 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02091ea0
        .extern func_020920c0
        .global func_02091924
        .arm
func_02091924:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl OS_DisableIrq
    ldr r1, [r5]
    mov r4, r0
    cmp r1, #0x0
    beq .L_6c
    cmp r1, #0x0
    beq .L_58
    mov r7, #0x1
    mov r6, #0x0
.L_30:
    mov r0, r5
    bl func_020920c0
    str r7, [r0, #0x64]
    str r6, [r0, #0x78]
    str r6, [r0, #0x80]
    ldr r1, [r0, #0x80]
    str r1, [r0, #0x7c]
    ldr r0, [r5]
    cmp r0, #0x0
    bne .L_30
.L_58:
    mov r0, #0x0
    str r0, [r5, #0x4]
    ldr r0, [r5, #0x4]
    str r0, [r5]
    bl func_02091ea0
.L_6c:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
