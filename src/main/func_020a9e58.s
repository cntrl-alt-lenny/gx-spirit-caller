; func_020a9e58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3754
        .extern data_02102838
        .extern func_020a71e4
        .extern func_020a9960
        .extern func_020ab130
        .extern func_020ac46c
        .extern func_020ac854
        .extern func_020b1c7c
        .extern func_020b30e4
        .global func_020a9e58
        .arm
func_020a9e58:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x88
    ldrsb r5, [r2]
    str r2, [sp, #0xc]
    mov r2, #0x0
    mov r9, r0
    mov r0, r2
    str r2, [sp, #0x20]
    mov r8, r1
    str r3, [sp, #0x10]
    str r0, [sp, #0x24]
    cmp r5, #0x0
    ldr sl, [sp, #0xb0]
    str r0, [sp, #0x30]
    mov r4, r2
    str r0, [sp, #0x44]
    str r0, [sp, #0x40]
    beq .L_120c
.L_540:
    cmp r5, #0x0
    mov r0, #0x1
    blt .L_554
    cmp r5, #0x80
    movlt r0, #0x0
.L_554:
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_570
    mov r1, r5, lsl #0x1
    ldr r0, _LIT0
    ldrh r0, [r0, r1]
    and r0, r0, #0x100
.L_570:
    cmp r0, #0x0
    beq .L_630
    mov r2, #0x0
    ldr r1, _LIT0
    mov ip, r2
    mov r3, #0x1
.L_588:
    ldr r0, [sp, #0xc]
    ldrsb r5, [r0, #0x1]!
    str r0, [sp, #0xc]
    mov r0, r3
    cmp r5, #0x0
    blt .L_5a8
    cmp r5, #0x80
    movlt r0, r2
.L_5a8:
    cmp r0, #0x0
    movne r0, ip
    moveq r0, r5, lsl #0x1
    ldreqh r0, [r1, r0]
    andeq r0, r0, #0x100
    cmp r0, #0x0
    bne .L_588
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    bne .L_11fc
    ldr r5, _LIT0
    b .L_5dc
.L_5d8:
    add r4, r4, #0x1
.L_5dc:
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    blx r9
    strb r0, [sp, #0x50]
    ldrsb r1, [sp, #0x50]
    cmp r1, #0x0
    blt .L_604
    cmp r1, #0x80
    blt .L_60c
.L_604:
    mov r0, #0x0
    b .L_618
.L_60c:
    mov r0, r1, lsl #0x1
    ldrh r0, [r5, r0]
    and r0, r0, #0x100
.L_618:
    cmp r0, #0x0
    bne .L_5d8
    mov r0, r8
    mov r2, #0x1
    blx r9
    b .L_11fc
.L_630:
    cmp r5, #0x25
    beq .L_6a8
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    bne .L_6a8
    mov r0, r8
    mov r1, #0x0
    mov r2, r1
    blx r9
    strb r0, [sp, #0x50]
    and r0, r5, #0xff
    ldrsb r1, [sp, #0x50]
    cmp r0, r1
    beq .L_694
    mov r0, r8
    mov r2, #0x1
    blx r9
    cmp sl, #0x0
    beq .L_120c
    mov r0, #0x1
    str r0, [sp, #0x30]
    ldr r0, [sp, #0xc]
    add r0, r0, #0x1
    str r0, [sp, #0xc]
    b .L_11fc
.L_694:
    ldr r0, [sp, #0xc]
    add r4, r4, #0x1
    add r0, r0, #0x1
    str r0, [sp, #0xc]
    b .L_11fc
.L_6a8:
    ldr r0, [sp, #0xc]
    add r1, sp, #0x60
    bl func_020a9960
    str r0, [sp, #0xc]
    ldrb r0, [sp, #0x60]
    cmp r0, #0x0
    bne .L_6e4
    ldrb r0, [sp, #0x63]
    cmp r0, #0x25
    beq .L_6e4
    ldr r0, [sp, #0x10]
    add r0, r0, #0x4
    str r0, [sp, #0x10]
    ldr r5, [r0, #-4]
    b .L_6e8
.L_6e4:
    mov r5, #0x0
.L_6e8:
    ldrb r0, [sp, #0x63]
    cmp r0, #0x6e
    beq .L_728
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    bne .L_728
    mov r0, r8
    mov r1, #0x0
    mov r2, #0x2
    blx r9
    cmp r0, #0x0
    beq .L_728
    cmp sl, #0x0
    beq .L_120c
    mov r0, #0x1
    str r0, [sp, #0x30]
.L_728:
    ldrb r1, [sp, #0x63]
    cmp r1, #0x5b
    bgt .L_780
    bge .L_f54
    cmp r1, #0x47
    bgt .L_774
    subs r0, r1, #0x41
    addpl pc, pc, r0, lsl #0x2
    b .L_768
    b .L_bd0
    b .L_120c
    b .L_120c
    b .L_120c
    b .L_bd0
    b .L_bd0
    b .L_bd0
.L_768:
    cmp r1, #0x25
    beq .L_e4c
    b .L_120c
.L_774:
    cmp r1, #0x58
    beq .L_a0c
    b .L_120c
.L_780:
    cmp r1, #0x78
    bgt .L_7f8
    subs r0, r1, #0x63
    addpl pc, pc, r0, lsl #0x2
    b .L_7ec
    b .L_c94
    b .L_800
    b .L_bd0
    b .L_bd0
    b .L_bd0
    b .L_120c
    b .L_808
    b .L_120c
    b .L_120c
    b .L_120c
    b .L_120c
    b .L_1198
    b .L_9fc
    b .L_120c
    b .L_120c
    b .L_120c
    b .L_ed8
    b .L_120c
    b .L_a04
    b .L_120c
    b .L_120c
    b .L_a0c
.L_7ec:
    cmp r1, #0x61
    beq .L_bd0
    b .L_120c
.L_7f8:
    cmp r1, #0xff
    b .L_120c
.L_800:
    mov r0, #0xa
    b .L_80c
.L_808:
    mov r0, #0x0
.L_80c:
    ldr r1, [sp, #0x30]
    cmp r1, #0x0
    beq .L_82c
    mov r0, #0x0
    str r0, [sp, #0x1c]
    str r0, [sp, #0x20]
    str r0, [sp, #0x24]
    b .L_934
.L_82c:
    ldrb r1, [sp, #0x62]
    add r2, sp, #0x5c
    cmp r1, #0x7
    cmpne r1, #0x4
    add r1, sp, #0x58
    bne .L_870
    str r2, [sp]
    str r1, [sp, #0x4]
    add r1, sp, #0x54
    str r1, [sp, #0x8]
    ldr r1, [sp, #0x64]
    mov r2, r9
    mov r3, r8
    bl func_020ac854
    str r0, [sp, #0x34]
    str r1, [sp, #0x18]
    b .L_894
.L_870:
    str r2, [sp]
    str r1, [sp, #0x4]
    add r1, sp, #0x54
    str r1, [sp, #0x8]
    ldr r1, [sp, #0x64]
    mov r2, r9
    mov r3, r8
    bl func_020ac46c
    str r0, [sp, #0x3c]
.L_894:
    ldr r0, [sp, #0x5c]
    cmp r0, #0x0
    bne .L_8c4
    cmp sl, #0x0
    beq .L_120c
    mov r0, #0x1
    str r0, [sp, #0x30]
    mov r0, #0x0
    str r0, [sp, #0x1c]
    str r0, [sp, #0x20]
    str r0, [sp, #0x24]
    b .L_934
.L_8c4:
    add r4, r4, r0
    ldrb r0, [sp, #0x62]
    cmp r0, #0x7
    cmpne r0, #0x4
    bne .L_914
    ldr r0, [sp, #0x58]
    cmp r0, #0x0
    beq .L_900
    ldr r0, [sp, #0x34]
    rsbs r0, r0, #0x0
    str r0, [sp, #0x20]
    ldr r0, [sp, #0x18]
    rsc r0, r0, #0x0
    str r0, [sp, #0x24]
    b .L_934
.L_900:
    ldr r0, [sp, #0x34]
    str r0, [sp, #0x20]
    ldr r0, [sp, #0x18]
    str r0, [sp, #0x24]
    b .L_934
.L_914:
    ldr r0, [sp, #0x58]
    cmp r0, #0x0
    ldreq r0, [sp, #0x3c]
    streq r0, [sp, #0x1c]
    beq .L_934
    ldr r0, [sp, #0x3c]
    rsb r0, r0, #0x0
    str r0, [sp, #0x1c]
.L_934:
    cmp r5, #0x0
    beq .L_9ec
    ldrb r0, [sp, #0x62]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_9d8
    b .L_96c
    b .L_978
    b .L_984
    b .L_990
    b .L_99c
    b .L_9b0
    b .L_9bc
    b .L_9c8
.L_96c:
    ldr r0, [sp, #0x1c]
    str r0, [r5]
    b .L_9d8
.L_978:
    ldr r0, [sp, #0x1c]
    strb r0, [r5]
    b .L_9d8
.L_984:
    ldr r0, [sp, #0x1c]
    strh r0, [r5]
    b .L_9d8
.L_990:
    ldr r0, [sp, #0x1c]
    str r0, [r5]
    b .L_9d8
.L_99c:
    ldr r0, [sp, #0x20]
    str r0, [r5]
    ldr r0, [sp, #0x24]
    str r0, [r5, #0x4]
    b .L_9d8
.L_9b0:
    ldr r0, [sp, #0x1c]
    str r0, [r5]
    b .L_9d8
.L_9bc:
    ldr r0, [sp, #0x1c]
    str r0, [r5]
    b .L_9d8
.L_9c8:
    ldr r0, [sp, #0x20]
    str r0, [r5]
    ldr r0, [sp, #0x24]
    str r0, [r5, #0x4]
.L_9d8:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    ldreq r0, [sp, #0x44]
    addeq r0, r0, #0x1
    streq r0, [sp, #0x44]
.L_9ec:
    ldr r0, [sp, #0x40]
    add r0, r0, #0x1
    str r0, [sp, #0x40]
    b .L_11fc
.L_9fc:
    mov r0, #0x8
    b .L_a10
.L_a04:
    mov r0, #0xa
    b .L_a10
.L_a0c:
    mov r0, #0x10
.L_a10:
    ldr r1, [sp, #0x30]
    cmp r1, #0x0
    beq .L_a30
    mov r0, #0x0
    str r0, [sp, #0x3c]
    str r0, [sp, #0x34]
    str r0, [sp, #0x18]
    b .L_b08
.L_a30:
    ldrb r1, [sp, #0x62]
    add r2, sp, #0x5c
    cmp r1, #0x7
    cmpne r1, #0x4
    add r1, sp, #0x58
    bne .L_a74
    str r2, [sp]
    str r1, [sp, #0x4]
    add r1, sp, #0x54
    str r1, [sp, #0x8]
    ldr r1, [sp, #0x64]
    mov r2, r9
    mov r3, r8
    bl func_020ac854
    str r0, [sp, #0x34]
    str r1, [sp, #0x18]
    b .L_a98
.L_a74:
    str r2, [sp]
    str r1, [sp, #0x4]
    add r1, sp, #0x54
    str r1, [sp, #0x8]
    ldr r1, [sp, #0x64]
    mov r2, r9
    mov r3, r8
    bl func_020ac46c
    str r0, [sp, #0x3c]
.L_a98:
    ldr r0, [sp, #0x5c]
    cmp r0, #0x0
    bne .L_ac8
    cmp sl, #0x0
    beq .L_120c
    mov r0, #0x1
    str r0, [sp, #0x30]
    mov r0, #0x0
    str r0, [sp, #0x3c]
    str r0, [sp, #0x34]
    str r0, [sp, #0x18]
    b .L_b08
.L_ac8:
    add r4, r4, r0
    ldr r0, [sp, #0x58]
    cmp r0, #0x0
    beq .L_b08
    ldrb r0, [sp, #0x62]
    cmp r0, #0x7
    ldrne r0, [sp, #0x3c]
    rsbne r0, r0, #0x0
    strne r0, [sp, #0x3c]
    bne .L_b08
    ldr r0, [sp, #0x34]
    rsbs r0, r0, #0x0
    str r0, [sp, #0x34]
    ldr r0, [sp, #0x18]
    rsc r0, r0, #0x0
    str r0, [sp, #0x18]
.L_b08:
    cmp r5, #0x0
    beq .L_bc0
    ldrb r0, [sp, #0x62]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_bac
    b .L_b40
    b .L_b4c
    b .L_b58
    b .L_b64
    b .L_b70
    b .L_b84
    b .L_b90
    b .L_b9c
.L_b40:
    ldr r0, [sp, #0x3c]
    str r0, [r5]
    b .L_bac
.L_b4c:
    ldr r0, [sp, #0x3c]
    strb r0, [r5]
    b .L_bac
.L_b58:
    ldr r0, [sp, #0x3c]
    strh r0, [r5]
    b .L_bac
.L_b64:
    ldr r0, [sp, #0x3c]
    str r0, [r5]
    b .L_bac
.L_b70:
    ldr r0, [sp, #0x34]
    str r0, [r5]
    ldr r0, [sp, #0x18]
    str r0, [r5, #0x4]
    b .L_bac
.L_b84:
    ldr r0, [sp, #0x3c]
    str r0, [r5]
    b .L_bac
.L_b90:
    ldr r0, [sp, #0x3c]
    str r0, [r5]
    b .L_bac
.L_b9c:
    ldr r0, [sp, #0x34]
    str r0, [r5]
    ldr r0, [sp, #0x18]
    str r0, [r5, #0x4]
.L_bac:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    ldreq r0, [sp, #0x44]
    addeq r0, r0, #0x1
    streq r0, [sp, #0x44]
.L_bc0:
    ldr r0, [sp, #0x40]
    add r0, r0, #0x1
    str r0, [sp, #0x40]
    b .L_11fc
.L_bd0:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    beq .L_bec
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020b30e4
    b .L_c38
.L_bec:
    add r0, sp, #0x54
    str r0, [sp]
    ldr r0, [sp, #0x64]
    mov r1, r9
    mov r2, r8
    add r3, sp, #0x5c
    bl func_020ab130
    ldr r2, [sp, #0x5c]
    cmp r2, #0x0
    bne .L_c34
    cmp sl, #0x0
    beq .L_120c
    mov r0, #0x1
    str r0, [sp, #0x30]
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020b30e4
    b .L_c38
.L_c34:
    add r4, r4, r2
.L_c38:
    cmp r5, #0x0
    beq .L_c84
    ldrb r2, [sp, #0x62]
    cmp r2, #0x0
    beq .L_c60
    cmp r2, #0x8
    beq .L_c6c
    cmp r2, #0x9
    stmeqia r5, {r0, r1}
    b .L_c70
.L_c60:
    bl func_020b1c7c
    str r0, [r5]
    b .L_c70
.L_c6c:
    stmia r5, {r0, r1}
.L_c70:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    ldreq r0, [sp, #0x44]
    addeq r0, r0, #0x1
    streq r0, [sp, #0x44]
.L_c84:
    ldr r0, [sp, #0x40]
    add r0, r0, #0x1
    str r0, [sp, #0x40]
    b .L_11fc
.L_c94:
    ldrb r0, [sp, #0x61]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0x64]
    cmp r5, #0x0
    beq .L_ddc
    cmp sl, #0x0
    beq .L_cc8
    ldr r0, [sp, #0x10]
    mov r7, #0x1
    add r0, r0, #0x4
    ldr fp, [r0, #-4]
    str r0, [sp, #0x10]
.L_cc8:
    ldr r0, [sp, #0x30]
    mov r1, #0x0
    cmp r0, #0x0
    str r1, [sp, #0x5c]
    beq .L_ce8
    cmp fp, #0x0
    strneb r1, [r5]
    b .L_11fc
.L_ce8:
    mvn r0, #0x0
    str r5, [sp, #0x2c]
    str r0, [sp, #0x48]
    b .L_d30
.L_cf8:
    ldrb r0, [sp, #0x62]
    strb r6, [sp, #0x50]
    cmp r0, #0xa
    ldrnesb r0, [sp, #0x50]
    strneb r0, [r5], #0x1
    bne .L_d24
    mov r0, r5
    add r1, sp, #0x50
    mov r2, #0x1
    bl func_020a71e4
    add r5, r5, #0x1
.L_d24:
    ldr r0, [sp, #0x5c]
    add r1, r0, #0x1
    str r1, [sp, #0x5c]
.L_d30:
    ldr r0, [sp, #0x64]
    cmp r0, #0x0
    sub r0, r0, #0x1
    str r0, [sp, #0x64]
    beq .L_d80
    cmp sl, #0x0
    beq .L_d60
    cmp fp, r1
    movhi r7, #0x1
    movls r7, #0x0
    cmp r7, #0x0
    beq .L_d80
.L_d60:
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    blx r9
    mov r6, r0
    ldr r0, [sp, #0x48]
    cmp r6, r0
    bne .L_cf8
.L_d80:
    strb r6, [sp, #0x50]
    ldr r0, [sp, #0x5c]
    cmp r0, #0x0
    beq .L_da0
    cmp sl, #0x0
    beq .L_dc8
    cmp r7, #0x0
    bne .L_dc8
.L_da0:
    cmp sl, #0x0
    beq .L_120c
    mov r0, #0x1
    cmp fp, #0x0
    str r0, [sp, #0x30]
    beq .L_11fc
    ldr r0, [sp, #0x2c]
    mov r1, #0x0
    strb r1, [r0]
    b .L_11fc
.L_dc8:
    add r4, r4, r0
    ldr r0, [sp, #0x44]
    add r0, r0, #0x1
    str r0, [sp, #0x44]
    b .L_e3c
.L_ddc:
    mov r0, #0x0
    str r0, [sp, #0x5c]
    mvn r5, #0x0
    b .L_dfc
.L_dec:
    strb r6, [sp, #0x50]
    ldr r0, [sp, #0x5c]
    add r0, r0, #0x1
    str r0, [sp, #0x5c]
.L_dfc:
    ldr r0, [sp, #0x64]
    cmp r0, #0x0
    sub r0, r0, #0x1
    str r0, [sp, #0x64]
    beq .L_e2c
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    blx r9
    mov r6, r0
    cmp r6, r5
    bne .L_dec
.L_e2c:
    strb r6, [sp, #0x50]
    ldr r0, [sp, #0x5c]
    cmp r0, #0x0
    beq .L_120c
.L_e3c:
    ldr r0, [sp, #0x40]
    add r0, r0, #0x1
    str r0, [sp, #0x40]
    b .L_11fc
.L_e4c:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    bne .L_11fc
    ldr r5, _LIT0
    b .L_e64
.L_e60:
    add r4, r4, #0x1
.L_e64:
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    blx r9
    strb r0, [sp, #0x50]
    ldrsb r1, [sp, #0x50]
    cmp r1, #0x0
    blt .L_e8c
    cmp r1, #0x80
    blt .L_e94
.L_e8c:
    mov r0, #0x0
    b .L_ea0
.L_e94:
    mov r0, r1, lsl #0x1
    ldrh r0, [r5, r0]
    and r0, r0, #0x100
.L_ea0:
    cmp r0, #0x0
    bne .L_e60
    cmp r1, #0x25
    beq .L_ed0
    mov r0, r8
    mov r2, #0x1
    blx r9
    cmp sl, #0x0
    beq .L_120c
    mov r0, #0x1
    str r0, [sp, #0x30]
    b .L_11fc
.L_ed0:
    add r4, r4, #0x1
    b .L_11fc
.L_ed8:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    bne .L_f54
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    blx r9
    strb r0, [sp, #0x50]
    b .L_f14
.L_efc:
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    add r4, r4, #0x1
    blx r9
    strb r0, [sp, #0x50]
.L_f14:
    ldrsb r1, [sp, #0x50]
    cmp r1, #0x0
    blt .L_f28
    cmp r1, #0x80
    blt .L_f30
.L_f28:
    mov r0, #0x0
    b .L_f40
.L_f30:
    ldr r0, _LIT0
    mov r2, r1, lsl #0x1
    ldrh r0, [r0, r2]
    and r0, r0, #0x100
.L_f40:
    cmp r0, #0x0
    bne .L_efc
    mov r0, r8
    mov r2, #0x1
    blx r9
.L_f54:
    cmp r5, #0x0
    beq .L_10d0
    cmp sl, #0x0
    beq .L_f7c
    ldr r0, [sp, #0x10]
    mov r7, #0x1
    add r0, r0, #0x4
    str r0, [sp, #0x10]
    ldr r0, [r0, #-4]
    sub fp, r0, #0x1
.L_f7c:
    ldr r0, [sp, #0x30]
    mov r1, #0x0
    cmp r0, #0x0
    str r1, [sp, #0x5c]
    beq .L_f9c
    cmp fp, #0x0
    strneb r1, [r5]
    b .L_11fc
.L_f9c:
    mvn r0, #0x0
    str r5, [sp, #0x28]
    str r0, [sp, #0x4c]
    b .L_1000
.L_fac:
    strb r6, [sp, #0x50]
    ldrsb r1, [sp, #0x50]
    add r2, sp, #0x60
    and r3, r1, #0xff
    add r2, r2, r3, asr #0x3
    ldrb r3, [r2, #0x8]
    and r0, r1, #0x7
    mov r2, #0x1
    tst r3, r2, lsl r0
    beq .L_1050
    ldrb r0, [sp, #0x62]
    cmp r0, #0xa
    strneb r1, [r5], #0x1
    bne .L_ff4
    mov r0, r5
    add r1, sp, #0x50
    bl func_020a71e4
    add r5, r5, #0x2
.L_ff4:
    ldr r0, [sp, #0x5c]
    add r1, r0, #0x1
    str r1, [sp, #0x5c]
.L_1000:
    ldr r0, [sp, #0x64]
    cmp r0, #0x0
    sub r0, r0, #0x1
    str r0, [sp, #0x64]
    beq .L_1050
    cmp sl, #0x0
    beq .L_1030
    cmp fp, r1
    movcs r7, #0x1
    movcc r7, #0x0
    cmp r7, #0x0
    beq .L_1050
.L_1030:
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    blx r9
    mov r6, r0
    ldr r0, [sp, #0x4c]
    cmp r6, r0
    bne .L_fac
.L_1050:
    strb r6, [sp, #0x50]
    ldr r0, [sp, #0x5c]
    cmp r0, #0x0
    beq .L_1070
    cmp sl, #0x0
    beq .L_10a8
    cmp r7, #0x0
    bne .L_10a8
.L_1070:
    mov r0, r8
    ldrsb r1, [sp, #0x50]
    mov r2, #0x1
    blx r9
    cmp sl, #0x0
    beq .L_120c
    mov r0, #0x1
    cmp fp, #0x0
    str r0, [sp, #0x30]
    beq .L_11fc
    ldr r0, [sp, #0x28]
    mov r1, #0x0
    strb r1, [r0]
    b .L_11fc
.L_10a8:
    add r4, r4, r0
    ldrb r0, [sp, #0x62]
    cmp r0, #0xa
    mov r0, #0x0
    streqh r0, [r5]
    strneb r0, [r5]
    ldr r0, [sp, #0x44]
    add r0, r0, #0x1
    str r0, [sp, #0x44]
    b .L_116c
.L_10d0:
    mov r0, #0x0
    str r0, [sp, #0x5c]
    mvn r5, #0x0
    b .L_1114
.L_10e0:
    strb r6, [sp, #0x50]
    ldrsb r1, [sp, #0x50]
    and r0, r1, #0x7
    and r2, r1, #0xff
    add r1, sp, #0x60
    add r1, r1, r2, asr #0x3
    ldrb r2, [r1, #0x8]
    mov r1, #0x1
    tst r2, r1, lsl r0
    beq .L_1144
    ldr r0, [sp, #0x5c]
    add r0, r0, #0x1
    str r0, [sp, #0x5c]
.L_1114:
    ldr r0, [sp, #0x64]
    cmp r0, #0x0
    sub r0, r0, #0x1
    str r0, [sp, #0x64]
    beq .L_1144
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    blx r9
    mov r6, r0
    cmp r6, r5
    bne .L_10e0
.L_1144:
    strb r6, [sp, #0x50]
    ldr r0, [sp, #0x5c]
    cmp r0, #0x0
    bne .L_1168
    mov r0, r8
    ldrsb r1, [sp, #0x50]
    mov r2, #0x1
    blx r9
    b .L_11fc
.L_1168:
    add r4, r4, r0
.L_116c:
    ldr r0, [sp, #0x64]
    cmp r0, #0x0
    blt .L_1188
    mov r0, r8
    ldrsb r1, [sp, #0x50]
    mov r2, #0x1
    blx r9
.L_1188:
    ldr r0, [sp, #0x40]
    add r0, r0, #0x1
    str r0, [sp, #0x40]
    b .L_11fc
.L_1198:
    cmp r5, #0x0
    beq .L_11fc
    ldrb r0, [sp, #0x62]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_11fc
    b .L_11d0
    b .L_11e8
    b .L_11d8
    b .L_11e0
    b .L_11fc
    b .L_11fc
    b .L_11fc
    b .L_11f0
.L_11d0:
    str r4, [r5]
    b .L_11fc
.L_11d8:
    strh r4, [r5]
    b .L_11fc
.L_11e0:
    str r4, [r5]
    b .L_11fc
.L_11e8:
    strb r4, [r5]
    b .L_11fc
.L_11f0:
    str r4, [r5]
    mov r0, r4, asr #0x1f
    str r0, [r5, #0x4]
.L_11fc:
    ldr r0, [sp, #0xc]
    ldrsb r5, [r0]
    cmp r5, #0x0
    bne .L_540
.L_120c:
    mov r0, r8
    mov r1, #0x0
    mov r2, #0x2
    blx r9
    cmp r0, #0x0
    beq .L_1238
    ldr r0, [sp, #0x40]
    cmp r0, #0x0
    addeq sp, sp, #0x88
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1238:
    ldr r0, [sp, #0x44]
    add sp, sp, #0x88
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020c3754
_LIT1: .word data_02102838
