; func_02052d68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053308
        .global func_02052d68
        .arm
func_02052d68:
    ldr ip, _LIT0
    mov r3, r0
    mov r0, r1
    ldr r1, [r3, #0x24]
    bx ip
_LIT0: .word func_02053308
