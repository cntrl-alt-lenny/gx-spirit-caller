; func_ov002_021e3cbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd3d8
        .extern data_ov002_022cd3ec
        .extern data_ov002_022cd888
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce4a8
        .extern data_ov002_022ce4aa
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern func_0202b824
        .extern func_0202b86c
        .extern func_0202e1e0
        .extern func_020311b4
        .extern func_ov002_021b03e8
        .extern func_ov002_021b1490
        .extern func_ov002_021b3dec
        .extern func_ov002_021b9dec
        .extern func_ov002_021b9fd0
        .extern func_ov002_021d46ac
        .extern func_ov002_021d58dc
        .extern func_ov002_021df53c
        .extern func_ov002_021e2d48
        .extern func_ov002_021e2d90
        .extern func_ov002_021e34bc
        .extern func_ov002_021e35c8
        .extern func_ov002_021e3878
        .extern func_ov002_021fd72c
        .extern func_ov002_02245018
        .extern func_ov002_0225406c
        .extern func_ov002_02256f44
        .extern func_ov002_02257b6c
        .extern func_ov002_02257ba0
        .extern func_ov002_02257bc0
        .extern func_ov002_02257bf4
        .extern func_ov002_02257ccc
        .extern func_ov002_0229cc60
        .global func_ov002_021e3cbc
        .arm
func_ov002_021e3cbc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x34
    ldr r0, _LIT0
    ldr r6, _LIT0
    ldr r1, [r0, #0x484]
    ldr r8, [r6, #0x480]
    ldr r2, _LIT1
    mov r0, #0x18
    mla r5, r1, r0, r2
    cmp r1, #0x0
    subgt r4, r5, #0x18
    ldr r0, _LIT1
    sub r7, r8, #0x1
    mov r3, #0x18
    mla r0, r7, r3, r0
    ldr r2, [r6, #0x59c]
    movle r4, #0x0
    str r0, [sp, #0x8]
    cmp r2, #0xe
    addls pc, pc, r2, lsl #0x2
    b .L_d80
    b .L_90
    b .L_ec
    b .L_428
    b .L_4b4
    b .L_558
    b .L_5e8
    b .L_68c
    b .L_960
    b .L_9c4
    b .L_d80
    b .L_d80
    b .L_a60
    b .L_cd8
    b .L_d24
    b .L_d38
.L_90:
    bl func_ov002_021b03e8
    cmp r0, #0x0
    addne sp, sp, #0x34
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_ov002_0225406c
    cmp r0, #0x0
    addne sp, sp, #0x34
    mov r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r1, r6
    str r0, [r1, #0x5d8]
    mov r0, #0x0
    str r0, [r1, #0x484]
    str r0, [r1, #0x488]
    bl func_ov002_02245018
    mov r1, r6
    ldr r2, [r1, #0x59c]
    add sp, sp, #0x34
    add r2, r2, #0x1
    str r2, [r1, #0x59c]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ec:
    mov r0, r5
    bl func_ov002_021e34bc
    cmp r0, #0x0
    beq .L_178
    mov r0, r5
    bl func_ov002_02257ccc
    cmp r0, #0x0
    beq .L_154
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0x10
    beq .L_178
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r0, #0x8000
    ldrh r2, [r5, #0x4]
    moveq r0, #0x0
    orr r0, r0, #0x28
    mov r0, r0, lsl #0x10
    mov r2, r2, lsl #0x11
    mov r0, r0, lsr #0x10
    mov r2, r2, lsr #0x17
    mov r3, #0x0
    bl func_ov002_021d46ac
    b .L_178
.L_154:
    ldrh r1, [r5, #0x2]
    ldrh r0, [r5, #0x4]
    mov r3, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r2, r0, lsl #0x11
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021df53c
.L_178:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_3ec
    mov r6, #0x0
.L_18c:
    ldr r2, _LIT2
    ldr r0, _LIT3
    and r1, r6, #0x1
    mla r9, r1, r0, r2
    ldr r0, _LIT4
    mov r7, #0x0
    sub r0, r0, #0xfa
    str r0, [sp, #0x10]
    ldr r0, _LIT4
    sub r0, r0, #0xfa
    str r0, [sp, #0xc]
    ldr r0, _LIT4
    sub r0, r0, #0x1c
    str r0, [sp, #0x14]
    ldr r0, _LIT5
    sub fp, r0, #0x62
    ldr r0, _LIT6
    mov r4, fp
    add r0, r0, #0x1e
    str r0, [sp, #0x18]
    ldr r0, _LIT6
    add r0, r0, #0xbe
    str r0, [sp, #0x20]
    ldr r0, _LIT6
    add r0, r0, #0xc2
    str r0, [sp, #0x1c]
    ldr r0, _LIT7
    add r0, r0, #0x1e8
    str r0, [sp, #0x2c]
    ldr r0, _LIT6
    add r0, r0, #0xc2
    str r0, [sp, #0x28]
    ldr r0, _LIT6
    add r0, r0, #0xbe
    str r0, [sp, #0x24]
.L_218:
    ldrh r0, [r9, #0x38]
    cmp r0, #0x0
    beq .L_3d0
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9dec
    mov r8, r0
    mov sl, #0x0
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_250
    cmp r7, #0x5
    bge .L_3d0
    b .L_258
.L_250:
    cmp r7, #0x4
    ble .L_3d0
.L_258:
    ldrh r0, [r5]
    bl func_0202b824
    cmp r0, #0x16
    bne .L_334
    mov r0, r8
    bl func_020311b4
    cmp r0, #0x0
    movne sl, #0x1
    cmp r8, r4
    bgt .L_2b4
    cmp r8, fp
    bge .L_304
    ldr r0, [sp, #0xc]
    cmp r8, r0
    bgt .L_2a4
    ldr r0, [sp, #0x10]
    cmp r8, r0
    beq .L_2e4
    b .L_3a4
.L_2a4:
    ldr r0, [sp, #0x14]
    cmp r8, r0
    beq .L_2fc
    b .L_3a4
.L_2b4:
    ldr r0, _LIT6
    cmp r8, r0
    bgt .L_2d4
    bge .L_31c
    ldr r0, _LIT5
    cmp r8, r0
    beq .L_2fc
    b .L_3a4
.L_2d4:
    ldr r0, [sp, #0x18]
    cmp r8, r0
    beq .L_31c
    b .L_3a4
.L_2e4:
    ldrh r0, [r5]
    bl func_0202b86c
    cmp r0, #0x0
    cmpne r0, #0x5
    moveq sl, #0x1
    b .L_3a4
.L_2fc:
    mov sl, #0x1
    b .L_3a4
.L_304:
    ldrh r1, [r5]
    ldr r0, _LIT8
    cmp r1, r0
    moveq sl, #0x1
    movne sl, #0x0
    b .L_3a4
.L_31c:
    ldrh r0, [r5]
    bl func_0202b86c
    cmp r0, #0x0
    moveq sl, #0x1
    movne sl, #0x0
    b .L_3a4
.L_334:
    ldrh r0, [r5]
    bl func_0202b824
    cmp r0, #0x17
    bne .L_3a4
    ldr r0, [sp, #0x1c]
    cmp r8, r0
    bgt .L_384
    ldr r0, [sp, #0x20]
    cmp r8, r0
    blt .L_374
    ldr r0, [sp, #0x24]
    cmp r8, r0
    ldrne r0, [sp, #0x28]
    cmpne r8, r0
    beq .L_390
    b .L_3a4
.L_374:
    ldr r0, _LIT7
    cmp r8, r0
    moveq sl, #0x1
    b .L_3a4
.L_384:
    ldr r0, [sp, #0x2c]
    cmp r8, r0
    bne .L_3a4
.L_390:
    ldrh r0, [r5]
    bl func_0202b86c
    cmp r0, #0x1
    moveq sl, #0x1
    movne sl, #0x0
.L_3a4:
    cmp sl, #0x0
    beq .L_3d0
    ldrh r2, [r5, #0x4]
    mov r0, r6
    mov r1, r7
    mov r2, r2, lsl #0x11
    mov r2, r2, lsr #0x17
    str r2, [sp]
    ldr r2, _LIT4
    mov r3, #0x2
    bl func_ov002_021d58dc
.L_3d0:
    add r9, r9, #0x14
    add r7, r7, #0x1
    cmp r7, #0xa
    ble .L_218
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_18c
.L_3ec:
    ldr r0, _LIT9
    ldr r1, _LIT0
    ldr r3, [r0, #0x300]
    mov r2, #0x0
    bic r3, r3, #0x800
    bic r3, r3, #0x2000
    str r3, [r0, #0x300]
    str r2, [r1, #0x5b4]
    str r2, [r1, #0x5b8]
    ldr r2, [r1, #0x59c]
    add sp, sp, #0x34
    add r2, r2, #0x1
    str r2, [r1, #0x59c]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_428:
    str r5, [r6, #0x48c]
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    bne .L_44c
    mov r0, r5
    bl func_ov002_02257ba0
    cmp r0, #0x0
    bne .L_474
.L_44c:
    ldrh r2, [r5, #0x2]
    ldr r1, _LIT0
    add sp, sp, #0x34
    orr r2, r2, #0x8000
    strh r2, [r5, #0x2]
    ldr r2, [r1, #0x59c]
    mov r0, #0x1
    add r2, r2, #0x2
    str r2, [r1, #0x59c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_474:
    mov r0, r5
    bl func_ov002_021e2d48
    cmp r0, #0x0
    beq .L_49c
    mov r0, r6
    ldr r1, [r0, #0x484]
    mov r2, r5
    mov r0, #0x1c
    mov r3, #0x18
    bl func_ov002_021b1490
.L_49c:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r2, [r0, #0x59c]
    add r2, r2, #0x1
    str r2, [r0, #0x59c]
    str r1, [r0, #0x5bc]
.L_4b4:
    mov r0, r5
    bl func_ov002_021e2d48
    cmp r0, #0x0
    bne .L_50c
    mov r0, r5
    mov r1, r4
    bl func_ov002_02257b6c
    cmp r0, #0x0
    beq .L_50c
    movgt r0, #0x1
    movle r0, #0x0
    ldrh r1, [r5, #0x2]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x8000
    mov r0, r0, lsl #0x1f
    orr r1, r1, r0, lsr #0x10
    ldr r0, _LIT9
    strh r1, [r5, #0x2]
    ldr r1, [r0, #0x300]
    orr r1, r1, #0x2000
    str r1, [r0, #0x300]
.L_50c:
    ldr r0, _LIT9
    ldr r0, [r0, #0x300]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1f
    beq .L_54c
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    ldreq r0, _LIT0
    moveq r1, #0x6
    streq r1, [r0, #0x59c]
    beq .L_54c
    ldr r0, _LIT0
    ldr r1, [r0, #0x59c]
    add r1, r1, #0x1
    str r1, [r0, #0x59c]
.L_54c:
    add sp, sp, #0x34
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_558:
    str r5, [r6, #0x48c]
    ldrh r0, [r5, #0x4]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_57c
    mov r0, r5
    bl func_ov002_02257bf4
    cmp r0, #0x0
    bne .L_5a8
.L_57c:
    ldrh r2, [r5, #0x4]
    ldr r1, _LIT0
    add sp, sp, #0x34
    bic r2, r2, #0x1
    orr r2, r2, #0x1
    strh r2, [r5, #0x4]
    ldr r2, [r1, #0x59c]
    mov r0, #0x1
    add r2, r2, #0x2
    str r2, [r1, #0x59c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5a8:
    mov r0, r5
    bl func_ov002_021e2d48
    cmp r0, #0x0
    beq .L_5d0
    mov r0, r6
    ldr r1, [r0, #0x484]
    mov r2, r5
    mov r0, #0x1a
    mov r3, #0x18
    bl func_ov002_021b1490
.L_5d0:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r2, [r0, #0x59c]
    add r2, r2, #0x1
    str r2, [r0, #0x59c]
    str r1, [r0, #0x5bc]
.L_5e8:
    mov r0, r5
    bl func_ov002_021e2d48
    cmp r0, #0x0
    bne .L_640
    mov r0, r5
    mov r1, r4
    bl func_ov002_02257bc0
    cmp r0, #0x0
    beq .L_640
    movgt r0, #0x1
    movle r0, #0x0
    ldrh r1, [r5, #0x4]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r1, r1, r0
    ldr r0, _LIT9
    strh r1, [r5, #0x4]
    ldr r1, [r0, #0x300]
    orr r1, r1, #0x800
    str r1, [r0, #0x300]
.L_640:
    ldr r0, _LIT9
    ldr r0, [r0, #0x300]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x1f
    beq .L_680
    ldrh r0, [r5, #0x4]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldreq r0, _LIT0
    moveq r1, #0x6
    streq r1, [r0, #0x59c]
    beq .L_680
    ldr r0, _LIT0
    ldr r1, [r0, #0x59c]
    add r1, r1, #0x1
    str r1, [r0, #0x59c]
.L_680:
    add sp, sp, #0x34
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_68c:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    beq .L_834
    ldrh r0, [r5, #0x4]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_834
    ldr r0, _LIT10
    ldr r0, [r0, #0xd0c]
    cmp r0, #0x0
    beq .L_6c8
    mov r2, r5
    mov r0, #0x12
    bl func_ov002_021b1490
.L_6c8:
    ldr r0, _LIT0
    ldr r1, [r0, #0x484]
    add r1, r1, #0x1
    str r1, [r0, #0x484]
    cmp r1, #0x2
    blt .L_934
    mov r6, #0x0
.L_6e4:
    ldr r2, _LIT2
    ldr r0, _LIT3
    and r1, r6, #0x1
    mla sl, r1, r0, r2
    ldr r4, _LIT11
    add r9, sl, #0x30
    add r0, r4, #0xd
    mov r7, #0x0
    str r0, [sp, #0x30]
    add fp, r4, #0xc
.L_70c:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [sl, #0x38]
    cmpne r0, #0x0
    beq .L_810
    ldr r1, [sl, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_810
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9dec
    mov r8, r0
    cmp r8, r4
    beq .L_764
    cmp r8, fp
    ldrne r0, [sp, #0x30]
    cmpne r8, r0
    beq .L_7bc
    b .L_810
.L_764:
    ldrh r0, [r5]
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_810
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_810
    mov r0, r6
    mov r1, r7
    mov r2, r4
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_810
    mov r1, #0x0
    str r1, [sp]
    mov r0, r6
    mov r1, r7
    mov r2, r4
    mov r3, #0x3
    bl func_ov002_021d58dc
    b .L_810
.L_7bc:
    ldr r0, _LIT10
    ldr r0, [r0, #0xcec]
    cmp r6, r0
    ldreq r0, _LIT10
    ldreq r0, [r0, #0xcf8]
    cmpeq r0, #0x2
    bne .L_810
    mov r0, r6
    mov r1, r7
    mov r2, r8
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_810
    mov r0, r8, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, #0x0
    str r0, [sp]
    mov r0, r6
    mov r1, r7
    mov r3, #0x2
    bl func_ov002_021d58dc
.L_810:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r9, r9, #0x14
    add sl, sl, #0x14
    blt .L_70c
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_6e4
    b .L_934
.L_834:
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_89c
    mov r0, r0, lsl #0x1f
    mov r5, r0, lsr #0x1f
    mov r2, #0x14
    ldr r0, _LIT3
    ldr r3, _LIT12
    and r4, r5, #0x1
    mul r2, r1, r2
    mla r0, r4, r0, r3
    ldr r0, [r2, r0]
    mov r0, r0, lsr #0x1
    tst r0, #0x1
    beq .L_89c
    cmp r5, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x39
    mov r0, r0, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    bl func_ov002_021d46ac
.L_89c:
    ldr r8, _LIT0
    ldr r0, [r8, #0x480]
    subs r0, r0, #0x1
    str r0, [r8, #0x480]
    bne .L_8ec
    ldr r0, [r8, #0x5d4]
    cmp r0, #0x0
    beq .L_8cc
    mov r0, #0x1
    str r0, [r8, #0x688]
    mov r0, #0x0
    str r0, [r8, #0x68c]
.L_8cc:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x598]
    str r1, [r0, #0x5a0]
    str r1, [r0, #0x5d8]
    add sp, sp, #0x34
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8ec:
    ldr r5, [r8, #0x484]
    cmp r5, r0
    bge .L_934
    ldr r4, _LIT1
    mov r0, #0x18
    mla r6, r5, r0, r4
    mov r9, r0
    mov r7, r0
.L_90c:
    add r0, r5, #0x1
    mla r1, r0, r7, r4
    mov r0, r6
    mov r2, r9
    bl func_ov002_0229cc60
    ldr r0, [r8, #0x480]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x18
    blt .L_90c
.L_934:
    ldr r1, _LIT0
    ldr r2, [r1, #0x484]
    ldr r0, [r1, #0x480]
    cmp r2, r0
    movlt r0, #0x1
    strlt r0, [r1, #0x59c]
    addlt sp, sp, #0x34
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r1, #0x59c]
    add r0, r0, #0x1
    str r0, [r1, #0x59c]
.L_960:
    bl func_ov002_02256f44
    cmp r0, #0x0
    addne sp, sp, #0x34
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_ov002_021b03e8
    cmp r0, #0x0
    addne sp, sp, #0x34
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT0
    ldr r0, [r1, #0x480]
    cmp r0, #0x2
    bge .L_9ac
    mov r0, #0xb
    str r0, [r1, #0x59c]
    add sp, sp, #0x34
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9ac:
    ldr r2, [r1, #0x59c]
    add sp, sp, #0x34
    add r2, r2, #0x1
    str r2, [r1, #0x59c]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9c4:
    ldr r0, [r6, #0x488]
    cmp r0, r8
    bge .L_a44
    mov r7, #0x0
    ldr r9, _LIT13
    mov r8, #0x8000
    mov r5, r7
    mov r4, r3
.L_9e4:
    mul r1, r0, r4
    ldrh r1, [r9, r1]
    mov r2, r1, lsl #0x1a
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    movne r1, r8
    moveq r1, r7
    mov r3, r2, lsr #0x1b
    add r2, r0, #0x1
    orr r1, r1, #0x12
    mov r0, r1, lsl #0x10
    mov r1, r3, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r5
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d46ac
    ldr r0, [r6, #0x488]
    add r0, r0, #0x1
    str r0, [r6, #0x488]
    ldr r1, [r6, #0x480]
    cmp r0, r1
    blt .L_9e4
.L_a44:
    ldr r1, _LIT0
    add sp, sp, #0x34
    ldr r2, [r1, #0x59c]
    mov r0, #0x1
    add r2, r2, #0x3
    str r2, [r1, #0x59c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a60:
    cmp r8, #0x10
    bge .L_d80
    bl func_ov002_021e35c8
    cmp r0, #0x0
    beq .L_d80
    ldr r0, [sp, #0x8]
    ldrh r0, [r0]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_cbc
    mov r6, #0x0
    str r6, [sp, #0x4]
.L_a90:
    ldr r0, _LIT10
    ldr r2, _LIT2
    ldr r3, [r0, #0xcec]
    ldr r0, [sp, #0x4]
    ldr r1, _LIT3
    eor r4, r3, r0
    and r0, r4, #0x1
    mla r9, r0, r1, r2
    mov r0, r4, lsl #0x1f
    and r0, r0, #-2147483648
    add sl, r9, #0x30
    orr fp, r0, #0x200000
    mov r5, #0x0
.L_ac4:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9dec
    ldr r1, _LIT14
    cmp r0, r1
    bne .L_b60
    ldrh r0, [r9, #0x38]
    cmp r0, #0x0
    beq .L_b60
    ldr r1, [r9, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_b60
    ldr r2, [sl]
    mov r3, r5, lsl #0x10
    mov r0, r2, lsl #0x2
    mov r1, r0, lsr #0x18
    and r0, r3, #0x1f0000
    orr r3, fp, r0
    orr r7, r3, #0x71
    mov r2, r2, lsl #0x12
    mov r0, r1, lsl #0x1
    add r8, r0, r2, lsr #0x1f
    orr r7, r7, #0x1700
    mov r1, r8, lsl #0x10
    mov r0, r7
    mov r1, r1, lsr #0x10
    mov r2, r6
    bl func_ov002_021fd72c
    cmp r0, #0x0
    beq .L_b60
    mov r2, r8, lsl #0x10
    mov r0, #0x1
    mov r1, r7
    mov r3, r6
    mov r2, r2, lsr #0x10
    bl func_ov002_021e2d90
    add r6, r6, #0x1
.L_b60:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r9, r9, #0x14
    add sl, sl, #0x14
    blt .L_ac4
    ldr r0, _LIT15
    ldr r0, [r0]
    cmp r4, r0
    bne .L_c00
    ldr r0, _LIT16
    bl func_ov002_021b9fd0
    ldr r1, _LIT14
    cmp r0, r1
    bne .L_c00
    ldr r0, _LIT15
    mov r2, r6
    ldr r3, [r0, #0xc4]
    ldr r5, [r0, #0x1c]
    mov r0, r3, lsl #0x2
    mov r5, r5, lsl #0x10
    mov r0, r0, lsr #0x18
    and r5, r5, #0x1f0000
    orr r5, fp, r5
    orr r5, r5, r1
    mov r1, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    add r7, r0, r1, lsr #0x1f
    mov r1, r7, lsl #0x10
    mov r0, r5
    mov r1, r1, lsr #0x10
    bl func_ov002_021fd72c
    cmp r0, #0x0
    beq .L_c00
    mov r0, r7, lsl #0x10
    mov r1, r5
    mov r3, r6
    mov r2, r0, lsr #0x10
    mov r0, #0x1
    bl func_ov002_021e2d90
    add r6, r6, #0x1
.L_c00:
    ldr r0, _LIT15
    ldr r0, [r0, #0x4]
    cmp r4, r0
    bne .L_c8c
    ldr r0, _LIT17
    bl func_ov002_021b9fd0
    ldr r1, _LIT14
    cmp r0, r1
    bne .L_c8c
    ldr r0, _LIT15
    mov r2, r6
    ldr r3, [r0, #0xd8]
    ldr r4, [r0, #0x20]
    mov r0, r3, lsl #0x2
    mov r4, r4, lsl #0x10
    mov r0, r0, lsr #0x18
    and r4, r4, #0x1f0000
    orr r4, fp, r4
    orr r4, r4, r1
    mov r1, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    add r5, r0, r1, lsr #0x1f
    mov r1, r5, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021fd72c
    cmp r0, #0x0
    beq .L_c8c
    mov r0, r5, lsl #0x10
    mov r1, r4
    mov r3, r6
    mov r2, r0, lsr #0x10
    mov r0, #0x1
    bl func_ov002_021e2d90
    add r6, r6, #0x1
.L_c8c:
    ldr r0, [sp, #0x4]
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    cmp r0, #0x2
    blt .L_a90
    cmp r6, #0x0
    beq .L_cbc
    ldr r1, _LIT0
    mov r0, #0x1
    str r0, [r1, #0x59c]
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_cbc:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x67c]
    str r1, [r0, #0x68c]
    ldr r1, [r0, #0x59c]
    add r1, r1, #0x1
    str r1, [r0, #0x59c]
.L_cd8:
    ldr r0, [sp, #0x8]
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021e3878
    cmp r0, #0x0
    beq .L_d18
    ldr r0, _LIT0
    ldr r1, [r0, #0x68c]
    cmp r1, #0x0
    movne r1, #0x1
    strne r1, [r0, #0x59c]
    ldreq r1, [r0, #0x59c]
    addeq r1, r1, #0x1
    streq r1, [r0, #0x59c]
.L_d18:
    add sp, sp, #0x34
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d24:
    mov r0, #0x0
    str r0, [r6, #0x67c]
    str r0, [r6, #0x68c]
    add r0, r2, #0x1
    str r0, [r6, #0x59c]
.L_d38:
    ldr r0, [sp, #0x8]
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021e3878
    cmp r0, #0x0
    beq .L_d74
    ldr r0, _LIT0
    ldr r1, [r0, #0x68c]
    cmp r1, #0x0
    movne r1, #0x1
    strne r1, [r0, #0x59c]
    ldreq r1, [r0, #0x59c]
    addeq r1, r1, #0x1
    streq r1, [r0, #0x59c]
.L_d74:
    add sp, sp, #0x34
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d80:
    ldr r1, _LIT0
    mov r3, #0x0
    str r3, [r1, #0x598]
    mov r0, #0x1
    str r0, [r1, #0x5a0]
    str r3, [r1, #0x5a4]
    ldr r2, [r1, #0x480]
    str r2, [r1, #0x488]
    str r3, [r1, #0x5d8]
    str r3, [r1, #0x5d4]
    str r3, [r1, #0x688]
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022ce4a8
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
_LIT4: .word 0x0000161a
_LIT5: .word 0x0000171d
_LIT6: .word 0x00001964
_LIT7: .word 0x0000184f
_LIT8: .word 0x000012ec
_LIT9: .word data_ov002_022cd888
_LIT10: .word data_ov002_022d008c
_LIT11: .word 0x00001ae0
_LIT12: .word data_ov002_022cf0cc
_LIT13: .word data_ov002_022ce4aa
_LIT14: .word 0x00001771
_LIT15: .word data_ov002_022cd314
_LIT16: .word data_ov002_022cd3d8
_LIT17: .word data_ov002_022cd3ec
