; func_ov010_021b5c88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_02104e6c
        .extern data_021066f4
        .extern data_ov010_021b90b4
        .extern data_ov010_021b9160
        .extern data_ov010_021b9170
        .extern data_ov010_021b9384
        .extern func_02006178
        .extern func_0202c8e8
        .extern func_0202c96c
        .extern func_0202cda4
        .extern func_0202cdd0
        .extern func_0202d94c
        .extern func_0202d9a4
        .extern func_020371b8
        .extern func_0207eb80
        .extern func_0207ecac
        .extern func_0207ef74
        .extern func_0207fc40
        .extern func_ov005_021ab180
        .extern func_ov005_021ab194
        .extern func_ov005_021ab200
        .extern func_ov005_021ab238
        .extern func_ov005_021ab2a4
        .extern func_ov005_021ab2d4
        .extern func_ov005_021ab5cc
        .extern func_ov005_021ac8c8
        .extern func_ov010_021b228c
        .extern func_ov010_021b22f4
        .extern func_ov010_021b2350
        .extern func_ov010_021b2530
        .extern func_ov010_021b2824
        .extern func_ov010_021b2cb8
        .extern func_ov010_021b2cdc
        .extern func_ov010_021b2cf8
        .extern func_ov010_021b3f3c
        .extern func_ov010_021b3f90
        .extern func_ov010_021b4220
        .extern func_ov010_021b4784
        .extern func_ov010_021b49e0
        .extern func_ov010_021b4c58
        .extern func_ov010_021b4d6c
        .extern func_ov010_021b4edc
        .extern func_ov010_021b5068
        .global func_ov010_021b5c88
        .arm
func_ov010_021b5c88:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x24
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r3, _LIT0
    ldr r2, _LIT1
    ldr r1, [sp, #0x8]
    ldr r0, _LIT2
    str r1, [sp, #0x4]
    str r3, [sp, #0x14]
    ldr r5, [r2, #0xb0]
    ldr r8, _LIT3
    bl func_0207ecac
    ldr r0, _LIT2
    bl func_0207eb80
    ldr r0, _LIT1
    ldr r0, [r0, #0xb0]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_5ac
    b .L_5ac
    b .L_568
    b .L_6c
    b .L_84
    b .L_214
    b .L_3a4
    b .L_41c
.L_6c:
    add r0, sp, #0x14
    bl func_ov010_021b4784
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
    b .L_5ac
.L_84:
    mov r0, #0x1000
    bl func_ov010_021b4edc
    cmp r0, #0x1
    bne .L_1fc
    ldr r0, [r8, #0x80]
    ldr r1, [r8, #0xe0]
    bl func_ov005_021ac8c8
    mov r6, r0
    ldr r0, [r8, #0x7c]
    mov r1, r6
    bl func_ov005_021ab238
    mov r9, r0
    ldr r0, [r8, #0x2c]
    bl func_ov010_021b228c
    ldr r5, _LIT4
    mov r4, r6, asr #0x5
    ldr r3, [r5, r4, lsl #0x2]
    and r1, r6, #0x1f
    mov r2, #0x1
    orr r1, r3, r2, lsl r1
    str r0, [r8, #0x30]
    str r1, [r5, r4, lsl #0x2]
    cmp r9, #0x0
    beq .L_1b8
.L_e4:
    ldr r0, [r8, #0x7c]
    mov r3, #0x0
    add r2, sp, #0x18
    mov r1, r9
    str r3, [sp]
    bl func_ov005_021ab194
    movs sl, r0
    beq .L_174
    mov r6, #0x1
    ldr r5, _LIT5
    mov r4, #0x0
    add fp, sp, #0x18
    mov r7, r6
.L_118:
    ldr r0, [r8, #0x7c]
    mov r1, sl
    mov r2, r7
    bl func_ov005_021ab2a4
    cmp r0, #0x0
    beq .L_160
    mov r0, sl, asr #0x5
    add r0, r5, r0, lsl #0x2
    add r0, r0, #0x1000
    ldr r0, [r0, #0x888]
    and r1, sl, #0x1f
    tst r0, r6, lsl r1
    movne r0, r6
    moveq r0, r4
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp]
    beq .L_174
.L_160:
    ldr r0, [r8, #0x7c]
    mov r1, fp
    bl func_ov005_021ab200
    movs sl, r0
    bne .L_118
.L_174:
    ldr r0, [sp]
    cmp r0, #0x0
    bne .L_1a4
    ldr r1, _LIT5
    mov r0, r9, asr #0x5
    add r0, r1, r0, lsl #0x2
    add r0, r0, #0x1000
    ldr r3, [r0, #0x888]
    and r1, r9, #0x1f
    mov r2, #0x1
    orr r1, r3, r2, lsl r1
    str r1, [r0, #0x888]
.L_1a4:
    ldr r0, [r8, #0x7c]
    mov r1, r9
    bl func_ov005_021ab238
    movs r9, r0
    bne .L_e4
.L_1b8:
    mov r0, #0x4
    mov r1, #0x0
    mov r2, #0x800
    bl func_ov010_021b2cb8
    ldr r0, _LIT1
    mov r1, #0x10000
    str r1, [r0, #0xb8]
    str r1, [r0, #0xb4]
    ldr r0, [r8, #0x2c]
    add r2, sp, #0x14
    add r1, r8, #0x10
    bl func_ov010_021b2530
    ldr r1, [sp, #0x4]
    mov r5, #0x4
    add r0, r1, r0
    str r0, [sp, #0x4]
    b .L_5ac
.L_1fc:
    add r0, sp, #0x14
    bl func_ov010_021b4784
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
    b .L_5ac
.L_214:
    ldr r1, [r8, #0x8]
    ldr r0, [r8, #0xc]
    cmp r1, r0
    bne .L_2dc
    ldr r0, [r8, #0x80]
    ldr r1, [r8, #0xe0]
    bl func_ov005_021ac8c8
    mov r6, r0
    ldr r0, [r8, #0x7c]
    mov r1, r6
    bl func_ov005_021ab2d4
    ldr sl, _LIT6
    mov r4, r0
    ldrh r2, [sl]
    mov r0, r6
    add r1, r8, #0x170
    strh r2, [sp, #0xe]
    ldrh r3, [sp, #0xe]
    ldrh r2, [sl]
    mov fp, #0x1dc0000
    orr r3, r3, #0x80
    strh r3, [sp, #0x12]
    ldrh r7, [sp, #0x12]
    and ip, r2, #0x43
    mov r2, r7, lsl #0x12
    mov r9, r2, lsr #0x1f
    mov r2, r7, lsl #0x1a
    mov r6, r2, lsr #0x1c
    mov r2, r7, lsl #0x13
    mov r3, r2, lsr #0x1b
    mov r2, r7, lsl #0x18
    mov r7, r7, lsl #0x10
    mov r7, r7, lsr #0x1e
    mov r2, r2, lsr #0x1f
    orr r7, ip, r7, lsl #0xe
    orr r2, r7, r2, lsl #0x7
    orr r2, r2, r3, lsl #0x8
    orr r2, r2, r6, lsl #0x2
    orr r2, r2, r9, lsl #0xd
    strh r2, [sl]
    str fp, [sl, #0x8]
    bl func_ov010_021b4220
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0xfa0
    ldr r0, [r8, #0x220]
    orrge r0, r0, #0x20
    strge r0, [r8, #0x220]
    biclt r0, r0, #0x20
    strlt r0, [r8, #0x220]
.L_2dc:
    ldr r0, [r8, #0x220]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_358
    ldr r0, [r8, #0x80]
    ldr r1, [r8, #0xe0]
    bl func_ov005_021ac8c8
    mov r4, r0
    ldr r0, [r8, #0x7c]
    mov r1, r4
    bl func_ov005_021ab238
    ldr r0, [r8, #0x7c]
    mov r1, r4
    bl func_ov005_021ab2d4
    mov r0, r0, lsl #0x10
    ldr r2, [r8, #0xc]
    ldr r1, [r8, #0x8]
    mov r0, r0, lsr #0x10
    cmp r2, r1
    bne .L_334
    bl func_ov010_021b2cf8
.L_334:
    bl func_0202d9a4
    bl func_0202c8e8
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    bne .L_358
    ldr r0, [r8, #0x220]
    bic r0, r0, #0x20
    orr r0, r0, #0x40
    str r0, [r8, #0x220]
.L_358:
    add r0, sp, #0x14
    bl func_ov010_021b4c58
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
    mov r0, #0x1000
    bl func_ov010_021b5068
    cmp r0, #0x1
    bne .L_5ac
    ldr r0, [r8, #0x220]
    mov r0, r0, lsl #0x1a
    movs r0, r0, lsr #0x1f
    bne .L_5ac
    ldr r1, [r8, #0x2c]
    mov r5, #0x5
    ldr r0, [r1, #0x70]
    bic r0, r0, #0x2
    str r0, [r1, #0x70]
    b .L_5ac
.L_3a4:
    ldr r1, [r8, #0x220]
    mov r0, r1, lsl #0x19
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_404
    mov r0, r1, lsl #0x1c
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_3d4
    bic r0, r1, #0x8
    str r0, [r8, #0x220]
    bl func_0202cdd0
.L_3d4:
    bl func_0202d94c
    bl func_0202d9a4
    bl func_0202cda4
    cmp r0, #0x1
    bne .L_404
    add r2, sp, #0x14
    add r0, r8, #0x58
    add r1, r8, #0x10
    bl func_ov010_021b2824
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
.L_404:
    add r0, sp, #0x14
    bl func_ov010_021b4c58
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
    b .L_5ac
.L_41c:
    mov r0, #0x1000
    bl func_ov010_021b4edc
    cmp r0, #0x0
    bne .L_444
    add r0, sp, #0x14
    bl func_ov010_021b4c58
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
    b .L_5ac
.L_444:
    ldr r1, _LIT6
    ldr r0, [r8, #0x170]
    ldrh r1, [r1]
    strh r1, [sp, #0xc]
    ldrh r1, [sp, #0xc]
    strh r1, [sp, #0x10]
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r8, #0x170]
    bl func_ov010_021b3f3c
    mov r2, r0
    ldr r0, [r8, #0x2c]
    mov r1, #0x0
    bl func_ov010_021b2350
    ldr r0, [r8, #0x2c]
    ldr r1, [r8, #0x30]
    bl func_ov010_021b22f4
    add r0, sp, #0x14
    bl func_ov010_021b4784
    ldr r1, [sp, #0x4]
    mov r2, #0x10000
    add r0, r1, r0
    ldr r1, _LIT1
    str r0, [sp, #0x4]
    str r2, [r1, #0xb8]
    str r2, [r1, #0xb4]
    mov r0, #0x4
    mov r1, #0x0
    mov r2, #0x800
    bl func_ov010_021b2cb8
    mov r0, #0x4
    bl func_ov010_021b2cdc
    ldrh r0, [sp, #0x10]
    ldr r2, _LIT6
    bic r0, r0, #0x80
    strh r0, [sp, #0x10]
    ldrh r7, [sp, #0x10]
    ldrh r0, [r2]
    mov r4, r7, lsl #0x13
    mov r6, r4, lsr #0x1b
    mov r4, r7, lsl #0x18
    mov r5, r4, lsr #0x1f
    mov r4, r7, lsl #0x10
    and r3, r0, #0x43
    mov r4, r4, lsr #0x1e
    orr r3, r3, r4, lsl #0xe
    mov r0, r7, lsl #0x1a
    orr r3, r3, r5, lsl #0x7
    mov r1, r7, lsl #0x12
    mov r0, r0, lsr #0x1c
    orr r3, r3, r6, lsl #0x8
    mov r1, r1, lsr #0x1f
    orr r0, r3, r0, lsl #0x2
    orr r0, r0, r1, lsl #0xd
    strh r0, [r2]
    ldr r1, [r8, #0x220]
    ldr r0, [r8, #0x80]
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r8, #0x220]
    bl func_ov005_021ab5cc
    ldr r0, [r8, #0x220]
    mov r0, r0, lsl #0x19
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_560
    mov r0, #0x0
    bl func_0202c96c
    ldr r0, [r8, #0x220]
    bic r0, r0, #0x40
    str r0, [r8, #0x220]
.L_560:
    mov r5, #0x1
    b .L_5ac
.L_568:
    add r0, sp, #0x14
    bl func_ov010_021b4784
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
    mov r0, #0x1000
    bl func_ov010_021b5068
    cmp r0, #0x1
    bne .L_5ac
    ldr r1, [r8, #0x2c]
    mov r5, #0x2
    ldr r0, [r1, #0x70]
    bic r0, r0, #0x2
    str r0, [r1, #0x70]
    ldr r0, [r8, #0xf8]
    bic r0, r0, #0x1
    str r0, [r8, #0xf8]
.L_5ac:
    add r2, sp, #0x14
    add r0, r8, #0x34
    add r1, r8, #0x10
    bl func_ov010_021b2824
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    cmp r0, #0x0
    ble .L_5e0
    mov r2, r0, lsl #0x10
    ldr r1, _LIT0
    add r0, r8, #0x10
    mov r2, r2, lsr #0x10
    bl func_0207ef74
.L_5e0:
    bl func_02006178
    cmp r0, #0x0
    bne .L_618
    ldr r0, [r8, #0x4]
    cmp r0, #0x2
    beq .L_604
    cmp r0, #0x5
    beq .L_610
    b .L_618
.L_604:
    bl func_ov010_021b49e0
    mov r5, r0
    b .L_618
.L_610:
    bl func_ov010_021b4d6c
    mov r5, r0
.L_618:
    ldr r0, [r8, #0x220]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_6a8
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r8, #0x4]
    cmp r0, #0x2
    beq .L_658
    cmp r0, #0x5
    beq .L_688
    b .L_6a8
.L_658:
    ldr r2, [r8, #0x2c]
    mov r0, #0x1
    ldr r1, [r2, #0x70]
    str r0, [sp, #0x8]
    orr r0, r1, #0x2
    str r0, [r2, #0x70]
    ldr r0, [r8, #0xf8]
    mov r5, #0x6
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r8, #0xf8]
    b .L_6a8
.L_688:
    ldr r0, _LIT1
    mov r1, #0x10000
    str r1, [r0, #0xb8]
    str r1, [r0, #0xb4]
    ldr r0, [r8, #0x220]
    mov r5, #0x6
    bic r0, r0, #0x4
    str r0, [r8, #0x220]
.L_6a8:
    ldr r1, [r8, #0x220]
    mov r0, r1, lsl #0x1b
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_74c
    ldr r0, [r8, #0x4]
    bic r1, r1, #0x10
    str r1, [r8, #0x220]
    cmp r0, #0x2
    bne .L_74c
    ldr r4, [r8, #0xe0]
    ldr r0, [r8, #0x80]
    mov r1, r4
    bl func_ov005_021ac8c8
    mov r1, r0
    ldr r0, [r8, #0x7c]
    bl func_ov005_021ab180
    cmp r0, #0x0
    bne .L_740
    ldr r0, _LIT1
    mov r1, #0x10000
    str r1, [r0, #0xb8]
    str r1, [r0, #0xb4]
    ldr r3, [r8, #0x2c]
    mov r0, #0x3a
    ldr r2, [r3, #0x70]
    sub r1, r0, #0x3b
    orr r2, r2, #0x2
    str r2, [r3, #0x70]
    ldr r3, [r8, #0xf8]
    mov r2, #0x0
    bic r3, r3, #0x1
    orr r4, r3, #0x1
    mov r3, #0x1
    str r4, [r8, #0xf8]
    bl func_020371b8
    mov r5, #0x3
    b .L_74c
.L_740:
    mov r0, r4
    mvn r1, #0x0
    bl func_ov010_021b3f90
.L_74c:
    add r0, r8, #0x1cc
    mov r1, #0x1000
    bl func_0207fc40
    ldr r1, [r8, #0x1f8]
    ldr r0, [sp, #0x8]
    str r1, [r8, #0x1c8]
    str r5, [r8, #0x4]
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov010_021b9384
_LIT1: .word data_ov010_021b90b4
_LIT2: .word data_ov010_021b9170
_LIT3: .word data_ov010_021b9160
_LIT4: .word data_021066f4
_LIT5: .word data_02104e6c
_LIT6: .word 0x04001008
