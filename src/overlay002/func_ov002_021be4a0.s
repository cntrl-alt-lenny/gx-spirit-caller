; func_ov002_021be4a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf1a8
        .extern data_ov002_022cf1ac
        .extern data_ov002_022cf270
        .extern data_ov002_022d016c
        .extern func_ov002_021b30ac
        .extern func_ov002_021b314c
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b3fd8
        .extern func_ov002_021b4054
        .extern func_ov002_021b4098
        .extern func_ov002_021b4120
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb068
        .extern func_ov002_021bb264
        .extern func_ov002_021bb9b4
        .extern func_ov002_021bba5c
        .extern func_ov002_021bbb1c
        .extern func_ov002_021bbbc0
        .extern func_ov002_021bbeac
        .extern func_ov002_021bcd80
        .extern func_ov002_021bd710
        .extern func_ov002_021bff50
        .extern func_ov002_021c0258
        .extern func_ov002_021c1ad0
        .extern func_ov002_021c1d4c
        .extern func_ov002_021c4c9c
        .global func_ov002_021be4a0
        .arm
func_ov002_021be4a0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x50
    mov sl, r0
    mov r9, r1
    str r2, [sp]
    bl func_ov002_021b9ecc
    mov r1, #0x14
    ldr r2, _LIT0
    and r3, sl, #0x1
    mul r8, r3, r2
    mul r7, r9, r1
    ldr r2, _LIT1
    mov r4, r0
    add r1, r2, r8
    str r1, [sp, #0x1c]
    ldr r1, [r1, r7]
    mov r0, r1, lsr #0x6
    tst r0, #0x1
    moveq fp, #0x1
    mov r0, r1, lsr #0x18
    movne fp, #0x0
    tst r0, #0x1
    bne .L_1a50
    mov r0, sl
    mov r1, r9
    bl func_ov002_021bd710
    cmp r0, #0x0
    beq .L_e24
    ldr r0, _LIT2
    add sp, sp, #0x50
    ldr r0, [r0, #0x4]
    cmp sl, r0
    ldreq r0, _LIT3
    moveq r1, #0x10
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e24:
    ldr r1, _LIT4
    mov r0, sl
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_ea4
    ldr r0, _LIT4
    cmp r4, r0
    bne .L_e5c
    ldr r0, _LIT5
    add r0, r0, r8
    ldr r0, [r7, r0]
    cmp r0, #0x0
    bne .L_ea4
.L_e5c:
    ldr r0, _LIT6
    mov r5, #0x0
    add r6, r0, r8
.L_e68:
    cmp r5, r9
    beq .L_e94
    mov r0, sl
    mov r1, r5
    bl func_ov002_021b9ecc
    ldr r1, _LIT4
    cmp r0, r1
    bne .L_e94
    ldr r0, [r6, #0x3c]
    cmp r0, #0x0
    bne .L_1a50
.L_e94:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r6, r6, #0x14
    ble .L_e68
.L_ea4:
    add r2, sp, #0x24
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c4c9c
    ldr r2, [sp, #0x38]
    mov r0, sl
    mov r1, r9
    ldr r6, [sp, #0x28]
    ldr r5, [sp, #0x34]
    str r2, [sp, #0x18]
    bl func_ov002_021c1ad0
    str r0, [sp, #0x14]
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c1d4c
    str r0, [sp, #0x10]
    ldr r2, _LIT7
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b314c
    cmp r0, #0x0
    bne .L_1a50
    ldr r2, _LIT8
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b314c
    cmp r0, #0x0
    bne .L_1a50
    ldr r2, _LIT9
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b314c
    cmp r0, #0x0
    bne .L_1a50
    ldr r2, _LIT10
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b314c
    cmp r0, #0x0
    bne .L_1a50
    ldr r2, _LIT11
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b314c
    cmp r0, #0x0
    bne .L_1a50
    ldr r2, _LIT12
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b314c
    cmp r0, #0x0
    bne .L_1a50
    ldr r0, [sp, #0x10]
    and r0, r0, #0x2
    str r0, [sp, #0x4]
    cmp r0, #0x0
    bgt .L_fa0
    ldr r1, _LIT13
    ldr r2, [sp, #0x18]
    rsb r0, sl, #0x1
    bl func_ov002_021bbb1c
    cmp r0, #0x0
    bne .L_1a50
.L_fa0:
    ldr r0, [sp, #0x14]
    and r0, r0, #0x1
    str r0, [sp, #0xc]
    cmp r0, #0x0
    bgt .L_fc8
    mov r0, sl
    mov r1, #0x1400
    bl func_ov002_021bb9b4
    cmp r0, #0x0
    bne .L_1a50
.L_fc8:
    ldr r0, [sp, #0x14]
    and r0, r0, #0x2
    str r0, [sp, #0x8]
    cmp r0, #0x0
    bgt .L_ff0
    rsb r0, sl, #0x1
    mov r1, #0x1400
    bl func_ov002_021bb9b4
    cmp r0, #0x0
    bne .L_1a50
.L_ff0:
    ldr r0, _LIT14
    ldr r2, [sp, #0x14]
    mov r1, sl
    bl func_ov002_021bb264
    cmp r0, #0x0
    beq .L_1034
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, r7]
    mov r0, r1, lsr #0x10
    tst r0, #0x1
    bne .L_1a50
    mov r0, r1, lsr #0x11
    tst r0, #0x1
    bne .L_1a50
    mov r0, r1, lsr #0x12
    tst r0, #0x1
    bne .L_1a50
.L_1034:
    cmp r5, #0x4
    blt .L_1054
    ldr r0, _LIT15
    ldr r2, [sp, #0x10]
    mov r1, sl
    bl func_ov002_021bb264
    cmp r0, #0x0
    bne .L_1a50
.L_1054:
    ldr r0, _LIT16
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_10a8
    mov r0, sl
    mov r1, #0xb
    ldr r2, _LIT16
    bl func_ov002_021b4120
    cmp r0, #0x0
    blt .L_10a8
    ldr r1, _LIT6
    add r1, r1, r8
    add r1, r1, #0x30
    ldr r1, [r1, r7]
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    cmp r0, r1
    bne .L_1a50
.L_10a8:
    mov r0, sl
    mov r1, r9
    mov r2, #0x1280
    bl func_ov002_021b30ac
    cmp r0, #0x0
    bne .L_1a50
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT17
    bl func_ov002_021b30ac
    cmp r0, #0x0
    bne .L_1a50
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT18
    bl func_ov002_021b30ac
    cmp r0, #0x0
    bne .L_1a50
    ldr r0, _LIT19
    bl func_ov002_021bb068
    ldr r1, _LIT19
    cmp r4, r1
    moveq r1, #0x1
    movne r1, #0x0
    sub r0, r0, r1
    cmp r0, #0x0
    bgt .L_1a50
    rsb r5, sl, #0x1
    mov r0, r5
    ldr r1, _LIT20
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_115c
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, r7]
    mov r0, r1, lsr #0x10
    tst r0, #0x1
    bne .L_1a50
    mov r0, r1, lsr #0x11
    tst r0, #0x1
    bne .L_1a50
    mov r0, r1, lsr #0x12
    tst r0, #0x1
    bne .L_1a50
.L_115c:
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT21
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1a50
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT22
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1a50
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT23
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1a50
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT24
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1a50
    mov r0, sl
    mov r1, r9
    mov r2, #0x1900
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1a50
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT25
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1a50
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT26
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1a50
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT27
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1a50
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT28
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1a50
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT29
    mov r3, #0x0
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    bne .L_1a50
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT30
    mov r3, #0x1
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    bne .L_1a50
    mov r0, sl
    mov r1, #0xb
    ldr r2, _LIT31
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_129c
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT31
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_1a50
.L_129c:
    mov r0, sl
    mov r1, #0xb
    ldr r2, _LIT32
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_12f8
    ldr r1, _LIT6
    ldr r2, _LIT32
    add r1, r1, r8
    add r1, r1, #0x30
    str r1, [sp, #0x20]
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b4120
    ldr r1, [sp, #0x20]
    ldr r2, [r1, r7]
    mov r1, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r1, r2, r1, lsr #0x1f
    cmp r1, r0
    bne .L_1a50
.L_12f8:
    mov r0, sl
    mov r1, #0xb
    ldr r2, _LIT33
    mov r3, #0x2
    bl func_ov002_021b4054
    cmp r0, #0x0
    bne .L_1a50
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    bgt .L_1338
    mov r0, sl
    mov r1, #0xb
    ldr r2, _LIT34
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1a50
.L_1338:
    ldr r0, _LIT35
    cmp r4, r0
    bgt .L_141c
    bge .L_15a8
    sub r1, r0, #0x39c
    cmp r4, r1
    bgt .L_13b8
    ldr r0, _LIT36
    cmp r4, r0
    blt .L_1370
    addne r0, r0, #0x1
    cmpne r4, r0
    beq .L_1508
    b .L_1608
.L_1370:
    ldr r1, _LIT37
    cmp r4, r1
    bgt .L_13a8
    bge .L_14ec
    sub r0, r1, #0x51
    cmp r4, r0
    bgt .L_1608
    sub r0, r1, #0x52
    cmp r4, r0
    blt .L_1608
    subne r0, r1, #0x51
    cmpne r4, r0
    beq .L_14a0
    b .L_1608
.L_13a8:
    sub r0, r0, #0x1
    cmp r4, r0
    beq .L_1508
    b .L_1608
.L_13b8:
    sub r1, r0, #0xb8
    cmp r4, r1
    bgt .L_13d8
    bge .L_1508
    rsb r0, r0, #0x28c0
    cmp r4, r0
    beq .L_1508
    b .L_1608
.L_13d8:
    sub r1, r0, #0xb7
    cmp r4, r1
    bgt .L_13f4
    sub r0, r0, #0xb7
    cmp r4, r0
    beq .L_1508
    b .L_1608
.L_13f4:
    sub r1, r0, #0xb5
    cmp r4, r1
    bgt .L_1608
    sub r1, r0, #0xb6
    cmp r4, r1
    blt .L_1608
    subne r0, r0, #0xb5
    cmpne r4, r0
    beq .L_1508
    b .L_1608
.L_141c:
    add r1, r0, #0xae
    cmp r4, r1
    bgt .L_145c
    bge .L_158c
    add r1, r0, #0x1b
    cmp r4, r1
    bgt .L_144c
    bge .L_156c
    add r0, r0, #0x7
    cmp r4, r0
    beq .L_1540
    b .L_1608
.L_144c:
    add r0, r0, #0x1e
    cmp r4, r0
    beq .L_156c
    b .L_1608
.L_145c:
    add r1, r0, #0x1ac
    cmp r4, r1
    bgt .L_147c
    bge .L_15e0
    add r0, r0, #0xb0
    cmp r4, r0
    beq .L_158c
    b .L_1608
.L_147c:
    ldr r0, _LIT38
    cmp r4, r0
    bgt .L_1490
    beq .L_15e0
    b .L_1608
.L_1490:
    add r0, r0, #0x200
    cmp r4, r0
    beq .L_158c
    b .L_1608
.L_14a0:
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT39
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_14d0
    mov r0, sl
    mov r1, #0xb
    ldr r2, _LIT39
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1a50
.L_14d0:
    mov r0, sl
    mov r1, #0xb
    ldr r2, _LIT40
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1a50
    b .L_1608
.L_14ec:
    mov r0, sl
    mov r1, #0xb
    ldr r2, _LIT41
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1a50
    b .L_1608
.L_1508:
    cmp fp, #0x0
    beq .L_1608
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, r7]
    mov r0, r1, lsr #0x10
    tst r0, #0x1
    bne .L_1a50
    mov r0, r1, lsr #0x11
    tst r0, #0x1
    bne .L_1a50
    mov r0, r1, lsr #0x12
    tst r0, #0x1
    beq .L_1608
    b .L_1a50
.L_1540:
    cmp fp, #0x0
    beq .L_1608
    mov r0, sl
    bl func_ov002_021bbeac
    cmp r0, #0x1
    bgt .L_1a50
    ldr r0, _LIT42
    ldr r0, [r0, r8]
    cmp r0, #0x0
    bne .L_1a50
    b .L_1608
.L_156c:
    ldr r0, _LIT6
    add r0, r0, r8
    add r0, r0, r7
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    cmp r4, r0, lsr #0x13
    bne .L_1608
    b .L_1a50
.L_158c:
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT43
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1a50
    b .L_1608
.L_15a8:
    cmp fp, #0x0
    beq .L_1608
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, r7]
    mov r0, r1, lsr #0x10
    tst r0, #0x1
    bne .L_1a50
    mov r0, r1, lsr #0x11
    tst r0, #0x1
    bne .L_1a50
    mov r0, r1, lsr #0x12
    tst r0, #0x1
    beq .L_1608
    b .L_1a50
.L_15e0:
    cmp fp, #0x0
    beq .L_1608
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, r7]
    mov r0, r1, lsr #0x10
    tst r0, #0x1
    bne .L_1a50
    mov r0, r1, lsr #0x12
    tst r0, #0x1
    bne .L_1a50
.L_1608:
    mov r0, r5
    bl func_ov002_021c0258
    cmp r0, #0x0
    bne .L_162c
    mov r0, sl
    mov r1, r9
    bl func_ov002_021bff50
    cmp r0, #0x0
    beq .L_1a50
.L_162c:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_1914
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bgt .L_1658
    mov r0, r5
    ldr r1, _LIT44
    bl func_ov002_021bb9b4
    cmp r0, #0x0
    bne .L_1a50
.L_1658:
    cmp r6, #0x7
    beq .L_1678
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT45
    bl func_ov002_021b314c
    cmp r0, #0x0
    bne .L_1a50
.L_1678:
    ldr r1, _LIT46
    ldr r0, [sp, #0x18]
    cmp r0, r1
    blt .L_16a0
    ldr r0, _LIT47
    ldr r2, [sp, #0x14]
    mov r1, sl
    bl func_ov002_021bb264
    cmp r0, #0x0
    bne .L_1a50
.L_16a0:
    cmp r6, #0xa
    bne .L_16cc
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bgt .L_16cc
    mov r0, r5
    ldr r1, _LIT48
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    bne .L_1a50
.L_16cc:
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT49
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1a50
    ldr r0, _LIT50
    ldr r2, [sp, #0x14]
    mov r1, sl
    bl func_ov002_021bb264
    cmp r0, #0x0
    beq .L_1750
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, r7]
    mov r0, r1, lsr #0x10
    tst r0, #0x1
    bne .L_1728
    mov r0, r1, lsr #0x11
    tst r0, #0x1
    bne .L_1728
    mov r0, r1, lsr #0x12
    tst r0, #0x1
    beq .L_1750
.L_1728:
    ldr r2, _LIT51
    ldr r0, [r2, r8]
    cmp r6, r0
    beq .L_1a50
    and r1, r5, #0x1
    ldr r0, _LIT0
    mul r0, r1, r0
    ldr r0, [r2, r0]
    cmp r6, r0
    beq .L_1a50
.L_1750:
    ldr r0, [sp, #0x10]
    and r0, r0, #0x1
    cmp r0, #0x0
    bgt .L_1778
    ldr r1, _LIT52
    mov r0, sl
    mov r2, r6
    bl func_ov002_021bba5c
    cmp r0, #0x0
    bne .L_1a50
.L_1778:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bgt .L_179c
    ldr r1, _LIT52
    mov r0, r5
    mov r2, r6
    bl func_ov002_021bba5c
    cmp r0, #0x0
    bne .L_1a50
.L_179c:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bgt .L_17f8
    ldr r1, _LIT53
    mov r0, r5
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_17f8
    mov r6, #0x1
    mov r7, r6
.L_17c8:
    ldr r0, [sp, #0x30]
    tst r0, r7, lsl r6
    beq .L_17ec
    ldr r1, _LIT53
    mov r0, r5
    mov r2, r6
    bl func_ov002_021bba5c
    cmp r0, #0x0
    bne .L_1a50
.L_17ec:
    add r6, r6, #0x1
    cmp r6, #0x6
    ble .L_17c8
.L_17f8:
    ldr r1, _LIT54
    ldr r0, [sp, #0x18]
    cmp r0, r1
    blt .L_1818
    ldr r0, _LIT55
    bl func_ov002_021bb068
    cmp r0, #0x0
    bne .L_1a50
.L_1818:
    ldr r2, _LIT56
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1a50
    ldr r2, _LIT57
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1a50
    ldr r2, _LIT58
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b4098
    cmp r0, #0x0
    bne .L_1a50
    ldr r1, _LIT59
    cmp r4, r1
    bgt .L_18a8
    sub r0, r1, #0x2
    cmp r4, r0
    blt .L_1884
    cmpne r4, r1
    beq .L_1a50
    b .L_1914
.L_1884:
    sub r0, r1, #0x3d4
    cmp r4, r0
    bgt .L_1898
    beq .L_18cc
    b .L_1914
.L_1898:
    ldr r0, _LIT60
    cmp r4, r0
    beq .L_18d8
    b .L_1914
.L_18a8:
    ldr r0, _LIT61
    cmp r4, r0
    bgt .L_18bc
    beq .L_1a50
    b .L_1914
.L_18bc:
    ldr r0, _LIT62
    cmp r4, r0
    beq .L_18fc
    b .L_1914
.L_18cc:
    cmp fp, #0x0
    bne .L_1a50
    b .L_1914
.L_18d8:
    cmp fp, #0x0
    beq .L_1914
    mov r0, sl
    mov r2, r9
    mov r1, #0x1
    bl func_ov002_021bbbc0
    cmp r0, #0x0
    beq .L_1a50
    b .L_1914
.L_18fc:
    ldr r2, _LIT43
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_1a50
.L_1914:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_1a44
    cmp fp, #0x0
    mov r6, #0x0
    beq .L_19f0
    ldr r0, _LIT63
    cmp r4, r0
    bgt .L_1988
    bge .L_19c4
    sub r1, r0, #0xc2
    cmp r4, r1
    bgt .L_1958
    sub r0, r0, #0xc2
    cmp r4, r0
    beq .L_19b4
    b .L_19f0
.L_1958:
    sub r1, r0, #0x10
    cmp r4, r1
    bgt .L_19f0
    sub r1, r0, #0x12
    cmp r4, r1
    blt .L_19f0
    subne r1, r0, #0x11
    cmpne r4, r1
    subne r0, r0, #0x10
    cmpne r4, r0
    beq .L_19bc
    b .L_19f0
.L_1988:
    add r1, r0, #0x16
    cmp r4, r1
    bgt .L_19a8
    bge .L_19bc
    add r0, r0, #0x11
    cmp r4, r0
    beq .L_19c4
    b .L_19f0
.L_19a8:
    ldr r0, _LIT64
    cmp r4, r0
    bne .L_19f0
.L_19b4:
    mov r6, #0x3e8
    b .L_19f0
.L_19bc:
    mov r6, #0x1f4
    b .L_19f0
.L_19c4:
    and r1, sl, #0xff
    and r0, r9, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r1, r0, lsl #0x10
    mov r0, sl
    mov r1, r1, lsr #0x10
    bl func_ov002_021bcd80
    cmp r0, #0x0
    addeq sp, sp, #0x50
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19f0:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bgt .L_1a1c
    ldr r1, _LIT65
    mov r0, r5
    mvn r2, #0x0
    bl func_ov002_021bae7c
    ldr r1, _LIT66
    ldr r1, [r1, r8]
    cmp r1, r0
    bcc .L_1a50
.L_1a1c:
    ldr r0, _LIT67
    ldr r2, [sp, #0x14]
    mov r1, sl
    bl func_ov002_021bb264
    mov r1, #0x1f4
    mla r1, r0, r1, r6
    ldr r2, _LIT6
    ldr r0, [r2, r8]
    cmp r0, r1
    ble .L_1a50
.L_1a44:
    add sp, sp, #0x50
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a50:
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    cmp sl, r0
    ldreq r0, _LIT3
    moveq r1, #0x13
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1ac
_LIT2: .word data_ov002_022cd73c
_LIT3: .word data_ov002_022d016c
_LIT4: .word 0x00001a79
_LIT5: .word data_ov002_022cf1a8
_LIT6: .word data_ov002_022cf16c
_LIT7: .word 0x0000149d
_LIT8: .word 0x000013f3
_LIT9: .word 0x00001842
_LIT10: .word 0x00001103
_LIT11: .word 0x00001243
_LIT12: .word 0x000014b2
_LIT13: .word 0x00001766
_LIT14: .word 0x000014a1
_LIT15: .word 0x0000140e
_LIT16: .word 0x00001469
_LIT17: .word 0x0000128a
_LIT18: .word 0x00001743
_LIT19: .word 0x00001284
_LIT20: .word 0x00001865
_LIT21: .word 0x00001944
_LIT22: .word 0x00001208
_LIT23: .word 0x000015ed
_LIT24: .word 0x0000156a
_LIT25: .word 0x000014f7
_LIT26: .word 0x00001a7b
_LIT27: .word 0x00001af4
_LIT28: .word 0x00001af5
_LIT29: .word 0x00001819
_LIT30: .word 0x00001890
_LIT31: .word 0x000015ff
_LIT32: .word 0x0000195b
_LIT33: .word 0x00001a02
_LIT34: .word 0x00001a0d
_LIT35: .word 0x0000161b
_LIT36: .word 0x0000127e
_LIT37: .word 0x00000ff8
_LIT38: .word 0x000017c8
_LIT39: .word 0x0000175b
_LIT40: .word 0x000015e0
_LIT41: .word 0x000017f6
_LIT42: .word data_ov002_022cf178
_LIT43: .word 0x00000fb6
_LIT44: .word 0x00001102
_LIT45: .word 0x0000130e
_LIT46: .word 0x000005dc
_LIT47: .word 0x0000134a
_LIT48: .word 0x000012e0
_LIT49: .word 0x000012d1
_LIT50: .word 0x000014d1
_LIT51: .word data_ov002_022cf270
_LIT52: .word 0x00001358
_LIT53: .word 0x00001a19
_LIT54: .word 0x0000076c
_LIT55: .word 0x00001523
_LIT56: .word 0x0000182c
_LIT57: .word 0x00001886
_LIT58: .word 0x0000172d
_LIT59: .word 0x00001815
_LIT60: .word 0x000014db
_LIT61: .word 0x0000195a
_LIT62: .word 0x00001aa0
_LIT63: .word 0x0000128f
_LIT64: .word 0x000018a4
_LIT65: .word 0x0000131d
_LIT66: .word data_ov002_022cf17c
_LIT67: .word 0x00001320
