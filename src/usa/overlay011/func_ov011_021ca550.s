; func_ov011_021ca550 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .global func_ov011_021ca550
        .arm
func_ov011_021ca550:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0x2a4]
    mov r0, r0, lsl #0xf
    movs r0, r0, lsr #0x1c
    bxeq lr
    ldr r0, [r1, #0x280]
    bic r0, r0, #0x3c0000
    orr r0, r0, #0xc0000
    str r0, [r1, #0x280]
    bx lr
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d3f5c
