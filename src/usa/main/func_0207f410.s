; func_0207f410 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020943b0
        .global func_0207f410
        .arm
func_0207f410:
    ldr r3, _LIT0
    ldr ip, _LIT1
    add r1, r1, r3
    bx ip
_LIT0: .word 0x07000400
_LIT1: .word func_020943b0
