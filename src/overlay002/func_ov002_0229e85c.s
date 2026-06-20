; func_ov002_0229e85c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022d0f98
        .extern func_0207f05c
        .extern func_ov002_0229d2c8
        .extern func_ov002_0229d5c0
        .extern func_ov002_0229ea40
        .global func_ov002_0229e85c
        .arm
func_ov002_0229e85c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x20
    mov sl, r0
    ldrsh r0, [sl, #0x2a]
    cmp r0, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r1, [sl, #0x28]
    add r0, sp, #0x0
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x1f
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_0229ea40
    ldr r1, [sp]
    ldrsh r8, [sl, #0x2a]
    ldr r0, [sp, #0x4]
    str r1, [sp, #0x18]
    str r0, [sp, #0x1c]
    cmp r8, #0x0
    add r7, r1, #0x5
    beq .L_d4
    add r0, r0, #0x6
    ldr r6, _LIT0
    ldr r5, _LIT1
    and r9, r0, #0xff
    add fp, sp, #0x10
    mov r4, #0xa
.L_70:
    smull r1, r2, r5, r8
    mov r0, r8, lsr #0x1f
    add r2, r0, r2, asr #0x2
    smull r0, r1, r4, r2
    sub r2, r8, r0
    mov r0, r2, lsl #0x7
    add r1, r0, #0x3600
    mov r0, r1, asr #0x6
    add r0, r1, r0, lsr #0x19
    mov r1, r7, lsl #0x17
    mov r0, r0, asr #0x7
    orr r2, r0, #0x5400
    orr r1, r9, r1, lsr #0x7
    str r1, [sp, #0x10]
    strh r2, [sp, #0x14]
    mov r0, r6
    mov r1, fp
    mov r2, #0x1
    bl func_0207f05c
    mov r1, r8
    smull r0, r8, r5, r1
    mov r0, r1, lsr #0x1f
    adds r8, r0, r8, asr #0x2
    sub r7, r7, #0x4
    bne .L_70
.L_d4:
    mov r0, sl
    bl func_ov002_0229d5c0
    mov r0, sl
    bl func_ov002_0229d2c8
    cmp r0, #0x0
    bne .L_fc
    add r0, sl, #0x14
    bl func_ov002_0229d2c8
    cmp r0, #0x0
    beq .L_110
.L_fc:
    ldrsh r0, [sl, #0x2a]
    cmp r0, #0x1
    ble .L_110
    add r0, sl, #0x14
    bl func_ov002_0229d5c0
.L_110:
    ldrsh r3, [sl, #0x2a]
    ldr r2, _LIT1
    smull r1, r0, r2, r3
    mov r1, r3, lsr #0x1f
    add r0, r1, r0, asr #0x2
    cmp r0, #0x3
    movgt r0, #0x3
    cmp r0, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r1, [sl, #0x28]
    ldrh r2, [sl, #0x28]
    mov r1, r1, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xc
    ldr r1, _LIT2
    moveq r3, #0x1
    ldr r1, [r1, #0x4]
    mov r2, r2, lsl #0x1f
    eor r1, r1, #0x1
    movne r3, #0x0
    cmp r1, r2, lsr #0x1f
    moveq r1, #0x1
    movne r1, #0x0
    eor r2, r3, r1
    sub r1, r0, #0x1
    add r0, r2, r2, lsl #0x1
    add r0, r1, r0
    mov r0, r0, lsl #0x9
    ldr r2, [sp, #0x1c]
    add r1, r0, #0x800
    ldr r3, [sp, #0x18]
    mov r0, r1, asr #0x6
    sub r2, r2, #0x10
    add r0, r1, r0, lsr #0x19
    sub r4, r3, #0x10
    mov r0, r0, asr #0x7
    orr r3, r0, #0x2800
    and r2, r2, #0xff
    orr r0, r2, #-2147483648
    mov r1, r4, lsl #0x17
    orr r4, r0, r1, lsr #0x7
    ldr r0, _LIT0
    add r1, sp, #0x8
    mov r2, #0x1
    str r4, [sp, #0x8]
    strh r3, [sp, #0xc]
    bl func_0207f05c
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d0f98
_LIT1: .word 0x66666667
_LIT2: .word data_ov002_022cd73c
