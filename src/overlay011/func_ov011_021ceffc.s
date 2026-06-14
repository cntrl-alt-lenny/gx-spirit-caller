; func_ov011_021ceffc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d4000
        .extern data_ov011_021d403c
        .global func_ov011_021ceffc
        .arm
func_ov011_021ceffc:
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r1, [r0, #0x2ac]
    bic r1, r1, #0xc0000
    orr r1, r1, #0x40000
    str r1, [r0, #0x2ac]
    ldr r0, [r0, #0x2a0]
    cmp r0, #0x0
    bxne lr
    ldr r1, [r2, #0x268]
    mov r0, r1, lsl #0x17
    mov r0, r0, lsr #0x1c
    bic r1, r1, #0x1e00
    mov r0, r0, lsl #0x1c
    orr r0, r1, r0, lsr #0x13
    str r0, [r2, #0x268]
    bx lr
_LIT0: .word data_ov011_021d4000
_LIT1: .word data_ov011_021d403c
