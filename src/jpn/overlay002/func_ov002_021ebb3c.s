; func_ov002_021ebb3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern func_0202e810
        .extern func_ov002_021b9dec
        .extern func_ov002_021ba024
        .extern func_ov002_021bc1a8
        .extern func_ov002_021bc538
        .extern func_ov002_021bc7e8
        .global func_ov002_021ebb3c
        .arm
func_ov002_021ebb3c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r0, [r6, #0x2]
    mov r5, r1
    mov r4, r2
    mov r3, r0, lsl #0x14
    mov r3, r3, lsr #0x1a
    cmp r3, #0x23
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc7e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    mov r1, #0x14
    ldr r2, _LIT1
    and r3, r5, #0x1
    mul r1, r4, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    bne .L_b0
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r5
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021bc1a8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_b0:
    ldrh r1, [r6]
    ldr r2, _LIT2
    cmp r1, r2
    beq .L_dc
    add r0, r2, #0x3b8
    cmp r1, r0
    beq .L_f0
    ldr r0, _LIT3
    cmp r1, r0
    beq .L_104
    b .L_118
.L_dc:
    mov r0, r5
    mov r1, r4
    mov r2, #0xfe0
    bl func_ov002_021ba024
    ldmia sp!, {r4, r5, r6, pc}
.L_f0:
    mov r0, r5
    mov r1, r4
    sub r2, r2, #0x2fc
    bl func_ov002_021ba024
    ldmia sp!, {r4, r5, r6, pc}
.L_104:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9dec
    bl func_0202e810
    ldmia sp!, {r4, r5, r6, pc}
.L_118:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4
_LIT2: .word 0x000012c5
_LIT3: .word 0x00001768
