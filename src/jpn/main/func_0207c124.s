; func_0207c124 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a07ac
        .global func_0207c124
        .arm
func_0207c124:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl OS_DisableIrq
    ldr r2, _LIT0
    ldr r1, [r2]
    cmp r1, #0x0
    bne .L_374
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmfd sp!, {lr}
    bx lr
.L_374:
    add r1, r1, #0x2000
    ldr r1, [r1, #0x260]
    cmp r1, #0x1
    beq .L_398
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmfd sp!, {lr}
    bx lr
.L_398:
    mov r1, #0x0
    str r1, [r2]
    bl OS_RestoreIrq
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a07ac
