; func_020215fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020215fc
        .arm
func_020215fc:
    str r1, [r0, #0xc]
    str r2, [r0, #0x10]
    mov r0, #0x1
    bx lr
