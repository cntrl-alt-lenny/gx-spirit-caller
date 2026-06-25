; func_020a9d64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3660
        .extern data_02102758
        .extern func_020a70f0
        .extern func_020a986c
        .extern func_020ab03c
        .extern func_020ac378
        .extern func_020ac760
        .extern func_020b1b88
        .extern func_020b2ff0
        .global func_020a9d64
        .arm
func_020a9d64:
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
    beq .L_d14
.L_48:
    cmp r5, #0x0
    mov r0, #0x1
    blt .L_5c
    cmp r5, #0x80
    movlt r0, #0x0
.L_5c:
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_78
    mov r1, r5, lsl #0x1
    ldr r0, _LIT0
    ldrh r0, [r0, r1]
    and r0, r0, #0x100
.L_78:
    cmp r0, #0x0
    beq .L_138
    mov r2, #0x0
    ldr r1, _LIT0
    mov ip, r2
    mov r3, #0x1
.L_90:
    ldr r0, [sp, #0xc]
    ldrsb r5, [r0, #0x1]!
    str r0, [sp, #0xc]
    mov r0, r3
    cmp r5, #0x0
    blt .L_b0
    cmp r5, #0x80
    movlt r0, r2
.L_b0:
    cmp r0, #0x0
    movne r0, ip
    moveq r0, r5, lsl #0x1
    ldreqh r0, [r1, r0]
    andeq r0, r0, #0x100
    cmp r0, #0x0
    bne .L_90
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    bne .L_d04
    ldr r5, _LIT0
    b .L_e4
.L_e0:
    add r4, r4, #0x1
.L_e4:
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    blx r9
    strb r0, [sp, #0x50]
    ldrsb r1, [sp, #0x50]
    cmp r1, #0x0
    blt .L_10c
    cmp r1, #0x80
    blt .L_114
.L_10c:
    mov r0, #0x0
    b .L_120
.L_114:
    mov r0, r1, lsl #0x1
    ldrh r0, [r5, r0]
    and r0, r0, #0x100
.L_120:
    cmp r0, #0x0
    bne .L_e0
    mov r0, r8
    mov r2, #0x1
    blx r9
    b .L_d04
.L_138:
    cmp r5, #0x25
    beq .L_1b0
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    bne .L_1b0
    mov r0, r8
    mov r1, #0x0
    mov r2, r1
    blx r9
    strb r0, [sp, #0x50]
    and r0, r5, #0xff
    ldrsb r1, [sp, #0x50]
    cmp r0, r1
    beq .L_19c
    mov r0, r8
    mov r2, #0x1
    blx r9
    cmp sl, #0x0
    beq .L_d14
    mov r0, #0x1
    str r0, [sp, #0x30]
    ldr r0, [sp, #0xc]
    add r0, r0, #0x1
    str r0, [sp, #0xc]
    b .L_d04
.L_19c:
    ldr r0, [sp, #0xc]
    add r4, r4, #0x1
    add r0, r0, #0x1
    str r0, [sp, #0xc]
    b .L_d04
.L_1b0:
    ldr r0, [sp, #0xc]
    add r1, sp, #0x60
    bl func_020a986c
    str r0, [sp, #0xc]
    ldrb r0, [sp, #0x60]
    cmp r0, #0x0
    bne .L_1ec
    ldrb r0, [sp, #0x63]
    cmp r0, #0x25
    beq .L_1ec
    ldr r0, [sp, #0x10]
    add r0, r0, #0x4
    str r0, [sp, #0x10]
    ldr r5, [r0, #-4]
    b .L_1f0
.L_1ec:
    mov r5, #0x0
.L_1f0:
    ldrb r0, [sp, #0x63]
    cmp r0, #0x6e
    beq .L_230
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    bne .L_230
    mov r0, r8
    mov r1, #0x0
    mov r2, #0x2
    blx r9
    cmp r0, #0x0
    beq .L_230
    cmp sl, #0x0
    beq .L_d14
    mov r0, #0x1
    str r0, [sp, #0x30]
.L_230:
    ldrb r1, [sp, #0x63]
    cmp r1, #0x5b
    bgt .L_288
    bge .L_a5c
    cmp r1, #0x47
    bgt .L_27c
    subs r0, r1, #0x41
    addpl pc, pc, r0, lsl #0x2
    b .L_270
    b .L_6d8
    b .L_d14
    b .L_d14
    b .L_d14
    b .L_6d8
    b .L_6d8
    b .L_6d8
.L_270:
    cmp r1, #0x25
    beq .L_954
    b .L_d14
.L_27c:
    cmp r1, #0x58
    beq .L_514
    b .L_d14
.L_288:
    cmp r1, #0x78
    bgt .L_300
    subs r0, r1, #0x63
    addpl pc, pc, r0, lsl #0x2
    b .L_2f4
    b .L_79c
    b .L_308
    b .L_6d8
    b .L_6d8
    b .L_6d8
    b .L_d14
    b .L_310
    b .L_d14
    b .L_d14
    b .L_d14
    b .L_d14
    b .L_ca0
    b .L_504
    b .L_d14
    b .L_d14
    b .L_d14
    b .L_9e0
    b .L_d14
    b .L_50c
    b .L_d14
    b .L_d14
    b .L_514
.L_2f4:
    cmp r1, #0x61
    beq .L_6d8
    b .L_d14
.L_300:
    cmp r1, #0xff
    b .L_d14
.L_308:
    mov r0, #0xa
    b .L_314
.L_310:
    mov r0, #0x0
.L_314:
    ldr r1, [sp, #0x30]
    cmp r1, #0x0
    beq .L_334
    mov r0, #0x0
    str r0, [sp, #0x1c]
    str r0, [sp, #0x20]
    str r0, [sp, #0x24]
    b .L_43c
.L_334:
    ldrb r1, [sp, #0x62]
    add r2, sp, #0x5c
    cmp r1, #0x7
    cmpne r1, #0x4
    add r1, sp, #0x58
    bne .L_378
    str r2, [sp]
    str r1, [sp, #0x4]
    add r1, sp, #0x54
    str r1, [sp, #0x8]
    ldr r1, [sp, #0x64]
    mov r2, r9
    mov r3, r8
    bl func_020ac760
    str r0, [sp, #0x34]
    str r1, [sp, #0x18]
    b .L_39c
.L_378:
    str r2, [sp]
    str r1, [sp, #0x4]
    add r1, sp, #0x54
    str r1, [sp, #0x8]
    ldr r1, [sp, #0x64]
    mov r2, r9
    mov r3, r8
    bl func_020ac378
    str r0, [sp, #0x3c]
.L_39c:
    ldr r0, [sp, #0x5c]
    cmp r0, #0x0
    bne .L_3cc
    cmp sl, #0x0
    beq .L_d14
    mov r0, #0x1
    str r0, [sp, #0x30]
    mov r0, #0x0
    str r0, [sp, #0x1c]
    str r0, [sp, #0x20]
    str r0, [sp, #0x24]
    b .L_43c
.L_3cc:
    add r4, r4, r0
    ldrb r0, [sp, #0x62]
    cmp r0, #0x7
    cmpne r0, #0x4
    bne .L_41c
    ldr r0, [sp, #0x58]
    cmp r0, #0x0
    beq .L_408
    ldr r0, [sp, #0x34]
    rsbs r0, r0, #0x0
    str r0, [sp, #0x20]
    ldr r0, [sp, #0x18]
    rsc r0, r0, #0x0
    str r0, [sp, #0x24]
    b .L_43c
.L_408:
    ldr r0, [sp, #0x34]
    str r0, [sp, #0x20]
    ldr r0, [sp, #0x18]
    str r0, [sp, #0x24]
    b .L_43c
.L_41c:
    ldr r0, [sp, #0x58]
    cmp r0, #0x0
    ldreq r0, [sp, #0x3c]
    streq r0, [sp, #0x1c]
    beq .L_43c
    ldr r0, [sp, #0x3c]
    rsb r0, r0, #0x0
    str r0, [sp, #0x1c]
.L_43c:
    cmp r5, #0x0
    beq .L_4f4
    ldrb r0, [sp, #0x62]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_4e0
    b .L_474
    b .L_480
    b .L_48c
    b .L_498
    b .L_4a4
    b .L_4b8
    b .L_4c4
    b .L_4d0
.L_474:
    ldr r0, [sp, #0x1c]
    str r0, [r5]
    b .L_4e0
.L_480:
    ldr r0, [sp, #0x1c]
    strb r0, [r5]
    b .L_4e0
.L_48c:
    ldr r0, [sp, #0x1c]
    strh r0, [r5]
    b .L_4e0
.L_498:
    ldr r0, [sp, #0x1c]
    str r0, [r5]
    b .L_4e0
.L_4a4:
    ldr r0, [sp, #0x20]
    str r0, [r5]
    ldr r0, [sp, #0x24]
    str r0, [r5, #0x4]
    b .L_4e0
.L_4b8:
    ldr r0, [sp, #0x1c]
    str r0, [r5]
    b .L_4e0
.L_4c4:
    ldr r0, [sp, #0x1c]
    str r0, [r5]
    b .L_4e0
.L_4d0:
    ldr r0, [sp, #0x20]
    str r0, [r5]
    ldr r0, [sp, #0x24]
    str r0, [r5, #0x4]
.L_4e0:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    ldreq r0, [sp, #0x44]
    addeq r0, r0, #0x1
    streq r0, [sp, #0x44]
.L_4f4:
    ldr r0, [sp, #0x40]
    add r0, r0, #0x1
    str r0, [sp, #0x40]
    b .L_d04
.L_504:
    mov r0, #0x8
    b .L_518
.L_50c:
    mov r0, #0xa
    b .L_518
.L_514:
    mov r0, #0x10
.L_518:
    ldr r1, [sp, #0x30]
    cmp r1, #0x0
    beq .L_538
    mov r0, #0x0
    str r0, [sp, #0x3c]
    str r0, [sp, #0x34]
    str r0, [sp, #0x18]
    b .L_610
.L_538:
    ldrb r1, [sp, #0x62]
    add r2, sp, #0x5c
    cmp r1, #0x7
    cmpne r1, #0x4
    add r1, sp, #0x58
    bne .L_57c
    str r2, [sp]
    str r1, [sp, #0x4]
    add r1, sp, #0x54
    str r1, [sp, #0x8]
    ldr r1, [sp, #0x64]
    mov r2, r9
    mov r3, r8
    bl func_020ac760
    str r0, [sp, #0x34]
    str r1, [sp, #0x18]
    b .L_5a0
.L_57c:
    str r2, [sp]
    str r1, [sp, #0x4]
    add r1, sp, #0x54
    str r1, [sp, #0x8]
    ldr r1, [sp, #0x64]
    mov r2, r9
    mov r3, r8
    bl func_020ac378
    str r0, [sp, #0x3c]
.L_5a0:
    ldr r0, [sp, #0x5c]
    cmp r0, #0x0
    bne .L_5d0
    cmp sl, #0x0
    beq .L_d14
    mov r0, #0x1
    str r0, [sp, #0x30]
    mov r0, #0x0
    str r0, [sp, #0x3c]
    str r0, [sp, #0x34]
    str r0, [sp, #0x18]
    b .L_610
.L_5d0:
    add r4, r4, r0
    ldr r0, [sp, #0x58]
    cmp r0, #0x0
    beq .L_610
    ldrb r0, [sp, #0x62]
    cmp r0, #0x7
    ldrne r0, [sp, #0x3c]
    rsbne r0, r0, #0x0
    strne r0, [sp, #0x3c]
    bne .L_610
    ldr r0, [sp, #0x34]
    rsbs r0, r0, #0x0
    str r0, [sp, #0x34]
    ldr r0, [sp, #0x18]
    rsc r0, r0, #0x0
    str r0, [sp, #0x18]
.L_610:
    cmp r5, #0x0
    beq .L_6c8
    ldrb r0, [sp, #0x62]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_6b4
    b .L_648
    b .L_654
    b .L_660
    b .L_66c
    b .L_678
    b .L_68c
    b .L_698
    b .L_6a4
.L_648:
    ldr r0, [sp, #0x3c]
    str r0, [r5]
    b .L_6b4
.L_654:
    ldr r0, [sp, #0x3c]
    strb r0, [r5]
    b .L_6b4
.L_660:
    ldr r0, [sp, #0x3c]
    strh r0, [r5]
    b .L_6b4
.L_66c:
    ldr r0, [sp, #0x3c]
    str r0, [r5]
    b .L_6b4
.L_678:
    ldr r0, [sp, #0x34]
    str r0, [r5]
    ldr r0, [sp, #0x18]
    str r0, [r5, #0x4]
    b .L_6b4
.L_68c:
    ldr r0, [sp, #0x3c]
    str r0, [r5]
    b .L_6b4
.L_698:
    ldr r0, [sp, #0x3c]
    str r0, [r5]
    b .L_6b4
.L_6a4:
    ldr r0, [sp, #0x34]
    str r0, [r5]
    ldr r0, [sp, #0x18]
    str r0, [r5, #0x4]
.L_6b4:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    ldreq r0, [sp, #0x44]
    addeq r0, r0, #0x1
    streq r0, [sp, #0x44]
.L_6c8:
    ldr r0, [sp, #0x40]
    add r0, r0, #0x1
    str r0, [sp, #0x40]
    b .L_d04
.L_6d8:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    beq .L_6f4
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020b2ff0
    b .L_740
.L_6f4:
    add r0, sp, #0x54
    str r0, [sp]
    ldr r0, [sp, #0x64]
    mov r1, r9
    mov r2, r8
    add r3, sp, #0x5c
    bl func_020ab03c
    ldr r2, [sp, #0x5c]
    cmp r2, #0x0
    bne .L_73c
    cmp sl, #0x0
    beq .L_d14
    mov r0, #0x1
    str r0, [sp, #0x30]
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020b2ff0
    b .L_740
.L_73c:
    add r4, r4, r2
.L_740:
    cmp r5, #0x0
    beq .L_78c
    ldrb r2, [sp, #0x62]
    cmp r2, #0x0
    beq .L_768
    cmp r2, #0x8
    beq .L_774
    cmp r2, #0x9
    stmeqia r5, {r0, r1}
    b .L_778
.L_768:
    bl func_020b1b88
    str r0, [r5]
    b .L_778
.L_774:
    stmia r5, {r0, r1}
.L_778:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    ldreq r0, [sp, #0x44]
    addeq r0, r0, #0x1
    streq r0, [sp, #0x44]
.L_78c:
    ldr r0, [sp, #0x40]
    add r0, r0, #0x1
    str r0, [sp, #0x40]
    b .L_d04
.L_79c:
    ldrb r0, [sp, #0x61]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0x64]
    cmp r5, #0x0
    beq .L_8e4
    cmp sl, #0x0
    beq .L_7d0
    ldr r0, [sp, #0x10]
    mov r7, #0x1
    add r0, r0, #0x4
    ldr fp, [r0, #-4]
    str r0, [sp, #0x10]
.L_7d0:
    ldr r0, [sp, #0x30]
    mov r1, #0x0
    cmp r0, #0x0
    str r1, [sp, #0x5c]
    beq .L_7f0
    cmp fp, #0x0
    strneb r1, [r5]
    b .L_d04
.L_7f0:
    mvn r0, #0x0
    str r5, [sp, #0x2c]
    str r0, [sp, #0x48]
    b .L_838
.L_800:
    ldrb r0, [sp, #0x62]
    strb r6, [sp, #0x50]
    cmp r0, #0xa
    ldrnesb r0, [sp, #0x50]
    strneb r0, [r5], #0x1
    bne .L_82c
    mov r0, r5
    add r1, sp, #0x50
    mov r2, #0x1
    bl func_020a70f0
    add r5, r5, #0x1
.L_82c:
    ldr r0, [sp, #0x5c]
    add r1, r0, #0x1
    str r1, [sp, #0x5c]
.L_838:
    ldr r0, [sp, #0x64]
    cmp r0, #0x0
    sub r0, r0, #0x1
    str r0, [sp, #0x64]
    beq .L_888
    cmp sl, #0x0
    beq .L_868
    cmp fp, r1
    movhi r7, #0x1
    movls r7, #0x0
    cmp r7, #0x0
    beq .L_888
.L_868:
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    blx r9
    mov r6, r0
    ldr r0, [sp, #0x48]
    cmp r6, r0
    bne .L_800
.L_888:
    strb r6, [sp, #0x50]
    ldr r0, [sp, #0x5c]
    cmp r0, #0x0
    beq .L_8a8
    cmp sl, #0x0
    beq .L_8d0
    cmp r7, #0x0
    bne .L_8d0
.L_8a8:
    cmp sl, #0x0
    beq .L_d14
    mov r0, #0x1
    cmp fp, #0x0
    str r0, [sp, #0x30]
    beq .L_d04
    ldr r0, [sp, #0x2c]
    mov r1, #0x0
    strb r1, [r0]
    b .L_d04
.L_8d0:
    add r4, r4, r0
    ldr r0, [sp, #0x44]
    add r0, r0, #0x1
    str r0, [sp, #0x44]
    b .L_944
.L_8e4:
    mov r0, #0x0
    str r0, [sp, #0x5c]
    mvn r5, #0x0
    b .L_904
.L_8f4:
    strb r6, [sp, #0x50]
    ldr r0, [sp, #0x5c]
    add r0, r0, #0x1
    str r0, [sp, #0x5c]
.L_904:
    ldr r0, [sp, #0x64]
    cmp r0, #0x0
    sub r0, r0, #0x1
    str r0, [sp, #0x64]
    beq .L_934
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    blx r9
    mov r6, r0
    cmp r6, r5
    bne .L_8f4
.L_934:
    strb r6, [sp, #0x50]
    ldr r0, [sp, #0x5c]
    cmp r0, #0x0
    beq .L_d14
.L_944:
    ldr r0, [sp, #0x40]
    add r0, r0, #0x1
    str r0, [sp, #0x40]
    b .L_d04
.L_954:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    bne .L_d04
    ldr r5, _LIT0
    b .L_96c
.L_968:
    add r4, r4, #0x1
.L_96c:
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    blx r9
    strb r0, [sp, #0x50]
    ldrsb r1, [sp, #0x50]
    cmp r1, #0x0
    blt .L_994
    cmp r1, #0x80
    blt .L_99c
.L_994:
    mov r0, #0x0
    b .L_9a8
.L_99c:
    mov r0, r1, lsl #0x1
    ldrh r0, [r5, r0]
    and r0, r0, #0x100
.L_9a8:
    cmp r0, #0x0
    bne .L_968
    cmp r1, #0x25
    beq .L_9d8
    mov r0, r8
    mov r2, #0x1
    blx r9
    cmp sl, #0x0
    beq .L_d14
    mov r0, #0x1
    str r0, [sp, #0x30]
    b .L_d04
.L_9d8:
    add r4, r4, #0x1
    b .L_d04
.L_9e0:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    bne .L_a5c
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    blx r9
    strb r0, [sp, #0x50]
    b .L_a1c
.L_a04:
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    add r4, r4, #0x1
    blx r9
    strb r0, [sp, #0x50]
.L_a1c:
    ldrsb r1, [sp, #0x50]
    cmp r1, #0x0
    blt .L_a30
    cmp r1, #0x80
    blt .L_a38
.L_a30:
    mov r0, #0x0
    b .L_a48
.L_a38:
    ldr r0, _LIT0
    mov r2, r1, lsl #0x1
    ldrh r0, [r0, r2]
    and r0, r0, #0x100
.L_a48:
    cmp r0, #0x0
    bne .L_a04
    mov r0, r8
    mov r2, #0x1
    blx r9
.L_a5c:
    cmp r5, #0x0
    beq .L_bd8
    cmp sl, #0x0
    beq .L_a84
    ldr r0, [sp, #0x10]
    mov r7, #0x1
    add r0, r0, #0x4
    str r0, [sp, #0x10]
    ldr r0, [r0, #-4]
    sub fp, r0, #0x1
.L_a84:
    ldr r0, [sp, #0x30]
    mov r1, #0x0
    cmp r0, #0x0
    str r1, [sp, #0x5c]
    beq .L_aa4
    cmp fp, #0x0
    strneb r1, [r5]
    b .L_d04
.L_aa4:
    mvn r0, #0x0
    str r5, [sp, #0x28]
    str r0, [sp, #0x4c]
    b .L_b08
.L_ab4:
    strb r6, [sp, #0x50]
    ldrsb r1, [sp, #0x50]
    add r2, sp, #0x60
    and r3, r1, #0xff
    add r2, r2, r3, asr #0x3
    ldrb r3, [r2, #0x8]
    and r0, r1, #0x7
    mov r2, #0x1
    tst r3, r2, lsl r0
    beq .L_b58
    ldrb r0, [sp, #0x62]
    cmp r0, #0xa
    strneb r1, [r5], #0x1
    bne .L_afc
    mov r0, r5
    add r1, sp, #0x50
    bl func_020a70f0
    add r5, r5, #0x2
.L_afc:
    ldr r0, [sp, #0x5c]
    add r1, r0, #0x1
    str r1, [sp, #0x5c]
.L_b08:
    ldr r0, [sp, #0x64]
    cmp r0, #0x0
    sub r0, r0, #0x1
    str r0, [sp, #0x64]
    beq .L_b58
    cmp sl, #0x0
    beq .L_b38
    cmp fp, r1
    movcs r7, #0x1
    movcc r7, #0x0
    cmp r7, #0x0
    beq .L_b58
.L_b38:
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    blx r9
    mov r6, r0
    ldr r0, [sp, #0x4c]
    cmp r6, r0
    bne .L_ab4
.L_b58:
    strb r6, [sp, #0x50]
    ldr r0, [sp, #0x5c]
    cmp r0, #0x0
    beq .L_b78
    cmp sl, #0x0
    beq .L_bb0
    cmp r7, #0x0
    bne .L_bb0
.L_b78:
    mov r0, r8
    ldrsb r1, [sp, #0x50]
    mov r2, #0x1
    blx r9
    cmp sl, #0x0
    beq .L_d14
    mov r0, #0x1
    cmp fp, #0x0
    str r0, [sp, #0x30]
    beq .L_d04
    ldr r0, [sp, #0x28]
    mov r1, #0x0
    strb r1, [r0]
    b .L_d04
.L_bb0:
    add r4, r4, r0
    ldrb r0, [sp, #0x62]
    cmp r0, #0xa
    mov r0, #0x0
    streqh r0, [r5]
    strneb r0, [r5]
    ldr r0, [sp, #0x44]
    add r0, r0, #0x1
    str r0, [sp, #0x44]
    b .L_c74
.L_bd8:
    mov r0, #0x0
    str r0, [sp, #0x5c]
    mvn r5, #0x0
    b .L_c1c
.L_be8:
    strb r6, [sp, #0x50]
    ldrsb r1, [sp, #0x50]
    and r0, r1, #0x7
    and r2, r1, #0xff
    add r1, sp, #0x60
    add r1, r1, r2, asr #0x3
    ldrb r2, [r1, #0x8]
    mov r1, #0x1
    tst r2, r1, lsl r0
    beq .L_c4c
    ldr r0, [sp, #0x5c]
    add r0, r0, #0x1
    str r0, [sp, #0x5c]
.L_c1c:
    ldr r0, [sp, #0x64]
    cmp r0, #0x0
    sub r0, r0, #0x1
    str r0, [sp, #0x64]
    beq .L_c4c
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    blx r9
    mov r6, r0
    cmp r6, r5
    bne .L_be8
.L_c4c:
    strb r6, [sp, #0x50]
    ldr r0, [sp, #0x5c]
    cmp r0, #0x0
    bne .L_c70
    mov r0, r8
    ldrsb r1, [sp, #0x50]
    mov r2, #0x1
    blx r9
    b .L_d04
.L_c70:
    add r4, r4, r0
.L_c74:
    ldr r0, [sp, #0x64]
    cmp r0, #0x0
    blt .L_c90
    mov r0, r8
    ldrsb r1, [sp, #0x50]
    mov r2, #0x1
    blx r9
.L_c90:
    ldr r0, [sp, #0x40]
    add r0, r0, #0x1
    str r0, [sp, #0x40]
    b .L_d04
.L_ca0:
    cmp r5, #0x0
    beq .L_d04
    ldrb r0, [sp, #0x62]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_d04
    b .L_cd8
    b .L_cf0
    b .L_ce0
    b .L_ce8
    b .L_d04
    b .L_d04
    b .L_d04
    b .L_cf8
.L_cd8:
    str r4, [r5]
    b .L_d04
.L_ce0:
    strh r4, [r5]
    b .L_d04
.L_ce8:
    str r4, [r5]
    b .L_d04
.L_cf0:
    strb r4, [r5]
    b .L_d04
.L_cf8:
    str r4, [r5]
    mov r0, r4, asr #0x1f
    str r0, [r5, #0x4]
.L_d04:
    ldr r0, [sp, #0xc]
    ldrsb r5, [r0]
    cmp r5, #0x0
    bne .L_48
.L_d14:
    mov r0, r8
    mov r1, #0x0
    mov r2, #0x2
    blx r9
    cmp r0, #0x0
    beq .L_d40
    ldr r0, [sp, #0x40]
    cmp r0, #0x0
    addeq sp, sp, #0x88
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d40:
    ldr r0, [sp, #0x44]
    add sp, sp, #0x88
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020c3660
_LIT1: .word data_02102758
