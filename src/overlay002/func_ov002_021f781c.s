; func_ov002_021f781c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf17c
        .extern data_ov002_022d016c
        .extern func_0202f578
        .extern func_ov002_021ae400
        .extern func_ov002_021ae514
        .extern func_ov002_021bbf50
        .extern func_ov002_021bc000
        .extern func_ov002_021df62c
        .extern func_ov002_021df780
        .extern func_ov002_021f4260
        .extern func_ov002_021fdc08
        .extern func_ov002_022536e8
        .extern func_ov002_022577dc
        .extern func_ov002_02257ab8
        .extern func_ov002_0226b0d0
        .global func_ov002_021f781c
        .arm
func_ov002_021f781c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r5, r0
    ldr r1, [r1, #0x5b4]
    cmp r1, #0x0
    beq .L_30
    cmp r1, #0x1
    beq .L_5a0
    cmp r1, #0x2
    beq .L_5e8
    b .L_6b0
.L_30:
    bl func_ov002_021fdc08
    cmp r0, #0x0
    beq .L_5c
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    add sp, sp, #0x8
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_5c:
    ldrh r1, [r5]
    ldr r3, _LIT2
    mov r4, #0x4
    cmp r1, r3
    bgt .L_98
    bge .L_184
    ldr r2, _LIT3
    cmp r1, r2
    bgt .L_88
    beq .L_e0
    b .L_2d4
.L_88:
    sub r0, r3, #0xec
    cmp r1, r0
    beq .L_144
    b .L_2d4
.L_98:
    add r0, r3, #0x68
    cmp r1, r0
    bgt .L_d4
    add r0, r3, #0x67
    cmp r1, r0
    blt .L_c4
    beq .L_204
    add r0, r3, #0x68
    cmp r1, r0
    beq .L_244
    b .L_2d4
.L_c4:
    add r0, r3, #0x38
    cmp r1, r0
    beq .L_1c4
    b .L_2d4
.L_d4:
    cmp r1, #0x1a80
    beq .L_280
    b .L_2d4
.L_e0:
    mov r0, r5
    bl func_ov002_022577dc
    cmp r0, #0x0
    beq .L_118
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT4
    ldr r1, _LIT5
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x3e8
    orrgt r4, r4, #0x1
.L_118:
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT4
    ldr r1, _LIT5
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x1
    orrgt r4, r4, #0x2
    b .L_2d4
.L_144:
    ldrh r3, [r5, #0x2]
    sub r0, r2, #0xb20
    ldr r1, _LIT6
    mov r2, r3, lsl #0x1f
    mov r2, r2, lsr #0x1f
    rsb r2, r2, #0x1
    and r2, r2, #0x1
    mul r3, r2, r0
    ldr r0, [r1, r3]
    cmp r0, #0x0
    ldr r0, _LIT7
    orrne r4, r4, #0x1
    ldr r0, [r0, r3]
    cmp r0, #0x0
    orrne r4, r4, #0x2
    b .L_2d4
.L_184:
    mov r0, r5
    bl func_ov002_022577dc
    ldrh r2, [r5, #0x2]
    cmp r0, #0x0
    ldr r0, _LIT4
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    rsb r2, r2, #0x1
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r1, _LIT7
    orrne r4, r4, #0x1
    ldr r0, [r1, r0]
    cmp r0, #0x0
    orrne r4, r4, #0x2
    b .L_2d4
.L_1c4:
    mov r0, r5
    bl func_ov002_022577dc
    ldrh r2, [r5, #0x2]
    cmp r0, #0x0
    ldr r0, _LIT4
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    rsb r2, r2, #0x1
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r1, _LIT7
    orrne r4, r4, #0x1
    ldr r0, [r1, r0]
    cmp r0, #0x0
    orrne r4, r4, #0x2
    b .L_2d4
.L_204:
    mov r0, r5
    bl func_ov002_022577dc
    ldrh r2, [r5, #0x2]
    cmp r0, #0x0
    ldr r0, _LIT4
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    rsb r2, r2, #0x1
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r1, _LIT7
    orrne r4, r4, #0x1
    ldr r0, [r1, r0]
    cmp r0, #0x0
    orrne r4, r4, #0x2
    b .L_2d4
.L_244:
    ldrh r0, [r5, #0x2]
    ldr r2, _LIT4
    ldr r3, _LIT7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r6, r0, #0x1
    mul r2, r6, r2
    ldr r2, [r3, r2]
    cmp r2, #0x0
    orrne r4, r4, #0x1
    mov r2, #0x0
    bl func_ov002_022536e8
    cmp r0, #0x0
    orrne r4, r4, #0x2
    b .L_2d4
.L_280:
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc000
    cmp r0, #0x1
    ble .L_2ac
    mov r0, r5
    bl func_ov002_022577dc
    cmp r0, #0x0
    orrne r4, r4, #0x1
.L_2ac:
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT4
    ldr r1, _LIT7
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    orrne r4, r4, #0x2
.L_2d4:
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT9
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_548
    ldr r3, _LIT10
    mov r0, #0x2
    str r0, [r3, #0xd44]
    ldrh r1, [r5]
    ldr r2, _LIT2
    cmp r1, r2
    bgt .L_334
    bge .L_464
    ldr r0, _LIT3
    cmp r1, r0
    bgt .L_324
    beq .L_3e0
    b .L_584
.L_324:
    sub r0, r2, #0xec
    cmp r1, r0
    beq .L_3c0
    b .L_584
.L_334:
    add r0, r2, #0x68
    cmp r1, r0
    bgt .L_370
    add r0, r2, #0x67
    cmp r1, r0
    blt .L_360
    beq .L_464
    add r0, r2, #0x68
    cmp r1, r0
    beq .L_37c
    b .L_584
.L_360:
    add r0, r2, #0x38
    cmp r1, r0
    beq .L_4b4
    b .L_584
.L_370:
    cmp r1, #0x1a80
    beq .L_4e4
    b .L_584
.L_37c:
    ldrh r0, [r5, #0x2]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    cmp r0, #0x0
    beq .L_3a8
    ldr r0, _LIT10
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_584
.L_3a8:
    tst r4, #0x2
    beq .L_584
    ldr r0, _LIT10
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_584
.L_3c0:
    tst r4, #0x1
    movne r0, #0x0
    strne r0, [r3, #0xd44]
    bne .L_584
    tst r4, #0x2
    movne r0, #0x1
    strne r0, [r3, #0xd44]
    b .L_584
.L_3e0:
    tst r4, #0x2
    beq .L_42c
    ldrh r1, [r5, #0x2]
    ldr r0, [r3, #0xcec]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    mov r1, r1, lsr #0x1f
    bne .L_42c
    ldr r0, [r3, #0xcf8]
    cmp r0, #0x3
    bhi .L_42c
    rsb r0, r1, #0x1
    bl func_ov002_021bbf50
    cmp r0, #0x0
    bne .L_42c
    ldr r0, _LIT10
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_584
.L_42c:
    tst r4, #0x1
    beq .L_584
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_02257ab8
    cmp r0, #0x0
    beq .L_584
    ldr r0, _LIT10
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_584
.L_464:
    tst r4, #0x1
    beq .L_49c
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_02257ab8
    cmp r0, #0x0
    beq .L_49c
    ldr r0, _LIT10
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_584
.L_49c:
    tst r4, #0x2
    beq .L_584
    ldr r0, _LIT10
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_584
.L_4b4:
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_02257ab8
    cmp r0, #0x0
    beq .L_584
    ldr r0, _LIT10
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_584
.L_4e4:
    tst r4, #0x2
    beq .L_510
    ldrh r0, [r5, #0x2]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    cmp r0, #0x0
    ldrne r0, _LIT10
    movne r1, #0x1
    strne r1, [r0, #0xd44]
.L_510:
    tst r4, #0x1
    beq .L_584
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_02257ab8
    cmp r0, #0x0
    beq .L_584
    ldr r0, _LIT10
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_584
.L_548:
    ldrh r0, [r5]
    mov r1, #0x0
    bl func_ov002_021f4260
    mov r6, r0
    ldrh r0, [r5]
    mov r1, #0x1
    bl func_ov002_021f4260
    mov r2, r0
    mov r0, #0x0
    str r0, [sp]
    ldr r0, _LIT11
    mov r1, r6
    mov r3, #0x1ac
    str r4, [sp, #0x4]
    bl func_ov002_021ae514
.L_584:
    ldr r1, _LIT0
    add sp, sp, #0x8
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_5a0:
    ldr r0, _LIT10
    ldr r1, [r0, #0xd44]
    add r1, r1, #0x1
    strh r1, [r5, #0xc]
    ldrh r3, [r5, #0x2]
    ldr r2, [r0, #0xd44]
    ldrh r1, [r5]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b0d0
    ldr r1, _LIT0
    add sp, sp, #0x8
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_5e8:
    ldrh r0, [r5, #0xc]
    cmp r0, #0x3
    addeq sp, sp, #0x8
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r1, [r5, #0x2]
    ldrh r0, [r5, #0x4]
    mov r3, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r2, r0, lsl #0x11
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021df62c
    ldrh r1, [r5]
    ldr r0, _LIT3
    cmp r1, r0
    bne .L_6a4
    ldrh r0, [r5, #0xc]
    cmp r0, #0x1
    bne .L_650
    ldrh r0, [r5, #0x2]
    mov r1, #0x3e8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021df780
.L_650:
    ldrh r0, [r5, #0xc]
    cmp r0, #0x2
    bne .L_6a4
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT4
    ldr r3, _LIT5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r0, r0, #0x1
    mul r2, r0, r1
    ldr r0, [r3, r2]
    sub r0, r0, #0x1
    strh r0, [r5, #0x8]
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r1, r2, r1
    ldr r1, [r3, r1]
    sub r1, r1, #0x1
    bl func_ov002_021df780
.L_6a4:
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_6b0:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000107
_LIT2: .word 0x0000161e
_LIT3: .word 0x00001388
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf16c
_LIT6: .word data_ov002_022cf178
_LIT7: .word data_ov002_022cf17c
_LIT8: .word func_0202f578
_LIT9: .word data_ov002_022cd744
_LIT10: .word data_ov002_022d016c
_LIT11: .word 0x00000103
