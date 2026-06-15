; func_ov002_0223be40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022cdc88
        .extern data_ov002_022ce288
        .extern data_ov002_022ce720
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202b8f0
        .extern func_02031684
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021b947c
        .extern func_ov002_021b9830
        .extern func_ov002_021b993c
        .extern func_ov002_021b9aa8
        .extern func_ov002_021b9b64
        .extern func_ov002_021b9ecc
        .extern func_ov002_021c848c
        .extern func_ov002_021c93f0
        .extern func_ov002_021c9504
        .extern func_ov002_021ca5bc
        .extern func_ov002_021d479c
        .extern func_ov002_021d7b44
        .extern func_ov002_021d7c1c
        .extern func_ov002_021d8184
        .extern func_ov002_021de134
        .extern func_ov002_021de8fc
        .extern func_ov002_0223b468
        .extern func_ov002_0223b584
        .extern func_ov002_0223b5cc
        .extern func_ov002_0223b6ec
        .extern func_ov002_0223ba28
        .extern func_ov002_0223ba60
        .extern func_ov002_0223bb28
        .extern func_ov002_0223bdb8
        .extern func_ov002_02254a2c
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_0227adb8
        .extern func_ov002_0229ade0
        .extern func_ov002_0229cf10
        .global func_ov002_0223be40
        .arm
func_ov002_0223be40:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x100
    mov r6, r0
    ldrh r4, [r6, #0x2]
    ldr r9, _LIT0
    mov r3, r4, lsl #0x11
    ldr r2, [r9, #0x5a8]
    mov r4, r4, lsl #0x1f
    mov r3, r3, lsr #0x1f
    cmp r2, #0x7c
    eor r4, r3, r4, lsr #0x1f
    bgt .L_438
    cmp r2, #0x7c
    bge .L_5c4
    cmp r2, #0x64
    bgt .L_c88
    cmp r2, #0x63
    blt .L_c88
    beq .L_bf4
    cmp r2, #0x64
    beq .L_7bc
    b .L_c88
.L_438:
    sub r2, r2, #0x7d
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_c88
    b .L_5b0
    b .L_4ac
    b .L_48c
    b .L_458
.L_458:
    bl func_ov002_0223bdb8
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [r6, #0x2]
    mov r1, #0x5b
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    add sp, sp, #0x100
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_48c:
    ldrh r2, [r6]
    mov r0, r4
    mov r1, #0x6
    mov r3, #0x0
    bl func_ov002_021af9d0
    add sp, sp, #0x100
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_4ac:
    bl func_ov002_021afb74
    ldr r1, [r0]
    mov r0, r9
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    str r1, [r0, #0x69c]
    bl func_ov002_021afb74
    mov r5, r0
    bl func_ov002_021afb74
    ldr r0, [r0]
    ldr r1, [r5]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    mov r0, r9
    add r1, r1, r2, lsr #0x1f
    str r1, [r0, #0x6a0]
    ldr r1, [r0, #0x69c]
    mov r0, r4
    bl func_ov002_0223bb28
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r9
    ldr r0, [r0, #0x69c]
    bl func_ov002_0223b468
    mov r1, r9
    str r0, [r1, #0x6a4]
    ldr r0, [r1, #0x69c]
    bl func_02031684
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, _LIT0
    movne r1, #0x0
    str r1, [r0, #0x6b0]
    mov r2, #0x0
    ldr r1, _LIT1
    str r2, [r0, #0x6ac]
    ldr r0, [r1, r4, lsl #0x2]
    cmp r0, #0x1
    addeq sp, sp, #0x100
    moveq r0, #0x64
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_ov002_0223b584
    ldr r1, _LIT0
    ldr r0, _LIT2
    ldr r2, [r1, #0x69c]
    cmp r2, r0
    bne .L_588
    mov r0, r4
    mov r1, #0x5c
    bl func_ov002_021ae400
    b .L_5a4
.L_588:
    ldr r2, [r1, #0x6a4]
    add r0, sp, #0x0
    mov r1, #0xc
    bl func_ov002_0229cf10
    add r1, sp, #0x0
    mov r0, r4
    bl func_ov002_021ae400
.L_5a4:
    add sp, sp, #0x100
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_5b0:
    ldr r0, _LIT3
    bl func_ov002_022592ec
    add sp, sp, #0x100
    mov r0, #0x7c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_5c4:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_764
    ldr r2, _LIT4
    ldr r1, [r2, #0xd74]
    cmp r1, #0x4
    bhi .L_5f4
    ldr r3, [r2, #0xd78]
    ldr r0, [r2, #0xd70]
    add r1, r1, r3
    bl func_ov002_021b9ecc
    b .L_600
.L_5f4:
    ldr r0, [r2, #0xd70]
    ldr r2, [r2, #0xd78]
    bl func_ov002_021c9504
.L_600:
    ldr r2, _LIT4
    mov r6, r0
    ldr r0, [r2, #0xd70]
    ldr r1, [r2, #0xd74]
    ldr r2, [r2, #0xd78]
    bl func_ov002_021c93f0
    ldr r2, _LIT4
    mov r5, r0
    ldr r0, [r2, #0xd70]
    ldr r1, [r2, #0xd74]
    ldr r2, [r2, #0xd78]
    bl func_ov002_021c93f0
    ldr r0, [r0]
    ldr r1, [r5]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r5, r0, r1, lsr #0x1f
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9aa8
    cmp r0, #0x0
    blt .L_670
    mov r0, r6
    mov r1, #0x1
    bl func_ov002_0223b5cc
    b .L_68c
.L_670:
    ldr r1, _LIT4
    mov r0, r4
    ldr r3, [r1, #0xd74]
    ldr r1, [r1, #0xd78]
    mov r2, #0x1
    add r1, r3, r1
    bl func_ov002_0223b6ec
.L_68c:
    ldr r1, _LIT0
    ldr r2, _LIT5
    ldr r6, [r1, #0x494]
    ldr r3, [r1, #0x6ac]
    mov r0, r5
    add r3, r6, r3
    mov r3, r3, lsl #0x19
    mov r3, r3, lsr #0x18
    strh r5, [r2, r3]
    ldr r6, [r1, #0x6ac]
    bl func_ov002_021b9b64
    ldr r3, [r0]
    ldr r7, _LIT6
    mov r0, r6, lsl #0x10
    mov r1, r0, lsr #0x10
    str r3, [r7, r6, lsl #0x2]
    ldr r2, _LIT4
    mov r3, r1, lsl #0x10
    mov r0, r5, lsl #0x10
    ldr r1, [r2, #0xd70]
    orr r3, r3, r0, lsr #0x10
    ldr r2, [r2, #0xd74]
    mov r0, #0x2b
    bl func_ov002_0229ade0
    ldr r1, _LIT0
    ldr r0, [r1, #0x6ac]
    add r2, r0, #0x1
    str r2, [r1, #0x6ac]
    ldr r0, [r1, #0x6a4]
    cmp r2, r0
    addcc sp, sp, #0x100
    movcc r0, #0x7d
    ldmccia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r2, [r1, #0x69c]
    ldr r0, _LIT2
    cmp r2, r0
    bne .L_74c
    mov r2, #0x7
    mov r0, r4
    str r2, [r1, #0x6b8]
    bl func_ov002_0223ba60
    cmp r0, #0x0
    addne sp, sp, #0x100
    movne r0, #0x7d
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x6ac]
    str r1, [r0, #0x6a4]
.L_74c:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x6ac]
    add sp, sp, #0x100
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_764:
    mov r1, r9
    ldr r0, _LIT2
    ldr r2, [r1, #0x69c]
    cmp r2, r0
    bne .L_79c
    ldr r0, [r1, #0x6ac]
    cmp r0, #0x2
    bcc .L_79c
    str r0, [r1, #0x6a4]
    mov r0, #0x0
    str r0, [r1, #0x6ac]
    add sp, sp, #0x100
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_79c:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x2c
    bl func_ov002_0229ade0
    add sp, sp, #0x100
    mov r0, #0x80
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_7bc:
    ldr r0, [r9, #0x6ac]
    cmp r0, #0x0
    bne .L_97c
    ldr r0, [r9, #0x6a4]
    mov r5, #0x0
    mov sl, r5
    cmp r0, #0x0
    ble .L_85c
    mov r7, r5
    mov r8, #0x8000
.L_7e4:
    ldr r0, [r9, #0x494]
    add r0, r0, sl
    mov r0, r0, lsl #0x19
    add r0, r9, r0, lsr #0x18
    add r0, r0, #0x400
    ldrh r0, [r0, #0x98]
    bl func_ov002_021b947c
    ldr r2, [r9, #0x494]
    cmp r4, #0x0
    add r2, r2, sl
    mov r2, r2, lsl #0x19
    movne r1, r8
    add r2, r9, r2, lsr #0x18
    add r3, r2, #0x400
    moveq r1, r7
    mov r0, r0, lsl #0x10
    orr r2, r1, #0x4b
    mov r1, r0, lsr #0x10
    mov r0, r2, lsl #0x10
    mov r1, r1, asr #0x8
    mov r2, sl, lsl #0x10
    ldrh r3, [r3, #0x98]
    mov r0, r0, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_ov002_021d479c
    ldr r0, [r9, #0x6a4]
    add sl, sl, #0x1
    cmp sl, r0
    blt .L_7e4
.L_85c:
    ldr r1, _LIT0
    mov r3, #0x0
    ldr r2, _LIT7
    str r3, [r1, #0x6a8]
.L_86c:
    add r0, r1, r3, lsl #0x2
    add r3, r3, #0x1
    str r2, [r0, #0x6b4]
    cmp r3, #0x5
    blt .L_86c
    ldr r9, _LIT0
    mov sl, #0x0
    ldr r0, [r9, #0x6a4]
    cmp r0, #0x0
    ble .L_910
    ldr r7, _LIT8
    mov r8, #0x1
.L_89c:
    ldr r0, [r9, #0x494]
    add r0, r0, sl
    mov r0, r0, lsl #0x19
    add r0, r9, r0, lsr #0x18
    add r0, r0, #0x400
    ldrh r0, [r0, #0x98]
    bl func_ov002_021b9830
    cmp r0, #0x0
    blt .L_900
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r1, r0, #0xff
    add r0, r9, r1, lsl #0x2
    str sl, [r0, #0x6b4]
    ldr r0, [r9, #0x69c]
    add r2, r1, r4, lsl #0x4
    cmp r0, r7
    orr r5, r5, r8, lsl r2
    bne .L_900
    mov r0, r4
    bl func_ov002_021c848c
    ldr r1, [r9, #0x6a8]
    add r0, r1, r0
    str r0, [r9, #0x6a8]
.L_900:
    ldr r0, [r9, #0x6a4]
    add sl, sl, #0x1
    cmp sl, r0
    blt .L_89c
.L_910:
    ldrh r2, [r6]
    ldr r1, _LIT9
    cmp r2, r1
    bgt .L_948
    sub r0, r1, #0x1
    cmp r2, r0
    blt .L_938
    cmpne r2, r1
    beq .L_954
    b .L_968
.L_938:
    ldr r0, _LIT10
    cmp r2, r0
    beq .L_954
    b .L_968
.L_948:
    ldr r0, _LIT11
    cmp r2, r0
    bne .L_968
.L_954:
    mov r0, r6
    mov r1, r5
    mov r2, #0x20
    bl func_ov002_021de8fc
    b .L_97c
.L_968:
    mov r0, r6
    mov r1, r5
    mov r2, #0xe
    mov r3, #0x20
    bl func_ov002_021de134
.L_97c:
    ldr r8, _LIT0
    ldr r1, [r8, #0x6ac]
    ldr r0, [r8, #0x6a4]
    cmp r1, r0
    bcs .L_be8
    mov r5, #0x0
    mov r7, r5
.L_998:
    ldr r0, _LIT0
    ldr r0, [r0, #0x494]
    add r0, r0, r1
    mov r0, r0, lsl #0x19
    add r0, r8, r0, lsr #0x18
    add r0, r0, #0x400
    ldrh r9, [r0, #0x98]
    mov r0, r9
    bl func_ov002_021b947c
    ldr r1, _LIT0
    mov r3, r7
    ldr r1, [r1, #0x6ac]
.L_9c8:
    add r2, r8, r3, lsl #0x2
    ldr r2, [r2, #0x6b4]
    add r3, r3, #0x1
    cmp r1, r2
    moveq r0, r5
    cmp r3, #0x5
    blt .L_9c8
    mov r2, r0, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, asr #0x8
    and r2, r2, #0xff
    cmp r2, #0xb
    bne .L_b0c
    mov r0, r0, lsr #0x10
    mov r1, r0, lsl #0x10
    mov r0, r9
    mov r5, r1, lsr #0x10
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    movne r7, #0x20
    moveq r7, #0x10
    cmp r4, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    mov r3, r9, lsl #0x10
    ldr r0, _LIT0
    orr r2, r1, #0x4c
    ldr r1, [r0, #0x6ac]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r1, #0xb
    bl func_ov002_021d479c
    mov r0, r4
    bl func_ov002_02254a2c
    ldrh r1, [r6]
    ldr r0, _LIT10
    cmp r1, r0
    ldr r0, _LIT12
    bne .L_a98
    ldr r2, _LIT13
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    add r0, r0, #0x120
    add r5, r0, r5, lsl #0x2
    mov r0, r4
    mov r1, r5
    mov r2, r7
    bl func_ov002_021d7b44
    b .L_abc
.L_a98:
    ldr r2, _LIT13
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    add r0, r0, #0x120
    add r5, r0, r5, lsl #0x2
    mov r0, r4
    mov r1, r5
    mov r2, r7
    bl func_ov002_021d7c1c
.L_abc:
    ldr r1, _LIT0
    ldr r0, _LIT8
    ldr r1, [r1, #0x69c]
    cmp r1, r0
    bne .L_af0
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8f0
    ldr r1, _LIT0
    ldr r2, [r1, #0x6a8]
    add r0, r2, r0
    str r0, [r1, #0x6a8]
.L_af0:
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x6ac]
    mov r0, #0x64
    add r2, r2, #0x1
    str r2, [r1, #0x6ac]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_b0c:
    cmp r2, #0xe
    bne .L_bcc
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    cmp r4, #0x0
    mov r5, r0, lsr #0x10
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x4c
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r3, r9, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r1, #0xe
    bl func_ov002_021d479c
    ldr r2, _LIT13
    ldr r0, _LIT12
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    add r0, r0, #0x18
    add r0, r0, #0x400
    add r5, r0, r5, lsl #0x2
    mov r0, r4
    mov r1, r5
    mov r2, #0x10
    bl func_ov002_021d8184
    ldr r1, _LIT0
    ldr r0, _LIT8
    ldr r1, [r1, #0x69c]
    cmp r1, r0
    bne .L_bb0
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8f0
    ldr r1, _LIT0
    ldr r2, [r1, #0x6a8]
    add r0, r2, r0
    str r0, [r1, #0x6a8]
.L_bb0:
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x6ac]
    mov r0, #0x64
    add r2, r2, #0x1
    str r2, [r1, #0x6ac]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_bcc:
    ldr r0, _LIT0
    ldr r1, [r0, #0x6ac]
    add r1, r1, #0x1
    str r1, [r0, #0x6ac]
    ldr r0, [r0, #0x6a4]
    cmp r1, r0
    bcc .L_998
.L_be8:
    add sp, sp, #0x100
    mov r0, #0x63
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_bf4:
    ldr r0, _LIT0
    cmp r4, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    orr r5, r1, #0x4d
    ldr r1, [r0, #0x69c]
    ldr r2, [r0, #0x6a0]
    ldr r3, [r0, #0x6a4]
    mov r0, r5, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d479c
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1, #0x6a0]
    bl func_ov002_021b993c
    ldrh r1, [r6]
    mov r5, r0
    ldr r3, _LIT13
    mov r2, r1, lsl #0x10
    ldr r0, _LIT12
    and r1, r4, #0x1
    mla r0, r1, r0, r3
    add r1, r0, #0x3a0
    orr r3, r2, #0x1
    mov r0, r4
    add r1, r1, r5, lsl #0x2
    mov r2, #0x1
    bl func_ov002_0227adb8
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_c88:
    mov r0, #0x0
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word 0x00001a4e
_LIT3: .word func_ov002_0223ba28
_LIT4: .word data_ov002_022d016c
_LIT5: .word data_ov002_022ce720
_LIT6: .word data_ov002_022cdc88
_LIT7: .word 0x0000ffff
_LIT8: .word 0x000018fb
_LIT9: .word 0x00001921
_LIT10: .word 0x0000149c
_LIT11: .word 0x00001a7f
_LIT12: .word 0x00000868
_LIT13: .word data_ov002_022cf16c
