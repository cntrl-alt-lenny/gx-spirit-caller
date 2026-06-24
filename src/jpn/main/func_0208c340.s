; func_0208c340 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208c340
        .arm
func_0208c340:
    ldr ip, [r0]
    ldr r3, [r1]
    sub r3, ip, r3
    str r3, [r2]
    ldr ip, [r0, #0x4]
    ldr r3, [r1, #0x4]
    sub r3, ip, r3
    str r3, [r2, #0x4]
    ldr r3, [r0, #0x8]
    ldr r0, [r1, #0x8]
    sub r0, r3, r0
    str r0, [r2, #0x8]
    bx lr
