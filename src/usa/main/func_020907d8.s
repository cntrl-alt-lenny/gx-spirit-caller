; func_020907d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020907d8
        .arm
func_020907d8:
    ldr r3, _LIT0
    cmp r0, #0x60
    addpl r3, r3, #0x4
    subpl r0, r0, #0x60
    submi r0, r0, #0x40
    mov r1, #-2147483648
    mov r1, r1, lsr r0
    ldr r2, [r3]
    orr r2, r2, r1
    str r2, [r3]
    bx lr
_LIT0: .word 0x027fffb0
