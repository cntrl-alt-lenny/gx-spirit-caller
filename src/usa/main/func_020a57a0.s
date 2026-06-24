; func_020a57a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a9840
        .extern func_020918f0
        .extern func_02091c3c
        .extern func_020a5770
        .extern func_020a5828
        .global func_020a57a0
        .arm
func_020a57a0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r0
    mov r6, r1
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1]
    cmp r0, #0x0
    bne .L_6c
    add r0, r5, #0xc4
    str r5, [r1]
    bl func_020a5770
    sub r0, r6, #0xe4
    mov lr, #0x0
    str lr, [r5, #0xc0]
    bic ip, r0, #0x3
    add r3, r5, #0xe4
    str ip, [sp]
    ldr r1, _LIT1
    mov r0, r5
    mov r2, r5
    add r3, r3, ip
    str lr, [sp, #0x4]
    bl func_02091c3c
    mov r0, r5
    bl func_020918f0
.L_6c:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a9840
_LIT1: .word func_020a5828
