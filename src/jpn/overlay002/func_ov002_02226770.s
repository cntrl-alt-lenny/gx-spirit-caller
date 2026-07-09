; func_ov002_02226770 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf0c4
        .extern func_0202b824
        .extern func_0202b83c
        .extern func_0202b854
        .extern func_ov002_021b9dec
        .extern func_ov002_021bc538
        .extern func_ov002_021bc5e4
        .extern func_ov002_021c1d64
        .extern func_ov002_021c4bbc
        .extern func_ov002_021ca1d8
        .extern func_ov002_021ca310
        .extern func_ov002_021d58dc
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_0227acc8
        .global func_ov002_02226770
        .arm
func_ov002_02226770:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x34
    ldr r1, _LIT0
    mov r6, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_184
    cmp r1, #0x80
    bne .L_2cc
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    addeq sp, sp, #0x34
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    addeq sp, sp, #0x34
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    mov r1, #0x0
    mov r0, r6
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_2cc
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223dda4
    and r4, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r3, r0, asr #0x8
    ldr r0, _LIT1
    ldr r1, _LIT2
    and r2, r4, #0x1
    mla r1, r2, r0, r1
    and r5, r3, #0xff
    mov r0, #0x14
    smulbb r0, r5, r0
    ldrh r0, [r0, r1]
    cmp r0, #0x0
    beq .L_2cc
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021c1d64
    cmp r0, #0x0
    bne .L_2cc
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9dec
    ldrh r2, [r6, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca310
    cmp r0, #0x0
    beq .L_2cc
    mov r2, #0x0
    sub r0, r2, #0x2000
    and r0, r0, #0x0
    add r3, sp, #0x4
    orr r1, r0, #0x2
    orr r1, r1, #0x1600
    str r2, [r3]
    str r1, [sp, #0x4]
    ldrh r0, [r6, #0x2]
    bic r1, r1, #0x2000
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x12
    str r0, [sp, #0x4]
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc5e4
    ldr r2, _LIT0
    add r1, sp, #0x4
    str r0, [r2, #0x5ac]
    ldrh r3, [r6, #0x2]
    ldrh r0, [r6]
    mov r2, #0x1
    mov r4, r3, lsl #0x1f
    mov r3, r0, lsl #0x10
    mov r0, r4, lsr #0x1f
    orr r3, r3, #0x1
    bl func_ov002_0227acc8
    add sp, sp, #0x34
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_184:
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r4, r0, #0xff
    and r5, r1, #0xff
    add r2, sp, #0x8
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c4bbc
    ldr r0, [sp, #0x8]
    bl func_0202b824
    mov r8, r0
    ldr r0, [sp, #0x8]
    bl func_0202b83c
    mov r7, r0
    ldr r0, [sp, #0x8]
    bl func_0202b854
    and r1, r7, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0, lsl #0x4
    and r2, r8, #0xff
    and r0, r0, #0xff
    orr r0, r0, r2, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r0, [r6, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    ldr r1, [r1, #0x5ac]
    mov r0, r0, lsr #0x1f
    mov r3, #0x5
    bl func_ov002_021d58dc
    ldr r1, [sp, #0x24]
    ldr r0, _LIT4
    ldr r2, _LIT3
    cmp r1, r0
    movgt r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r1, [r6, #0x2]
    ldr r0, _LIT0
    mov r3, r1, lsl #0x1f
    ldr r1, [r0, #0x5ac]
    mov r0, r3, lsr #0x1f
    mov r3, #0x5
    bl func_ov002_021d58dc
    ldr r1, [sp, #0x28]
    ldr r0, _LIT4
    ldr r2, _LIT3
    cmp r1, r0
    movgt r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r1, [r6, #0x2]
    ldr r0, _LIT0
    mov r3, r1, lsl #0x1f
    ldr r1, [r0, #0x5ac]
    mov r0, r3, lsr #0x1f
    mov r3, #0x5
    bl func_ov002_021d58dc
    mov r0, #0x0
    str r0, [sp]
    ldrh r2, [r6, #0x2]
    ldr r1, _LIT0
    mov r0, r4
    mov r2, r2, lsl #0x1f
    ldr r1, [r1, #0x5ac]
    mov r2, r2, lsr #0x1f
    and r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r2, r1, lsl #0x10
    mov r1, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x7
    bl func_ov002_021d58dc
.L_2cc:
    mov r0, #0x0
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x00001602
_LIT4: .word 0x0000ffff
