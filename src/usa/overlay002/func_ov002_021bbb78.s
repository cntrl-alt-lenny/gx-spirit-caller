; func_ov002_021bbb78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bbae0
        .global func_ov002_021bbb78
        .arm
func_ov002_021bbb78:
    ldr ip, _LIT0
    mvn r2, #0x0
    bx ip
_LIT0: .word func_ov002_021bbae0
