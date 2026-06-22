; func_0208de58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208de58
        .arm
func_0208de58:
    ldr r0, _LIT0
    ldrh r0, [r0]
    and r0, r0, #0x3c
    mov r0, r0, asr #0x2
    mov r0, r0, lsl #0xe
    add r0, r0, #0x6200000
    bx lr
_LIT0: .word 0x04001008
