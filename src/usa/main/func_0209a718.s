; func_0209a718 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a82f8
        .extern func_0209a790
        .global func_0209a718
        .arm
func_0209a718:
    ldr ip, _LIT0
    mov r1, r0
    ldr r0, _LIT1
    bx ip
_LIT0: .word func_0209a790
_LIT1: .word data_021a82f8
