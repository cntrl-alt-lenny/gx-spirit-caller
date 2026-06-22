; func_0207da8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207da8c
        .arm
func_0207da8c:
    ldr r1, [r0, #0x18]
    add r2, r0, #0x24
    str r1, [r0, #0x24]
    mov r0, #0x0
    str r0, [r2, #0x8]
    bx lr
