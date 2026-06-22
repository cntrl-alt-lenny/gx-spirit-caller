; func_0209275c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0209275c
        .arm
func_0209275c:
    mov r2, #0x0
    str r2, [r0, #0x4]
    ldr r1, [r0, #0x4]
    str r1, [r0]
    str r2, [r0, #0x8]
    str r2, [r0, #0xc]
    bx lr
