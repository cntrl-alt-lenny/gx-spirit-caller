; func_02031aa8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219acd8
        .global func_02031aa8
        .arm
func_02031aa8:
    ldr r1, _LIT0
    ldr r2, [r1]
    cmp r2, r0
    ldreq r2, [r0, #0x4]
    streq r2, [r1]
    ldmia r0, {r2, r3}
    str r3, [r2, #0x4]
    ldr r3, [r0]
    ldr r2, [r0, #0x4]
    mov r1, #0x0
    str r3, [r2]
    str r1, [r0, #0x4]
    str r1, [r0]
    bx lr
_LIT0: .word data_0219acd8
