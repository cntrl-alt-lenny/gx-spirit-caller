; func_0201261c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104c68
        .extern data_02104c7a
        .extern data_02104cb0
        .extern data_02104cec
        .extern data_02104cf8
        .extern data_02104f4c
        .extern data_0210594c
        .extern data_02105989
        .extern data_021059c8
        .extern data_02105a4c
        .extern data_ov000_021b2e58
        .extern data_ov000_021b4028
        .extern func_02000ef8
        .extern func_020071a4
        .extern func_020117dc
        .extern func_020119dc
        .extern func_02011a14
        .extern func_02011a7c
        .extern func_02011b9c
        .extern func_02011c6c
        .extern func_02012454
        .extern func_02019538
        .extern func_02019594
        .extern func_0201ac84
        .extern func_0202adf8
        .extern func_0202ae1c
        .extern func_0202af40
        .extern func_0202c0c0
        .extern func_02034784
        .extern func_020347b8
        .extern func_020aaddc
        .extern func_020aadf8
        .extern func_020aaec0
        .extern func_ov002_0229ad88
        .extern func_ov003_021ca1fc
        .extern func_ov004_021cb518
        .extern func_ov004_021d6ed0
        .global func_0201261c
        .arm
func_0201261c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x54
    bl func_02034784
    cmp r0, #0x0
    beq .L_d0
    bl func_020347b8
    cmp r0, #0x0
    bne .L_d0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xba0]
    bl func_02034784
    cmp r0, #0x1
    mov r0, #0x4
    mov r1, #0x1
    bne .L_bc
    ldr r2, _LIT1
    bl func_020071a4
    b .L_c4
.L_bc:
    ldr r2, _LIT2
    bl func_020071a4
.L_c4:
    add sp, sp, #0x54
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d0:
    ldr r0, _LIT0
    ldr r1, [r0, #0xba0]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_6c0
    b .L_fc
    b .L_34c
    b .L_384
    b .L_3b0
    b .L_64c
    b .L_678
.L_fc:
    bl func_02034784
    cmp r0, #0x0
    bne .L_324
    ldr r0, _LIT0
    ldr r0, [r0, #0xb88]
    cmp r0, #0x3
    beq .L_324
    add r0, sp, #0x18
    bl func_0202adf8
    mov r0, #0x0
    bl func_0202ae1c
    ldr r6, _LIT0
    mov r9, #0x0
    ldr r4, _LIT3
    ldr r5, _LIT4
    ldr r7, _LIT5
    mov fp, r9
    mov r8, r6
    str r6, [sp, #0x4]
    str r6, [sp]
    str r6, [sp, #0x10]
    str r6, [sp, #0x14]
    str r6, [sp, #0xc]
    str r6, [sp, #0x8]
.L_15c:
    ldr r0, [sp]
    add r0, r0, r9, lsl #0x2
    ldr sl, [r0, #0xbc4]
    cmp sl, #0x0
    blt .L_23c
    bne .L_194
    ldr r1, _LIT6
    mov r0, r9
    bl func_02012454
    ldr r0, _LIT7
    ldrh r1, [r0, #0x52]
    ldr r0, [sp, #0x8]
    str r1, [r0, #0xba4]
    b .L_23c
.L_194:
    bl func_020117dc
    cmp sl, r0
    bge .L_1f0
    mov r0, sl
    bl func_020119dc
    mov r1, r0
    mov r0, r4
    bl func_02011b9c
    mov r0, sl
    bl func_02011a14
    mov r1, r0
    mov r0, r5
    bl func_020aadf8
    ldr r1, _LIT8
    mov r0, sl
    ldr r1, [r1, #0x4]
    mov r1, r1, lsl #0x1d
    mov r1, r1, lsr #0x1d
    strb r1, [r6, #0xc02]
    bl func_02011a7c
    ldr r1, [sp, #0xc]
    str r0, [r1, #0xba4]
    b .L_23c
.L_1f0:
    ldr r1, [sp, #0x10]
    mov r0, r4
    ldr r1, [r1, #0xc38]
    add r1, r1, fp
    bl func_02011c6c
    ldr r0, _LIT9
    bl func_0202c0c0
    mov r1, r0
    mov r0, r5
    bl func_020aadf8
    ldr r0, _LIT8
    ldr r2, [r0, #0x4]
    ldr r0, _LIT7
    ldrh r1, [r0, #0x52]
    mov r0, r2, lsl #0x1d
    mov r0, r0, lsr #0x1d
    strb r0, [r6, #0xc02]
    ldr r0, [sp, #0x14]
    str r1, [r0, #0xba4]
.L_23c:
    ldr r0, [sp, #0x4]
    add r0, r0, r9, lsl #0x2
    ldr r0, [r0, #0xbbc]
    cmp r0, #0x0
    bne .L_274
    ldr r1, _LIT10
    mov r0, r7
    bl func_020aadf8
    ldr r0, _LIT8
    ldrb r0, [r0, #0xa3c]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    strb r0, [r6, #0xbcc]
    b .L_2dc
.L_274:
    ldreq sl, _LIT10
    beq .L_28c
    add r0, r0, #0x178
    add r0, r0, #0x400
    bl func_0202c0c0
    mov sl, r0
.L_28c:
    mov r0, sl
    bl func_020aaddc
    cmp r0, #0x18
    mov r1, sl
    mov r0, r7
    bls .L_2c4
    mov r2, #0x18
    bl func_020aaec0
    mov r0, #0x2e
    strb r0, [r8, #0xbe4]
    strb r0, [r8, #0xbe5]
    mov r0, #0x0
    strb r0, [r8, #0xbe6]
    b .L_2c8
.L_2c4:
    bl func_020aadf8
.L_2c8:
    ldr r0, _LIT8
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    strb r0, [r6, #0xbcc]
.L_2dc:
    add r4, r4, #0x108
    add r5, r5, #0x1a
    add r6, r6, #0x1
    add fp, fp, #0x3e8
    add r7, r7, #0x1a
    add r8, r8, #0x1a
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_15c
    ldr r1, _LIT0
    ldr r0, [r1, #0xc38]
    cmp r0, #0x0
    bne .L_320
    ldr r0, [r1, #0x38]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r1, #0xc38]
.L_320:
    bl func_0202af40
.L_324:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xb90]
    str r1, [r0, #0xb98]
    str r1, [r0, #0xb94]
    str r1, [r0, #0xb9c]
    str r1, [r0, #0xbb8]
    ldr r1, [r0, #0xba0]
    add r1, r1, #0x1
    str r1, [r0, #0xba0]
.L_34c:
    ldr r0, _LIT0
    ldr r1, [r0, #0xba0]
    add r1, r1, #0x1
    str r1, [r0, #0xba0]
    ldr r0, [r0, #0xc48]
    cmp r0, #0x2
    blt .L_384
    ldr r2, _LIT11
    mov r0, #0x3
    mov r1, #0x1
    bl func_020071a4
    add sp, sp, #0x54
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_384:
    mov r0, #0x2
    ldr r2, _LIT12
    sub r1, r0, #0x3
    bl func_020071a4
    ldr r1, _LIT0
    add sp, sp, #0x54
    ldr r2, [r1, #0xba0]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xba0]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3b0:
    ldr r1, [r0, #0xb88]
    cmp r1, #0x3
    beq .L_53c
    ldr r1, [r0, #0xc3c]
    ldr r0, _LIT13
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    beq .L_53c
    bl func_02034784
    cmp r0, #0x0
    bne .L_40c
    ldr r1, _LIT0
    ldr r0, _LIT14
    ldr r2, [r1, #0xc3c]
    rsb r2, r2, #0x1
    ldr r0, [r0, r2, lsl #0x2]
    cmp r0, #0x0
    beq .L_528
    ldr r1, [r1, #0xe5c]
    mov r2, #0x1
    sub r1, r1, #0x1
    bl func_02019538
    b .L_528
.L_40c:
    ldr r1, _LIT8
    ldr r3, _LIT15
    ldr r1, [r1, #0xa7c]
    ldr r0, _LIT16
    mov r1, r1, lsl #0x16
    cmp r0, r1, lsr #0x16
    ldr r2, [r3]
    movhi r4, #0x1
    mov r0, #0x400
    movls r4, #0x0
    mov r1, r2, lsl #0x16
    rsb r0, r0, #0x0
    add r1, r4, r1, lsr #0x16
    and r2, r2, r0
    and r1, r1, r0, lsr #0x16
    orr r2, r2, r1
    ldr r1, _LIT0
    str r2, [r3]
    ldr r1, [r1, #0xe5c]
    cmp r1, #0x1
    beq .L_474
    cmp r1, #0x2
    beq .L_4b8
    cmp r1, #0x3
    beq .L_4f8
    b .L_528
.L_474:
    ldr r1, _LIT8
    ldr r3, _LIT15
    ldr r1, [r1, #0xa7c]
    ldr r2, [r3]
    mov r1, r1, lsl #0xc
    mov r1, r1, lsr #0x16
    cmp r1, r0, lsr #0x16
    movcc r4, #0x1
    movcs r4, #0x0
    mov r1, r2, lsl #0xc
    ldr r0, _LIT17
    add r1, r4, r1, lsr #0x16
    and r2, r2, r0
    mov r0, r1, lsl #0x16
    orr r0, r2, r0, lsr #0xc
    str r0, [r3]
    b .L_528
.L_4b8:
    ldr r0, _LIT8
    ldr r2, _LIT15
    ldr r0, [r0, #0xa7c]
    ldr r1, [r2]
    mov r0, r0, lsl #0x4
    mov r0, r0, lsr #0x18
    cmp r0, #0xff
    movcc r3, #0x1
    mov r0, r1, lsl #0x4
    movcs r3, #0x0
    add r0, r3, r0, lsr #0x18
    bic r1, r1, #0xff00000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x4
    str r0, [r2]
    b .L_528
.L_4f8:
    ldr r0, _LIT8
    ldr r2, _LIT15
    ldr r0, [r0, #0xa7c]
    mov r0, r0, lsr #0x1c
    cmp r0, #0xf
    movcc r3, #0x1
    ldr r0, [r2]
    movcs r3, #0x0
    bic r1, r0, #-268435456
    add r0, r3, r0, lsr #0x1c
    orr r0, r1, r0, lsl #0x1c
    str r0, [r2]
.L_528:
    ldr r1, _LIT0
    ldr r0, [r1, #0x38]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r1, #0xc38]
.L_53c:
    ldr r0, _LIT0
    ldr r1, [r0, #0xb9c]
    cmp r1, #0x0
    beq .L_604
    mov r1, #0x0
    str r1, [r0, #0xba0]
    bl func_02034784
    cmp r0, #0x0
    beq .L_594
    bl func_02034784
    cmp r0, #0x1
    mov r0, #0x4
    mov r1, #0x1
    bne .L_580
    ldr r2, _LIT1
    bl func_020071a4
    b .L_588
.L_580:
    ldr r2, _LIT2
    bl func_020071a4
.L_588:
    add sp, sp, #0x54
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_594:
    ldr r0, _LIT0
    ldr r1, [r0, #0xb88]
    cmp r1, #0x3
    bne .L_5c0
    ldr r2, _LIT18
    mov r0, #0x5
    mov r1, #0xa
    bl func_020071a4
    add sp, sp, #0x54
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5c0:
    ldr r1, [r0, #0xc3c]
    ldr r0, _LIT14
    rsb r1, r1, #0x1
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x0
    beq .L_5dc
    bl func_0201ac84
.L_5dc:
    ldr r0, _LIT0
    ldr r0, [r0, #0xb9c]
    sub r0, r0, #0x1
    bl func_02019594
    bl func_02000ef8
    cmp r0, #0x0
    movne r0, #0x0
    add sp, sp, #0x54
    moveq r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_604:
    ldr r1, [r0, #0xb90]
    add r1, r1, #0x1
    str r1, [r0, #0xb90]
    cmp r1, #0x3
    bcs .L_624
    ldr r0, [r0, #0xbb4]
    cmp r0, #0x0
    bne .L_630
.L_624:
    ldr r0, _LIT0
    mov r1, #0x2
    str r1, [r0, #0xb88]
.L_630:
    ldr r1, _LIT0
    add sp, sp, #0x54
    ldr r2, [r1, #0xba0]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xba0]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_64c:
    ldr r2, _LIT19
    mov r0, #0x5
    mov r1, #0x6
    bl func_020071a4
    ldr r1, _LIT0
    add sp, sp, #0x54
    ldr r2, [r1, #0xba0]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xba0]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_678:
    mov r1, #0x1
    str r1, [r0, #0xba0]
    bl func_02034784
    cmp r0, #0x0
    beq .L_6b4
    bl func_02034784
    cmp r0, #0x1
    mov r0, #0x4
    mov r1, #0x1
    bne .L_6ac
    ldr r2, _LIT1
    bl func_020071a4
    b .L_6b4
.L_6ac:
    ldr r2, _LIT2
    bl func_020071a4
.L_6b4:
    add sp, sp, #0x54
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6c0:
    mov r0, #0x1
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_021040ac
_LIT1: .word func_ov004_021cb518
_LIT2: .word func_ov004_021d6ed0
_LIT3: .word data_02104cf8
_LIT4: .word data_02104cb0
_LIT5: .word data_02104c7a
_LIT6: .word data_02105a4c
_LIT7: .word data_0210594c
_LIT8: .word data_02104f4c
_LIT9: .word 0x000008cb
_LIT10: .word data_02105989
_LIT11: .word func_ov003_021ca1fc
_LIT12: .word func_ov002_0229ad88
_LIT13: .word data_02104cec
_LIT14: .word data_02104c68
_LIT15: .word data_021059c8
_LIT16: .word 0x000003ff
_LIT17: .word 0xfff003ff
_LIT18: .word data_ov000_021b4028
_LIT19: .word data_ov000_021b2e58
