; func_0203c694 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203c694
        .arm
func_0203c694:
    ldrb r0, [r0, #0xc1]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
