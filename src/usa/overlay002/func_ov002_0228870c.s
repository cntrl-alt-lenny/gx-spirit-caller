; func_ov002_0228870c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022d008c
        .global func_ov002_0228870c
        .arm
func_ov002_0228870c:
    ldrh r0, [r0, #0x2]
    ldr r1, _LIT0
    ldr r3, [r1, #0xcec]
    mov r2, r0, lsl #0x1f
    cmp r3, r2, lsr #0x1f
    moveq r0, #0x0
    bxeq lr
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    add r0, r0, #0xee
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    ldrls r0, _LIT1
    ldrls r0, [r0, #0x8]
    bxls lr
    ldr r0, [r1, #0xcf8]
    cmp r0, #0x5
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd314
