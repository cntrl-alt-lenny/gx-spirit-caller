; func_ov011_021ccf3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d4000
        .global func_ov011_021ccf3c
        .arm
func_ov011_021ccf3c:
    ldr r0, _LIT0
    ldr r1, [r0, #0x2b0]
    bic r1, r1, #0xff
    orr r1, r1, #0xff
    str r1, [r0, #0x2b0]
    ldr r2, [r0, #0x238]
    ldr r1, [r0, #0x26c]
    sub r1, r2, r1
    add r1, r1, #0x80000
    str r1, [r0, #0x260]
    ldr r2, [r0, #0x23c]
    ldr r1, [r0, #0x270]
    sub r1, r2, r1
    add r1, r1, #0x60000
    str r1, [r0, #0x264]
    ldr r1, [r0, #0x2ac]
    bic r1, r1, #0xff00000
    str r1, [r0, #0x2ac]
    bx lr
_LIT0: .word data_ov011_021d4000
