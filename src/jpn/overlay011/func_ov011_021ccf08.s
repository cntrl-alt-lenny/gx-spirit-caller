; func_ov011_021ccf08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3f20
        .global func_ov011_021ccf08
        .arm
func_ov011_021ccf08:
    ldr r0, _LIT0
    ldr r1, [r0, #0x2ac]
    bic r1, r1, #0xff00000
    orr r1, r1, #0xff00000
    str r1, [r0, #0x2ac]
    ldr r3, [r0, #0x238]
    ldr r2, [r0, #0x258]
    orr r1, r1, #0x10000000
    sub r2, r3, r2
    add r2, r2, #0x80000
    str r2, [r0, #0x260]
    ldr r3, [r0, #0x23c]
    ldr r2, [r0, #0x25c]
    sub r2, r3, r2
    add r2, r2, #0x60000
    str r2, [r0, #0x264]
    ldr r2, [r0, #0x2b0]
    bic r2, r2, #0xff
    str r2, [r0, #0x2b0]
    str r1, [r0, #0x2ac]
    bx lr
_LIT0: .word data_ov011_021d3f20
