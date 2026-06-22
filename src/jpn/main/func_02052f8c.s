; func_02052f8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02052f8c
        .arm
func_02052f8c:
    ldr r0, [r0, #0x20]
    and r0, r0, #0x1
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
