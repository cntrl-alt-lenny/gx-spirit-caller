; func_ov002_021cb174 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022d016c
        .global func_ov002_021cb174
        .arm
func_ov002_021cb174:
    ldr r1, _LIT0
    mov r2, #0x6
    str r2, [r1, #0xd2c]
    ldr r0, _LIT1
    ldr r1, _LIT0
    ldrh r0, [r0, #0x2]
    tst r0, #0x1
    moveq r2, #0x1
    movne r2, #0x0
    str r2, [r1, #0xd30]
    ldr r3, [r1, #0xd0]
    ldr r0, _LIT1
    orr r3, r3, #0x1
    mov r2, #0x0
    str r3, [r1, #0xd0]
    str r2, [r0, #0x80c]
    bx lr
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022ce950
