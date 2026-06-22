; func_0209bee0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209c0e8
        .global func_0209bee0
        .arm
func_0209bee0:
    ldr ip, _LIT0
    mov r1, #0x2
    bx ip
_LIT0: .word func_0209c0e8
