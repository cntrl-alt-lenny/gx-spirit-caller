; func_ov002_02261c44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern data_ov002_022d016c
        .extern func_0202e234
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b4120
        .extern func_ov002_021b8fcc
        .extern func_ov002_021b947c
        .extern func_ov002_021b9e00
        .extern func_ov002_021b9ecc
        .extern func_ov002_021baca8
        .extern func_ov002_021bd030
        .extern func_ov002_021d59cc
        .extern func_ov002_021d5b80
        .extern func_ov002_021d5d58
        .extern func_ov002_021d6870
        .extern func_ov002_021d8414
        .extern func_ov002_021d91e0
        .extern func_ov002_021de41c
        .extern func_ov002_021de480
        .extern func_ov002_021df62c
        .extern func_ov002_021df6d4
        .extern func_ov002_021e30b4
        .extern func_ov002_02244fe4
        .global func_ov002_02261c44
        .arm
func_ov002_02261c44:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x3c
    str r0, [sp, #0xc]
    ldr r0, _LIT0
    ldr r0, [r0, #0xd30]
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_6948
    b .L_5f40
    b .L_5f68
    b .L_62cc
    b .L_6358
    b .L_64cc
    b .L_6550
    b .L_6644
    b .L_66d0
    b .L_67a8
    b .L_6880
.L_5f40:
    mov r0, #0x17
    mov r1, #0x0
    bl func_ov002_02244fe4
    ldr r1, _LIT0
    add sp, sp, #0x3c
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5f68:
    mov r0, #0x0
    str r0, [sp, #0x10]
.L_5f70:
    ldr r0, _LIT0
    ldr r5, _LIT1
    ldr r3, [r0, #0xcec]
    ldr r0, [sp, #0x10]
    ldr r2, _LIT2
    eor r6, r3, r0
    ldr r1, _LIT3
    and r0, r6, #0x1
    mla r9, r0, r1, r2
    sub r0, r5, #0xbd
    str r0, [sp, #0x14]
    ldr r0, _LIT4
    add fp, r5, #0xfc
    sub r0, r0, #0x3
    str r0, [sp, #0x34]
    add r0, r5, #0x90
    str r0, [sp, #0x24]
    sub r0, r5, #0xbd
    str r0, [sp, #0x20]
    add r0, r5, #0x1
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
    ldr r0, _LIT4
    add sl, r9, #0x30
    add r0, r0, #0x6e
    str r0, [sp, #0x2c]
    ldr r0, _LIT4
    mov r7, #0x0
    add r0, r0, #0x6e
    str r0, [sp, #0x28]
    ldr r0, _LIT4
    mov r4, fp
    add r0, r0, #0x14c
    str r0, [sp, #0x38]
    ldr r0, _LIT4
    sub r0, r0, #0x3
    str r0, [sp, #0x30]
.L_6004:
    ldr r0, [r9, #0x40]
    ldrh r2, [r9, #0x38]
    mov r1, r0, lsr #0x6
    and r1, r1, #0x1
    mvn r1, r1
    and r2, r2, r1
    mov r1, r0, lsr #0x2
    orr r0, r1, r0, lsr #0x1
    and r0, r0, #0x1
    mvn r0, r0
    tst r2, r0
    beq .L_6288
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9ecc
    mov r8, r0
    cmp r8, r4
    bgt .L_608c
    cmp r8, fp
    bge .L_60e4
    ldr r0, [sp, #0x18]
    cmp r8, r0
    bgt .L_607c
    ldr r0, [sp, #0x1c]
    cmp r8, r0
    bge .L_6180
    ldr r0, [sp, #0x20]
    cmp r8, r0
    beq .L_60e4
    b .L_6288
.L_607c:
    ldr r0, [sp, #0x24]
    cmp r8, r0
    beq .L_60e4
    b .L_6288
.L_608c:
    ldr r0, [sp, #0x28]
    cmp r8, r0
    bgt .L_60d4
    ldr r0, [sp, #0x2c]
    cmp r8, r0
    bge .L_61b0
    ldr r0, _LIT4
    cmp r8, r0
    bgt .L_6288
    ldr r0, [sp, #0x30]
    cmp r8, r0
    blt .L_6288
    ldr r0, [sp, #0x34]
    cmp r8, r0
    ldrne r0, _LIT4
    cmpne r8, r0
    beq .L_60e4
    b .L_6288
.L_60d4:
    ldr r0, [sp, #0x38]
    cmp r8, r0
    beq .L_6220
    b .L_6288
.L_60e4:
    mov r0, r6
    mov r1, r7
    mov r2, r5
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_6288
    ldrh r0, [r9, #0x36]
    cmp r0, #0x0
    bne .L_6288
    mov r0, r6
    mov r1, r7
    mov r2, r5
    mov r3, #0x1
    bl func_ov002_021d5b80
    ldr r3, [sl]
    mov r0, r6
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r7
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df62c
    mov r2, #0x0
    str r8, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, r6
    mov r1, r7
    mov r3, r2
    bl func_ov002_021d6870
    mov r0, #0x0
    str r0, [sp]
    ldr r2, [sp, #0x14]
    mov r0, r6
    mov r1, r7
    mov r3, #0x22
    bl func_ov002_021d59cc
    b .L_6288
.L_6180:
    mov r0, r6
    mov r1, r7
    mov r2, r8
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_6288
    mov r2, r8
    mov r0, r6
    mov r1, r7
    mov r3, #0x1
    bl func_ov002_021d5b80
    b .L_6288
.L_61b0:
    mov r2, r8
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_6288
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9e00
    cmp r0, #0x0
    beq .L_6288
    ldr r3, [sl]
    mov r0, r6
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r7
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df62c
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9e00
    rsb r2, r0, #0x0
    mov r0, r6
    mov r1, r7
    bl func_ov002_021d91e0
    b .L_6288
.L_6220:
    mov r0, r6
    mov r1, r7
    mov r2, r5
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_6288
    ldrh r0, [r9, #0x36]
    cmp r0, #0x0
    bne .L_6288
    ldr r3, [sl]
    mov r0, r6
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r7
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df62c
    mov r2, #0x0
    str r8, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, r6
    mov r1, r7
    mov r3, r2
    bl func_ov002_021d6870
.L_6288:
    add r9, r9, #0x14
    add sl, sl, #0x14
    add r7, r7, #0x1
    cmp r7, #0x5
    blt .L_6004
    ldr r0, [sp, #0x10]
    add r0, r0, #0x1
    str r0, [sp, #0x10]
    cmp r0, #0x2
    blt .L_5f70
    ldr r1, _LIT0
    add sp, sp, #0x3c
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_62cc:
    mov r7, #0x0
    ldr r5, _LIT5
    mov r4, #0x1
    mov r6, r7
.L_62dc:
    ldr r0, _LIT0
    mov r9, r6
    ldr r0, [r0, #0xcec]
    eor r8, r0, r7
.L_62ec:
    mov r0, r8
    mov r1, r9
    mov r2, r5
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_6324
    mov r0, r8
    mov r1, r5
    bl func_ov002_021df6d4
    mov r0, r8
    mov r1, r9
    mov r2, r4
    mov r3, r5
    bl func_ov002_021de480
.L_6324:
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_62ec
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_62dc
    ldr r1, _LIT0
    add sp, sp, #0x3c
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6358:
    mov r6, #0x0
    ldr r4, _LIT6
    mov r5, r6
.L_6364:
    ldr r0, _LIT0
    mov r9, r5
    ldr r0, [r0, #0xcec]
    eor r8, r0, r6
.L_6374:
    mov r0, r8
    mov r1, r9
    mov r2, r4
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_64a4
    mov r0, r8
    mov r1, r9
    mov r2, r4
    bl func_ov002_021b4120
    cmp r0, #0x0
    blt .L_64a4
    add r1, r0, r0, lsr #0x1f
    and r6, r0, #0x1
    mov r0, r6
    mov r5, r1, asr #0x1
    bl func_ov002_021bd030
    mov r4, r0
    mov r0, r5
    bl func_ov002_021b947c
    cmp r4, #0x0
    and r7, r0, #0xff
    blt .L_6484
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xe
    bne .L_6484
    ldr r2, _LIT2
    ldr r0, _LIT3
    and r1, r8, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mul r0, r9, r0
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r0, r8
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r9
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    str r4, [sp]
    mov r1, #0x1
    mov r0, r7
    mov r2, r5
    mov r3, r6
    str r1, [sp, #0x4]
    mov r5, #0x0
    mov r1, #0xe
    str r5, [sp, #0x8]
    bl func_ov002_021d8414
    and r1, r6, #0xff
    and r0, r4, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r1, r0, lsl #0x10
    and r2, r8, #0xff
    and r0, r9, #0xff
    orr r0, r2, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    mov r0, r6
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0xc
    bl func_ov002_021d5d58
.L_6484:
    ldr r2, _LIT6
    mov r0, r8
    mov r1, r9
    mov r3, #0x0
    bl func_ov002_021d5b80
    add sp, sp, #0x3c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_64a4:
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_6374
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_6364
    ldr r0, _LIT0
    ldr r1, [r0, #0xd30]
    add r1, r1, #0x1
    str r1, [r0, #0xd30]
.L_64cc:
    ldr r4, _LIT7
    mov r6, #0x0
    mov r5, #0xb
.L_64d8:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_6534
    mov r2, r6, lsl #0x1f
    mov r1, #0x0
    ldr r0, _LIT8
    and r3, r2, #-2147483648
    mov r2, r1
    orr r0, r3, r0
    bl func_ov002_021e30b4
    cmp r0, #0x0
    bne .L_6528
    ldr r2, _LIT7
    mov r0, r6
    mov r1, #0xb
    mov r3, #0x0
    bl func_ov002_021d5b80
.L_6528:
    add sp, sp, #0x3c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6534:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_64d8
    ldr r0, _LIT0
    ldr r1, [r0, #0xd30]
    add r1, r1, #0x1
    str r1, [r0, #0xd30]
.L_6550:
    mov r9, #0x0
    ldr r7, _LIT9
    ldr r6, _LIT0
    mov r8, r9
.L_6560:
    ldr r0, [r6, #0xcec]
    mov r5, r8
    eor r4, r0, r9
.L_656c:
    mov r0, r4
    mov r1, r5
    mov r2, r7
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_661c
    mov r0, r4
    mov r1, r5
    mov r2, r7
    bl func_ov002_021b4120
    movs r2, r0
    bmi .L_661c
    ldr r3, _LIT2
    ldr r0, _LIT3
    and r1, r4, #0x1
    mla r3, r1, r0, r3
    mov r0, #0x14
    mul r0, r5, r0
    add r1, r3, #0x30
    ldr r3, [r1, r0]
    mov r1, r4, lsl #0x1f
    mov r0, r3, lsl #0x2
    and r7, r1, #-2147483648
    mov r1, r0, lsr #0x18
    mov r6, r5, lsl #0x10
    orr r7, r7, #0x200000
    and r0, r6, #0x1f0000
    orr r0, r7, r0
    orr r0, r0, #0x95
    mov r3, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    mov r1, r1, lsl #0x10
    orr r0, r0, #0x1a00
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
    ldr r2, _LIT9
    mov r0, r4
    mov r1, r5
    mov r3, #0x0
    bl func_ov002_021d5b80
    add sp, sp, #0x3c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_661c:
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_656c
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_6560
    ldr r0, _LIT0
    ldr r1, [r0, #0xd30]
    add r1, r1, #0x1
    str r1, [r0, #0xd30]
.L_6644:
    ldr r5, _LIT10
    ldr r6, _LIT2
    ldr fp, _LIT0
    mov r8, #0x0
    mov r4, #0x1
.L_6658:
    ldr r0, [fp, #0xcec]
    mov sl, #0x0
    eor r9, r0, r8
    ldr r0, _LIT3
    and r1, r9, #0x1
    mla r0, r1, r0, r6
    add r7, r0, #0x30
.L_6674:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_6698
    mov r0, r9
    mov r1, sl
    mov r2, r5
    mov r3, r4
    bl func_ov002_021d5b80
.L_6698:
    add sl, sl, #0x1
    cmp sl, #0x5
    add r7, r7, #0x14
    blt .L_6674
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_6658
    ldr r1, _LIT0
    add sp, sp, #0x3c
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_66d0:
    mov r6, #0x0
    ldr r5, _LIT11
    mov fp, r6
    mov r4, #0x1
.L_66e0:
    ldr r0, _LIT0
    ldr r1, _LIT3
    ldr r0, [r0, #0xcec]
    mov sl, #0x0
    eor r9, r0, fp
    ldr r0, _LIT2
    and r2, r9, #0x1
    mla r0, r2, r1, r0
    add r7, r0, #0x30
    mov r8, r9, lsl #0x4
.L_6708:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_6750
    bl func_0202e234
    cmp r0, #0x0
    bne .L_6750
    mov r0, r9
    mov r1, sl
    bl func_ov002_021b8fcc
    cmp r0, #0x0
    bne .L_6750
    mov r0, r9
    mov r1, sl
    mov r2, r5
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    orrne r6, r6, r4, lsl r8
.L_6750:
    add sl, sl, #0x1
    cmp sl, #0x5
    add r7, r7, #0x14
    add r8, r8, #0x1
    blt .L_6708
    add fp, fp, #0x1
    cmp fp, #0x2
    blt .L_66e0
    cmp r6, #0x0
    beq .L_6798
    ldr r0, [sp, #0xc]
    ldr r1, _LIT11
    mov r2, r6
    rsb r0, r0, #0x1
    bl func_ov002_021de41c
    add sp, sp, #0x3c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6798:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd30]
    add r1, r1, #0x1
    str r1, [r0, #0xd30]
.L_67a8:
    ldr r2, _LIT12
    ldr r0, [sp, #0xc]
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_6864
    mov r6, #0x0
    ldr r5, _LIT12
    mov fp, r6
    mov r4, #0x1
.L_67d0:
    ldr r0, _LIT0
    ldr r1, _LIT3
    ldr r0, [r0, #0xcec]
    mov sl, #0x0
    eor r9, r0, fp
    ldr r0, _LIT2
    and r2, r9, #0x1
    mla r0, r2, r1, r0
    add r7, r0, #0x30
    mov r8, r9, lsl #0x4
.L_67f8:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_6820
    mov r0, r9
    mov r1, sl
    mov r2, r5
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    orrne r6, r6, r4, lsl r8
.L_6820:
    add sl, sl, #0x1
    cmp sl, #0x5
    add r7, r7, #0x14
    add r8, r8, #0x1
    blt .L_67f8
    add fp, fp, #0x1
    cmp fp, #0x2
    blt .L_67d0
    cmp r6, #0x0
    beq .L_6864
    ldr r1, _LIT12
    ldr r0, [sp, #0xc]
    bl func_ov002_021df6d4
    ldr r1, _LIT12
    ldr r0, [sp, #0xc]
    mov r2, r6
    bl func_ov002_021de41c
.L_6864:
    ldr r1, _LIT0
    add sp, sp, #0x3c
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6880:
    ldr r0, [sp, #0xc]
    mov r8, #0x0
    rsb r2, r0, #0x1
    ldr r0, _LIT3
    and r1, r2, #0x1
    mul r3, r1, r0
    ldr r0, _LIT13
    ldr r0, [r0, r3]
    cmp r0, #0x0
    bls .L_692c
    ldr r0, _LIT2
    mov r2, r2, lsl #0x1f
    add r7, r0, r3
    ldr r1, _LIT14
    add r0, r7, #0x18
    and r2, r2, #-2147483648
    add r5, r0, #0x400
    orr r6, r2, r1
    sub r9, r1, #0x4e0000
    mov r4, r8
.L_68d0:
    ldr r1, [r5]
    mov r0, r1, lsl #0x13
    cmp r9, r0, lsr #0x13
    bne .L_6918
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r1, r0, lsl #0x10
    mov r0, r6
    mov r2, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
    cmp r0, #0x0
    addne sp, sp, #0x3c
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6918:
    ldr r0, [r7, #0x14]
    add r8, r8, #0x1
    cmp r8, r0
    add r5, r5, #0x4
    bcc .L_68d0
.L_692c:
    ldr r1, _LIT0
    add sp, sp, #0x3c
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6948:
    ldr r2, _LIT15
    ldr r0, [sp, #0xc]
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021d5b80
    ldr r2, _LIT16
    ldr r0, [sp, #0xc]
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    addeq sp, sp, #0x3c
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT16
    ldr r0, [sp, #0xc]
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021d5b80
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r1, #0xd2c]
    str r0, [r1, #0xd30]
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x000014d6
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x00000868
_LIT4: .word 0x00001915
_LIT5: .word 0x00001392
_LIT6: .word 0x000012a6
_LIT7: .word 0x00001415
_LIT8: .word 0x00501415
_LIT9: .word 0x00001a95
_LIT10: .word 0x000012e2
_LIT11: .word 0x00001362
_LIT12: .word 0x00001512
_LIT13: .word data_ov002_022cf180
_LIT14: .word 0x004e1571
_LIT15: .word 0x00001469
_LIT16: .word 0x000011ed
