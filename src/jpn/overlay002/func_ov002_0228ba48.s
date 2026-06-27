; func_ov002_0228ba48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .global func_ov002_0228ba48
        .arm
func_ov002_0228ba48:
    cmp r1, #0x0
    moveq r0, #0x0
    bxeq lr
    ldrh r1, [r1, #0x2]
    ldrh r0, [r0, #0x2]
    mov r2, r1, lsl #0x1f
    mov r2, r2, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r2, r0, lsr #0x1f
    moveq r0, #0x0
    bxeq lr
    mov r0, r1, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x4
    movhi r0, #0x0
    ldrls r0, _LIT0
    ldrls r0, [r0, #0xd0]
    andls r0, r0, #0x1
    bx lr
_LIT0: .word data_ov002_022d008c
