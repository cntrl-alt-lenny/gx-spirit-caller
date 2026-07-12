; func_ov002_02210bf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_0202b0ac
        .extern func_ov002_021ae320
        .extern func_ov002_021ae3a4
        .extern func_ov002_021ae584
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021afff0
        .extern func_ov002_021c8390
        .extern func_ov002_021ca1d8
        .extern func_ov002_021d8198
        .extern func_ov002_021de318
        .extern func_ov002_021dea38
        .extern func_ov002_021df728
        .extern func_ov002_021e277c
        .extern func_ov002_02210b00
        .extern func_ov002_022535a4
        .extern func_ov002_02253600
        .extern func_ov002_02257790
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .extern func_ov002_0226b13c
        .extern func_ov002_0227acc8
        .extern func_ov002_0229cd4c
        .global func_ov002_02210bf8
        .arm
func_ov002_02210bf8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x300
    mov r8, r0
    ldrh r1, [r8, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    addne sp, sp, #0x300
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x78
    bgt .L_94
    bge .L_24c
    cmp r1, #0x6d
    bgt .L_88
    subs r0, r1, #0x5f
    addpl pc, pc, r0, lsl #0x2
    b .L_45c
    b .L_420
    b .L_3f8
    b .L_3b0
    b .L_45c
    b .L_384
    b .L_35c
    b .L_45c
    b .L_45c
    b .L_45c
    b .L_45c
    b .L_45c
    b .L_45c
    b .L_45c
    b .L_45c
    b .L_324
.L_88:
    cmp r1, #0x77
    beq .L_2bc
    b .L_45c
.L_94:
    cmp r1, #0x7f
    bgt .L_ac
    bge .L_f8
    cmp r1, #0x7e
    beq .L_128
    b .L_45c
.L_ac:
    cmp r1, #0x80
    bne .L_45c
    ldrh r1, [r8, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_e4
    mov r0, #0x2
    bl func_ov002_021afff0
    ldr r1, _LIT2
    str r0, [r1, #0xd44]
    b .L_ec
.L_e4:
    mov r0, #0x38
    bl func_ov002_021ae584
.L_ec:
    add sp, sp, #0x300
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_f8:
    ldrh r1, [r8, #0x2]
    ldr r0, _LIT2
    mov r2, #0x1
    mov r4, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    ldr r3, [r0, #0xd44]
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b13c
    add sp, sp, #0x300
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_128:
    ldr r1, _LIT3
    ldrh r1, [r1, #0xb2]
    cmp r1, #0x0
    beq .L_1b0
    ldrh r1, [r8, #0x2]
    mov r2, #0x1f
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    mov r1, r1, lsl #0x4
    mov r1, r2, lsl r1
    bl func_ov002_021de318
    ldrh r0, [r8, #0x2]
    ldrh r1, [r8]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02253600
    cmp r0, #0x0
    ble .L_240
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    beq .L_240
    ldr r1, _LIT4
    mov r0, r8
    bl func_ov002_02257790
    cmp r0, #0x0
    beq .L_240
    add sp, sp, #0x300
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1b0:
    mov r6, #0x0
    ldr r4, _LIT5
    ldr r9, _LIT6
    mov r5, r6
    mov r7, r6
.L_1c4:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r9, r4
    add r1, r1, r7
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    beq .L_1f8
    mov r1, r5
    bl func_ov002_021c8390
    add r6, r6, r0
.L_1f8:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r7, r7, #0x14
    blt .L_1c4
    ldrh r1, [r8, #0x2]
    mov r2, #0x1f
    mov r0, r8
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x4
    mov r1, r2, lsl r1
    bl func_ov002_021de318
    ldrh r1, [r8, #0x2]
    mov r0, r8
    mov r2, r6, asr #0x1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021df728
.L_240:
    add sp, sp, #0x300
    mov r0, #0xa
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_24c:
    ldrh r1, [r8, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_278
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_2b0
.L_278:
    ldr r0, _LIT7
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x100
    mov r1, #0x39
    bl func_ov002_0229cd4c
    ldr r0, _LIT8
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x200
    add r1, sp, #0x100
    bl func_ov002_0229cd4c
    add r0, sp, #0x200
    bl func_ov002_021ae3a4
.L_2b0:
    add sp, sp, #0x300
    mov r0, #0x77
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2bc:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    addeq sp, sp, #0x300
    moveq r0, #0xa
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT7
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0x13
    bl func_ov002_0229cd4c
    ldrh r0, [r8, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldrh r0, [r8, #0x2]
    ldr r2, _LIT4
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    add sp, sp, #0x300
    mov r0, #0x6d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_324:
    bl func_ov002_0225930c
    cmp r0, #0x0
    addeq sp, sp, #0x300
    moveq r0, #0x77
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT2
    ldr r2, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr r0, [r0, #0xd70]
    add r1, r2, r1
    bl func_ov002_021dea38
    add sp, sp, #0x300
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_35c:
    ldrh r0, [r8, #0x2]
    ldrh r2, [r8]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af8f0
    add sp, sp, #0x300
    mov r0, #0x63
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_384:
    bl func_ov002_021afa94
    ldrh r3, [r8, #0x2]
    mov r1, r0
    mov r2, #0x1
    mov r0, r3, lsl #0x1f
    mov r3, r2
    mov r0, r0, lsr #0x1f
    bl func_ov002_0227acc8
    add sp, sp, #0x300
    mov r0, #0x61
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_3b0:
    ldrh r0, [r8, #0x2]
    ldr r1, _LIT8
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022535a4
    cmp r0, #0x0
    addle sp, sp, #0x300
    movle r0, #0xa
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r0, [r8, #0x2]
    mov r1, #0x3c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    add sp, sp, #0x300
    mov r0, #0x60
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_3f8:
    ldrh r0, [r8, #0x2]
    ldr r2, _LIT8
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af8f0
    add sp, sp, #0x300
    mov r0, #0x5f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_420:
    bl func_ov002_021afa94
    ldrh r2, [r8, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8198
    cmp r0, #0x0
    beq .L_450
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
.L_450:
    add sp, sp, #0x300
    mov r0, #0xa
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_45c:
    mov r0, #0x0
    add sp, sp, #0x300
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d008c
_LIT3: .word data_ov002_022d0d8c
_LIT4: .word func_ov002_02210b00
_LIT5: .word data_ov002_022cf08c
_LIT6: .word 0x00000868
_LIT7: .word 0x00000fc9
_LIT8: .word 0x0000146e
