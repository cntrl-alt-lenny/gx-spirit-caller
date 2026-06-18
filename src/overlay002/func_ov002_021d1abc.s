; func_ov002_021d1abc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022d016c
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d1abc
        .arm
func_ov002_021d1abc:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r2, [r0, #0x810]
    ldrh r1, [r0, #0x2]
    cmp r2, #0x0
    bne .L_4c
    cmp r1, #0x0
    ldreq r0, _LIT1
    ldreq r2, [r0, #0xcf0]
    streq r2, [r0, #0xcf4]
    mov r2, #0x0
    mov r3, r2
    mov r0, #0x3d
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, pc}
.L_4c:
    mov r0, #0x3d
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word data_ov002_022d016c
