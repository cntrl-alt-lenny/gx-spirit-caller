; func_020670cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020670cc
        .arm
func_020670cc:
    ldrb r3, [r0]
    ldrb r2, [r1]
    strb r2, [r0]
    strb r3, [r1]
    bx lr
