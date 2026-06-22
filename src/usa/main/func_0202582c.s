; func_0202582c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202582c
        .arm
func_0202582c:
    add r1, r0, #0x100
    ldrh r1, [r1, #0x6a]
    mov r2, r1, lsl #0x1d
    movs r2, r2, lsr #0x1f
    movne r0, r1, lsl #0x15
    movne r0, r0, lsr #0x1f
    bxne lr
    ldr r0, [r0, #0xa4]
    cmp r0, #0x0
    moveq r0, #0x0
    bxeq lr
    ldr r0, [r0, #0x60]
    mov r0, r0, lsl #0x1e
    mov r0, r0, lsr #0x1f
    bx lr
