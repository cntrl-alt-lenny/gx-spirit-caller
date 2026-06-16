; func_ov002_022b0484 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov002_022ca544
        .extern data_ov002_022cd73c
        .extern data_ov002_022cd750
        .extern data_ov002_022cd758
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf18c
        .extern data_ov002_022d016c
        .extern func_0201174c
        .extern func_0202b878
        .extern func_0202b890
        .extern func_0202b8a8
        .extern func_0202b9b0
        .extern func_0202df78
        .extern func_0202e234
        .extern func_0202e270
        .extern func_ov002_021b0b0c
        .extern func_ov002_021b0c28
        .global func_ov002_022b0484
        .arm
func_ov002_022b0484:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    cmp r0, #0x6e
    addls pc, pc, r0, lsl #0x2
    b .L_ef4
    b .L_ef4
    b .L_1cc
    b .L_ef4
    b .L_228
    b .L_1e8
    b .L_21c
    b .L_ef4
    b .L_ef4
    b .L_260
    b .L_28c
    b .L_2b8
    b .L_2d0
    b .L_2e8
    b .L_30c
    b .L_324
    b .L_33c
    b .L_354
    b .L_370
    b .L_388
    b .L_3a4
    b .L_72c
    b .L_670
    b .L_3c0
    b .L_3f4
    b .L_420
    b .L_44c
    b .L_eb0
    b .L_468
    b .L_49c
    b .L_4c8
    b .L_4e8
    b .L_508
    b .L_520
    b .L_538
    b .L_544
    b .L_550
    b .L_55c
    b .L_5f0
    b .L_580
    b .L_58c
    b .L_5c0
    b .L_5cc
    b .L_6a0
    b .L_6ac
    b .L_6ec
    b .L_5d8
    b .L_5e4
    b .L_5fc
    b .L_608
    b .L_614
    b .L_620
    b .L_62c
    b .L_638
    b .L_658
    b .L_664
    b .L_574
    b .L_74c
    b .L_758
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ee8
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_ef4
    b .L_764
    b .L_7e0
    b .L_8ac
    b .L_914
    b .L_a18
    b .L_b3c
    b .L_c60
    b .L_d24
    b .L_df4
.L_1cc:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd00]
    cmp r1, #0x1
    moveq r0, #0x0
    ldrne r0, [r0, #0xcf0]
    addne r0, r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1e8:
    bl func_0201174c
    cmp r0, #0x0
    beq .L_214
    ldr r0, _LIT0
    ldr r1, [r0, #0xd0c]
    cmp r1, #0x0
    bne .L_214
    ldr r0, [r0, #0xd00]
    cmp r0, #0x2
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_214:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_21c:
    ldr r0, _LIT0
    ldr r0, [r0, #0xd0c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_228:
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r1, [r1, #0xb88]
    mov r2, #0x1
    cmp r1, #0x1
    cmpne r1, #0x2
    movne r2, r0
    cmp r2, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, _LIT1
    ldr r1, [r1, #0xb9c]
    cmp r1, #0x1
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_260:
    ldr r1, _LIT0
    ldr r2, _LIT2
    ldr r3, [r1, #0xd08]
    cmp r3, r2
    addne r1, r2, #0x1
    cmpne r3, r1
    addne r1, r2, #0x2
    cmpne r3, r1
    bne .L_ef4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_28c:
    ldr r1, _LIT0
    ldr r2, _LIT3
    ldr r3, [r1, #0xd08]
    cmp r3, r2
    addne r1, r2, #0x1
    cmpne r3, r1
    addne r1, r2, #0x2
    cmpne r3, r1
    bne .L_ef4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2b8:
    ldr r0, _LIT4
    ldr r0, [r0, #0x228]
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2d0:
    ldr r0, _LIT4
    ldr r0, [r0, #0x228]
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2e8:
    ldr r1, _LIT4
    ldr r0, _LIT5
    ldr r2, [r1, #0x4]
    ldr r1, _LIT6
    eor r2, r2, #0x1
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_30c:
    ldr r0, _LIT4
    ldr r0, [r0, #0x228]
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_324:
    ldr r0, _LIT4
    ldr r0, [r0, #0x228]
    cmp r0, #0x6
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_33c:
    ldr r0, _LIT4
    ldr r0, [r0, #0x228]
    cmp r0, #0x5
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_354:
    ldr r1, _LIT0
    ldr r0, _LIT7
    ldr r1, [r1, #0xd08]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_370:
    ldr r0, _LIT4
    ldr r0, [r0, #0x228]
    cmp r0, #0x8
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_388:
    ldr r1, _LIT0
    ldr r0, _LIT8
    ldr r1, [r1, #0xd08]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_3a4:
    ldr r0, _LIT0
    ldr r0, [r0, #0xcf0]
    add r0, r0, #0x1
    cmp r0, #0x5
    movls r0, #0x1
    movhi r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_3c0:
    ldr r1, _LIT4
    ldr r0, _LIT5
    ldr r2, [r1, #0x4]
    ldr r1, _LIT9
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r1, [r1, r0]
    mov r0, #0x0
    cmp r1, #0x3e8
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r1, #0x64
    movgt r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_3f4:
    ldr r1, _LIT4
    ldr r0, _LIT5
    ldr r2, [r1, #0x4]
    ldr r1, _LIT9
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x64
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_420:
    ldr r0, _LIT4
    ldr r0, [r0, #0x228]
    cmp r0, #0x9
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, #0x36
    bl func_ov002_021b0b0c
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_44c:
    mov r0, #0x13
    bl func_ov002_021b0b0c
    ldr r1, _LIT10
    cmp r0, r1
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_468:
    ldr r1, _LIT4
    ldr r0, _LIT5
    ldr r2, [r1, #0x4]
    ldr r1, _LIT11
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r1, [r1, r0]
    mov r0, #0x0
    cmp r1, #0x5
    ldmhiia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r1, #0x0
    movne r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_49c:
    ldr r1, _LIT4
    ldr r0, _LIT5
    ldr r2, [r1, #0x4]
    ldr r1, _LIT11
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_4c8:
    mov r0, #0x1f
    bl func_ov002_021b0b0c
    cmp r0, #0x32
    movge r0, #0x32
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, #0x1f
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_4e8:
    mov r0, #0x21
    bl func_ov002_021b0b0c
    cmp r0, #0x32
    movge r0, #0x32
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, #0x21
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_508:
    mov r0, #0x39
    bl func_ov002_021b0b0c
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_520:
    mov r0, #0x3a
    bl func_ov002_021b0b0c
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_538:
    mov r0, #0x23
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_544:
    mov r0, #0x24
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_550:
    mov r0, #0x18
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_55c:
    mov r0, #0x19
    bl func_ov002_021b0b0c
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_574:
    mov r0, #0x3b
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_580:
    mov r0, #0x0
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_58c:
    mov r0, #0x3
    bl func_ov002_021b0b0c
    mov r4, r0
    mov r0, #0x1
    bl func_ov002_021b0b0c
    cmp r4, r0
    ble .L_5b4
    mov r0, #0x3
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_5b4:
    mov r0, #0x1
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_5c0:
    mov r0, #0x14
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_5cc:
    mov r0, #0x5
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_5d8:
    mov r0, #0xf
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_5e4:
    mov r0, #0xd
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_5f0:
    mov r0, #0x25
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_5fc:
    mov r0, #0x26
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_608:
    mov r0, #0x28
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_614:
    mov r0, #0x29
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_620:
    mov r0, #0x2b
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_62c:
    mov r0, #0x34
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_638:
    mov r0, #0x2e
    bl func_ov002_021b0b0c
    cmp r0, #0x32
    movge r0, #0x32
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, #0x2e
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_658:
    mov r0, #0x31
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_664:
    mov r0, #0x32
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_670:
    ldr r1, _LIT4
    ldr r0, [r1, #0x228]
    cmp r0, #0x9
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT0
    ldr r1, [r1, #0x4]
    ldr r0, [r0, #0xcec]
    cmp r0, r1
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_6a0:
    mov r0, #0x37
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_6ac:
    ldr r0, _LIT4
    ldr r0, [r0, #0x228]
    cmp r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, #0x4
    bl func_ov002_021b0b0c
    cmp r0, #0x0
    ble .L_6e4
    mov r0, #0x2
    bl func_ov002_021b0b0c
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_6e4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_6ec:
    ldr r0, _LIT4
    ldr r0, [r0, #0x228]
    cmp r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, #0x2
    bl func_ov002_021b0b0c
    cmp r0, #0x0
    ble .L_724
    mov r0, #0x4
    bl func_ov002_021b0b0c
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_724:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_72c:
    ldr r0, _LIT4
    ldr r0, [r0, #0x228]
    cmp r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, #0x38
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_74c:
    mov r0, #0x3c
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_758:
    mov r0, #0x3d
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_764:
    ldr r4, _LIT4
    mov r0, #0x108
    ldr r2, [r4, #0x4]
    ldr r1, _LIT12
    mul r3, r2, r0
    ldr r0, [r1, r3]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT13
    mov r5, #0x0
    ldr r0, [r0, r3]
    cmp r0, #0x0
    bls .L_7d8
    mov r6, #0x108
.L_7a0:
    add r0, r4, r3
    add r0, r0, r5, lsl #0x1
    ldrh r0, [r0, #0x20]
    bl func_0202e234
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r4, #0x4]
    add r5, r5, #0x1
    mul r3, r0, r6
    add r0, r4, r3
    ldr r0, [r0, #0x14]
    cmp r5, r0
    bcc .L_7a0
.L_7d8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_7e0:
    ldr r4, _LIT4
    mov r0, #0x108
    ldr r2, [r4, #0x4]
    ldr r1, _LIT13
    mul r3, r2, r0
    ldr r0, [r1, r3]
    mov r5, #0x0
    cmp r0, #0x0
    bls .L_840
    mov r6, #0x108
.L_808:
    add r0, r4, r3
    add r0, r0, r5, lsl #0x1
    ldrh r0, [r0, #0x20]
    bl func_0202b9b0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r2, [r4, #0x4]
    add r5, r5, #0x1
    mul r3, r2, r6
    add r0, r4, r3
    ldr r0, [r0, #0x14]
    cmp r5, r0
    bcc .L_808
.L_840:
    eor r1, r2, #0x1
    mov r0, #0x108
    mul r2, r1, r0
    ldr r0, _LIT13
    mov r5, #0x0
    ldr r0, [r0, r2]
    cmp r0, #0x0
    bls .L_8a4
    ldr r4, _LIT4
    mov r6, #0x108
.L_868:
    add r0, r4, r2
    add r0, r0, r5, lsl #0x1
    ldrh r0, [r0, #0x20]
    bl func_0202b9b0
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r4, #0x4]
    add r5, r5, #0x1
    eor r0, r0, #0x1
    mul r2, r0, r6
    add r0, r4, r2
    ldr r0, [r0, #0x14]
    cmp r5, r0
    bcc .L_868
.L_8a4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_8ac:
    ldr r4, _LIT4
    mov r0, #0x108
    ldr r2, [r4, #0x4]
    ldr r1, _LIT13
    mul r3, r2, r0
    ldr r0, [r1, r3]
    mov r5, #0x0
    cmp r0, #0x0
    bls .L_90c
    mov r6, #0x108
.L_8d4:
    add r0, r4, r3
    add r0, r0, r5, lsl #0x1
    ldrh r0, [r0, #0x20]
    bl func_0202b9b0
    cmp r0, #0x3
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r4, #0x4]
    add r5, r5, #0x1
    mul r3, r0, r6
    add r0, r4, r3
    ldr r0, [r0, #0x14]
    cmp r5, r0
    bcc .L_8d4
.L_90c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_914:
    ldr r4, _LIT4
    mov r0, #0x108
    ldr r2, [r4, #0x4]
    ldr r1, _LIT12
    mul r0, r2, r0
    ldr r3, [r1, r0]
    mov r5, #0x0
    cmp r3, #0x0
    bls .L_998
    mov r8, #0x108
.L_93c:
    add r2, r4, r0
    add r1, r2, r5, lsl #0x1
    add r7, r5, #0x1
    cmp r7, r3
    ldrh r6, [r1, #0xde]
    bcs .L_98c
.L_954:
    add r0, r2, r7, lsl #0x1
    ldrh r1, [r0, #0xde]
    mov r0, r6
    bl func_0202df78
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, [r4, #0x4]
    add r7, r7, #0x1
    mul r0, r1, r8
    add r2, r4, r0
    ldr r3, [r2, #0x1c]
    cmp r7, r3
    bcc .L_954
.L_98c:
    add r5, r5, #0x1
    cmp r5, r3
    bcc .L_93c
.L_998:
    ldr r1, _LIT13
    mov r5, #0x0
    ldr r3, [r1, r0]
    cmp r3, #0x0
    bls .L_a10
    ldr r4, _LIT4
    mov r8, #0x108
.L_9b4:
    add r2, r4, r0
    add r1, r2, r5, lsl #0x1
    add r7, r5, #0x1
    cmp r7, r3
    ldrh r6, [r1, #0x20]
    bcs .L_a04
.L_9cc:
    add r0, r2, r7, lsl #0x1
    ldrh r1, [r0, #0x20]
    mov r0, r6
    bl func_0202df78
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, [r4, #0x4]
    add r7, r7, #0x1
    mul r0, r1, r8
    add r2, r4, r0
    ldr r3, [r2, #0x14]
    cmp r7, r3
    bcc .L_9cc
.L_a04:
    add r5, r5, #0x1
    cmp r5, r3
    bcc .L_9b4
.L_a10:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_a18:
    ldr r4, _LIT4
    mov r5, #0x0
    ldr r1, [r4, #0x4]
    mov r0, #0x108
    mul r0, r1, r0
    ldr r1, _LIT12
    mov r6, r5
    ldr r1, [r1, r0]
    mov r7, r5
    cmp r1, #0x0
    bls .L_aac
    mov r8, #0x108
.L_a48:
    add r0, r4, r0
    add r0, r0, r7, lsl #0x1
    ldrh r9, [r0, #0xde]
    mov r0, r9
    bl func_0202e234
    cmp r0, #0x0
    beq .L_a90
    cmp r5, #0x0
    mov r0, r9
    bne .L_a7c
    bl func_0202b878
    mov r5, r0
    b .L_a8c
.L_a7c:
    bl func_0202b878
    cmp r5, r0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_a8c:
    add r6, r6, #0x1
.L_a90:
    ldr r1, [r4, #0x4]
    add r7, r7, #0x1
    mul r0, r1, r8
    add r1, r4, r0
    ldr r1, [r1, #0x1c]
    cmp r7, r1
    bcc .L_a48
.L_aac:
    ldr r1, _LIT13
    mov r7, #0x0
    ldr r1, [r1, r0]
    cmp r1, #0x0
    bls .L_b2c
    ldr r4, _LIT4
    mov r8, #0x108
.L_ac8:
    add r0, r4, r0
    add r0, r0, r7, lsl #0x1
    ldrh r9, [r0, #0x20]
    mov r0, r9
    bl func_0202e234
    cmp r0, #0x0
    beq .L_b10
    cmp r5, #0x0
    mov r0, r9
    bne .L_afc
    bl func_0202b878
    mov r5, r0
    b .L_b0c
.L_afc:
    bl func_0202b878
    cmp r5, r0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_b0c:
    add r6, r6, #0x1
.L_b10:
    ldr r1, [r4, #0x4]
    add r7, r7, #0x1
    mul r0, r1, r8
    add r1, r4, r0
    ldr r1, [r1, #0x14]
    cmp r7, r1
    bcc .L_ac8
.L_b2c:
    cmp r6, #0x8
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_b3c:
    ldr r4, _LIT4
    mov r5, #0x0
    ldr r1, [r4, #0x4]
    mov r0, #0x108
    mul r0, r1, r0
    ldr r1, _LIT12
    mov r6, r5
    ldr r1, [r1, r0]
    mov r7, r5
    cmp r1, #0x0
    bls .L_bd0
    mov r8, #0x108
.L_b6c:
    add r0, r4, r0
    add r0, r0, r7, lsl #0x1
    ldrh r9, [r0, #0xde]
    mov r0, r9
    bl func_0202e234
    cmp r0, #0x0
    beq .L_bb4
    cmp r5, #0x0
    mov r0, r9
    bne .L_ba0
    bl func_0202b890
    mov r5, r0
    b .L_bb0
.L_ba0:
    bl func_0202b890
    cmp r5, r0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_bb0:
    add r6, r6, #0x1
.L_bb4:
    ldr r1, [r4, #0x4]
    add r7, r7, #0x1
    mul r0, r1, r8
    add r1, r4, r0
    ldr r1, [r1, #0x1c]
    cmp r7, r1
    bcc .L_b6c
.L_bd0:
    ldr r1, _LIT13
    mov r7, #0x0
    ldr r1, [r1, r0]
    cmp r1, #0x0
    bls .L_c50
    ldr r4, _LIT4
    mov r8, #0x108
.L_bec:
    add r0, r4, r0
    add r0, r0, r7, lsl #0x1
    ldrh r9, [r0, #0x20]
    mov r0, r9
    bl func_0202e234
    cmp r0, #0x0
    beq .L_c34
    cmp r5, #0x0
    mov r0, r9
    bne .L_c20
    bl func_0202b890
    mov r5, r0
    b .L_c30
.L_c20:
    bl func_0202b890
    cmp r5, r0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_c30:
    add r6, r6, #0x1
.L_c34:
    ldr r1, [r4, #0x4]
    add r7, r7, #0x1
    mul r0, r1, r8
    add r1, r4, r0
    ldr r1, [r1, #0x14]
    cmp r7, r1
    bcc .L_bec
.L_c50:
    cmp r6, #0x8
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_c60:
    ldr r5, _LIT4
    mov r6, #0x0
    ldr r2, [r5, #0x4]
    mov r0, #0x108
    mul r1, r2, r0
    ldr r0, _LIT12
    mov r7, r6
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_cc0
    mov r4, #0x1
    mov r8, #0x108
.L_c90:
    add r0, r5, r1
    add r0, r0, r7, lsl #0x1
    ldrh r0, [r0, #0xde]
    bl func_0202b8a8
    ldr r2, [r5, #0x4]
    add r7, r7, #0x1
    mul r1, r2, r8
    add r2, r5, r1
    ldr r2, [r2, #0x1c]
    orr r6, r6, r4, lsl r0
    cmp r7, r2
    bcc .L_c90
.L_cc0:
    ldr r0, _LIT13
    mov r7, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_d10
    ldr r5, _LIT4
    mov r4, #0x1
    mov r8, #0x108
.L_ce0:
    add r0, r5, r1
    add r0, r0, r7, lsl #0x1
    ldrh r0, [r0, #0x20]
    bl func_0202b8a8
    ldr r2, [r5, #0x4]
    add r7, r7, #0x1
    mul r1, r2, r8
    add r2, r5, r1
    ldr r2, [r2, #0x14]
    orr r6, r6, r4, lsl r0
    cmp r7, r2
    bcc .L_ce0
.L_d10:
    ldr r0, _LIT14
    cmp r0, r6, asr #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_d24:
    ldr r4, _LIT4
    mov r5, #0x0
    ldr r1, [r4, #0x4]
    mov r0, #0x108
    mul r0, r1, r0
    ldr r1, _LIT12
    mov r6, r5
    ldr r1, [r1, r0]
    cmp r1, #0x0
    bls .L_d8c
    mov r7, #0x108
.L_d50:
    add r0, r4, r0
    add r0, r0, r6, lsl #0x1
    ldrh r0, [r0, #0xde]
    bl func_0202b8a8
    cmp r0, #0x1
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, [r4, #0x4]
    add r6, r6, #0x1
    mul r0, r1, r7
    add r1, r4, r0
    ldr r1, [r1, #0x1c]
    addeq r5, r5, #0x1
    cmp r6, r1
    bcc .L_d50
.L_d8c:
    ldr r1, _LIT13
    mov r6, #0x0
    ldr r1, [r1, r0]
    cmp r1, #0x0
    bls .L_de4
    ldr r4, _LIT4
    mov r7, #0x108
.L_da8:
    add r0, r4, r0
    add r0, r0, r6, lsl #0x1
    ldrh r0, [r0, #0x20]
    bl func_0202b8a8
    cmp r0, #0x1
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, [r4, #0x4]
    add r6, r6, #0x1
    mul r0, r1, r7
    add r1, r4, r0
    ldr r1, [r1, #0x14]
    addeq r5, r5, #0x1
    cmp r6, r1
    bcc .L_da8
.L_de4:
    cmp r5, #0x8
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_df4:
    ldr r4, _LIT4
    mov r0, #0x108
    ldr r2, [r4, #0x4]
    ldr r1, _LIT12
    mul r0, r2, r0
    ldr r1, [r1, r0]
    mov r5, #0x0
    cmp r1, #0x0
    bls .L_e54
    mov r6, #0x108
.L_e1c:
    add r0, r4, r0
    add r0, r0, r5, lsl #0x1
    ldrh r0, [r0, #0xde]
    bl func_0202e270
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, [r4, #0x4]
    add r5, r5, #0x1
    mul r0, r1, r6
    add r1, r4, r0
    ldr r1, [r1, #0x1c]
    cmp r5, r1
    bcc .L_e1c
.L_e54:
    ldr r1, _LIT13
    mov r5, #0x0
    ldr r1, [r1, r0]
    cmp r1, #0x0
    bls .L_ea8
    ldr r4, _LIT4
    mov r6, #0x108
.L_e70:
    add r0, r4, r0
    add r0, r0, r5, lsl #0x1
    ldrh r0, [r0, #0x20]
    bl func_0202e270
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, [r4, #0x4]
    add r5, r5, #0x1
    mul r0, r1, r6
    add r1, r4, r0
    ldr r1, [r1, #0x14]
    cmp r5, r1
    bcc .L_e70
.L_ea8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_eb0:
    ldr r1, _LIT4
    ldr r0, _LIT5
    ldr r2, [r1, #0x4]
    ldr r1, _LIT9
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r2, [r1, r0]
    ldr r1, _LIT15
    mov r0, #0x1
    cmp r2, r1
    addne r1, r0, #0x23c
    cmpne r2, r1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_ee8:
    mov r0, #0x3e
    bl func_ov002_021b0b0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_ef4:
    cmp r0, #0x3a
    blt .L_f1c
    cmp r0, #0x65
    bgt .L_f1c
    sub r1, r0, #0x3a
    ldr r0, _LIT16
    mov r1, r1, lsl #0x1
    ldrh r0, [r0, r1]
    bl func_ov002_021b0c28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_f1c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_021040ac
_LIT2: .word 0x00001386
_LIT3: .word 0x000019a3
_LIT4: .word data_ov002_022cd73c
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022cf18c
_LIT7: .word 0x00000fbe
_LIT8: .word 0x000010fd
_LIT9: .word data_ov002_022cf16c
_LIT10: .word 0x00004e20
_LIT11: .word data_ov002_022cf17c
_LIT12: .word data_ov002_022cd758
_LIT13: .word data_ov002_022cd750
_LIT14: .word 0x00000fff
_LIT15: .word 0x00001662
_LIT16: .word data_ov002_022ca544
