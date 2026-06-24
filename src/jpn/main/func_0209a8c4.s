; func_0209a8c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209a900
        .extern func_0209b3a8
        .extern func_0209b3b0
        .global func_0209a8c4
        .arm
func_0209a8c4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    add r2, sp, #0x0
    bl func_0209a900
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    bl func_0209b3b0
    ldr r0, [sp]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word func_0209b3a8
