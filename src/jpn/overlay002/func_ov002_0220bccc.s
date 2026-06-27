; func_ov002_0220bccc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern func_ov002_021ba024
        .global func_ov002_0220bccc
        .arm
func_ov002_0220bccc:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    mov r0, r2, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x12
    ldreq r1, _LIT0
    ldreq r0, [r1, #0x8]
    cmpeq r0, #0x0
    ldreq r0, [r1, #0x4]
    moveq r2, r2, lsl #0x1f
    cmpeq r0, r2, lsr #0x1f
    bne .L_e4
    ldr r1, [r1, #0x20]
    ldr r2, _LIT1
    bl func_ov002_021ba024
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, pc}
.L_e4:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word 0x000018a8
