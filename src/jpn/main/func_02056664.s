; func_02056664 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02056664
        .arm
func_02056664:
    mov r0, #0x0
    str r0, [r1, #0x8]
    str r0, [r1, #0x10]
    str r0, [r1, #0x14]
    str r0, [r1, #0x18]
    mov r0, #0x1
    bx lr
