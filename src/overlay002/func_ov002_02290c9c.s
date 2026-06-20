; func_ov002_02290c9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd524
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_0202b8a8
        .extern func_0202e234
        .extern func_0202f9e8
        .extern func_ov002_02259774
        .extern func_ov002_0226eb5c
        .extern func_ov002_0227b960
        .global func_ov002_02290c9c
        .arm
func_ov002_02290c9c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    mov sl, r0
    ldr r0, _LIT0
    and r1, sl, #0x1
    mul r0, r1, r0
    ldr r2, _LIT1
    ldr r1, _LIT2
    str r0, [sp]
    ldr r0, [r1, r0]
    str sl, [r2]
    cmp r0, #0x0
    mov r6, #0x0
    bls .L_958
    ldr r1, _LIT3
    ldr r0, [sp]
    add r9, r1, r0
    ldr r0, _LIT4
    add r8, r9, #0x120
    rsb r0, r0, #0x2900
    str r0, [sp, #0x10]
    ldr r0, _LIT4
    add r0, r0, #0x550
    str r0, [sp, #0x18]
    ldr r0, _LIT4
    rsb r0, r0, #0x2900
    str r0, [sp, #0x14]
    ldr r0, _LIT4
    sub r0, r0, #0x2d
    str r0, [sp, #0xc]
    ldr r0, _LIT4
    sub r0, r0, #0x2e
    str r0, [sp, #0x8]
    ldr r0, _LIT4
    sub fp, r0, #0x2f
    mov r4, fp
    sub r5, r0, #0x2d
.L_830:
    ldr r0, [r8]
    mov r1, r0, lsl #0x13
    ldr r0, _LIT4
    mov r7, r1, lsr #0x13
    cmp r0, r1, lsr #0x13
    blt .L_87c
    cmp r7, r0
    bge .L_8a4
    cmp r7, r5
    bgt .L_944
    cmp r7, r4
    blt .L_944
    cmp r7, fp
    ldrne r0, [sp, #0x8]
    cmpne r7, r0
    ldrne r0, [sp, #0xc]
    cmpne r7, r0
    beq .L_8a4
    b .L_944
.L_87c:
    ldr r0, [sp, #0x10]
    cmp r7, r0
    bgt .L_898
    ldr r0, [sp, #0x14]
    cmp r7, r0
    beq .L_8a4
    b .L_944
.L_898:
    ldr r0, [sp, #0x18]
    cmp r7, r0
    bne .L_944
.L_8a4:
    ldr r3, [r8]
    mov r0, sl
    mov r1, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    add r1, r3, r1, lsr #0x1f
    ldr r3, _LIT5
    mov r2, #0x1
    ldrh r3, [r3, #0x16]
    mov r3, r3, lsl #0x1a
    mov r3, r3, lsr #0x1e
    bl func_ov002_0226eb5c
    str r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_944
    mov r2, #0x0
    mov r0, sl
    mov r1, r7
    mov r3, r2
    bl func_ov002_0227b960
    cmp r0, #0x0
    beq .L_90c
    ldr r1, [sp, #0x4]
    tst r1, #0x40
    moveq r0, #0x0
.L_90c:
    cmp r0, #0x0
    bne .L_920
    ldr r1, [sp, #0x4]
    tst r1, #0x10
    moveq r0, #0x1
.L_920:
    cmp r0, #0x0
    movne r3, #0x6
    moveq r3, #0x4
    mov r0, sl
    mov r2, r6
    mov r1, #0xb
    bl func_ov002_02259774
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_944:
    add r8, r8, #0x4
    add r6, r6, #0x1
    ldr r0, [r9, #0xc]
    cmp r6, r0
    bcc .L_830
.L_958:
    ldr r1, _LIT2
    ldr r0, [sp]
    mov r7, #0x0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    bls .L_a08
    ldr r1, _LIT3
    ldr r0, [sp]
    ldr r8, _LIT5
    add r6, r1, r0
    add r5, r6, #0x120
    mov r4, #0x1
.L_988:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202f9e8
    cmp r0, #0x0
    beq .L_9f4
    ldr r2, [r5]
    ldrh r0, [r8, #0x16]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r0, lsl #0x1a
    mov r9, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    mov r0, sl
    mov r2, r4
    add r1, r1, r9, lsr #0x1f
    mov r3, r3, lsr #0x1e
    bl func_ov002_0226eb5c
    tst r0, #0x40
    beq .L_9f4
    mov r0, sl
    mov r2, r7
    mov r1, #0xb
    mov r3, #0x6
    bl func_ov002_02259774
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9f4:
    ldr r0, [r6, #0xc]
    add r7, r7, #0x1
    cmp r7, r0
    add r5, r5, #0x4
    bcc .L_988
.L_a08:
    ldr r1, _LIT2
    ldr r0, [sp]
    mov r9, #0x0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    bls .L_af8
    ldr r1, _LIT3
    ldr r0, [sp]
    ldr r4, _LIT5
    add r8, r1, r0
    add r7, r8, #0x120
    mov fp, #0x1
.L_a38:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202b8a8
    cmp r0, #0x5
    blt .L_ae4
    ldr r2, [r7]
    ldrh r0, [r4, #0x16]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r0, lsl #0x1a
    mov r6, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    mov r0, sl
    mov r2, fp
    add r1, r1, r6, lsr #0x1f
    mov r3, r3, lsr #0x1e
    bl func_ov002_0226eb5c
    movs r6, r0
    beq .L_ae4
    mov r2, #0x0
    mov r0, sl
    mov r1, r5
    mov r3, r2
    bl func_ov002_0227b960
    cmp r0, #0x0
    beq .L_ab0
    tst r6, #0x40
    moveq r0, #0x0
.L_ab0:
    cmp r0, #0x0
    bne .L_ac0
    tst r6, #0x10
    moveq r0, #0x1
.L_ac0:
    cmp r0, #0x0
    movne r3, #0x6
    moveq r3, #0x4
    mov r0, sl
    mov r2, r9
    mov r1, #0xb
    bl func_ov002_02259774
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ae4:
    ldr r0, [r8, #0xc]
    add r9, r9, #0x1
    cmp r9, r0
    add r7, r7, #0x4
    bcc .L_a38
.L_af8:
    ldr r1, _LIT2
    ldr r0, [sp]
    mov r9, #0x0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    addls sp, sp, #0x1c
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT3
    ldr r0, [sp]
    ldr r4, _LIT5
    add r8, r1, r0
    add r7, r8, #0x120
    mov fp, #0x1
.L_b2c:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202e234
    cmp r0, #0x0
    beq .L_bd8
    ldr r2, [r7]
    ldrh r0, [r4, #0x16]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r0, lsl #0x1a
    mov r6, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    mov r0, sl
    mov r2, fp
    add r1, r1, r6, lsr #0x1f
    mov r3, r3, lsr #0x1e
    bl func_ov002_0226eb5c
    movs r6, r0
    beq .L_bd8
    mov r2, #0x0
    mov r0, sl
    mov r1, r5
    mov r3, r2
    bl func_ov002_0227b960
    cmp r0, #0x0
    beq .L_ba4
    tst r6, #0x40
    moveq r0, #0x0
.L_ba4:
    cmp r0, #0x0
    bne .L_bb4
    tst r6, #0x10
    moveq r0, #0x1
.L_bb4:
    cmp r0, #0x0
    movne r3, #0x6
    moveq r3, #0x4
    mov r0, sl
    mov r2, r9
    mov r1, #0xb
    bl func_ov002_02259774
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_bd8:
    ldr r0, [r8, #0xc]
    add r9, r9, #0x1
    cmp r9, r0
    add r7, r7, #0x4
    bcc .L_b2c
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cd524
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022cf16c
_LIT4: .word 0x000013b5
_LIT5: .word data_ov002_022cd300
