; func_ov012_021cb49c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_02102c64
        .extern data_021040ac
        .extern data_ov000_021c73e4
        .extern data_ov012_021cc120
        .extern data_ov012_021cc60c
        .extern data_ov012_021cc628
        .extern data_ov012_021cc640
        .extern data_ov012_021cc658
        .extern data_ov012_021cc674
        .extern data_ov012_021cc6a0
        .extern data_ov012_021cc6dc
        .extern func_02005ca0
        .extern func_02005e20
        .extern func_02018b48
        .extern func_02018b94
        .extern func_02019124
        .extern func_0201b7fc
        .extern func_0201be64
        .extern func_0201be98
        .extern func_0201bf4c
        .extern func_0201c198
        .extern func_0201c6a0
        .extern func_0202c0c0
        .extern func_02037208
        .extern OS_SPrintf
        .extern func_ov000_021ab6cc
        .extern func_ov000_021ab6ec
        .extern func_ov000_021ab8f8
        .extern func_ov000_021ac578
        .extern func_ov000_021ac72c
        .extern func_ov000_021ac760
        .extern func_ov000_021adb9c
        .extern func_ov000_021adbdc
        .extern func_ov000_021add44
        .extern func_ov000_021ae394
        .extern func_ov000_021ae42c
        .extern func_ov000_021ae48c
        .extern func_ov000_021ae4ac
        .extern func_ov000_021ae4c4
        .extern func_ov000_021aed18
        .extern func_ov012_021c9d60
        .extern func_ov012_021ca18c
        .extern func_ov012_021ca450
        .extern func_ov012_021cb088
        .extern func_ov012_021cb320
        .extern func_ov012_021cb400
        .global func_ov012_021cb49c
        .arm
func_ov012_021cb49c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x24
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1, #0x140]
    ldr r4, _LIT2
    orr r2, r2, #0x40
    str r2, [r1, #0x140]
    ldr r0, [r0, #0x1a8]
    mov r5, #0x0
    mov r0, r0, lsl #0x6
    movs r0, r0, lsr #0x18
    beq .L_80
    ldr r1, [r4, #0x16c]
    mov r0, r1, lsl #0x6
    mov r0, r0, lsr #0x18
    sub r0, r0, #0x1
    bic r1, r1, #0x3fc0000
    mov r0, r0, lsl #0x18
    orr r1, r1, r0, lsr #0x6
    mov r0, r1, lsl #0x6
    str r1, [r4, #0x16c]
    movs r0, r0, lsr #0x18
    bne .L_80
    mov r0, r1, lsl #0x5
    movs r0, r0, lsr #0x1f
    beq .L_80
    mov r0, #0xc6
    mov r2, r5
    sub r1, r0, #0xc7
    mov r3, #0x1
    bl func_02037208
.L_80:
    bl func_ov012_021ca18c
    ldr r0, [r4, #0x168]
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x18
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_988
    b .L_c4
    b .L_394
    b .L_414
    b .L_5c8
    b .L_6dc
    b .L_874
    b .L_940
    b .L_884
    b .L_348
    b .L_308
.L_c4:
    bl func_ov000_021ab6cc
    cmp r0, #0x0
    beq .L_988
    mov r0, #0x1
    bl func_ov000_021aed18
    bl func_0201b7fc
    mov r0, #0x4
    bl func_0201c198
    ldr r0, _LIT3
    ldr r0, [r0, #0x48]
    cmp r0, #0x0
    beq .L_164
    ldr r2, [r4, #0x164]
    ldr r1, [r4, #0x160]
    ldr r0, [r4, #0x168]
    bic r2, r2, #0xff
    orr r3, r2, #0x1
    bic r1, r1, #0xf
    orr r2, r1, #0x1
    bic r0, r0, #0xff0000
    orr r1, r0, #0x20000
    str r3, [r4, #0x164]
    str r2, [r4, #0x160]
    ldr r0, _LIT1
    str r1, [r4, #0x168]
    ldr r0, [r0, #0x19c]
    mov r2, #0x0
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    mov r3, #0x1
    bne .L_154
    mov r0, #0x53
    sub r1, r0, #0x54
    bl func_02037208
    b .L_988
.L_154:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_02037208
    b .L_988
.L_164:
    bl func_0201be98
    cmp r0, #0x0
    bne .L_17c
    bl func_0201bf4c
    cmp r0, #0x0
    beq .L_1a8
.L_17c:
    bl func_0201c6a0
    bl func_02018b94
    ldr r0, [r0]
    .word 0xebff971e
    mov r0, #0x0
    bl func_ov000_021aed18
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x80000
    str r0, [r4, #0x168]
    b .L_988
.L_1a8:
    ldr r0, _LIT3
    ldr r0, [r0, #0x3c]
    cmp r0, #0x0
    beq .L_2c8
    ldr r1, [r4, #0x160]
    and r0, r0, #0xf
    bic r1, r1, #0xf
    orr r1, r1, r0
    mov r0, r1, lsl #0x1c
    mov r0, r0, lsr #0x1c
    str r1, [r4, #0x160]
    sub r7, r0, #0x1
    .word 0xebff976c
    cmp r0, #0x0
    beq .L_204
    ldr r0, [r4, #0x160]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    add r0, r0, #0x16
    add r0, r0, #0x500
    bl func_0202c0c0
    mov r1, #0x0
    bl func_ov000_021add44
.L_204:
    ldr r0, _LIT3
    ldr r0, [r0, #0x40]
    cmp r0, #0x0
    beq .L_2a4
    mov r0, #0x0
    bl func_ov000_021aed18
    ldr r6, _LIT4
    ldr r1, [r6, r7, lsl #0x2]
    mov r0, r1, lsl #0x10
    mov r0, r0, asr #0x18
    add r0, r0, #0x1d
    mov r1, r1, lsl #0x18
    add r0, r0, #0x500
    mov r8, r1, asr #0x18
    bl func_0202c0c0
    .word 0xebff99d7
    ldr r1, [r6, r7, lsl #0x2]
    mov r6, r0
    mov r0, r1, lsl #0x8
    mov r0, r0, asr #0x18
    add r0, r0, #0x21
    add r0, r0, #0x500
    bl func_0202c0c0
    .word 0xebff99cf
    mov r1, r6
    mov r2, r0
    mov r0, r8
    mov r3, #0x1
    bl func_ov000_021ae394
    mov r0, r8
    mov r1, r7
    bl func_ov012_021cb400
    ldr r0, _LIT3
    ldr r0, [r0, #0x40]
    bl func_ov000_021ae42c
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x90000
    str r0, [r4, #0x168]
    b .L_988
.L_2a4:
    ldr r1, [r4, #0x168]
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r4, #0x168]
    b .L_988
.L_2c8:
    .word 0xebff9730
    cmp r0, #0x0
    beq .L_2e4
    ldr r0, _LIT5
    bl func_0202c0c0
    mov r1, #0x0
    bl func_ov000_021add44
.L_2e4:
    ldr r1, [r4, #0x168]
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r4, #0x168]
    b .L_988
.L_308:
    bl func_ov000_021ae4c4
    cmp r0, #0x4
    bne .L_988
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x1f
    bne .L_334
    mov r0, #0x0
    mov r1, #0x10
    bl func_ov000_021ab6ec
.L_334:
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x40000
    str r0, [r4, #0x168]
    b .L_988
.L_348:
    .word 0xebff9710
    cmp r0, #0x0
    beq .L_988
    bl func_02018b48
    cmp r0, #0x0
    beq .L_37c
    mov r0, #0x0
    bl func_ov012_021c9d60
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x50000
    str r0, [r4, #0x168]
    b .L_988
.L_37c:
    bl func_ov000_021adb9c
    bl func_ov000_021adbdc
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    str r0, [r4, #0x168]
    b .L_988
.L_394:
    mov r6, #0x0
    mov r7, r6
    add r8, r4, #0x130
.L_3a0:
    mov r0, r8
    bl func_ov000_021ac578
    mov r0, r8
    bl func_ov000_021ac760
    cmp r0, #0x0
    beq .L_3f0
    ldr r0, [r4, #0x168]
    ldr r2, [r4, #0x164]
    bic r1, r0, #0xff0000
    mov r6, #0x1
    mov r0, #0x3a
    bic r8, r2, #0xff00
    orr r7, r1, #0x60000
    mov r3, r6
    sub r1, r0, #0x3b
    mov r2, #0x0
    str r8, [r4, #0x164]
    str r7, [r4, #0x168]
    bl func_02037208
    b .L_400
.L_3f0:
    add r7, r7, #0x1
    cmp r7, #0x1
    add r8, r8, #0x14
    bcc .L_3a0
.L_400:
    cmp r6, #0x0
    bne .L_988
    bl func_ov012_021cb088
    bl func_ov012_021ca450
    b .L_988
.L_414:
    ldr r0, [r4, #0x164]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1e
    bcc .L_988
    ldr r0, [r4, #0x160]
    ldr r6, _LIT4
    mov r0, r0, lsl #0x1c
    mov r2, r0, lsr #0x1c
    sub r7, r2, #0x1
    ldr r1, [r6, r7, lsl #0x2]
    mvn r0, #0x0
    mov r1, r1, lsl #0x18
    cmp r0, r1, asr #0x18
    mov r8, r1, asr #0x18
    bne .L_4bc
    cmp r2, #0x1
    bne .L_4a0
    bl func_02019124
    cmp r0, #0xff
    bne .L_4a0
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x7
    movs r0, r0, lsr #0x1f
    bne .L_4a0
    mov r0, #0x0
    bl func_ov000_021aed18
    ldr r0, _LIT6
    .word 0xebff96a3
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x70000
    str r0, [r4, #0x168]
    b .L_5b8
.L_4a0:
    mov r0, #0x0
    bl func_ov012_021c9d60
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x50000
    str r0, [r4, #0x168]
    b .L_5b8
.L_4bc:
    mov r0, #0x0
    bl func_ov000_021aed18
    ldr r0, [r4, #0x160]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x6
    bne .L_548
    .word 0xebff96ac
    cmp r0, #0x0
    beq .L_4f4
    ldr r0, _LIT7
    bl func_0202c0c0
    mov r1, #0x0
    bl func_ov000_021add44
.L_4f4:
    ldr r0, _LIT8
    bl func_0202c0c0
    .word 0xebff9928
    mov r6, r0
    ldr r0, _LIT9
    bl func_0202c0c0
    .word 0xebff9924
    mov r1, r6
    mov r2, r0
    mov r0, #0x0
    mov r3, r0
    bl func_ov000_021ae394
    ldr r0, [r4, #0x168]
    bic r1, r0, #0xff0000
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r4, #0x168]
    b .L_5b8
.L_548:
    ldr r0, [r6, r7, lsl #0x2]
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x18
    add r0, r0, #0x1d
    add r0, r0, #0x500
    bl func_0202c0c0
    .word 0xebff990f
    ldr r1, [r6, r7, lsl #0x2]
    mov r6, r0
    mov r0, r1, lsl #0x8
    mov r0, r0, asr #0x18
    add r0, r0, #0x21
    add r0, r0, #0x500
    bl func_0202c0c0
    .word 0xebff9907
    mov r1, r6
    mov r2, r0
    mov r0, r8
    mov r3, #0x1
    bl func_ov000_021ae394
    ldr r0, [r4, #0x168]
    bic r1, r0, #0xff0000
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x2
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r4, #0x168]
.L_5b8:
    ldr r0, [r4, #0x164]
    bic r0, r0, #0xff
    str r0, [r4, #0x164]
    b .L_988
.L_5c8:
    bl func_ov000_021ae48c
    cmp r0, #0x0
    beq .L_988
    bl func_ov000_021ae4ac
    cmp r0, #0x1
    ldr r0, [r4, #0x160]
    mov r0, r0, lsl #0x1c
    bne .L_6a8
    mov r0, r0, lsr #0x1c
    sub r7, r0, #0x1
    .word 0xebff9666
    cmp r0, #0x0
    beq .L_61c
    ldr r0, [r4, #0x160]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    add r0, r0, #0x16
    add r0, r0, #0x500
    bl func_0202c0c0
    mov r1, #0x0
    bl func_ov000_021add44
.L_61c:
    ldr r6, _LIT4
    ldr r1, [r6, r7, lsl #0x2]
    mov r0, r1, lsl #0x10
    mov r0, r0, asr #0x18
    add r0, r0, #0x1d
    mov r1, r1, lsl #0x18
    add r0, r0, #0x500
    mov r8, r1, asr #0x18
    bl func_0202c0c0
    .word 0xebff98d7
    ldr r1, [r6, r7, lsl #0x2]
    mov r6, r0
    mov r0, r1, lsl #0x8
    mov r0, r0, asr #0x18
    add r0, r0, #0x21
    add r0, r0, #0x500
    bl func_0202c0c0
    .word 0xebff98cf
    mov r1, r6
    mov r2, r0
    mov r0, r8
    mov r3, #0x1
    bl func_ov000_021ae394
    mov r0, r8
    mov r1, r7
    bl func_ov012_021cb400
    ldr r0, [r4, #0x168]
    bic r1, r0, #0xff0000
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r4, #0x168]
    b .L_988
.L_6a8:
    mov r0, r0, lsr #0x1c
    add r0, r0, #0x16
    add r0, r0, #0x500
    bl func_0202c0c0
    mov r1, #0x0
    bl func_ov000_021add44
    mov r0, #0x1
    bl func_ov000_021aed18
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x10000
    str r0, [r4, #0x168]
    b .L_988
.L_6dc:
    bl func_ov012_021cb320
    bl func_ov000_021ae48c
    cmp r0, #0x0
    beq .L_988
    bl func_ov000_021ae4ac
    mov r6, r0
    mov r0, #0x1
    bl func_ov000_021aed18
    cmp r6, #0x0
    beq .L_858
    mov r0, #0x0
    bl func_ov000_021aed18
    ldr r0, [r4, #0x160]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x4
    bne .L_82c
    cmp r6, #0x1
    beq .L_734
    cmp r6, #0x2
    beq .L_750
    b .L_988
.L_734:
    ldr r0, _LIT10
    .word 0xebff95f7
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x70000
    str r0, [r4, #0x168]
    b .L_988
.L_750:
    bl func_0201be64
    cmp r0, #0x0
    beq .L_79c
    mov r0, #0x8
    bl func_0201c198
    bl func_0201be98
    cmp r0, #0x0
    bne .L_77c
    bl func_0201bf4c
    cmp r0, #0x0
    beq .L_790
.L_77c:
    bl func_0201c6a0
    bl func_02018b94
    ldr r0, [r0]
    .word 0xebff959e
    b .L_818
.L_790:
    ldr r0, _LIT11
    .word 0xebff95e0
    b .L_818
.L_79c:
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x7
    movs r0, r0, lsr #0x1f
    beq .L_804
    ldr r3, _LIT12
    mov r0, #0x0
    ldr r2, [r3]
    ldmib r3, {r1, r6}
    umull r8, r7, r6, r2
    mla r7, r6, r1, r7
    ldr r1, [r3, #0xc]
    ldr r6, [r3, #0x10]
    mla r7, r1, r2, r7
    mov r2, r0, lsl #0x2
    ldr r1, [r3, #0x14]
    adds r8, r6, r8
    adc r6, r1, r7
    orr r2, r2, r6, lsr #0x1e
    str r8, [r3]
    ldr r1, _LIT13
    add r0, sp, #0x0
    add r2, r2, #0x1
    str r6, [r3, #0x4]
    bl OS_SPrintf
    b .L_810
.L_804:
    ldr r1, _LIT14
    add r0, sp, #0x0
    bl OS_SPrintf
.L_810:
    add r0, sp, #0x0
    .word 0xebff95c0
.L_818:
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x70000
    str r0, [r4, #0x168]
    b .L_988
.L_82c:
    mov r0, #0x0
    bl func_ov012_021c9d60
    ldr r1, [r4, #0x168]
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r4, #0x168]
    b .L_988
.L_858:
    mov r0, #0x1
    bl func_ov000_021aed18
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x10000
    str r0, [r4, #0x168]
    b .L_988
.L_874:
    bl func_ov000_021ab6cc
    cmp r0, #0x0
    movne r5, #0x1
    b .L_988
.L_884:
    .word 0xebff95c1
    cmp r0, #0x0
    beq .L_988
    mov r0, #0x1
    bl func_ov000_021aed18
    bl func_02018b48
    cmp r0, #0x0
    beq .L_8c0
    mov r0, #0x0
    bl func_ov012_021c9d60
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x50000
    str r0, [r4, #0x168]
    b .L_988
.L_8c0:
    mov r0, #0x4
    bl func_0201c198
    bl func_0201be98
    cmp r0, #0x0
    bne .L_8e0
    bl func_0201bf4c
    cmp r0, #0x0
    beq .L_8fc
.L_8e0:
    bl func_0201c6a0
    bl func_02018b94
    ldr r0, [r0]
    .word 0xebff9545
    mov r0, #0x0
    bl func_ov000_021aed18
    b .L_988
.L_8fc:
    .word 0xebff95a3
    cmp r0, #0x0
    beq .L_928
    ldr r0, [r4, #0x160]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    add r0, r0, #0x16
    add r0, r0, #0x500
    bl func_0202c0c0
    mov r1, #0x0
    bl func_ov000_021add44
.L_928:
    bl func_ov000_021adb9c
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x10000
    str r0, [r4, #0x168]
    b .L_988
.L_940:
    ldr r1, [r4, #0x164]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r1, r1, r0, lsr #0x10
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x18
    str r1, [r4, #0x164]
    cmp r0, #0x1e
    bcc .L_988
    mov r0, #0x0
    bl func_ov012_021c9d60
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x50000
    str r0, [r4, #0x168]
.L_988:
    add r6, r4, #0x130
    mov r4, #0x0
.L_990:
    mov r0, r6
    bl func_ov000_021ac72c
    add r4, r4, #0x1
    cmp r4, #0x1
    add r6, r6, #0x14
    bcc .L_990
    .word 0xebff971a
    mov r0, #0x1
    bl func_02005e20
    mov r0, #0x2
    bl func_02005e20
    mov r0, #0x1
    bl func_02005ca0
    mov r0, #0x2
    bl func_02005ca0
    bl func_ov000_021ab8f8
    mov r0, r5
    add sp, sp, #0x24
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov000_021c73e4
_LIT1: .word data_ov012_021cc6a0
_LIT2: .word data_ov012_021cc6dc
_LIT3: .word data_021040ac
_LIT4: .word data_ov012_021cc120
_LIT5: .word 0x00000515
_LIT6: .word data_ov012_021cc60c
_LIT7: .word 0x00000525
_LIT8: .word 0x00000526
_LIT9: .word 0x00000527
_LIT10: .word data_ov012_021cc628
_LIT11: .word data_ov012_021cc640
_LIT12: .word data_02102c64
_LIT13: .word data_ov012_021cc658
_LIT14: .word data_ov012_021cc674
