; func_ov002_0223967c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022d0170
        .extern func_0202e1e0
        .extern func_ov002_021b939c
        .extern func_ov002_021bc5e4
        .extern func_ov002_021c3304
        .extern func_ov002_021d58dc
        .extern func_ov002_021ff2cc
        .extern func_ov002_0227acc8
        .global func_ov002_0223967c
        .arm
func_ov002_0223967c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldrh r5, [r6, #0x2]
    ldrh r7, [r6, #0x4]
    ldr r2, _LIT0
    mov r3, r5, lsl #0x1f
    mov r3, r3, lsr #0x1f
    and r4, r3, #0x1
    mov ip, r5, lsl #0x1a
    mul r2, r4, r2
    ldr r5, _LIT1
    mov lr, ip, lsr #0x1b
    mov r4, #0x14
    mul ip, lr, r4
    add r5, r5, r2
    add r4, r5, #0x30
    ldr r5, [r4, ip]
    mov r7, r7, lsl #0x11
    mov r4, r5, lsl #0x2
    mov r4, r4, lsr #0x18
    mov r5, r5, lsl #0x12
    mov r4, r4, lsl #0x1
    mov r7, r7, lsr #0x17
    add r4, r4, r5, lsr #0x1f
    cmp r7, r4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r4, _LIT2
    add r2, r4, r2
    ldrh r2, [ip, r2]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r4, _LIT3
    ldr r2, [r4, #0x5a8]
    cmp r2, #0x7f
    beq .L_180
    cmp r2, #0x80
    bne .L_1ac
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r6, #0x14]
    bl func_ov002_021b939c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r0, lsr #0x10
    mov r2, r1, asr #0x8
    mov r1, r3, lsl #0x10
    and r2, r2, #0xff
    cmp r2, #0xe
    and r4, r0, #0xff
    mov r5, r1, lsr #0x10
    bne .L_178
    ldr r1, [r6, #0x14]
    ldr r0, _LIT4
    mov r1, r1, lsl #0x2
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_178
    ldrh r0, [r6, #0x2]
    mov r1, r4
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3304
    cmp r0, #0x0
    beq .L_178
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc5e4
    ldr r1, _LIT3
    ldr r3, _LIT1
    str r0, [r1, #0x5ac]
    ldr r0, _LIT0
    and r1, r4, #0x1
    mla r0, r1, r0, r3
    ldrh ip, [r6, #0x2]
    add r0, r0, #0x18
    add r1, r0, #0x400
    mov r3, ip, lsl #0x1f
    ldrh r2, [r6]
    mov r0, r3, lsr #0x1f
    add r1, r1, r5, lsl #0x2
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227acc8
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_178:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_180:
    mov r0, #0x0
    str r0, [sp]
    and r1, r3, #0xff
    and r0, lr, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    ldr r1, [r4, #0x5ac]
    mov r0, r3
    mov r2, r2, lsr #0x10
    mov r3, #0x7
    bl func_ov002_021d58dc
.L_1ac:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022ce1a8
_LIT4: .word data_ov002_022d0170
