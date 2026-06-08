; func_ov002_02201de4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .global func_ov002_02201de4
        .arm
func_ov002_02201de4:
    ldrh r2, [r0, #0x2]
    mov r1, r2, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x19
    bne .L_18c
    ldr r1, [r0, #0x14]
    mov r0, r2, lsl #0x1f
    mov r1, r1, lsl #0x16
    mov r1, r1, lsr #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    bxeq lr
    ldr r0, _LIT0
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_18c:
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov002_022d016c
