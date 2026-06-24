; func_ov002_0226ae88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0226ac08
        .global func_ov002_0226ae88
        .arm
func_ov002_0226ae88:
    ldr ip, _LIT0
    mov r1, r1, lsl #0x10
    mov r3, r1, lsr #0x10
    mov r1, #0x5
    mov r2, #0x0
    bx ip
_LIT0: .word func_ov002_0226ac08
