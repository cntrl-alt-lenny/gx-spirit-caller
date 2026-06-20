; func_ov002_022344c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf178
        .extern data_ov002_022d0e6c
        .extern func_ov002_021d71e0
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021ff3bc
        .extern func_ov002_022287c4
        .extern func_ov002_0226afb4
        .extern func_ov002_0226b094
        .global func_ov002_022344c8
        .arm
func_ov002_022344c8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    mov r5, r1
    sub r2, r2, #0x7a
    cmp r2, #0x6
    addls pc, pc, r2, lsl #0x2
    b .L_170
    b .L_164
    b .L_118
    b .L_d4
    b .L_118
    b .L_d4
    b .L_b0
    b .L_40
.L_40:
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    mov r1, r5
    bl func_ov002_022287c4
    ldrh r1, [r4, #0x2]
    ldr r0, [r4, #0x14]
    mov r1, r1, lsl #0x1f
    mov r2, r1, lsr #0x1f
    mov r1, r0, lsl #0x14
    cmp r2, r1, lsr #0x1f
    beq .L_a8
    mov r0, r0, lsl #0x16
    cmp r2, r0, lsr #0x1f
    bne .L_a8
    rsb r1, r2, #0x1
    ldr r0, _LIT1
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r2]
    cmp r0, #0x2
    movcs r0, #0x7f
    ldmcsia sp!, {r3, r4, r5, pc}
.L_a8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_b0:
    bl func_ov002_021e2b3c
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b094
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_d4:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    beq .L_108
    ldrh r1, [r4]
    bl func_ov002_0226afb4
.L_108:
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    sub r0, r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_118:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    beq .L_154
    ldr r1, _LIT3
    mov r2, #0x0
    ldrh r1, [r1, #0xb0]
    bl func_ov002_021d71e0
.L_154:
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    sub r0, r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_164:
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_170:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022d0e6c
