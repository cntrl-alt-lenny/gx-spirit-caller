; func_020b4200 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021aa3a0
        .global func_020b4200
        .arm
func_020b4200:
    ldr r3, _LIT0
    ldr ip, [r3]
    str ip, [r2]
    str r1, [r2, #0x4]
    str r0, [r2, #0x8]
    str r2, [r3]
    bx lr
_LIT0: .word data_021aa3a0
