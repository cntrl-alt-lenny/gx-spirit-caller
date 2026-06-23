; func_ov011_021ca520 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3f20
        .global func_ov011_021ca520
        .arm
func_ov011_021ca520:
    ldr r1, _LIT0
    mov r0, #0x10000
    ldr r2, [r1, #0x2bc]
    rsb r0, r0, #0x0
    bic r2, r2, #0x3c0000
    orr r2, r2, #0x40000
    str r2, [r1, #0x2bc]
    ldr r2, [r1, #0x2a8]
    and r0, r2, r0
    str r0, [r1, #0x2a8]
    bx lr
_LIT0: .word data_ov011_021d3f20
