; func_02033654 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02052fa4
        .global func_02033654
        .arm
func_02033654:
    ldr ip, _LIT0
    add r0, r0, #0x234
    add r0, r0, #0xc00
    bx ip
_LIT0: .word func_02052fa4
