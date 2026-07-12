; func_ov000_021ac730 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c74ac
        .global func_ov000_021ac730
        .arm
func_ov000_021ac730:
    ldr r1, _LIT0
    mov r0, r0, lsl #0xc
    ldr r2, [r1, #0x4]
    and r0, r0, #0xf
    bic r2, r2, #0xf
    orr r0, r2, r0
    str r0, [r1, #0x4]
    bx lr
_LIT0: .word data_ov000_021c74ac
