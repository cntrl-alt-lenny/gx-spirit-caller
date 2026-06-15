; func_02098c70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8334
        .global func_02098c70
        .arm
func_02098c70:
    sub sp, sp, #0x8
    ldr r2, _LIT0
    str r2, [sp]
    ldr r1, [r1, #0x18]
    str r1, [sp, #0x4]
    str r2, [r0]
    str r1, [r0, #0x4]
    add sp, sp, #0x8
    bx lr
_LIT0: .word data_021a8334
