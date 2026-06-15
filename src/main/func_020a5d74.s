; func_020a5d74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9928
        .extern func_020b3870
        .global func_020a5d74
        .arm
func_020a5d74:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    sub r1, r0, #0x2
    mov r0, #0x1e
    str r1, [r2]
    bl func_020b3870
    ldr r1, _LIT0
    mov r2, #0x1e
    str r0, [r1, #0x4]
    str r2, [r1, #0x8]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a9928
