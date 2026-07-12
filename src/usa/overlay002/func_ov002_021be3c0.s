; func_ov002_021be3c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf09c
        .extern data_ov002_022cf0c8
        .extern data_ov002_022cf0cc
        .extern data_ov002_022cf190
        .extern data_ov002_022d008c
        .extern func_ov002_021b2fcc
        .extern func_ov002_021b306c
        .extern func_ov002_021b3dec
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b3f74
        .extern func_ov002_021b3fb8
        .extern func_ov002_021b4040
        .extern func_ov002_021b9dec
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_021bb184
        .extern func_ov002_021bb8d4
        .extern func_ov002_021bb97c
        .extern func_ov002_021bba3c
        .extern func_ov002_021bbae0
        .extern func_ov002_021bbdcc
        .extern func_ov002_021bcca0
        .extern func_ov002_021bd630
        .extern func_ov002_021bfe70
        .extern func_ov002_021c0178
        .extern func_ov002_021c19f0
        .extern func_ov002_021c1c6c
        .extern func_ov002_021c4bbc
        .global func_ov002_021be3c0
        .arm
func_ov002_021be3c0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x50
    mov sl, r0
    mov r9, r1
    str r2, [sp]
    bl func_ov002_021b9dec
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
    bne .L_cc0
    mov r0, sl
    mov r1, r9
    bl func_ov002_021bd630
    cmp r0, #0x0
    beq .L_94
    ldr r0, _LIT2
    add sp, sp, #0x50
    ldr r0, [r0, #0x4]
    cmp sl, r0
    ldreq r0, _LIT3
    moveq r1, #0x10
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_94:
    ldr r1, _LIT4
    mov r0, sl
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    beq .L_114
    ldr r0, _LIT4
    cmp r4, r0
    bne .L_cc
    ldr r0, _LIT5
    add r0, r0, r8
    ldr r0, [r7, r0]
    cmp r0, #0x0
    bne .L_114
.L_cc:
    ldr r0, _LIT6
    mov r5, #0x0
    add r6, r0, r8
.L_d8:
    cmp r5, r9
    beq .L_104
    mov r0, sl
    mov r1, r5
    bl func_ov002_021b9dec
    ldr r1, _LIT4
    cmp r0, r1
    bne .L_104
    ldr r0, [r6, #0x3c]
    cmp r0, #0x0
    bne .L_cc0
.L_104:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r6, r6, #0x14
    ble .L_d8
.L_114:
    add r2, sp, #0x24
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c4bbc
    ldr r2, [sp, #0x38]
    mov r0, sl
    mov r1, r9
    ldr r6, [sp, #0x28]
    ldr r5, [sp, #0x34]
    str r2, [sp, #0x18]
    bl func_ov002_021c19f0
    str r0, [sp, #0x14]
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c1c6c
    str r0, [sp, #0x10]
    ldr r2, _LIT7
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b306c
    cmp r0, #0x0
    bne .L_cc0
    ldr r2, _LIT8
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b306c
    cmp r0, #0x0
    bne .L_cc0
    ldr r2, _LIT9
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b306c
    cmp r0, #0x0
    bne .L_cc0
    ldr r2, _LIT10
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b306c
    cmp r0, #0x0
    bne .L_cc0
    ldr r2, _LIT11
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b306c
    cmp r0, #0x0
    bne .L_cc0
    ldr r2, _LIT12
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b306c
    cmp r0, #0x0
    bne .L_cc0
    ldr r0, [sp, #0x10]
    and r0, r0, #0x2
    str r0, [sp, #0x4]
    cmp r0, #0x0
    bgt .L_210
    ldr r1, _LIT13
    ldr r2, [sp, #0x18]
    rsb r0, sl, #0x1
    bl func_ov002_021bba3c
    cmp r0, #0x0
    bne .L_cc0
.L_210:
    ldr r0, [sp, #0x14]
    and r0, r0, #0x1
    str r0, [sp, #0xc]
    cmp r0, #0x0
    bgt .L_238
    mov r0, sl
    mov r1, #0x1400
    bl func_ov002_021bb8d4
    cmp r0, #0x0
    bne .L_cc0
.L_238:
    ldr r0, [sp, #0x14]
    and r0, r0, #0x2
    str r0, [sp, #0x8]
    cmp r0, #0x0
    bgt .L_260
    rsb r0, sl, #0x1
    mov r1, #0x1400
    bl func_ov002_021bb8d4
    cmp r0, #0x0
    bne .L_cc0
.L_260:
    ldr r0, _LIT14
    ldr r2, [sp, #0x14]
    mov r1, sl
    bl func_ov002_021bb184
    cmp r0, #0x0
    beq .L_2a4
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, r7]
    mov r0, r1, lsr #0x10
    tst r0, #0x1
    bne .L_cc0
    mov r0, r1, lsr #0x11
    tst r0, #0x1
    bne .L_cc0
    mov r0, r1, lsr #0x12
    tst r0, #0x1
    bne .L_cc0
.L_2a4:
    cmp r5, #0x4
    blt .L_2c4
    ldr r0, _LIT15
    ldr r2, [sp, #0x10]
    mov r1, sl
    bl func_ov002_021bb184
    cmp r0, #0x0
    bne .L_cc0
.L_2c4:
    ldr r0, _LIT16
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_318
    mov r0, sl
    mov r1, #0xb
    ldr r2, _LIT16
    bl func_ov002_021b4040
    cmp r0, #0x0
    blt .L_318
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
    bne .L_cc0
.L_318:
    mov r0, sl
    mov r1, r9
    mov r2, #0x1280
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    bne .L_cc0
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT17
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    bne .L_cc0
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT18
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    bne .L_cc0
    ldr r0, _LIT19
    bl func_ov002_021baf88
    ldr r1, _LIT19
    cmp r4, r1
    moveq r1, #0x1
    movne r1, #0x0
    sub r0, r0, r1
    cmp r0, #0x0
    bgt .L_cc0
    rsb r5, sl, #0x1
    mov r0, r5
    ldr r1, _LIT20
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    beq .L_3cc
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, r7]
    mov r0, r1, lsr #0x10
    tst r0, #0x1
    bne .L_cc0
    mov r0, r1, lsr #0x11
    tst r0, #0x1
    bne .L_cc0
    mov r0, r1, lsr #0x12
    tst r0, #0x1
    bne .L_cc0
.L_3cc:
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT21
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_cc0
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT22
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_cc0
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT23
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_cc0
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT24
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_cc0
    mov r0, sl
    mov r1, r9
    mov r2, #0x1900
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_cc0
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT25
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_cc0
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT26
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_cc0
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT27
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_cc0
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT28
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_cc0
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT29
    mov r3, #0x0
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_cc0
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT30
    mov r3, #0x1
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_cc0
    mov r0, sl
    mov r1, #0xb
    ldr r2, _LIT31
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_50c
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT31
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_cc0
.L_50c:
    mov r0, sl
    mov r1, #0xb
    ldr r2, _LIT32
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_568
    ldr r1, _LIT6
    ldr r2, _LIT32
    add r1, r1, r8
    add r1, r1, #0x30
    str r1, [sp, #0x20]
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b4040
    ldr r1, [sp, #0x20]
    ldr r2, [r1, r7]
    mov r1, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r1, r2, r1, lsr #0x1f
    cmp r1, r0
    bne .L_cc0
.L_568:
    mov r0, sl
    mov r1, #0xb
    ldr r2, _LIT33
    mov r3, #0x2
    bl func_ov002_021b3f74
    cmp r0, #0x0
    bne .L_cc0
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    bgt .L_5a8
    mov r0, sl
    mov r1, #0xb
    ldr r2, _LIT34
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_cc0
.L_5a8:
    ldr r0, _LIT35
    cmp r4, r0
    bgt .L_68c
    bge .L_818
    sub r1, r0, #0x39c
    cmp r4, r1
    bgt .L_628
    ldr r0, _LIT36
    cmp r4, r0
    blt .L_5e0
    addne r0, r0, #0x1
    cmpne r4, r0
    beq .L_778
    b .L_878
.L_5e0:
    ldr r1, _LIT37
    cmp r4, r1
    bgt .L_618
    bge .L_75c
    sub r0, r1, #0x51
    cmp r4, r0
    bgt .L_878
    sub r0, r1, #0x52
    cmp r4, r0
    blt .L_878
    subne r0, r1, #0x51
    cmpne r4, r0
    beq .L_710
    b .L_878
.L_618:
    sub r0, r0, #0x1
    cmp r4, r0
    beq .L_778
    b .L_878
.L_628:
    sub r1, r0, #0xb8
    cmp r4, r1
    bgt .L_648
    bge .L_778
    rsb r0, r0, #0x28c0
    cmp r4, r0
    beq .L_778
    b .L_878
.L_648:
    sub r1, r0, #0xb7
    cmp r4, r1
    bgt .L_664
    sub r0, r0, #0xb7
    cmp r4, r0
    beq .L_778
    b .L_878
.L_664:
    sub r1, r0, #0xb5
    cmp r4, r1
    bgt .L_878
    sub r1, r0, #0xb6
    cmp r4, r1
    blt .L_878
    subne r0, r0, #0xb5
    cmpne r4, r0
    beq .L_778
    b .L_878
.L_68c:
    add r1, r0, #0xae
    cmp r4, r1
    bgt .L_6cc
    bge .L_7fc
    add r1, r0, #0x1b
    cmp r4, r1
    bgt .L_6bc
    bge .L_7dc
    add r0, r0, #0x7
    cmp r4, r0
    beq .L_7b0
    b .L_878
.L_6bc:
    add r0, r0, #0x1e
    cmp r4, r0
    beq .L_7dc
    b .L_878
.L_6cc:
    add r1, r0, #0x1ac
    cmp r4, r1
    bgt .L_6ec
    bge .L_850
    add r0, r0, #0xb0
    cmp r4, r0
    beq .L_7fc
    b .L_878
.L_6ec:
    ldr r0, _LIT38
    cmp r4, r0
    bgt .L_700
    beq .L_850
    b .L_878
.L_700:
    add r0, r0, #0x200
    cmp r4, r0
    beq .L_7fc
    b .L_878
.L_710:
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT39
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_740
    mov r0, sl
    mov r1, #0xb
    ldr r2, _LIT39
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_cc0
.L_740:
    mov r0, sl
    mov r1, #0xb
    ldr r2, _LIT40
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_cc0
    b .L_878
.L_75c:
    mov r0, sl
    mov r1, #0xb
    ldr r2, _LIT41
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_cc0
    b .L_878
.L_778:
    cmp fp, #0x0
    beq .L_878
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, r7]
    mov r0, r1, lsr #0x10
    tst r0, #0x1
    bne .L_cc0
    mov r0, r1, lsr #0x11
    tst r0, #0x1
    bne .L_cc0
    mov r0, r1, lsr #0x12
    tst r0, #0x1
    beq .L_878
    b .L_cc0
.L_7b0:
    cmp fp, #0x0
    beq .L_878
    mov r0, sl
    bl func_ov002_021bbdcc
    cmp r0, #0x1
    bgt .L_cc0
    ldr r0, _LIT42
    ldr r0, [r0, r8]
    cmp r0, #0x0
    bne .L_cc0
    b .L_878
.L_7dc:
    ldr r0, _LIT6
    add r0, r0, r8
    add r0, r0, r7
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    cmp r4, r0, lsr #0x13
    bne .L_878
    b .L_cc0
.L_7fc:
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT43
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_cc0
    b .L_878
.L_818:
    cmp fp, #0x0
    beq .L_878
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, r7]
    mov r0, r1, lsr #0x10
    tst r0, #0x1
    bne .L_cc0
    mov r0, r1, lsr #0x11
    tst r0, #0x1
    bne .L_cc0
    mov r0, r1, lsr #0x12
    tst r0, #0x1
    beq .L_878
    b .L_cc0
.L_850:
    cmp fp, #0x0
    beq .L_878
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, r7]
    mov r0, r1, lsr #0x10
    tst r0, #0x1
    bne .L_cc0
    mov r0, r1, lsr #0x12
    tst r0, #0x1
    bne .L_cc0
.L_878:
    mov r0, r5
    bl func_ov002_021c0178
    cmp r0, #0x0
    bne .L_89c
    mov r0, sl
    mov r1, r9
    bl func_ov002_021bfe70
    cmp r0, #0x0
    beq .L_cc0
.L_89c:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_b84
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bgt .L_8c8
    mov r0, r5
    ldr r1, _LIT44
    bl func_ov002_021bb8d4
    cmp r0, #0x0
    bne .L_cc0
.L_8c8:
    cmp r6, #0x7
    beq .L_8e8
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT45
    bl func_ov002_021b306c
    cmp r0, #0x0
    bne .L_cc0
.L_8e8:
    ldr r1, _LIT46
    ldr r0, [sp, #0x18]
    cmp r0, r1
    blt .L_910
    ldr r0, _LIT47
    ldr r2, [sp, #0x14]
    mov r1, sl
    bl func_ov002_021bb184
    cmp r0, #0x0
    bne .L_cc0
.L_910:
    cmp r6, #0xa
    bne .L_93c
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bgt .L_93c
    mov r0, r5
    ldr r1, _LIT48
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    bne .L_cc0
.L_93c:
    mov r0, sl
    mov r1, r9
    ldr r2, _LIT49
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_cc0
    ldr r0, _LIT50
    ldr r2, [sp, #0x14]
    mov r1, sl
    bl func_ov002_021bb184
    cmp r0, #0x0
    beq .L_9c0
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, r7]
    mov r0, r1, lsr #0x10
    tst r0, #0x1
    bne .L_998
    mov r0, r1, lsr #0x11
    tst r0, #0x1
    bne .L_998
    mov r0, r1, lsr #0x12
    tst r0, #0x1
    beq .L_9c0
.L_998:
    ldr r2, _LIT51
    ldr r0, [r2, r8]
    cmp r6, r0
    beq .L_cc0
    and r1, r5, #0x1
    ldr r0, _LIT0
    mul r0, r1, r0
    ldr r0, [r2, r0]
    cmp r6, r0
    beq .L_cc0
.L_9c0:
    ldr r0, [sp, #0x10]
    and r0, r0, #0x1
    cmp r0, #0x0
    bgt .L_9e8
    ldr r1, _LIT52
    mov r0, sl
    mov r2, r6
    bl func_ov002_021bb97c
    cmp r0, #0x0
    bne .L_cc0
.L_9e8:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bgt .L_a0c
    ldr r1, _LIT52
    mov r0, r5
    mov r2, r6
    bl func_ov002_021bb97c
    cmp r0, #0x0
    bne .L_cc0
.L_a0c:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bgt .L_a68
    ldr r1, _LIT53
    mov r0, r5
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    beq .L_a68
    mov r6, #0x1
    mov r7, r6
.L_a38:
    ldr r0, [sp, #0x30]
    tst r0, r7, lsl r6
    beq .L_a5c
    ldr r1, _LIT53
    mov r0, r5
    mov r2, r6
    bl func_ov002_021bb97c
    cmp r0, #0x0
    bne .L_cc0
.L_a5c:
    add r6, r6, #0x1
    cmp r6, #0x6
    ble .L_a38
.L_a68:
    ldr r1, _LIT54
    ldr r0, [sp, #0x18]
    cmp r0, r1
    blt .L_a88
    ldr r0, _LIT55
    bl func_ov002_021baf88
    cmp r0, #0x0
    bne .L_cc0
.L_a88:
    ldr r2, _LIT56
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_cc0
    ldr r2, _LIT57
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_cc0
    ldr r2, _LIT58
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3fb8
    cmp r0, #0x0
    bne .L_cc0
    ldr r1, _LIT59
    cmp r4, r1
    bgt .L_b18
    sub r0, r1, #0x2
    cmp r4, r0
    blt .L_af4
    cmpne r4, r1
    beq .L_cc0
    b .L_b84
.L_af4:
    sub r0, r1, #0x3d4
    cmp r4, r0
    bgt .L_b08
    beq .L_b3c
    b .L_b84
.L_b08:
    ldr r0, _LIT60
    cmp r4, r0
    beq .L_b48
    b .L_b84
.L_b18:
    ldr r0, _LIT61
    cmp r4, r0
    bgt .L_b2c
    beq .L_cc0
    b .L_b84
.L_b2c:
    ldr r0, _LIT62
    cmp r4, r0
    beq .L_b6c
    b .L_b84
.L_b3c:
    cmp fp, #0x0
    bne .L_cc0
    b .L_b84
.L_b48:
    cmp fp, #0x0
    beq .L_b84
    mov r0, sl
    mov r2, r9
    mov r1, #0x1
    bl func_ov002_021bbae0
    cmp r0, #0x0
    beq .L_cc0
    b .L_b84
.L_b6c:
    ldr r2, _LIT43
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_cc0
.L_b84:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_cb4
    cmp fp, #0x0
    mov r6, #0x0
    beq .L_c60
    ldr r0, _LIT63
    cmp r4, r0
    bgt .L_bf8
    bge .L_c34
    sub r1, r0, #0xc2
    cmp r4, r1
    bgt .L_bc8
    sub r0, r0, #0xc2
    cmp r4, r0
    beq .L_c24
    b .L_c60
.L_bc8:
    sub r1, r0, #0x10
    cmp r4, r1
    bgt .L_c60
    sub r1, r0, #0x12
    cmp r4, r1
    blt .L_c60
    subne r1, r0, #0x11
    cmpne r4, r1
    subne r0, r0, #0x10
    cmpne r4, r0
    beq .L_c2c
    b .L_c60
.L_bf8:
    add r1, r0, #0x16
    cmp r4, r1
    bgt .L_c18
    bge .L_c2c
    add r0, r0, #0x11
    cmp r4, r0
    beq .L_c34
    b .L_c60
.L_c18:
    ldr r0, _LIT64
    cmp r4, r0
    bne .L_c60
.L_c24:
    mov r6, #0x3e8
    b .L_c60
.L_c2c:
    mov r6, #0x1f4
    b .L_c60
.L_c34:
    and r1, sl, #0xff
    and r0, r9, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r1, r0, lsl #0x10
    mov r0, sl
    mov r1, r1, lsr #0x10
    bl func_ov002_021bcca0
    cmp r0, #0x0
    addeq sp, sp, #0x50
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c60:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bgt .L_c8c
    ldr r1, _LIT65
    mov r0, r5
    mvn r2, #0x0
    bl func_ov002_021bad9c
    ldr r1, _LIT66
    ldr r1, [r1, r8]
    cmp r1, r0
    bcc .L_cc0
.L_c8c:
    ldr r0, _LIT67
    ldr r2, [sp, #0x14]
    mov r1, sl
    bl func_ov002_021bb184
    mov r1, #0x1f4
    mla r1, r0, r1, r6
    ldr r2, _LIT6
    ldr r0, [r2, r8]
    cmp r0, r1
    ble .L_cc0
.L_cb4:
    add sp, sp, #0x50
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_cc0:
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
_LIT1: .word data_ov002_022cf0cc
_LIT2: .word data_ov002_022cd65c
_LIT3: .word data_ov002_022d008c
_LIT4: .word 0x00001a79
_LIT5: .word data_ov002_022cf0c8
_LIT6: .word data_ov002_022cf08c
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
_LIT42: .word data_ov002_022cf098
_LIT43: .word 0x00000fb6
_LIT44: .word 0x00001102
_LIT45: .word 0x0000130e
_LIT46: .word 0x000005dc
_LIT47: .word 0x0000134a
_LIT48: .word 0x000012e0
_LIT49: .word 0x000012d1
_LIT50: .word 0x000014d1
_LIT51: .word data_ov002_022cf190
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
_LIT66: .word data_ov002_022cf09c
_LIT67: .word 0x00001320
