; func_0208c98c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102498
        .extern data_021a6300
        .global func_0208c98c
        .arm
func_0208c98c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov lr, #0x4000000
    ldr ip, [lr]
    ldr r1, _LIT0
    and r2, ip, #0x30000
    mov r3, #0x0
    ldr r0, _LIT1
    mov r2, r2, lsr #0x10
    strh r3, [r1]
    strh r2, [r0]
    bic r0, ip, #0x30000
    str r0, [lr]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_02102498
_LIT1: .word data_021a6300
