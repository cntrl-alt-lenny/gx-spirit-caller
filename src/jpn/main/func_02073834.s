; func_02073834 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219ee1c
        .extern data_0219ee44
        .extern data_0219ee48
        .global func_02073834
        .arm
func_02073834:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl OS_DisableIrq
    ldr r2, _LIT0
    ldr r1, _LIT1
    ldr lr, [r2]
    ldr ip, [r1]
    ldr r3, [r2]
    ldr r1, _LIT2
    ldrh r3, [ip, r3]
    add r3, lr, r3
    str r3, [r2]
    ldr r3, [r2]
    ldr r1, [r1]
    cmp r3, r1
    movcs r1, #0x0
    strcs r1, [r2]
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_0219ee1c
_LIT1: .word data_0219ee44
_LIT2: .word data_0219ee48
