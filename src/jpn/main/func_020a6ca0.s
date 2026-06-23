; func_020a6ca0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a6ca0
        .arm
func_020a6ca0:
    ldr r1, [r0, #0x1c]
    str r1, [r0, #0x24]
    ldr r3, [r0, #0x20]
    str r3, [r0, #0x28]
    ldr r2, [r0, #0x18]
    ldr r1, [r0, #0x2c]
    and r1, r2, r1
    sub r1, r3, r1
    str r1, [r0, #0x28]
    ldr r1, [r0, #0x18]
    str r1, [r0, #0x34]
    bx lr
