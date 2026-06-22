; func_0208e0c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208e0c4
        .arm
func_0208e0c4:
    ldr r0, _LIT0
    ldrh r0, [r0]
    and r0, r0, #0x1f00
    mov r0, r0, asr #0x8
    mov r0, r0, lsl #0xb
    add r0, r0, #0x6200000
    bx lr
_LIT0: .word 0x0400100a
