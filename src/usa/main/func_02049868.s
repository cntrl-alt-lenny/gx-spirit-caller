; func_02049868 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba8
        .global func_02049868
        .arm
func_02049868:
    ldr r1, _LIT0
    ldr r1, [r1]
    str r0, [r1, #0x198]
    bx lr
_LIT0: .word data_0219dba8
