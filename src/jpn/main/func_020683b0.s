; func_020683b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020683b0
        .arm
func_020683b0:
    ldr r2, [r0]
    str r2, [r1, #0x20]
    str r1, [r0]
    ldr r2, [r0, #0x4]
    cmp r2, #0x0
    streq r1, [r0, #0x4]
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
    bx lr
