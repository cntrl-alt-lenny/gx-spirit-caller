; func_0206afd4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206afd4
        .arm
func_0206afd4:
    ldr r3, [r0]
    strb r1, [r3]
    ldr r1, [r2]
    add r1, r1, #0x1
    str r1, [r2]
    ldr r1, [r0]
    add r1, r1, #0x1
    str r1, [r0]
    bx lr
