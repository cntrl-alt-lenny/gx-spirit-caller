; func_ov002_0220cf08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .global func_ov002_0220cf08
        .arm
func_ov002_0220cf08:
    ldrh r2, [r0, #0x2]
    ldr r0, _LIT0
    ldr r1, [r0, #0xcec]
    mov r2, r2, lsl #0x1f
    cmp r1, r2, lsr #0x1f
    moveq r0, #0x0
    bxeq lr
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
_LIT0: .word data_ov002_022d008c
