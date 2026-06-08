; func_ov002_021e2e38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022d016c
        .global func_ov002_021e2e38
        .arm
func_ov002_021e2e38:
    ldr r1, _LIT0
    ldr r1, [r1, #0xd0c]
    cmp r1, #0x0
    moveq r0, #0x0
    bxeq lr
    ldrh r2, [r0, #0x2]
    ldr r0, _LIT1
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r3, [r0, #0x4]
    eor r0, r1, r2, lsr #0x1f
    cmp r3, r0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cd73c
