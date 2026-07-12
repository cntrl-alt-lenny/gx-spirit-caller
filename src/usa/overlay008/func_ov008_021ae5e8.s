; func_ov008_021ae5e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_02104e6c
        .extern data_ov008_021b2660
        .extern data_ov008_021b267c
        .extern data_ov008_021b2680
        .extern data_ov008_021b2684
        .extern data_ov008_021b2ca0
        .extern data_ov008_021b2ca8
        .extern data_ov008_021b2cac
        .extern data_ov008_021b2cb4
        .extern func_02006160
        .extern func_02006178
        .extern func_020371b8
        .extern func_ov008_021ac128
        .extern func_ov008_021ad96c
        .extern func_ov008_021adb20
        .global func_ov008_021ae5e8
        .arm
func_ov008_021ae5e8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_6b0
    bl func_02006160
    cmp r0, #0x0
    beq .L_11c
    ldr r0, _LIT1
    ldr r1, [r0, #0x55c]
    cmp r1, #0x0
    beq .L_80
    ldr r0, _LIT2
    mov r1, #0x34
    ldrh r3, [r0, #0x6]
    ldr r2, _LIT0
    mov r0, #0x42
    mov r3, r3, lsl #0x18
    mov r3, r3, lsr #0x18
    mul ip, r3, r1
    ldr r3, [r2, #0xc]
    ldr r1, _LIT3
    ldr r4, _LIT4
    str r3, [r1, ip]
    ldr r5, [r2, #0x10]
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    str r5, [r4, ip]
    bl func_020371b8
    mov r0, #0x4
    ldmia sp!, {r3, r4, r5, pc}
.L_80:
    ldr r0, [r0, #0x560]
    cmp r0, #0x0
    beq .L_6b0
    ldr r0, _LIT5
    ldr r2, _LIT0
    ldr r1, [r0, #0xa60]
    ldr r0, [r2, #0x18]
    cmp r0, r1
    bls .L_c0
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x6
    ldmia sp!, {r3, r4, r5, pc}
.L_c0:
    cmp r0, #0x0
    ble .L_6b0
    cmp r0, r1
    bhi .L_6b0
    ldr r1, _LIT2
    ldr r3, [r2, #0xc]
    ldrh r4, [r1, #0x6]
    mov r1, #0x34
    mov r0, #0x3a
    mov r4, r4, lsl #0x18
    mov r4, r4, lsr #0x18
    mul ip, r4, r1
    ldr r1, _LIT3
    ldr r4, _LIT4
    str r3, [r1, ip]
    ldr r5, [r2, #0x10]
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    str r5, [r4, ip]
    bl func_020371b8
    mov r0, #0x5
    ldmia sp!, {r3, r4, r5, pc}
.L_11c:
    bl func_02006178
    cmp r0, #0x0
    beq .L_130
    bl func_ov008_021adb20
    b .L_6b0
.L_130:
    ldr ip, _LIT0
    mov r2, #0x0
    ldr r0, _LIT6
    str r2, [ip, #0x14]
    ldrh r1, [r0, #0x54]
    tst r1, #0x1
    beq .L_1f8
    ldrh r1, [ip, #0x4]
    ldr r3, _LIT7
    mov r4, #0x1
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x10
    add r0, r0, r0, lsl #0x2
    add r2, r0, r1, lsr #0x18
    mov r0, r2, asr #0x4
    add r0, r2, r0, lsr #0x1b
    mov r5, r0, asr #0x5
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1b
    ldr r2, [r3, r5, lsl #0x2]
    add r1, r1, r0, ror #0x1b
    tst r2, r4, lsl r1
    beq .L_1bc
    mvn r0, r4, lsl r1
    mov r1, r2
    and r0, r1, r0
    str r0, [r3, r5, lsl #0x2]
    bl func_ov008_021ad96c
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, r4
    bl func_020371b8
    b .L_6b0
.L_1bc:
    mov r0, r2
    orr r0, r0, r4, lsl r1
    str r0, [r3, r5, lsl #0x2]
    bl func_ov008_021ad96c
    ldr r0, _LIT1
    mov r2, #0x0
    ldr r1, [r0, #0x638]
    mov r3, #0x1
    cmp r1, #0x0
    addeq r1, r1, #0x1
    streq r1, [r0, #0x638]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
    b .L_6b0
.L_1f8:
    ldrh r0, [r0, #0x56]
    tst r0, #0x20
    beq .L_2a4
    ldrh r1, [ip, #0x4]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x5
    bcs .L_260
    cmp r0, #0x0
    biceq r0, r1, #0xff00
    orreq r0, r0, #0x400
    beq .L_244
    add r0, r0, #0xff
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
.L_244:
    strh r0, [ip, #0x4]
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_6b0
.L_260:
    biceq r0, r1, #0xff00
    orreq r0, r0, #0x900
    beq .L_288
    add r0, r0, #0xff
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
.L_288:
    strh r0, [ip, #0x4]
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_6b0
.L_2a4:
    tst r0, #0x10
    beq .L_350
    ldrh r1, [ip, #0x4]
    ldr lr, _LIT8
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x18
    add r4, r0, #0x1
    cmp r0, #0x5
    mov r0, r4, lsr #0x1f
    bcs .L_30c
    smull r3, r5, lr, r4
    add r5, r0, r5, asr #0x1
    mov lr, #0x5
    smull r0, r3, lr, r5
    sub r5, r4, r0
    mov r0, r5, lsl #0x10
    mov r3, r0, lsr #0x10
    bic r4, r1, #0xff00
    mov r1, r3, lsl #0x18
    orr r4, r4, r1, lsr #0x10
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r3, #0x1
    strh r4, [ip, #0x4]
    bl func_020371b8
    b .L_6b0
.L_30c:
    smull r3, r5, lr, r4
    add r5, r0, r5, asr #0x1
    mov lr, #0x5
    smull r0, r3, lr, r5
    sub r5, r4, r0
    add r0, r5, #0x5
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    bic r4, r1, #0xff00
    mov r1, r3, lsl #0x18
    orr r4, r4, r1, lsr #0x10
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r3, #0x1
    strh r4, [ip, #0x4]
    bl func_020371b8
    b .L_6b0
.L_350:
    tst r0, #0x40
    beq .L_3f8
    ldrh r3, [ip, #0x4]
    mov r0, r3, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x5
    bcc .L_3ac
    ldr ip, _LIT9
    mov r0, #0x38
    ldrh r5, [ip]
    sub r1, r0, #0x39
    mov r3, #0x1
    mov r4, r5, lsl #0x10
    mov r4, r4, lsr #0x18
    sub r4, r4, #0x5
    mov lr, r4, lsl #0x10
    mov r4, lr, lsr #0x10
    bic r5, r5, #0xff00
    mov r4, r4, lsl #0x18
    orr r4, r5, r4, lsr #0x10
    strh r4, [ip]
    bl func_020371b8
    b .L_6b0
.L_3ac:
    mov r0, r3, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_6b0
    add r0, r0, #0xff
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0x38
    bic r3, r3, #0xff
    and r1, r1, #0xff
    orr r4, r3, r1
    sub r1, r0, #0x39
    mov r3, #0x1
    strh r4, [ip, #0x4]
    bl func_020371b8
    ldr r1, _LIT10
    ldr r0, _LIT0
    strh r1, [r0, #0x8]
    b .L_6b0
.L_3f8:
    tst r0, #0x80
    beq .L_4ac
    ldrh r4, [ip, #0x4]
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x5
    bcs .L_454
    ldr ip, _LIT9
    mov r0, #0x38
    ldrh r5, [ip]
    sub r1, r0, #0x39
    mov r3, #0x1
    mov r4, r5, lsl #0x10
    mov r4, r4, lsr #0x18
    add r4, r4, #0x5
    mov lr, r4, lsl #0x10
    mov r4, lr, lsr #0x10
    bic r5, r5, #0xff00
    mov r4, r4, lsl #0x18
    orr r4, r5, r4, lsr #0x10
    strh r4, [ip]
    bl func_020371b8
    b .L_6b0
.L_454:
    ldrh r0, [ip, #0x6]
    mov r1, r4, lsl #0x18
    mov r3, r1, lsr #0x18
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    sub r0, r0, #0x2
    cmp r0, r1, lsr #0x18
    ble .L_6b0
    add r0, r3, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r4, #0xff
    and r0, r0, #0xff
    orr r1, r1, r0
    mov r0, #0x38
    strh r1, [ip, #0x4]
    mov r4, #0x4
    sub r1, r0, #0x39
    mov r3, #0x1
    strh r4, [ip, #0x8]
    bl func_020371b8
    b .L_6b0
.L_4ac:
    tst r1, #0x2
    beq .L_4fc
    ldr r1, _LIT2
    ldr r3, [ip, #0xc]
    ldrh r4, [r1, #0x6]
    mov r1, #0x34
    mov r0, #0x42
    mov r4, r4, lsl #0x18
    mov r4, r4, lsr #0x18
    mul lr, r4, r1
    ldr r1, _LIT3
    ldr r4, _LIT4
    str r3, [r1, lr]
    ldr r5, [ip, #0x10]
    sub r1, r0, #0x43
    mov r3, #0x1
    str r5, [r4, lr]
    bl func_020371b8
    mov r0, #0x4
    ldmia sp!, {r3, r4, r5, pc}
.L_4fc:
    tst r1, #0x200
    beq .L_598
    ldr r1, _LIT2
    mov r0, #0x34
    ldrh r3, [r1, #0x6]
    ldr r1, _LIT11
    mov r3, r3, lsl #0x18
    mov r3, r3, lsr #0x18
    mul r0, r3, r0
    ldrh lr, [r1, r0]
    cmp lr, #0x0
    ble .L_568
    ldr r5, _LIT12
    mov r3, #0x1
.L_534:
    mov r0, r2, asr #0x4
    add r0, r2, r0, lsr #0x1b
    mov r0, r0, asr #0x5
    add ip, r5, r0, lsl #0x2
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1b
    ldr r4, [ip, #0xc]
    add r0, r1, r0, ror #0x1b
    orr r0, r4, r3, lsl r0
    add r2, r2, #0x1
    str r0, [ip, #0xc]
    cmp r2, lr
    blt .L_534
.L_568:
    bl func_ov008_021ad96c
    ldr r0, _LIT1
    mov r2, #0x0
    ldr r1, [r0, #0x638]
    mov r3, #0x1
    cmp r1, #0x0
    addeq r1, r1, #0x1
    streq r1, [r0, #0x638]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
    b .L_6b0
.L_598:
    tst r1, #0x100
    beq .L_624
    ldr r1, _LIT2
    mov r0, #0x34
    ldrh r3, [r1, #0x6]
    ldr r1, _LIT11
    mov r3, r3, lsl #0x18
    mov r3, r3, lsr #0x18
    mul r0, r3, r0
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    ble .L_608
    ldr lr, _LIT12
    mov r4, #0x1
.L_5d0:
    mov r1, r2, asr #0x4
    add r1, r2, r1, lsr #0x1b
    mov ip, r2, lsr #0x1f
    rsb r3, ip, r2, lsl #0x1b
    mov r1, r1, asr #0x5
    add r5, lr, r1, lsl #0x2
    add r1, ip, r3, ror #0x1b
    add r2, r2, #0x1
    mvn r1, r4, lsl r1
    ldr r3, [r5, #0xc]
    cmp r2, r0
    and r1, r3, r1
    str r1, [r5, #0xc]
    blt .L_5d0
.L_608:
    bl func_ov008_021ad96c
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_6b0
.L_624:
    tst r1, #0x400
    beq .L_6b0
    ldr r0, _LIT5
    ldr r1, [ip, #0x18]
    ldr r0, [r0, #0xa60]
    cmp r1, r0
    bls .L_658
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x6
    ldmia sp!, {r3, r4, r5, pc}
.L_658:
    cmp r1, #0x0
    ble .L_6b0
    cmp r1, r0
    bhi .L_6b0
    ldr r1, _LIT2
    ldr r3, [ip, #0xc]
    ldrh lr, [r1, #0x6]
    mov r1, #0x34
    mov r0, #0x3a
    mov lr, lr, lsl #0x18
    mov lr, lr, lsr #0x18
    mul r4, lr, r1
    ldr r1, _LIT3
    ldr lr, _LIT4
    str r3, [r1, r4]
    ldr ip, [ip, #0x10]
    sub r1, r0, #0x3b
    mov r3, #0x1
    str ip, [lr, r4]
    bl func_020371b8
    mov r0, #0x5
    ldmia sp!, {r3, r4, r5, pc}
.L_6b0:
    bl func_ov008_021ac128
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov008_021b2ca8
_LIT1: .word data_ov008_021b2660
_LIT2: .word data_ov008_021b2ca0
_LIT3: .word data_ov008_021b2680
_LIT4: .word data_ov008_021b2684
_LIT5: .word data_02104e6c
_LIT6: .word data_02104acc
_LIT7: .word data_ov008_021b2cb4
_LIT8: .word 0x66666667
_LIT9: .word data_ov008_021b2cac
_LIT10: .word 0x0000fffc
_LIT11: .word data_ov008_021b267c
_LIT12: .word data_ov008_021b2ca8
