; func_0208df0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208df0c
        .arm
func_0208df0c:
    ldr r1, _LIT0
    mov r0, #0x4000000
    ldrh r1, [r1]
    ldr r0, [r0]
    and r0, r0, #0x7000000
    mov r0, r0, lsr #0x18
    and r1, r1, #0x3c
    mov r0, r0, lsl #0x10
    mov r1, r1, asr #0x2
    add r0, r0, #0x6000000
    add r0, r0, r1, lsl #0xe
    bx lr
_LIT0: .word 0x0400000a
