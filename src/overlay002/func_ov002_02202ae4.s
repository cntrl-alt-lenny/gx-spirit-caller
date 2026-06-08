; func_ov002_02202ae4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .global func_ov002_02202ae4
        .arm
func_ov002_02202ae4:
    ldrh r1, [r0, #0x2]
    mov r2, r1, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x12
    movne r0, #0x0
    bxne lr
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    moveq r0, #0x0
    bxeq lr
    ldr r0, _LIT0
    mov r1, r1, lsl #0x1f
    ldr r0, [r0]
    cmp r0, r1, lsr #0x1f
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
_LIT0: .word data_ov002_022cd3f4
