; func_02098300 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8254
        .extern func_02097308
        .global func_02098300
        .arm
func_02098300:
    ldr ip, _LIT0
    mov r3, r0
    mov r2, r1
    ldr r0, _LIT1
    mov r1, r3
    bx ip
_LIT0: .word func_02097308
_LIT1: .word data_021a8254
