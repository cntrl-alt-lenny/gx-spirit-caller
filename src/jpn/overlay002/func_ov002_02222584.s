; func_ov002_02222584 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae3a4
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021bc538
        .extern func_ov002_021ca1d8
        .extern func_ov002_022535a4
        .extern func_ov002_0226b168
        .extern func_ov002_0227acc8
        .global func_ov002_02222584
        .arm
func_ov002_02222584:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    sub r0, r0, #0x7d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_150
    b .L_128
    b .L_ec
    b .L_88
    b .L_30
.L_30:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b168
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_88:
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT1
    ldrh r1, [r4]
    mov r3, r2, lsl #0x1f
    ldrh r2, [r0, #0xb0]
    mov r0, r3, lsr #0x1f
    bl func_ov002_022535a4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_dc
    ldr r0, _LIT3
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_e4
.L_dc:
    mov r0, #0x2f
    bl func_ov002_021ae3a4
.L_e4:
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_ec:
    ldr r0, _LIT3
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT1
    ldrh r2, [r4]
    ldrh r3, [r0, #0xb0]
    mov r1, r1, lsl #0x1f
    mov r0, r1, lsr #0x1f
    mov r1, #0x6
    bl func_ov002_021af8f0
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_128:
    bl func_ov002_021afa94
    ldrh r3, [r4, #0x2]
    mov r1, r0
    mov r2, #0x1
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_0227acc8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_150:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d0d8c
_LIT2: .word data_ov002_022cd664
_LIT3: .word data_ov002_022d008c
