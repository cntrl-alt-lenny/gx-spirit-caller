; func_ov006_021b74f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern func_02005994
        .extern func_ov006_021b7140
        .extern func_ov006_021b80dc
        .extern func_ov006_021b8444
        .extern func_ov006_021b8ea8
        .extern func_ov006_021b8f10
        .extern func_ov006_021b9900
        .global func_ov006_021b74f0
        .arm
func_ov006_021b74f0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    ldr r4, [sp, #0x38]
    mov r9, r0
    str r4, [sp, #0x38]
    mov fp, r1
    mov sl, r2
    str r3, [sp, #0x4]
    str r4, [sp]
    bl func_ov006_021b7140
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, r9, sl, lsl #0x1
    add r1, r9, fp, lsl #0x1
    add r0, r0, #0x62
    add r0, r0, #0xc600
    add r1, r1, #0x62
    str r0, [sp, #0xc]
    add r0, r1, #0xc600
    str r0, [sp, #0x8]
    mov r6, #0x0
.L_40c:
    cmp r6, fp
    cmpne r6, sl
    bne .L_74c
    mov r0, r9
    mov r1, r6
    bl func_ov006_021b80dc
    ldr r1, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x10]
    mov r2, r1
    mov r0, r6
    strh r2, [sp, #0x10]
    bl func_ov006_021b9900
    cmp r0, #0x0
    beq .L_74c
    cmp r6, sl
    bne .L_560
    cmp sl, #0x4
    addls pc, pc, sl, lsl #0x2
    b .L_4a8
    b .L_470
    b .L_47c
    b .L_488
    b .L_494
    b .L_4a0
.L_470:
    add r0, r9, #0x198
    add r5, r0, #0x9800
    b .L_4a8
.L_47c:
    add r0, r9, #0x358
    add r5, r0, #0xb000
    b .L_4a8
.L_488:
    add r0, r9, #0x158
    add r5, r0, #0xb800
    b .L_4a8
.L_494:
    add r0, r9, #0x358
    add r5, r0, #0xbc00
    b .L_4a8
.L_4a0:
    add r0, r9, #0x58
    add r5, r0, #0xc400
.L_4a8:
    ldr r0, [sp, #0xc]
    mov r1, sl
    ldrh r4, [r0]
    mov r0, r9
    bl func_ov006_021b8ea8
    cmp r4, #0x0
    mov r0, #0x0
    ble .L_4e8
    ldr r3, _LIT0
    mov r2, r4, lsl #0x10
    str r3, [sp]
    add r0, sp, #0x10
    mov r1, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_02005994
.L_4e8:
    cmp r0, r4
    bge .L_740
    add r1, r5, r0, lsl #0x2
    ldrb r3, [r1, #0x2]
    ldr r2, [sp, #0x38]
    sub r2, r3, r2
    cmp r2, #0x0
    bgt .L_558
    cmp sl, #0x0
    addeq r2, r9, #0x6000
    ldreq r2, [r2, #0x298]
    cmpeq r2, #0x0
    moveq r0, #0x0
    streqb r0, [r1, #0x2]
    beq .L_740
    add r2, r0, #0x1
    cmp r2, r4
    bge .L_548
.L_530:
    ldr r1, [r5, r2, lsl #0x2]
    add r0, r5, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #-4]
    cmp r2, r4
    blt .L_530
.L_548:
    ldr r0, [sp, #0xc]
    sub r1, r4, #0x1
    strh r1, [r0]
    b .L_740
.L_558:
    strb r2, [r1, #0x2]
    b .L_740
.L_560:
    cmp r6, fp
    bne .L_740
    cmp fp, #0x4
    addls pc, pc, fp, lsl #0x2
    b .L_5c0
    b .L_588
    b .L_594
    b .L_5a0
    b .L_5ac
    b .L_5b8
.L_588:
    add r0, r9, #0x198
    add r5, r0, #0x9800
    b .L_5c0
.L_594:
    add r0, r9, #0x358
    add r5, r0, #0xb000
    b .L_5c0
.L_5a0:
    add r0, r9, #0x158
    add r5, r0, #0xb800
    b .L_5c0
.L_5ac:
    add r0, r9, #0x358
    add r5, r0, #0xbc00
    b .L_5c0
.L_5b8:
    add r0, r9, #0x58
    add r5, r0, #0xc400
.L_5c0:
    ldr r0, [sp, #0x8]
    mov r1, fp
    ldrh r7, [r0]
    mov r0, r9
    bl func_ov006_021b8ea8
    cmp r7, #0x0
    mov r0, #0x0
    ble .L_600
    ldr r3, _LIT0
    mov r2, r7, lsl #0x10
    str r3, [sp]
    add r0, sp, #0x10
    mov r1, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_02005994
.L_600:
    cmp r0, r7
    blt .L_720
    cmp r7, #0x0
    bne .L_630
    ldr r0, [sp, #0x4]
    mov r1, #0x1
    strh r0, [r5]
    ldr r0, [sp, #0x38]
    strb r0, [r5, #0x2]
    ldr r0, [sp, #0x8]
    strh r1, [r0]
    b .L_740
.L_630:
    ldr r0, _LIT1
    add r1, sp, #0x10
    ldr r8, [r0, #0x28]
    add r0, r5, r8, lsl #0x2
    bl func_ov006_021b8f10
    cmp r0, #0x0
    bge .L_6a8
    sub r4, r7, #0x1
    b .L_658
.L_654:
    add r8, r8, #0x1
.L_658:
    cmp r8, r4
    bge .L_678
    add r0, r8, #0x1
    add r0, r5, r0, lsl #0x2
    add r1, sp, #0x10
    bl func_ov006_021b8f10
    cmp r0, #0x0
    blt .L_654
.L_678:
    sub r3, r7, #0x1
    add r2, r8, #0x1
    cmp r3, r2
    blt .L_6a0
.L_688:
    ldr r1, [r5, r3, lsl #0x2]
    add r0, r5, r3, lsl #0x2
    str r1, [r0, #0x4]
    sub r3, r3, #0x1
    cmp r3, r2
    bge .L_688
.L_6a0:
    add r8, r8, #0x1
    b .L_6f8
.L_6a8:
    add r4, sp, #0x10
    b .L_6b4
.L_6b0:
    sub r8, r8, #0x1
.L_6b4:
    cmp r8, #0x0
    ble .L_6d4
    sub r0, r8, #0x1
    mov r1, r4
    add r0, r5, r0, lsl #0x2
    bl func_ov006_021b8f10
    cmp r0, #0x0
    bgt .L_6b0
.L_6d4:
    sub r2, r7, #0x1
    cmp r2, r8
    blt .L_6f8
.L_6e0:
    ldr r1, [r5, r2, lsl #0x2]
    add r0, r5, r2, lsl #0x2
    str r1, [r0, #0x4]
    sub r2, r2, #0x1
    cmp r2, r8
    bge .L_6e0
.L_6f8:
    ldr r0, [sp, #0x4]
    mov r1, r8, lsl #0x2
    strh r0, [r5, r1]
    ldr r0, [sp, #0x38]
    add r1, r5, r8, lsl #0x2
    strb r0, [r1, #0x2]
    ldr r0, [sp, #0x8]
    add r1, r7, #0x1
    strh r1, [r0]
    b .L_740
.L_720:
    add r2, r5, r0, lsl #0x2
    ldrb r1, [r2, #0x2]
    ldr r0, [sp, #0x38]
    add r0, r1, r0
    cmp r0, #0x9
    movge r0, #0x9
    strgeb r0, [r2, #0x2]
    strltb r0, [r2, #0x2]
.L_740:
    mov r0, r9
    mov r1, r6
    bl func_ov006_021b8444
.L_74c:
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_40c
    mov r0, #0x1
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word func_ov006_021b8f10
_LIT1: .word data_02103fcc
