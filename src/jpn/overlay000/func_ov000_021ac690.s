; func_ov000_021ac690 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021ac690
        .arm
func_ov000_021ac690:
    ldr r1, [r0]
    bic r1, r1, #0x4
    str r1, [r0]
    ldr r1, [r0, #0x8]
    orr r1, r1, #0x40000
    str r1, [r0, #0x8]
    bx lr
