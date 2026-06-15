; func_0209b5e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8438
        .extern func_0209b55c
        .extern func_0209bd98
        .extern func_0209bdc8
        .global func_0209b5e0
        .arm
func_0209b5e0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    cmp r2, #0x0
    beq .L_f4
    ldr r0, _LIT0
    ldr r2, _LIT0
    ldr r1, [r0, #0x18]
    ldr r4, [r2, #0x4]
    cmp r1, #0x0
    movne r1, #0x0
    strne r1, [r0, #0x18]
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    movne r1, #0x0
    strne r1, [r0]
    cmp r4, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldr r1, [r2, #0x10]
    mov r3, #0x0
    mov r0, #0x6
    str r3, [r2, #0x4]
    blx r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_f4:
    and r0, r1, #0x7f00
    mov r0, r0, lsr #0x8
    and r0, r0, #0xff
    cmp r0, #0x30
    and r2, r1, #0xff
    bne .L_134
    ldr r0, _LIT0
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    blx r0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_134:
    cmp r2, #0x0
    bne .L_54c
    ldr r0, _LIT0
    mov r5, #0x0
    ldr r1, [r0, #0x14]
    cmp r1, #0xf
    addls pc, pc, r1, lsl #0x2
    b .L_538
    b .L_194
    b .L_1e8
    b .L_238
    b .L_594
    b .L_594
    b .L_594
    b .L_2e0
    b .L_310
    b .L_334
    b .L_3d8
    b .L_48c
    b .L_594
    b .L_594
    b .L_594
    b .L_594
    b .L_594
.L_194:
    ldr r1, _LIT1
    ldr r4, [r0, #0x8]
    ldrb r0, [r1]
    bl func_0209b55c
    ldr r1, _LIT1
    str r0, [r4]
    ldr r0, [r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x1b
    bl func_0209b55c
    ldr r1, _LIT1
    str r0, [r4, #0x4]
    ldr r0, [r1]
    mov r0, r0, lsl #0xa
    mov r0, r0, lsr #0x1a
    bl func_0209b55c
    str r0, [r4, #0x8]
    mov r0, r4
    bl func_0209bdc8
    str r0, [r4, #0xc]
    b .L_594
.L_1e8:
    ldr r1, _LIT2
    ldr r4, [r0, #0x8]
    ldr r0, [r1]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1a
    bl func_0209b55c
    ldr r1, _LIT2
    str r0, [r4]
    ldr r0, [r1]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x19
    bl func_0209b55c
    ldr r1, _LIT2
    str r0, [r4, #0x4]
    ldr r0, [r1]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x19
    bl func_0209b55c
    str r0, [r4, #0x8]
    b .L_594
.L_238:
    ldr r1, _LIT1
    ldr r4, [r0, #0x8]
    ldr r0, [r1]
    and r0, r0, #0xff
    bl func_0209b55c
    ldr r1, _LIT1
    str r0, [r4]
    ldr r0, [r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x1b
    bl func_0209b55c
    ldr r1, _LIT1
    str r0, [r4, #0x4]
    ldr r0, [r1]
    mov r0, r0, lsl #0xa
    mov r0, r0, lsr #0x1a
    bl func_0209b55c
    str r0, [r4, #0x8]
    mov r0, r4
    bl func_0209bdc8
    ldr r1, _LIT2
    str r0, [r4, #0xc]
    ldr r0, [r1]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1a
    ldr r4, [r1, #0xc]
    bl func_0209b55c
    ldr r1, _LIT2
    str r0, [r4]
    ldr r0, [r1]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x19
    bl func_0209b55c
    ldr r1, _LIT2
    str r0, [r4, #0x4]
    ldr r0, [r1]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x19
    bl func_0209b55c
    str r0, [r4, #0x8]
    b .L_594
.L_2e0:
    ldr r1, _LIT3
    ldr r2, [r0, #0x8]
    ldrh r0, [r1]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x4
    bne .L_308
    mov r0, #0x1
    str r0, [r2]
    b .L_594
.L_308:
    str r5, [r2]
    b .L_594
.L_310:
    ldr r1, _LIT3
    ldr r2, [r0, #0x8]
    ldrh r0, [r1]
    mov r0, r0, lsl #0x19
    movs r0, r0, lsr #0x1f
    movne r0, #0x1
    strne r0, [r2]
    streq r5, [r2]
    b .L_594
.L_334:
    ldr r1, _LIT2
    ldr r4, [r0, #0x8]
    ldr r0, [r1]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    str r0, [r4]
    ldr r0, [r1]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1a
    bl func_0209b55c
    ldr r1, _LIT2
    str r0, [r4, #0x4]
    ldr r0, [r1]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x19
    bl func_0209b55c
    str r0, [r4, #0x8]
    mov r1, r5
    ldr r0, _LIT2
    str r1, [r4, #0xc]
    ldr r0, [r0]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1f
    ldrne r0, [r4, #0xc]
    addne r0, r0, #0x1
    strne r0, [r4, #0xc]
    ldr r0, _LIT2
    ldr r0, [r0]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    ldrne r0, [r4, #0xc]
    addne r0, r0, #0x2
    strne r0, [r4, #0xc]
    ldr r0, _LIT2
    ldr r0, [r0]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    ldrne r0, [r4, #0xc]
    addne r0, r0, #0x4
    strne r0, [r4, #0xc]
    b .L_594
.L_3d8:
    ldr r3, [r0, #0x18]
    cmp r3, #0x0
    bne .L_484
    ldr r1, [r0, #0x8]
    ldr r1, [r1]
    cmp r1, #0x1
    bne .L_440
    ldr r2, _LIT3
    ldrh r1, [r2]
    mov r1, r1, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0x4
    beq .L_594
    add r1, r3, #0x1
    str r1, [r0, #0x18]
    ldrh r0, [r2]
    bic r0, r0, #0xf
    orr r0, r0, #0x4
    strh r0, [r2]
    bl func_0209bd98
    cmp r0, #0x0
    moveq r1, r5
    ldreq r0, _LIT0
    moveq r5, #0x3
    streq r1, [r0, #0x18]
    b .L_594
.L_440:
    ldr r2, _LIT3
    ldrh r1, [r2]
    mov r1, r1, lsl #0x1c
    movs r1, r1, lsr #0x1c
    beq .L_594
    add r1, r3, #0x1
    str r1, [r0, #0x18]
    ldrh r0, [r2]
    bic r0, r0, #0xf
    strh r0, [r2]
    bl func_0209bd98
    cmp r0, #0x0
    moveq r1, r5
    ldreq r0, _LIT0
    moveq r5, #0x3
    streq r1, [r0, #0x18]
    b .L_594
.L_484:
    str r5, [r0, #0x18]
    b .L_594
.L_48c:
    ldr r3, [r0, #0x18]
    cmp r3, #0x0
    bne .L_530
    ldr r1, [r0, #0x8]
    ldr r1, [r1]
    cmp r1, #0x1
    bne .L_4ec
    ldr r2, _LIT3
    ldrh r1, [r2]
    mov r1, r1, lsl #0x19
    movs r1, r1, lsr #0x1f
    bne .L_594
    add r1, r3, #0x1
    str r1, [r0, #0x18]
    ldrh r0, [r2]
    orr r0, r0, #0x40
    strh r0, [r2]
    bl func_0209bd98
    cmp r0, #0x0
    moveq r1, r5
    ldreq r0, _LIT0
    moveq r5, #0x3
    streq r1, [r0, #0x18]
    b .L_594
.L_4ec:
    ldr r2, _LIT3
    ldrh r1, [r2]
    mov r1, r1, lsl #0x19
    movs r1, r1, lsr #0x1f
    beq .L_594
    add r1, r3, #0x1
    str r1, [r0, #0x18]
    ldrh r0, [r2]
    bic r0, r0, #0x40
    strh r0, [r2]
    bl func_0209bd98
    cmp r0, #0x0
    moveq r1, r5
    ldreq r0, _LIT0
    moveq r5, #0x3
    streq r1, [r0, #0x18]
    b .L_594
.L_530:
    str r5, [r0, #0x18]
    b .L_594
.L_538:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x18]
    mov r5, #0x4
    b .L_594
.L_54c:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x18]
    cmp r2, #0x4
    addls pc, pc, r2, lsl #0x2
    b .L_590
    b .L_590
    b .L_578
    b .L_580
    b .L_588
    b .L_590
.L_578:
    mov r5, #0x4
    b .L_594
.L_580:
    mov r5, #0x5
    b .L_594
.L_588:
    mov r5, #0x1
    b .L_594
.L_590:
    mov r5, #0x6
.L_594:
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    cmp r1, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    ldr r2, _LIT0
    ldr r1, [r0]
    ldr r4, [r2, #0x4]
    cmp r1, #0x0
    movne r1, #0x0
    strne r1, [r0]
    cmp r4, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldr r1, [r2, #0x10]
    mov r3, #0x0
    mov r0, r5
    str r3, [r2, #0x4]
    blx r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a8438
_LIT1: .word 0x027ffde8
_LIT2: .word 0x027ffdec
_LIT3: .word 0x027ffdea
