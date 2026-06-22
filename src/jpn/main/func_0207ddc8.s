; func_0207ddc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bedb0
        .global func_0207ddc8
        .arm
func_0207ddc8:
    ldr ip, _LIT0
    mov r3, #0x0
    str ip, [r0]
    str r1, [r0, #0x4]
    str r2, [r0, #0x8]
    str r3, [r0, #0xc]
    bx lr
_LIT0: .word data_020bedb0
