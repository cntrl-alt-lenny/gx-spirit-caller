; func_020908a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02090890
        .extern func_020908e8
        .global func_020908a8
        .arm
func_020908a8:
    ldr ip, _LIT0
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r3, #0x1
    bx ip
_LIT0: .word func_020908e8
_LIT1: .word 0x027fffe8
_LIT2: .word func_02090890
