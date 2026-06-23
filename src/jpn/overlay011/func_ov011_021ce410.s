; func_ov011_021ce410 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3f20
        .global func_ov011_021ce410
        .arm
func_ov011_021ce410:
    ldr r1, _LIT0
    mov r2, #0x0
    ldr r3, [r1, #0x2a4]
    ldr r0, _LIT1
    orr r3, r3, #0x10
    str r3, [r1, #0x2a4]
    str r2, [r1, #0x2c4]
    ldr r2, [r1, #0x2b0]
    and r0, r2, r0
    orr r0, r0, #0x8000
    str r0, [r1, #0x2b0]
    bx lr
_LIT0: .word data_ov011_021d3f20
_LIT1: .word 0xffe01fff
