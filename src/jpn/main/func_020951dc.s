; func_020951dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6654
        .extern func_02092660
        .global func_020951dc
        .arm
func_020951dc:
    ldr ip, _LIT0
    ldr r0, _LIT1
    bx ip
_LIT0: .word func_02092660
_LIT1: .word data_021a6654
