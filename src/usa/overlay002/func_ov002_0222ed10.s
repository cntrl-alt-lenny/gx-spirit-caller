; func_ov002_0222ed10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae320
        .extern func_ov002_021b99c8
        .extern func_ov002_021d7b2c
        .extern func_ov002_021e1780
        .extern func_ov002_021e26d0
        .extern func_ov002_021e277c
        .extern func_ov002_022535a4
        .extern func_ov002_0226af64
        .extern func_ov002_0226b0a4
        .global func_ov002_0222ed10
        .arm
func_ov002_0222ed10:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r2, [r5, #0x8]
    ldrh r1, [r5, #0xa]
    ldr r0, _LIT0
    and r3, r2, #0xff
    and r2, r1, #0xff
    ldr r1, [r0, #0x5a8]
    orr r0, r3, r2, lsl #0x8
    mov r0, r0, lsl #0x10
    sub r1, r1, #0x75
    cmp r1, #0xb
    mov r4, r0, lsr #0x10
    addls pc, pc, r1, lsl #0x2
    b .L_1d4
    b .L_1a0
    b .L_188
    b .L_16c
    b .L_14c
    b .L_1d4
    b .L_1d4
    b .L_1d4
    b .L_1d4
    b .L_1d4
    b .L_1d4
    b .L_b8
    b .L_6c
.L_6c:
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    mov r2, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_022535a4
    cmp r0, #0x0
    moveq r0, #0x78
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    mov r2, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b0a4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_b8:
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r2, r1, lsr #0x1f
    ldrh r1, [r0, #0xb2]
    rsb r0, r2, #0x1
    bl func_ov002_021b99c8
    movs r4, r0
    bmi .L_110
    ldrh r0, [r5, #0x2]
    ldr r3, _LIT2
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x120
    add r1, r1, r4, lsl #0x2
    mov r2, #0x1
    bl func_ov002_021d7b2c
    b .L_130
.L_110:
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT1
    mov r2, #0x1
    mov r1, r1, lsl #0x1f
    mov r3, r1, lsr #0x1f
    ldrh r1, [r0, #0xb2]
    rsb r0, r3, #0x1
    bl func_ov002_021e1780
.L_130:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_14c:
    ldrh r0, [r5, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x77
    ldmia sp!, {r3, r4, r5, pc}
.L_16c:
    ldrh r0, [r5, #0x2]
    mov r1, #0xd
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x76
    ldmia sp!, {r3, r4, r5, pc}
.L_188:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226af64
    mov r0, #0x75
    ldmia sp!, {r3, r4, r5, pc}
.L_1a0:
    ldrh r0, [r5, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e26d0
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1d4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d0d8c
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
