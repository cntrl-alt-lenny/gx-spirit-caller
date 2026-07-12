; func_ov002_0227b28c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern func_0202f994
        .extern func_ov002_021b9dec
        .extern func_ov002_021bb82c
        .extern func_ov002_021bbb78
        .extern func_ov002_021bbe70
        .extern func_ov002_021c4bbc
        .extern func_ov002_021c83ac
        .extern func_ov002_0227b084
        .extern func_ov002_0227d570
        .global func_ov002_0227b28c
        .arm
func_ov002_0227b28c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x2c
    mov r7, r0
    mov r6, r1
    bl func_ov002_021b9dec
    mov r1, #0x14
    ldr r3, _LIT0
    and r2, r7, #0x1
    mul r4, r2, r3
    ldr r2, _LIT1
    mul r5, r6, r1
    add r1, r2, r4
    ldr r1, [r5, r1]
    mov r8, r0
    mov r0, r1, lsr #0x6
    tst r0, #0x1
    bne .L_6b4
    ldr r1, _LIT2
    cmp r8, r1
    bgt .L_35c
    bge .L_470
    sub r0, r1, #0x200
    cmp r8, r0
    bgt .L_2d0
    bge .L_470
    ldr r2, _LIT3
    cmp r8, r2
    bgt .L_2a0
    bge .L_470
    sub r0, r2, #0x1d
    cmp r8, r0
    bgt .L_290
    beq .L_450
    b .L_688
.L_290:
    sub r0, r2, #0x9
    cmp r8, r0
    beq .L_470
    b .L_688
.L_2a0:
    add r0, r2, #0x104
    cmp r8, r0
    bgt .L_2c0
    bge .L_4a8
    add r0, r2, #0xcd
    cmp r8, r0
    beq .L_450
    b .L_688
.L_2c0:
    sub r0, r1, #0x28c
    cmp r8, r0
    beq .L_488
    b .L_688
.L_2d0:
    ldr r2, _LIT4
    cmp r8, r2
    bgt .L_32c
    bge .L_470
    sub r0, r2, #0x35
    cmp r8, r0
    bgt .L_31c
    sub r0, r2, #0x39
    cmp r8, r0
    blt .L_30c
    beq .L_450
    sub r0, r2, #0x35
    cmp r8, r0
    beq .L_5d0
    b .L_688
.L_30c:
    sub r0, r2, #0x5e
    cmp r8, r0
    beq .L_4c4
    b .L_688
.L_31c:
    sub r0, r2, #0x30
    cmp r8, r0
    beq .L_504
    b .L_688
.L_32c:
    sub r0, r1, #0x19
    cmp r8, r0
    bgt .L_34c
    bge .L_66c
    sub r0, r1, #0x2f
    cmp r8, r0
    beq .L_66c
    b .L_688
.L_34c:
    sub r0, r1, #0x18
    cmp r8, r0
    beq .L_470
    b .L_688
.L_35c:
    ldr r0, _LIT5
    cmp r8, r0
    bgt .L_3e0
    bge .L_66c
    add r2, r1, #0x1dc
    cmp r8, r2
    bgt .L_3b0
    add r1, r1, #0x1dc
    cmp r8, r1
    bge .L_47c
    sub r1, r0, #0x1d4
    cmp r8, r1
    bgt .L_3a0
    sub r0, r0, #0x1d4
    cmp r8, r0
    beq .L_470
    b .L_688
.L_3a0:
    sub r0, r0, #0x104
    cmp r8, r0
    beq .L_47c
    b .L_688
.L_3b0:
    sub r1, r0, #0x54
    cmp r8, r1
    bgt .L_3d0
    bge .L_470
    sub r0, r0, #0xc2
    cmp r8, r0
    beq .L_62c
    b .L_688
.L_3d0:
    sub r0, r0, #0xc
    cmp r8, r0
    beq .L_66c
    b .L_688
.L_3e0:
    add r1, r0, #0xa6
    cmp r8, r1
    bgt .L_420
    bge .L_450
    add r1, r0, #0x43
    cmp r8, r1
    bgt .L_410
    bge .L_47c
    add r0, r0, #0x5
    cmp r8, r0
    beq .L_60c
    b .L_688
.L_410:
    add r0, r0, #0x91
    cmp r8, r0
    beq .L_5f0
    b .L_688
.L_420:
    add r1, r0, #0xf0
    cmp r8, r1
    bgt .L_440
    bge .L_470
    add r0, r0, #0xbb
    cmp r8, r0
    beq .L_450
    b .L_688
.L_440:
    ldr r0, _LIT6
    cmp r8, r0
    beq .L_470
    b .L_688
.L_450:
    ldr r0, _LIT7
    add r0, r0, r4
    ldrh r0, [r5, r0]
    cmp r0, #0x0
    bne .L_688
    add sp, sp, #0x2c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_470:
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_47c:
    add sp, sp, #0x2c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_488:
    ldr r0, _LIT7
    add r0, r0, r4
    ldrh r0, [r5, r0]
    cmp r0, #0x0
    bne .L_688
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_4a8:
    ldr r0, _LIT8
    ldr r0, [r0, r4]
    cmp r0, #0x7d0
    ble .L_688
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_4c4:
    ldr r0, _LIT7
    add r0, r0, r4
    ldrh r0, [r5, r0]
    cmp r0, #0x0
    beq .L_688
    rsb r0, r7, #0x1
    bl func_ov002_021bbe70
    cmp r0, #0x0
    bne .L_688
    mov r0, r7
    bl func_ov002_021bbe70
    cmp r0, #0x1
    ble .L_688
    add sp, sp, #0x2c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_504:
    ldr r0, _LIT7
    add r0, r0, r4
    ldrh r0, [r5, r0]
    cmp r0, #0x0
    bne .L_688
    rsb r0, r7, #0x1
    ldr r1, _LIT8
    and r0, r0, #0x1
    mla r3, r0, r3, r1
    mov r1, #0x0
    mov r0, r1
    add r2, r3, #0x30
    mov ip, #0x1
.L_538:
    ldr lr, [r2]
    mov lr, lr, lsl #0x13
    movs lr, lr, lsr #0x13
    beq .L_558
    ldr lr, [r3, #0x40]
    mov lr, lr, lsr #0x4
    tst lr, #0x1
    movne r1, ip
.L_558:
    add r0, r0, #0x1
    cmp r0, #0x4
    add r2, r2, #0x14
    add r3, r3, #0x14
    ble .L_538
    cmp r1, #0x0
    beq .L_688
    ldr r0, _LIT8
    mov r3, #0x0
    add r2, r0, r4
    add r0, r2, #0x30
    mov ip, r3
.L_588:
    ldr lr, [r0]
    mov lr, lr, lsl #0x13
    movs lr, lr, lsr #0x13
    beq .L_5a8
    ldr lr, [r2, #0x40]
    mov lr, lr, lsr #0x4
    tst lr, #0x1
    movne r1, ip
.L_5a8:
    add r3, r3, #0x1
    cmp r3, #0x4
    add r0, r0, #0x14
    add r2, r2, #0x14
    ble .L_588
    cmp r1, #0x0
    beq .L_688
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_5d0:
    mov r0, r7
    sub r1, r2, #0x40
    bl func_ov002_021bb82c
    cmp r0, #0x0
    bne .L_688
    add sp, sp, #0x2c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_5f0:
    rsb r0, r7, #0x1
    bl func_ov002_021bbe70
    cmp r0, #0x0
    bne .L_688
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_60c:
    mov r0, r7
    mov r1, #0x7
    bl func_ov002_021bbb78
    cmp r0, #0x0
    beq .L_688
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_62c:
    mov r0, r7
    mov r1, #0x0
    bl func_ov002_0227d570
    cmp r0, #0x0
    blt .L_688
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c83ac
    cmp r0, #0x3e8
    blt .L_688
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_66c:
    ldr r1, _LIT9
    ldr r0, _LIT10
    ldr r1, [r1, #0xdc]
    cmp r1, r0
    addeq sp, sp, #0x2c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_688:
    mov r0, r8
    bl func_0202f994
    cmp r0, #0x0
    beq .L_6b4
    ldr r0, _LIT7
    add r0, r0, r4
    ldrh r0, [r5, r0]
    cmp r0, #0x0
    addeq sp, sp, #0x2c
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_6b4:
    ldr r0, _LIT7
    add r2, sp, #0x0
    add r4, r0, r4
    ldrh r0, [r5, r4]
    cmp r0, #0x0
    beq .L_6dc
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c4bbc
    b .L_6f8
.L_6dc:
    mov r3, #0x1
    mov r0, r7
    mov r1, r6
    strh r3, [r4, r5]
    bl func_ov002_021c4bbc
    mov r0, #0x0
    strh r0, [r4, r5]
.L_6f8:
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x18]
    mov r0, r7
    bl func_ov002_0227b084
    mvn r1, #0x0
    cmp r0, r1
    moveq r0, r1
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0cc
_LIT2: .word 0x00001639
_LIT3: .word 0x000012a3
_LIT4: .word 0x000014af
_LIT5: .word 0x00001917
_LIT6: .word 0x00001a78
_LIT7: .word data_ov002_022cf0c4
_LIT8: .word data_ov002_022cf08c
_LIT9: .word data_ov002_022d008c
_LIT10: .word 0x0000175e
