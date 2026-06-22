; func_020904c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020904c0
        .arm
func_020904c0:
    ldr ip, _LIT0
    mov r1, #0x0
    ldrh r3, [ip]
    ldr r2, _LIT1
    strh r1, [ip]
    ldr r1, [r2]
    str r0, [r2]
    ldrh r0, [ip]
    mov r0, r1
    strh r3, [ip]
    bx lr
_LIT0: .word 0x04000208
_LIT1: .word 0x04000214
