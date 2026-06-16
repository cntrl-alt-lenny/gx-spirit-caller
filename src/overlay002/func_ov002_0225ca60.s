; func_ov002_0225ca60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd4e0
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern func_ov002_021ab864
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b4054
        .extern func_ov002_021b4120
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bad58
        .extern func_ov002_021d479c
        .extern func_ov002_021d59cc
        .extern func_ov002_021d5b80
        .extern func_ov002_021d6434
        .extern func_ov002_021df62c
        .extern func_ov002_021df6d4
        .extern func_ov002_021df708
        .extern func_ov002_021e276c
        .extern func_ov002_021e2cd4
        .extern func_ov002_021e2d20
        .extern func_ov002_021e30b4
        .extern func_ov002_02244fe4
        .extern func_ov002_0225a578
        .extern func_ov002_0225a874
        .extern func_ov002_0225a978
        .global func_ov002_0225ca60
        .arm
func_ov002_0225ca60:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r3, [r2, #0x20]
    ldmia r2, {r0, r9}
    ldr r1, [r2, #0x1c]
    and r5, r9, #0xff
    and r2, r3, #0xff
    orr r2, r5, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r3, r2, lsr #0x10
    and r5, r0, #0xff
    and r2, r1, #0xff
    orr r2, r5, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    orr r6, r3, r2, lsr #0x10
    bl func_ov002_021b9ecc
    ldr r1, _LIT0
    mov r7, r0
    ldr r0, [r1, #0x4]
    ldr r1, [r1, #0x20]
    bl func_ov002_021b9ecc
    ldr r1, _LIT1
    mov r8, r0
    ldr r0, [r1, #0xd30]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_1874
    b .L_d98
    b .L_e10
    b .L_12e8
    b .L_1408
.L_d98:
    mov r0, #0x0
    mov r1, #0x1
    bl func_ov002_021e2cd4
    mov r0, r4
    mov r1, #0x13
    mov r2, #0x1
    bl func_ov002_021e2d20
    ldr r0, _LIT0
    mov r3, #0x0
    ldr r0, [r0]
    cmp r0, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, _LIT0
    orr r2, r1, #0x1b
    ldr r1, [r0, #0x1c]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021d479c
    ldr r2, _LIT0
    mov r0, #0x0
    ldr r1, _LIT1
    str r0, [r2, #0x24]
    ldr r2, [r1, #0xd30]
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e10:
    ldr r0, _LIT2
    bl func_ov002_0225a578
    ldr r2, _LIT3
    mov r0, #0x0
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021b4054
    cmp r0, #0x0
    bne .L_e50
    mov r0, #0x1
    ldr r2, _LIT3
    mov r3, r0
    mov r1, #0xb
    bl func_ov002_021b4054
    cmp r0, #0x0
    beq .L_e5c
.L_e50:
    ldr r1, _LIT3
    mov r0, r4
    bl func_ov002_021df6d4
.L_e5c:
    ldr r2, _LIT4
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_eec
    rsb r5, r4, #0x1
    ldr r2, _LIT4
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b4120
    mvn r1, #0x0
    cmp r0, r1
    bne .L_ec0
    ldr r0, _LIT0
    ldr r1, _LIT4
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    mov r2, r0, lsl #0x10
    mov r3, r2, lsr #0x10
    mov r0, r5
    mov r2, #0x1
    bl func_ov002_021e276c
.L_ec0:
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    bne .L_eec
    mov r1, #0x0
    str r1, [sp]
    ldr r1, [r0, #0x20]
    ldr r2, _LIT4
    mov r0, r9
    mov r3, #0x1
    bl func_ov002_021d59cc
.L_eec:
    ldr r1, _LIT0
    ldr r2, _LIT5
    ldr r0, [r1]
    ldr r1, [r1, #0x1c]
    and r5, r0, #0x1
    mov r3, #0x14
    mul r2, r5, r2
    ldr r5, _LIT6
    ldr fp, _LIT7
    mul sl, r1, r3
    add r3, r5, r2
    ldr r5, [sl, r3]
    add r3, fp, r2
    mov r2, r5, lsr #0x6
    mov fp, r5, lsr #0x2
    and r2, r2, #0x1
    orr r5, fp, r5, lsr #0x1
    and r5, r5, #0x1
    ldrh sl, [sl, r3]
    mvn r3, r2
    mvn r2, r5
    and r3, sl, r3
    tst r3, r2
    beq .L_10ec
    ldr r2, _LIT8
    cmp r7, r2
    bgt .L_fb4
    bge .L_105c
    ldr r3, _LIT9
    cmp r7, r3
    bgt .L_f90
    bge .L_105c
    sub r2, r3, #0xec
    cmp r7, r2
    bgt .L_f80
    beq .L_1044
    b .L_10ec
.L_f80:
    sub r2, r3, #0x2f
    cmp r7, r2
    beq .L_102c
    b .L_10ec
.L_f90:
    add r2, r3, #0x61
    cmp r7, r2
    bgt .L_fa4
    beq .L_1044
    b .L_10ec
.L_fa4:
    add r2, r3, #0xcd
    cmp r7, r2
    beq .L_1044
    b .L_10ec
.L_fb4:
    ldr r3, _LIT10
    cmp r7, r3
    bgt .L_ffc
    bge .L_102c
    sub r2, r3, #0x7e
    cmp r7, r2
    bgt .L_fec
    sub r2, r3, #0x81
    cmp r7, r2
    blt .L_10ec
    subne r2, r3, #0x7e
    cmpne r7, r2
    beq .L_1044
    b .L_10ec
.L_fec:
    sub r0, r3, #0x3b
    cmp r7, r0
    beq .L_105c
    b .L_10ec
.L_ffc:
    add r2, r3, #0xce
    cmp r7, r2
    bgt .L_101c
    bge .L_1044
    add r0, r3, #0xbb
    cmp r7, r0
    beq .L_105c
    b .L_10ec
.L_101c:
    add r0, r3, #0xe6
    cmp r7, r0
    beq .L_105c
    b .L_10ec
.L_102c:
    ldr r2, _LIT11
    mov r4, #0x0
    mov r3, #0x4
    str r4, [sp]
    bl func_ov002_021d59cc
    b .L_10ec
.L_1044:
    ldr r2, _LIT11
    mov r4, #0x0
    mov r3, #0x2
    str r4, [sp]
    bl func_ov002_021d59cc
    b .L_10ec
.L_105c:
    ldr r2, _LIT9
    mov r0, r4
    bl func_ov002_021b4120
    mvn r1, #0x0
    cmp r0, r1
    bne .L_10ac
    ldr r0, _LIT0
    ldr r2, _LIT9
    ldr r0, [r0, #0x8]
    mov r3, #0x1
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    ldr r0, _LIT0
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021d59cc
.L_10ac:
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    bne .L_10ec
    mov r1, #0x0
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    and r2, r4, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x20]
    mov r0, r9
    mov r2, r2, lsr #0x10
    mov r3, #0x8
    bl func_ov002_021d59cc
.L_10ec:
    ldr r1, _LIT0
    ldr r0, [r1, #0x14]
    cmp r0, #0x0
    bne .L_1228
    ldr r0, [r1]
    ldr r1, [r1, #0x1c]
    bl func_ov002_021bad58
    cmp r0, #0x0
    beq .L_1228
    ldr r2, _LIT12
    cmp r7, r2
    bgt .L_1168
    bge .L_11a8
    ldr r1, _LIT13
    cmp r7, r1
    bgt .L_1140
    bge .L_11a8
    sub r0, r1, #0xbc
    cmp r7, r0
    beq .L_11a8
    b .L_1228
.L_1140:
    add r0, r1, #0x1f8
    cmp r7, r0
    bgt .L_1228
    sub r0, r2, #0x8
    cmp r7, r0
    blt .L_1228
    addne r0, r1, #0x1f8
    cmpne r7, r0
    beq .L_11a8
    b .L_1228
.L_1168:
    add r0, r2, #0x4a
    cmp r7, r0
    bgt .L_1188
    bge .L_11a8
    add r0, r2, #0x44
    cmp r7, r0
    beq .L_11a8
    b .L_1228
.L_1188:
    add r0, r2, #0x184
    cmp r7, r0
    bgt .L_119c
    beq .L_11a8
    b .L_1228
.L_119c:
    ldr r0, _LIT14
    cmp r7, r0
    bne .L_1228
.L_11a8:
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    bne .L_1228
    ldr r5, [r0]
    ldr r4, _LIT15
    ldr r1, [r0, #0x1c]
    mov r2, #0x14
    ldr r0, _LIT5
    and r3, r5, #0x1
    mla r4, r3, r0, r4
    mov r0, r5, lsl #0x1f
    and r0, r0, #-2147483648
    orr r0, r0, #0x8200000
    mov r3, r1, lsl #0x10
    mul r2, r1, r2
    add r1, r4, #0x30
    ldr r2, [r1, r2]
    orr r0, r0, #0x20000000
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    and r4, r3, #0x1f0000
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r3, r1, lsl #0x10
    mov r1, r7, lsl #0x10
    orr r0, r0, r4
    mov r2, r6
    orr r0, r0, r1, lsr #0x10
    mov r1, r3, lsr #0x10
    bl func_ov002_021e30b4
.L_1228:
    ldr r1, _LIT0
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    ldreq r0, [r1, #0x14]
    cmpeq r0, #0x0
    bne .L_12d0
    ldr r0, [r1, #0x4]
    ldr r1, [r1, #0x20]
    bl func_ov002_021bad58
    cmp r0, #0x0
    beq .L_12d0
    ldr r0, _LIT16
    cmp r8, r0
    bne .L_12d0
    ldr r0, _LIT0
    ldr r3, _LIT15
    ldr r4, [r0, #0x4]
    ldr r1, _LIT5
    and r2, r4, #0x1
    ldr r0, [r0, #0x20]
    mla r3, r2, r1, r3
    mov r1, #0x14
    mul r1, r0, r1
    add r2, r3, #0x30
    ldr r2, [r2, r1]
    mov r3, r4, lsl #0x1f
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    and r4, r3, #-2147483648
    mov r3, r0, lsl #0x10
    mov r2, r2, lsl #0x12
    mov r0, r1, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    mov r1, r0, lsl #0x10
    orr r4, r4, #0x200000
    and r2, r3, #0x1f0000
    mov r0, r8, lsl #0x10
    orr r3, r4, r2
    mov r2, r6
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_12d0:
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0xd30]
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12e8:
    bl func_ov002_0225a874
    cmp r0, #0x0
    beq .L_130c
    ldr r1, _LIT1
    mov r0, #0xb
    str r0, [r1, #0xd2c]
    mov r0, #0x0
    str r0, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_130c:
    ldr r1, _LIT0
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    bne .L_13f0
    ldr r0, [r1, #0x4]
    ldr r1, [r1, #0x20]
    mov r3, #0x14
    ldr r2, _LIT5
    ldr r4, _LIT7
    and r5, r0, #0x1
    mul r3, r1, r3
    mla r2, r5, r2, r4
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    bne .L_13c0
    mov r2, #0x0
    mov r3, r2
    str r2, [sp]
    bl func_ov002_021d6434
    ldr r2, _LIT0
    ldr r1, _LIT5
    ldr r0, [r2, #0x4]
    ldr r3, _LIT15
    and r4, r0, #0x1
    mla r3, r4, r1, r3
    ldr r2, [r2, #0x20]
    mov r1, #0x14
    mla r1, r2, r1, r3
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    bl func_ov002_021df708
    ldr r1, _LIT0
    ldr r0, _LIT5
    ldr r3, [r1, #0x4]
    ldr r2, _LIT15
    and r4, r3, #0x1
    mla r3, r4, r0, r2
    ldr r2, [r1, #0x20]
    mov r0, #0x14
    mla r0, r2, r0, r3
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    str r0, [r1, #0x24]
.L_13c0:
    ldr r0, _LIT17
    cmp r8, r0
    bne .L_13f0
    mov r0, #0x0
    ldr r1, _LIT0
    str r0, [sp]
    mov r2, r8, lsl #0x10
    ldr r0, [r1, #0x4]
    ldr r1, [r1, #0x20]
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d59cc
.L_13f0:
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0xd30]
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1408:
    mov r0, #0x0
    bl func_ov002_021ab864
    ldr r0, _LIT0
    ldr r2, _LIT5
    and r3, r4, #0x1
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul sl, r3, r2
    ldr r3, _LIT6
    ldr r2, _LIT7
    mul r5, r1, r0
    add r0, r3, sl
    ldr r3, [r5, r0]
    add r2, r2, sl
    mov r0, r3, lsr #0x6
    mov fp, r3, lsr #0x2
    and r0, r0, #0x1
    orr r3, fp, r3, lsr #0x1
    and r3, r3, #0x1
    ldrh r5, [r5, r2]
    mvn r2, r0
    mvn r0, r3
    and r2, r5, r2
    tst r2, r0
    beq .L_1520
    mov r0, r4
    bl func_ov002_021b9ecc
    mov r1, #0x1
    mov fp, r0
    bl func_ov002_0225a978
    mov r5, r0
    mvn r0, #0x0
    cmp r5, r0
    beq .L_1520
    cmp r5, #0x0
    beq .L_1508
    ldr r0, _LIT0
    ldr r2, _LIT15
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r0, r1, r0
    add r2, r2, sl
    add r2, r2, #0x30
    ldr r3, [r2, r0]
    mov r0, r4
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    mov r0, r5, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, fp, lsl #0x10
    ldr r0, _LIT0
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d59cc
    b .L_1520
.L_1508:
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1, #0x1c]
    mov r2, fp
    mov r3, #0x1
    bl func_ov002_021d5b80
.L_1520:
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    bne .L_16ac
    ldr r2, _LIT5
    and r3, r9, #0x1
    ldr r1, [r0, #0x20]
    mov r0, #0x14
    mul sl, r3, r2
    ldr r3, _LIT6
    ldr r2, _LIT7
    mul r5, r1, r0
    add r0, r3, sl
    ldr r3, [r5, r0]
    add r2, r2, sl
    mov r0, r3, lsr #0x6
    mov fp, r3, lsr #0x2
    and r0, r0, #0x1
    orr r3, fp, r3, lsr #0x1
    and r3, r3, #0x1
    ldrh r5, [r5, r2]
    mvn r2, r0
    mvn r0, r3
    and r2, r5, r2
    tst r2, r0
    beq .L_16ac
    mov r0, r9
    bl func_ov002_021b9ecc
    mov r1, #0x0
    mov r5, r0
    bl func_ov002_0225a978
    mov fp, r0
    mvn r0, #0x0
    cmp fp, r0
    beq .L_16ac
    cmp fp, #0x0
    beq .L_1694
    ldr r0, _LIT18
    cmp r5, r0
    bne .L_1624
    ldr r0, _LIT0
    ldr r2, _LIT15
    ldr r1, [r0, #0x20]
    mov r0, #0x14
    mul r0, r1, r0
    add r2, r2, sl
    add r2, r2, #0x30
    ldr r3, [r2, r0]
    mov r0, r9
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    mov r1, #0x0
    mov r2, r5, lsl #0x10
    ldr r0, _LIT0
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d59cc
    b .L_16ac
.L_1624:
    ldr r0, _LIT0
    ldr r2, _LIT15
    ldr r1, [r0, #0x20]
    mov r0, #0x14
    mul r0, r1, r0
    add r2, r2, sl
    add r2, r2, #0x30
    ldr r3, [r2, r0]
    mov r0, r9
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    mov r0, fp, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, r5, lsl #0x10
    ldr r0, _LIT0
    str r1, [sp]
    ldr r1, [r0, #0x20]
    mov r0, r9
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d59cc
    b .L_16ac
.L_1694:
    ldr r1, _LIT0
    mov r0, r9
    ldr r1, [r1, #0x20]
    mov r2, r5
    mov r3, #0x1
    bl func_ov002_021d5b80
.L_16ac:
    ldr r1, _LIT0
    ldr r3, [r1, #0x14]
    cmp r3, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    bne .L_1850
    ldmia r1, {r0, r2}
    cmp r2, r0
    beq .L_1850
    cmp r3, #0x0
    bne .L_1778
    ldr r1, [r1, #0x1c]
    bl func_ov002_021bad58
    cmp r0, #0x0
    beq .L_1778
    ldr r0, _LIT19
    cmp r7, r0
    ldrne r0, _LIT20
    cmpne r7, r0
    bne .L_1778
    ldr r1, _LIT0
    ldr r4, _LIT15
    ldr r0, [r1]
    ldr r2, _LIT5
    and r3, r0, #0x1
    ldr r1, [r1, #0x1c]
    mla r4, r3, r2, r4
    mov r2, #0x14
    mul r2, r1, r2
    add r3, r4, #0x30
    ldr r3, [r3, r2]
    mov r2, r0, lsl #0x1f
    mov r0, r3, lsl #0x2
    and r4, r2, #-2147483648
    mov r2, r0, lsr #0x18
    orr r0, r4, #0x8200000
    mov r4, r1, lsl #0x10
    mov r3, r3, lsl #0x12
    mov r1, r2, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    mov r3, r1, lsl #0x10
    orr r0, r0, #0x20000000
    and r2, r4, #0x1f0000
    mov r1, r7, lsl #0x10
    orr r0, r0, r2
    mov r2, r6
    orr r0, r0, r1, lsr #0x10
    mov r1, r3, lsr #0x10
    bl func_ov002_021e30b4
.L_1778:
    ldr r1, _LIT21
    cmp r8, r1
    bgt .L_17ac
    bge .L_17cc
    sub r0, r1, #0x1f0
    cmp r8, r0
    bgt .L_179c
    beq .L_17cc
    b .L_1850
.L_179c:
    ldr r0, _LIT22
    cmp r8, r0
    beq .L_17cc
    b .L_1850
.L_17ac:
    add r0, r1, #0x14
    cmp r8, r0
    bgt .L_17c0
    beq .L_17dc
    b .L_1850
.L_17c0:
    ldr r0, _LIT23
    cmp r8, r0
    bne .L_1850
.L_17cc:
    ldr r0, _LIT0
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    beq .L_1850
.L_17dc:
    ldr r0, _LIT0
    ldr r3, _LIT15
    ldr r4, [r0, #0x4]
    ldr r1, _LIT5
    and r2, r4, #0x1
    ldr r0, [r0, #0x20]
    mla r3, r2, r1, r3
    mov r1, #0x14
    mul r1, r0, r1
    add r2, r3, #0x30
    ldr r2, [r2, r1]
    mov r3, r4, lsl #0x1f
    mov r1, r2, lsl #0x2
    and r3, r3, #-2147483648
    mov r1, r1, lsr #0x18
    orr r4, r3, #0x8200000
    mov r3, r0, lsl #0x10
    mov r2, r2, lsl #0x12
    mov r0, r1, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    mov r1, r0, lsl #0x10
    orr r4, r4, #0x20000000
    and r2, r3, #0x1f0000
    mov r0, r8, lsl #0x10
    orr r3, r4, r2
    mov r2, r6
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_1850:
    mov r1, r6
    mov r0, #0x14
    bl func_ov002_02244fe4
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0xd30]
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1874:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word data_ov002_022d016c
_LIT2: .word data_ov002_022cd4e0
_LIT3: .word 0x000019b8
_LIT4: .word 0x000015ff
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022cf1ac
_LIT7: .word data_ov002_022cf1a4
_LIT8: .word 0x00001644
_LIT9: .word 0x00001505
_LIT10: .word 0x00001993
_LIT11: .word 0x000014d6
_LIT12: .word 0x000017df
_LIT13: .word 0x000015e0
_LIT14: .word 0x000019c2
_LIT15: .word data_ov002_022cf16c
_LIT16: .word 0x00001829
_LIT17: .word 0x0000129c
_LIT18: .word 0x00001621
_LIT19: .word 0x00001752
_LIT20: .word 0x000018f3
_LIT21: .word 0x00001476
_LIT22: .word 0x00001370
_LIT23: .word 0x000019bd
