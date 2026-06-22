; func_020614bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020614bc
        .arm
func_020614bc:
    ldr r1, [r0, #0x4]
    ldr r0, [r0, #0x8]
    sub r0, r1, r0
    bx lr
