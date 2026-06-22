; func_0208d0fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6224
        .extern func_0208dbfc
        .global func_0208d0fc
        .arm
func_0208d0fc:
    ldr r1, _LIT0
    ldr ip, _LIT1
    ldrh r2, [r1]
    orr r2, r2, r0
    strh r2, [r1]
    bx ip
_LIT0: .word data_021a6224
_LIT1: .word func_0208dbfc
