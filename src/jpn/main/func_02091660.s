; func_02091660 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020918f0
        .global func_02091660
        .arm
func_02091660:
    ldr r2, [r0]
    mov r1, #0x0
    str r1, [r0]
    ldr ip, _LIT0
    mov r0, r2
    str r1, [r2, #0xb0]
    bx ip
_LIT0: .word func_020918f0
