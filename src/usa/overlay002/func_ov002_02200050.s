; func_ov002_02200050 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce7a4
        .extern func_0202e1e0
        .extern func_0202e2bc
        .extern func_02030538
        .extern func_ov002_021b939c
        .extern func_ov002_021bbdac
        .extern func_ov002_021bc5e4
        .extern func_ov002_021c3304
        .extern func_ov002_021c9310
        .extern func_ov002_021ca1d8
        .global func_ov002_02200050
        .arm
func_ov002_02200050:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r5, #0x0
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x16
    movne r0, r5
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, r5
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT0
    mov r0, r5
    ldr r3, [r1, #0x5d4]
    cmp r3, #0x0
    bls .L_a0
    ldr r2, _LIT1
.L_54:
    ldrb r6, [r1, #0x5dc]
    cmp r6, #0x16
    bne .L_8c
    ldr r7, [r2]
    mov r6, r7, lsl #0xf
    movs r6, r6, lsr #0x1f
    beq .L_8c
    mov r6, r7, lsl #0x10
    movs r6, r6, lsr #0x1f
    beq .L_8c
    mov r6, r7, lsl #0x9
    mov r6, r6, lsr #0x1c
    cmp r6, #0xe
    addeq r5, r5, #0x1
.L_8c:
    add r0, r0, #0x1
    cmp r0, r3
    add r1, r1, #0x1
    add r2, r2, #0x4
    bcc .L_54
.L_a0:
    cmp r5, #0x1
    bne .L_1c0
    ldr r1, [r4, #0x14]
    mov r0, r1, lsl #0xf
    movs r0, r0, lsr #0x1f
    beq .L_1c0
    mov r0, r1, lsl #0x10
    movs r0, r0, lsr #0x1f
    beq .L_1c0
    mov r0, r1, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    bne .L_1c0
    mov r0, r1, lsl #0x17
    mov r0, r0, lsr #0x17
    bl func_ov002_021b939c
    ldr r2, [r4, #0x14]
    mov r1, r0, lsl #0x10
    mov r3, r1, lsr #0x10
    mov r1, r0, lsr #0x10
    mov r3, r3, asr #0x8
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x16
    and r6, r0, #0xff
    mov r0, r2, lsr #0x1f
    and r5, r3, #0xff
    mov r7, r1, lsr #0x10
    bl func_ov002_021bc5e4
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r5, #0xe
    bne .L_1c0
    mov r0, r6
    mov r1, r5
    mov r2, r7
    bl func_ov002_021c9310
    mov r5, r0
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_1c0
    ldrh r0, [r4, #0x2]
    mov r1, r6
    mov r2, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3304
    cmp r0, #0x0
    beq .L_1c0
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2bc
    cmp r0, #0x0
    beq .L_1b8
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_02030538
    cmp r0, #0x0
    beq .L_1b8
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbdac
    cmp r0, #0x0
    beq .L_1c0
.L_1b8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1c0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022ce7a4
