; func_ov002_0223ca50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_02031630
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021afac0
        .extern func_ov002_021aff1c
        .extern func_ov002_021bc538
        .extern func_ov002_0223b378
        .extern func_ov002_0223b494
        .extern func_ov002_0223b4dc
        .extern func_ov002_0223b5fc
        .extern func_ov002_0223bd50
        .extern func_ov002_02253600
        .extern func_ov002_02257a60
        .extern func_ov002_0229ce00
        .global func_ov002_0223ca50
        .arm
func_ov002_0223ca50:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x100
    mov r5, r0
    ldrh r4, [r5, #0x2]
    ldr r7, _LIT0
    mov r3, r4, lsl #0x11
    ldr r2, [r7, #0x5a8]
    mov r4, r4, lsl #0x1f
    sub r2, r2, #0x7c
    mov r3, r3, lsr #0x1f
    cmp r2, #0x4
    eor r4, r3, r4, lsr #0x1f
    addls pc, pc, r2, lsl #0x2
    b .L_3b8
    b .L_26c
    b .L_164
    b .L_98
    b .L_78
    b .L_4c
.L_4c:
    bl func_ov002_02257a60
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r4
    mov r1, #0x5b
    bl func_ov002_021ae320
    add sp, sp, #0x100
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_78:
    ldrh r2, [r5]
    mov r0, r4
    mov r1, #0x6
    mov r3, #0x0
    bl func_ov002_021af8f0
    add sp, sp, #0x100
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_98:
    bl func_ov002_021afa94
    ldr r1, [r0]
    mov r0, r7
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    str r1, [r0, #0x69c]
    bl func_ov002_021afa94
    mov r5, r0
    bl func_ov002_021afa94
    ldr r0, [r0]
    ldr r1, [r5]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    mov r0, r7
    add r1, r1, r2, lsr #0x1f
    str r1, [r0, #0x6a0]
    ldr r0, [r0, #0x69c]
    bl func_ov002_0223b378
    mov r1, r7
    str r0, [r1, #0x6a4]
    ldr r0, [r1, #0x69c]
    bl func_02031630
    cmp r0, #0x0
    moveq r2, #0x1
    ldr r0, _LIT0
    movne r2, #0x0
    mov r1, #0x0
    str r2, [r0, #0x6b0]
    str r1, [r0, #0x6ac]
    bl func_ov002_0223b494
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1, #0x69c]
    cmp r2, r0
    bne .L_13c
    mov r0, r4
    mov r1, #0x5c
    bl func_ov002_021ae320
    b .L_158
.L_13c:
    ldr r2, [r1, #0x6a4]
    add r0, sp, #0x0
    mov r1, #0xc
    bl func_ov002_0229ce00
    add r1, sp, #0x0
    mov r0, r4
    bl func_ov002_021ae320
.L_158:
    add sp, sp, #0x100
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_164:
    ldr r3, [r7, #0x69c]
    ldr r0, _LIT1
    cmp r3, r0
    bne .L_19c
    ldr r0, [r7, #0x6ac]
    cmp r0, #0x2
    bcc .L_248
    ldrh r2, [r5]
    mov r0, r4
    mov r1, #0x48
    bl func_ov002_021af8f0
    add sp, sp, #0x100
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19c:
    mov r0, r4
    bl func_ov002_021bc538
    cmp r0, #0x0
    moveq r0, r7
    ldreq r0, [r0, #0x6ac]
    cmpeq r0, #0x0
    beq .L_248
    ldr r1, _LIT0
    ldr r0, _LIT2
    ldr r3, [r1, #0x69c]
    cmp r3, r0
    bne .L_1f8
    ldr r0, [r1, #0x6ac]
    ldrh r2, [r5]
    rsb r1, r0, #0x5
    cmp r1, #0x20
    movcs r1, #0x20
    mov r0, r4
    add r1, r1, #0x6
    bl func_ov002_021af8f0
    add sp, sp, #0x100
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1f8:
    ldr r7, [r1, #0x6a4]
    ldr r6, [r1, #0x6ac]
    ldrh r1, [r5]
    mov r0, r4
    mov r2, r3
    sub r6, r7, r6
    bl func_ov002_02253600
    cmp r6, r0
    bne .L_248
    ldr r0, _LIT0
    ldrh r2, [r5]
    cmp r6, #0x20
    movcs r6, #0x20
    ldr r3, [r0, #0x69c]
    mov r0, r4
    add r1, r6, #0x6
    bl func_ov002_021af8f0
    add sp, sp, #0x100
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_248:
    ldr r0, _LIT0
    ldrh r2, [r5]
    ldr r3, [r0, #0x69c]
    mov r0, r4
    mov r1, #0x6
    bl func_ov002_021af8f0
    add sp, sp, #0x100
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_26c:
    ldr r6, _LIT3
    mov sl, #0x0
    ldr r8, [r6, #0xd44]
    cmp r8, #0x0
    bls .L_330
    mov fp, #0x1
    mov r9, fp
.L_288:
    add r0, sl, #0x1
    bl func_ov002_021aff1c
    bl func_ov002_021afa94
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    mov r8, r0, lsr #0x13
    bl func_ov002_021afac0
    cmp r0, #0xe
    bne .L_2bc
    mov r0, r8
    mov r1, r9
    bl func_ov002_0223b4dc
    b .L_2d0
.L_2bc:
    bl func_ov002_021afac0
    mov r1, r0
    mov r0, r4
    mov r2, fp
    bl func_ov002_0223b5fc
.L_2d0:
    bl func_ov002_021afa94
    mov r8, r0
    bl func_ov002_021afa94
    ldr r0, [r0]
    ldr r8, [r8]
    mov r0, r0, lsl #0x2
    mov r3, r0, lsr #0x18
    ldr r2, [r7, #0x494]
    ldr r1, [r7, #0x6ac]
    mov r0, r8, lsl #0x12
    add r1, r2, r1
    mov r1, r1, lsl #0x19
    mov r2, r3, lsl #0x1
    add r1, r7, r1, lsr #0x18
    add r2, r2, r0, lsr #0x1f
    add r0, r1, #0x400
    strh r2, [r0, #0x98]
    ldr r0, [r7, #0x6ac]
    add sl, sl, #0x1
    add r0, r0, #0x1
    str r0, [r7, #0x6ac]
    ldr r8, [r6, #0xd44]
    cmp sl, r8
    bcc .L_288
.L_330:
    ldr r1, _LIT0
    ldr r3, [r1, #0x6ac]
    ldr r0, [r1, #0x6a4]
    cmp r3, r0
    addcc sp, sp, #0x100
    movcc r0, #0x7d
    ldmccia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, [r1, #0x69c]
    ldr r0, _LIT1
    cmp r2, r0
    bne .L_3a0
    cmp r3, #0x2
    bne .L_394
    sub r0, r3, r8
    cmp r0, #0x2
    bcs .L_394
    mov r0, #0x7
    str r0, [r1, #0x6b8]
    ldrh r1, [r5]
    mov r0, r4
    bl func_ov002_02253600
    cmp r0, #0x0
    addne sp, sp, #0x100
    movne r0, #0x7d
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_394:
    ldr r0, _LIT0
    ldr r1, [r0, #0x6ac]
    str r1, [r0, #0x6a4]
.L_3a0:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x6ac]
    add sp, sp, #0x100
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3b8:
    mov r0, r5
    bl func_ov002_0223bd50
    add sp, sp, #0x100
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00001a4e
_LIT2: .word 0x0000157e
_LIT3: .word data_ov002_022d008c
