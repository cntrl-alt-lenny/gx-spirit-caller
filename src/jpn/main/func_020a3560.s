; func_020a3560 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9818
        .global func_020a3560
        .arm
func_020a3560:
    ldr r0, _LIT0
    ldr r1, [r0]
    ldrh r0, [r1, #0x12]
    cmp r0, #0x0
    ldrh r0, [r1, #0xe]
    movne r2, #0x2
    moveq r2, #0x0
    cmp r0, #0x0
    movne r3, #0x1
    ldrh r0, [r1, #0x14]
    moveq r3, #0x0
    cmp r0, #0x0
    movne ip, #0x4
    ldrh r0, [r1, #0x16]
    moveq ip, #0x0
    cmp r0, #0x0
    movne r1, #0x8
    orr r0, r3, r2
    moveq r1, #0x0
    orr r0, ip, r0
    orr r0, r1, r0
    and r0, r0, #0xff
    bx lr
_LIT0: .word data_021a9818
