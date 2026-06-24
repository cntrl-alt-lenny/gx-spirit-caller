; func_ov002_02259804 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021fd72c
        .global func_ov002_02259804
        .arm
func_ov002_02259804:
    mov r0, r0, lsl #0x1f
    and r2, r0, #-2147483648
    mov r0, r1, lsl #0x10
    orr r3, r2, #0x500000
    mov r1, #0x0
    ldr ip, _LIT0
    mov r2, r1
    orr r0, r3, r0, lsr #0x10
    bx ip
_LIT0: .word func_ov002_021fd72c
