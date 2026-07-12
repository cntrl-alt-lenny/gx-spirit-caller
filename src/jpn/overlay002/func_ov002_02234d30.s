; func_ov002_02234d30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdba8
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf0c4
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_0202b95c
        .extern func_0202e1e0
        .extern func_02030538
        .extern func_020307b4
        .extern func_ov002_021b939c
        .extern func_ov002_021b9dec
        .extern func_ov002_021bbcc8
        .extern func_ov002_021bc538
        .extern func_ov002_021ca1d8
        .extern func_ov002_021d7b2c
        .extern func_ov002_021d864c
        .extern func_ov002_021e15b4
        .extern func_ov002_021e26d0
        .extern func_ov002_021e277c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_022535a4
        .extern func_ov002_0226af44
        .extern func_ov002_0226af64
        .extern func_ov002_0226afc0
        .extern func_ov002_0226c618
        .extern func_ov002_0227ab74
        .global func_ov002_02234d30
        .arm
func_ov002_02234d30:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r1, _LIT0
    ldrh r0, [r6, #0x2]
    ldr r2, [r1, #0x5a8]
    ldr r5, [r1, #0x5ac]
    mov r3, r0, lsl #0x1f
    cmp r2, #0x64
    mov r0, r3, lsr #0x1f
    eor r4, r5, r3, lsr #0x1f
    bgt .L_204
    cmp r2, #0x64
    beq .L_608
    b .L_628
.L_204:
    sub r2, r2, #0x75
    cmp r2, #0xb
    addls pc, pc, r2, lsl #0x2
    b .L_628
    b .L_5f8
    b .L_5e4
    b .L_5d4
    b .L_588
    b .L_628
    b .L_4f0
    b .L_628
    b .L_498
    b .L_414
    b .L_340
    b .L_304
    b .L_244
.L_244:
    mov r0, #0x0
    strh r0, [r6, #0xc]
    strh r0, [r6, #0xe]
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    beq .L_2fc
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bc538
    cmp r0, #0x0
    beq .L_2fc
    ldrh r1, [r6, #0x2]
    mov r4, #0x0
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    str r1, [r0, #0xd94]
    mov r5, r4
.L_2a8:
    ldrh r0, [r6, #0x2]
    mov r1, r4
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226c618
    cmp r0, #0x0
    beq .L_2f0
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226af44
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2f0:
    add r4, r4, #0x1
    cmp r4, #0x4
    ble .L_2a8
.L_2fc:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_304:
    ldr r0, _LIT2
    ldrh r0, [r0, #0xb0]
    mov r1, r0, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021d864c
    ldr r0, _LIT2
    ldrh r0, [r0, #0xb0]
    mov r1, r0, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021b9dec
    strh r0, [r6, #0xe]
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_340:
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    beq .L_3fc
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    beq .L_3fc
    mov r1, #0x0
    mov r0, r6
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_3fc
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r4, r0, #0xff
    and r5, r1, #0xff
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9dec
    mov r2, #0x14
    ldr r1, _LIT3
    ldr r3, _LIT4
    and ip, r4, #0x1
    mla r1, ip, r1, r3
    smulbb r2, r5, r2
    ldrh r1, [r2, r1]
    mov r7, r0
    cmp r1, #0x0
    beq .L_3fc
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_3fc
    mov r0, r7
    bl func_020307b4
    cmp r0, #0x0
    beq .L_3fc
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9dec
    strh r0, [r6, #0xc]
.L_3fc:
    bl func_ov002_021e2a4c
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_414:
    add r0, r6, r5, lsl #0x1
    ldrh r2, [r0, #0xc]
    cmp r2, #0x0
    strh r2, [r6, #0xa]
    moveq r0, #0x64
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r1, [r6]
    mov r0, r4
    bl func_ov002_022535a4
    ldr r1, _LIT0
    strh r0, [r6, #0x10]
    mov r2, #0x0
    str r2, [r1, #0x5b0]
    ldrh r0, [r6, #0x10]
    cmp r0, #0x0
    bne .L_468
    ldrh r1, [r6]
    mov r0, r4
    bl func_ov002_0226afc0
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_468:
    mov r0, r4
    bl func_ov002_021bc538
    ldrh r1, [r6, #0x10]
    cmp r0, r1
    movge r0, #0x7c
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r1, [r6]
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_0226afc0
    mov r0, #0x7a
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_498:
    ldrh r2, [r6, #0x10]
    ldr r3, [r1, #0x5b0]
    cmp r3, r2
    bge .L_4e8
    ldr r1, _LIT5
    cmp r4, r0
    add r1, r1, r3, lsl #0x2
    movne r3, #0x2
    mov r5, #0x0
    moveq r3, #0x0
    mov r0, r4
    mov r2, #0x1
    str r5, [sp]
    bl func_ov002_0227ab74
    ldr r1, _LIT0
    mov r0, #0x7c
    ldr r2, [r1, #0x5b0]
    add r2, r2, #0x1
    str r2, [r1, #0x5b0]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_4e8:
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_4f0:
    ldrh r2, [r6, #0x10]
    ldr r3, [r1, #0x5b0]
    cmp r3, r2
    bge .L_564
    ldr r0, _LIT5
    ldr r1, [r0, r3, lsl #0x2]
    add r5, r0, r3, lsl #0x2
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bl func_ov002_021b939c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xb
    bne .L_54c
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_021d7b2c
.L_54c:
    ldr r1, _LIT0
    mov r0, #0x7a
    ldr r2, [r1, #0x5b0]
    add r2, r2, #0x1
    str r2, [r1, #0x5b0]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_564:
    ldrh r1, [r6, #0xa]
    cmp r4, r0
    movne r3, #0x1
    moveq r3, #0x0
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_021e15b4
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_588:
    ldrh r1, [r6, #0xa]
    mov r0, r4
    bl func_ov002_021bbcc8
    mov r5, r0
    ldrh r0, [r6, #0xa]
    bl func_0202b95c
    cmp r5, r0
    movge r0, #0x75
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r6, #0xa]
    bl func_02030538
    cmp r0, #0x0
    movne r0, #0x75
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x77
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_5d4:
    rsb r0, r4, #0x1
    bl func_ov002_0226af64
    mov r0, #0x76
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_5e4:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_021e26d0
    mov r0, #0x75
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_5f8:
    mov r0, r4
    bl func_ov002_021e277c
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_608:
    add r0, r5, #0x1
    str r0, [r1, #0x5ac]
    cmp r0, #0x2
    movlt r0, #0x7d
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_628:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022d0d8c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf0c4
_LIT5: .word data_ov002_022cdba8
