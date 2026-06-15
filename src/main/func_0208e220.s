; func_0208e220 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208e220
        .arm
func_0208e220:
    ldr r1, _LIT0
    mov r0, #0x4000000
    ldrh r1, [r1]
    ldr r0, [r0]
    and r0, r0, #0x38000000
    mov r0, r0, lsr #0x1b
    and r1, r1, #0x1f00
    mov r0, r0, lsl #0x10
    mov r1, r1, asr #0x8
    add r0, r0, #0x6000000
    add r0, r0, r1, lsl #0xb
    bx lr
_LIT0: .word 0x04000008
