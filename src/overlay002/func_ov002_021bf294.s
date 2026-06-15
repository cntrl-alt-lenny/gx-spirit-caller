; func_ov002_021bf294 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1a8
        .extern data_ov002_022cf1ac
        .extern func_0202b878
        .extern func_0202b890
        .extern func_0202e310
        .extern func_0202e42c
        .extern func_0202e79c
        .extern func_0202f1d8
        .extern func_0202f218
        .extern func_0202f59c
        .extern func_ov002_021b30ac
        .extern func_ov002_021b314c
        .extern func_ov002_021b31b8
        .extern func_ov002_021b3240
        .extern func_ov002_021b34f4
        .extern func_ov002_021b359c
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b3fd8
        .extern func_ov002_021b4120
        .extern func_ov002_021b90a8
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb90c
        .extern func_ov002_021bbbc0
        .extern func_ov002_021bbc58
        .extern func_ov002_021bbc68
        .extern func_ov002_021bbf50
        .extern func_ov002_021bc16c
        .extern func_ov002_021bd198
        .extern func_ov002_021bd6c8
        .extern func_ov002_021c1ad0
        .extern func_ov002_021c1d4c
        .extern func_ov002_021c8470
        .extern func_ov002_021c84e0
        .extern func_ov002_021c8940
        .global func_ov002_021bf294
        .arm
func_ov002_021bf294:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    mov sl, r2
    mov r9, r3
    str r0, [sp]
    str r1, [sp, #0x4]
    bl func_ov002_021b9ecc
    mov fp, r0
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b9ecc
    mov r4, r0
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    bl func_ov002_021c1ad0
    mov r5, r0
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    bl func_ov002_021c1d4c
    cmp r4, #0x0
    mov r6, r0
    addeq sp, sp, #0x28
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT0
    ldr r0, [sp]
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_1c44
    ldr r0, [sp]
    ldr r2, _LIT0
    rsb r0, r0, #0x1
    mov r1, #0xb
    bl func_ov002_021b4120
    cmp r0, #0x0
    addeq sp, sp, #0x28
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT0
    mov r0, sl
    mov r1, r9
    mov r3, #0x0
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1c44:
    ldr r0, [sp]
    ldr r2, _LIT1
    and r3, r0, #0x1
    mul r0, r3, r2
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x4]
    mov r1, #0x14
    mul r1, r0, r1
    ldr r3, _LIT2
    ldr r0, [sp, #0xc]
    str r1, [sp, #0x10]
    add r1, r3, r0
    ldr r0, [sp, #0x10]
    ldr r2, _LIT3
    ldr r3, [r0, r1]
    ldr r0, [sp, #0xc]
    mov r1, r3, lsr #0x6
    add r0, r2, r0
    str r0, [sp, #0x20]
    mov r0, r3, lsr #0x2
    orr r0, r0, r3, lsr #0x1
    and r3, r1, #0x1
    and r2, r0, #0x1
    ldr r1, [sp, #0x20]
    ldr r0, [sp, #0x10]
    ldrh r7, [r1, r0]
    mvn r1, r3
    mvn r0, r2
    and r1, r7, r1
    tst r1, r0
    beq .L_1dfc
    ldr r0, _LIT4
    cmp fp, r0
    bgt .L_1cf4
    bge .L_1d30
    ldr r0, _LIT5
    cmp fp, r0
    bgt .L_1ce4
    beq .L_1d24
    b .L_1dfc
.L_1ce4:
    add r0, r0, #0x7
    cmp fp, r0
    beq .L_1d30
    b .L_1dfc
.L_1cf4:
    ldr r0, _LIT6
    cmp fp, r0
    bgt .L_1d14
    bge .L_1d78
    sub r0, r0, #0xf6
    cmp fp, r0
    beq .L_1d30
    b .L_1dfc
.L_1d14:
    add r0, r0, #0x2b
    cmp fp, r0
    beq .L_1d9c
    b .L_1dfc
.L_1d24:
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1d30:
    ldr r2, _LIT7
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    bl func_ov002_021b4120
    cmp r0, #0x0
    addeq sp, sp, #0x28
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, [sp]
    ldr r3, [sp, #0x4]
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b34f4
    cmp r0, #0x0
    beq .L_1dfc
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1d78:
    ldr r2, _LIT7
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    bl func_ov002_021b4120
    cmp r0, #0x0
    bne .L_1dfc
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1d9c:
    ldr r1, _LIT8
    ldr r0, [sp, #0xc]
    add r1, r1, r0
    ldr r0, [sp, #0x10]
    ldr r0, [r0, r1]
    cmp r0, #0x0
    beq .L_1dfc
    ldr r2, _LIT7
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    bl func_ov002_021b4120
    cmp r0, #0x0
    addeq sp, sp, #0x28
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, [sp]
    ldr r3, [sp, #0x4]
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b34f4
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1dfc:
    ldr r2, _LIT9
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    bl func_ov002_021b314c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT10
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    bl func_ov002_021b314c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT11
    ldr r0, [sp]
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_1e6c
    ldr r2, _LIT11
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3ecc
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e6c:
    and r0, r5, #0x2
    str r0, [sp, #0x18]
    cmp r0, #0x0
    bgt .L_1ea8
    ldr r1, _LIT12
    mov r0, sl
    bl func_ov002_021b359c
    cmp r0, #0x0
    ble .L_1ea8
    ldr r2, _LIT12
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b30ac
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1ea8:
    and r0, r6, #0x2
    str r0, [sp, #0x1c]
    cmp r0, #0x0
    bgt .L_1f50
    ldr r2, _LIT13
    ldr r0, _LIT1
    and r1, sl, #0x1
    mla r0, r1, r0, r2
    mov r6, #0x0
    ldr r8, _LIT14
    mov r5, r6
    add r7, r0, #0x30
.L_1ed8:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_1f10
    mov r0, sl
    mov r1, r5
    mov r2, r8
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_1f10
    cmp r5, r9
    moveq r6, #0x0
    beq .L_1f20
    add r6, r6, #0x1
.L_1f10:
    add r7, r7, #0x14
    add r5, r5, #0x1
    cmp r5, #0x4
    ble .L_1ed8
.L_1f20:
    cmp r6, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT15
    ldr r0, [sp]
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1f50:
    ldr r0, _LIT1
    and r1, sl, #0x1
    mul r0, r1, r0
    ldr r1, _LIT13
    ldr r8, _LIT16
    add r7, r1, r0
    str r0, [sp, #0x14]
    mov r6, #0x0
    add r5, r7, #0x30
.L_1f74:
    cmp r6, r9
    beq .L_1fb0
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_1fb0
    mov r0, sl
    mov r1, r6
    mov r2, r8
    mov r3, sl
    bl func_ov002_021b31b8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1fb0:
    add r5, r5, #0x14
    add r6, r6, #0x1
    cmp r6, #0x4
    ble .L_1f74
    mov r0, #0x14
    mul r0, r9, r0
    str r0, [sp, #0x8]
    ldr r1, _LIT2
    ldr r0, [sp, #0x14]
    ldr r2, _LIT3
    add r1, r1, r0
    ldr r0, [sp, #0x8]
    ldr r0, [r0, r1]
    ldr r1, [sp, #0x14]
    add r2, r2, r1
    ldr r1, [sp, #0x8]
    str r2, [sp, #0x24]
    ldrh r2, [r2, r1]
    mov r1, r0, lsr #0x6
    and r1, r1, #0x1
    mvn r1, r1
    and r2, r2, r1
    mov r1, r0, lsr #0x2
    orr r0, r1, r0, lsr #0x1
    and r0, r0, #0x1
    mvn r0, r0
    tst r2, r0
    beq .L_2184
    ldr r1, _LIT17
    cmp r4, r1
    bgt .L_2078
    bge .L_20e8
    sub r0, r1, #0x59
    cmp r4, r0
    bgt .L_2044
    beq .L_20bc
    b .L_2184
.L_2044:
    sub r0, r1, #0x47
    cmp r4, r0
    bgt .L_2184
    sub r0, r1, #0x4a
    cmp r4, r0
    blt .L_2184
    beq .L_209c
    sub r0, r1, #0x48
    cmp r4, r0
    subne r0, r1, #0x47
    cmpne r4, r0
    beq .L_20bc
    b .L_2184
.L_2078:
    add r0, r1, #0xc6
    cmp r4, r0
    bgt .L_208c
    beq .L_20bc
    b .L_2184
.L_208c:
    ldr r0, _LIT18
    cmp r4, r0
    beq .L_215c
    b .L_2184
.L_209c:
    mov r0, sl
    mov r1, #0xd
    bl func_ov002_021bbc58
    cmp r0, #0x0
    beq .L_2184
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_20bc:
    mov r0, r4
    bl func_0202b878
    mov r1, r0
    mov r0, sl
    mov r2, r9
    bl func_ov002_021bbbc0
    cmp r0, #0x0
    beq .L_2184
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_20e8:
    ldr r1, _LIT13
    ldr r0, [sp, #0x14]
    mov r8, #0x0
    add r6, r1, r0
    add r5, r6, #0x30
.L_20fc:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r6, #0x38]
    cmpne r0, #0x0
    beq .L_2144
    mov r0, sl
    mov r1, r8
    bl func_ov002_021b90a8
    cmp r0, #0x0
    beq .L_2144
    mov r0, sl
    mov r1, r8
    bl func_ov002_021c84e0
    cmp r0, #0x3
    addle sp, sp, #0x28
    movle r0, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2144:
    add r5, r5, #0x14
    add r6, r6, #0x14
    add r8, r8, #0x1
    cmp r8, #0x4
    ble .L_20fc
    b .L_2184
.L_215c:
    mov r0, r4
    bl func_0202b890
    mov r1, r0
    mov r0, sl
    mov r2, r9
    bl func_ov002_021bbc68
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2184:
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x8]
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_22e4
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c8940
    cmp r0, #0xa
    bne .L_21cc
    ldr r1, _LIT19
    mov r0, sl
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_21cc:
    mov r0, r4
    bl func_0202e79c
    cmp r0, #0x0
    ldrne r1, _LIT20
    cmpne r4, r1
    beq .L_2200
    mov r0, sl
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2200:
    mov r0, r4
    bl func_0202e42c
    cmp r0, #0x0
    ldrne r1, _LIT21
    cmpne r4, r1
    beq .L_2234
    mov r0, sl
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2234:
    mov r0, r4
    bl func_0202f1d8
    cmp r0, #0x0
    ldrne r1, _LIT22
    cmpne r4, r1
    beq .L_2268
    mov r0, sl
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2268:
    ldr r3, [sp]
    mov r0, sl
    mov r1, r9
    mov r2, #0x1980
    rsb r3, r3, #0x1
    bl func_ov002_021b3240
    cmp r0, #0x0
    beq .L_22b4
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    bgt .L_22b4
    ldr r1, [sp, #0x4]
    ldr r0, [sp]
    bl func_ov002_021c8470
    ldr r1, _LIT23
    cmp r0, r1
    addge sp, sp, #0x28
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_22b4:
    mov r0, r4
    bl func_0202f59c
    cmp r0, #0x0
    beq .L_22e4
    ldr r1, _LIT24
    mov r0, sl
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_22e4:
    ldr r0, [sp, #0x50]
    cmp r0, #0x0
    beq .L_2740
    ldr r1, [sp, #0x20]
    ldr r0, [sp, #0x10]
    ldr r2, _LIT2
    ldrh r1, [r1, r0]
    ldr r0, [sp, #0xc]
    add r2, r2, r0
    ldr r0, [sp, #0x10]
    ldr r2, [r0, r2]
    mov r0, r2, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r1, r1, r0
    mov r0, r2, lsr #0x2
    orr r0, r0, r2, lsr #0x1
    and r0, r0, #0x1
    mvn r0, r0
    tst r1, r0
    beq .L_23d4
    ldr r1, _LIT25
    cmp fp, r1
    bgt .L_2378
    bge .L_2384
    sub r0, r1, #0x26
    cmp fp, r0
    bgt .L_23d4
    sub r0, r1, #0x28
    cmp fp, r0
    blt .L_23d4
    subne r0, r1, #0x27
    cmpne fp, r0
    subne r0, r1, #0x26
    cmpne fp, r0
    beq .L_2384
    b .L_23d4
.L_2378:
    ldr r0, _LIT26
    cmp fp, r0
    bne .L_23d4
.L_2384:
    mov r0, sl
    bl func_ov002_021bd198
    cmp r0, #0x0
    beq .L_23d4
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x8]
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_23c8
    ldr r0, [sp, #0x8]
    add r0, r7, r0
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e310
    cmp r0, #0x0
    bne .L_23d4
.L_23c8:
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_23d4:
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x8]
    ldr r3, _LIT2
    ldrh r2, [r1, r0]
    ldr r0, [sp, #0x14]
    add r1, r3, r0
    ldr r0, [sp, #0x8]
    ldr r3, [r0, r1]
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    orr r0, r0, r3, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    and r0, r0, #0x1
    and r1, r2, r1
    mvn r0, r0
    tst r1, r0
    beq .L_24c4
    ldr r0, _LIT27
    cmp r4, r0
    bgt .L_243c
    bge .L_247c
    sub r0, r0, #0x34
    cmp r4, r0
    beq .L_2460
    b .L_24c4
.L_243c:
    ldr r0, _LIT28
    cmp r4, r0
    bgt .L_2450
    beq .L_2498
    b .L_24c4
.L_2450:
    add r0, r0, #0x268
    cmp r4, r0
    beq .L_24a4
    b .L_24c4
.L_2460:
    mov r0, sl
    bl func_ov002_021bbf50
    cmp r0, #0x1
    ble .L_24c4
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_247c:
    ldr r0, _LIT29
    bl func_ov002_021bd6c8
    cmp r0, #0x0
    beq .L_24c4
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2498:
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_24a4:
    mov r0, sl
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov002_021bc16c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_24c4:
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x8]
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_25d4
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c8940
    cmp r0, #0xf
    beq .L_2524
    cmp r0, #0x12
    beq .L_2500
    cmp r0, #0x13
    beq .L_2548
    b .L_2570
.L_2500:
    ldr r1, _LIT30
    mov r0, sl
    mov r2, r9
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_2570
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2524:
    ldr r1, _LIT31
    mov r0, sl
    mov r2, r9
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_2570
    add sp, sp, #0x28
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2548:
    ldr r1, _LIT32
    cmp r4, r1
    beq .L_2570
    mov r0, sl
    mov r2, r9
    bl func_ov002_021bae7c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2570:
    ldr r0, _LIT33
    cmp r4, r0
    beq .L_25ac
    mov r0, r4
    bl func_0202f218
    cmp r0, #0x0
    beq .L_25ac
    ldr r1, _LIT33
    mov r0, sl
    mov r2, r9
    bl func_ov002_021bae7c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_25ac:
    ldr r1, _LIT34
    cmp r4, r1
    beq .L_25d4
    mov r0, sl
    mov r2, r9
    bl func_ov002_021bae7c
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_25d4:
    ldr r0, [sp, #0x18]
    cmp r0, #0x0
    bgt .L_263c
    ldr r1, _LIT35
    mov r0, sl
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_263c
    ldr r1, _LIT36
    mov r0, sl
    bl func_ov002_021bb90c
    cmp r0, #0x0
    beq .L_263c
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x8]
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    addeq sp, sp, #0x28
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT36
    cmp r4, r0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_263c:
    ldr r1, _LIT37
    mov r0, sl
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_268c
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x8]
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    bne .L_268c
    ldr r1, _LIT38
    ldr r0, [sp, #0x14]
    add r1, r1, r0
    ldr r0, [sp, #0x8]
    ldrh r0, [r0, r1]
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_268c:
    ldr r5, _LIT39
    mov r4, #0x0
.L_2694:
    cmp r4, r9
    beq .L_26f0
    mov r0, sl
    mov r1, r4
    bl func_ov002_021b9ecc
    cmp r0, r5
    bne .L_26f0
    ldr r3, [r7, #0x40]
    ldrh r2, [r7, #0x38]
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    and r1, r1, #0x1
    orr r0, r0, r3, lsr #0x1
    mvn r1, r1
    and r0, r0, #0x1
    and r1, r2, r1
    mvn r0, r0
    tst r1, r0
    ldrneh r0, [r7, #0x36]
    cmpne r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_26f0:
    add r4, r4, #0x1
    cmp r4, #0x5
    add r7, r7, #0x14
    blt .L_2694
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    bgt .L_2740
    ldr r2, _LIT40
    ldr r0, [sp]
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_2740
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x8]
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    addeq sp, sp, #0x28
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2740:
    mov r0, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000015ff
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1ac
_LIT3: .word data_ov002_022cf1a4
_LIT4: .word 0x00001644
_LIT5: .word 0x000014fe
_LIT6: .word 0x00001a4e
_LIT7: .word 0x00001505
_LIT8: .word data_ov002_022cf1a8
_LIT9: .word 0x00001561
_LIT10: .word 0x00001852
_LIT11: .word 0x00001669
_LIT12: .word 0x00001318
_LIT13: .word data_ov002_022cf16c
_LIT14: .word 0x000017fc
_LIT15: .word 0x000017fd
_LIT16: .word 0x000015ea
_LIT17: .word 0x0000179d
_LIT18: .word 0x00001b7e
_LIT19: .word 0x00001703
_LIT20: .word 0x0000160f
_LIT21: .word 0x0000168c
_LIT22: .word 0x000018a0
_LIT23: .word 0x0000076c
_LIT24: .word 0x00001aeb
_LIT25: .word 0x000012a5
_LIT26: .word 0x0000154a
_LIT27: .word 0x000013cd
_LIT28: .word 0x0000164e
_LIT29: .word 0x000010f4
_LIT30: .word 0x000016ed
_LIT31: .word 0x000014c6
_LIT32: .word 0x00001a2f
_LIT33: .word 0x00001a1e
_LIT34: .word 0x00001a56
_LIT35: .word 0x00001777
_LIT36: .word 0x00001770
_LIT37: .word 0x000018b1
_LIT38: .word data_ov002_022cf1a2
_LIT39: .word 0x000019a4
_LIT40: .word 0x000014d4
