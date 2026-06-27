; func_0201115c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0201115c
        .arm
func_0201115c:
    cmp r0, r1
    bxeq lr
    ldr r2, [r0]
    str r2, [r1]
    ldr r2, [r0, #0x4]
    str r2, [r1, #0x4]
    ldr r2, [r0, #0x8]
    str r2, [r1, #0x8]
    ldr r2, [r0, #0xc]
    str r2, [r1, #0xc]
    ldr r2, [r0, #0x10]
    str r2, [r1, #0x10]
    ldr r2, [r0, #0x14]
    str r2, [r1, #0x14]
    ldr r2, [r0, #0x18]
    str r2, [r1, #0x18]
    ldr r2, [r0, #0x1c]
    str r2, [r1, #0x1c]
    ldr r2, [r0, #0x20]
    str r2, [r1, #0x20]
    ldr r2, [r0, #0x24]
    str r2, [r1, #0x24]
    ldr r2, [r0, #0x28]
    str r2, [r1, #0x28]
    ldr r0, [r0, #0x2c]
    str r0, [r1, #0x2c]
    bx lr
