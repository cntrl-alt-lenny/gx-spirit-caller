; func_ov002_0227dd08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd444
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf09c
        .extern data_ov002_022cf0c2
        .extern func_ov002_021baf88
        .extern func_ov002_021bbe70
        .extern func_ov002_021bce20
        .extern func_ov002_021c3afc
        .extern func_ov002_021c3b70
        .extern func_ov002_021c8390
        .extern func_ov002_021fea18
        .extern func_ov002_0223f5dc
        .extern func_ov002_02253600
        .extern func_ov002_022575f0
        .extern func_ov002_022579d0
        .extern func_ov002_0227afa0
        .extern func_ov002_0227da20
        .extern func_ov002_0227dbf4
        .extern func_ov002_0227dc7c
        .extern func_ov002_02280ce4
        .extern func_ov002_0228c754
        .extern func_ov002_0228dcd0
        .extern func_ov002_02296e94
        .global func_ov002_0227dd08
        .arm
func_ov002_0227dd08:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x2c
    mov r5, r0
    ldrh r4, [r5, #0x2]
    ldr r1, _LIT0
    ldr r3, _LIT1
    mov r2, r4, lsl #0x11
    mov r4, r4, lsl #0x1f
    mov r2, r2, lsr #0x1f
    eor r4, r2, r4, lsr #0x1f
    str r4, [r1]
    ldrh ip, [r5]
    cmp ip, r3
    bgt .L_240
    bge .L_68c
    ldr r2, _LIT2
    cmp ip, r2
    bgt .L_160
    bge .L_7dc
    ldr r1, _LIT3
    cmp ip, r1
    bgt .L_cc
    sub r2, r1, #0x2
    cmp ip, r2
    blt .L_78
    mov r0, r2
    cmp ip, r0
    cmpne ip, r1
    beq .L_644
    b .L_904
.L_78:
    cmp ip, #0x1200
    bgt .L_a8
    bge .L_454
    ldr r0, _LIT4
    cmp ip, r0
    bgt .L_98
    beq .L_3f4
    b .L_904
.L_98:
    add r0, r0, #0xab
    cmp ip, r0
    beq .L_5ac
    b .L_904
.L_a8:
    sub r0, r1, #0xa2
    cmp ip, r0
    bgt .L_bc
    beq .L_68c
    b .L_904
.L_bc:
    sub r0, r1, #0x92
    cmp ip, r0
    beq .L_410
    b .L_904
.L_cc:
    add r3, r1, #0x35
    cmp ip, r3
    bgt .L_128
    mov r0, r3
    cmp ip, r0
    bge .L_68c
    add r0, r1, #0x7
    cmp ip, r0
    bgt .L_f8
    beq .L_644
    b .L_904
.L_f8:
    add r0, r1, #0xd
    cmp ip, r0
    bgt .L_904
    add r0, r1, #0x9
    cmp ip, r0
    blt .L_904
    addne r0, r1, #0xa
    cmpne ip, r0
    addne r0, r1, #0xd
    cmpne ip, r0
    beq .L_644
    b .L_904
.L_128:
    add r3, r1, #0xae
    cmp ip, r3
    bgt .L_150
    mov r2, r3
    cmp ip, r2
    bge .L_47c
    add r0, r1, #0x68
    cmp ip, r0
    beq .L_68c
    b .L_904
.L_150:
    sub r0, r2, #0x19
    cmp ip, r0
    beq .L_55c
    b .L_904
.L_160:
    ldr r1, _LIT5
    cmp ip, r1
    bgt .L_1d4
    bge .L_858
    add r0, r2, #0xf2
    cmp ip, r0
    bgt .L_1a4
    bge .L_68c
    add r0, r2, #0x6b
    cmp ip, r0
    bgt .L_194
    beq .L_68c
    b .L_904
.L_194:
    add r0, r2, #0xcf
    cmp ip, r0
    beq .L_60c
    b .L_904
.L_1a4:
    sub r0, r1, #0x76
    cmp ip, r0
    bgt .L_1c4
    bge .L_4ac
    sub r0, r1, #0xbb
    cmp ip, r0
    beq .L_68c
    b .L_904
.L_1c4:
    sub r0, r1, #0x2
    cmp ip, r0
    beq .L_6b8
    b .L_904
.L_1d4:
    sub r2, r3, #0x25
    cmp ip, r2
    bgt .L_210
    bge .L_5c8
    add r2, r1, #0x90
    cmp ip, r2
    bgt .L_200
    add r1, r1, #0x90
    cmp ip, r1
    beq .L_880
    b .L_904
.L_200:
    add r0, r1, #0xf8
    cmp ip, r0
    beq .L_68c
    b .L_904
.L_210:
    add r0, r1, #0x118
    cmp ip, r0
    bgt .L_230
    bge .L_68c
    sub r0, r3, #0x24
    cmp ip, r0
    beq .L_6b8
    b .L_904
.L_230:
    sub r0, r3, #0x21
    cmp ip, r0
    beq .L_68c
    b .L_904
.L_240:
    ldr r1, _LIT6
    cmp ip, r1
    bgt .L_31c
    bge .L_824
    add r0, r3, #0x60
    cmp ip, r0
    bgt .L_2b8
    bge .L_68c
    add r0, r3, #0x1f
    cmp ip, r0
    bgt .L_294
    bge .L_6b8
    add r0, r3, #0x4
    cmp ip, r0
    bgt .L_284
    beq .L_68c
    b .L_904
.L_284:
    sub r0, r1, #0x178
    cmp ip, r0
    beq .L_68c
    b .L_904
.L_294:
    add r0, r3, #0x36
    cmp ip, r0
    bgt .L_2a8
    beq .L_68c
    b .L_904
.L_2a8:
    add r0, r3, #0x5a
    cmp ip, r0
    beq .L_6b8
    b .L_904
.L_2b8:
    sub r0, r1, #0x6b
    cmp ip, r0
    bgt .L_2ec
    bge .L_68c
    sub r0, r1, #0xa4
    cmp ip, r0
    bgt .L_2dc
    beq .L_5f0
    b .L_904
.L_2dc:
    sub r0, r1, #0x90
    cmp ip, r0
    beq .L_644
    b .L_904
.L_2ec:
    sub r0, r1, #0x35
    cmp ip, r0
    bgt .L_30c
    bge .L_68c
    sub r0, r1, #0x4b
    cmp ip, r0
    beq .L_644
    b .L_904
.L_30c:
    sub r0, r1, #0x1d
    cmp ip, r0
    beq .L_764
    b .L_904
.L_31c:
    add r0, r1, #0xe9
    cmp ip, r0
    bgt .L_390
    bge .L_8b0
    add r0, r1, #0x4f
    cmp ip, r0
    bgt .L_360
    bge .L_6b8
    add r0, r1, #0x41
    cmp ip, r0
    bgt .L_350
    beq .L_68c
    b .L_904
.L_350:
    add r0, r1, #0x47
    cmp ip, r0
    beq .L_594
    b .L_904
.L_360:
    add r0, r1, #0x96
    cmp ip, r0
    bgt .L_380
    bge .L_68c
    add r0, r1, #0x50
    cmp ip, r0
    beq .L_6b8
    b .L_904
.L_380:
    add r0, r1, #0xdd
    cmp ip, r0
    beq .L_8bc
    b .L_904
.L_390:
    add r0, r3, #0x290
    cmp ip, r0
    bgt .L_3c4
    bge .L_7dc
    add r0, r1, #0xea
    cmp ip, r0
    bgt .L_3b4
    beq .L_8b0
    b .L_904
.L_3b4:
    add r0, r1, #0xeb
    cmp ip, r0
    beq .L_8b0
    b .L_904
.L_3c4:
    ldr r0, _LIT7
    cmp ip, r0
    bgt .L_3e4
    bge .L_8b0
    sub r0, r0, #0x1
    cmp ip, r0
    beq .L_8b0
    b .L_904
.L_3e4:
    add r0, r0, #0x1
    cmp ip, r0
    beq .L_8b0
    b .L_904
.L_3f4:
    mov r0, r4
    bl func_ov002_021bbe70
    cmp r0, #0x1
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_410:
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT8
    ldr r3, _LIT9
    mov r2, r1, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r4, r2, #0x1
    mov r1, r1, lsl #0x1a
    mov r2, r1, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    mla r0, r4, r0, r3
    ldrh r0, [r1, r0]
    add sp, sp, #0x2c
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_454:
    ldrh r1, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_022579d0
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_47c:
    ldrh r1, [r5, #0x2]
    mvn r2, #0x0
    mov r3, #0x0
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_02280ce4
    cmp r0, #0x0
    movge r0, #0x1
    add sp, sp, #0x2c
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_4ac:
    ldr r6, _LIT10
    ldmia r6, {r2, r3}
    cmp r2, r3
    beq .L_550
    ldrh r4, [r5, #0x2]
    ldrh r7, [r5, #0x4]
    ldr r0, _LIT11
    mov r1, r4, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r5, r4, lsl #0x1a
    ldr r4, _LIT8
    and r8, r1, #0x1
    mla sl, r8, r4, r0
    mov r8, r5, lsr #0x1b
    mov r5, #0x14
    mul r9, r8, r5
    add r8, sl, #0x30
    ldr r8, [r8, r9]
    mov r9, r7, lsl #0x11
    mov r7, r8, lsl #0x2
    mov r7, r7, lsr #0x18
    mov r8, r8, lsl #0x12
    mov r7, r7, lsl #0x1
    mov r9, r9, lsr #0x17
    add r7, r7, r8, lsr #0x1f
    cmp r9, r7
    addne sp, sp, #0x2c
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r1, r2
    bne .L_550
    and r1, r3, #0x1
    mla r0, r1, r4, r0
    ldr r1, [r6, #0x20]
    mla r0, r1, r5, r0
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    addne sp, sp, #0x2c
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_550:
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_55c:
    ldrh r3, [r5, #0x2]
    ldr r0, _LIT8
    ldr r1, _LIT11
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    and r3, r3, #0x1
    mul r0, r3, r0
    ldr r1, [r1, r0]
    sub r0, r2, #0x330
    cmp r1, r0
    movge r0, #0x1
    add sp, sp, #0x2c
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_594:
    ldr r0, _LIT12
    bl func_ov002_021baf88
    cmp r0, #0x0
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_5ac:
    mov r0, r5
    bl func_ov002_021fea18
    cmp r0, #0x0
    moveq r0, #0x1
    add sp, sp, #0x2c
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_5c8:
    ldrh r1, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_022579d0
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_5f0:
    rsb r0, r4, #0x1
    bl func_ov002_021bce20
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_60c:
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT8
    ldr r1, _LIT11
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mla r0, r2, r0, r1
    ldr r0, [r0, #0xf8]
    add sp, sp, #0x2c
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_644:
    ldr r1, _LIT13
    rsb r0, r4, #0x1
    bl func_ov002_0227dc7c
    cmp r0, #0x0
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r5
    bl func_ov002_0223f5dc
    mov r2, r0
    ldrh r1, [r5]
    mov r0, r4
    bl func_ov002_02253600
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_68c:
    mov r0, r5
    bl func_ov002_0223f5dc
    mov r2, r0
    ldrh r1, [r5]
    mov r0, r4
    bl func_ov002_02253600
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_6b8:
    ldrh r0, [r5, #0x2]
    mov r6, #0x0
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021c8390
    rsb sl, r4, #0x1
    ldr r3, _LIT11
    ldr r1, _LIT8
    and r2, sl, #0x1
    mla r9, r2, r1, r3
    mov r7, r0
    add r8, r9, #0x30
    mov r5, r6
    add r4, sp, #0x0
.L_6f8:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_73c
    mov r0, sl
    mov r1, r5
    mov r2, r4
    bl func_ov002_0227afa0
    ldrh r0, [r9, #0x36]
    cmp r0, #0x0
    ldrne r0, [sp, #0x18]
    ldreq r0, [sp, #0x14]
    cmp r7, r0
    addgt sp, sp, #0x2c
    movgt r0, #0x1
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    add r6, r6, #0x1
.L_73c:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r8, r8, #0x14
    add r9, r9, #0x14
    ble .L_6f8
    cmp r6, #0x0
    moveq r0, #0x1
    add sp, sp, #0x2c
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_764:
    ldr r0, _LIT8
    and r2, r4, #0x1
    mul r1, r2, r0
    ldr r0, _LIT14
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_7d0
    ldr r0, _LIT11
    mov r5, r4
    add r7, r0, r1
    add r6, r7, #0x120
.L_794:
    ldr r0, [r6]
    mov r1, r5
    mov r0, r0, lsl #0x13
    mov r2, r5
    mov r0, r0, lsr #0x13
    bl func_ov002_0227da20
    cmp r0, #0x0
    addne sp, sp, #0x2c
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, [r7, #0xc]
    add r4, r4, #0x1
    cmp r4, r0
    add r6, r6, #0x4
    bcc .L_794
.L_7d0:
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_7dc:
    mov r0, r5
    bl func_ov002_0223f5dc
    mov r2, r0
    ldrh r1, [r5]
    mov r0, r4
    bl func_ov002_02253600
    cmp r0, #0x0
    beq .L_818
    mov r0, r4
    bl func_ov002_021c3afc
    cmp r0, #0x2
    movlt r0, #0x1
    add sp, sp, #0x2c
    movge r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_818:
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_824:
    ldr r1, _LIT8
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r1, _LIT15
    ldr r1, [r1, r3]
    cmp r1, #0x1
    addeq sp, sp, #0x2c
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    mov r1, #0x0
    bl func_ov002_02296e94
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_858:
    ldr r0, _LIT8
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT15
    add sp, sp, #0x2c
    ldr r0, [r0, r2]
    cmp r0, #0x5
    movcs r0, #0x1
    movcc r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_880:
    bl func_ov002_022575f0
    ldrh r3, [r5, #0x2]
    mov r1, r0
    ldr r2, _LIT16
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228c754
    cmp r0, #0x0
    movge r0, #0x1
    add sp, sp, #0x2c
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_8b0:
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_8bc:
    ldrh r0, [r5, #0x2]
    mov r1, #0x5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3b70
    cmp r0, #0x0
    addne sp, sp, #0x2c
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3afc
    cmp r0, #0x3
    movge r0, #0x1
    add sp, sp, #0x2c
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_904:
    mov r0, #0x1
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cd444
_LIT1: .word 0x00001807
_LIT2: .word 0x000014c4
_LIT3: .word 0x00001335
_LIT4: .word 0x000010d6
_LIT5: .word 0x000016cd
_LIT6: .word 0x00001984
_LIT7: .word 0x00001b4d
_LIT8: .word 0x00000868
_LIT9: .word data_ov002_022cf0c2
_LIT10: .word data_ov002_022cd314
_LIT11: .word data_ov002_022cf08c
_LIT12: .word 0x00001398
_LIT13: .word func_ov002_0227dbf4
_LIT14: .word data_ov002_022cf098
_LIT15: .word data_ov002_022cf09c
_LIT16: .word func_ov002_0228dcd0
