; func_ov017_021b21ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_020b4674
        .extern data_02104e6c
        .extern data_0210586c
        .extern data_ov017_021b8428
        .extern data_ov017_021b8470
        .extern data_ov017_021b8794
        .extern func_02001a14
        .extern func_02001d48
        .extern func_02005910
        .extern func_02005be0
        .extern func_02005ec4
        .extern func_0200973c
        .extern func_0201d56c
        .extern func_0202ada4
        .extern func_0202adc8
        .extern func_0202b08c
        .extern func_0202bacc
        .extern func_0202bb00
        .extern func_0202c01c
        .extern func_0202de48
        .extern func_0202e2a4
        .extern func_0208c79c
        .extern func_0208c7c8
        .extern func_0208c7e4
        .extern func_0208cba8
        .extern func_0208cebc
        .extern func_0208cf48
        .extern func_0208cfd4
        .extern func_0208d050
        .extern func_0208d0fc
        .extern func_0208d60c
        .extern func_0208d6c4
        .extern func_0208d7d8
        .extern func_0208d944
        .extern func_0208e230
        .extern func_0208e2f4
        .extern func_02094410
        .extern func_020b377c
        .extern func_ov017_021b2180
        .extern func_ov017_021b2cdc
        .extern func_ov017_021b670c
        .global func_ov017_021b21ec
        .arm
func_ov017_021b21ec:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    mov r1, #0x4000000
    ldr r0, [r1]
    add r3, r1, #0x1000
    bic r0, r0, #0x1f00
    str r0, [r1]
    ldr r1, [r3]
    mov r0, #0xc0
    bic r4, r1, #0x1f00
    mov r1, #0x7000000
    mov r2, #0x400
    str r4, [r3]
    bl func_02094410
    ldr r1, _LIT0
    mov r0, #0xc0
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094410
    ldr r1, _LIT1
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094410
    bl func_02005910
    ldr r0, _LIT2
    bl func_0208d0fc
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094410
    bl func_0208cba8
    mov r1, #0x0
    ldr r0, _LIT3
    mov r2, r1
    strh r1, [r0]
    add r3, r0, #0x1000
    strh r1, [r3]
    str r1, [sp]
    mov r3, r1
    bl func_0208e230
    mov r1, #0x0
    str r1, [sp]
    ldr r0, _LIT4
    mov r2, r1
    mov r3, r1
    bl func_0208e230
    ldr r0, _LIT3
    mov r1, #0x0
    mov r2, r1
    bl func_0208e2f4
    ldr r0, _LIT4
    mov r1, #0x0
    mov r2, r1
    bl func_0208e2f4
    ldr r1, _LIT5
    ldrh r0, [r1]
    orr r0, r0, #0x8000
    strh r0, [r1]
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_0208c7e4
    mov r0, #0x1
    bl func_0208d944
    mov r0, #0x10
    bl func_0208d6c4
    mov r0, #0x2
    bl func_0208d7d8
    mov r0, #0x20
    bl func_0208d60c
    mov r3, #0x4000000
    ldr r2, [r3]
    ldr r1, _LIT6
    mov r0, #0x4
    and r1, r2, r1
    orr r1, r1, #0x10
    orr r1, r1, #0x200000
    str r1, [r3]
    mov r1, #0x2
    bl func_0201d56c
    ldr r5, _LIT7
    ldr r0, _LIT8
    ldrh r2, [r5]
    sub r1, r0, #0x278
    sub r3, r5, #0x2
    and r0, r2, #0x43
    orr r0, r0, #0x1980
    strh r0, [r5]
    ldrh r0, [r3]
    sub r4, r5, #0x4
    sub r2, r5, #0x6
    and r0, r0, #0x43
    orr r0, r0, #0x1e80
    orr r0, r0, #0x4000
    strh r0, [r3]
    ldrh r3, [r4]
    mov r0, #0x0
    and r3, r3, #0x43
    orr r1, r3, r1
    strh r1, [r4]
    ldrh r1, [r2]
    and r1, r1, #0x43
    orr r1, r1, #0x208
    orr r1, r1, #0x1800
    strh r1, [r2]
    bl func_0208c7c8
    mov r0, #0x4
    bl func_0208d050
    mov r0, #0x80
    bl func_0208cf48
    mov r0, #0x8
    bl func_0208cfd4
    mov r0, #0x100
    bl func_0208cebc
    ldr r3, _LIT9
    ldr r1, _LIT6
    ldr r2, [r3]
    mov r0, #0x9
    and r1, r2, r1
    orr r1, r1, #0x10
    orr r1, r1, #0x200000
    str r1, [r3]
    mov r1, #0x2
    bl func_0201d56c
    add r4, r5, #0x1000
    ldrh r1, [r4]
    ldr r0, _LIT10
    sub r3, r4, #0x2
    and r1, r1, #0x43
    orr r1, r1, #0x1f80
    strh r1, [r4]
    ldrh r1, [r3]
    sub r2, r4, #0x4
    sub r0, r0, #0x100
    and r1, r1, #0x43
    orr r1, r1, #0x208
    orr r1, r1, #0x1c00
    strh r1, [r3]
    ldrh r1, [r2]
    and r1, r1, #0x43
    orr r0, r1, r0
    strh r0, [r2]
    sub r2, r4, #0x6
    ldrh r1, [r2]
    mov r0, #0x3
    and r1, r1, #0x43
    orr r1, r1, #0x8000
    strh r1, [r2]
    bl func_02005be0
    bl func_02005ec4
    ldr r0, _LIT11
    bl func_0202ada4
    ldr r0, _LIT12
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202adc8
    ldr r0, _LIT12
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c01c
    mov r0, #0x6
    bl func_02001a14
    ldr r0, _LIT12
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    add r0, r5, #0x5e
    mvn r1, #0xf
    bl func_0208c79c
    ldr r0, _LIT13
    mvn r1, #0xf
    bl func_0208c79c
    mov r2, r5
    ldrh r0, [r2]
    sub r1, r2, #0x2
    sub r4, r2, #0x4
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r2]
    ldrh r0, [r1]
    sub r6, r2, #0x6
    add r5, r2, #0x1000
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1]
    ldr r3, _LIT14
    ldrh r0, [r4]
    sub r2, r3, #0x2
    sub r1, r3, #0x4
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r4]
    ldrh r0, [r6]
    mov r4, #0x0
    str r4, [sp, #0x18]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r6]
    ldrh r0, [r5]
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r5]
    ldrh r0, [r3]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r3]
    ldrh r0, [r2]
    bic r0, r0, #0x3
    strh r0, [r2]
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldr r0, _LIT15
    mov r5, r4
    ldr r0, [r0]
    mov fp, r4
    str r0, [sp, #0xc]
    mov r0, r4
    str r0, [sp, #0x14]
    str r0, [sp, #0x10]
    ldr r0, [sp, #0xc]
    mov sl, r4
    mov r6, r4
    mov r7, r4
    cmp r0, #0x1
    mov r8, #0x1
    ble .L_508
.L_410:
    mov r0, r8
    bl func_0202b08c
    ldr r1, _LIT16
    mov r9, r0
    cmp r9, r1
    beq .L_4f8
    bl func_0202de48
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_4f8
    b .L_45c
    b .L_45c
    b .L_45c
    b .L_45c
    b .L_4f8
    b .L_4f8
    b .L_4f8
    b .L_4a4
    b .L_4d4
.L_45c:
    mov r0, r9
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_4f8
    ldr r1, [sp, #0x18]
    mov r0, r9
    add r1, r1, #0x1
    str r1, [sp, #0x18]
    bl func_0202bacc
    cmp r0, #0x0
    ldrne r0, [sp, #0x14]
    addne r0, r0, #0x1
    strne r0, [sp, #0x14]
    mov r0, r9
    bl func_0202bb00
    cmp r0, #0x0
    addne sl, sl, #0x1
    b .L_4f8
.L_4a4:
    mov r0, r9
    add r4, r4, #0x1
    bl func_0202bacc
    cmp r0, #0x0
    ldrne r0, [sp, #0x10]
    addne r0, r0, #0x1
    strne r0, [sp, #0x10]
    mov r0, r9
    bl func_0202bb00
    cmp r0, #0x0
    addne r6, r6, #0x1
    b .L_4f8
.L_4d4:
    mov r0, r9
    add r5, r5, #0x1
    bl func_0202bacc
    cmp r0, #0x0
    mov r0, r9
    addne fp, fp, #0x1
    bl func_0202bb00
    cmp r0, #0x0
    addne r7, r7, #0x1
.L_4f8:
    ldr r0, [sp, #0xc]
    add r8, r8, #0x1
    cmp r8, r0
    blt .L_410
.L_508:
    ldr r0, [sp, #0x18]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x8]
    beq .L_534
    ldr r1, [sp, #0x14]
    mov r0, #0x64
    mul r0, r1, r0
    ldr r1, [sp, #0x18]
    bl func_020b377c
    str r0, [sp, #0x8]
.L_534:
    cmp r4, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x4]
    beq .L_55c
    ldr r1, [sp, #0x10]
    mov r0, #0x64
    mul r0, r1, r0
    mov r1, r4
    bl func_020b377c
    str r0, [sp, #0x4]
.L_55c:
    cmp r5, #0x0
    moveq r8, #0x0
    beq .L_57c
    mov r0, #0x64
    mul r0, fp, r0
    mov r1, r5
    bl func_020b377c
    mov r8, r0
.L_57c:
    ldr r0, [sp, #0x18]
    ldr r1, [sp, #0x14]
    add r2, r0, r4
    ldr r0, [sp, #0x10]
    add r0, r1, r0
    adds r1, r5, r2
    add r2, fp, r0
    moveq r9, #0x0
    beq .L_5b0
    mov r0, #0x64
    mul r0, r2, r0
    bl func_020b377c
    mov r9, r0
.L_5b0:
    cmp sl, #0x0
    moveq sl, #0x0
    beq .L_5d0
    mov r0, #0x64
    mul r0, sl, r0
    ldr r1, [sp, #0x18]
    bl func_020b377c
    mov sl, r0
.L_5d0:
    cmp r6, #0x0
    moveq r4, #0x0
    beq .L_5f0
    mov r0, #0x64
    mul r0, r6, r0
    mov r1, r4
    bl func_020b377c
    mov r4, r0
.L_5f0:
    cmp r7, #0x0
    moveq r5, #0x0
    beq .L_610
    mov r0, #0x64
    mul r0, r7, r0
    mov r1, r5
    bl func_020b377c
    mov r5, r0
.L_610:
    ldr r0, [sp, #0x8]
    cmp r0, #0x50
    blt .L_624
    mov r0, #0x7
    bl func_0200973c
.L_624:
    ldr r0, [sp, #0x4]
    cmp r0, #0x50
    blt .L_638
    mov r0, #0x5
    bl func_0200973c
.L_638:
    cmp r8, #0x50
    blt .L_648
    mov r0, #0x6
    bl func_0200973c
.L_648:
    cmp r9, #0x64
    blt .L_658
    mov r0, #0x4
    bl func_0200973c
.L_658:
    cmp sl, #0x32
    blt .L_668
    mov r0, #0x12
    bl func_0200973c
.L_668:
    cmp sl, #0x64
    blt .L_678
    mov r0, #0x13
    bl func_0200973c
.L_678:
    cmp r4, #0x32
    blt .L_688
    mov r0, #0x14
    bl func_0200973c
.L_688:
    cmp r4, #0x64
    blt .L_698
    mov r0, #0x15
    bl func_0200973c
.L_698:
    cmp r5, #0x32
    blt .L_6a8
    mov r0, #0x16
    bl func_0200973c
.L_6a8:
    cmp r5, #0x64
    blt .L_6b8
    mov r0, #0x17
    bl func_0200973c
.L_6b8:
    ldr r0, _LIT17
    ldrh r1, [r0, #0x52]
    ldrh r4, [r0, #0x58]
    cmp r4, r1
    movls r4, r1
    cmp r4, #0x5
    blt .L_6dc
    mov r0, #0x1c
    bl func_0200973c
.L_6dc:
    cmp r4, #0xa
    blt .L_6ec
    mov r0, #0x1d
    bl func_0200973c
.L_6ec:
    cmp r4, #0x14
    blt .L_6fc
    mov r0, #0x1e
    bl func_0200973c
.L_6fc:
    cmp r4, #0x1e
    blt .L_70c
    mov r0, #0x1f
    bl func_0200973c
.L_70c:
    cmp r4, #0x28
    blt .L_71c
    mov r0, #0x20
    bl func_0200973c
.L_71c:
    add r1, sp, #0x1c
    mov r0, #0x0
    str r0, [r1]
    str r0, [r1, #0x4]
    str r0, [r1, #0x8]
    bl GetSystemWork
    add r6, r0, #0x18
    mov r4, #0x1
    add r2, sp, #0x1c
    mov r3, #0x0
.L_744:
    mov r5, r3
.L_748:
    add r0, r6, r5
    ldrb r0, [r0, #-4]
    ldr r1, [r2, r5, lsl #0x2]
    add r0, r1, r0
    str r0, [r2, r5, lsl #0x2]
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_748
    add r4, r4, #0x1
    cmp r4, #0x57
    add r6, r6, #0x18
    blt .L_744
    ldr r0, _LIT12
    ldr r5, [sp, #0x1c]
    ldr r3, [r0, #0xa7c]
    ldr r2, [sp, #0x20]
    mov r4, r3, lsl #0xc
    mov r1, r3, lsl #0x4
    ldr r0, [sp, #0x24]
    add r4, r5, r4, lsr #0x16
    add r2, r2, r1, lsr #0x18
    add r1, r0, r3, lsr #0x1c
    add r0, r4, r2
    add r0, r1, r0
    str r4, [sp, #0x1c]
    str r2, [sp, #0x20]
    str r1, [sp, #0x24]
    cmp r0, #0x64
    blt .L_7c4
    mov r0, #0x19
    bl func_0200973c
.L_7c4:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x1f4
    blt .L_7d8
    mov r0, #0x1a
    bl func_0200973c
.L_7d8:
    ldr r0, [sp, #0x20]
    cmp r0, #0x64
    blt .L_7ec
    mov r0, #0x1b
    bl func_0200973c
.L_7ec:
    ldr r0, _LIT12
    ldr r0, [r0, #0xa74]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_ov017_021b2180
    ldr r1, _LIT12
    mov r4, r0
    ldr r0, [r1, #0xa68]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    and r0, r0, #0x7f
    bl func_ov017_021b2180
    ldr r2, _LIT12
    ldr r1, _LIT18
    ldr r2, [r2, #0xa68]
    mov r5, r0
    mov r0, r2, lsl #0x10
    and r0, r1, r0, lsr #0x10
    bl func_ov017_021b2180
    mov r6, r0
    cmp r4, #0x8
    blt .L_850
    mov r0, #0xc
    bl func_0200973c
.L_850:
    cmp r4, #0x10
    blt .L_860
    mov r0, #0xe
    bl func_0200973c
.L_860:
    cmp r5, #0x3
    blt .L_870
    mov r0, #0x22
    bl func_0200973c
.L_870:
    cmp r5, #0x7
    blt .L_880
    mov r0, #0x23
    bl func_0200973c
.L_880:
    cmp r6, #0x5
    blt .L_890
    mov r0, #0x24
    bl func_0200973c
.L_890:
    cmp r6, #0xb
    blt .L_8a0
    mov r0, #0x25
    bl func_0200973c
.L_8a0:
    mov r4, #0x0
    ldr r1, _LIT12
    mov r2, r4
.L_8ac:
    add r0, r1, r2, lsl #0x3
    add r0, r0, #0xa00
    ldrh r0, [r0, #0x80]
    add r2, r2, #0x1
    cmp r0, #0x2
    addcs r4, r4, #0x1
    cmp r2, #0x10
    blt .L_8ac
    cmp r4, #0x8
    blt .L_8dc
    mov r0, #0xd
    bl func_0200973c
.L_8dc:
    cmp r4, #0x10
    blt .L_8ec
    mov r0, #0xf
    bl func_0200973c
.L_8ec:
    ldr r0, _LIT19
    bl func_ov017_021b670c
    ldr r0, _LIT20
    bl func_ov017_021b2cdc
    mov r0, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x07000400
_LIT1: .word 0x05000400
_LIT2: .word 0x000001ff
_LIT3: .word 0x04000050
_LIT4: .word 0x04001050
_LIT5: .word 0x04000304
_LIT6: .word 0xffcfffef
_LIT7: .word 0x0400000e
_LIT8: .word 0x00005e80
_LIT9: .word 0x04001000
_LIT10: .word 0x00001e08
_LIT11: .word data_ov017_021b8428
_LIT12: .word data_02104e6c
_LIT13: .word 0x0400106c
_LIT14: .word 0x0400100c
_LIT15: .word data_020b4674
_LIT16: .word 0x00001b7f
_LIT17: .word data_0210586c
_LIT18: .word 0x000007ff
_LIT19: .word data_ov017_021b8794
_LIT20: .word data_ov017_021b8470
