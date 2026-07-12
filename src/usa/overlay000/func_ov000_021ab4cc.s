; func_ov000_021ab4cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c7450
        .global func_ov000_021ab4cc
        .arm
func_ov000_021ab4cc:
    ldr r3, _LIT0
    mov r2, #0x2c
    mla r3, r0, r2, r3
    ldr r2, [r3, #0x8]
    and r0, r1, #0xff
    bic r1, r2, #0xfc00
    mov r0, r0, lsl #0x1a
    orr r0, r1, r0, lsr #0x10
    str r0, [r3, #0x8]
    bx lr
_LIT0: .word data_ov000_021c7450
