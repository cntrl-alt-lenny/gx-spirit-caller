; func_ov011_021cd61c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d30e8
        .global func_ov011_021cd61c
        .arm
func_ov011_021cd61c:
    ldr r2, _LIT0
    sub r3, r0, #0x1
    mov r0, #0x14
    mla r0, r3, r0, r2
    sub r1, r1, #0x1
    ldr r0, [r0, r1, lsl #0x2]
    bx lr
_LIT0: .word data_ov011_021d30e8
