; func_ov012_021cb3bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_02102b84
        .extern data_02103fcc
        .extern data_ov000_021c7304
        .extern data_ov012_021cc040
        .extern data_ov012_021cc52c
        .extern data_ov012_021cc548
        .extern data_ov012_021cc560
        .extern data_ov012_021cc578
        .extern data_ov012_021cc594
        .extern data_ov012_021cc5c0
        .extern data_ov012_021cc5fc
        .extern func_02005c84
        .extern func_02005e04
        .extern func_02018b14
        .extern func_02018b60
        .extern func_020190f0
        .extern func_0201b7bc
        .extern func_0201be24
        .extern func_0201be58
        .extern func_0201bf0c
        .extern func_0201c144
        .extern func_0201c64c
        .extern func_0202c06c
        .extern func_020371b8
        .extern OS_SPrintf
        .extern func_ov000_021ab5ec
        .extern func_ov000_021ab60c
        .extern func_ov000_021ab818
        .extern func_ov000_021ac498
        .extern func_ov000_021ac64c
        .extern func_ov000_021ac680
        .extern func_ov000_021adabc
        .extern func_ov000_021adafc
        .extern func_ov000_021adc64
        .extern func_ov000_021ae288
        .extern func_ov000_021ae320
        .extern func_ov000_021ae380
        .extern func_ov000_021ae3a0
        .extern func_ov000_021ae3b8
        .extern func_ov000_021aec2c
        .extern func_ov012_021c9c80
        .extern func_ov012_021ca0ac
        .extern func_ov012_021ca370
        .extern func_ov012_021cafa8
        .extern func_ov012_021cb240
        .extern func_ov012_021cb320
        .global func_ov012_021cb3bc
        .arm
func_ov012_021cb3bc:
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
    beq .L_59c
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
    bne .L_59c
    mov r0, r1, lsl #0x5
    movs r0, r0, lsr #0x1f
    beq .L_59c
    mov r0, #0xc6
    mov r2, r5
    sub r1, r0, #0xc7
    mov r3, #0x1
    bl func_020371b8
.L_59c:
    bl func_ov012_021ca0ac
    ldr r0, [r4, #0x168]
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x18
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_ea4
    b .L_5e0
    b .L_8b0
    b .L_930
    b .L_ae4
    b .L_bf8
    b .L_d90
    b .L_e5c
    b .L_da0
    b .L_864
    b .L_824
.L_5e0:
    bl func_ov000_021ab5ec
    cmp r0, #0x0
    beq .L_ea4
    mov r0, #0x1
    bl func_ov000_021aec2c
    bl func_0201b7bc
    mov r0, #0x4
    bl func_0201c144
    ldr r0, _LIT3
    ldr r0, [r0, #0x48]
    cmp r0, #0x0
    beq .L_680
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
    bne .L_670
    mov r0, #0x53
    sub r1, r0, #0x54
    bl func_020371b8
    b .L_ea4
.L_670:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
    b .L_ea4
.L_680:
    bl func_0201be58
    cmp r0, #0x0
    bne .L_698
    bl func_0201bf0c
    cmp r0, #0x0
    beq .L_6c4
.L_698:
    bl func_0201c64c
    bl func_02018b60
    ldr r0, [r0]
    .word 0xebff971b
    mov r0, #0x0
    bl func_ov000_021aec2c
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x80000
    str r0, [r4, #0x168]
    b .L_ea4
.L_6c4:
    ldr r0, _LIT3
    ldr r0, [r0, #0x3c]
    cmp r0, #0x0
    beq .L_7e4
    ldr r1, [r4, #0x160]
    and r0, r0, #0xf
    bic r1, r1, #0xf
    orr r1, r1, r0
    mov r0, r1, lsl #0x1c
    mov r0, r0, lsr #0x1c
    str r1, [r4, #0x160]
    sub r7, r0, #0x1
    .word 0xebff9769
    cmp r0, #0x0
    beq .L_720
    ldr r0, [r4, #0x160]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    add r0, r0, #0x16
    add r0, r0, #0x500
    bl func_0202c06c
    mov r1, #0x0
    bl func_ov000_021adc64
.L_720:
    ldr r0, _LIT3
    ldr r0, [r0, #0x40]
    cmp r0, #0x0
    beq .L_7c0
    mov r0, #0x0
    bl func_ov000_021aec2c
    ldr r6, _LIT4
    ldr r1, [r6, r7, lsl #0x2]
    mov r0, r1, lsl #0x10
    mov r0, r0, asr #0x18
    add r0, r0, #0x1d
    mov r1, r1, lsl #0x18
    add r0, r0, #0x500
    mov r8, r1, asr #0x18
    bl func_0202c06c
    .word 0xebff99d4
    ldr r1, [r6, r7, lsl #0x2]
    mov r6, r0
    mov r0, r1, lsl #0x8
    mov r0, r0, asr #0x18
    add r0, r0, #0x21
    add r0, r0, #0x500
    bl func_0202c06c
    .word 0xebff99cc
    mov r1, r6
    mov r2, r0
    mov r0, r8
    mov r3, #0x1
    bl func_ov000_021ae288
    mov r0, r8
    mov r1, r7
    bl func_ov012_021cb320
    ldr r0, _LIT3
    ldr r0, [r0, #0x40]
    bl func_ov000_021ae320
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x90000
    str r0, [r4, #0x168]
    b .L_ea4
.L_7c0:
    ldr r1, [r4, #0x168]
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r4, #0x168]
    b .L_ea4
.L_7e4:
    .word 0xebff972d
    cmp r0, #0x0
    beq .L_800
    ldr r0, _LIT5
    bl func_0202c06c
    mov r1, #0x0
    bl func_ov000_021adc64
.L_800:
    ldr r1, [r4, #0x168]
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r4, #0x168]
    b .L_ea4
.L_824:
    bl func_ov000_021ae3b8
    cmp r0, #0x4
    bne .L_ea4
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x1f
    bne .L_850
    mov r0, #0x0
    mov r1, #0x10
    bl func_ov000_021ab60c
.L_850:
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x40000
    str r0, [r4, #0x168]
    b .L_ea4
.L_864:
    .word 0xebff970d
    cmp r0, #0x0
    beq .L_ea4
    bl func_02018b14
    cmp r0, #0x0
    beq .L_898
    mov r0, #0x0
    bl func_ov012_021c9c80
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x50000
    str r0, [r4, #0x168]
    b .L_ea4
.L_898:
    bl func_ov000_021adabc
    bl func_ov000_021adafc
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    str r0, [r4, #0x168]
    b .L_ea4
.L_8b0:
    mov r6, #0x0
    mov r7, r6
    add r8, r4, #0x130
.L_8bc:
    mov r0, r8
    bl func_ov000_021ac498
    mov r0, r8
    bl func_ov000_021ac680
    cmp r0, #0x0
    beq .L_90c
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
    bl func_020371b8
    b .L_91c
.L_90c:
    add r7, r7, #0x1
    cmp r7, #0x1
    add r8, r8, #0x14
    bcc .L_8bc
.L_91c:
    cmp r6, #0x0
    bne .L_ea4
    bl func_ov012_021cafa8
    bl func_ov012_021ca370
    b .L_ea4
.L_930:
    ldr r0, [r4, #0x164]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1e
    bcc .L_ea4
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
    bne .L_9d8
    cmp r2, #0x1
    bne .L_9bc
    bl func_020190f0
    cmp r0, #0xff
    bne .L_9bc
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x7
    movs r0, r0, lsr #0x1f
    bne .L_9bc
    mov r0, #0x0
    bl func_ov000_021aec2c
    ldr r0, _LIT6
    .word 0xebff96a0
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x70000
    str r0, [r4, #0x168]
    b .L_ad4
.L_9bc:
    mov r0, #0x0
    bl func_ov012_021c9c80
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x50000
    str r0, [r4, #0x168]
    b .L_ad4
.L_9d8:
    mov r0, #0x0
    bl func_ov000_021aec2c
    ldr r0, [r4, #0x160]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x6
    bne .L_a64
    .word 0xebff96a9
    cmp r0, #0x0
    beq .L_a10
    ldr r0, _LIT7
    bl func_0202c06c
    mov r1, #0x0
    bl func_ov000_021adc64
.L_a10:
    ldr r0, _LIT8
    bl func_0202c06c
    .word 0xebff9925
    mov r6, r0
    ldr r0, _LIT9
    bl func_0202c06c
    .word 0xebff9921
    mov r1, r6
    mov r2, r0
    mov r0, #0x0
    mov r3, r0
    bl func_ov000_021ae288
    ldr r0, [r4, #0x168]
    bic r1, r0, #0xff0000
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r4, #0x168]
    b .L_ad4
.L_a64:
    ldr r0, [r6, r7, lsl #0x2]
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x18
    add r0, r0, #0x1d
    add r0, r0, #0x500
    bl func_0202c06c
    .word 0xebff990c
    ldr r1, [r6, r7, lsl #0x2]
    mov r6, r0
    mov r0, r1, lsl #0x8
    mov r0, r0, asr #0x18
    add r0, r0, #0x21
    add r0, r0, #0x500
    bl func_0202c06c
    .word 0xebff9904
    mov r1, r6
    mov r2, r0
    mov r0, r8
    mov r3, #0x1
    bl func_ov000_021ae288
    ldr r0, [r4, #0x168]
    bic r1, r0, #0xff0000
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x2
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r4, #0x168]
.L_ad4:
    ldr r0, [r4, #0x164]
    bic r0, r0, #0xff
    str r0, [r4, #0x164]
    b .L_ea4
.L_ae4:
    bl func_ov000_021ae380
    cmp r0, #0x0
    beq .L_ea4
    bl func_ov000_021ae3a0
    cmp r0, #0x1
    ldr r0, [r4, #0x160]
    mov r0, r0, lsl #0x1c
    bne .L_bc4
    mov r0, r0, lsr #0x1c
    sub r7, r0, #0x1
    .word 0xebff9663
    cmp r0, #0x0
    beq .L_b38
    ldr r0, [r4, #0x160]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    add r0, r0, #0x16
    add r0, r0, #0x500
    bl func_0202c06c
    mov r1, #0x0
    bl func_ov000_021adc64
.L_b38:
    ldr r6, _LIT4
    ldr r1, [r6, r7, lsl #0x2]
    mov r0, r1, lsl #0x10
    mov r0, r0, asr #0x18
    add r0, r0, #0x1d
    mov r1, r1, lsl #0x18
    add r0, r0, #0x500
    mov r8, r1, asr #0x18
    bl func_0202c06c
    .word 0xebff98d4
    ldr r1, [r6, r7, lsl #0x2]
    mov r6, r0
    mov r0, r1, lsl #0x8
    mov r0, r0, asr #0x18
    add r0, r0, #0x21
    add r0, r0, #0x500
    bl func_0202c06c
    .word 0xebff98cc
    mov r1, r6
    mov r2, r0
    mov r0, r8
    mov r3, #0x1
    bl func_ov000_021ae288
    mov r0, r8
    mov r1, r7
    bl func_ov012_021cb320
    ldr r0, [r4, #0x168]
    bic r1, r0, #0xff0000
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r4, #0x168]
    b .L_ea4
.L_bc4:
    mov r0, r0, lsr #0x1c
    add r0, r0, #0x16
    add r0, r0, #0x500
    bl func_0202c06c
    mov r1, #0x0
    bl func_ov000_021adc64
    mov r0, #0x1
    bl func_ov000_021aec2c
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x10000
    str r0, [r4, #0x168]
    b .L_ea4
.L_bf8:
    bl func_ov012_021cb240
    bl func_ov000_021ae380
    cmp r0, #0x0
    beq .L_ea4
    bl func_ov000_021ae3a0
    mov r6, r0
    mov r0, #0x1
    bl func_ov000_021aec2c
    cmp r6, #0x0
    beq .L_d74
    mov r0, #0x0
    bl func_ov000_021aec2c
    ldr r0, [r4, #0x160]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x4
    bne .L_d48
    cmp r6, #0x1
    beq .L_c50
    cmp r6, #0x2
    beq .L_c6c
    b .L_ea4
.L_c50:
    ldr r0, _LIT10
    .word 0xebff95f4
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x70000
    str r0, [r4, #0x168]
    b .L_ea4
.L_c6c:
    bl func_0201be24
    cmp r0, #0x0
    beq .L_cb8
    mov r0, #0x8
    bl func_0201c144
    bl func_0201be58
    cmp r0, #0x0
    bne .L_c98
    bl func_0201bf0c
    cmp r0, #0x0
    beq .L_cac
.L_c98:
    bl func_0201c64c
    bl func_02018b60
    ldr r0, [r0]
    .word 0xebff959b
    b .L_d34
.L_cac:
    ldr r0, _LIT11
    .word 0xebff95dd
    b .L_d34
.L_cb8:
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x7
    movs r0, r0, lsr #0x1f
    beq .L_d20
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
    b .L_d2c
.L_d20:
    ldr r1, _LIT14
    add r0, sp, #0x0
    bl OS_SPrintf
.L_d2c:
    add r0, sp, #0x0
    .word 0xebff95bd
.L_d34:
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x70000
    str r0, [r4, #0x168]
    b .L_ea4
.L_d48:
    mov r0, #0x0
    bl func_ov012_021c9c80
    ldr r1, [r4, #0x168]
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r4, #0x168]
    b .L_ea4
.L_d74:
    mov r0, #0x1
    bl func_ov000_021aec2c
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x10000
    str r0, [r4, #0x168]
    b .L_ea4
.L_d90:
    bl func_ov000_021ab5ec
    cmp r0, #0x0
    movne r5, #0x1
    b .L_ea4
.L_da0:
    .word 0xebff95be
    cmp r0, #0x0
    beq .L_ea4
    mov r0, #0x1
    bl func_ov000_021aec2c
    bl func_02018b14
    cmp r0, #0x0
    beq .L_ddc
    mov r0, #0x0
    bl func_ov012_021c9c80
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x50000
    str r0, [r4, #0x168]
    b .L_ea4
.L_ddc:
    mov r0, #0x4
    bl func_0201c144
    bl func_0201be58
    cmp r0, #0x0
    bne .L_dfc
    bl func_0201bf0c
    cmp r0, #0x0
    beq .L_e18
.L_dfc:
    bl func_0201c64c
    bl func_02018b60
    ldr r0, [r0]
    .word 0xebff9542
    mov r0, #0x0
    bl func_ov000_021aec2c
    b .L_ea4
.L_e18:
    .word 0xebff95a0
    cmp r0, #0x0
    beq .L_e44
    ldr r0, [r4, #0x160]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    add r0, r0, #0x16
    add r0, r0, #0x500
    bl func_0202c06c
    mov r1, #0x0
    bl func_ov000_021adc64
.L_e44:
    bl func_ov000_021adabc
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x10000
    str r0, [r4, #0x168]
    b .L_ea4
.L_e5c:
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
    bcc .L_ea4
    mov r0, #0x0
    bl func_ov012_021c9c80
    ldr r0, [r4, #0x168]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x50000
    str r0, [r4, #0x168]
.L_ea4:
    add r6, r4, #0x130
    mov r4, #0x0
.L_eac:
    mov r0, r6
    bl func_ov000_021ac64c
    add r4, r4, #0x1
    cmp r4, #0x1
    add r6, r6, #0x14
    bcc .L_eac
    .word 0xebff9717
    mov r0, #0x1
    bl func_02005e04
    mov r0, #0x2
    bl func_02005e04
    mov r0, #0x1
    bl func_02005c84
    mov r0, #0x2
    bl func_02005c84
    bl func_ov000_021ab818
    mov r0, r5
    add sp, sp, #0x24
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov000_021c7304
_LIT1: .word data_ov012_021cc5c0
_LIT2: .word data_ov012_021cc5fc
_LIT3: .word data_02103fcc
_LIT4: .word data_ov012_021cc040
_LIT5: .word 0x00000515
_LIT6: .word data_ov012_021cc52c
_LIT7: .word 0x00000525
_LIT8: .word 0x00000526
_LIT9: .word 0x00000527
_LIT10: .word data_ov012_021cc548
_LIT11: .word data_ov012_021cc560
_LIT12: .word data_02102b84
_LIT13: .word data_ov012_021cc578
_LIT14: .word data_ov012_021cc594
