; func_02090840 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02090810
        .extern func_02090968
        .global func_02090840
        .arm
func_02090840:
    ldr ip, _LIT0
    ldr r1, _LIT1
    ldr r2, _LIT2
    bx ip
_LIT0: .word func_02090968
_LIT1: .word 0x027fffe0
_LIT2: .word func_02090810
