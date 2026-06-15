; func_020822f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a18b8
        .extern func_02084e0c
        .global func_020822f0
        .arm
func_020822f0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r2, #0x3e
    ldr r0, [r1], #0x4
    bl func_02084e0c
    ldr r0, _LIT0
    ldr r1, [r0, #0xfc]
    bic r1, r1, #0x1
    str r1, [r0, #0xfc]
    bic r1, r1, #0x2
    str r1, [r0, #0xfc]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_021a18b8
