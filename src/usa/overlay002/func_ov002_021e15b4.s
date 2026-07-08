; func_ov002_021e15b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern data_ov002_022cf0a4
        .extern func_0202df24
        .extern func_0202e1e0
        .extern func_ov002_021ba5ec
        .extern func_ov002_021ba668
        .extern func_ov002_021ca55c
        .extern func_ov002_021e1324
        .extern func_ov002_021e1830
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .global func_ov002_021e15b4
        .arm
func_ov002_021e15b4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r9, r1
    mov sl, r0
    mov r0, r9
    mov r8, r2
    mov r7, r3
    mov r5, #0x0
    bl func_0202e1e0
    mov r1, r0
    mov r0, sl
    bl func_ov002_021ca55c
    cmp r0, #0x0
    bne .L_2dc
    mov r0, sl
    mov r1, r9
    mov r2, r8
    mov r3, r7
    bl func_ov002_021e1830
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2dc:
    mov r1, r9, lsl #0x10
    mov r0, sl
    mov r1, r1, lsr #0x10
    bl func_ov002_021ba5ec
    mov r1, r9, lsl #0x10
    mov r4, r0
    mov r0, sl
    mov r1, r1, lsr #0x10
    bl func_ov002_021ba668
    adds r0, r4, r0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_ov002_021e2a4c
    ldr r0, _LIT0
    and r1, sl, #0x1
    mul r0, r1, r0
    ldr r1, _LIT1
    str r0, [sp]
    ldr r0, [r1, r0]
    mov r4, r5
    cmp r0, #0x0
    bls .L_3b4
    ldr r1, _LIT2
    ldr r0, [sp]
    add fp, r1, r0
    add r6, fp, #0x260
.L_340:
    ldr r0, [r6]
    mov r1, r9
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df24
    cmp r0, #0x0
    beq .L_3a0
    ldr r0, [r6]
    mov r1, r0, lsl #0x12
    teq sl, r1, lsr #0x1f
    bne .L_3a0
    cmp r8, #0x0
    bne .L_37c
    cmp r5, #0x0
    bne .L_3b4
.L_37c:
    ldr r2, [r6]
    mov r0, sl
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r2, lsl #0x1
    mov r2, r7
    add r1, r3, r1, lsr #0x1f
    add r5, r5, #0x1
    bl func_ov002_021e1324
.L_3a0:
    ldr r0, [fp, #0x10]
    add r4, r4, #0x1
    cmp r4, r0
    add r6, r6, #0x4
    bcc .L_340
.L_3b4:
    ldr r1, _LIT3
    ldr r0, [sp]
    mov r6, #0x0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    bls .L_444
    ldr r1, _LIT2
    ldr r0, [sp]
    add fp, r1, r0
    add r4, fp, #0x3a0
.L_3dc:
    ldr r0, [r4]
    mov r1, r9
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df24
    cmp r0, #0x0
    beq .L_430
    cmp r8, #0x0
    bne .L_408
    cmp r5, #0x0
    bne .L_444
.L_408:
    ldr r2, [r4]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    mov r2, r7
    add r1, r1, r3, lsr #0x1f
    add r5, r5, #0x1
    bl func_ov002_021e1324
.L_430:
    ldr r0, [fp, #0x18]
    add r6, r6, #0x1
    cmp r6, r0
    add r4, r4, #0x4
    bcc .L_3dc
.L_444:
    bl func_ov002_021e2b6c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf0a4
