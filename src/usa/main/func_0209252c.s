; func_0209252c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0209252c
        .arm
func_0209252c:
    mov ip, #0x0
    str ip, [r0, #0x4]
    ldr r3, [r0, #0x4]
    str r3, [r0]
    str ip, [r0, #0xc]
    ldr r3, [r0, #0xc]
    str r3, [r0, #0x8]
    str r1, [r0, #0x10]
    str r2, [r0, #0x14]
    str ip, [r0, #0x18]
    str ip, [r0, #0x1c]
    bx lr
