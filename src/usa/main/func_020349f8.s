; func_020349f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern func_02033000
        .extern func_020349e8
        .global func_020349f8
        .arm
func_020349f8:
    ldr ip, _LIT0
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, #0x0
    bx ip
_LIT0: .word func_02033000
_LIT1: .word func_020349e8
_LIT2: .word Task_InvokeLocked
