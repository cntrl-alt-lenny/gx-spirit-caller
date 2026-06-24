; func_0208c75c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208c75c
        .arm
func_0208c75c:
    ldrh r1, [r0]
    and r1, r1, #0xc000
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    moveq r0, #0x0
    bxeq lr
    cmp r1, #0x4000
    ldreqh r0, [r0]
    andeq r0, r0, #0x1f
    bxeq lr
    cmp r1, #0x8000
    ldreqh r0, [r0]
    andeq r0, r0, #0x1f
    rsbeq r0, r0, #0x0
    movne r0, #0x0
    bx lr
