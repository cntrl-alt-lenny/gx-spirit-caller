; func_ov002_0220e77c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202b878
        .extern func_ov002_021c1a2c
        .extern func_ov002_021c1e44
        .extern func_ov002_021d5d48
        .extern func_ov002_021d90c0
        .extern func_ov002_021e797c
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0226b11c
        .global func_ov002_0220e77c
        .arm
func_ov002_0220e77c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r1, #0x0
    bl func_ov002_0223de94
    ldrh r2, [r7, #0x2]
    ldr r4, _LIT0
    ldr r1, _LIT1
    mov r3, r2, lsl #0x1f
    mov r3, r3, lsr #0x1f
    and r3, r3, #0x1
    mla r5, r3, r1, r4
    ldrh r1, [r7, #0x4]
    mov r2, r2, lsl #0x1a
    mov r4, r0
    mov r3, r1, lsl #0x11
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    mov r2, r2, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    add r2, r5, #0x30
    ldr r2, [r2, r1]
    mov r3, r3, lsr #0x17
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    and r5, r4, #0xff
    and r6, r0, #0xff
    cmp r3, r1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r1, #0x0
    mov r0, r7
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_b8
    mov r0, r7
    mov r1, r5
    mov r2, r6
    bl func_ov002_021e797c
    cmp r0, #0x0
    bne .L_cc
.L_b8:
    ldrh r1, [r7, #0x4]
    mov r0, #0x0
    orr r1, r1, #0x8
    strh r1, [r7, #0x4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_cc:
    ldrh r0, [r7]
    bl func_0202b878
    cmp r0, #0x17
    bne .L_fc
    ldrh r0, [r7, #0x4]
    mov r1, r0, lsl #0x1d
    movs r1, r1, lsr #0x1f
    beq .L_fc
    orr r0, r0, #0x8
    strh r0, [r7, #0x4]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_fc:
    ldrh r1, [r7, #0x2]
    mov r0, r4, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    and r3, r0, #0xff
    and r1, r1, #0xff
    orr r1, r3, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d5d48
    ldrh r2, [r7]
    ldr r1, _LIT2
    cmp r2, r1
    bgt .L_154
    bge .L_198
    sub r0, r1, #0x5c
    cmp r2, r0
    beq .L_178
    b .L_1f4
.L_154:
    ldr r0, _LIT3
    cmp r2, r0
    bgt .L_168
    beq .L_178
    b .L_1f4
.L_168:
    add r0, r1, #0x378
    cmp r2, r0
    beq .L_198
    b .L_1f4
.L_178:
    ldrh r0, [r7, #0x2]
    ldrh r2, [r7, #0xa]
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d90c0
    b .L_1f4
.L_198:
    ldrh r0, [r7, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_1f4
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    beq .L_1f4
    mov r0, r7
    mov r1, r5
    mov r2, r6
    bl func_ov002_021c1e44
    cmp r0, #0x0
    bne .L_1f4
    ldrh r2, [r7]
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c1a2c
    cmp r0, #0x0
    beq .L_1f4
    mov r0, r5
    mov r1, r6
    bl func_ov002_0226b11c
.L_1f4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0x00001322
_LIT3: .word 0x0000145b
