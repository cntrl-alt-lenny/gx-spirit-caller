; func_02023ed4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02023ed4
        .arm
func_02023ed4:
    ldr r3, _LIT0
    ldrsh r1, [r0, #0xc8]
    ldrh r2, [r3]
    mov r0, #0x1
    bic r2, r2, #0x3
    orr r1, r2, r1
    strh r1, [r3]
    bx lr
_LIT0: .word 0x04000008
