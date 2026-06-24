; func_ov002_0221bbd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021ae400
        .extern func_ov002_021ba6cc
        .extern func_ov002_021bd030
        .extern func_ov002_021bd110
        .extern func_ov002_021d5d48
        .extern func_ov002_021e16a4
        .extern func_ov002_021e1b24
        .extern func_ov002_021e286c
        .extern func_ov002_021e797c
        .extern func_ov002_021fe3d4
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0226b054
        .global func_ov002_0221bbd8
        .arm
func_ov002_0221bbd8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r1, #0x0
    mov r5, r0
    bl func_ov002_0223de94
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x1
    bgt .L_2c
    beq .L_1b0
    b .L_1c8
.L_2c:
    sub r0, r0, #0x78
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_1c8
    b .L_194
    b .L_1c8
    b .L_1c8
    b .L_1c8
    b .L_1c8
    b .L_188
    b .L_150
    b .L_118
    b .L_60
.L_60:
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bd110
    cmp r0, #0x0
    beq .L_b8
    mov r1, #0x0
    mov r0, r5
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_b8
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    mov r0, r5
    and r1, r4, #0xff
    and r2, r2, #0xff
    bl func_ov002_021e797c
    cmp r0, #0x0
    bne .L_110
.L_b8:
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ba6cc
    cmp r0, #0x0
    ldrh r0, [r5, #0x2]
    beq .L_f8
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    ldr r1, _LIT1
    mov r3, r2
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e16a4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_f8:
    mov r0, r0, lsl #0x1f
    mov r1, #0xd
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, pc}
.L_110:
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_118:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bd030
    ldr r1, _LIT0
    mov r2, r0
    str r2, [r1, #0x5ac]
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e1b24
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_150:
    ldrh r0, [r5, #0x2]
    ldr r1, [r1, #0x5ac]
    mov r2, r4, lsl #0x10
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0xff
    and r1, r1, #0xff
    orr r1, r3, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d5d48
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, pc}
.L_188:
    bl func_ov002_021fe3d4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_194:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b054
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1b0:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1c8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x000013ea
