; func_02050740 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045230
        .extern func_02046948
        .extern func_0204987c
        .extern func_0204991c
        .extern func_0204aa80
        .extern func_0204ab88
        .extern func_0204b39c
        .extern func_0204b85c
        .extern func_0204bdcc
        .extern func_0204be8c
        .extern func_0204cae0
        .extern func_0204cbac
        .extern func_0204ce1c
        .extern func_0204d210
        .extern func_0204d3c4
        .extern func_0204ea5c
        .extern func_0204f034
        .extern func_0204f7ac
        .extern func_0204ffe0
        .extern func_020500a4
        .extern func_020510f4
        .extern func_02062734
        .extern func_020654c8
        .extern func_02067594
        .extern func_02068c98
        .extern func_02092fc8
        .extern func_020b3714
        .global func_02050740
        .arm
func_02050740:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r4, r0
    bl func_0204987c
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_02045230
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
    cmp r4, #0x0
    bne .L_7c
    bl func_0204987c
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    beq .L_50
    bl func_0204987c
    ldr r0, [r0, #0x10]
    bl func_02067594
.L_50:
    bl func_0204987c
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_0204987c
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_02062734
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_7c:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xd
    addls pc, pc, r0, lsl #0x2
    b .L_79c
    b .L_79c
    b .L_6a4
    b .L_250
    b .L_250
    b .L_dc
    b .L_250
    b .L_79c
    b .L_308
    b .L_79c
    b .L_79c
    b .L_79c
    b .L_490
    b .L_79c
    b .L_584
.L_dc:
    bl func_0204987c
    ldr r0, [r0, #0x1c0]
    cmp r0, #0x0
    beq .L_1c8
    bl func_02092fc8
    mov r6, r0
    mov r7, r1
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    mov r4, r0
    ldr r1, [r5, #0x1c4]
    ldr r0, [r5, #0x1c8]
    subs r2, r6, r1
    sbc r0, r7, r0
    mov r1, r0, lsl #0x6
    orr r1, r1, r2, lsr #0x1a
    mov r0, r2, lsl #0x6
    ldr r2, _LIT0
    mov r3, #0x0
    bl func_020b3714
    cmp r1, #0x0
    ldr r1, [r4, #0x1c0]
    cmpeq r0, r1
    bls .L_1c8
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1c0]
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_1b4
    bl func_0204987c
    ldrb r1, [r0, #0x1a2]
    add r1, r1, #0x1
    strb r1, [r0, #0x1a2]
    bl func_0204987c
    ldrb r0, [r0, #0x1a2]
    cmp r0, #0x5
    bls .L_190
    ldr r1, _LIT1
    mov r0, #0x6
    bl func_0204ffe0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_190:
    bl func_0204987c
    ldr r0, [r0, #0xf4]
    mov r1, #0x0
    bl func_0204d210
    bl func_0204d3c4
    cmp r0, #0x0
    beq .L_1c8
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_1b4:
    mov r0, #0x0
    bl func_0204ce1c
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
.L_1c8:
    bl func_0204987c
    ldr r0, [r0, #0x1b4]
    cmp r0, #0x0
    beq .L_79c
    bl func_0204987c
    ldrb r1, [r0, #0xd]
    ldr r0, _LIT2
    mla r5, r1, r0, r0
    bl func_02092fc8
    mov r4, r0
    mov r6, r1
    bl func_0204987c
    ldr r1, [r0, #0x1b8]
    ldr r0, [r0, #0x1bc]
    subs r2, r4, r1
    sbc r0, r6, r0
    mov r1, r0, lsl #0x6
    orr r1, r1, r2, lsr #0x1a
    mov r0, r2, lsl #0x6
    ldr r2, _LIT0
    mov r3, #0x0
    bl func_020b3714
    cmp r1, #0x0
    cmpeq r0, r5
    bcc .L_79c
    bl func_0204987c
    ldr r0, [r0, #0xf4]
    mov r1, #0x0
    bl func_0204d210
    bl func_0204d3c4
    cmp r0, #0x0
    beq .L_79c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_250:
    bl func_0204987c
    ldr r0, [r0, #0xe8]
    cmp r0, #0x0
    ble .L_79c
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x3
    bne .L_284
    bl func_0204987c
    ldrb r1, [r0, #0xd]
    ldr r0, _LIT2
    mla r5, r1, r0, r0
    b .L_298
.L_284:
    bl func_0204987c
    ldr r0, [r0, #0xe8]
    cmp r0, #0x1
    moveq r5, #0x3e8
    ldrne r5, _LIT2
.L_298:
    bl func_02092fc8
    mov r4, r0
    mov r6, r1
    bl func_0204987c
    ldr r1, [r0, #0xec]
    ldr r0, [r0, #0xf0]
    subs r3, r4, r1
    sbc r0, r6, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3714
    cmp r1, #0x0
    cmpeq r0, r5
    bls .L_79c
    bl func_0204987c
    ldr r0, [r0, #0x1fc]
    bl func_0204f034
    bl func_0204aa80
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0xe8]
    b .L_79c
.L_308:
    bl func_0204987c
    ldr r2, [r0, #0x184]
    ldr r1, [r0, #0x188]
    mov r0, #0x0
    cmp r1, r0
    cmpeq r2, r0
    beq .L_398
    bl func_02092fc8
    mov r4, r0
    mov r5, r1
    bl func_0204987c
    ldr r1, [r0, #0x184]
    ldr r0, [r0, #0x188]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3714
    ldr r2, _LIT3
    cmp r1, #0x0
    cmpeq r0, r2
    bls .L_79c
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x184]
    str r1, [r0, #0x188]
    bl func_0204987c
    ldr r0, [r0, #0xf4]
    bl func_0204cae0
    cmp r0, #0x0
    bne .L_79c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_398:
    bl func_0204987c
    ldrb r0, [r0, #0x3c4]
    cmp r0, #0x6
    bne .L_79c
    bl func_02092fc8
    mov r4, r0
    mov r5, r1
    bl func_0204987c
    ldr r1, [r0, #0x454]
    ldr r0, [r0, #0x458]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3714
    ldr r2, _LIT4
    cmp r1, #0x0
    cmpeq r0, r2
    bls .L_79c
    bl func_0204987c
    ldrb r1, [r0, #0x3c5]
    add r1, r1, #0x1
    strb r1, [r0, #0x3c5]
    bl func_0204987c
    ldrb r0, [r0, #0x3c5]
    cmp r0, #0x5
    bls .L_430
    bl func_020500a4
    bl func_0204987c
    ldr r0, [r0, #0xf4]
    bl func_0204cae0
    cmp r0, #0x0
    bne .L_79c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_430:
    bl func_0204987c
    mov r7, r0
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    add r1, r4, #0x3cc
    str r1, [sp]
    add r3, r5, #0x300
    ldr r1, [r0, #0x450]
    mov r0, #0x6
    str r1, [sp, #0x4]
    ldr r1, [r7, #0x44c]
    ldr r2, [r6, #0x3c8]
    ldrh r3, [r3, #0xc6]
    bl func_0204ea5c
    bl func_0204d3c4
    cmp r0, #0x0
    beq .L_79c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_490:
    bl func_0204987c
    ldrb r0, [r0, #0x3c4]
    cmp r0, #0x2
    bne .L_79c
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_4f8
    bl func_02092fc8
    mov r4, r0
    mov r5, r1
    bl func_0204987c
    ldr r1, [r0, #0x454]
    ldr r0, [r0, #0x458]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3714
    ldr r2, _LIT4
    cmp r1, #0x0
    cmpeq r0, r2
    bhi .L_550
.L_4f8:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_79c
    bl func_02092fc8
    mov r4, r0
    mov r5, r1
    bl func_0204987c
    ldr r1, [r0, #0x454]
    ldr r0, [r0, #0x458]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3714
    ldr r2, _LIT5
    cmp r1, #0x0
    cmpeq r0, r2
    bls .L_79c
.L_550:
    bl func_020500a4
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    add r0, r0, #0x1
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    bl func_0204cbac
    cmp r0, #0x0
    bne .L_79c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_584:
    bl func_0204987c
    ldrb r0, [r0, #0x3c4]
    cmp r0, #0x8
    bne .L_79c
    bl func_02092fc8
    mov r4, r0
    mov r5, r1
    bl func_0204987c
    ldr r1, [r0, #0x454]
    ldr r0, [r0, #0x458]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3714
    ldr r2, _LIT6
    cmp r1, #0x0
    cmpeq r0, r2
    bls .L_79c
    bl func_0204987c
    ldrb r1, [r0, #0x3c5]
    add r1, r1, #0x1
    strb r1, [r0, #0x3c5]
    bl func_0204987c
    ldrb r0, [r0, #0x3c5]
    cmp r0, #0x0
    beq .L_644
    bl func_020500a4
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    bne .L_63c
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    bl func_0204cbac
    cmp r0, #0x0
    bne .L_79c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_63c:
    bl func_0204be8c
    b .L_79c
.L_644:
    bl func_0204987c
    mov r7, r0
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    add r1, r4, #0x3cc
    str r1, [sp]
    add r3, r5, #0x300
    ldr r1, [r0, #0x450]
    mov r0, #0x8
    str r1, [sp, #0x4]
    ldr r1, [r7, #0x44c]
    ldr r2, [r6, #0x3c8]
    ldrh r3, [r3, #0xc6]
    bl func_0204ea5c
    bl func_0204d3c4
    cmp r0, #0x0
    beq .L_79c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_6a4:
    bl func_02046948
    cmp r0, #0x5
    bne .L_79c
    bl func_02092fc8
    mov r4, r0
    mov r5, r1
    bl func_0204987c
    ldr r1, [r0, #0x1f0]
    ldr r0, [r0, #0x1f4]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3714
    ldr r2, _LIT6
    cmp r1, #0x0
    cmpeq r0, r2
    bls .L_79c
    bl func_0204987c
    ldrb r0, [r0, #0x1a5]
    cmp r0, #0x5
    bcc .L_724
    bl func_0204987c
    ldr r0, [r0, #0xf4]
    bl func_0204cae0
    cmp r0, #0x0
    bne .L_79c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_724:
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    mov r1, #0x0
    str r1, [sp]
    str r1, [sp, #0x4]
    ldrh r3, [r0, #0xa4]
    ldr r1, [r5, #0xf4]
    ldr r2, [r4, #0x24]
    mov r0, #0x40
    bl func_0204ea5c
    bl func_0204d3c4
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
    bl func_0204987c
    ldrb r1, [r0, #0x1a5]
    add r1, r1, #0x1
    strb r1, [r0, #0x1a5]
    bl func_0204987c
    mov r4, r0
    bl func_02092fc8
    ldr r2, _LIT7
    mvn r3, #0x0
    adds r0, r0, r2
    str r0, [r4, #0x1f0]
    adc r0, r1, r3
    str r0, [r4, #0x1f4]
.L_79c:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xb
    beq .L_7bc
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x6
    bne .L_838
.L_7bc:
    bl func_0204987c
    ldr r2, [r0, #0x17c]
    ldr r1, [r0, #0x180]
    mov r0, #0x0
    cmp r1, r0
    cmpeq r2, r0
    beq .L_838
    bl func_02092fc8
    mov r4, r0
    mov r5, r1
    bl func_0204987c
    ldr r1, [r0, #0x17c]
    ldr r0, [r0, #0x180]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3714
    ldr r2, _LIT8
    cmp r1, #0x0
    cmpeq r0, r2
    bls .L_838
    bl func_0204987c
    mov r1, #0x0
    add r3, r0, #0x18c
    mov r2, r1
    mov r0, #0x1
    bl func_0204991c
.L_838:
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    cmp r0, #0x0
    beq .L_854
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    bl func_02068c98
.L_854:
    bl func_0204987c
    ldr r0, [r0, #0x10]
    bl func_020510f4
    bl func_020654c8
    bl func_0204987c
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_884
    bl func_0204987c
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_02062734
.L_884:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x12
    bne .L_8ec
    bl func_02092fc8
    mov r4, r0
    mov r5, r1
    bl func_0204987c
    ldr r1, [r0, #0x1e8]
    ldr r0, [r0, #0x1ec]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3714
    ldr r2, _LIT2
    cmp r1, #0x0
    cmpeq r0, r2
    bls .L_8ec
    bl func_0204bdcc
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
.L_8ec:
    bl func_0204b85c
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_0204b39c
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_0204ab88
    bl func_0204987c
    ldrb r0, [r0, #0x1a6]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xa
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    strb r0, [r4, #0x16]
    bl func_0204f7ac
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x1a6]
    bl func_0204987c
    ldr r0, [r0, #0x474]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldr r0, [r0, #0x478]
    ldr r1, [r4, #0x474]
    blx r1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x000082ea
_LIT1: .word 0xfffec5d2
_LIT2: .word 0x00000bb8
_LIT3: .word 0x000061a8
_LIT4: .word 0x00001770
_LIT5: .word 0x00004a38
_LIT6: .word 0x00007530
_LIT7: .word 0xff403b3a
_LIT8: .word 0x00002710
