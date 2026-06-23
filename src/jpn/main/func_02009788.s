; func_02009788 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021058d8
        .global func_02009788
        .arm
func_02009788:
    mov r1, r0, asr #0x4
    add r2, r0, r1, lsr #0x1b
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1b
    ldr r3, _LIT0
    mov r2, r2, asr #0x5
    ldr r2, [r3, r2, lsl #0x2]
    add r0, r1, r0, ror #0x1b
    mov r1, #0x1
    and r0, r2, r1, lsl r0
    bx lr
_LIT0: .word data_021058d8
