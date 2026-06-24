; func_0208c374 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208c374
        .arm
func_0208c374:
    ldr ip, [r0]
    ldr r3, [r1]
    add r3, ip, r3
    str r3, [r2]
    ldr ip, [r0, #0x4]
    ldr r3, [r1, #0x4]
    add r3, ip, r3
    str r3, [r2, #0x4]
    ldr r3, [r0, #0x8]
    ldr r0, [r1, #0x8]
    add r0, r3, r0
    str r0, [r2, #0x8]
    bx lr
