; func_ov002_02247a84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cabc0
        .extern data_ov002_022cd65c
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce640
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_0202e2a4
        .extern func_ov002_021ae320
        .extern func_ov002_021ae6ac
        .extern func_ov002_021b0b24
        .extern func_ov002_021b939c
        .extern func_ov002_021baf88
        .extern func_ov002_021c37e4
        .extern func_ov002_021c3a80
        .extern func_ov002_021c8400
        .extern func_ov002_021d7974
        .extern func_ov002_021deb20
        .extern func_ov002_021e277c
        .extern func_ov002_02247600
        .extern func_ov002_022476b8
        .extern func_ov002_022479f0
        .extern func_ov002_0225923c
        .extern func_ov002_0225930c
        .extern func_ov002_0227acc8
        .extern func_ov002_022903f0
        .extern func_ov002_0229acd0
        .global func_ov002_02247a84
        .arm
func_ov002_02247a84:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r0
    ldrh r1, [r5, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r7, _LIT0
    ldr r1, [r7, #0x5a8]
    cmp r1, #0x7c
    bgt .L_58
    bge .L_340
    cmp r1, #0x64
    bgt .L_71c
    cmp r1, #0x62
    blt .L_71c
    beq .L_6c0
    cmp r1, #0x63
    beq .L_63c
    cmp r1, #0x64
    beq .L_5a0
    b .L_71c
.L_58:
    cmp r1, #0x7d
    bgt .L_68
    beq .L_304
    b .L_71c
.L_68:
    cmp r1, #0x80
    bgt .L_71c
    cmp r1, #0x7e
    blt .L_71c
    beq .L_2b0
    cmp r1, #0x7f
    beq .L_220
    cmp r1, #0x80
    bne .L_71c
    mov r1, #0x0
    str r1, [r7, #0x5ac]
    strh r1, [r5, #0xc]
    bl func_ov002_022479f0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r0, [r5]
    ldr r1, _LIT1
    cmp r0, r1
    addne r1, r1, #0x7e
    cmpne r0, r1
    ldrne r1, _LIT2
    cmpne r0, r1
    bne .L_1d4
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_1bc
    ldr r7, _LIT4
    and r1, r0, #0x1
    mul r2, r1, r7
    ldr r1, _LIT5
    mov r6, #0x0
    ldr r1, [r1, r2]
    cmp r1, #0x0
    bls .L_1cc
    ldr r8, _LIT6
    mov r4, #0xb
.L_10c:
    mov r1, r4
    mov r2, r6
    bl func_ov002_02247600
    cmp r0, #0x0
    beq .L_194
    ldrh r2, [r5, #0x2]
    ldr r1, _LIT7
    ldr r0, _LIT4
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldr r2, _LIT6
    and r3, r3, #0x1
    mla r0, r3, r0, r2
    add r0, r0, r6, lsl #0x2
    ldr r2, [r0, #0x120]
    ldr r0, [r1]
    mov r1, r2, lsl #0x13
    mov r0, r0, lsl #0x13
    mov r3, r1, lsr #0x13
    movs r0, r0, lsr #0x13
    mov r1, #0x0
    beq .L_18c
    ldr r2, _LIT8
.L_168:
    ldr r0, [r2]
    mov r0, r0, lsl #0x13
    cmp r3, r0, lsr #0x13
    streqh r1, [r5, #0x8]
    ldr r0, [r2, #0x4]!
    add r1, r1, #0x1
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    bne .L_168
.L_18c:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_194:
    ldrh r0, [r5, #0x2]
    add r6, r6, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r7, r8
    ldr r1, [r1, #0xc]
    cmp r6, r1
    bcc .L_10c
    b .L_1cc
.L_1bc:
    ldr r1, _LIT9
    bl func_ov002_021ae320
    ldr r0, _LIT10
    bl func_ov002_0225923c
.L_1cc:
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1d4:
    ldr r1, _LIT7
    mov r3, #0x0
    ldr r1, [r1]
    mov r1, r1, lsl #0x6
    movs r1, r1, lsr #0x13
    beq .L_218
    ldr r2, _LIT8
.L_1f0:
    ldr r1, [r2]
    mov r1, r1, lsl #0x6
    cmp r0, r1, lsr #0x13
    streqh r3, [r5, #0x8]
    beq .L_218
    ldr r1, [r2, #0x4]!
    add r3, r3, #0x1
    mov r1, r1, lsl #0x6
    movs r1, r1, lsr #0x13
    bne .L_1f0
.L_218:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_220:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_2a8
    ldrh r0, [r5, #0x2]
    ldr r2, _LIT11
    ldr r1, _LIT7
    mov r0, r0, lsl #0x1f
    mov r4, r0, lsr #0x1f
    ldr r0, _LIT4
    ldr r3, _LIT6
    and r4, r4, #0x1
    mla r3, r4, r0, r3
    ldr r2, [r2, #0xd78]
    ldr r0, [r1]
    add r1, r3, r2, lsl #0x2
    ldr r1, [r1, #0x120]
    mov r0, r0, lsl #0x13
    mov r1, r1, lsl #0x13
    mov r2, r1, lsr #0x13
    movs r0, r0, lsr #0x13
    mov r3, #0x0
    beq .L_2a0
    ldr r1, _LIT8
.L_27c:
    ldr r0, [r1]
    mov r0, r0, lsl #0x13
    cmp r2, r0, lsr #0x13
    streqh r3, [r5, #0x8]
    ldr r0, [r1, #0x4]!
    add r3, r3, #0x1
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    bne .L_27c
.L_2a0:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2a8:
    mov r0, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2b0:
    ldrh r2, [r5, #0x8]
    ldr r0, _LIT8
    mov r1, #0xff
    ldr r2, [r0, r2, lsl #0x2]
    mov r0, #0x0
    mov r2, r2, lsr #0x1a
    str r2, [r7, #0x5ac]
    str r1, [r7, #0x5b0]
    strh r0, [r5, #0xa]
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT3
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x0
    bne .L_2fc
    ldr r1, [r7, #0x5ac]
    mov r0, #0xcf
    bl func_ov002_021ae6ac
.L_2fc:
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_304:
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_330
    ldrh r1, [r5]
    ldr r2, _LIT12
    bl func_ov002_022903f0
    b .L_338
.L_330:
    ldr r0, _LIT12
    bl func_ov002_0225923c
.L_338:
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_340:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_55c
    ldr r2, _LIT11
    ldr r1, [r2, #0xd74]
    cmp r1, #0xb
    bne .L_444
    ldrh r0, [r5, #0x2]
    ldr r4, _LIT6
    ldr r1, _LIT4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mla r1, r3, r1, r4
    ldr r7, [r2, #0xd78]
    add r1, r1, #0x120
    ldr r3, [r1, r7, lsl #0x2]
    ldr r8, [r2, #0xd70]
    mov r1, r3, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021c37e4
    mov r3, r4
    ldr r1, _LIT4
    and r2, r8, #0x1
    mla r1, r2, r1, r3
    add r6, r1, #0x120
    ldr r1, [r6, r7, lsl #0x2]
    mov r4, r0
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r3, r0, r2, lsr #0x1f
    mov r1, r8
    mov r0, #0x28
    mov r2, #0xb
    bl func_ov002_0229acd0
    ldr r3, [r6, r7, lsl #0x2]
    ldr r0, _LIT0
    mov r1, r3, lsl #0x2
    mov r2, r1, lsr #0x18
    ldrh r1, [r5, #0xa]
    ldr r0, [r0, #0x494]
    mov r3, r3, lsl #0x12
    add r0, r0, r1
    mov r1, r0, lsl #0x19
    mov r2, r2, lsl #0x1
    ldr r0, _LIT13
    add r2, r2, r3, lsr #0x1f
    mov r1, r1, lsr #0x18
    strh r2, [r0, r1]
    ldrh r0, [r5, #0xa]
    mov r1, #0x1
    add r0, r0, #0x1
    strh r0, [r5, #0xa]
    ldr r0, [r6, r7, lsl #0x2]
    ldrh r2, [r5, #0xc]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    orr r0, r2, r1, lsl r0
    strh r0, [r5, #0xc]
    b .L_51c
.L_444:
    ldr r0, [r2, #0xd78]
    ldr r8, [r2, #0xd70]
    add r9, r1, r0
    mov r0, r8
    mov r1, r9
    bl func_ov002_021c8400
    mov r2, #0x14
    ldr r4, _LIT6
    ldr r1, _LIT4
    and r3, r8, #0x1
    mla r1, r3, r1, r4
    mov r4, r0
    mul r6, r9, r2
    add r7, r1, #0x30
    ldr r2, [r7, r6]
    mov r1, r8
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r2, r9
    add r3, r0, r3, lsr #0x1f
    mov r0, #0x28
    bl func_ov002_0229acd0
    ldr r3, [r7, r6]
    ldr r0, _LIT0
    mov r1, r3, lsl #0x2
    mov r2, r1, lsr #0x18
    ldrh r1, [r5, #0xa]
    ldr r0, [r0, #0x494]
    mov r3, r3, lsl #0x12
    add r0, r0, r1
    mov r2, r2, lsl #0x1
    mov r1, r0, lsl #0x19
    ldr r0, _LIT13
    add r2, r2, r3, lsr #0x1f
    mov r1, r1, lsr #0x18
    strh r2, [r0, r1]
    ldrh r0, [r5, #0xa]
    add r0, r0, #0x1
    strh r0, [r5, #0xa]
    ldr r0, [r7, r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_51c
    ldr r0, [r7, r6]
    ldrh r2, [r5, #0xc]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r1, #0x1
    orr r0, r2, r1, lsl r0
    strh r0, [r5, #0xc]
.L_51c:
    ldr r0, _LIT0
    ldr r0, [r0, #0x5ac]
    subs r1, r0, r4
    ldr r0, _LIT0
    movmi r1, #0x0
    str r1, [r0, #0x5ac]
    ldr r0, [r0, #0x5b0]
    cmp r4, r0
    movge r4, r0
    ldr r0, _LIT0
    str r4, [r0, #0x5b0]
    ldr r0, [r0, #0x5ac]
    cmp r0, #0x0
    moveq r0, #0x64
    movne r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_55c:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x29
    bl func_ov002_0229acd0
    ldrh r2, [r5, #0x8]
    ldr r1, _LIT8
    mov r0, r7
    ldr r2, [r1, r2, lsl #0x2]
    mov r1, #0xff
    mov r2, r2, lsr #0x1a
    str r2, [r0, #0x5ac]
    str r1, [r0, #0x5b0]
    mov r0, #0x0
    strh r0, [r5, #0xa]
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_5a0:
    ldrh r0, [r5, #0xa]
    mov r8, #0x0
    mov r9, r8
    cmp r0, #0x0
    ble .L_628
    mov r4, #0x1
    mov r6, r4
.L_5bc:
    ldr r0, [r7, #0x494]
    add r0, r0, r9
    mov r0, r0, lsl #0x19
    add r0, r7, r0, lsr #0x18
    add r0, r0, #0x400
    ldrh r0, [r0, #0x98]
    bl func_ov002_021b939c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0xa
    bhi .L_600
    and r0, r0, #0xff
    add r0, r1, r0, lsl #0x4
    orr r8, r8, r6, lsl r0
    b .L_618
.L_600:
    mov r1, r0, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r2, r4
    and r0, r0, #0xff
    mov r1, r1, lsr #0x10
    bl func_ov002_021d7974
.L_618:
    ldrh r0, [r5, #0xa]
    add r9, r9, #0x1
    cmp r9, r0
    blt .L_5bc
.L_628:
    mov r0, r5
    mov r1, r8
    bl func_ov002_021deb20
    mov r0, #0x63
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_63c:
    ldrh r1, [r5, #0x8]
    ldr r0, _LIT8
    ldrh r2, [r5, #0x2]
    ldr r0, [r0, r1, lsl #0x2]
    mov r2, r2, lsl #0x1f
    mov r1, r0, lsl #0x13
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x13
    bl func_ov002_021c3a80
    ldrh r1, [r5, #0x2]
    mov r4, r0
    ldr r3, _LIT6
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT4
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x120
    mov r2, #0x1
    mov r3, r2
    add r1, r1, r4, lsl #0x2
    bl func_ov002_0227acc8
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT14
    ldr r0, [r0, #0x4]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    bne .L_6b8
    mov r0, #0x24
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_6b8:
    mov r0, #0x62
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_6c0:
    ldr r0, _LIT15
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_714
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5, #0xc]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    tst r2, r1, lsl r0
    beq .L_6f0
    bl func_ov002_021e277c
.L_6f0:
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5, #0xc]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    tst r2, r1, lsl r0
    beq .L_714
    bl func_ov002_021e277c
.L_714:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_71c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00001698
_LIT2: .word 0x000019d9
_LIT3: .word data_ov002_022cd664
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf098
_LIT6: .word data_ov002_022cf08c
_LIT7: .word data_ov002_022cabc0
_LIT8: .word data_ov002_022cabc0
_LIT9: .word 0x0000011e
_LIT10: .word func_ov002_02247600
_LIT11: .word data_ov002_022d008c
_LIT12: .word func_ov002_022476b8
_LIT13: .word data_ov002_022ce640
_LIT14: .word data_ov002_022cd65c
_LIT15: .word 0x000019da
