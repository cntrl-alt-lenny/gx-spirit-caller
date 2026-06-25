; func_ov002_0228ab1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0228ab1c
        .arm
func_ov002_0228ab1c:
    ldrh r1, [r0, #0x2]
    ldr r0, [r0, #0x14]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and r0, r0, #0xff
    cmp r1, r0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
