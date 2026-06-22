; func_02095f4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02095f4c
        .arm
func_02095f4c:
    sub sp, sp, #0x8
    mov r1, #0x0
    str r1, [sp]
    str r1, [sp, #0x4]
    str r1, [r0]
    str r1, [r0, #0x4]
    add sp, sp, #0x8
    bx lr
