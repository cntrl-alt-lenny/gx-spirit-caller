; func_020807d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020807d0
        .arm
func_020807d0:
    str r2, [r0, #0x4]
    ldr r2, [sp]
    str r3, [r0, #0x8]
    strb r2, [r0, #0xc]
    ldr r2, [sp, #0x4]
    str r1, [r0]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x14]
    ldr r2, [sp, #0xc]
    str r1, [r0, #0x18]
    ldr r1, [sp, #0x10]
    str r2, [r0, #0x1c]
    str r1, [r0, #0x10]
    bx lr
