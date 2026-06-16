; func_ov002_0225b338 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd524
        .extern data_ov002_022cd744
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021ae484
        .extern func_ov002_021b30ac
        .extern func_ov002_021b359c
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b9ecc
        .extern func_ov002_021baca8
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb91c
        .extern func_ov002_021bf294
        .extern func_ov002_021bff00
        .extern func_ov002_021c031c
        .extern func_ov002_021c034c
        .extern func_ov002_021c1d28
        .extern func_ov002_021d479c
        .extern func_ov002_021d5b80
        .extern func_ov002_021df62c
        .extern func_ov002_021df680
        .extern func_ov002_021e276c
        .extern func_ov002_022592ec
        .extern func_ov002_02259324
        .extern func_ov002_0225a0e0
        .extern func_ov002_0225a354
        .extern func_ov002_0225a51c
        .extern func_ov002_0225b2e8
        .extern func_ov002_02266358
        .extern func_ov002_02266650
        .extern func_ov002_0226b034
        .extern func_ov002_0226b094
        .extern func_ov002_02285df0
        .extern func_ov002_0229ade0
        .global func_ov002_0225b338
        .arm
func_ov002_0225b338:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r2, _LIT0
    rsb r4, r5, #0x1
    ldr r1, _LIT1
    str r4, [r2, #0x4]
    ldr r6, [r1, #0xd30]
    cmp r6, #0xb
    addls pc, pc, r6, lsl #0x2
    b .L_978
    b .L_5c
    b .L_e8
    b .L_454
    b .L_484
    b .L_72c
    b .L_7a0
    b .L_978
    b .L_978
    b .L_978
    b .L_978
    b .L_8f8
    b .L_950
.L_5c:
    ldr r3, [r2, #0x18]
    cmp r3, #0x0
    beq .L_e0
    ldr r1, [r2, #0x1c]
    bl func_ov002_0225a354
    cmp r0, #0x0
    bne .L_88
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_c4
.L_88:
    ldr r0, _LIT2
    ldr r0, [r0, r5, lsl #0x2]
    cmp r0, #0x1
    bne .L_bc
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0, #0x1c]
    mov r0, r5
    mov r3, r2
    bl func_ov002_02285df0
    ldr r1, _LIT1
    str r0, [r1, #0xd44]
    b .L_c4
.L_bc:
    mov r0, #0xdf
    bl func_ov002_021ae484
.L_c4:
    ldr r1, _LIT1
    add sp, sp, #0x4
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_e0:
    add r0, r6, #0x1
    str r0, [r1, #0xd30]
.L_e8:
    ldr r1, _LIT0
    ldr r0, [r1, #0x18]
    cmp r0, #0x0
    beq .L_120
    ldr r0, _LIT1
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    bne .L_120
    ldr r1, [r1, #0x1c]
    mov r0, r5
    bl func_ov002_0225a51c
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_120:
    ldr r1, _LIT0
    mov r0, r5
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c031c
    cmp r0, #0x0
    beq .L_15c
    ldr r1, _LIT0
    mov r2, #0x1
    str r2, [r1, #0x8]
    ldr r0, _LIT1
    mov r1, #0x5
    str r1, [r0, #0xd30]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_15c:
    bl func_ov002_02266650
    cmp r0, #0x0
    beq .L_1cc
    mov r0, r4
    bl func_ov002_02266358
    mov r4, r0
    ldr r1, _LIT3
    mov r0, r5
    mov r2, #0x4
    mov r3, #0x0
    bl func_ov002_021e276c
    cmp r4, #0x0
    blt .L_1b0
    ldr r1, _LIT0
    ldr r0, _LIT1
    str r4, [r1, #0x20]
    mov r1, #0x5
    str r1, [r0, #0xd30]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_1b0:
    ldr r1, _LIT1
    mov r0, #0x1
    str r0, [r1, #0xd2c]
    mov r0, #0x0
    str r0, [r1, #0xd30]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_1cc:
    ldr r1, _LIT0
    mov r0, r5
    ldr r1, [r1, #0x1c]
    mov r2, #0x1
    bl func_ov002_021c1d28
    cmp r0, #0x0
    bne .L_280
    ldr r1, _LIT4
    mov r0, r4
    bl func_ov002_021b359c
    cmp r0, #0x0
    ble .L_280
    ldr r1, _LIT4
    mov r0, r4
    bl func_ov002_021df680
    ldr r1, _LIT4
    mov r0, r4
    bl func_ov002_021b359c
    cmp r0, #0x1
    bne .L_268
    ldr r5, _LIT4
    mov r6, #0x0
.L_224:
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_ov002_021b30ac
    cmp r0, #0x0
    bne .L_248
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_224
.L_248:
    ldr r1, _LIT0
    ldr r0, _LIT1
    str r6, [r1, #0x20]
    mov r1, #0x5
    str r1, [r0, #0xd30]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_268:
    ldr r0, _LIT1
    mov r1, #0x3
    str r1, [r0, #0xd30]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_280:
    ldr r1, _LIT0
    mov r0, r5
    ldr r1, [r1, #0x1c]
    mov r2, #0x1
    bl func_ov002_021c034c
    cmp r0, #0x1
    beq .L_2c8
    cmp r0, #0x2
    bne .L_43c
    ldr r1, _LIT0
    mov r2, #0x1
    str r2, [r1, #0x8]
    ldr r0, _LIT1
    mov r1, #0x5
    str r1, [r0, #0xd30]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_2c8:
    ldr r1, _LIT0
    mov r0, r5
    ldr r1, [r1, #0x1c]
    bl func_ov002_021bff00
    cmp r0, #0x0
    beq .L_3d8
    ldr r1, _LIT5
    mov r0, r4
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_328
    ldr r1, _LIT5
    mov r0, r4
    bl func_ov002_021df680
    ldr r1, _LIT5
    mov r0, r4
    bl func_ov002_0226b094
    ldr r0, _LIT1
    mov r1, #0xa
    str r1, [r0, #0xd30]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_328:
    ldr r0, _LIT6
    bl func_ov002_021bb91c
    cmp r0, #0x0
    beq .L_39c
    ldr r2, _LIT6
    mov r0, #0x1
    mov r1, #0xa
    bl func_ov002_021baca8
    ldr r3, _LIT7
    ldr r1, _LIT8
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    ldr r3, [r1, #0xf8]
    mov r1, #0xa
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    ldr r1, _LIT5
    mov r0, r4
    bl func_ov002_0226b094
    ldr r0, _LIT1
    mov r1, #0xa
    str r1, [r0, #0xd30]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_39c:
    ldr r2, _LIT9
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_3fc
    ldr r1, _LIT5
    mov r0, r4
    bl func_ov002_0226b094
    ldr r0, _LIT1
    mov r1, #0xa
    str r1, [r0, #0xd30]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_3d8:
    ldr r1, _LIT0
    mov r2, #0x1
    str r2, [r1, #0x8]
    ldr r0, _LIT1
    mov r1, #0x5
    str r1, [r0, #0xd30]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_3fc:
    ldr r0, _LIT2
    ldr r0, [r0, r5, lsl #0x2]
    cmp r0, #0x1
    bne .L_41c
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_424
.L_41c:
    mov r0, #0xe1
    bl func_ov002_021ae484
.L_424:
    ldr r0, _LIT1
    mov r1, #0x2
    str r1, [r0, #0xd30]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_43c:
    ldr r0, _LIT1
    mov r1, #0x3
    str r1, [r0, #0xd30]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_454:
    ldr r0, [r1, #0xd44]
    cmp r0, #0x0
    beq .L_47c
    mov r0, #0x1
    str r0, [r2, #0x8]
    mov r0, #0x5
    str r0, [r1, #0xd30]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_47c:
    add r0, r6, #0x1
    str r0, [r1, #0xd30]
.L_484:
    ldr r1, _LIT0
    mov r0, r5
    ldr r1, [r1, #0x1c]
    bl func_ov002_021bff00
    cmp r0, #0x2
    blt .L_5ac
    ldr r1, _LIT5
    mov r0, r4
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_4ec
    ldr r1, _LIT5
    mov r0, r4
    bl func_ov002_021df680
    ldr r0, _LIT0
    ldr r1, _LIT5
    ldr r2, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_0226b034
    ldr r0, _LIT1
    mov r1, #0xb
    str r1, [r0, #0xd30]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_4ec:
    ldr r0, _LIT6
    bl func_ov002_021bb91c
    cmp r0, #0x0
    beq .L_568
    ldr r2, _LIT6
    mov r0, #0x1
    mov r1, #0xa
    bl func_ov002_021baca8
    ldr r3, _LIT7
    ldr r1, _LIT8
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    ldr r3, [r1, #0xf8]
    mov r1, #0xa
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    ldr r0, _LIT0
    ldr r1, _LIT5
    ldr r2, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_0226b034
    ldr r0, _LIT1
    mov r1, #0xb
    str r1, [r0, #0xd30]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_568:
    ldr r2, _LIT9
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_5ac
    ldr r0, _LIT0
    ldr r1, _LIT5
    ldr r2, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_0226b034
    ldr r0, _LIT1
    mov r1, #0xb
    str r1, [r0, #0xd30]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_5ac:
    ldr r0, _LIT2
    ldr r0, [r0, r5, lsl #0x2]
    cmp r0, #0x1
    bne .L_658
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    cmp r1, #0x0
    beq .L_5dc
    ldr r1, [r0, #0x1c]
    mov r0, r5
    bl func_ov002_0225a354
    b .L_5e4
.L_5dc:
    mov r0, r5
    bl func_ov002_0225a0e0
.L_5e4:
    ldr r1, _LIT0
    cmp r0, #0x0
    moveq r3, #0x1
    ldr r1, [r1, #0x1c]
    movne r3, #0x0
    mov r0, r5
    mov r2, #0x1
    bl func_ov002_02285df0
    cmp r0, #0x0
    beq .L_63c
    ldr r2, _LIT10
    ldr r1, _LIT0
    ldr r3, [r2, #0x1f8]
    ldr r0, _LIT1
    str r3, [r1, #0x8]
    ldr r3, [r2, #0x204]
    mov r2, #0x5
    str r3, [r1, #0x20]
    str r2, [r0, #0xd30]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_63c:
    ldr r1, _LIT0
    mov r0, r5
    ldr r1, [r1, #0x1c]
    bl func_ov002_0225a51c
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_658:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0xa
    bl func_ov002_0229ade0
    ldr r6, _LIT0
    mov r8, #0x0
    mov r7, #0x1
.L_678:
    str r7, [sp]
    ldr r1, [r6, #0x1c]
    mov r0, r5
    mov r2, r4
    mov r3, r8
    bl func_ov002_021bf294
    cmp r0, #0x0
    beq .L_6b0
    mov r1, r4
    mov r2, r8
    mov r0, #0x7
    mov r3, #0x0
    bl func_ov002_0229ade0
    b .L_6bc
.L_6b0:
    add r8, r8, #0x1
    cmp r8, #0x4
    ble .L_678
.L_6bc:
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    cmp r1, #0x0
    beq .L_708
    ldr r1, [r0, #0x1c]
    mov r0, r5
    bl func_ov002_0225a354
    cmp r0, #0x0
    bne .L_708
    ldr r1, _LIT0
    mov r0, r5
    ldr r1, [r1, #0x1c]
    mov r2, #0x1
    bl func_ov002_021c034c
    cmp r0, #0x1
    beq .L_708
    ldr r0, _LIT11
    bl func_ov002_02259324
    b .L_710
.L_708:
    ldr r0, _LIT11
    bl func_ov002_022592ec
.L_710:
    ldr r1, _LIT1
    add sp, sp, #0x4
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_72c:
    ldr r3, [r1, #0xd50]
    cmp r3, #0x0
    beq .L_774
    ldr r0, [r1, #0xd64]
    cmp r0, #0xb
    bne .L_768
    ldr r4, [r1, #0xd74]
    ldr r3, [r1, #0xd78]
    add r0, r6, #0x1
    add r3, r4, r3
    str r3, [r2, #0x20]
    str r0, [r1, #0xd30]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_768:
    sub r0, r6, #0x1
    str r0, [r1, #0xd30]
    b .L_794
.L_774:
    ldr r3, [r2, #0x18]
    cmp r3, #0x0
    movne r0, #0x0
    strne r0, [r1, #0xd30]
    addne sp, sp, #0x4
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldr r1, [r2, #0x1c]
    bl func_ov002_0225a51c
.L_794:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_7a0:
    ldr r2, _LIT9
    mov r0, r4
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021d5b80
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_8a8
    cmp r5, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, _LIT0
    orr r2, r1, #0x1a
    ldr r1, [r0, #0x1c]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021d479c
    ldr r0, _LIT0
    mov r1, #0x5
    str r1, [r0, #0x20]
    ldr r1, [r0, #0x1c]
    mov r0, r5
    bl func_ov002_021b9ecc
    ldr r1, _LIT12
    cmp r0, r1
    addne r1, r1, #0x6e
    cmpne r0, r1
    bne .L_89c
    ldr r1, _LIT0
    mov r0, r5
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c031c
    cmp r0, #0x0
    bne .L_89c
    ldr r1, _LIT0
    mov r0, r5
    ldr r1, [r1, #0x1c]
    mov r2, #0x1
    bl func_ov002_021c034c
    cmp r0, #0x0
    beq .L_89c
    ldr r1, _LIT0
    mov r0, r5
    ldr r1, [r1, #0x1c]
    mov r2, #0x0
    bl func_ov002_021c034c
    cmp r0, #0x0
    bne .L_89c
    ldr r1, _LIT0
    mov r0, r5
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b9ecc
    mov r1, r0, lsl #0x10
    mov r0, r5
    mov r1, r1, lsr #0x10
    mov r2, #0x4
    mov r3, #0x0
    bl func_ov002_021e276c
.L_89c:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_8a8:
    ldr r0, _LIT0
    cmp r5, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    orr r4, r1, #0x19
    ldr r1, [r0, #0x1c]
    ldr r2, [r0, #0x20]
    ldr r3, [r0, #0x4]
    mov r0, r4, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d479c
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_8f8:
    ldr r0, _LIT13
    ldrh r0, [r0, #0xb0]
    cmp r0, #0x0
    beq .L_924
    mov r0, #0x1
    str r0, [r2, #0x8]
    mov r0, #0x5
    str r0, [r1, #0xd30]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_924:
    ldr r2, [r2, #0x1c]
    ldr r1, _LIT5
    mov r0, r4
    bl func_ov002_0226b034
    ldr r1, _LIT1
    add sp, sp, #0x4
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_950:
    ldr r0, _LIT13
    mov r3, #0x5
    ldrh r4, [r0, #0xb0]
    add sp, sp, #0x4
    mov r0, #0x0
    mov r4, r4, asr #0x8
    and r4, r4, #0xff
    str r4, [r2, #0x20]
    str r3, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_978:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word data_ov002_022d016c
_LIT2: .word data_ov002_022cd744
_LIT3: .word 0x0000151e
_LIT4: .word 0x00001318
_LIT5: .word 0x0000139c
_LIT6: .word 0x00001443
_LIT7: .word data_ov002_022cf16c
_LIT8: .word 0x00000868
_LIT9: .word 0x0000177a
_LIT10: .word data_ov002_022cd524
_LIT11: .word func_ov002_0225b2e8
_LIT12: .word 0x00001a41
_LIT13: .word data_ov002_022d0e6c
