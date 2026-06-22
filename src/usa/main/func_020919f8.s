; func_020919f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020919f8
        .arm
func_020919f8:
    ldr r0, [r0, #0x64]
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
