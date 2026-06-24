; func_0207ce40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0207b450
        .extern func_0207cd68
        .global func_0207ce40
        .arm
func_0207ce40:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl OS_DisableIrq
    mov r5, r0
    bl func_0207b450
    cmp r0, #0x0
    mov r4, #0x0
    beq .L_d0
    add r0, r0, #0x2000
    ldr r0, [r0, #0x260]
    cmp r0, #0x9
    bne .L_d0
    bl func_0207cd68
    mov r4, r0
.L_d0:
    mov r0, r5
    bl OS_RestoreIrq
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
