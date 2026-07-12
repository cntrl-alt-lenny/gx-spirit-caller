; func_ov002_0225d540 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd340
        .extern data_ov002_022cd348
        .extern data_ov002_022cd35c
        .extern data_ov002_022cd360
        .extern data_ov002_022cd36c
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern func_0202f994
        .extern func_ov002_021ab784
        .extern func_ov002_021ae310
        .extern func_ov002_021b3414
        .extern func_ov002_021b3dec
        .extern func_ov002_021d46ac
        .extern func_ov002_021d58dc
        .extern func_ov002_021df53c
        .extern func_ov002_021e267c
        .extern func_ov002_021e2fc4
        .extern func_ov002_02244efc
        .extern func_ov002_0225a78c
        .global func_ov002_0225d540
        .arm
func_ov002_0225d540:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    mov r5, r0
    mov r1, #0x38
    rsb r3, r5, #0x1
    mul sl, r5, r1
    ldr r2, _LIT0
    ldr r6, _LIT1
    mul r9, r3, r1
    ldr r2, [r2, #0xd30]
    ldr r4, _LIT2
    add r7, r6, sl
    add r8, r6, r9
    ldr r6, [r4, #0x4]
    cmp r2, #0xa
    addls pc, pc, r2, lsl #0x2
    b .L_20f4
    b .L_14c0
    b .L_1708
    b .L_1a18
    b .L_1bb4
    b .L_1c00
    b .L_1c24
    b .L_1d48
    b .L_20f4
    b .L_20f4
    b .L_20f4
    b .L_2030
.L_14c0:
    bl func_ov002_0225a78c
    cmp r0, #0x0
    beq .L_14e4
    ldr r0, _LIT0
    mov r1, #0xa
    str r1, [r0, #0xd30]
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_14e4:
    mov r0, #0x0
    bl func_ov002_021ab784
    ldr r0, [r7, #0x10]
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_1530
    bge .L_159c
    sub r1, r2, #0xe7
    cmp r0, r1
    bgt .L_1520
    bge .L_15c4
    sub r1, r2, #0x2d0
    cmp r0, r1
    beq .L_1574
    b .L_16b4
.L_1520:
    sub r1, r2, #0xdc
    cmp r0, r1
    beq .L_159c
    b .L_16b4
.L_1530:
    add r1, r2, #0x70
    cmp r0, r1
    bgt .L_1550
    bge .L_1574
    add r1, r2, #0x4f
    cmp r0, r1
    beq .L_159c
    b .L_16b4
.L_1550:
    add r1, r2, #0xac
    cmp r0, r1
    bgt .L_1564
    beq .L_159c
    b .L_16b4
.L_1564:
    add r1, r2, #0xb4
    cmp r0, r1
    beq .L_1694
    b .L_16b4
.L_1574:
    mov r2, #0x0
    ldr r1, _LIT2
    str r2, [sp]
    mov r2, r0, lsl #0x10
    ldr r1, [r1, #0x1c]
    mov r0, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x2
    bl func_ov002_021d58dc
    b .L_16b4
.L_159c:
    mov r2, #0x0
    ldr r1, _LIT2
    str r2, [sp]
    mov r2, r0, lsl #0x10
    ldr r1, [r1, #0x1c]
    mov r0, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d58dc
    b .L_16b4
.L_15c4:
    mov r0, r4
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    bne .L_16b4
    cmp r5, r6
    beq .L_16b4
    ldr r2, _LIT4
    and r3, r5, #0x1
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r4, r3, r2
    ldr r3, _LIT5
    ldr r2, _LIT6
    mul r0, r1, r0
    add r3, r3, r4
    ldr r8, [r0, r3]
    add r4, r2, r4
    mov r3, r8, lsr #0x6
    mov r2, r8, lsr #0x2
    and r3, r3, #0x1
    orr r2, r2, r8, lsr #0x1
    and r2, r2, #0x1
    ldrh r4, [r0, r4]
    mvn r3, r3
    mvn r0, r2
    and r2, r4, r3
    tst r2, r0
    beq .L_16b4
    ldr r2, [r7, #0xc]
    mov r0, r5
    bl func_ov002_021df53c
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0, #0xcec]
    cmp r6, r0
    movne r0, #0x1
    moveq r0, #0x0
    add r0, r0, #0x2
    str r1, [sp]
    and r0, r0, #0xff
    mov r1, r0, lsl #0x4
    ldr r2, [r7, #0x10]
    orr r1, r1, #0x2
    mov r2, r2, lsl #0x10
    mov r3, r1, lsl #0x10
    ldr r0, _LIT2
    mov r2, r2, lsr #0x10
    ldr r1, [r0, #0x20]
    mov r0, r6
    mov r3, r3, lsr #0x10
    bl func_ov002_021d58dc
    b .L_16b4
.L_1694:
    ldr r2, [r7, #0xc]
    mov r1, r0, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r5
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x4
    bl func_ov002_021e267c
.L_16b4:
    ldr r2, _LIT7
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_16ec
    mov r1, #0x0
    ldr r0, _LIT2
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    ldr r2, _LIT7
    mov r0, r5
    mov r3, #0x2
    bl func_ov002_021d58dc
.L_16ec:
    ldr r1, _LIT0
    add sp, sp, #0x10
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1708:
    ldr r2, [r4, #0x8]
    cmp r2, #0x0
    bne .L_1960
    ldr r3, [r8, #0x10]
    ldr r7, _LIT3
    cmp r3, r7
    bgt .L_176c
    bge .L_1820
    ldr r2, _LIT8
    cmp r3, r2
    bgt .L_1748
    bge .L_17d8
    sub r0, r7, #0x2d0
    cmp r3, r0
    beq .L_17b0
    b .L_1928
.L_1748:
    add r0, r2, #0xe3
    cmp r3, r0
    bgt .L_175c
    beq .L_1848
    b .L_1928
.L_175c:
    add r0, r2, #0xee
    cmp r3, r0
    beq .L_1820
    b .L_1928
.L_176c:
    add r0, r7, #0x70
    cmp r3, r0
    bgt .L_178c
    bge .L_17b0
    add r0, r7, #0x4f
    cmp r3, r0
    beq .L_1820
    b .L_1928
.L_178c:
    add r0, r7, #0xac
    cmp r3, r0
    bgt .L_17a0
    beq .L_1820
    b .L_1928
.L_17a0:
    add r0, r7, #0xb4
    cmp r3, r0
    beq .L_1908
    b .L_1928
.L_17b0:
    mov r1, #0x0
    ldr r0, _LIT2
    str r1, [sp]
    mov r2, r3, lsl #0x10
    ldr r1, [r0, #0x20]
    mov r0, r6
    mov r2, r2, lsr #0x10
    mov r3, #0x2
    bl func_ov002_021d58dc
    b .L_1928
.L_17d8:
    ldr r9, [r4, #0x20]
    mov r7, #0x14
    ldr sl, _LIT9
    and r2, r6, #0x1
    add r1, r1, #0x830
    mul r7, r9, r7
    mla r1, r2, r1, sl
    ldrh r1, [r7, r1]
    cmp r1, #0x0
    beq .L_1928
    mov r1, #0x0
    str r1, [sp]
    mov r2, r3, lsl #0x10
    ldr r1, [r4, #0x1c]
    mov r2, r2, lsr #0x10
    mov r3, #0x1
    bl func_ov002_021d58dc
    b .L_1928
.L_1820:
    mov r1, #0x0
    ldr r0, _LIT2
    str r1, [sp]
    mov r2, r3, lsl #0x10
    ldr r1, [r0, #0x20]
    mov r0, r6
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d58dc
    b .L_1928
.L_1848:
    cmp r5, r6
    beq .L_1928
    and r3, r6, #0x1
    add r2, r1, #0x830
    ldr r1, [r4, #0x20]
    mov r0, #0x14
    mul r4, r3, r2
    ldr r3, _LIT5
    ldr r2, _LIT6
    mul r0, r1, r0
    add r3, r3, r4
    ldr r7, [r0, r3]
    add r4, r2, r4
    mov r3, r7, lsr #0x6
    mov r2, r7, lsr #0x2
    and r3, r3, #0x1
    orr r2, r2, r7, lsr #0x1
    and r2, r2, #0x1
    ldrh r4, [r0, r4]
    mvn r3, r3
    mvn r0, r2
    and r2, r4, r3
    tst r2, r0
    beq .L_1928
    ldr r2, [r8, #0xc]
    mov r0, r6
    bl func_ov002_021df53c
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0, #0xcec]
    cmp r5, r0
    movne r0, #0x1
    moveq r0, #0x0
    add r0, r0, #0x2
    str r1, [sp]
    and r0, r0, #0xff
    mov r1, r0, lsl #0x4
    ldr r2, [r8, #0x10]
    orr r1, r1, #0x2
    mov r2, r2, lsl #0x10
    mov r3, r1, lsl #0x10
    ldr r0, _LIT2
    mov r2, r2, lsr #0x10
    ldr r1, [r0, #0x1c]
    mov r0, r5
    mov r3, r3, lsr #0x10
    bl func_ov002_021d58dc
    b .L_1928
.L_1908:
    ldr r0, [r8, #0xc]
    mov r1, r3, lsl #0x10
    mov r2, r0, lsl #0x10
    mov r0, r6
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x4
    bl func_ov002_021e267c
.L_1928:
    ldr r2, _LIT7
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_1960
    mov r1, #0x0
    ldr r0, _LIT2
    str r1, [sp]
    ldr r1, [r0, #0x20]
    ldr r2, _LIT7
    mov r0, r6
    mov r3, #0x2
    bl func_ov002_021d58dc
.L_1960:
    ldr r2, _LIT2
    ldr r0, [r2, #0x8]
    cmp r0, #0x0
    bne .L_19fc
    ldr r1, [r8, #0x10]
    ldr r0, _LIT10
    cmp r1, r0
    bne .L_19fc
    ldr r0, [r8, #0x8]
    cmp r0, #0x0
    bne .L_19fc
    cmp r5, r6
    beq .L_19fc
    ldr r5, _LIT11
    ldr r0, [r2, #0x20]
    mov r3, #0x14
    ldr r2, _LIT4
    and r4, r6, #0x1
    mla r5, r4, r2, r5
    mul r2, r0, r3
    add r3, r5, #0x30
    ldr r3, [r3, r2]
    mov r4, r6, lsl #0x1f
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    and r5, r4, #-2147483648
    mov r4, r0, lsl #0x10
    mov r3, r3, lsl #0x12
    mov r0, r2, lsl #0x1
    add r0, r0, r3, lsr #0x1f
    mov r2, r0, lsl #0x10
    orr r5, r5, #0x200000
    and r3, r4, #0x1f0000
    mov r0, r1, lsl #0x10
    orr r1, r5, r3
    orr r0, r1, r0, lsr #0x10
    mov r1, r2, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e2fc4
.L_19fc:
    ldr r1, _LIT0
    add sp, sp, #0x10
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a18:
    bl func_ov002_0225a78c
    cmp r0, #0x0
    beq .L_1a40
    ldr r1, _LIT0
    mov r0, #0xb
    str r0, [r1, #0xd2c]
    mov r0, #0x0
    str r0, [r1, #0xd30]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a40:
    mov r0, r4
    ldr r0, [r0]
    cmp r0, #0x0
    movne r1, #0x8000
    ldr r0, _LIT2
    moveq r1, #0x0
    orr r3, r1, #0x16
    ldr r1, [r0, #0x3c]
    ldr r2, [r0, #0x74]
    mov r0, r3, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d46ac
    mov r0, #0x2
    bl func_ov002_021ab784
    ldr r0, _LIT2
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    bne .L_1b98
    ldr r0, _LIT12
    ldr r2, _LIT13
    ldr r0, [r0, r9]
    ldr r1, [r2, sl]
    cmp r0, #0x0
    ldrne r0, _LIT14
    strh r1, [sp, #0xc]
    ldrne r1, [r0, r9]
    ldr r0, _LIT2
    ldreq r1, [r2, r9]
    ldr r0, [r0, #0x8]
    strh r1, [sp, #0xe]
    cmp r0, #0x0
    bne .L_1b8c
    ldr r0, [r7, #0x10]
    ldr r1, _LIT15
    cmp r0, r1
    ldrne r1, _LIT16
    cmpne r0, r1
    addne r1, r1, #0x61
    cmpne r0, r1
    bne .L_1b34
    ldr r1, _LIT2
    mov r2, r5, lsl #0x1f
    ldr r1, [r1, #0x1c]
    and r2, r2, #-2147483648
    orr r3, r2, #0xa200000
    mov r2, r1, lsl #0x10
    ldr r1, [r7, #0xc]
    orr r3, r3, #0x10000000
    and r2, r2, #0x1f0000
    mov r1, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r3, r3, r2
    ldr r2, [sp, #0xc]
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_1b34:
    ldr r0, [r8, #0x10]
    ldr r1, _LIT15
    cmp r0, r1
    ldrne r1, _LIT16
    cmpne r0, r1
    bne .L_1b8c
    ldr r1, _LIT2
    mov r2, r6, lsl #0x1f
    ldr r1, [r1, #0x20]
    and r2, r2, #-2147483648
    orr r3, r2, #0xa200000
    mov r2, r1, lsl #0x10
    ldr r1, [r8, #0xc]
    orr r3, r3, #0x10000000
    and r2, r2, #0x1f0000
    mov r1, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r3, r3, r2
    ldr r2, [sp, #0xc]
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_1b8c:
    ldr r1, [sp, #0xc]
    mov r0, #0xd
    bl func_ov002_02244efc
.L_1b98:
    ldr r1, _LIT0
    add sp, sp, #0x10
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1bb4:
    bl func_ov002_0225a78c
    cmp r0, #0x0
    beq .L_1bdc
    ldr r1, _LIT0
    mov r0, #0xb
    str r0, [r1, #0xd2c]
    mov r0, #0x0
    str r0, [r1, #0xd30]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1bdc:
    mov r0, #0x1
    bl func_ov002_021ab784
    ldr r1, _LIT0
    add sp, sp, #0x10
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1c00:
    mov r0, #0x1
    bl func_ov002_021ae310
    ldr r1, _LIT0
    add sp, sp, #0x10
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1c24:
    mov r8, #0x0
    ldr r0, _LIT17
    mov r3, r4
    add r5, sp, #0x8
    mov r7, r8
.L_1c38:
    mov r6, r8, lsl #0x1
    ldr fp, [r4, #0x2c]
    ldr r1, [r4, #0x30]
    mov r9, r7
    mov sl, r3
    strh r7, [r5, r6]
.L_1c50:
    ldr r2, [sl, #0xa8]
    cmp r2, fp
    ldreq r2, [sl, #0xac]
    cmpeq r2, r1
    bne .L_1c7c
    ldr r2, [sl, #0x9c]
    cmp r2, #0x0
    beq .L_1c7c
    cmp r2, r0
    movhi r2, r0
    strh r2, [r5, r6]
.L_1c7c:
    add r9, r9, #0x1
    cmp r9, #0x2
    add sl, sl, #0x14
    blt .L_1c50
    add r8, r8, #0x1
    cmp r8, #0x2
    add r4, r4, #0x38
    blt .L_1c38
    ldrh r2, [sp, #0xa]
    ldr r3, _LIT2
    ldrh r1, [sp, #0x8]
    cmp r2, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r1, #0x0
    movne r1, #0x1
    ldr r3, [r3]
    moveq r1, #0x0
    cmp r3, #0x0
    ldr r3, _LIT2
    movne r4, #0x8000
    ldr r7, [r3, #0x34]
    moveq r4, #0x0
    orr r8, r4, #0x17
    ldr r5, [r3, #0x6c]
    ldr r6, [r3, #0x58]
    ldr r4, [r3, #0x90]
    and r7, r7, #0x1
    mov r3, r6, lsl #0x1f
    orr r3, r7, r3, lsr #0x1e
    orr r6, r3, r1, lsl #0x2
    and r5, r5, #0x1
    mov r1, r4, lsl #0x1f
    orr r1, r5, r1, lsr #0x1e
    orr r0, r1, r0, lsl #0x2
    and r1, r6, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0, lsl #0x8
    ldrh r1, [sp, #0x8]
    mov r3, r8, lsl #0x10
    mov r4, r0, lsl #0x10
    mov r0, r3, lsr #0x10
    mov r3, r4, lsr #0x10
    bl func_ov002_021d46ac
    ldr r1, _LIT0
    add sp, sp, #0x10
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1d48:
    ldr r2, [r4]
    ldr r0, _LIT18
    mul r1, r2, r1
    ldr r0, [r0, r1]
    cmp r0, #0x0
    beq .L_1e58
    ldr r0, [r7, #0x10]
    ldr r2, _LIT19
    cmp r0, r2
    bgt .L_1d9c
    bge .L_1dc0
    sub r1, r2, #0x4
    cmp r0, r1
    bgt .L_1e58
    sub r1, r2, #0x7
    cmp r0, r1
    blt .L_1e58
    subne r1, r2, #0x4
    cmpne r0, r1
    beq .L_1dc0
    b .L_1e58
.L_1d9c:
    add r1, r2, #0x6e0
    cmp r0, r1
    bgt .L_1db0
    beq .L_1dc0
    b .L_1e58
.L_1db0:
    ldr r1, _LIT20
    cmp r0, r1
    beq .L_1de8
    b .L_1e58
.L_1dc0:
    mov r2, #0x0
    ldr r1, _LIT2
    str r2, [sp]
    mov r2, r0, lsl #0x10
    ldr r1, [r1, #0x20]
    mov r0, r6
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d58dc
    b .L_1e58
.L_1de8:
    mov r9, #0x0
    mov r6, #0x4
    mov fp, r9
.L_1df4:
    mov sl, fp
.L_1df8:
    ldr r2, [r4]
    ldr r3, [r4, #0x1c]
    mov r0, r9
    mov r1, sl
    bl func_ov002_021b3414
    cmp r0, #0x0
    beq .L_1e40
    ldr r1, [r7, #0xc]
    mov r0, r9
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [sp]
    ldr r2, [r7, #0x10]
    mov r1, sl
    mov r2, r2, lsl #0x10
    mov r3, r6
    mov r2, r2, lsr #0x10
    bl func_ov002_021d58dc
.L_1e40:
    add sl, sl, #0x1
    cmp sl, #0xa
    ble .L_1df8
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_1df4
.L_1e58:
    ldr r4, _LIT2
    mov r0, #0x38
    ldr r2, [r4]
    ldr r1, _LIT18
    rsb r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    beq .L_1f74
    ldr r0, [r8, #0x10]
    ldr r2, _LIT19
    cmp r0, r2
    bgt .L_1eb8
    bge .L_1edc
    sub r1, r2, #0x4
    cmp r0, r1
    bgt .L_1f74
    sub r1, r2, #0x7
    cmp r0, r1
    blt .L_1f74
    subne r1, r2, #0x4
    cmpne r0, r1
    beq .L_1edc
    b .L_1f74
.L_1eb8:
    add r1, r2, #0x6e0
    cmp r0, r1
    bgt .L_1ecc
    beq .L_1edc
    b .L_1f74
.L_1ecc:
    ldr r1, _LIT20
    cmp r0, r1
    beq .L_1f04
    b .L_1f74
.L_1edc:
    mov r2, #0x0
    ldr r1, _LIT2
    str r2, [sp]
    mov r2, r0, lsl #0x10
    ldr r1, [r1, #0x1c]
    mov r0, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d58dc
    b .L_1f74
.L_1f04:
    mov r7, #0x0
    mov r5, #0x4
    mov r6, r7
.L_1f10:
    mov r9, r6
.L_1f14:
    ldr r2, [r4, #0x4]
    ldr r3, [r4, #0x20]
    mov r0, r7
    mov r1, r9
    bl func_ov002_021b3414
    cmp r0, #0x0
    beq .L_1f5c
    ldr r1, [r8, #0xc]
    mov r0, r7
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [sp]
    ldr r2, [r8, #0x10]
    mov r1, r9
    mov r2, r2, lsl #0x10
    mov r3, r5
    mov r2, r2, lsr #0x10
    bl func_ov002_021d58dc
.L_1f5c:
    add r9, r9, #0x1
    cmp r9, #0xa
    ble .L_1f14
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_1f10
.L_1f74:
    ldr r1, _LIT2
    mov r0, #0x38
    ldr r2, [r1]
    ldr r1, _LIT18
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    beq .L_1fc8
    cmp r2, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, _LIT2
    orr r2, r1, #0x21
    ldr r1, [r0, #0x1c]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d46ac
.L_1fc8:
    ldr r1, _LIT2
    mov r0, #0x38
    ldr r3, [r1]
    ldr r2, _LIT18
    rsb r3, r3, #0x1
    mul r0, r3, r0
    ldr r0, [r2, r0]
    cmp r0, #0x0
    beq .L_2024
    ldr r0, [r1, #0x4]
    mov r3, #0x0
    cmp r0, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, _LIT2
    orr r2, r1, #0x21
    ldr r1, [r0, #0x20]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021d46ac
.L_2024:
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2030:
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq .L_20d8
    bl func_0202f994
    cmp r0, #0x0
    beq .L_20d8
    ldr r4, [r8, #0xc]
    mov r7, #0x200
    rsb r7, r7, #0x0
    ldr r5, [sp, #0x4]
    mov r3, r6, lsl #0x1f
    ldr r2, [r8, #0x4]
    ldr r0, _LIT2
    ldr r1, [r8, #0x8]
    ldr r6, [r0, #0x20]
    and r0, r3, #-2147483648
    orr r0, r0, #0xa200000
    mov r9, r6, lsl #0x10
    ldr r8, [r8, #0x10]
    mov r6, r4, lsl #0x10
    and r5, r5, r7
    and r4, r4, r7, lsr #0x17
    orr r4, r5, r4
    bic r4, r4, #0x200
    orr r3, r4, r3, lsr #0x16
    bic r3, r3, #0x3c00
    mov r2, r2, lsl #0x1c
    orr r2, r3, r2, lsr #0x12
    orr r2, r2, #0x8000
    bic r2, r2, #0x4000
    mov r1, r1, lsl #0x1f
    orr r1, r2, r1, lsr #0x11
    bic r1, r1, #0x10000
    bic r2, r1, #0x20000
    orr r0, r0, #0x20000000
    and r3, r9, #0x1f0000
    mov r1, r8, lsl #0x10
    orr r0, r0, r3
    orr r0, r0, r1, lsr #0x10
    mov r1, r6, lsr #0x10
    str r2, [sp, #0x4]
    bl func_ov002_021e2fc4
.L_20d8:
    ldr r1, _LIT0
    mov r0, #0xb
    str r0, [r1, #0xd2c]
    mov r0, #0x0
    str r0, [r1, #0xd30]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_20f4:
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd340
_LIT2: .word data_ov002_022cd314
_LIT3: .word 0x00001913
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf0cc
_LIT6: .word data_ov002_022cf0c4
_LIT7: .word 0x00001512
_LIT8: .word 0x00001749
_LIT9: .word data_ov002_022cf0c2
_LIT10: .word 0x0000129a
_LIT11: .word data_ov002_022cf08c
_LIT12: .word data_ov002_022cd348
_LIT13: .word data_ov002_022cd35c
_LIT14: .word data_ov002_022cd360
_LIT15: .word 0x000013aa
_LIT16: .word 0x000014cc
_LIT17: .word 0x0000ffff
_LIT18: .word data_ov002_022cd36c
_LIT19: .word 0x000013b4
_LIT20: .word 0x00001a95
