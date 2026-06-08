; func_ov002_022074dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf188
        .global func_ov002_022074dc
        .arm
func_ov002_022074dc:
    ldrh r0, [r0, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    moveq r0, #0x1
    bxeq lr
    mov r0, r0, lsl #0x1f
    mov r1, r0, lsr #0x1f
    ldr r0, _LIT0
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT1
    ldr r0, [r0, r2]
    cmp r0, #0x7
    movcs r0, #0x1
    movcc r0, #0x0
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf188
