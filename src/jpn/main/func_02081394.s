; func_02081394 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bee08
        .global func_02081394
        .arm
func_02081394:
    ldrb r3, [r0, #0x1]
    ldr r2, _LIT0
    ldrb r1, [r0]
    add r0, r2, r3, lsl #0x4
    ldr r0, [r0, r1, lsl #0x2]
    bx lr
_LIT0: .word data_020bee08
