; func_ov002_021e06e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf180
        .extern data_ov002_022d016c
        .extern func_0202b878
        .extern func_0202b8f0
        .extern func_0202b950
        .extern func_0202e234
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b3fd8
        .extern func_ov002_021b40dc
        .extern func_ov002_021baca8
        .extern func_ov002_021bb2cc
        .extern func_ov002_021d479c
        .extern func_ov002_021d59cc
        .extern func_ov002_021d5c50
        .extern func_ov002_021df680
        .extern func_ov002_021df6d4
        .extern func_ov002_021df708
        .extern func_ov002_021e276c
        .extern func_ov002_021e278c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021e2d94
        .extern func_ov002_021e30b4
        .extern func_ov002_021fbf30
        .extern func_ov002_02244fe4
        .extern func_ov002_022538bc
        .global func_ov002_021e06e4
        .arm
func_ov002_021e06e4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x50
    str r2, [sp, #0x8]
    str r1, [sp, #0x4]
    ldr r2, _LIT0
    mov r1, #0xb
    mov sl, r0
    bl func_ov002_021b3ecc
    str r0, [sp, #0x2c]
    ldr r2, _LIT1
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3ecc
    str r0, [sp, #0x28]
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3ecc
    ldr r2, _LIT3
    ldr r1, [sp, #0x8]
    ldr r3, _LIT4
    cmp r1, r2
    moveq r1, #0x1
    streq r1, [sp, #0xc]
    movne r1, #0x0
    strne r1, [sp, #0xc]
    ldr r1, _LIT5
    and r2, sl, #0x1
    mul r1, r2, r1
    str r1, [sp, #0x14]
    ldr r2, [sp, #0xc]
    ldr r1, [sp, #0x2c]
    orr r4, r2, r1
    ldr r1, [sp, #0x14]
    ldr r2, [r3, r1]
    ldr r1, [sp, #0x28]
    orr r3, r1, r4
    ldr r1, [sp, #0x4]
    orr r0, r0, r3
    str r0, [sp, #0x24]
    cmp r1, r2
    movhi r9, #0x1
    ldr r0, [sp, #0x4]
    movls r9, #0x0
    cmp r0, #0x0
    addle sp, sp, #0x50
    movle r0, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT6
    ldr r1, [r0, #0xcf8]
    cmp r1, #0x0
    beq .L_fcc
    rsb r4, sl, #0x1
    ldr r1, _LIT7
    mov r0, r4
    bl func_ov002_021bb2cc
    cmp r0, #0x0
    beq .L_100c
    ldr r1, _LIT7
    mov r0, r4
    bl func_ov002_021df680
    add sp, sp, #0x50
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fcc:
    ldr r0, [r0, #0xcec]
    cmp sl, r0
    bne .L_100c
    ldr r2, _LIT8
    mov r0, sl
    mov r1, #0xb
    mov r3, #0x0
    bl func_ov002_021b40dc
    cmp r0, #0x0
    beq .L_100c
    ldr r1, _LIT8
    rsb r0, sl, #0x1
    bl func_ov002_021df6d4
    add sp, sp, #0x50
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_100c:
    bl func_ov002_021e2b3c
    ldr r0, [sp, #0x4]
    mov r6, #0x0
    cmp r0, #0x0
    ble .L_13cc
    ldr r0, [sp, #0x8]
    ldr r1, _LIT9
    cmp r0, #0x0
    ldr r0, [sp, #0x14]
    movne r2, #0x1
    add r0, r1, r0
    add r8, r0, #0x260
    mov r0, sl, lsl #0x1f
    and r1, r0, #-2147483648
    str r0, [sp, #0x30]
    orr r0, r1, #0x2500000
    str r0, [sp, #0x20]
    orr r0, r1, #0x500000
    str r0, [sp, #0x1c]
    ldr r0, [sp, #0x20]
    moveq r2, r6
    orr r0, r0, #0x30000000
    str r0, [sp, #0x20]
    mov r0, r2, lsl #0x1f
    ldr r4, _LIT0
    str r0, [sp, #0x34]
    sub r0, r4, #0x32
    str r0, [sp, #0x38]
    ldr r0, _LIT10
    ldr r5, [sp, #0x4c]
    rsb r0, r0, #0x3dc
    str r0, [sp, #0x3c]
    add r0, r4, #0x66
    str r0, [sp, #0x40]
    ldr r0, _LIT1
    sub r0, r0, #0xc0
    str r0, [sp, #0x44]
.L_10a0:
    ldr r0, [sp, #0x8]
    cmp sl, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    cmp r0, #0x0
    movne r2, #0x1
    orr r0, r1, #0x55
    moveq r2, #0x0
    mov r1, r2, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021d479c
    cmp r9, #0x0
    bne .L_13b8
    ldr r2, [r8]
    ldr r0, [sp, #0x30]
    bic r1, r5, #0x200
    orr r0, r1, r0, lsr #0x16
    mov r3, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    bic r1, r0, #0x400
    ldr r0, [sp, #0x34]
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    orr r1, r1, r0, lsr #0x15
    ldr r0, [sp, #0x3c]
    add r3, r2, r3, lsr #0x1f
    ldr r2, _LIT11
    and r1, r1, r0
    and r2, r3, r2
    orr r5, r1, r2
    mov r0, #0x19
    mov r1, r5
    str r5, [sp, #0x4c]
    bl func_ov002_02244fe4
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    beq .L_12b8
    ldr r1, [r8]
    mov r0, sl
    mov r1, r1, lsl #0x13
    mov r7, r1, lsr #0x13
    mov r1, r7
    bl func_ov002_021df708
    ldr r1, [r8]
    mov r0, sl
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021e278c
    ldr r0, [sp, #0x2c]
    cmp r0, #0x0
    beq .L_11dc
    mov r0, r7
    bl func_0202e234
    cmp r0, #0x0
    beq .L_11dc
    mov r0, r7
    bl func_0202b8f0
    ldr r1, _LIT10
    cmp r0, r1
    blt .L_11dc
    ldr fp, [r8]
    mov r0, sl
    mov r3, fp, lsl #0x12
    mov fp, fp, lsl #0x2
    mov fp, fp, lsr #0x18
    mov fp, fp, lsl #0x1
    add r3, fp, r3, lsr #0x1f
    mov r3, r3, lsl #0x10
    mov r1, r4
    mov r2, #0x2
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
.L_11dc:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_126c
    mov r0, r7
    bl func_0202e234
    cmp r0, #0x0
    beq .L_126c
    mov r0, r7
    bl func_0202b950
    ldr r1, _LIT10
    cmp r0, r1
    bgt .L_126c
    ldr fp, [r8]
    mov r0, sl
    mov r3, fp, lsl #0x12
    mov fp, fp, lsl #0x2
    mov fp, fp, lsr #0x18
    mov fp, fp, lsl #0x1
    mov r1, #0xb
    add r2, r4, #0x66
    add r3, fp, r3, lsr #0x1f
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    bne .L_126c
    ldr fp, [r8]
    ldr r1, _LIT1
    mov r3, fp, lsl #0x12
    mov fp, fp, lsl #0x2
    mov fp, fp, lsr #0x18
    mov fp, fp, lsl #0x1
    add r3, fp, r3, lsr #0x1f
    mov r3, r3, lsl #0x10
    mov r0, sl
    mov r2, #0x2
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
.L_126c:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_12b8
    mov r0, r7
    bl func_0202b878
    cmp r0, #0x16
    bne .L_12b8
    ldr r7, [r8]
    ldr r1, [sp, #0x38]
    mov r3, r7, lsl #0x12
    mov r7, r7, lsl #0x2
    mov r7, r7, lsr #0x18
    mov r7, r7, lsl #0x1
    add r3, r7, r3, lsr #0x1f
    mov r3, r3, lsl #0x10
    mov r0, sl
    mov r2, #0x2
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
.L_12b8:
    ldr r7, [r8]
    mov r0, r7, lsl #0x13
    mov r1, r0, lsr #0x13
    ldr r0, [sp, #0x40]
    cmp r1, r0
    beq .L_12e0
    ldr r0, [sp, #0x44]
    cmp r1, r0
    beq .L_137c
    b .L_13b8
.L_12e0:
    mov r3, r7, lsl #0x12
    mov r7, r7, lsl #0x2
    mov r7, r7, lsr #0x18
    mov r7, r7, lsl #0x1
    mov r0, sl
    mov r1, #0xb
    add r2, r4, #0x66
    add r3, r7, r3, lsr #0x1f
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    beq .L_13b8
    ldr r7, [r8]
    ldr r2, [sp, #0x4c]
    mov r0, r7, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r1, r0, lsl #0x10
    ldr r0, [sp, #0x20]
    mov r3, r7, lsl #0x12
    orr r0, r0, r1, lsr #0x10
    mov r1, r7, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
    cmp r0, #0x0
    bne .L_13b8
    ldr r7, [r8]
    mov r0, sl
    mov r3, r7, lsl #0x12
    mov r7, r7, lsl #0x2
    mov r7, r7, lsr #0x18
    mov r7, r7, lsl #0x1
    mov r1, #0xb
    add r2, r4, #0x66
    add r3, r7, r3, lsr #0x1f
    bl func_ov002_021d5c50
    b .L_13b8
.L_137c:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_13b8
    ldr r0, [sp, #0x1c]
    mov r1, r1, lsl #0x10
    orr r0, r0, r1, lsr #0x10
    mov r1, r7, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r7, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
.L_13b8:
    ldr r0, [sp, #0x4]
    add r6, r6, #0x1
    add r8, r8, #0x4
    cmp r6, r0
    blt .L_10a0
.L_13cc:
    bl func_ov002_021e2c5c
    cmp r9, #0x0
    addne sp, sp, #0x50
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT12
    mov r0, sl
    mov r2, #0x1
    bl func_ov002_022538bc
    rsb r0, sl, #0x1
    str r0, [sp, #0x18]
    mov r0, r0, lsl #0x1f
    and r0, r0, #-2147483648
    orr r8, r0, #0x2200000
    ldr r0, [sp, #0x18]
    ldr r2, _LIT9
    mov r4, #0x200
    ldr r1, _LIT5
    and r0, r0, #0x1
    mla r1, r0, r1, r2
    ldr r5, [sp, #0x48]
    ldr fp, _LIT13
    add r7, r1, #0x94
    orr r8, r8, #0x30000000
    mov r9, #0x5
    mov r6, sl, lsl #0x1f
    rsb r4, r4, #0x0
.L_1438:
    ldr r0, [sp, #0x18]
    mov r1, r9
    mov r2, fp
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_14a8
    ldr r1, [r7]
    bic r0, r5, #0x200
    orr r0, r0, r6, lsr #0x16
    orr r0, r0, #0x400
    and r5, r0, r4
    str r5, [sp, #0x48]
    mov r0, r9, lsl #0x10
    and r0, r0, #0x1f0000
    orr r2, r8, r0
    mov r0, r1, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r0, r0, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r5
    bl func_ov002_021e30b4
.L_14a8:
    add r9, r9, #0x1
    cmp r9, #0xa
    add r7, r7, #0x14
    blt .L_1438
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_1568
    ldr r0, [sp, #0x4]
    mov r1, sl, lsl #0x3
    mov r0, r0, lsl r1
    mov r0, r0, lsl #0x10
    ldr r4, _LIT14
    mov r9, #0x0
    mov r5, r0, lsr #0x10
    mov fp, #0x1
.L_14e4:
    ldr r1, _LIT5
    ldr r0, _LIT9
    and r2, r9, #0x1
    mla r0, r2, r1, r0
    mov r6, #0x5
    add r7, r0, #0x94
    add r8, r0, #0x64
.L_1500:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    cmp r4, r0, lsr #0x13
    bne .L_1548
    ldrh r0, [r8, #0x38]
    cmp r0, #0x0
    beq .L_1548
    ldr r1, [r8, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_1548
    str r5, [sp]
    mov r0, r9
    mov r1, r6
    mov r2, r4
    mov r3, fp
    bl func_ov002_021d59cc
.L_1548:
    add r7, r7, #0x14
    add r8, r8, #0x14
    add r6, r6, #0x1
    cmp r6, #0xa
    blt .L_1500
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_14e4
.L_1568:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_1618
    ldr r2, _LIT15
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_1618
    mov r0, sl, lsl #0x1f
    and r1, r0, #-2147483648
    ldr r2, _LIT9
    ldr r0, [sp, #0x14]
    orr r6, r1, #0x2200000
    add r0, r2, r0
    mov r7, #0x0
    ldr r4, _LIT15
    add r5, r0, #0x30
    orr r6, r6, #0x30000000
    mov r8, r7
.L_15b8:
    mov r0, sl
    mov r1, r7
    mov r2, r4
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_1608
    ldr r1, [r5]
    mov r2, r7, lsl #0x10
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    and r2, r2, #0x1f0000
    add r0, r0, r1, lsr #0x1f
    orr r3, r6, r2
    mov r1, r0, lsl #0x10
    mov r2, r8
    orr r0, r3, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_1608:
    add r7, r7, #0x1
    cmp r7, #0x4
    add r5, r5, #0x14
    ble .L_15b8
.L_1618:
    ldr r0, _LIT6
    ldr r1, [r0, #0xcf8]
    cmp r1, #0x0
    ldreq r0, [r0, #0xcec]
    cmpeq r0, sl
    bne .L_178c
    ldr r2, _LIT9
    ldr r0, [sp, #0x14]
    mov r1, sl, lsl #0x1f
    add r8, r2, r0
    and r0, r1, #-2147483648
    ldr r4, _LIT16
    str r0, [sp, #0x10]
    add r5, r8, #0x64
    add r6, r8, #0x94
    orr r7, r0, #0x200000
    mov r9, #0x5
    mov fp, #0x0
.L_1660:
    mov r0, sl
    mov r1, r9
    mov r2, r4
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_16dc
    ldr r0, [r5, #0x40]
    mov r0, r0, lsr #0x5
    tst r0, #0x1
    bne .L_16dc
    ldr r2, [r6]
    mov r0, r9, lsl #0x10
    and r0, r0, #0x1f0000
    orr r0, r7, r0
    orr r0, r0, r4
    mov r1, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r1, r2, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, fp
    bl func_ov002_021e30b4
    cmp r0, #0x0
    beq .L_16dc
    mov r0, sl
    mov r1, r9
    mov r2, #0x5
    mov r3, #0x1
    bl func_ov002_021e2d94
.L_16dc:
    add r9, r9, #0x1
    cmp r9, #0xa
    add r5, r5, #0x14
    add r6, r6, #0x14
    blt .L_1660
    ldr r1, _LIT17
    ldr r0, [sp, #0x14]
    mov sl, #0x0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    bls .L_178c
    add r0, r8, #0x18
    ldr r1, _LIT18
    add r7, r0, #0x400
    ldr r0, [sp, #0x10]
    sub r4, r1, #0x4e0000
    orr r9, r0, r1
    mov r5, sl
.L_1724:
    ldr r2, [r7]
    mov r0, r2, lsl #0x2
    mov r1, r0, lsr #0x18
    mov r0, r2, lsl #0x13
    mov r3, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    cmp r4, r0, lsr #0x13
    add r6, r1, r3, lsr #0x1f
    bne .L_1778
    mov r0, r2, lsl #0xa
    movs r0, r0, lsr #0x1f
    bne .L_1778
    mov r0, r6
    bl func_ov002_021fbf30
    cmp r0, #0x0
    bne .L_1778
    mov r1, r6, lsl #0x10
    mov r0, r9
    mov r2, r5
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_1778:
    ldr r0, [r8, #0x14]
    add sl, sl, #0x1
    cmp sl, r0
    add r7, r7, #0x4
    bcc .L_1724
.L_178c:
    mov r7, #0x0
    ldr r6, _LIT19
    mov r5, r7
    mov r4, #0x3
.L_179c:
    ldr r0, [sp, #0x18]
    mov r1, r7
    mov r2, r6
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_17cc
    ldr r0, [sp, #0x18]
    mov r1, r7
    mov r2, r6
    mov r3, r4
    str r5, [sp]
    bl func_ov002_021d59cc
.L_17cc:
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_179c
    mov r0, #0x1
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x0000123b
_LIT1: .word 0x0000188c
_LIT2: .word 0x000018d5
_LIT3: .word 0x00001209
_LIT4: .word data_ov002_022cf17c
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022d016c
_LIT7: .word 0x0000178b
_LIT8: .word 0x00001885
_LIT9: .word data_ov002_022cf16c
_LIT10: .word 0x000005dc
_LIT11: .word 0x000001ff
_LIT12: .word 0x00001405
_LIT13: .word 0x00001353
_LIT14: .word 0x00001802
_LIT15: .word 0x00001911
_LIT16: .word 0x000016cd
_LIT17: .word data_ov002_022cf180
_LIT18: .word 0x004e1a61
_LIT19: .word 0x00001817
