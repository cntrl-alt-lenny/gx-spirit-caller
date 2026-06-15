; func_020a5f10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a5f10
        .arm
func_020a5f10:
    ldr r3, _LIT0
    ldr r2, [r0]
    ldrh r1, [r3]
    bic r1, r1, #0xc
    orr r1, r1, r2, lsl #0x2
    strh r1, [r3]
    ldrh r1, [r3]
    ldr r2, [r0, #0x4]
    bic r0, r1, #0x10
    orr r0, r0, r2, lsl #0x4
    strh r0, [r3]
    bx lr
_LIT0: .word 0x04000204
