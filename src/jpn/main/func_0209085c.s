; func_0209085c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02090828
        .extern func_02090a08
        .global func_0209085c
        .arm
func_0209085c:
    ldr ip, _LIT0
    ldr r1, _LIT1
    ldr r2, _LIT2
    bx ip
_LIT0: .word func_02090a08
_LIT1: .word 0x027fffe0
_LIT2: .word func_02090828
