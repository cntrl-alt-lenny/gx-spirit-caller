; func_ov002_02279b84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd73c
        .extern data_ov002_022cd968
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d016c
        .extern func_0202df78
        .extern func_ov002_021b1458
        .extern func_ov002_021b3e94
        .extern func_ov002_021baca8
        .extern func_ov002_021bad58
        .extern func_ov002_021c1d28
        .extern func_ov002_021c84e0
        .extern func_ov002_021c8940
        .extern func_ov002_021d59cc
        .extern func_ov002_021d5b80
        .extern func_ov002_021d90c0
        .extern func_ov002_021d90fc
        .extern func_ov002_021de480
        .extern func_ov002_021df62c
        .extern func_ov002_021df6d4
        .extern func_ov002_021df938
        .extern func_ov002_021e2bd4
        .extern func_ov002_021e2c5c
        .extern func_ov002_021e2d94
        .extern func_ov002_021e30b4
        .extern func_ov002_02244fe4
        .extern func_ov002_02253b6c
        .extern func_ov002_02275ebc
        .extern func_ov002_02276bb8
        .extern func_ov002_02277e4c
        .extern func_ov002_02278780
        .extern func_ov002_022796ec
        .global func_ov002_02279b84
        .arm
func_ov002_02279b84:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x20
    ldr r0, _LIT0
    ldrh r1, [r0, #0x16]
    mov r0, r1, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_1d7c
    bl func_ov002_02275ebc
    cmp r0, #0x0
    beq .L_1d70
    ldr r0, _LIT0
    ldrh r1, [r0, #0x16]
    bic r1, r1, #0x1
    strh r1, [r0, #0x16]
.L_1d70:
    add sp, sp, #0x20
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1d7c:
    mov r0, r1, lsl #0x19
    movs r0, r0, lsr #0x1f
    beq .L_2a3c
    mov r0, r1, lsl #0x18
    movs r0, r0, lsr #0x1f
    beq .L_1dd4
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0]
    ldr r0, [r1, #0x4]
    mov r1, r2, lsl #0x1f
    eor r0, r0, #0x1
    cmp r0, r1, lsr #0x1f
    bne .L_1dd4
    ldr r0, _LIT2
    ldr r0, [r0, #0x300]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_2a20
    add sp, sp, #0x20
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1dd4:
    ldr r0, _LIT0
    ldrh r0, [r0, #0x16]
    mov r0, r0, lsl #0x15
    mov r0, r0, lsr #0x1d
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_1e60
    b .L_1e60
    b .L_1e04
    b .L_1e1c
    b .L_1e34
    b .L_1e4c
.L_1e04:
    bl func_ov002_02276bb8
    cmp r0, #0x0
    bne .L_1e60
    add sp, sp, #0x20
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e1c:
    bl func_ov002_02277e4c
    cmp r0, #0x0
    bne .L_1e60
    add sp, sp, #0x20
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e34:
    bl func_ov002_02278780
    cmp r0, #0x0
    bne .L_1e60
    add sp, sp, #0x20
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e4c:
    bl func_ov002_022796ec
    cmp r0, #0x0
    addeq sp, sp, #0x20
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e60:
    ldr r0, _LIT0
    ldr r2, _LIT3
    ldr r3, [r0]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mov r4, r3, lsl #0x1b
    mul r7, r1, r2
    ldr r2, _LIT4
    mov r9, r4, lsr #0x1c
    mov r0, #0x14
    mul r8, r9, r0
    add r5, r2, r7
    add r2, r5, r8
    ldr r2, [r2, #0x30]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    str r2, [sp, #0x18]
    beq .L_29dc
    ldr r4, [sp, #0x1c]
    ldr r6, _LIT0
    bic r4, r4, #0x200
    add r2, r5, #0x30
    orr r5, r4, r1, lsl #0x9
    mov r1, r3, lsl #0x1a
    ldrh sl, [r6, #0x4]
    bic fp, r5, #0x3c00
    mov r5, r9, lsl #0x1c
    mov r4, r1, lsr #0x1f
    ldr r2, [r2, r8]
    mov r3, r3, lsl #0x18
    mov r1, r2, lsl #0x2
    ldr r6, _LIT5
    orr r9, fp, r5, lsr #0x12
    add r5, r6, r7
    and r6, sl, #0x10
    bic r7, r9, #0x8000
    mov r4, r4, lsl #0x1f
    orr r4, r7, r4, lsr #0x10
    mov r3, r3, lsr #0x1e
    mov r7, r3, lsl #0x1f
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    bic r4, r4, #0x4000
    add r2, r2, r3, lsr #0x1f
    ldr r1, _LIT6
    orr r3, r4, r7, lsr #0x11
    sub r0, r0, #0x214
    and r3, r3, r0
    and r0, r2, r1
    orr r0, r3, r0
    str r0, [sp, #0x1c]
    cmp r6, #0x0
    movgt r3, #0x1
    ldr r1, [sp, #0x1c]
    ldrh r0, [r8, r5]
    movle r3, #0x0
    bic r2, r1, #0x10000
    mov r1, r3, lsl #0x1f
    orr r1, r2, r1, lsr #0xf
    str r1, [sp, #0x1c]
    str r0, [sp, #0x14]
    and r0, sl, #0x1
    cmp r0, #0x0
    ldr r1, _LIT0
    movgt r4, #0x1
    ldr r3, [sp, #0x1c]
    mov r0, r1
    ldrb r2, [r0, #0x9]
    ldrh r0, [r1, #0x16]
    movle r4, #0x0
    bic r3, r3, #0x20000
    mov r1, r4, lsl #0x1f
    orr r1, r3, r1, lsr #0xe
    mov r0, r0, lsl #0x15
    bic r3, r1, #0xc0000
    mov r1, r2, lsl #0x1e
    mov r0, r0, lsr #0x1d
    orr r1, r3, r1, lsr #0xc
    str r1, [sp, #0x1c]
    cmp r0, #0x1
    beq .L_1fb8
    cmp r0, #0x2
    beq .L_1fdc
    b .L_1fe8
.L_1fb8:
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1a
    movs r0, r0, lsr #0x1f
    movne r0, #0x6
    strne r0, [sp, #0x4]
    moveq r0, #0x9
    streq r0, [sp, #0x4]
    b .L_1ff0
.L_1fdc:
    mov r0, #0x7
    str r0, [sp, #0x4]
    b .L_1ff0
.L_1fe8:
    mov r0, #0x8
    str r0, [sp, #0x4]
.L_1ff0:
    tst sl, #0x20
    beq .L_2104
    ldr r0, _LIT0
    ldr r1, _LIT3
    ldr r3, [r0]
    ldr r0, [sp, #0x4]
    ldr r5, _LIT4
    mov r2, r0, lsl #0x19
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r0, r0, #0x1
    mla r4, r0, r1, r5
    mov r0, r3, lsl #0x1b
    mov r3, r0, lsr #0x1c
    mov r0, #0x14
    mla r0, r3, r0, r4
    ldr r3, [r0, #0x30]
    and r0, r2, #0x7e000000
    mov r2, r3, lsl #0x12
    mov r6, r2, lsr #0x1f
    and r2, r6, #0x1
    mla r3, r2, r1, r5
    mov r1, r6, lsl #0x1f
    and r1, r1, #-2147483648
    orr r0, r1, r0
    ldr r4, [sp, #0x1c]
    orr sl, r0, #0x200000
    mov r0, r4, lsl #0x17
    ldr fp, _LIT7
    add r8, r3, #0x94
    add r9, r3, #0x64
    mov r7, #0x5
    mov r5, r0, lsr #0x17
.L_2074:
    ldr r2, [r8]
    ldr r0, _LIT8
    mov r1, r2, lsl #0x13
    cmp r0, r1, lsr #0x13
    mov r1, r1, lsr #0x13
    bne .L_20f0
    ldrh r0, [r9, #0x38]
    cmp r0, #0x0
    beq .L_20f0
    ldr r0, [fp, #0x5cc]
    cmp r0, #0x0
    beq .L_20b8
    mov r0, r6
    mov r1, r7
    mov r2, r5
    bl func_ov002_021d90c0
    b .L_20f0
.L_20b8:
    mov r0, r1, lsl #0x10
    mov r1, r7, lsl #0x10
    and r1, r1, #0x1f0000
    orr r1, r1, sl
    orr r0, r1, r0, lsr #0x10
    mov r1, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r1, r2, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r4
    bl func_ov002_021e30b4
.L_20f0:
    add r7, r7, #0x1
    cmp r7, #0xa
    add r8, r8, #0x14
    add r9, r9, #0x14
    blt .L_2074
.L_2104:
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    beq .L_2864
    ldr r0, [sp, #0x4]
    cmp r0, #0x8
    bne .L_22a4
    ldr r0, _LIT0
    ldr r1, [r0]
    ldr r0, _LIT9
    mov r2, r1, lsl #0x9
    cmp r0, r2, lsr #0x11
    bne .L_2150
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1b
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1c
    mov r2, #0x5
    mov r3, #0x1
    bl func_ov002_021e2d94
.L_2150:
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r1, r0, lsl #0x1b
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021c8940
    cmp r0, #0x2
    bne .L_2278
    ldr r0, [sp, #0x4]
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0x10]
.L_218c:
    ldr r0, _LIT10
    ldr r2, _LIT4
    ldr r3, [r0, #0xcec]
    ldr r0, [sp, #0x10]
    ldr r1, _LIT3
    eor r6, r3, r0
    and r0, r6, #0x1
    mla r8, r0, r1, r2
    mov r0, r6, lsl #0x1f
    and r1, r0, #-2147483648
    ldr r0, [sp, #0x8]
    ldr r4, [sp, #0x1c]
    orr r0, r1, r0
    ldr r5, _LIT9
    add r9, r8, #0x30
    orr sl, r0, #0x200000
    mov r7, #0x0
    mov fp, #0x5
.L_21d4:
    mov r0, r6
    mov r1, r7
    mov r2, r5
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_2250
    ldr r0, [r8, #0x40]
    mov r0, r0, lsr #0x5
    tst r0, #0x1
    bne .L_2250
    mov r0, r7, lsl #0x10
    and r0, r0, #0x1f0000
    orr r0, r0, sl
    orr r0, r0, r5
    ldr r3, [r9]
    mov r2, r4
    mov r1, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    add r1, r3, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
    cmp r0, #0x0
    beq .L_2250
    mov r0, r6
    mov r1, r7
    mov r2, fp
    mov r3, #0x1
    bl func_ov002_021e2d94
.L_2250:
    add r8, r8, #0x14
    add r9, r9, #0x14
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_21d4
    ldr r0, [sp, #0x10]
    add r0, r0, #0x1
    str r0, [sp, #0x10]
    cmp r0, #0x2
    blt .L_218c
.L_2278:
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r1, r0, lsl #0x1b
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021c8940
    cmp r0, #0x7
    bne .L_22a4
    ldr r0, _LIT11
    bl func_ov002_02253b6c
.L_22a4:
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0]
    mov r1, r0, lsl #0x1b
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021c1d28
    cmp r0, #0x0
    bne .L_23c0
    ldr r0, _LIT0
    ldr r3, _LIT12
    ldr r1, [r0]
    ldr r0, _LIT3
    mov r2, r1, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r4, r2, #0x1
    mov r1, r1, lsl #0x1b
    mov r2, r1, lsr #0x1c
    mov r1, #0x14
    mul r1, r2, r1
    mla r0, r4, r0, r3
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    bne .L_23c0
    ldr r0, [sp, #0x4]
    mov r8, #0x0
    mov r0, r0, lsl #0x19
    and fp, r0, #0x7e000000
.L_2318:
    ldr r0, _LIT10
    ldr r2, _LIT4
    ldr r1, [r0, #0xcec]
    ldr r0, _LIT3
    eor r6, r1, r8
    and r1, r6, #0x1
    mla r2, r1, r0, r2
    mov r0, r6, lsl #0x1f
    and r0, r0, #-2147483648
    orr r0, r0, fp
    ldr r4, [sp, #0x1c]
    ldr r5, _LIT13
    add r9, r2, #0x94
    orr sl, r0, #0x200000
    mov r7, #0x5
.L_2354:
    mov r0, r6
    mov r1, r7
    mov r2, r5
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_23a4
    ldr r2, [r9]
    mov r0, r7, lsl #0x10
    and r0, r0, #0x1f0000
    orr r0, r0, sl
    orr r0, r0, r5
    mov r1, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r1, r2, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r4
    bl func_ov002_021e30b4
.L_23a4:
    add r7, r7, #0x1
    cmp r7, #0xa
    add r9, r9, #0x14
    blt .L_2354
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_2318
.L_23c0:
    ldr r0, [sp, #0x4]
    cmp r0, #0x6
    cmpne r0, #0x8
    bne .L_2480
    ldr r0, _LIT0
    ldr r1, _LIT14
    ldr r0, [r0]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202df78
    cmp r0, #0x0
    bne .L_2410
    ldr r0, _LIT0
    ldr r1, _LIT15
    ldr r0, [r0]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202df78
    cmp r0, #0x0
    beq .L_2480
.L_2410:
    ldr r1, [sp, #0x1c]
    mov r7, #0xa
    mov r0, r1, lsl #0xf
    mov r1, r1, lsl #0x16
    mov r0, r0, lsr #0x1f
    eor r0, r0, r1, lsr #0x1f
    mov r2, #0x1
    mov r0, r0, lsl #0x4
    mov r6, r2, lsl r0
    ldr r8, _LIT16
    ldr r5, _LIT10
    mov r4, #0x0
    mov r9, r7
.L_2444:
    ldr r0, [r5, #0xcec]
    mov r1, r9
    eor sl, r0, r4
    mov r0, sl
    mov r2, r8
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_2474
    mov r0, sl
    mov r1, r7
    mov r2, r6
    bl func_ov002_021d90fc
.L_2474:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_2444
.L_2480:
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r1, r0, lsl #0x1b
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021bad58
    cmp r0, #0x0
    beq .L_25b8
    ldr r2, _LIT17
    ldr r0, [sp, #0x18]
    cmp r0, r2
    bgt .L_24fc
    bge .L_2550
    sub r1, r2, #0x2c0
    cmp r0, r1
    bgt .L_24d8
    bge .L_2550
    ldr r1, _LIT18
    cmp r0, r1
    beq .L_2550
    b .L_25b8
.L_24d8:
    sub r1, r2, #0xc7
    cmp r0, r1
    bgt .L_24ec
    beq .L_2550
    b .L_25b8
.L_24ec:
    sub r1, r2, #0xc0
    cmp r0, r1
    beq .L_2550
    b .L_25b8
.L_24fc:
    add r1, r2, #0xc4
    cmp r0, r1
    bgt .L_2530
    bge .L_2550
    add r1, r2, #0xb
    cmp r0, r1
    bgt .L_2520
    beq .L_2550
    b .L_25b8
.L_2520:
    add r1, r2, #0x97
    cmp r0, r1
    beq .L_2550
    b .L_25b8
.L_2530:
    ldr r1, _LIT19
    cmp r0, r1
    bgt .L_2544
    beq .L_2550
    b .L_25b8
.L_2544:
    add r1, r1, #0xc9
    cmp r0, r1
    bne .L_25b8
.L_2550:
    ldr r0, _LIT0
    ldr r2, [sp, #0x1c]
    ldr r5, [r0]
    ldr r0, [sp, #0x4]
    mov r1, r5, lsl #0x1b
    mov r3, r0, lsl #0x19
    mov r0, r5, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r4, r0, lsl #0x1f
    mov r0, r1, lsr #0x1c
    mov r1, r5, lsl #0x9
    mov r5, r0, lsl #0x10
    mov r0, r2, lsl #0x17
    mov r0, r0, lsr #0x17
    mov r6, r1, lsr #0x11
    mov r1, r0, lsl #0x10
    and r4, r4, #-2147483648
    and r0, r3, #0x7e000000
    orr r0, r4, r0
    orr r3, r0, #0x200000
    and r4, r5, #0x1f0000
    mov r0, r6, lsl #0x10
    orr r3, r4, r3
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_25b8:
    ldr r1, _LIT20
    ldr r0, [sp, #0x18]
    cmp r0, r1
    bne .L_2600
    mov r0, #0x0
    str r0, [sp]
    ldr r0, _LIT0
    mov r3, #0x5
    ldr r1, [r0]
    mov r0, r1, lsl #0x9
    mov r0, r0, lsr #0x11
    mov r4, r1, lsl #0x1f
    mov r2, r0, lsl #0x10
    mov r1, r1, lsl #0x1b
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1c
    mov r2, r2, lsr #0x10
    bl func_ov002_021d59cc
.L_2600:
    ldr r0, [sp, #0x4]
    cmp r0, #0x7
    beq .L_26cc
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    ldr r5, [sp, #0x1c]
    ldr r6, _LIT21
    str r0, [sp, #0xc]
    mov fp, #0x0
.L_2624:
    ldr r0, _LIT10
    ldr r1, _LIT3
    ldr r0, [r0, #0xcec]
    mov r7, #0x0
    eor r8, r0, fp
    ldr r0, _LIT4
    and r2, r8, #0x1
    mla r0, r2, r1, r0
    add r9, r0, #0x30
    mov r0, r8, lsl #0x1f
    and r2, r0, #-2147483648
    ldr r0, [sp, #0xc]
    add r4, r1, #0xb30
    orr r0, r2, r0
    orr sl, r0, #0x200000
.L_2660:
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_26b0
    mov r0, r7, lsl #0x10
    and r0, r0, #0x1f0000
    orr r0, r0, sl
    orr r0, r0, r4
    ldr r3, [r9]
    mov r2, r5
    mov r1, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    add r1, r3, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_26b0:
    add r9, r9, #0x14
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_2660
    add fp, fp, #0x1
    cmp fp, #0x2
    blt .L_2624
.L_26cc:
    ldr r0, [sp, #0x4]
    cmp r0, #0x8
    beq .L_2798
    mov r0, r0, lsl #0x19
    mov r6, #0x0
    ldr sl, [sp, #0x1c]
    ldr r4, _LIT4
    ldr r5, _LIT22
    ldr r9, _LIT3
    mov r7, r6
    and r8, r0, #0x7e000000
.L_26f8:
    ldr r0, _LIT0
    mov r1, r6
    ldr r0, [r0]
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_2788
    ldr r0, _LIT0
    mov r1, r6, lsl #0x10
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r3, r0, #0x1
    and r0, r3, #0x1
    mla r2, r0, r9, r4
    add r0, r2, #0x30
    and r2, r1, #0x1f0000
    mov r1, r3, lsl #0x1f
    and r1, r1, #-2147483648
    orr r1, r1, r8
    orr r1, r1, #0x200000
    orr r1, r2, r1
    ldr r3, [r0, r7]
    orr r0, r1, r5
    mov r1, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    add r1, r3, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r2, sl
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_2788:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r7, r7, #0x14
    ble .L_26f8
.L_2798:
    ldr r0, [sp, #0x4]
    cmp r0, #0x6
    bne .L_2864
    mov r0, r0, lsl #0x19
    mov r6, #0x0
    ldr sl, [sp, #0x1c]
    ldr r4, _LIT4
    ldr r5, _LIT23
    ldr r9, _LIT3
    mov r7, r6
    and r8, r0, #0x7e000000
.L_27c4:
    ldr r0, _LIT0
    mov r1, r6
    ldr r0, [r0]
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_2854
    ldr r0, _LIT0
    mov r1, r6, lsl #0x10
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r3, r0, #0x1
    and r0, r3, #0x1
    mla r2, r0, r9, r4
    add r0, r2, #0x30
    and r2, r1, #0x1f0000
    mov r1, r3, lsl #0x1f
    and r1, r1, #-2147483648
    orr r1, r1, r8
    orr r1, r1, #0x200000
    orr r1, r2, r1
    ldr r3, [r0, r7]
    orr r0, r1, r5
    mov r1, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    add r1, r3, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r2, sl
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_2854:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r7, r7, #0x14
    ble .L_27c4
.L_2864:
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x1c]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_ov002_02244fe4
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    beq .L_29dc
    ldr r0, [sp, #0x4]
    cmp r0, #0x6
    bne .L_29dc
    ldr r0, _LIT0
    ldr r1, _LIT10
    ldr r2, [r0]
    ldr r0, [r1, #0xcec]
    mov r1, r2, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    mov r0, r1, lsr #0x1f
    bne .L_2978
    mov r1, r2, lsl #0x1b
    mov r1, r1, lsr #0x1c
    bl func_ov002_021c84e0
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    ldr r2, _LIT24
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    add r3, r4, #0x1
    mov r1, #0xb
    bl func_ov002_021b3e94
    movs r5, r0
    beq .L_2958
    ldr r0, _LIT0
    ldr r1, _LIT24
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021df6d4
    bl func_ov002_021e2bd4
    cmp r5, #0x0
    mov r6, #0x0
    ble .L_2954
    add r1, r4, #0x1
    mov r0, #0x1f4
    mul r4, r1, r0
    ldr r7, _LIT24
    mov r8, #0x1
.L_2924:
    ldr r0, _LIT0
    mov r1, r4
    ldr r0, [r0]
    mov r2, r8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, r7
    rsb r0, r0, #0x1
    bl func_ov002_021df938
    add r6, r6, #0x1
    cmp r6, r5
    blt .L_2924
.L_2954:
    bl func_ov002_021e2c5c
.L_2958:
    ldr r0, _LIT0
    ldr r2, _LIT24
    ldr r0, [r0]
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x1
    bl func_ov002_021d5b80
.L_2978:
    ldr r1, _LIT25
    ldr r0, [sp, #0x18]
    cmp r0, r1
    addne r1, r1, #0xab
    cmpne r0, r1
    bne .L_29dc
    ldr r0, _LIT0
    ldr r2, [r0]
    mov r0, r2, lsl #0x1f
    mov r1, r2, lsl #0x1b
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1c
    mov r2, r2, lsr #0x17
    bl func_ov002_021df62c
    bl func_ov002_021e2bd4
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0]
    mov r3, r2
    mov r1, r0, lsl #0x1b
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021de480
    bl func_ov002_021e2c5c
.L_29dc:
    ldr r0, _LIT0
    ldrh r0, [r0, #0x16]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1f
    beq .L_2a20
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0]
    ldr r0, [r1, #0x4]
    mov r1, r2, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    bne .L_2a20
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x17
    bl func_ov002_021b1458
.L_2a20:
    ldr r1, _LIT0
    add sp, sp, #0x20
    ldrh r2, [r1, #0x16]
    mov r0, #0x1
    bic r2, r2, #0x40
    strh r2, [r1, #0x16]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2a3c:
    mov r0, #0x0
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word data_ov002_022cd73c
_LIT2: .word data_ov002_022cd968
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf16c
_LIT5: .word data_ov002_022cf1a4
_LIT6: .word 0x000001ff
_LIT7: .word data_ov002_022ce288
_LIT8: .word 0x00001403
_LIT9: .word 0x00001744
_LIT10: .word data_ov002_022d016c
_LIT11: .word 0x00001a51
_LIT12: .word data_ov002_022cf1a2
_LIT13: .word 0x000016d0
_LIT14: .word 0x00000fe4
_LIT15: .word 0x00000fe5
_LIT16: .word 0x0000183f
_LIT17: .word 0x0000157b
_LIT18: .word 0x00001298
_LIT19: .word 0x000018f9
_LIT20: .word 0x00001a1f
_LIT21: .word 0x00001398
_LIT22: .word 0x00001387
_LIT23: .word 0x000019a5
_LIT24: .word 0x000017b0
_LIT25: .word 0x0000133d
