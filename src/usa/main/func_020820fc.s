; func_020820fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a17d8
        .global func_020820fc
        .arm
func_020820fc:
    orr r0, r0, r1, lsl #0x4
    ldr r1, [sp, #0x4]
    orr r0, r0, r2, lsl #0x6
    orr r0, r1, r0
    ldr r2, [sp]
    orr r1, r0, r3, lsl #0x18
    ldr r0, _LIT0
    orr r1, r1, r2, lsl #0x10
    str r1, [r0, #0x9c]
    bx lr
_LIT0: .word data_021a17d8
