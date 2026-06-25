; func_ov002_022ae5dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .global func_ov002_022ae5dc
        .arm
func_ov002_022ae5dc:
    ldrh r0, [r0]
    cmp r0, #0x0
    beq .L_26fc
    ldr r0, _LIT0
    ldr r0, [r0, #0xd48]
    cmp r0, #0x1
    moveq r0, #0x1
    bxeq lr
.L_26fc:
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov002_022d008c
