; func_020853fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020853fc
        .arm
func_020853fc:
    ldrh r1, [r0, #0xc]
    ldr r1, [r0, r1]
    add r0, r0, r1
    bx lr
