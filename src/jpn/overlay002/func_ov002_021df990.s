; func_ov002_021df990 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd340
        .extern data_ov002_022cd348
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern func_ov002_021b32d0
        .extern func_ov002_021b3878
        .extern func_ov002_021b38e4
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b9dec
        .extern func_ov002_021babc8
        .extern func_ov002_021d46ac
        .extern func_ov002_021d58dc
        .extern func_ov002_021df53c
        .extern func_ov002_021df848
        .extern func_ov002_021e2fc4
        .extern func_ov002_02244efc
        .global func_ov002_021df990
        .arm
func_ov002_021df990:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    ldr r1, _LIT0
    mov r4, r0
    ldr r5, [r1]
    ldr r0, [r4, #0x4]
    mov r3, #0x0
    cmp r0, r5
    ldreq r0, [r1, #0x1c]
    ldreq r2, [r4, #0x8]
    ldr r1, _LIT1
    cmpeq r2, r0
    moveq r3, #0x1
    cmp r3, #0x0
    rsbeq r5, r5, #0x1
    mov r0, #0x38
    mla r0, r5, r0, r1
    ldr r2, [r4]
    ldr fp, [r4, #0xc]
    ldr r5, [r0, #0x10]
    str r0, [sp, #0x8]
    cmp r2, #0x0
    addeq sp, sp, #0x10
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    ldr r6, [r4, #0x4]
    cmp r2, r0
    movhi r2, r0
    mov r0, #0x10000
    ldr r1, [sp, #0xc]
    rsb r0, r0, #0x0
    and r1, r1, r0
    mov r0, r2, lsl #0x10
    orr r7, r1, r0, lsr #0x10
    ldr r3, [r4, #0x8]
    ldr r2, [r4, #0xc]
    ldr r1, [r4, #0x10]
    ldr r0, _LIT0
    bic r7, r7, #0x10000
    mov r6, r6, lsl #0x1f
    orr r6, r7, r6, lsr #0xf
    ldr r0, [r0, #0x8]
    bic r6, r6, #0x1e0000
    mov r3, r3, lsl #0x1c
    orr r3, r6, r3, lsr #0xb
    bic r3, r3, #0x200000
    mov r2, r2, lsl #0x1f
    orr r2, r3, r2, lsr #0xa
    bic r2, r2, #0x3c00000
    mov r1, r1, lsl #0x1c
    orr r1, r2, r1, lsr #0x6
    bic r1, r1, #0x4000000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x5
    str r0, [sp, #0xc]
    ldr r0, [sp, #0xc]
    cmp fp, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    mov r0, r0, lsl #0x10
    orr r2, r1, #0x25
    mov r1, r0, lsr #0x10
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r5, lsl #0x10
    mov r3, r2, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021d46ac
    ldr r0, [sp, #0xc]
    mov r1, r0, lsl #0xf
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0xa
    cmp r1, r0, lsr #0x1f
    beq .L_684
    ldr r0, _LIT3
    cmp r5, r0
    bgt .L_2a4
    bge .L_40c
    sub r1, r0, #0xd8
    cmp r5, r1
    bgt .L_1fc
    sub r0, r0, #0xdf
    subs r0, r5, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_17c
    b .L_40c
    b .L_54c
    b .L_40c
    b .L_40c
    b .L_54c
    b .L_40c
    b .L_54c
    b .L_40c
.L_17c:
    ldr r0, _LIT4
    cmp r5, r0
    bgt .L_1bc
    bge .L_40c
    ldr r0, _LIT5
    cmp r5, r0
    bgt .L_1ac
    bge .L_40c
    sub r0, r0, #0x4d
    cmp r5, r0
    beq .L_480
    b .L_54c
.L_1ac:
    add r0, r0, #0x6a
    cmp r5, r0
    beq .L_40c
    b .L_54c
.L_1bc:
    ldr r1, _LIT6
    cmp r5, r1
    bgt .L_1dc
    bge .L_40c
    sub r0, r1, #0xf8
    cmp r5, r0
    beq .L_40c
    b .L_54c
.L_1dc:
    add r0, r1, #0x13
    cmp r5, r0
    bgt .L_1f0
    beq .L_40c
    b .L_54c
.L_1f0:
    cmp r5, #0x1480
    beq .L_40c
    b .L_54c
.L_1fc:
    sub r1, r0, #0x7a
    cmp r5, r1
    bgt .L_258
    bge .L_40c
    sub r1, r0, #0xad
    cmp r5, r1
    bgt .L_22c
    bge .L_40c
    sub r0, r0, #0xbc
    cmp r5, r0
    beq .L_40c
    b .L_54c
.L_22c:
    sub r1, r0, #0xac
    cmp r5, r1
    bgt .L_248
    sub r0, r0, #0xac
    cmp r5, r0
    beq .L_40c
    b .L_54c
.L_248:
    sub r0, r0, #0x7b
    cmp r5, r0
    beq .L_40c
    b .L_54c
.L_258:
    sub r1, r0, #0x46
    cmp r5, r1
    bgt .L_278
    bge .L_3fc
    sub r0, r0, #0x48
    cmp r5, r0
    beq .L_3fc
    b .L_54c
.L_278:
    sub r1, r0, #0x25
    cmp r5, r1
    bgt .L_294
    sub r0, r0, #0x25
    cmp r5, r0
    beq .L_40c
    b .L_54c
.L_294:
    sub r0, r0, #0xe
    cmp r5, r0
    beq .L_3fc
    b .L_54c
.L_2a4:
    ldr r2, _LIT7
    cmp r5, r2
    bgt .L_338
    bge .L_40c
    add r1, r0, #0xa8
    cmp r5, r1
    bgt .L_2f4
    bge .L_40c
    add r1, r0, #0x78
    cmp r5, r1
    bgt .L_2e4
    bge .L_40c
    add r0, r0, #0x40
    cmp r5, r0
    beq .L_40c
    b .L_54c
.L_2e4:
    add r0, r0, #0xa7
    cmp r5, r0
    beq .L_40c
    b .L_54c
.L_2f4:
    sub r1, r2, #0xcf
    cmp r5, r1
    bgt .L_314
    bge .L_40c
    add r0, r0, #0xad
    cmp r5, r0
    beq .L_40c
    b .L_54c
.L_314:
    sub r0, r2, #0x46
    cmp r5, r0
    bgt .L_328
    beq .L_40c
    b .L_54c
.L_328:
    sub r0, r2, #0x2
    cmp r5, r0
    beq .L_40c
    b .L_54c
.L_338:
    ldr r1, _LIT8
    cmp r5, r1
    bgt .L_38c
    bge .L_40c
    add r0, r2, #0xa1
    cmp r5, r0
    bgt .L_368
    bge .L_3fc
    add r0, r2, #0x88
    cmp r5, r0
    beq .L_3d0
    b .L_54c
.L_368:
    add r0, r2, #0xb0
    cmp r5, r0
    bgt .L_37c
    beq .L_40c
    b .L_54c
.L_37c:
    sub r0, r1, #0xd6
    cmp r5, r0
    beq .L_40c
    b .L_54c
.L_38c:
    add r0, r1, #0x68
    cmp r5, r0
    bgt .L_3ac
    bge .L_3fc
    add r0, r1, #0x63
    cmp r5, r0
    beq .L_40c
    b .L_54c
.L_3ac:
    add r0, r1, #0xb8
    cmp r5, r0
    bgt .L_3c0
    beq .L_3fc
    b .L_54c
.L_3c0:
    add r0, r1, #0x1e8
    cmp r5, r0
    beq .L_40c
    b .L_54c
.L_3d0:
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_54c
    mov r0, #0x0
    str r0, [sp]
    add r2, r2, #0x88
    mov r3, #0x22
    ldmib r4, {r0, r1}
    bl func_ov002_021d58dc
    b .L_54c
.L_3fc:
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_54c
.L_40c:
    ldr r7, [r4, #0x4]
    ldr r6, _LIT9
    ldr r1, [r4, #0x8]
    mov r2, #0x14
    ldr r0, _LIT10
    and r3, r7, #0x1
    mla r6, r3, r0, r6
    mov r0, r7, lsl #0x1f
    and r0, r0, #-2147483648
    orr r0, r0, #0xe200000
    mov r3, r1, lsl #0x10
    mul r2, r1, r2
    add r1, r6, #0x30
    ldr r2, [r1, r2]
    orr r0, r0, #0x10000000
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    and r6, r3, #0x1f0000
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r3, r1, lsl #0x10
    mov r1, r5, lsl #0x10
    orr r0, r0, r6
    ldr r2, [sp, #0xc]
    orr r0, r0, r1, lsr #0x10
    mov r1, r3, lsr #0x10
    bl func_ov002_021e2fc4
    b .L_54c
.L_480:
    ldr r6, [sp, #0xc]
    mov r0, r6, lsl #0x5
    movs r0, r0, lsr #0x1f
    bne .L_54c
    ldr r1, [r4, #0x4]
    mov r0, #0x38
    rsb r1, r1, #0x1
    mul r2, r1, r0
    ldr r1, _LIT11
    ldr r1, [r1, r2]
    cmp r1, #0x0
    beq .L_54c
    rsb sl, fp, #0x1
    ldr r2, _LIT9
    and r1, sl, #0x1
    add r0, r0, #0x830
    mla r2, r1, r0, r2
    mov r0, sl, lsl #0x1f
    and r0, r0, #-2147483648
    orr r9, r0, #0xe200000
    ldr r5, _LIT12
    add r8, r2, #0x94
    orr r9, r9, #0x10000000
    mov r7, #0x5
.L_4e0:
    mov r0, sl
    mov r1, r7
    mov r2, r5
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_53c
    ldr r3, [r8]
    mov r2, r7, lsl #0x10
    mov r0, r3, lsl #0x2
    mov r1, r0, lsr #0x18
    mov r0, r3, lsl #0x13
    and r2, r2, #0x1f0000
    mov r0, r0, lsr #0x13
    mov r3, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    mov r1, r1, lsl #0x10
    orr r3, r9, r2
    mov r0, r0, lsl #0x10
    mov r2, r6
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_53c:
    add r7, r7, #0x1
    cmp r7, #0xa
    add r8, r8, #0x14
    blt .L_4e0
.L_54c:
    rsb r5, fp, #0x1
    ldr r2, _LIT9
    ldr r0, _LIT10
    and r1, r5, #0x1
    mla r0, r1, r0, r2
    str r0, [sp, #0x4]
    mov r0, r5, lsl #0x1f
    and r0, r0, #-2147483648
    orr r9, r0, #0xe200000
    ldr r0, [sp, #0x4]
    ldr r6, [sp, #0xc]
    ldr r7, _LIT13
    add r8, r0, #0x94
    orr r9, r9, #0x10000000
    mov sl, #0x5
.L_588:
    mov r0, r5
    mov r1, sl
    mov r2, r7
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_5e4
    ldr r1, [r8]
    mov ip, sl, lsl #0x10
    mov r0, r1, lsl #0x2
    mov r3, r0, lsr #0x18
    mov r2, r1, lsl #0x13
    and r0, ip, #0x1f0000
    orr r0, r9, r0
    mov r2, r2, lsr #0x13
    mov r2, r2, lsl #0x10
    orr r0, r0, r2, lsr #0x10
    mov r2, r1, lsl #0x12
    mov r1, r3, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r2, r6
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_5e4:
    add sl, sl, #0x1
    cmp sl, #0xa
    add r8, r8, #0x14
    blt .L_588
    mov r0, r5, lsl #0x1f
    and r0, r0, #-2147483648
    orr r9, r0, #0xe200000
    ldr r0, [sp, #0x4]
    ldr r6, [sp, #0xc]
    ldr r7, _LIT14
    add r8, r0, #0x94
    orr r9, r9, #0x10000000
    mov sl, #0x5
.L_618:
    mov r0, r5
    mov r1, sl
    mov r2, r7
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_674
    ldr r3, [r8]
    mov r2, sl, lsl #0x10
    mov r0, r3, lsl #0x2
    mov r1, r0, lsr #0x18
    mov r0, r3, lsl #0x13
    and r2, r2, #0x1f0000
    mov r0, r0, lsr #0x13
    mov r3, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    mov r1, r1, lsl #0x10
    orr r3, r9, r2
    mov r0, r0, lsl #0x10
    mov r2, r6
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_674:
    add sl, sl, #0x1
    cmp sl, #0xa
    add r8, r8, #0x14
    blt .L_618
.L_684:
    ldr r1, [sp, #0xc]
    ldr r0, [r4, #0x4]
    mov r3, r1, lsl #0xa
    ldr r1, [r4, #0x8]
    ldr r2, _LIT15
    mov r3, r3, lsr #0x1f
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    beq .L_6d0
    ldr r2, [sp, #0xc]
    ldr r0, _LIT16
    mov r1, r2, lsl #0xa
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    mov r1, r1, lsl #0x1f
    and r1, r1, #-2147483648
    orr r0, r1, r0
    mov r1, #0x0
    bl func_ov002_021e2fc4
.L_6d0:
    rsb r9, fp, #0x1
    ldr r2, _LIT9
    ldr r0, _LIT10
    and r1, r9, #0x1
    mla fp, r1, r0, r2
    mov r0, r9, lsl #0x1f
    and r0, r0, #-2147483648
    orr r8, r0, #0xe200000
    ldr r5, [sp, #0xc]
    ldr r6, _LIT17
    add r7, fp, #0x94
    orr r8, r8, #0x10000000
    mov sl, #0x5
.L_704:
    mov r0, r9
    mov r1, sl
    mov r2, r6
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_778
    mov r0, r9
    mov r1, sl
    ldmib r4, {r2, r3}
    bl func_ov002_021b32d0
    cmp r0, #0x0
    beq .L_778
    ldr r3, [r7]
    mov r2, sl, lsl #0x10
    mov r0, r3, lsl #0x2
    mov r1, r0, lsr #0x18
    mov r0, r3, lsl #0x13
    and r2, r2, #0x1f0000
    mov r0, r0, lsr #0x13
    mov r3, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    mov r1, r1, lsl #0x10
    orr r3, r8, r2
    mov r0, r0, lsl #0x10
    mov r2, r5
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_778:
    add sl, sl, #0x1
    cmp sl, #0xa
    add r7, r7, #0x14
    blt .L_704
    ldr r0, [sp, #0x8]
    ldr r0, [r0, #0x24]
    cmp r0, #0xb
    bne .L_824
    mov r0, r9, lsl #0x1f
    and r0, r0, #-2147483648
    orr r7, r0, #0xe200000
    ldr sl, [sp, #0xc]
    ldr r5, _LIT18
    add r6, fp, #0x94
    orr r7, r7, #0x10000000
    mov r8, #0x5
.L_7b8:
    mov r0, r9
    mov r1, r8
    mov r2, r5
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_814
    ldr r3, [r6]
    mov r1, r8, lsl #0x10
    mov r0, r3, lsl #0x2
    mov r2, r0, lsr #0x18
    mov r0, r3, lsl #0x13
    and r1, r1, #0x1f0000
    mov r0, r0, lsr #0x13
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    mov r3, r2, lsl #0x10
    orr r1, r7, r1
    mov r0, r0, lsl #0x10
    mov r2, sl
    orr r0, r1, r0, lsr #0x10
    mov r1, r3, lsr #0x10
    bl func_ov002_021e2fc4
.L_814:
    add r8, r8, #0x1
    cmp r8, #0xa
    add r6, r6, #0x14
    blt .L_7b8
.L_824:
    mov r2, #0x1
    ldmib r4, {r0, r1}
    bl func_ov002_021b38e4
    ldr r1, _LIT2
    cmp r0, r1
    beq .L_8dc
    and r1, r0, #0xff
    ldr r2, _LIT10
    ldr r3, _LIT9
    and r5, r1, #0x1
    mla r3, r5, r2, r3
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    mov r2, #0x14
    smulbb r7, r0, r2
    add r6, r3, #0x30
    ldr r3, [r6, r7]
    ldr r2, _LIT19
    mov r3, r3, lsl #0x13
    mov r3, r3, lsr #0x13
    cmp r3, r2
    addne r2, r2, #0x1
    cmpne r3, r2
    bne .L_8dc
    ldr r2, [sp, #0xc]
    mov r5, r2, lsl #0xa
    cmp r1, r5, lsr #0x1f
    beq .L_8dc
    ldr r5, [r6, r7]
    mov r6, r1, lsl #0x1f
    mov r1, r5, lsl #0x2
    and r6, r6, #-2147483648
    mov r1, r1, lsr #0x18
    orr r7, r6, #0xe200000
    mov r6, r0, lsl #0x10
    mov r5, r5, lsl #0x12
    mov r0, r1, lsl #0x1
    add r0, r0, r5, lsr #0x1f
    mov r1, r0, lsl #0x10
    orr r7, r7, #0x10000000
    and r0, r6, #0x1f0000
    orr r5, r7, r0
    mov r0, r3, lsl #0x10
    orr r0, r5, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_8dc:
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x10]
    mov r3, #0x14
    ldr r2, _LIT10
    ldr r5, _LIT20
    and r6, r0, #0x1
    mul r3, r1, r3
    mla r2, r6, r2, r5
    ldr r2, [r3, r2]
    mov r2, r2, lsr #0x6
    tst r2, #0x1
    bne .L_994
    bl func_ov002_021b9dec
    ldr r1, _LIT21
    cmp r0, r1
    bne .L_994
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x10]
    bl func_ov002_021b3878
    ldr r1, _LIT2
    cmp r0, r1
    beq .L_994
    ldr r0, [r4, #0xc]
    ldr r3, _LIT9
    ldr r1, _LIT10
    and r2, r0, #0x1
    mla r3, r2, r1, r3
    ldr r1, [r4, #0x10]
    mov r2, #0x14
    mul r2, r1, r2
    add r3, r3, #0x30
    ldr r3, [r3, r2]
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    ldr r0, [sp, #0xc]
    ldr r3, [r4, #0xc]
    mov r1, r0, lsl #0x10
    mov r2, #0x1
    rsb r0, r3, #0x1
    mov r1, r1, lsr #0x10
    add r3, r2, #0x1280
    bl func_ov002_021df848
.L_994:
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_a54
    ldr r5, [sp, #0xc]
    ldr r6, _LIT22
    mov fp, #0x0
.L_9b0:
    ldr r0, _LIT23
    ldr r1, _LIT10
    ldr r0, [r0, #0xcec]
    ldr r4, _LIT22
    eor sl, r0, fp
    ldr r0, _LIT9
    and r2, sl, #0x1
    mla r1, r2, r1, r0
    mov r0, sl, lsl #0x1f
    and r0, r0, #-2147483648
    orr r9, r0, #0xe200000
    mov r7, #0x5
    add r8, r1, #0x94
    orr r9, r9, #0x10000000
.L_9e8:
    mov r0, sl
    mov r1, r7
    mov r2, r6
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_a38
    ldr r2, [r8]
    mov r0, r7, lsl #0x10
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    and r3, r0, #0x1f0000
    add r0, r1, r2, lsr #0x1f
    orr r3, r9, r3
    mov r1, r0, lsl #0x10
    mov r2, r5
    orr r0, r3, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_a38:
    add r7, r7, #0x1
    cmp r7, #0xa
    add r8, r8, #0x14
    blt .L_9e8
    add fp, fp, #0x1
    cmp fp, #0x2
    blt .L_9b0
.L_a54:
    ldr r5, [sp, #0xc]
    ldr r6, _LIT24
    mov fp, #0x0
.L_a60:
    ldr r0, _LIT23
    ldr r1, _LIT10
    ldr r0, [r0, #0xcec]
    ldr r4, _LIT24
    eor sl, r0, fp
    ldr r0, _LIT9
    and r2, sl, #0x1
    mla r1, r2, r1, r0
    mov r0, sl, lsl #0x1f
    and r0, r0, #-2147483648
    orr r9, r0, #0xe200000
    mov r7, #0x5
    add r8, r1, #0x94
    orr r9, r9, #0x10000000
.L_a98:
    mov r0, sl
    mov r1, r7
    mov r2, r6
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_ae8
    ldr r2, [r8]
    mov r0, r7, lsl #0x10
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    and r3, r0, #0x1f0000
    add r0, r1, r2, lsr #0x1f
    orr r3, r9, r3
    mov r1, r0, lsl #0x10
    mov r2, r5
    orr r0, r3, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_ae8:
    add r7, r7, #0x1
    cmp r7, #0xa
    add r8, r8, #0x14
    blt .L_a98
    add fp, fp, #0x1
    cmp fp, #0x2
    blt .L_a60
    ldr r1, [sp, #0xc]
    mov r0, #0xf
    bl func_ov002_02244efc
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word data_ov002_022cd340
_LIT2: .word 0x0000ffff
_LIT3: .word 0x000015de
_LIT4: .word 0x000011b1
_LIT5: .word 0x00001018
_LIT6: .word 0x0000139f
_LIT7: .word 0x0000178c
_LIT8: .word 0x00001967
_LIT9: .word data_ov002_022cf08c
_LIT10: .word 0x00000868
_LIT11: .word data_ov002_022cd348
_LIT12: .word 0x0000187d
_LIT13: .word 0x0000130c
_LIT14: .word 0x00001720
_LIT15: .word 0x00001511
_LIT16: .word 0x1e501511
_LIT17: .word 0x000014ed
_LIT18: .word 0x0000187b
_LIT19: .word 0x000015d6
_LIT20: .word data_ov002_022cf0cc
_LIT21: .word 0x00001281
_LIT22: .word 0x000017b5
_LIT23: .word data_ov002_022d008c
_LIT24: .word 0x0000171e
