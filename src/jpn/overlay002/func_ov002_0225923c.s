; func_ov002_0225923c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022d008c
        .global func_ov002_0225923c
        .arm
func_ov002_0225923c:
    ldr r1, _LIT0
    mov r2, #0x9
    str r2, [r1, #0xd48]
    str r0, [r1, #0xd84]
    mov r2, #0x0
    str r2, [r1, #0xd54]
    ldr r0, _LIT1
    str r2, [r1, #0xd50]
    ldr r0, [r0, #0x4]
    str r0, [r1, #0xd6c]
    str r2, [r1, #0xd58]
    bx lr
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd65c
