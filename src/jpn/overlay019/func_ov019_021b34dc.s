; func_ov019_021b34dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov000_021b1c4c
        .extern data_ov019_021b5aa0
        .extern data_ov019_021b5aaa
        .extern func_020371b8
        .extern func_020b377c
        .extern func_ov005_021aa3f0
        .extern func_ov019_021b26a0
        .extern func_ov019_021b3bf0
        .extern func_ov019_021b3fd4
        .extern func_ov019_021b4158
        .extern func_ov019_021b4224
        .global func_ov019_021b34dc
        .arm
func_ov019_021b34dc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r1, #0x4000000
    ldr r3, [r1]
    ldr r2, [r1]
    and r3, r3, #0x1f00
    mov r4, r3, lsr #0x8
    bic r3, r2, #0x1f00
    orr r2, r4, #0x6
    orr r3, r3, r2, lsl #0x8
    ldr r2, _LIT0
    str r3, [r1]
    ldrh r2, [r2, #0x52]
    mov r4, r0
    ldr r5, _LIT1
    cmp r2, #0x0
    beq .L_444
    tst r2, #0x300
    beq .L_68
    ldr r2, [r1]
    ldr r0, [r1]
    and r2, r2, #0x1f00
    mov r3, r2, lsr #0x8
    bic r2, r0, #0x1f00
    bic r0, r3, #0x6
    orr r0, r2, r0, lsl #0x8
    str r0, [r1]
.L_68:
    ldr r2, [r4, #0x434]
    cmp r2, #0x0
    ble .L_130
    ldr r0, _LIT0
    ldrh r1, [r0, #0x54]
    tst r1, #0x1
    beq .L_94
    mov r0, r4
    rsb r1, r2, #0x2
    bl func_ov019_021b3bf0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_94:
    tst r1, #0x2
    beq .L_b8
    mov r0, #0x42
    mov r2, #0x0
    sub r1, r0, #0x43
    mov r3, #0x1
    str r2, [r4, #0x434]
    bl func_020371b8
    b .L_6fc
.L_b8:
    tst r1, #0x30
    beq .L_e4
    sub r1, r2, #0x1
    mov r0, #0x38
    rsb r5, r1, #0x2
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r5, [r4, #0x434]
    bl func_020371b8
    b .L_6fc
.L_e4:
    ldrh r0, [r0, #0x56]
    tst r0, #0x80
    beq .L_10c
    mov r0, #0x42
    mov r2, #0x0
    sub r1, r0, #0x43
    mov r3, #0x1
    str r2, [r4, #0x434]
    bl func_020371b8
    b .L_6fc
.L_10c:
    tst r0, #0x40
    beq .L_6fc
    mov r0, #0x42
    mov r2, #0x0
    sub r1, r0, #0x43
    mov r3, #0x1
    str r2, [r4, #0x434]
    bl func_020371b8
    b .L_6fc
.L_130:
    ldr r0, _LIT0
    ldrh r1, [r0, #0x54]
    tst r1, #0x1
    beq .L_15c
    mov r0, #0x3a
    mov r3, #0x1
    sub r1, r0, #0x3b
    mov r2, #0x0
    str r3, [r4, #0x434]
    bl func_020371b8
    b .L_6fc
.L_15c:
    tst r1, #0x2
    beq .L_174
    mov r0, r4
    mov r1, #0x0
    bl func_ov019_021b3bf0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_174:
    ldrh r0, [r0, #0x56]
    tst r0, #0x80
    beq .L_244
    ldr r2, [r4, #0x8]
    ldr r1, [r4, #0x10]
    cmp r2, #0x6
    movgt r0, #0x6
    movle r0, r2
    sub r0, r0, #0x1
    cmp r1, r0
    bge .L_1d0
    add r5, r1, #0x1
    mov r0, #0x38
    str r5, [r4, #0x10]
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r5, [r4, #0x43c]
    bl func_020371b8
    mov r0, r4
    mov r1, #0x2
    bl func_ov019_021b3bf0
    b .L_6fc
.L_1d0:
    ldr r0, [r4, #0xc]
    add r1, r0, #0x6
    cmp r1, r2
    bge .L_6fc
    add r0, r0, #0x1
    str r0, [r4, #0xc]
    add r5, r0, #0x6
    ldr r1, [r4, #0x8]
    mov r0, r5
    bl func_020b377c
    mov r0, #0xc
    mla r0, r1, r0, r4
    mov r3, r5, lsr #0x1f
    ldrh r1, [r0, #0x14]
    rsb r2, r3, r5, lsl #0x1d
    mov r0, r4
    add r2, r3, r2, ror #0x1d
    bl func_ov019_021b3fd4
    mov r0, r4
    bl func_ov019_021b4158
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, r4
    mov r1, #0x2
    bl func_ov019_021b3bf0
    b .L_6fc
.L_244:
    tst r0, #0x40
    beq .L_2fc
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    ble .L_288
    sub r5, r0, #0x1
    mov r0, #0x38
    str r5, [r4, #0x10]
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r5, [r4, #0x43c]
    bl func_020371b8
    mov r0, r4
    mov r1, #0x2
    bl func_ov019_021b3bf0
    b .L_6fc
.L_288:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    ble .L_6fc
    sub r6, r0, #0x1
    str r6, [r4, #0xc]
    subs r0, r6, #0x1
    bmi .L_2d0
    ldr r1, [r4, #0x8]
    bl func_020b377c
    mov r0, #0xc
    mla r5, r1, r0, r4
    add r0, r6, #0x7
    mov r3, r0, lsr #0x1f
    rsb r2, r3, r0, lsl #0x1d
    ldrh r1, [r5, #0x14]
    mov r0, r4
    add r2, r3, r2, ror #0x1d
    bl func_ov019_021b3fd4
.L_2d0:
    mov r0, r4
    bl func_ov019_021b4158
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, r4
    mov r1, #0x2
    bl func_ov019_021b3bf0
    b .L_6fc
.L_2fc:
    tst r0, #0x10
    beq .L_3a4
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x8]
    add r2, r1, #0x6
    cmp r2, r0
    bge .L_6fc
    str r2, [r4, #0xc]
    ldr r1, [r4, #0x8]
    add r0, r2, #0x6
    cmp r0, r1
    subge r0, r1, #0x6
    strge r0, [r4, #0xc]
    mov r5, #0x0
    mov r6, #0xc
.L_338:
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    add r0, r0, r5
    add r7, r0, #0x1
    mov r0, r7
    bl func_020b377c
    mla r0, r1, r6, r4
    mov r3, r7, lsr #0x1f
    rsb r2, r3, r7, lsl #0x1d
    ldrh r1, [r0, #0x14]
    mov r0, r4
    add r2, r3, r2, ror #0x1d
    bl func_ov019_021b3fd4
    add r5, r5, #0x1
    cmp r5, #0x6
    blt .L_338
    mov r0, r4
    bl func_ov019_021b4158
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, r4
    mov r1, #0x2
    bl func_ov019_021b3bf0
    b .L_6fc
.L_3a4:
    tst r0, #0x20
    beq .L_6fc
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    ble .L_6fc
    subs r0, r0, #0x6
    str r0, [r4, #0xc]
    movmi r0, #0x0
    strmi r0, [r4, #0xc]
    mov r5, #0x0
    mov r6, #0xc
.L_3d0:
    ldr r7, [r4, #0xc]
    sub r0, r7, #0x1
    adds r0, r0, r5
    bmi .L_40c
    ldr r1, [r4, #0x8]
    bl func_020b377c
    mla ip, r1, r6, r4
    add r0, r7, r5
    add r0, r0, #0x7
    mov r3, r0, lsr #0x1f
    rsb r2, r3, r0, lsl #0x1d
    ldrh r1, [ip, #0x14]
    mov r0, r4
    add r2, r3, r2, ror #0x1d
    bl func_ov019_021b3fd4
.L_40c:
    add r5, r5, #0x1
    cmp r5, #0x6
    blt .L_3d0
    mov r0, r4
    bl func_ov019_021b4158
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, r4
    mov r1, #0x2
    bl func_ov019_021b3bf0
    b .L_6fc
.L_444:
    ldr r0, _LIT2
    bl func_ov019_021b26a0
    cmp r0, #0x0
    beq .L_464
    mov r0, r4
    mov r1, #0x0
    bl func_ov019_021b3bf0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_464:
    ldr r0, _LIT3
    bl func_ov019_021b26a0
    cmp r0, #0x0
    beq .L_484
    mov r0, r4
    mov r1, #0x1
    bl func_ov019_021b3bf0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_484:
    ldr r0, [r4, #0x8]
    cmp r0, #0x6
    ble .L_6b8
    mov r0, r5
    ldr r6, [r4, #0xc]
    bl func_ov005_021aa3f0
    ldr r0, [r5, #0x4]
    str r0, [r4, #0xc]
    ldr r0, [r5, #0x18]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_6b8
    b .L_4cc
    b .L_64c
    b .L_508
    b .L_550
    b .L_594
    b .L_5f4
.L_4cc:
    ldr r0, [r4, #0x438]
    cmp r0, #0x0
    beq .L_6b8
    mov r2, #0x0
    mov r0, #0x38
    str r2, [r4, #0x438]
    sub r1, r0, #0x39
    mov r3, #0x1
    str r2, [r4, #0x434]
    bl func_020371b8
    mov r0, r4
    mov r1, #0x2
    bl func_ov019_021b3bf0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_508:
    ldr r6, [r4, #0xc]
    subs r0, r6, #0x1
    bmi .L_540
    ldr r1, [r4, #0x8]
    bl func_020b377c
    mov r0, #0xc
    mla r5, r1, r0, r4
    add r0, r6, #0x7
    mov r3, r0, lsr #0x1f
    rsb r2, r3, r0, lsl #0x1d
    ldrh r1, [r5, #0x14]
    mov r0, r4
    add r2, r3, r2, ror #0x1d
    bl func_ov019_021b3fd4
.L_540:
    mov r0, #0x2
    str r0, [r4, #0x438]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_550:
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    add r5, r0, #0x6
    mov r0, r5
    bl func_020b377c
    mov r0, #0xc
    mla r0, r1, r0, r4
    mov r3, r5, lsr #0x1f
    ldrh r1, [r0, #0x14]
    rsb r2, r3, r5, lsl #0x1d
    mov r0, r4
    add r2, r3, r2, ror #0x1d
    bl func_ov019_021b3fd4
    mov r0, #0x3
    str r0, [r4, #0x438]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_594:
    mov r5, #0x0
    mov r6, #0xc
.L_59c:
    ldr r7, [r4, #0xc]
    sub r0, r7, #0x1
    adds r0, r0, r5
    bmi .L_5d8
    ldr r1, [r4, #0x8]
    bl func_020b377c
    mla ip, r1, r6, r4
    add r0, r7, r5
    add r0, r0, #0x7
    mov r3, r0, lsr #0x1f
    rsb r2, r3, r0, lsl #0x1d
    ldrh r1, [ip, #0x14]
    mov r0, r4
    add r2, r3, r2, ror #0x1d
    bl func_ov019_021b3fd4
.L_5d8:
    add r5, r5, #0x1
    cmp r5, #0x6
    blt .L_59c
    mov r0, #0x4
    str r0, [r4, #0x438]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_5f4:
    mov r5, #0x0
    mov r6, #0xc
.L_5fc:
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    add r0, r0, r5
    add r7, r0, #0x1
    mov r0, r7
    bl func_020b377c
    mla r0, r1, r6, r4
    mov r3, r7, lsr #0x1f
    rsb r2, r3, r7, lsl #0x1d
    ldrh r1, [r0, #0x14]
    mov r0, r4
    add r2, r3, r2, ror #0x1d
    bl func_ov019_021b3fd4
    add r5, r5, #0x1
    cmp r5, #0x6
    blt .L_5fc
    mov r0, #0x5
    str r0, [r4, #0x438]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_64c:
    ldr r0, [r4, #0xc]
    cmp r6, r0
    beq .L_6a8
    mov r5, #0x0
    mov r6, #0xc
.L_660:
    ldr r7, [r4, #0xc]
    sub r0, r7, #0x1
    adds r0, r0, r5
    bmi .L_69c
    ldr r1, [r4, #0x8]
    bl func_020b377c
    mla ip, r1, r6, r4
    add r0, r7, r5
    add r0, r0, #0x7
    mov r3, r0, lsr #0x1f
    rsb r2, r3, r0, lsl #0x1d
    ldrh r1, [ip, #0x14]
    mov r0, r4
    add r2, r3, r2, ror #0x1d
    bl func_ov019_021b3fd4
.L_69c:
    add r5, r5, #0x1
    cmp r5, #0x8
    blt .L_660
.L_6a8:
    mov r0, #0x1
    str r0, [r4, #0x438]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_6b8:
    mov r0, r4
    bl func_ov019_021b4224
    cmp r0, #0x0
    blt .L_6fc
    ldr r1, [r4, #0x10]
    cmp r0, r1
    beq .L_6fc
    str r0, [r4, #0x10]
    mov r0, #0x38
    mov r2, #0x0
    sub r1, r0, #0x39
    mov r3, #0x1
    str r2, [r4, #0x434]
    bl func_020371b8
    mov r0, r4
    mov r1, #0x2
    bl func_ov019_021b3bf0
.L_6fc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02104acc
_LIT1: .word data_ov000_021b1c4c
_LIT2: .word data_ov019_021b5aa0
_LIT3: .word data_ov019_021b5aaa
