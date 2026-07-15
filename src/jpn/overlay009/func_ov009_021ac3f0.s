; func_ov009_021ac3f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov009_021ad9b0
        .extern data_ov009_021ad9bc
        .extern data_ov009_021ad9e0
        .extern data_ov009_021ad9ec
        .extern data_ov009_021adaec
        .extern data_ov009_021adb20
        .extern func_02006148
        .extern func_02006160
        .extern func_02006190
        .extern func_020221e0
        .extern func_020221f8
        .extern func_0202cda4
        .extern func_0202cdd0
        .extern func_020371b8
        .extern func_ov009_021aa3c8
        .extern func_ov009_021aa4bc
        .extern func_ov009_021aa4f8
        .extern func_ov009_021aaa0c
        .extern func_ov009_021ab66c
        .extern func_ov009_021ab6d4
        .extern func_ov009_021ac378
        .extern func_ov009_021acd80
        .extern func_ov009_021ace3c
        .extern func_ov009_021acf18
        .global func_ov009_021ac3f0
        .arm
func_ov009_021ac3f0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r5, r0
    ldr r2, [r5, #0x28]
    ldrh r3, [r1, #0x56]
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_96c
    b .L_30
    b .L_7d4
    b .L_8dc
    b .L_92c
.L_30:
    ldrh r2, [r1, #0x52]
    cmp r2, #0x0
    beq .L_440
    ldrh r1, [r1, #0x54]
    tst r1, #0x1
    beq .L_2a0
    mov r2, #0x0
    str r2, [r5, #0x3c]
    ldr r1, [r5, #0x38]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_96c
    b .L_1d4
    b .L_164
    b .L_e8
    b .L_70
.L_70:
    ldr r0, [r5, #0x34]
    mov r3, #0x1
    cmp r0, #0x0
    ble .L_d8
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
    ldr r0, [r5, #0x1c]
    mov r1, #0xf
    mov r0, r0, lsl #0x2
    mvn r1, r1, lsl r0
    ldr r2, [r5, #0x18]
    mov r0, r5
    and r1, r2, r1
    str r1, [r5, #0x18]
    bl func_ov009_021ace3c
    ldr r1, [r5, #0x1c]
    ldr r2, [r5, #0x18]
    mov r1, r1, lsl #0x2
    orr r0, r2, r0, lsl r1
    str r0, [r5, #0x18]
    ldr r0, [r5, #0x1c]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r5, #0x1c]
    b .L_96c
.L_d8:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_020371b8
    b .L_96c
.L_e8:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r5, #0x34]
    cmp r0, #0x0
    ble .L_150
    ldr r0, [r5, #0x1c]
    mov r1, #0xf
    mov r0, r0, lsl #0x2
    mvn r1, r1, lsl r0
    ldr r2, [r5, #0x18]
    mov r0, r5
    and r1, r2, r1
    str r1, [r5, #0x18]
    bl func_ov009_021ace3c
    ldr r1, [r5, #0x1c]
    ldr r2, [r5, #0x18]
    mov r1, r1, lsl #0x2
    orr r0, r2, r0, lsl r1
    str r0, [r5, #0x18]
    ldr r0, [r5, #0x1c]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r5, #0x1c]
    b .L_96c
.L_150:
    mvn r0, #0x0
    str r0, [r5, #0x18]
    mov r0, #0x7
    str r0, [r5, #0x1c]
    b .L_96c
.L_164:
    ldr r1, [r5, #0x34]
    cmp r1, #0x0
    ble .L_1cc
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r5, #0x1c]
    mov r1, #0xf
    mov r0, r0, lsl #0x2
    mvn r1, r1, lsl r0
    ldr r2, [r5, #0x18]
    mov r0, r5
    and r1, r2, r1
    str r1, [r5, #0x18]
    bl func_ov009_021ace3c
    ldr r1, [r5, #0x1c]
    ldr r2, [r5, #0x18]
    mov r1, r1, lsl #0x2
    orr r0, r2, r0, lsl r1
    str r0, [r5, #0x18]
    ldr r0, [r5, #0x1c]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r5, #0x1c]
    b .L_96c
.L_1cc:
    bl func_ov009_021acf18
    ldmia sp!, {r3, r4, r5, pc}
.L_1d4:
    ldr r1, [r5, #0x34]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_96c
    b .L_298
    b .L_1f4
    b .L_250
    b .L_274
.L_1f4:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r5, #0x1c]
    mov r1, #0xf
    mov r0, r0, lsl #0x2
    mvn r1, r1, lsl r0
    ldr r2, [r5, #0x18]
    mov r0, r5
    and r1, r2, r1
    str r1, [r5, #0x18]
    bl func_ov009_021ace3c
    ldr r1, [r5, #0x1c]
    ldr r2, [r5, #0x18]
    mov r1, r1, lsl #0x2
    orr r0, r2, r0, lsl r1
    str r0, [r5, #0x18]
    ldr r0, [r5, #0x1c]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r5, #0x1c]
    b .L_96c
.L_250:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r5, #0x1c]
    cmp r0, #0x7
    addlt r0, r0, #0x1
    strlt r0, [r5, #0x1c]
    b .L_96c
.L_274:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r5, #0x1c]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r5, #0x1c]
    b .L_96c
.L_298:
    bl func_ov009_021acf18
    ldmia sp!, {r3, r4, r5, pc}
.L_2a0:
    tst r3, #0x200
    beq .L_2d4
    ldr r1, [r5, #0x1c]
    cmp r1, #0x7
    bge .L_96c
    mov r0, #0x38
    add r4, r1, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r5, #0x1c]
    bl func_020371b8
    b .L_96c
.L_2d4:
    tst r3, #0x100
    beq .L_308
    ldr r1, [r5, #0x1c]
    cmp r1, #0x0
    ble .L_96c
    mov r0, #0x38
    sub r4, r1, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r5, #0x1c]
    bl func_020371b8
    b .L_96c
.L_308:
    tst r1, #0x2
    beq .L_368
    ldr r0, [r5, #0x1c]
    mov r2, #0x0
    cmp r0, #0x7
    mov r3, #0x1
    bne .L_34c
    mov r0, #0x42
    sub r1, r0, #0x43
    bl func_020371b8
    mov r0, #0x0
    bl func_020221f8
    orr r1, r0, #0x1
    mov r0, #0x0
    bl func_020221e0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_34c:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_020371b8
    ldr r0, [r5, #0x1c]
    add r0, r0, #0x1
    str r0, [r5, #0x1c]
    b .L_96c
.L_368:
    tst r3, #0x20
    beq .L_39c
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r5, #0x34]
    subs r0, r0, #0x1
    str r0, [r5, #0x34]
    movmi r0, #0x3
    strmi r0, [r5, #0x34]
    b .L_96c
.L_39c:
    tst r3, #0x10
    beq .L_3d4
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r5, #0x34]
    add r0, r0, #0x1
    str r0, [r5, #0x34]
    cmp r0, #0x4
    movge r0, #0x0
    strge r0, [r5, #0x34]
    b .L_96c
.L_3d4:
    tst r3, #0x40
    beq .L_40c
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r5, #0x38]
    add r0, r0, #0x1
    str r0, [r5, #0x38]
    cmp r0, #0x4
    movge r0, #0x0
    strge r0, [r5, #0x38]
    b .L_96c
.L_40c:
    tst r3, #0x80
    beq .L_96c
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r5, #0x38]
    subs r0, r0, #0x1
    str r0, [r5, #0x38]
    movmi r0, #0x3
    strmi r0, [r5, #0x38]
    b .L_96c
.L_440:
    bl func_02006190
    cmp r0, #0x0
    beq .L_454
    mov r0, r5
    bl func_ov009_021acd80
.L_454:
    ldr r1, _LIT1
    mov r0, r5
    bl func_ov009_021ac378
    cmp r0, #0x0
    beq .L_4a4
    bl func_02006148
    cmp r0, #0x0
    beq .L_4a4
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x0
    bl func_020221f8
    orr r1, r0, #0x1
    mov r0, #0x0
    bl func_020221e0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_4a4:
    ldr r1, _LIT2
    mov r0, r5
    bl func_ov009_021ac378
    cmp r0, #0x0
    beq .L_500
    ldr r0, [r5, #0x30]
    add r0, r0, #0x1
    str r0, [r5, #0x30]
    cmp r0, #0x14
    blt .L_500
    ldr r0, [r5, #0x30]
    sub r0, r0, #0x6
    str r0, [r5, #0x30]
    ldr r1, [r5, #0x1c]
    cmp r1, #0x7
    bge .L_500
    mov r0, #0x38
    add r4, r1, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r5, #0x1c]
    bl func_020371b8
.L_500:
    ldr r1, _LIT3
    mov r0, r5
    bl func_ov009_021ac378
    cmp r0, #0x0
    beq .L_55c
    ldr r0, [r5, #0x30]
    add r0, r0, #0x1
    str r0, [r5, #0x30]
    cmp r0, #0x14
    blt .L_55c
    ldr r0, [r5, #0x30]
    sub r0, r0, #0x6
    str r0, [r5, #0x30]
    ldr r1, [r5, #0x1c]
    cmp r1, #0x0
    ble .L_55c
    mov r0, #0x38
    sub r4, r1, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r5, #0x1c]
    bl func_020371b8
.L_55c:
    bl func_02006160
    cmp r0, #0x0
    beq .L_96c
    ldr r0, [r5, #0x3c]
    cmp r0, #0x0
    bne .L_96c
    mov r2, #0x0
    str r2, [r5, #0x30]
    ldr r0, [r5, #0x38]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_96c
    b .L_704
    b .L_690
    b .L_614
    b .L_59c
.L_59c:
    ldr r0, [r5, #0x34]
    mov r3, #0x1
    cmp r0, #0x0
    ble .L_604
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
    ldr r0, [r5, #0x1c]
    mov r1, #0xf
    mov r0, r0, lsl #0x2
    mvn r1, r1, lsl r0
    ldr r2, [r5, #0x18]
    mov r0, r5
    and r1, r2, r1
    str r1, [r5, #0x18]
    bl func_ov009_021ace3c
    ldr r1, [r5, #0x1c]
    ldr r2, [r5, #0x18]
    mov r1, r1, lsl #0x2
    orr r0, r2, r0, lsl r1
    str r0, [r5, #0x18]
    ldr r0, [r5, #0x1c]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r5, #0x1c]
    b .L_96c
.L_604:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_020371b8
    b .L_96c
.L_614:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r5, #0x34]
    cmp r0, #0x0
    ble .L_67c
    ldr r0, [r5, #0x1c]
    mov r1, #0xf
    mov r0, r0, lsl #0x2
    mvn r1, r1, lsl r0
    ldr r2, [r5, #0x18]
    mov r0, r5
    and r1, r2, r1
    str r1, [r5, #0x18]
    bl func_ov009_021ace3c
    ldr r1, [r5, #0x1c]
    ldr r2, [r5, #0x18]
    mov r1, r1, lsl #0x2
    orr r0, r2, r0, lsl r1
    str r0, [r5, #0x18]
    ldr r0, [r5, #0x1c]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r5, #0x1c]
    b .L_96c
.L_67c:
    mvn r0, #0x0
    str r0, [r5, #0x18]
    mov r0, #0x7
    str r0, [r5, #0x1c]
    b .L_96c
.L_690:
    ldr r0, [r5, #0x34]
    cmp r0, #0x0
    ble .L_6f8
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r5, #0x1c]
    mov r1, #0xf
    mov r0, r0, lsl #0x2
    mvn r1, r1, lsl r0
    ldr r2, [r5, #0x18]
    mov r0, r5
    and r1, r2, r1
    str r1, [r5, #0x18]
    bl func_ov009_021ace3c
    ldr r1, [r5, #0x1c]
    ldr r2, [r5, #0x18]
    mov r1, r1, lsl #0x2
    orr r0, r2, r0, lsl r1
    str r0, [r5, #0x18]
    ldr r0, [r5, #0x1c]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r5, #0x1c]
    b .L_96c
.L_6f8:
    mov r0, r5
    bl func_ov009_021acf18
    ldmia sp!, {r3, r4, r5, pc}
.L_704:
    ldr r0, [r5, #0x34]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_96c
    b .L_7c8
    b .L_724
    b .L_780
    b .L_7a4
.L_724:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r5, #0x1c]
    mov r1, #0xf
    mov r0, r0, lsl #0x2
    mvn r1, r1, lsl r0
    ldr r2, [r5, #0x18]
    mov r0, r5
    and r1, r2, r1
    str r1, [r5, #0x18]
    bl func_ov009_021ace3c
    ldr r1, [r5, #0x1c]
    ldr r2, [r5, #0x18]
    mov r1, r1, lsl #0x2
    orr r0, r2, r0, lsl r1
    str r0, [r5, #0x18]
    ldr r0, [r5, #0x1c]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r5, #0x1c]
    b .L_96c
.L_780:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r5, #0x1c]
    cmp r0, #0x7
    addlt r0, r0, #0x1
    strlt r0, [r5, #0x1c]
    b .L_96c
.L_7a4:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r5, #0x1c]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r5, #0x1c]
    b .L_96c
.L_7c8:
    mov r0, r5
    bl func_ov009_021acf18
    ldmia sp!, {r3, r4, r5, pc}
.L_7d4:
    ldr r0, _LIT4
    bl func_ov009_021aa4f8
    ldr r1, _LIT5
    mov r4, r0
    ldr r0, [r1, #0x4]
    cmp r0, #0x80
    bne .L_804
    mov r0, #0x98
    sub r1, r0, #0x99
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_804:
    ldr ip, _LIT5
    ldr r0, [ip, #0x4]
    cmp r0, #0x100
    bne .L_854
    ldr r0, [r5]
    mov r2, #0x0
    cmp r0, #0x0
    mov r3, #0x1
    ble .L_840
    mov r0, #0x99
    mov lr, #0x2
    sub r1, r0, #0x9a
    str lr, [ip]
    bl func_020371b8
    b .L_854
.L_840:
    mov r0, #0x9a
    mov lr, #0x3
    sub r1, r0, #0x9b
    str lr, [ip]
    bl func_020371b8
.L_854:
    ldr r0, _LIT5
    ldr r2, [r0, #0x4]
    cmp r2, #0x178
    ldreq r0, _LIT4
    moveq r1, #0x1
    streq r1, [r0, #0x4]
    cmp r2, #0x180
    ble .L_96c
    cmp r4, #0x0
    beq .L_96c
    ldr r0, [r5]
    mov r1, #0x1
    cmp r0, #0x0
    ble .L_8c8
    ldr r0, _LIT5
    bl func_ov009_021ab6d4
    ldr r1, [r5, #0x20]
    ldr r0, _LIT5
    mov r2, #0x1
    bl func_ov009_021ab66c
    ldr r0, _LIT4
    mov r1, #0x0
    bl func_ov009_021aa3c8
    mov r0, #0x5f
    sub r1, r0, #0x60
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_8d0
.L_8c8:
    ldr r0, _LIT4
    bl func_ov009_021aa3c8
.L_8d0:
    mov r0, #0x2
    str r0, [r5, #0x28]
    b .L_96c
.L_8dc:
    bl func_0202cda4
    cmp r0, #0x0
    beq .L_90c
    ldr r1, _LIT6
    mov r0, r5
    bl func_ov009_021ac378
    cmp r0, #0x0
    beq .L_90c
    bl func_02006148
    cmp r0, #0x0
    beq .L_90c
    bl func_0202cdd0
.L_90c:
    ldr r0, _LIT4
    bl func_ov009_021aa4f8
    cmp r0, #0x0
    movne r0, #0x3
    strne r0, [r5, #0x28]
    ldr r0, _LIT4
    bl func_ov009_021aaa0c
    b .L_96c
.L_92c:
    ldr r0, _LIT4
    bl func_ov009_021aa4bc
    cmp r0, #0x0
    beq .L_96c
    ldr r0, _LIT5
    mov r1, #0x0
    str r1, [r0, #0x4]
    str r1, [r0]
    bl func_ov009_021ab6d4
    ldr r0, _LIT4
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x7
    strne r0, [r5, #0x1c]
    mov r0, #0x0
    str r0, [r5, #0x28]
.L_96c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104acc
_LIT1: .word data_ov009_021ad9e0
_LIT2: .word data_ov009_021ad9b0
_LIT3: .word data_ov009_021ad9bc
_LIT4: .word data_ov009_021adaec
_LIT5: .word data_ov009_021adb20
_LIT6: .word data_ov009_021ad9ec
