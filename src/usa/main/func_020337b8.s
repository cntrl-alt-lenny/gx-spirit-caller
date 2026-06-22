; func_020337b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032d04
        .global func_020337b8
        .arm
func_020337b8:
    cmp r1, #0x0
    ldr r1, [r0, #0xeac]
    ldr ip, _LIT0
    orrne r1, r1, #0x40000
    biceq r1, r1, #0x40000
    str r1, [r0, #0xeac]
    bx ip
_LIT0: .word func_02032d04
