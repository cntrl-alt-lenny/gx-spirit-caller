; func_ov010_021b71c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Fill32
        .extern Task_PostLocked
        .extern data_020c3e6c
        .extern data_02103fcc
        .extern data_02104e6c
        .extern data_02106714
        .extern data_ov000_021b1cb4
        .extern data_ov000_021b1cdc
        .extern data_ov010_021b8808
        .extern data_ov010_021b8828
        .extern data_ov010_021b8b2c
        .extern data_ov010_021b9784
        .extern data_ov010_021b9790
        .extern data_ov010_021b97a8
        .extern data_ov010_021b97cc
        .extern data_ov010_021b9964
        .extern func_02001ba8
        .extern func_02005be0
        .extern func_0200a788
        .extern func_0202ada4
        .extern func_0202c06c
        .extern func_0207f050
        .extern func_0207f338
        .extern func_0208cf48
        .extern func_0208cfd4
        .extern func_0208d050
        .extern func_02094410
        .extern func_020a690c
        .extern func_020a6a08
        .extern func_ov000_021ac9cc
        .extern func_ov005_021aae28
        .extern func_ov005_021aae8c
        .extern func_ov005_021ab01c
        .extern func_ov005_021ab180
        .extern func_ov005_021ab194
        .extern func_ov005_021ab200
        .extern func_ov005_021ab238
        .extern func_ov005_021ab24c
        .extern func_ov005_021ab274
        .extern func_ov005_021ab2a4
        .extern func_ov005_021ab2c0
        .extern func_ov005_021ab2d4
        .extern func_ov005_021ab308
        .extern func_ov005_021ac9c4
        .extern func_ov010_021b225c
        .extern func_ov010_021b2764
        .extern func_ov010_021b681c
        .extern func_ov010_021b6900
        .extern func_ov010_021b6a58
        .extern func_ov010_021b6b00
        .global func_ov010_021b71c0
        .arm
func_ov010_021b71c0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x30
    ldr r3, _LIT0
    ldr r7, _LIT1
    ldr r0, [r3]
    mov r1, r7
    bic r0, r0, #0x1f00
    str r0, [r3]
    mov r0, #0x0
    mov r2, #0x35c
    strh r0, [r3, #0x50]
    bl Fill32
    ldr r3, _LIT2
    mvn r4, #0x0
    ldr r1, _LIT3
    mov r0, #0x200
    mov r2, #0x400
    str r4, [r3, #0x1c]
    bl func_02094410
    ldr r1, _LIT4
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x4
    bl func_0208d050
    mov r0, #0x8
    bl func_0208cfd4
    mov r0, #0x80
    bl func_0208cf48
    ldr r3, _LIT5
    ldr r0, _LIT6
    ldrh r2, [r3]
    add r1, r0, #0x77
    ldr r0, _LIT7
    and r2, r2, #0x43
    orr r2, r2, #0xd10
    strh r2, [r3]
    ldrh r4, [r3, #0x2]
    mov r2, #0xff
    and r4, r4, #0x43
    orr r4, r4, #0xf00
    strh r4, [r3, #0x2]
    ldrh r4, [r3, #0x4]
    and r4, r4, #0x43
    orr r4, r4, #0x388
    orr r4, r4, #0x1c00
    strh r4, [r3, #0x4]
    ldrh r4, [r3, #0x6]
    and r4, r4, #0x43
    orr r4, r4, #0x388
    orr r4, r4, #0x1c00
    strh r4, [r3, #0x6]
    bl func_02001ba8
    ldr r0, _LIT8
    ldr r1, _LIT9
    mov r2, #0x100
    bl func_02001ba8
    ldr r0, _LIT10
    bl func_0202ada4
    ldr r0, _LIT11
    ldr r1, _LIT2
    ldr r2, [r0, #0x4]
    mov r0, #0x2
    mov r2, r2, lsl #0x1d
    mov r2, r2, lsr #0x1d
    str r2, [r1, #0x1e0]
    bl func_02005be0
    ldr r2, _LIT0
    ldr r0, _LIT12
    ldr r1, [r2]
    and r0, r1, r0
    orr r0, r0, #0x10
    orr r0, r0, #0x200000
    str r0, [r2]
    bl func_0207f338
    ldr r0, _LIT13
    mov r1, #0x0
    mov r2, #0x80
    mov r3, #0x1
    bl func_0207f050
    ldr r4, _LIT5
    mov r2, #0x0
    ldrh r3, [r4]
    ldr r0, _LIT14
    ldr r1, _LIT2
    bic r3, r3, #0x40
    strh r3, [r4]
    strb r2, [r4, #0x44]
    strb r2, [r4, #0x45]
    str r0, [r1, #0x40]
    bl func_ov010_021b225c
    ldr r0, _LIT15
    bl func_ov010_021b2764
    ldr r0, _LIT16
    ldr r1, _LIT2
    ldr r2, _LIT17
    str r0, [r1, #0x90]
    str r2, [r1, #0x94]
    ldr r1, _LIT18
    ldrh r3, [r1, #0x8]
    ldrh r2, [r1, #0xa]
    strh r3, [sp, #0x8]
    strh r2, [sp, #0xa]
    ldrh r2, [r1, #0xc]
    ldrh r1, [r1, #0xe]
    strh r2, [sp, #0xc]
    strh r1, [sp, #0xe]
    bl func_ov005_021aae28
    ldr r0, _LIT2
    ldr r1, _LIT19
    ldr r0, [r0, #0x90]
    ldr r1, [r1]
    bl func_ov005_021aae8c
    add r0, sp, #0x10
    bl func_0200a788
    ldr r1, _LIT20
    add r0, sp, #0x10
    mov r2, #0x8
    bl Copy32
    ldr r0, _LIT2
    mov fp, #0x1
    ldr r0, [r0, #0x90]
    bl func_ov005_021ab01c
    cmp r0, #0x1
    blt .L_3e0
.L_1f4:
    ldr r0, [r7, #0x84]
    mov r1, fp
    bl func_ov005_021ab2c0
    ldr r0, [r7, #0x84]
    mov r1, fp
    bl func_ov005_021ab2d4
    ldr r0, _LIT2
    mov r1, fp
    ldr r0, [r0, #0x90]
    bl func_ov005_021ab2d4
    mov r2, r0, lsl #0x10
    ldr r0, [r7, #0x84]
    mov r1, fp
    mov r5, r2, lsr #0x10
    bl func_ov005_021ab180
    cmp r0, #0x0
    bne .L_3a8
    add r0, sp, #0x10
    mov r4, r5, asr #0x5
    and r1, r5, #0x1f
    mov r6, #0x1
    mov r5, r6, lsl r1
    ldr r0, [r0, r4, lsl #0x2]
    mov r1, fp
    tst r5, r0
    ldr r0, [r7, #0x84]
    moveq r6, #0x0
    bl func_ov005_021ab238
    mov r8, r0
    cmp r6, #0x1
    bne .L_3a8
    ldr r0, [r7, #0x84]
    mov r1, fp
    mov r2, #0x1
    bl func_ov005_021ab24c
    cmp r8, #0x0
    beq .L_2b0
    mov r6, #0x1
.L_28c:
    ldr r0, [r7, #0x84]
    mov r1, r8
    mov r2, r6
    bl func_ov005_021ab24c
    ldr r0, [r7, #0x84]
    mov r1, r8
    bl func_ov005_021ab238
    movs r8, r0
    bne .L_28c
.L_2b0:
    ldr r0, [r7, #0x84]
    mov r1, fp
    bl func_ov005_021ab238
    ldr r1, _LIT11
    mov sl, r0
    add r0, r1, r4, lsl #0x2
    add r0, r0, #0x1000
    ldr r0, [r0, #0x8b0]
    mov r2, #0x8
    tst r5, r0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldr r0, [r7, #0x84]
    mov r1, fp
    bne .L_2f8
    bl func_ov005_021ab24c
    b .L_2fc
.L_2f8:
    bl func_ov005_021ab274
.L_2fc:
    cmp sl, #0x0
    beq .L_3a8
    mov r4, #0x1
    add r6, sp, #0x24
    mov r5, #0x8
.L_310:
    ldr r0, [r7, #0x84]
    mov r1, sl
    mov r2, r6
    mov r8, #0x0
    bl func_ov005_021ab194
    movs r9, r0
    beq .L_374
.L_32c:
    ldr r0, [r7, #0x84]
    mov r1, r9
    mov r2, r5
    bl func_ov005_021ab2a4
    cmp r0, #0x0
    beq .L_360
    ldr r0, [r7, #0x84]
    mov r1, r9
    mov r2, r4
    bl func_ov005_021ab2a4
    cmp r0, #0x0
    movne r8, #0x1
    bne .L_374
.L_360:
    ldr r0, [r7, #0x84]
    mov r1, r6
    bl func_ov005_021ab200
    movs r9, r0
    bne .L_32c
.L_374:
    cmp r8, #0x1
    ldr r0, [r7, #0x84]
    mov r2, #0x8
    mov r1, sl
    bne .L_390
    bl func_ov005_021ab24c
    b .L_394
.L_390:
    bl func_ov005_021ab274
.L_394:
    ldr r0, [r7, #0x84]
    mov r1, sl
    bl func_ov005_021ab238
    movs sl, r0
    bne .L_310
.L_3a8:
    ldr r0, [r7, #0x84]
    mov r1, fp
    bl func_ov005_021ab180
    cmp r0, #0x0
    ble .L_3cc
    ldr r0, [r7, #0x84]
    mov r1, fp
    mov r2, #0x2
    bl func_ov005_021ab274
.L_3cc:
    ldr r0, [r7, #0x84]
    add fp, fp, #0x1
    bl func_ov005_021ab01c
    cmp fp, r0
    ble .L_1f4
.L_3e0:
    mov r4, #0x0
    mov r5, r4
.L_3e8:
    add r0, r5, #0x3e4
    add r1, r7, r5, lsl #0x2
    add r0, r0, #0x400
    str r4, [r1, #0x210]
    bl func_0202c06c
    bl func_020a690c
    add r0, r4, r0
    add r0, r0, #0x4
    add r5, r5, #0x1
    cmp r5, #0x4d
    bic r4, r0, #0x3
    blt .L_3e8
    mov r0, r4
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r0
    mov r2, r4
    mov r0, #0x0
    str r1, [r7, #0x344]
    bl Fill32
    ldr r0, _LIT21
    mov r6, #0x0
    add r4, sp, #0x18
    ldmia r0, {r0, r1, r2}
    stmia r4, {r0, r1, r2}
    mov r5, r6
.L_454:
    ldr r0, [r4, r5, lsl #0x2]
    add r1, r7, r5, lsl #0x2
    str r6, [r1, #0x348]
    bl func_0202c06c
    bl func_020a690c
    add r0, r6, r0
    add r0, r0, #0x4
    add r5, r5, #0x1
    cmp r5, #0x3
    bic r6, r0, #0x3
    blt .L_454
    mov r0, r6
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r0
    mov r2, r6
    mov r0, #0x0
    str r1, [r7, #0x354]
    bl Fill32
    mov r4, #0x0
.L_4a8:
    add r0, r4, #0x3e4
    add r0, r0, #0x400
    bl func_0202c06c
    add r1, r7, r4, lsl #0x2
    ldr r3, [r7, #0x344]
    ldr r2, [r1, #0x210]
    mov r1, r0
    add r0, r3, r2
    bl func_020a6a08
    add r4, r4, #0x1
    cmp r4, #0x4d
    blt .L_4a8
    mov r5, #0x0
    add r4, sp, #0x18
.L_4e0:
    ldr r0, [r4, r5, lsl #0x2]
    bl func_0202c06c
    add r1, r7, r5, lsl #0x2
    ldr r3, [r7, #0x354]
    ldr r2, [r1, #0x348]
    mov r1, r0
    add r0, r3, r2
    bl func_020a6a08
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_4e0
    mov r1, #0xf
    ldr r0, _LIT22
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r0, [r7, #0x88]
    ldr r1, [r7, #0x84]
    add r2, sp, #0x8
    mov r3, #0x0
    bl func_ov005_021ab308
    ldr r2, [r7, #0x88]
    ldr r1, _LIT23
    ldrh r0, [r2, #0x5c]
    bic r0, r0, #0x3c0
    orr r0, r0, #0x80
    strh r0, [r2, #0x5c]
    ldr r0, [r7, #0x88]
    bl func_ov005_021ac9c4
    ldr r0, [r7, #0x88]
    ldr r1, _LIT24
    bl func_ov000_021ac9cc
    ldr r0, _LIT25
    ldr r0, [r0, #0xb9c]
    cmp r0, #0x0
    beq .L_660
    ldr r0, [r7, #0x84]
    mov r5, #0x0
    mov r4, #0x1
    bl func_ov005_021ab01c
    cmp r0, #0x1
    blt .L_5f8
    ldr r6, _LIT25
    ldr r8, _LIT2
.L_58c:
    ldr r0, [r7, #0x84]
    mov r1, r4
    bl func_ov005_021ab2c0
    mov r9, r0
    ldr r0, [r7, #0x84]
    mov r1, r4
    bl func_ov005_021ab2d4
    ldr r0, [r8, #0x90]
    mov r1, r4
    bl func_ov005_021ab2d4
    mov r0, r0, lsl #0x10
    cmp r9, #0x0
    mov r1, r0, lsr #0x10
    beq .L_5e4
    ldr r0, [r6, #0xb8c]
    cmp r1, r0
    bne .L_5e4
    ldr r0, [r7, #0x84]
    mov r1, r4
    bl func_ov010_021b681c
    add r5, r5, r0
    b .L_5f8
.L_5e4:
    ldr r0, [r7, #0x84]
    add r4, r4, #0x1
    bl func_ov005_021ab01c
    cmp r4, r0
    ble .L_58c
.L_5f8:
    ldr r0, [r7, #0x84]
    bl func_ov005_021ab01c
    cmp r4, r0
    bgt .L_654
    ldr r0, [r7, #0x84]
    mov r1, r4
    bl func_ov005_021ab238
    movs r6, r0
    beq .L_654
    mov r4, #0x2
.L_620:
    ldr r0, [r7, #0x84]
    mov r1, r6
    mov r2, r4
    bl func_ov005_021ab24c
    ldr r0, [r7, #0x84]
    mov r1, r6
    bl func_ov010_021b681c
    add r5, r5, r0
    ldr r0, [r7, #0x84]
    mov r1, r6
    bl func_ov005_021ab238
    movs r6, r0
    bne .L_620
.L_654:
    ldr r0, _LIT25
    mov r1, #0x0
    str r1, [r0, #0xb9c]
.L_660:
    mov r0, #0x0
    str r0, [r7]
    mov r0, #0x1
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x04001000
_LIT1: .word data_ov010_021b9790
_LIT2: .word data_ov010_021b9784
_LIT3: .word 0x07000400
_LIT4: .word 0x05000400
_LIT5: .word 0x04001008
_LIT6: .word 0x00001f88
_LIT7: .word 0x05000420
_LIT8: .word 0x050005a0
_LIT9: .word 0x00001fff
_LIT10: .word data_ov010_021b9964
_LIT11: .word data_02104e6c
_LIT12: .word 0xffcfffef
_LIT13: .word data_ov010_021b97a8
_LIT14: .word data_ov010_021b8b2c
_LIT15: .word data_ov010_021b97cc
_LIT16: .word data_ov000_021b1cb4
_LIT17: .word data_ov000_021b1cdc
_LIT18: .word data_ov010_021b8808
_LIT19: .word data_020c3e6c
_LIT20: .word data_02106714
_LIT21: .word data_ov010_021b8828
_LIT22: .word func_ov010_021b6900
_LIT23: .word func_ov010_021b6a58
_LIT24: .word func_ov010_021b6b00
_LIT25: .word data_02103fcc
