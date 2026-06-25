; func_ov002_02206cb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0170
        .extern func_0202df24
        .extern func_ov002_021ca4dc
        .global func_ov002_02206cb0
        .arm
func_ov002_02206cb0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    bl func_ov002_021ca4dc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x16
    cmpne r0, #0x1b
    bne .L_b4
    ldr r1, [r4, #0x14]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x16
    mov r2, r2, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r2, r0, lsr #0x1f
    bne .L_b4
    mov r0, r1, lsl #0x12
    mov r0, r0, lsr #0x1c
    cmp r0, #0x4
    bhi .L_b4
    mov r0, r1, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_b4
    mov r0, r1, lsl #0x10
    movs r0, r0, lsr #0x1f
    beq .L_b4
    mov r0, r1, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    bne .L_b4
    mov r1, r1, lsl #0x17
    ldr r0, _LIT0
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df24
    ldmia sp!, {r4, pc}
.L_b4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d0170
_LIT1: .word 0x00001691
