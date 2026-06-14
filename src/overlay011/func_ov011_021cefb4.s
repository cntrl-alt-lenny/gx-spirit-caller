; func_ov011_021cefb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d33bc
        .extern data_ov011_021d4000
        .global func_ov011_021cefb4
        .arm
func_ov011_021cefb4:
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldrh r3, [r1, #0x52]
    ldrh r2, [r1, #0x54]
    mov r1, #0x1000
    mov r3, r3, lsl #0xc
    str r3, [r0, #0x258]
    mov r2, r2, lsl #0xc
    str r2, [r0, #0x25c]
    str r1, [r0, #0x254]
    ldr r1, [r0, #0x2ac]
    bic r1, r1, #0x20000
    str r1, [r0, #0x2ac]
    str r3, [r0, #0x26c]
    str r2, [r0, #0x270]
    bx lr
_LIT0: .word data_ov011_021d33bc
_LIT1: .word data_ov011_021d4000
