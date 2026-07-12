; func_ov002_02213a38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_0202b824
        .extern func_ov002_021d6624
        .extern func_ov002_021de3c0
        .extern func_ov002_021df618
        .extern func_ov002_021e2a2c
        .extern func_ov002_0223de48
        .global func_ov002_02213a38
        .arm
func_ov002_02213a38:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0x4]
    mov r9, r1
    mov r1, r0, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r9, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r1, [r9, #0x2]
    ldrh r2, [sl, #0x2]
    mov r1, r1, lsl #0x1f
    mov r3, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    cmp r1, r3, lsr #0x1f
    mov r1, r3, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r3, r2, lsl #0x1a
    and r4, r1, #0x1
    ldr r2, _LIT0
    ldr r1, _LIT1
    mla r5, r4, r2, r1
    mov r2, r3, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    add r2, r5, #0x30
    ldr r1, [r2, r1]
    mov r2, r0, lsl #0x11
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r2, r2, lsr #0x17
    add r0, r0, r1, lsr #0x1f
    cmp r2, r0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [r9]
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_128
    sub r1, r2, #0x6
    cmp r0, r1
    blt .L_d0
    subne r1, r2, #0x5
    cmpne r0, r1
    cmpne r0, r2
    beq .L_374
    b .L_450
.L_d0:
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_104
    bge .L_29c
    ldr r1, _LIT4
    cmp r0, r1
    bgt .L_f4
    beq .L_18c
    b .L_450
.L_f4:
    add r1, r1, #0x8c
    cmp r0, r1
    beq .L_18c
    b .L_450
.L_104:
    add r1, r2, #0x56
    cmp r0, r1
    bgt .L_118
    beq .L_374
    b .L_450
.L_118:
    add r1, r2, #0xf6
    cmp r0, r1
    beq .L_18c
    b .L_450
.L_128:
    add r1, r2, #0x2c
    cmp r0, r1
    bgt .L_15c
    bge .L_18c
    add r1, r2, #0xc
    cmp r0, r1
    bgt .L_14c
    beq .L_18c
    b .L_450
.L_14c:
    add r1, r2, #0x2b
    cmp r0, r1
    beq .L_18c
    b .L_450
.L_15c:
    ldr r1, _LIT5
    cmp r0, r1
    bgt .L_17c
    bge .L_18c
    add r1, r2, #0x43
    cmp r0, r1
    beq .L_18c
    b .L_450
.L_17c:
    ldr r1, _LIT0
    add r1, r1, #0xe50
    cmp r0, r1
    bne .L_450
.L_18c:
    add r2, sp, #0x0
    mov r0, r9
    mov r1, #0x0
    bl func_ov002_0223de48
    ldr r0, [sp]
    ldr r1, _LIT0
    and r4, r0, #0xff
    and r2, r4, #0x1
    mul r8, r2, r1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    mov r0, #0x14
    ldr r1, _LIT1
    smulbb r7, r5, r0
    add r0, r1, r8
    add r0, r0, r7
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r0, r0, lsl #0x10
    movs r6, r0, lsr #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [sl, #0x2]
    mov r1, r0, lsl #0x1f
    cmp r4, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    cmpeq r5, r0, lsr #0x1b
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r6
    bl func_0202b824
    cmp r0, #0x17
    bne .L_288
    ldr r0, _LIT6
    add r0, r0, r8
    ldrh r0, [r7, r0]
    cmp r0, #0x0
    bne .L_26c
    mov r0, r4
    mov r1, r5
    mov r2, #0x1
    bl func_ov002_021d6624
    ldrh r0, [sl, #0x2]
    mov r1, r6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021df618
    mov r0, #0x1e
    bl func_ov002_021e2a2c
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_021d6624
.L_26c:
    ldrh r1, [sl, #0x2]
    mov r0, sl
    mov r3, r1, lsl #0x1f
    mov r2, r1, lsl #0x1a
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021de3c0
.L_288:
    ldrh r1, [r9, #0x4]
    mov r0, #0x0
    orr r1, r1, #0x10
    strh r1, [r9, #0x4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_29c:
    mov r4, #0x0
.L_2a0:
    mov r0, r9
    mov r1, r4
    add r2, sp, #0x0
    bl func_ov002_0223de48
    ldr r1, [sp]
    mov r0, r1, lsl #0x10
    and r7, r1, #0xff
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r8, r0, #0xff
    mov r0, #0x14
    smulbb r5, r8, r0
    ldr r1, _LIT0
    ldr r0, _LIT1
    and r2, r7, #0x1
    mla fp, r2, r1, r0
    add r0, fp, r5
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r0, r0, lsl #0x10
    movs r6, r0, lsr #0x10
    beq .L_354
    mov r0, r6
    bl func_0202b824
    cmp r0, #0x17
    addeq r0, fp, r5
    ldreqh r0, [r0, #0x38]
    cmpeq r0, #0x0
    bne .L_354
    mov r0, r7
    mov r1, r8
    mov r2, #0x1
    bl func_ov002_021d6624
    ldrh r0, [sl, #0x2]
    mov r1, r6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021df618
    mov r0, #0x1e
    bl func_ov002_021e2a2c
    mov r0, r7
    mov r1, r8
    mov r2, #0x0
    bl func_ov002_021d6624
.L_354:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_2a0
    ldrh r1, [r9, #0x4]
    mov r0, #0x0
    orr r1, r1, #0x10
    strh r1, [r9, #0x4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_374:
    ldr r5, _LIT1
    ldr r4, _LIT0
    mov r8, #0x5
    mov r6, #0x64
    mov fp, #0x1
.L_388:
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mla r0, r1, r4, r5
    add r0, r0, r6
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r0, r0, lsl #0x10
    movs r7, r0, lsr #0x10
    beq .L_42c
    mov r0, r7
    bl func_0202b824
    cmp r0, #0x17
    bne .L_42c
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r4, r5
    add r1, r6, r1
    ldrh r1, [r1, #0x38]
    cmp r1, #0x0
    bne .L_42c
    mov r1, r8
    mov r2, fp
    bl func_ov002_021d6624
    ldrh r0, [sl, #0x2]
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021df618
    mov r0, #0x1e
    bl func_ov002_021e2a2c
    ldrh r0, [sl, #0x2]
    mov r1, r8
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d6624
.L_42c:
    add r8, r8, #0x1
    cmp r8, #0xa
    add r6, r6, #0x14
    ble .L_388
    ldrh r1, [r9, #0x4]
    mov r0, #0x0
    orr r1, r1, #0x10
    strh r1, [r9, #0x4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_450:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00001321
_LIT3: .word 0x000011f0
_LIT4: .word 0x00000ffa
_LIT5: .word 0x0000149b
_LIT6: .word data_ov002_022cf0c4
