; func_ov002_02207894 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd364
        .global func_ov002_02207894
        .arm
func_ov002_02207894:
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x16
    bne .L_1bc
    ldr r1, _LIT0
    ldr r0, [r0, #0x14]
    ldr r1, [r1, #0x70]
    mov r0, r0, lsl #0x17
    cmp r1, r0, lsr #0x17
    moveq r2, #0x1
    movne r2, #0x0
    mov r0, #0x38
    mul r1, r2, r0
    ldr r0, _LIT1
    ldr r0, [r0, r1]
    cmp r0, #0xa
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_1bc:
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov002_022cd314
_LIT1: .word data_ov002_022cd364
