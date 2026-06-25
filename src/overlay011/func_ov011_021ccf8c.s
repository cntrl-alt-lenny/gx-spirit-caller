; func_ov011_021ccf8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d4000
        .extern Bg_SetScroll
        .extern func_ov011_021cca04
        .global func_ov011_021ccf8c
        .arm
func_ov011_021ccf8c:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0x26c]
    sub r1, r1, #0x80000
    str r1, [r0, #0x238]
    ldr r1, [r0, #0x270]
    sub r1, r1, #0x60000
    str r1, [r0, #0x23c]
    bl func_ov011_021cca04
    bl Bg_SetScroll
    ldr r0, _LIT0
    ldr r1, [r0, #0x2ac]
    bic r1, r1, #0xff00000
    str r1, [r0, #0x2ac]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov011_021d4000
