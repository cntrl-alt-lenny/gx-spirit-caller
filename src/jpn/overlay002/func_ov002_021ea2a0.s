; func_ov002_021ea2a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_0202e2a4
        .extern func_0202e3d8
        .extern func_ov002_021b4538
        .extern func_ov002_021ba024
        .extern func_ov002_021bc7e8
        .extern func_ov002_021c4bbc
        .extern func_ov002_021c92ec
        .extern func_ov002_021e7658
        .extern func_ov002_021e8ce4
        .extern func_ov002_021e98b4
        .extern func_ov002_021e99d4
        .extern func_ov002_021eb874
        .extern func_ov002_021ed514
        .extern func_ov002_021f16e4
        .extern func_ov002_02257790
        .extern func_ov002_022577a0
        .global func_ov002_021ea2a0
        .arm
func_ov002_021ea2a0:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x2c
    mov r6, r0
    ldrh r0, [r6, #0x2]
    mov r5, r1
    mov r4, r2
    mov r3, r0, lsl #0x14
    mov r3, r3, lsr #0x1a
    cmp r3, #0x23
    addeq sp, sp, #0x2c
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc7e8
    cmp r0, #0x0
    beq .L_710
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r5
    beq .L_7c
    ldr r0, _LIT0
    mov r1, #0x14
    ldr r2, _LIT1
    and r3, r5, #0x1
    mul r1, r4, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_710
.L_7c:
    add r2, sp, #0x0
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c4bbc
    ldrh r2, [r6]
    ldr r3, _LIT2
    cmp r2, r3
    bgt .L_138
    bge .L_470
    ldr r1, _LIT3
    cmp r2, r1
    bgt .L_f4
    bge .L_30c
    sub r0, r3, #0x370
    cmp r2, r0
    bgt .L_d0
    bge .L_248
    sub r0, r1, #0x460
    cmp r2, r0
    beq .L_21c
    b .L_710
.L_d0:
    ldr r0, _LIT4
    cmp r2, r0
    bgt .L_e4
    beq .L_288
    b .L_710
.L_e4:
    add r0, r0, #0xa
    cmp r2, r0
    beq .L_2d0
    b .L_710
.L_f4:
    add r0, r1, #0x6d
    cmp r2, r0
    bgt .L_114
    bge .L_368
    add r0, r1, #0x67
    cmp r2, r0
    beq .L_350
    b .L_710
.L_114:
    add r0, r1, #0xb8
    cmp r2, r0
    bgt .L_128
    beq .L_3d8
    b .L_710
.L_128:
    add r0, r1, #0xf5
    cmp r2, r0
    beq .L_418
    b .L_710
.L_138:
    add r0, r3, #0x10c
    cmp r2, r0
    bgt .L_1c4
    bge .L_5bc
    add r0, r3, #0x58
    cmp r2, r0
    bgt .L_184
    add r0, r3, #0x57
    cmp r2, r0
    blt .L_174
    beq .L_4ec
    add r0, r3, #0x58
    cmp r2, r0
    beq .L_518
    b .L_710
.L_174:
    add r0, r3, #0x20
    cmp r2, r0
    beq .L_4d4
    b .L_710
.L_184:
    add r0, r3, #0xf3
    cmp r2, r0
    bgt .L_198
    beq .L_574
    b .L_710
.L_198:
    add r0, r3, #0xf5
    cmp r2, r0
    bgt .L_710
    add r0, r3, #0xf4
    cmp r2, r0
    blt .L_710
    beq .L_58c
    add r0, r3, #0xf5
    cmp r2, r0
    beq .L_5a4
    b .L_710
.L_1c4:
    ldr ip, _LIT5
    cmp r2, ip
    bgt .L_1f8
    bge .L_694
    ldr r3, _LIT6
    cmp r2, r3
    bgt .L_1e8
    beq .L_620
    b .L_710
.L_1e8:
    add r0, r3, #0xd9
    cmp r2, r0
    beq .L_654
    b .L_710
.L_1f8:
    add r0, ip, #0x7b
    cmp r2, r0
    bgt .L_20c
    beq .L_6ac
    b .L_710
.L_20c:
    add r0, ip, #0x7c
    cmp r2, r0
    beq .L_6f8
    b .L_710
.L_21c:
    ldr r0, [sp, #0x14]
    cmp r0, #0x3e8
    bgt .L_23c
    ldr r0, [sp, #0x8]
    cmp r0, #0x2
    addeq sp, sp, #0x2c
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, pc}
.L_23c:
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_248:
    ldr r0, [sp, #0x4]
    cmp r0, #0xf
    bne .L_710
    and r1, r5, #0xff
    and r0, r4, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    ldr r1, _LIT7
    mov r0, r6
    mov r2, r2, lsr #0x10
    bl func_ov002_022577a0
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_288:
    ldr r0, [sp, #0x4]
    cmp r0, #0x1
    bne .L_710
    and r1, r5, #0xff
    and r0, r4, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    ldr r3, [sp, #0x14]
    ldr r1, _LIT8
    mov r0, r6
    mov r2, r2, lsr #0x10
    strh r3, [r6, #0x8]
    bl func_ov002_022577a0
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_2d0:
    ldr r0, _LIT0
    ldr r1, _LIT9
    and r2, r5, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r4, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2a4
    cmp r0, #0x0
    moveq r0, #0x1
    add sp, sp, #0x2c
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_30c:
    ldr r0, [sp]
    bl func_0202e3d8
    cmp r0, #0x0
    beq .L_710
    and r1, r5, #0xff
    and r0, r4, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    ldr r1, _LIT10
    mov r0, r6
    mov r2, r2, lsr #0x10
    bl func_ov002_022577a0
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_350:
    ldr r0, [sp, #0x4]
    add sp, sp, #0x2c
    cmp r0, #0xa
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_368:
    ldr r2, [sp]
    add r0, r1, #0x6b
    cmp r2, r0
    bne .L_3ac
    and r1, r5, #0xff
    and r0, r4, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    ldr r1, _LIT11
    mov r0, r6
    mov r2, r2, lsr #0x10
    bl func_ov002_022577a0
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_3ac:
    add r0, r1, #0x6e
    cmp r2, r0
    bne .L_710
    ldr r1, _LIT12
    mov r0, r6
    bl func_ov002_02257790
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_3d8:
    ldr r0, [sp, #0x4]
    cmp r0, #0xd
    bne .L_710
    and r1, r5, #0xff
    and r0, r4, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    ldr r1, _LIT12
    mov r0, r6
    mov r2, r2, lsr #0x10
    bl func_ov002_022577a0
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_418:
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
    ldr r0, _LIT0
    mov r1, #0x14
    ldr r3, _LIT1
    and r6, r5, #0x1
    mul r1, r4, r1
    mla r0, r6, r0, r3
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    addeq sp, sp, #0x2c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ba024
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_470:
    ldr r2, _LIT9
    ldr r0, _LIT0
    and r1, r5, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    add r1, r2, #0x30
    mul r0, r4, r0
    ldr r1, [r1, r0]
    ldrh r2, [r6, #0x4]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r2, r2, lsl #0x11
    add r0, r0, r1, lsr #0x1f
    cmp r0, r2, lsr #0x17
    addeq sp, sp, #0x2c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    ldr r0, [sp, #0x4]
    add sp, sp, #0x2c
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_4d4:
    ldr r0, [sp, #0x10]
    add sp, sp, #0x2c
    cmp r0, #0x5
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_4ec:
    ldr r0, [sp, #0x14]
    cmp r0, #0x7d0
    blt .L_50c
    ldr r0, [sp, #0x8]
    cmp r0, #0x2
    addeq sp, sp, #0x2c
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, pc}
.L_50c:
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_518:
    ldr r0, [sp, #0xc]
    bl func_ov002_021b4538
    cmp r0, #0x1
    addgt sp, sp, #0x2c
    movgt r0, #0x1
    ldmgtia sp!, {r3, r4, r5, r6, pc}
    ldr r2, [sp, #0x8]
    cmp r2, #0x6
    addls pc, pc, r2, lsl #0x2
    b .L_710
    b .L_710
    b .L_710
    b .L_710
    b .L_55c
    b .L_55c
    b .L_55c
    b .L_55c
.L_55c:
    ldrh r1, [r6, #0x8]
    mov r0, #0x1
    add sp, sp, #0x2c
    tst r1, r0, lsl r2
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_574:
    mov r0, r5
    mov r1, r4
    mov r2, #0x3
    bl func_ov002_021c92ec
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_58c:
    mov r0, r5
    mov r1, r4
    mov r2, #0x4
    bl func_ov002_021c92ec
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_5a4:
    mov r0, r5
    mov r1, r4
    mov r2, #0x6
    bl func_ov002_021c92ec
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_5bc:
    ldr r2, _LIT9
    ldr r0, _LIT0
    and r1, r5, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    add r1, r2, #0x30
    mul r0, r4, r0
    ldr r1, [r1, r0]
    ldrh r2, [r6, #0x4]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r2, r2, lsl #0x11
    add r0, r0, r1, lsr #0x1f
    cmp r0, r2, lsr #0x17
    addeq sp, sp, #0x2c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    ldr r0, [sp, #0x4]
    add sp, sp, #0x2c
    cmp r0, #0xa
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_620:
    ldrh r0, [r6, #0xc]
    mov r1, r4
    cmp r0, #0x2
    mov r0, r5
    bcs .L_644
    sub r2, r3, #0xd
    bl func_ov002_021ba024
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_644:
    sub r2, r3, #0xc
    bl func_ov002_021ba024
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_654:
    ldr r0, [sp, #0x4]
    cmp r0, #0x10
    bne .L_710
    and r1, r5, #0xff
    and r0, r4, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    ldr r1, _LIT13
    mov r0, r6
    mov r2, r2, lsr #0x10
    bl func_ov002_022577a0
    cmp r0, #0x2
    movge r0, #0x1
    add sp, sp, #0x2c
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_694:
    ldr r0, [sp, #0x4]
    add sp, sp, #0x2c
    cmp r0, #0x9
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_6ac:
    mov r0, r5
    mov r1, r4
    add r2, r3, #0x118
    bl func_ov002_021ba024
    cmp r0, #0x0
    beq .L_710
    and r1, r5, #0xff
    and r0, r4, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    ldr r1, _LIT14
    mov r0, r6
    mov r2, r2, lsr #0x10
    bl func_ov002_022577a0
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_6f8:
    mov r0, r5
    mov r1, r4
    sub r2, ip, #0xfc
    bl func_ov002_021ba024
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_710:
    mov r0, #0x0
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4
_LIT2: .word 0x00001835
_LIT3: .word 0x0000169b
_LIT4: .word 0x000014e4
_LIT5: .word 0x00001aa3
_LIT6: .word 0x0000195c
_LIT7: .word func_ov002_021e8ce4
_LIT8: .word func_ov002_021e99d4
_LIT9: .word data_ov002_022cf08c
_LIT10: .word func_ov002_021ed514
_LIT11: .word func_ov002_021e98b4
_LIT12: .word func_ov002_021eb874
_LIT13: .word func_ov002_021f16e4
_LIT14: .word func_ov002_021e7658
