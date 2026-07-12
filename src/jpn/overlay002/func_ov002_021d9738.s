; func_ov002_021d9738 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd364
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf0a0
        .extern data_ov002_022cf0c8
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern data_ov002_022d0570
        .extern func_0202b824
        .extern func_0202b86c
        .extern func_0202e1e0
        .extern func_0202e274
        .extern func_0202e2a4
        .extern func_0202e2d4
        .extern func_0202e3d8
        .extern func_0202ed3c
        .extern func_0202f290
        .extern func_ov002_021b3538
        .extern func_ov002_021b35dc
        .extern func_ov002_021b3d48
        .extern func_ov002_021b3dec
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b4124
        .extern func_ov002_021b4274
        .extern func_ov002_021b9dec
        .extern func_ov002_021ba1b4
        .extern func_ov002_021babc8
        .extern func_ov002_021bad9c
        .extern func_ov002_021bb82c
        .extern func_ov002_021bd77c
        .extern func_ov002_021c8860
        .extern func_ov002_021d58dc
        .extern func_ov002_021d9688
        .extern func_ov002_021df53c
        .extern func_ov002_021df848
        .extern func_ov002_021e267c
        .extern func_ov002_021e2ca4
        .extern func_ov002_021e2fc4
        .extern func_ov002_02253840
        .extern func_ov002_02253a10
        .extern func_ov002_02253a84
        .global func_ov002_021d9738
        .arm
func_ov002_021d9738:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4c
    str r1, [sp, #0x4]
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x70]
    ldr r0, [r0]
    mov r5, r1, lsl #0xd
    mov r7, r0, lsl #0x12
    mov r6, r0, lsl #0x2
    mov fp, r7, lsr #0x1f
    mov r4, r1, lsl #0x16
    mov r5, r5, lsr #0x1f
    cmp r5, r4, lsr #0x1f
    mov r0, r0, lsl #0x13
    mov r7, r6, lsr #0x18
    mov r6, r0, lsr #0x13
    add r0, fp, r7, lsl #0x1
    str r0, [sp, #0x3c]
    movne r0, #0x1
    strne r0, [sp, #0x24]
    moveq r0, #0x0
    streq r0, [sp, #0x24]
    ldr r0, [sp, #0x70]
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    moveq r0, #0x1
    streq r0, [sp, #0x20]
    movne r0, #0x0
    strne r0, [sp, #0x20]
    ldr r0, [sp, #0x70]
    mov r1, r1, lsr #0x1c
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    moveq r0, #0x1
    streq r0, [sp, #0x1c]
    movne r0, #0x0
    str r1, [sp, #0x40]
    str r3, [sp, #0xc]
    strne r0, [sp, #0x1c]
    ldr r0, [sp, #0xc]
    ldr r1, [sp, #0x70]
    tst r0, #0x80000
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x1f
    mov r5, r4, lsr #0x1f
    movne r4, #0x1
    mov r1, r1, lsl #0xf
    str r0, [sp, #0x38]
    mov r0, r1, lsr #0x1f
    str r0, [sp, #0x28]
    ldr r0, [sp, #0xc]
    moveq r4, #0x0
    tst r0, #0x100000
    movne r7, #0x1
    ldr r0, [sp, #0xc]
    moveq r7, #0x0
    tst r0, #0x200000
    movne r8, #0x1
    ldr r0, [sp, #0xc]
    moveq r8, #0x0
    tst r0, #0x400000
    movne r9, #0x1
    ldr r0, [sp, #0x28]
    moveq r9, #0x0
    cmp r0, #0x0
    mov r0, #0x0
    str r0, [sp, #0x10]
    movne r0, #0x16
    strne r0, [sp, #0x18]
    moveq r0, #0x1b
    streq r0, [sp, #0x18]
    ldr r0, [sp, #0x28]
    str r2, [sp, #0x8]
    cmp r0, #0x0
    beq .L_168
    ldr r0, _LIT0
    ldr r1, [r0, #0x70]
    ldr r0, [sp, #0x3c]
    cmp r1, r0
    moveq r2, #0x1
    movne r2, #0x0
    mov r0, #0x38
    mul r1, r2, r0
    ldr r0, _LIT1
    ldr r0, [r0, r1]
    str r0, [sp, #0x14]
    b .L_178
.L_168:
    ldr r1, [sp, #0x40]
    mov r0, r5
    bl func_ov002_021c8860
    str r0, [sp, #0x14]
.L_178:
    ldr r1, _LIT2
    cmp r6, r1
    bgt .L_5a8
    bge .L_ea0
    ldr r0, _LIT3
    cmp r6, r0
    bgt .L_3b4
    bge .L_ba4
    sub r1, r0, #0x178
    cmp r6, r1
    bgt .L_2a0
    sub r0, r0, #0x178
    cmp r6, r0
    bge .L_ba4
    ldr r1, _LIT4
    cmp r6, r1
    bgt .L_238
    bge .L_ae4
    sub r0, r1, #0xa5
    cmp r6, r0
    bgt .L_214
    sub r0, r1, #0xa8
    cmp r6, r0
    blt .L_1f0
    subne r0, r1, #0xa6
    cmpne r6, r0
    subne r0, r1, #0xa5
    cmpne r6, r0
    beq .L_97c
    b .L_12a4
.L_1f0:
    ldr r0, _LIT5
    cmp r6, r0
    bgt .L_204
    beq .L_97c
    b .L_12a4
.L_204:
    add r0, r0, #0x100
    cmp r6, r0
    beq .L_97c
    b .L_12a4
.L_214:
    sub r0, r1, #0x9e
    cmp r6, r0
    bgt .L_228
    beq .L_97c
    b .L_12a4
.L_228:
    sub r0, r1, #0x11
    cmp r6, r0
    beq .L_a64
    b .L_12a4
.L_238:
    ldr r1, _LIT6
    cmp r6, r1
    bgt .L_270
    bge .L_ae4
    sub r0, r1, #0xbe
    cmp r6, r0
    bgt .L_25c
    beq .L_97c
    b .L_12a4
.L_25c:
    sub r0, r1, #0xe
    cmp r6, r0
    ldreq r0, [sp, #0x38]
    streq r0, [sp, #0x10]
    b .L_12a4
.L_270:
    add r0, r1, #0x67
    cmp r6, r0
    bgt .L_290
    bge .L_ae4
    add r0, r1, #0x2
    cmp r6, r0
    beq .L_9a0
    b .L_12a4
.L_290:
    add r0, r1, #0x69
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_2a0:
    sub r1, r0, #0xfb
    cmp r6, r1
    bgt .L_348
    sub r0, r0, #0xfb
    cmp r6, r0
    bge .L_bd0
    ldr r1, _LIT7
    cmp r6, r1
    bgt .L_318
    bge .L_ba4
    sub r0, r1, #0x68
    cmp r6, r0
    bgt .L_2dc
    beq .L_ba4
    b .L_12a4
.L_2dc:
    sub r0, r1, #0x64
    sub r0, r6, r0
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_12a4
    b .L_ba4
    b .L_ba4
    b .L_a64
    b .L_ba4
    b .L_12a4
    b .L_ba4
    b .L_ba4
    b .L_12a4
    b .L_12a4
    b .L_ba4
.L_318:
    ldr r0, _LIT8
    cmp r6, r0
    bgt .L_338
    bge .L_124c
    sub r0, r0, #0x3
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_338:
    add r0, r0, #0xc
    cmp r6, r0
    beq .L_bd0
    b .L_12a4
.L_348:
    sub r1, r0, #0xc8
    cmp r6, r1
    bgt .L_384
    bge .L_ae4
    sub r1, r0, #0xf7
    cmp r6, r1
    bgt .L_374
    sub r0, r0, #0xf7
    cmp r6, r0
    beq .L_bd0
    b .L_12a4
.L_374:
    sub r0, r0, #0xe4
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_384:
    sub r1, r0, #0x76
    cmp r6, r1
    bgt .L_3a4
    bge .L_d00
    sub r0, r0, #0xc2
    cmp r6, r0
    beq .L_97c
    b .L_12a4
.L_3a4:
    sub r0, r0, #0x44
    cmp r6, r0
    beq .L_97c
    b .L_12a4
.L_3b4:
    ldr r0, _LIT9
    cmp r6, r0
    bgt .L_4a8
    bge .L_97c
    sub r1, r0, #0xa5
    cmp r6, r1
    bgt .L_43c
    bge .L_e34
    sub r1, r0, #0xd0
    cmp r6, r1
    bgt .L_410
    bge .L_b44
    sub r1, r0, #0xdc
    cmp r6, r1
    bgt .L_400
    sub r0, r0, #0xdc
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_400:
    sub r0, r0, #0xd2
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_410:
    sub r1, r0, #0xc3
    cmp r6, r1
    bgt .L_42c
    sub r0, r0, #0xc3
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_42c:
    sub r0, r0, #0xac
    cmp r6, r0
    beq .L_dd8
    b .L_12a4
.L_43c:
    sub r1, r0, #0x75
    cmp r6, r1
    bgt .L_478
    bge .L_d00
    sub r1, r0, #0x8a
    cmp r6, r1
    bgt .L_468
    sub r0, r0, #0x8a
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_468:
    sub r0, r0, #0x76
    cmp r6, r0
    beq .L_d00
    b .L_12a4
.L_478:
    sub r1, r0, #0x4c
    cmp r6, r1
    bgt .L_498
    bge .L_ba4
    sub r0, r0, #0x4d
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_498:
    sub r0, r0, #0x28
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_4a8:
    add r2, r0, #0xaf
    cmp r6, r2
    bgt .L_52c
    mov r1, r2
    cmp r6, r1
    bge .L_1198
    add r1, r0, #0x86
    cmp r6, r1
    bgt .L_4fc
    bge .L_b44
    add r1, r0, #0x59
    cmp r6, r1
    bgt .L_4ec
    add r0, r0, #0x59
    cmp r6, r0
    beq .L_bd0
    b .L_12a4
.L_4ec:
    add r0, r0, #0x5d
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_4fc:
    add r1, r0, #0x96
    cmp r6, r1
    bgt .L_51c
    bge .L_10f0
    add r0, r0, #0x89
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_51c:
    add r0, r0, #0xa3
    cmp r6, r0
    beq .L_af0
    b .L_12a4
.L_52c:
    sub r2, r1, #0x36
    cmp r6, r2
    bgt .L_570
    sub r1, r1, #0x36
    cmp r6, r1
    bge .L_ba4
    add r1, r0, #0xce
    cmp r6, r1
    bgt .L_560
    add r0, r0, #0xce
    cmp r6, r0
    beq .L_ae4
    b .L_12a4
.L_560:
    rsb r0, r0, #0x2c80
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_570:
    add r2, r0, #0x13c
    cmp r6, r2
    bgt .L_598
    add r0, r0, #0x13c
    cmp r6, r0
    bge .L_ae4
    sub r0, r1, #0x32
    cmp r6, r0
    beq .L_97c
    b .L_12a4
.L_598:
    sub r0, r1, #0x8
    cmp r6, r0
    beq .L_c80
    b .L_12a4
.L_5a8:
    add r0, r1, #0x24c
    cmp r6, r0
    bgt .L_794
    bge .L_b9c
    ldr r0, _LIT10
    cmp r6, r0
    bgt .L_6ac
    bge .L_ba4
    sub r2, r0, #0xa2
    cmp r6, r2
    bgt .L_640
    bge .L_ae4
    sub r2, r0, #0xd1
    cmp r6, r2
    bgt .L_614
    bge .L_97c
    sub r2, r0, #0x138
    cmp r6, r2
    bgt .L_604
    sub r0, r0, #0x138
    cmp r6, r0
    beq .L_bd0
    b .L_12a4
.L_604:
    add r0, r1, #0x50
    cmp r6, r0
    beq .L_bf4
    b .L_12a4
.L_614:
    sub r1, r0, #0xc2
    cmp r6, r1
    bgt .L_630
    sub r0, r0, #0xc2
    cmp r6, r0
    beq .L_97c
    b .L_12a4
.L_630:
    sub r0, r0, #0xa4
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_640:
    sub r1, r0, #0x81
    cmp r6, r1
    bgt .L_67c
    bge .L_ba4
    sub r1, r0, #0x91
    cmp r6, r1
    bgt .L_66c
    sub r0, r0, #0x91
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_66c:
    sub r0, r0, #0x82
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_67c:
    sub r1, r0, #0x26
    cmp r6, r1
    bgt .L_69c
    bge .L_f54
    sub r0, r0, #0x2a
    cmp r6, r0
    beq .L_f2c
    b .L_12a4
.L_69c:
    sub r0, r0, #0x25
    cmp r6, r0
    beq .L_f8c
    b .L_12a4
.L_6ac:
    add r1, r0, #0x8d
    cmp r6, r1
    bgt .L_728
    bge .L_ba4
    add r1, r0, #0x43
    cmp r6, r1
    bgt .L_6f8
    bge .L_c80
    add r1, r0, #0x2
    cmp r6, r1
    bgt .L_6e8
    add r0, r0, #0x2
    cmp r6, r0
    beq .L_c80
    b .L_12a4
.L_6e8:
    add r0, r0, #0x28
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_6f8:
    add r1, r0, #0x5e
    cmp r6, r1
    bgt .L_718
    bge .L_ba4
    add r0, r0, #0x50
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_718:
    add r0, r0, #0x70
    cmp r6, r0
    beq .L_d88
    b .L_12a4
.L_728:
    add r1, r0, #0xb2
    cmp r6, r1
    bgt .L_764
    bge .L_b9c
    add r1, r0, #0x90
    cmp r6, r1
    bgt .L_754
    add r0, r0, #0x90
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_754:
    add r0, r0, #0xad
    cmp r6, r0
    beq .L_c2c
    b .L_12a4
.L_764:
    add r1, r0, #0xd2
    cmp r6, r1
    bgt .L_784
    bge .L_ba4
    add r0, r0, #0xb3
    cmp r6, r0
    beq .L_a04
    b .L_12a4
.L_784:
    add r0, r0, #0xdf
    cmp r6, r0
    beq .L_97c
    b .L_12a4
.L_794:
    ldr r0, _LIT11
    cmp r6, r0
    bgt .L_894
    bge .L_a58
    sub r2, r0, #0x92
    cmp r6, r2
    bgt .L_828
    bge .L_ae4
    add r2, r1, #0x26c
    cmp r6, r2
    bgt .L_7f8
    add r1, r1, #0x26c
    cmp r6, r1
    bge .L_ba4
    sub r1, r0, #0x140
    cmp r6, r1
    bgt .L_7e8
    sub r0, r0, #0x140
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_7e8:
    ldr r0, _LIT12
    cmp r6, r0
    beq .L_c80
    b .L_12a4
.L_7f8:
    sub r1, r0, #0xcb
    cmp r6, r1
    bgt .L_818
    bge .L_ba4
    sub r0, r0, #0xe0
    cmp r6, r0
    beq .L_fac
    b .L_12a4
.L_818:
    sub r0, r0, #0xbe
    cmp r6, r0
    beq .L_cac
    b .L_12a4
.L_828:
    sub r1, r0, #0x33
    cmp r6, r1
    bgt .L_864
    bge .L_d00
    sub r1, r0, #0x89
    cmp r6, r1
    bgt .L_854
    sub r0, r0, #0x89
    cmp r6, r0
    beq .L_bf4
    b .L_12a4
.L_854:
    sub r0, r0, #0x84
    cmp r6, r0
    beq .L_fd8
    b .L_12a4
.L_864:
    sub r1, r0, #0x2
    cmp r6, r1
    bgt .L_884
    bge .L_9d0
    sub r0, r0, #0x13
    cmp r6, r0
    beq .L_d38
    b .L_12a4
.L_884:
    sub r0, r0, #0x1
    cmp r6, r0
    beq .L_b68
    b .L_12a4
.L_894:
    add r1, r0, #0x9d
    cmp r6, r1
    bgt .L_910
    bge .L_1054
    add r1, r0, #0x1d
    cmp r6, r1
    bgt .L_8e0
    bge .L_1054
    add r1, r0, #0x4
    cmp r6, r1
    bgt .L_8d0
    add r0, r0, #0x4
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_8d0:
    add r0, r0, #0x19
    cmp r6, r0
    beq .L_1028
    b .L_12a4
.L_8e0:
    add r1, r0, #0x88
    cmp r6, r1
    bgt .L_900
    bge .L_ba4
    add r0, r0, #0x2a
    cmp r6, r0
    beq .L_b44
    b .L_12a4
.L_900:
    add r0, r0, #0x89
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_910:
    add r1, r0, #0xb7
    cmp r6, r1
    bgt .L_94c
    bge .L_ba4
    add r1, r0, #0xb5
    cmp r6, r1
    bgt .L_93c
    add r0, r0, #0xb5
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_93c:
    add r0, r0, #0xb6
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_94c:
    add r1, r0, #0xb9
    cmp r6, r1
    bgt .L_96c
    bge .L_ba4
    add r0, r0, #0xb8
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_96c:
    add r0, r0, #0xba
    cmp r6, r0
    beq .L_ba4
    b .L_12a4
.L_97c:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    moveq r0, #0x0
    streq r0, [sp, #0x10]
    b .L_12a4
.L_9a0:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_9c4
    cmp fp, r5
    moveq r0, #0x1
    streq r0, [sp, #0x10]
    beq .L_12a4
.L_9c4:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_12a4
.L_9d0:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_9f8
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0x10]
    beq .L_12a4
.L_9f8:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_12a4
.L_a04:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    ldrne r0, [sp, #0x20]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_a4c
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_a40
    ldr r0, _LIT0
    ldr r0, [r0, #0x24]
    cmp r0, r6
    beq .L_a4c
.L_a40:
    mov r0, #0x1
    str r0, [sp, #0x10]
    b .L_12a4
.L_a4c:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_12a4
.L_a58:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_12a4
.L_a64:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_12a4
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_a94
    ldr r0, _LIT0
    ldr r0, [r0, #0x24]
    cmp r0, r6
    beq .L_aa8
.L_a94:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0x10]
    mov r0, r0, lsr #0x5
    tst r0, #0x1
    beq .L_ab4
.L_aa8:
    mov r0, #0x1
    str r0, [sp, #0x10]
    b .L_12a4
.L_ab4:
    ldr r1, [sp, #0x40]
    ldr r2, _LIT13
    mov r0, r5
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_12a4
    mov r0, #0x1
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x70]
    orr r0, r0, #0x800000
    str r0, [sp, #0x70]
    b .L_12a4
.L_ae4:
    ldr r0, [sp, #0x1c]
    str r0, [sp, #0x10]
    b .L_12a4
.L_af0:
    cmp r4, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_b38
    ldr r1, [sp, #0x40]
    mov r0, r5
    bl func_ov002_021b3538
    ldr r1, _LIT14
    cmp r0, r1
    beq .L_b38
    ldr r0, _LIT15
    ldr r0, [r0, #0xd0]
    tst r0, #0x1
    moveq r0, #0x1
    streq r0, [sp, #0x10]
    beq .L_12a4
.L_b38:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_12a4
.L_b44:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    moveq r0, #0x0
    streq r0, [sp, #0x10]
    b .L_12a4
.L_b68:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_b90
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0x10]
    beq .L_12a4
.L_b90:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_12a4
.L_b9c:
    cmp fp, r5
    bne .L_12a4
.L_ba4:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    moveq r0, #0x0
    streq r0, [sp, #0x10]
    b .L_12a4
.L_bd0:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    moveq r0, #0x0
    streq r0, [sp, #0x10]
    b .L_12a4
.L_bf4:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    ldrne r0, _LIT0
    ldrne r0, [r0, #0x24]
    cmpne r0, r6
    movne r0, #0x1
    strne r0, [sp, #0x10]
    moveq r0, #0x0
    streq r0, [sp, #0x10]
    b .L_12a4
.L_c2c:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x4]
    ldrneh r0, [r0, #0x8]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x20]
    cmpne r0, #0x0
    beq .L_c74
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_c68
    ldr r0, _LIT0
    ldr r0, [r0, #0x24]
    cmp r0, r6
    beq .L_c74
.L_c68:
    mov r0, #0x1
    str r0, [sp, #0x10]
    b .L_12a4
.L_c74:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_12a4
.L_c80:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    moveq r0, #0x0
    streq r0, [sp, #0x10]
    b .L_12a4
.L_cac:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_cf4
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x6]
    cmp r0, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    beq .L_cf4
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_cf4
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    bne .L_12a4
.L_cf4:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_12a4
.L_d00:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_d2c
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    bne .L_12a4
.L_d2c:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_12a4
.L_d38:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_d7c
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x24]
    cmpne r0, #0x0
    beq .L_d7c
    ldr r0, [sp, #0x8]
    bl func_0202e1e0
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0x10]
    beq .L_12a4
.L_d7c:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_12a4
.L_d88:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_12a4
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    beq .L_12a4
    ldr r0, _LIT16
    ldr r2, _LIT17
    and r3, r5, #0x1
    mla r2, r3, r0, r2
    ldr r0, [sp, #0x40]
    mov r1, #0x14
    mul r1, r0, r1
    ldr r0, [r1, r2]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    moveq r0, #0x3
    streq r0, [sp, #0x10]
    b .L_12a4
.L_dd8:
    cmp r4, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    beq .L_12a4
    ldr r1, [sp, #0x40]
    mov r0, r5
    bl func_ov002_021b3538
    ldr r1, _LIT14
    cmp r0, r1
    beq .L_12a4
    ldr r0, _LIT16
    ldr r2, _LIT17
    and r3, r5, #0x1
    mla r2, r3, r0, r2
    ldr r0, [sp, #0x40]
    mov r1, #0x14
    mul r1, r0, r1
    ldr r0, [r1, r2]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    moveq r0, #0x3
    streq r0, [sp, #0x10]
    b .L_12a4
.L_e34:
    cmp r4, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    beq .L_12a4
    ldr r1, [sp, #0x40]
    mov r0, r5
    bl func_ov002_021b3538
    ldr r1, _LIT14
    cmp r0, r1
    beq .L_12a4
    ldr r0, _LIT15
    ldr r0, [r0, #0xd0]
    tst r0, #0x1
    bne .L_12a4
    ldr r0, _LIT16
    ldr r2, _LIT17
    and r3, r5, #0x1
    mla r2, r3, r0, r2
    ldr r0, [sp, #0x40]
    mov r1, #0x14
    mul r1, r0, r1
    ldr r0, [r1, r2]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    moveq r0, #0x3
    streq r0, [sp, #0x10]
    b .L_12a4
.L_ea0:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_ed0
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_ed0
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    bne .L_ed8
.L_ed0:
    mov r0, #0x0
    str r0, [sp, #0x10]
.L_ed8:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_12a4
    ldr r0, [sp, #0x24]
    ldr r3, _LIT18
    eor r0, r5, r0
    mov r1, r0, lsl #0x10
    ldr r0, _LIT16
    and r4, r5, #0x1
    mla r3, r4, r0, r3
    ldr r0, [sp, #0x40]
    mov r2, #0x14
    mul r2, r0, r2
    ldr r0, [r2, r3]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    orr r0, r0, r1, lsr #0x10
    str r0, [sp, #0x48]
    str r0, [sp, #0x70]
    b .L_12a4
.L_f2c:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    ldrne r0, [sp, #0x20]
    cmpne r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    moveq r0, #0x0
    streq r0, [sp, #0x10]
    b .L_12a4
.L_f54:
    cmp r8, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_12a4
    cmp r5, fp
    bne .L_12a4
    ldr r1, [sp, #0x40]
    mov r0, r5
    bl func_ov002_021b35dc
    and r0, r0, #0xff
    cmp r5, r0
    moveq r0, #0x1
    streq r0, [sp, #0x10]
    b .L_12a4
.L_f8c:
    cmp r7, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    moveq r0, #0x0
    streq r0, [sp, #0x10]
    b .L_12a4
.L_fac:
    cmp r7, #0x0
    beq .L_fcc
    cmp r8, #0x0
    bne .L_fcc
    cmp r9, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    bne .L_12a4
.L_fcc:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_12a4
.L_fd8:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_101c
    ldr r0, _LIT16
    ldr r2, _LIT18
    and r3, r5, #0x1
    mla r2, r3, r0, r2
    ldr r0, [sp, #0x40]
    mov r1, #0x14
    mul r1, r0, r1
    ldr r0, [r1, r2]
    cmp r0, #0x4
    movcs r0, #0x1
    strcs r0, [sp, #0x10]
    bcs .L_12a4
.L_101c:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_12a4
.L_1028:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    beq .L_1048
    ldr r0, [sp, #0x8]
    cmp r0, r6
    moveq r0, #0x1
    streq r0, [sp, #0x10]
    beq .L_12a4
.L_1048:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_12a4
.L_1054:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    beq .L_1094
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_1094
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    beq .L_1094
    cmp r5, fp
    bne .L_1094
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    bne .L_12a4
.L_1094:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_12a4
_LIT0: .word data_ov002_022cd314
_LIT1: .word data_ov002_022cd364
_LIT2: .word 0x000016fe
_LIT3: .word 0x000014ab
_LIT4: .word 0x00001185
_LIT5: .word 0x00000fd6
_LIT6: .word 0x000012a2
_LIT7: .word 0x0000139d
_LIT8: .word 0x000013a1
_LIT9: .word 0x000015b9
_LIT10: .word 0x00001867
_LIT11: .word 0x00001a90
_LIT12: .word 0x00001951
_LIT13: .word 0x00001174
_LIT14: .word 0x0000ffff
_LIT15: .word data_ov002_022d008c
_LIT16: .word 0x00000868
_LIT17: .word data_ov002_022cf0cc
_LIT18: .word data_ov002_022cf0c8
_LIT19: .word data_ov002_022d0570
.L_10f0:
    ldr r1, [sp, #0x20]
    cmp r1, #0x0
    ldrne r1, [sp, #0x38]
    cmpne r1, #0x0
    ldrne r1, [sp, #0x1c]
    cmpne r1, #0x0
    ldrne r1, [sp, #0x4]
    ldrneh r4, [r1, #0xa]
    cmpne r4, #0x0
    beq .L_12a4
    ldr r2, _LIT19
    add r0, r0, #0x96
.L_1120:
    mov r1, r4, lsl #0x3
    ldrh r1, [r2, r1]
    add r3, r2, r4, lsl #0x3
    ldrh r4, [r3, #0x6]
    cmp r1, r0
    bne .L_118c
    ldrh r2, [r3, #0x4]
    ldr r3, [sp, #0x70]
    mov r0, fp, lsl #0x1f
    mov r3, r3, lsl #0x9
    mov r3, r3, lsr #0x1c
    mov r3, r3, lsl #0x10
    and r4, r3, #0x1f0000
    and r3, r0, #-2147483648
    ldr r0, [sp, #0x18]
    mov r1, r6, lsl #0x10
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    orr r0, r3, r0
    orr r0, r0, #0x400000
    orr r0, r4, r0
    orr r0, r0, r1, lsr #0x10
    ldr r1, [sp, #0x3c]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
    b .L_12a4
.L_118c:
    cmp r4, #0x0
    bne .L_1120
    b .L_12a4
.L_1198:
    ldr r1, [sp, #0x20]
    cmp r1, #0x0
    ldrne r1, [sp, #0x38]
    cmpne r1, #0x0
    ldrne r1, [sp, #0x1c]
    cmpne r1, #0x0
    beq .L_12a4
    ldr r1, [sp, #0x4]
    mov r2, #0x0
    ldrh r7, [r1, #0xa]
    cmp r7, #0x0
    beq .L_11f4
    ldr r3, _LIT19
    add r0, r0, #0xaf
.L_11d0:
    mov r1, r7, lsl #0x3
    ldrh r1, [r3, r1]
    add r4, r3, r7, lsl #0x3
    ldrh r7, [r4, #0x6]
    cmp r1, r0
    ldreqh r1, [r4, #0x4]
    orreq r2, r1, r2, lsl #0x10
    cmp r7, #0x0
    bne .L_11d0
.L_11f4:
    cmp r2, #0x0
    beq .L_12a4
    ldr r3, [sp, #0x70]
    mov r0, fp, lsl #0x1f
    mov r3, r3, lsl #0x9
    mov r3, r3, lsr #0x1c
    mov r3, r3, lsl #0x10
    and r4, r3, #0x1f0000
    and r3, r0, #-2147483648
    ldr r0, [sp, #0x18]
    mov r1, r6, lsl #0x10
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    orr r0, r3, r0
    orr r0, r0, #0x400000
    orr r0, r4, r0
    orr r0, r0, r1, lsr #0x10
    ldr r1, [sp, #0x3c]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
    b .L_12a4
.L_124c:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_12a4
    ldr r2, [sp, #0x70]
    mov r0, r2, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xd
    bne .L_12a4
    mov r0, fp, lsl #0x1f
    and r3, r0, #-2147483648
    ldr r0, [sp, #0x18]
    mov r1, r6, lsl #0x10
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    orr r0, r3, r0
    orr r0, r0, #0x4d0000
    orr r0, r0, r1, lsr #0x10
    ldr r1, [sp, #0x3c]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_12a4:
    ldr r1, [sp, #0x40]
    ldr r2, _LIT20
    mov r0, r5
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [sp, #0x10]
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_13a8
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_13a8
    ldr r0, [sp, #0x40]
    cmp r0, #0x5
    bge .L_13a8
    mov r0, r6
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_13a8
    mov r0, r6
    bl func_0202e3d8
    cmp r0, #0x0
    beq .L_13a8
    ldr r0, [sp, #0x18]
    ldr r7, _LIT21
    mov r0, r0, lsl #0x19
    and r9, r0, #0x7e000000
    ldr r0, _LIT22
    ldr sl, _LIT16
    mov r8, #0x0
    add r4, r0, #0x2a0000
.L_132c:
    ldr r2, _LIT22
    mov r0, r8
    mov r1, #0xa
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_139c
    and r0, r8, #0x1
    mla r1, r0, sl, r7
    cmp fp, r8
    movne r0, #0x1
    moveq r0, #0x0
    ldr r2, [r1, #0xf8]
    mov r1, r8, lsl #0x1f
    mov r0, r0, lsl #0x18
    and r1, r1, #-2147483648
    and r0, r0, #0x1000000
    orr r1, r1, r9
    orr r0, r1, r0
    mov r1, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r1, r2, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    ldr r2, [sp, #0x70]
    orr r0, r0, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_139c:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_132c
.L_13a8:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_154c
    ldr r0, [sp, #0x40]
    cmp r0, #0x5
    bge .L_154c
    mov r0, r6
    bl func_0202e274
    cmp r0, #0x0
    beq .L_154c
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_1480
    ldr r0, [sp, #0x18]
    ldr r7, _LIT21
    mov r0, r0, lsl #0x19
    and r9, r0, #0x7e000000
    ldr r0, _LIT23
    ldr sl, _LIT16
    mov r8, #0x0
    add r4, r0, #0x2a0000
.L_1404:
    ldr r2, _LIT23
    mov r0, r8
    mov r1, #0xa
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_1474
    and r0, r8, #0x1
    mla r1, r0, sl, r7
    cmp fp, r8
    movne r0, #0x1
    moveq r0, #0x0
    ldr r2, [r1, #0xf8]
    mov r1, r8, lsl #0x1f
    mov r0, r0, lsl #0x18
    and r1, r1, #-2147483648
    and r0, r0, #0x1000000
    orr r1, r1, r9
    orr r0, r1, r0
    mov r1, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r1, r2, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    ldr r2, [sp, #0x70]
    orr r0, r0, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_1474:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_1404
.L_1480:
    mov r0, #0x0
    str r0, [sp, #0x34]
    ldr r0, [sp, #0x18]
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    str r0, [sp, #0x2c]
.L_1498:
    ldr r0, _LIT15
    ldr r3, _LIT21
    ldr r1, [r0, #0xcec]
    ldr r0, [sp, #0x34]
    ldr r4, _LIT24
    eor sl, r1, r0
    ldr r0, _LIT16
    and r2, sl, #0x1
    mla r0, r2, r0, r3
    mov r1, sl, lsl #0x1f
    add r8, r0, #0x94
    ldr r0, [sp, #0x2c]
    and r1, r1, #-2147483648
    orr r0, r1, r0
    mov r7, #0x5
    orr r9, r0, #0x200000
.L_14d8:
    mov r0, sl
    mov r1, r7
    mov r2, r4
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_1528
    mov r0, r7, lsl #0x10
    and r0, r0, #0x1f0000
    orr r0, r0, r9
    orr r0, r0, r4
    ldr r3, [r8]
    ldr r2, [sp, #0x70]
    mov r1, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    add r1, r3, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_1528:
    add r8, r8, #0x14
    add r7, r7, #0x1
    cmp r7, #0xa
    blt .L_14d8
    ldr r0, [sp, #0x34]
    add r0, r0, #0x1
    str r0, [sp, #0x34]
    cmp r0, #0x2
    blt .L_1498
.L_154c:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_1588
    rsb r0, r5, #0x1
    ldr r1, _LIT25
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    beq .L_1588
    ldr r0, [sp, #0x4]
    ldr r1, _LIT26
    add r2, sp, #0x70
    bl func_ov002_021b4274
.L_1588:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_1644
    mov r0, r6
    bl func_0202f290
    cmp r0, #0x0
    beq .L_1644
    ldr r3, _LIT21
    ldr r0, _LIT16
    and r2, r5, #0x1
    mla r0, r2, r0, r3
    add r8, r0, #0x30
    ldr r0, [sp, #0x18]
    mov r1, r5, lsl #0x1f
    mov r0, r0, lsl #0x19
    and r1, r1, #-2147483648
    and r0, r0, #0x7e000000
    orr r0, r1, r0
    ldr r4, _LIT27
    mov r7, #0x0
    orr r9, r0, #0x200000
.L_15e4:
    mov r0, r5
    mov r1, r7
    mov r2, r4
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_1634
    mov r0, r7, lsl #0x10
    and r0, r0, #0x1f0000
    orr r0, r0, r9
    orr r0, r0, r4
    ldr r3, [r8]
    ldr r2, [sp, #0x70]
    mov r1, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    add r1, r3, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_1634:
    add r8, r8, #0x14
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_15e4
.L_1644:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_16f4
    ldr r1, _LIT16
    ldr r3, _LIT21
    and r2, r5, #0x1
    mla r3, r2, r1, r3
    mov r0, r5, lsl #0x1f
    and r2, r0, #-2147483648
    ldr r0, [sp, #0x18]
    rsb sl, r1, #0x22c0
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    orr r0, r2, r0
    mov r7, #0x0
    add r8, r3, #0x30
    orr r9, r0, #0x200000
    mov r4, sl
.L_1694:
    mov r0, r5
    mov r1, r7
    mov r2, sl
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_16e4
    mov r0, r7, lsl #0x10
    and r0, r0, #0x1f0000
    orr r0, r0, r9
    orr r0, r0, r4
    ldr r3, [r8]
    ldr r2, [sp, #0x70]
    mov r1, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    add r1, r3, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_16e4:
    add r8, r8, #0x14
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_1694
.L_16f4:
    ldr r0, _LIT28
    cmp r6, r0
    bne .L_174c
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    beq .L_174c
    mov r0, r5
    ldr r1, _LIT29
    bl func_ov002_021ba1b4
    cmp r0, #0x0
    blt .L_174c
    mov r0, r5, lsl #0x1f
    and r1, r0, #-2147483648
    ldr r0, [sp, #0x18]
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    orr r2, r1, r0
    ldr r0, _LIT30
    mov r1, #0x0
    orr r0, r2, r0
    ldr r2, [sp, #0x70]
    bl func_ov002_021e2fc4
.L_174c:
    mov r0, r6
    bl func_0202b824
    cmp r0, #0xb
    bne .L_189c
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_189c
    and r2, r5, #0x1
    ldr r0, _LIT16
    ldr r1, _LIT31
    mul sl, r2, r0
    ldr r0, [r1, sl]
    subs r7, r0, #0x1
    bmi .L_1814
    ldr r0, _LIT21
    mov r1, r5, lsl #0x1f
    add r0, r0, sl
    add r0, r0, #0x18
    add r0, r0, #0x400
    add r8, r0, r7, lsl #0x2
    ldr r0, [sp, #0x18]
    and r1, r1, #-2147483648
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    orr r1, r1, r0
    ldr r0, _LIT32
    orr r9, r1, r0
    sub r4, r0, #0x4e0000
.L_17c4:
    ldr r1, [r8]
    mov r0, r1, lsl #0x13
    cmp r4, r0, lsr #0x13
    bne .L_1808
    mov r0, r1, lsl #0xa
    movs r0, r0, lsr #0x1f
    bne .L_1808
    mov r0, r9
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    ldr r2, [sp, #0x70]
    bl func_ov002_021e2fc4
.L_1808:
    sub r8, r8, #0x4
    subs r7, r7, #0x1
    bpl .L_17c4
.L_1814:
    ldr r0, _LIT33
    ldr r0, [r0, sl]
    subs r4, r0, #0x1
    bmi .L_189c
    ldr r1, _LIT21
    mov r0, r5, lsl #0x1f
    add r1, r1, sl
    add r1, r1, #0x120
    add r8, r1, r4, lsl #0x2
    and r1, r0, #-2147483648
    ldr r0, [sp, #0x18]
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    orr r1, r1, r0
    ldr r0, _LIT34
    orr r9, r1, r0
    sub r7, r0, #0x500000
.L_1858:
    ldr r1, [r8]
    mov r0, r1, lsl #0x13
    cmp r7, r0, lsr #0x13
    bne .L_1890
    mov r0, r9
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    ldr r2, [sp, #0x70]
    bl func_ov002_021e2fc4
.L_1890:
    sub r8, r8, #0x4
    subs r4, r4, #0x1
    bpl .L_1858
.L_189c:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_1970
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0x10]
    mov r0, r0, lsr #0x19
    tst r0, #0x1
    beq .L_1970
    mov r0, r5
    mov r1, #0xb
    ldr r2, _LIT35
    bl func_ov002_021b3d48
    cmp r0, #0x1
    bne .L_1970
    and r2, r5, #0x1
    ldr r0, _LIT16
    ldr r1, _LIT33
    mul r3, r2, r0
    ldr r0, [r1, r3]
    subs r7, r0, #0x1
    bmi .L_1970
    ldr r1, _LIT21
    mov r0, r5, lsl #0x1f
    add r1, r1, r3
    add r1, r1, #0x120
    add r8, r1, r7, lsl #0x2
    and r1, r0, #-2147483648
    ldr r0, [sp, #0x18]
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    orr r1, r1, r0
    ldr r0, _LIT36
    orr r9, r1, r0
    sub r4, r0, #0x500000
.L_192c:
    ldr r1, [r8]
    mov r0, r1, lsl #0x13
    cmp r4, r0, lsr #0x13
    bne .L_1964
    mov r0, r9
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    ldr r2, [sp, #0x70]
    bl func_ov002_021e2fc4
.L_1964:
    sub r8, r8, #0x4
    subs r7, r7, #0x1
    bpl .L_192c
.L_1970:
    mov r0, r6
    bl func_0202b824
    cmp r0, #0x9
    bne .L_19d4
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_19d4
    ldr r8, _LIT37
    mov r9, #0x0
    mov r7, #0x5
    mov r4, #0x1
.L_199c:
    mov r0, fp
    mov r1, r9
    mov r2, r8
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_19c8
    mov r0, fp
    mov r1, r9
    mov r2, r7
    mov r3, r4
    bl func_ov002_021e2ca4
.L_19c8:
    add r9, r9, #0x1
    cmp r9, #0x4
    ble .L_199c
.L_19d4:
    ldr r1, [sp, #0x3c]
    mov r0, r6
    bl func_ov002_021bd77c
    cmp r0, #0x0
    ldr r0, _LIT15
    moveq r4, #0x1
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT38
    ldr r3, [sp, #0x3c]
    mov r1, #0xb
    movne r4, #0x0
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    ldr r2, _LIT39
    movne r4, #0x0
    cmp r6, r2
    bgt .L_1ac0
    bge .L_1c1c
    ldr r0, _LIT40
    cmp r6, r0
    bgt .L_1a5c
    bge .L_1d30
    sub r1, r0, #0xbc
    cmp r6, r1
    bgt .L_1a4c
    bge .L_1cc4
    sub r0, r0, #0x17c
    cmp r6, r0
    beq .L_1c50
    b .L_2170
.L_1a4c:
    sub r0, r0, #0x7d
    cmp r6, r0
    beq .L_1b44
    b .L_2170
.L_1a5c:
    add r1, r0, #0x4f
    cmp r6, r1
    bgt .L_1a7c
    bge .L_1b9c
    add r0, r0, #0x49
    cmp r6, r0
    beq .L_1d20
    b .L_2170
.L_1a7c:
    add r1, r0, #0x9b
    cmp r6, r1
    bgt .L_1a90
    beq .L_1bc8
    b .L_2170
.L_1a90:
    add r1, r0, #0x150
    cmp r6, r1
    bgt .L_2170
    sub r1, r2, #0x89
    cmp r6, r1
    blt .L_2170
    subne r1, r2, #0x88
    cmpne r6, r1
    addne r0, r0, #0x150
    cmpne r6, r0
    beq .L_1bf8
    b .L_2170
.L_1ac0:
    ldr r1, _LIT41
    cmp r6, r1
    bgt .L_1b00
    bge .L_1f74
    ldr r0, _LIT42
    cmp r6, r0
    bgt .L_1af0
    bge .L_1e6c
    sub r0, r0, #0x7e
    cmp r6, r0
    beq .L_1dd4
    b .L_2170
.L_1af0:
    add r0, r0, #0x60
    cmp r6, r0
    beq .L_1f00
    b .L_2170
.L_1b00:
    add r0, r1, #0x6b
    cmp r6, r0
    bgt .L_1b20
    bge .L_1fb8
    add r0, r1, #0x1
    cmp r6, r0
    beq .L_1f74
    b .L_2170
.L_1b20:
    add r0, r1, #0x6d
    cmp r6, r0
    bgt .L_1b34
    beq .L_201c
    b .L_2170
.L_1b34:
    add r0, r1, #0xa8
    cmp r6, r0
    beq .L_2100
    b .L_2170
.L_1b44:
    cmp r4, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_2170
    ldr r0, [sp, #0x4]
    ldr r0, [r0]
    mov r0, r0, lsl #0xa
    movs r0, r0, lsr #0x1f
    bne .L_2170
    ldr r2, [sp, #0x3c]
    mov r0, fp
    mov r1, #0xe
    bl func_ov002_021df53c
    ldr r3, [sp, #0x3c]
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, fp
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, r3, lsr #0x10
    bl func_ov002_021e267c
    b .L_2170
.L_1b9c:
    cmp r4, #0x0
    bne .L_2170
    ldr r3, [sp, #0x3c]
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, fp
    mov r1, r1, lsr #0x10
    mov r2, #0x5
    mov r3, r3, lsr #0x10
    bl func_ov002_021e267c
    b .L_2170
.L_1bc8:
    ldr r1, [sp, #0x28]
    cmp r1, #0x0
    ldrne r1, [sp, #0x38]
    cmpne r1, #0x0
    beq .L_2170
    add r3, r0, #0x73
    ldr r0, [sp, #0x4]
    mov r1, #0x1f4
    ldr r0, [r0, #0xc]
    mov r2, #0x1
    bl func_ov002_021df848
    b .L_2170
.L_1bf8:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    beq .L_2170
    mov r0, r5
    mov r1, #0x12c
    mov r2, #0x0
    ldr r3, _LIT43
    bl func_ov002_021df848
    b .L_2170
.L_1c1c:
    cmp r4, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_2170
    ldr r3, [sp, #0x3c]
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, fp
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, r3, lsr #0x10
    bl func_ov002_021e267c
    b .L_2170
.L_1c50:
    cmp r4, #0x0
    ldrne r0, [sp, #0x20]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_2170
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x3c]
    ldr r1, [r1]
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    bl func_ov002_021b4124
    cmp r0, #0x0
    bne .L_2170
    ldr r1, [sp, #0x4]
    ldr r3, [sp, #0x3c]
    ldr r1, [r1]
    mov r3, r3, lsl #0x10
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    mov r1, r1, lsl #0x10
    mov r0, fp
    mov r2, #0x1
    mov r1, r1, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e267c
    b .L_2170
.L_1cc4:
    cmp r4, #0x0
    beq .L_2170
    cmp r5, fp
    bne .L_2170
    ldr r0, [sp, #0x40]
    cmp r0, #0x5
    bge .L_2170
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x24]
    cmpne r0, #0x0
    beq .L_2170
    ldr r3, [sp, #0x3c]
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r5
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, r3, lsr #0x10
    bl func_ov002_021e267c
    b .L_2170
.L_1d20:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_2170
.L_1d30:
    cmp r4, #0x0
    beq .L_2170
    cmp r5, fp
    bne .L_2170
    ldr r0, [sp, #0x40]
    cmp r0, #0x5
    bge .L_2170
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_2170
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x24]
    cmpne r0, #0x0
    beq .L_2170
    ldr r0, _LIT15
    ldr r1, [r0, #0xcec]
    cmp fp, r1
    bne .L_1d9c
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    mov r0, r0, lsl #0x1
    b .L_1da0
.L_1d9c:
    mov r0, #0x1
.L_1da0:
    and r0, r0, #0xf
    mov r0, r0, lsl #0x4
    ldr r3, [sp, #0x3c]
    orr r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, fp
    mov r1, r1, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e267c
    b .L_2170
.L_1dd4:
    cmp r4, #0x0
    ldrne r0, [sp, #0x20]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_2170
    ldr r0, [sp, #0x8]
    bl func_0202b824
    cmp r0, #0x16
    bne .L_2170
    ldr r0, [sp, #0x8]
    bl func_0202b86c
    cmp r0, #0x4
    bne .L_2170
    ldr r0, _LIT15
    ldr r1, [r0, #0xcec]
    cmp fp, r1
    bne .L_1e34
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    mov r0, r0, lsl #0x1
    b .L_1e38
.L_1e34:
    mov r0, #0x1
.L_1e38:
    and r0, r0, #0xf
    mov r0, r0, lsl #0x4
    ldr r3, [sp, #0x3c]
    orr r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, fp
    mov r1, r1, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e267c
    b .L_2170
.L_1e6c:
    cmp r4, #0x0
    beq .L_2170
    ldr r0, [sp, #0x40]
    cmp r0, #0x5
    bge .L_2170
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_2170
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_2170
    ldr r0, _LIT15
    ldr r1, [r0, #0xcec]
    cmp fp, r1
    bne .L_1ec8
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    mov r0, r0, lsl #0x1
    b .L_1ecc
.L_1ec8:
    mov r0, #0x1
.L_1ecc:
    and r0, r0, #0xf
    mov r0, r0, lsl #0x4
    ldr r3, [sp, #0x3c]
    orr r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, fp
    mov r1, r1, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e267c
    b .L_2170
.L_1f00:
    cmp r4, #0x0
    ldrne r0, [sp, #0x20]
    cmpne r0, #0x0
    beq .L_2170
    ldr r0, [sp, #0x70]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xf
    bne .L_2170
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_2170
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_1f50
    ldr r0, _LIT0
    ldr r0, [r0, #0x24]
    cmp r0, r6
    beq .L_2170
.L_1f50:
    ldr r3, [sp, #0x3c]
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r5
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, r3, lsr #0x10
    bl func_ov002_021e267c
    b .L_2170
.L_1f74:
    cmp r4, #0x0
    ldrne r0, [sp, #0x28]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_2170
    ldr r3, [sp, #0x3c]
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, fp
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, r3, lsr #0x10
    bl func_ov002_021e267c
    b .L_2170
.L_1fb8:
    cmp r4, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_2170
    ldr r0, _LIT15
    ldr r3, [sp, #0x3c]
    ldr r0, [r0, #0xcec]
    mov r1, r6, lsl #0x10
    cmp fp, r0
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x1
    and r0, r0, #0xff
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, fp
    mov r1, r1, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e267c
    b .L_2170
.L_201c:
    cmp r4, #0x0
    ldrne r0, [sp, #0x28]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_2170
    ldr r0, _LIT44
    ldr r3, [sp, #0x3c]
    ldr r0, [r0, #0xcec]
    mov r1, r6, lsl #0x10
    cmp fp, r0
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x1
    and r0, r0, #0xff
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, fp
    mov r1, r1, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e267c
    b .L_2170
_LIT20: .word 0x000019ae
_LIT21: .word data_ov002_022cf08c
_LIT22: .word 0x0000169f
_LIT23: .word 0x0000187f
_LIT24: .word 0x00001971
_LIT25: .word 0x000018d1
_LIT26: .word func_ov002_021d9688
_LIT27: .word 0x00001a59
_LIT28: .word 0x000018aa
_LIT29: .word 0x00001445
_LIT30: .word 0x00501445
_LIT31: .word data_ov002_022cf0a0
_LIT32: .word 0x004e18ec
_LIT33: .word data_ov002_022cf098
_LIT34: .word 0x005018ec
_LIT35: .word 0x0000197d
_LIT36: .word 0x0050197d
_LIT37: .word 0x00001a8d
_LIT38: .word 0x000015ff
_LIT39: .word 0x000016f9
_LIT40: .word 0x00001522
_LIT41: .word 0x000019f7
_LIT42: .word 0x0000185c
_LIT43: .word 0x0000166a
_LIT44: .word data_ov002_022d008c
_LIT45: .word 0x00001782
_LIT46: .word 0x00000868
_LIT47: .word 0x00001843
_LIT48: .word 0x00001862
_LIT49: .word 0x00001875
.L_2100:
    cmp fp, r5
    bne .L_2170
    ldr r0, [sp, #0x40]
    cmp r0, #0x5
    blt .L_2170
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_2170
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    beq .L_2170
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_2170
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_2170
    ldr r3, [sp, #0x3c]
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, fp
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, r3, lsr #0x10
    bl func_ov002_021e267c
.L_2170:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_2304
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    beq .L_2294
    ldr r0, [sp, #0x14]
    cmp r0, #0x11
    bne .L_2294
    ldr r1, _LIT45
    mov r0, r5
    bl func_ov002_021bb82c
    cmp r0, #0x0
    beq .L_2294
    ldr r0, _LIT46
    and r1, r5, #0x1
    mul r0, r1, r0
    str r0, [sp, #0x44]
    and r0, r5, #0xff
    str r0, [sp, #0x30]
    ldr r0, _LIT47
    mov sl, #0x5
    sub r4, r0, #0xc1
.L_21cc:
    ldr r2, _LIT47
    mov r0, r5
    mov r1, sl
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_2288
    mov r0, #0x0
    str r0, [sp]
    ldr r2, _LIT47
    mov r0, r5
    mov r1, sl
    mov r3, #0x2
    bl func_ov002_021d58dc
    ldr r1, _LIT21
    ldr r0, [sp, #0x44]
    mov r8, #0x0
    add r9, r1, r0
    ldr r0, [sp, #0x30]
    and r1, sl, #0xff
    orr r0, r0, r1, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r7, r0, lsr #0x10
.L_2224:
    mov r0, r5
    mov r1, r8
    bl func_ov002_021b9dec
    cmp r0, r4
    bne .L_2278
    ldrh r0, [r9, #0x38]
    cmp r0, #0x0
    beq .L_2278
    ldr r0, _LIT44
    add r1, r8, r5, lsl #0x4
    ldr r2, [r0, #0xd4]
    mov r0, #0x1
    tst r2, r0, lsl r1
    bne .L_2278
    mov r0, #0x0
    str r0, [sp]
    mov r0, r5
    mov r1, r8
    mov r2, r7
    mov r3, #0x8
    bl func_ov002_021d58dc
.L_2278:
    add r9, r9, #0x14
    add r8, r8, #0x1
    cmp r8, #0x4
    ble .L_2224
.L_2288:
    add sl, sl, #0x1
    cmp sl, #0xa
    ble .L_21cc
.L_2294:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x4]
    ldrneh r0, [r0, #0x8]
    cmpne r0, #0x0
    beq .L_22d8
    ldr r0, [sp, #0x14]
    cmp r0, #0xb
    bne .L_22c0
    ldr r0, _LIT48
    bl func_ov002_02253a84
.L_22c0:
    ldr r0, [sp, #0x14]
    cmp r0, #0x10
    bne .L_22d8
    ldr r1, _LIT49
    mov r0, r5
    bl func_ov002_02253a10
.L_22d8:
    ldr r0, [sp, #0x14]
    cmp r0, #0x1
    bne .L_2304
    ldr r0, [sp, #0xc]
    tst r0, #0x1000
    beq .L_2304
    ldr r1, _LIT50
    mov r0, r5
    mov r2, #0x2
    mov r3, #0x0
    bl func_ov002_021e267c
.L_2304:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_23ac
    mov r0, r6
    bl func_0202ed3c
    cmp r0, #0x0
    beq .L_23ac
    ldr r0, [sp, #0x3c]
    ldr r8, _LIT51
    mov r0, r0, lsl #0x10
    ldr r4, _LIT44
    mov r9, #0x0
    mov r7, r0, lsr #0x10
    mov sl, #0x2
.L_2344:
    ldr r0, [sp, #0x40]
    cmp r9, r0
    beq .L_23a0
    mov r0, r5
    mov r1, r9
    mov r2, r8
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_23a0
    ldr r0, [r4, #0xcec]
    mov r1, r9
    cmp fp, r0
    moveq r0, sl
    movne r0, #0x1
    and r0, r0, #0xf
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x2
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    mov r0, r5
    mov r2, r8
    str r7, [sp]
    bl func_ov002_021d58dc
.L_23a0:
    add r9, r9, #0x1
    cmp r9, #0x4
    ble .L_2344
.L_23ac:
    ldr r0, [sp, #0x70]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xb
    bne .L_2420
    ldr r0, [sp, #0x40]
    cmp r0, #0x5
    bge .L_2420
    mov r0, r6
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_2420
    ldr r0, _LIT52
    bl func_ov002_02253a84
    ldr r0, [sp, #0x70]
    mov r0, r0, lsl #0xe
    movs r0, r0, lsr #0x1f
    beq .L_240c
    mov r0, r6
    bl func_0202e2d4
    cmp r0, #0x0
    beq .L_240c
    ldr r0, _LIT53
    bl func_ov002_02253a84
.L_240c:
    mov r0, fp, lsl #0x3
    mov r1, #0x1
    mov r1, r1, lsl r0
    ldr r0, _LIT54
    bl func_ov002_02253840
.L_2420:
    ldr r0, [sp, #0x10]
    cmp r0, #0x1
    beq .L_2458
    cmp r0, #0x2
    addeq sp, sp, #0x4c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addeq sp, sp, #0x10
    bxeq lr
    cmp r0, #0x3
    beq .L_24b4
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_2458:
    ldr r2, [sp, #0x70]
    ldr r0, [sp, #0x18]
    mov r1, r2, lsl #0x9
    mov r3, r0, lsl #0x19
    mov r0, r1, lsr #0x1c
    mov r5, r0, lsl #0x10
    ldr r0, [sp, #0x3c]
    mov r4, fp, lsl #0x1f
    mov r1, r0, lsl #0x10
    and r4, r4, #-2147483648
    and r0, r3, #0x7e000000
    orr r0, r4, r0
    orr r3, r0, #0x400000
    and r4, r5, #0x1f0000
    mov r0, r6, lsl #0x10
    orr r3, r4, r3
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_24b4:
    ldr r0, [sp, #0x18]
    mov r2, r5, lsl #0x1f
    mov r1, r0, lsl #0x19
    ldr r0, [sp, #0x40]
    and r2, r2, #-2147483648
    mov r3, r0, lsl #0x10
    and r0, r1, #0x7e000000
    orr r2, r2, r0
    ldr r0, [sp, #0x3c]
    and r3, r3, #0x1f0000
    mov r1, r0, lsl #0x10
    orr r2, r2, #0x200000
    orr r3, r3, r2
    mov r0, r6, lsl #0x10
    ldr r2, [sp, #0x70]
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
_LIT50: .word 0x000014e2
_LIT51: .word 0x00001a03
_LIT52: .word 0x0000142c
_LIT53: .word 0x0000151a
_LIT54: .word 0x000018b2
