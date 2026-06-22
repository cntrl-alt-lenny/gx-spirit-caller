; func_020864c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020864c4
        .arm
func_020864c4:
    mov r2, #0x1000
    str r2, [r0]
    mov r1, #0x0
    str r1, [r0, #0x4]
    str r1, [r0, #0x10]
    str r2, [r0, #0x14]
    str r1, [r0, #0x30]
    str r1, [r0, #0x34]
    bx lr
