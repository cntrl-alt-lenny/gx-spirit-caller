; func_ov002_0227aa50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .global func_ov002_0227aa50
        .arm
func_ov002_0227aa50:
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    bic r1, r1, #0xff
    bic r1, r1, #0xff00
    bic r1, r1, #0xff0000
    bic r1, r1, #-16777216
    str r1, [r0, #0x18]
    ldrh r1, [r0, #0x16]
    orr r1, r1, #0xc0
    strh r1, [r0, #0x16]
    bx lr
_LIT0: .word data_ov002_022cd300
