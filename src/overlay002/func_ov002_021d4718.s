; func_ov002_021d4718 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd490
        .extern data_ov002_022ce950
        .extern func_ov002_0229ade0
        .global func_ov002_021d4718
        .arm
func_ov002_021d4718:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldrh r0, [r0]
    mov r2, #0x0
    tst r0, #0x8000
    movne r3, #0x1
    moveq r3, #0x0
.L_14c:
    ldr r0, [r1, #0xa8]
    cmp r3, r0
    bne .L_170
    mov r0, #0x14
    mul r1, r2, r0
    ldr r0, _LIT2
    mov r2, #0x0
    str r2, [r0, r1]
    b .L_180
.L_170:
    add r2, r2, #0x1
    cmp r2, #0x2
    add r1, r1, #0x14
    blt .L_14c
.L_180:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0xf
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word data_ov002_022cd3f4
_LIT2: .word data_ov002_022cd490
