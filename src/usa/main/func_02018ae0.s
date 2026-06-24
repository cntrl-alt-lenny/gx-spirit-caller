; func_02018ae0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02018ae0
        .arm
func_02018ae0:
    cmp r0, #0x2
    mov r0, #0x1
    bxne lr
    cmp r1, #0x7
    bx lr
