; func_ov002_0226af44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0226ac08
        .global func_ov002_0226af44
        .arm
func_ov002_0226af44:
    ldr ip, _LIT0
    mov r3, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r1, #0xa
    bx ip
_LIT0: .word func_ov002_0226ac08
