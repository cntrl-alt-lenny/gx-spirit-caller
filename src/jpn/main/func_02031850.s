; func_02031850 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02031850
        .arm
func_02031850:
    str r0, [r0]
    str r0, [r0, #0x4]
    mov r1, #-16777216
    str r1, [r0, #0x2c]
    bx lr
