; func_ov002_021c8870 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d0570
        .extern func_0202b824
        .extern func_ov002_021b3538
        .extern func_ov002_021b3ef8
        .extern func_ov002_021babc8
        .extern func_ov002_021c19f0
        .extern func_ov002_021c1c6c
        .extern func_ov002_021c8860
        .global func_ov002_021c8870
        .arm
func_ov002_021c8870:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x3c
    mov fp, r0
    ldr r3, _LIT0
    and r6, fp, #0x1
    mul r3, r6, r3
    mov r4, r1
    mov r5, #0x14
    str r3, [sp]
    mul r3, r4, r5
    str r3, [sp, #0x4]
    ldr r6, _LIT1
    ldr r3, [sp]
    mov r9, r2
    add r5, r6, r3
    ldr r3, [sp, #0x4]
    mov r6, #0x0
    add r3, r5, r3
    ldr r3, [r3, #0x30]
    mov r2, r3, lsl #0x13
    mov r2, r2, lsr #0x13
    str r2, [sp, #0x14]
    bl func_ov002_021c19f0
    str r0, [sp, #0x10]
    mov r0, fp
    mov r1, r4
    bl func_ov002_021c1c6c
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    addeq sp, sp, #0x3c
    moveq r0, r6
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_0202b824
    cmp r4, #0x5
    mov r7, r0
    movge r0, r7, lsl #0x10
    addge sp, sp, #0x3c
    movge r0, r0, lsr #0x10
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT2
    ldr r0, [sp]
    add r1, r1, r0
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, r1]
    cmp r0, #0x0
    moveq r0, r7, lsl #0x10
    addeq sp, sp, #0x3c
    moveq r0, r0, lsr #0x10
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT3
    ldr r0, [sp, #0x14]
    cmp r0, r1
    bne .L_110
    mov r0, fp
    mov r1, r4
    bl func_ov002_021b3538
    ldr r1, _LIT4
    cmp r0, r1
    beq .L_110
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c8860
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_110:
    ldr sl, _LIT5
    mov r5, #0x0
.L_118:
    ldr r1, _LIT0
    ldr r0, _LIT1
    and r2, r5, #0x1
    cmp fp, r5
    mla r8, r2, r1, r0
    mov r4, #0x0
    movne r0, #0x1
    moveq r0, r4
    add r1, r0, #0x1
    ldr r0, [sp, #0xc]
    and r0, r0, r1
    str r0, [sp, #0x8]
.L_148:
    mov r0, r5
    mov r1, r4
    mov r2, sl
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_194
    mov r0, r5
    mov r1, r4
    mov r2, sl
    mov r3, fp
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    beq .L_194
    ldrh r0, [r8, #0x34]
    cmp r0, r6
    ble .L_194
    cmp r9, r0
    movne r6, r0
    movne r7, #0xa
.L_194:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bgt .L_1d8
    mov r0, r5
    add r1, r4, #0x5
    add r2, sl, #0xb6
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_1d8
    ldrh r1, [r8, #0x98]
    cmp r1, r6
    ble .L_1d8
    cmp r9, r1
    ldrne r0, [r8, #0xa0]
    cmpne r0, #0x0
    movne r6, r1
    movne r7, r0
.L_1d8:
    add r8, r8, #0x14
    add r4, r4, #0x1
    cmp r4, #0x5
    blt .L_148
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_118
    ldr r1, _LIT6
    ldr r0, [sp]
    add r1, r1, r0
    ldr r0, [sp, #0x4]
    ldrh r5, [r0, r1]
    cmp r5, #0x0
    beq .L_4ac
    ldr r0, _LIT7
    add r0, r0, #0x5a
    str r0, [sp, #0x20]
    ldr r0, _LIT7
    add r0, r0, #0x54
    str r0, [sp, #0x1c]
    ldr r0, _LIT7
    sub r0, r0, #0x13c
    str r0, [sp, #0x18]
    ldr r0, _LIT7
    sub r0, r0, #0x13c
    str r0, [sp, #0x28]
    ldr r0, _LIT7
    sub r0, r0, #0x13c
    str r0, [sp, #0x24]
    ldr r0, _LIT7
    add r0, r0, #0x88
    str r0, [sp, #0x2c]
    ldr r0, _LIT8
    add r0, r0, #0xda
    str r0, [sp, #0x30]
    ldr r0, _LIT8
    add r0, r0, #0xda
    str r0, [sp, #0x34]
    ldr r0, _LIT8
    sub r0, r0, #0x290
    str r0, [sp, #0x38]
.L_27c:
    ldr r0, _LIT9
    mov r1, r5, lsl #0x3
    add r2, r0, r5, lsl #0x3
    ldrh r3, [r2, #0x2]
    ldrh r1, [r0, r1]
    ldrh r5, [r2, #0x6]
    mov r3, r3, lsl #0x1c
    mov r0, r1, asr #0x8
    mov r3, r3, lsr #0x1c
    and r8, r1, #0xff
    and r0, r0, #0xff
    cmp r3, #0xa
    addls pc, pc, r3, lsl #0x2
    b .L_4a4
    b .L_4a4
    b .L_2e0
    b .L_2e0
    b .L_2e0
    b .L_2e0
    b .L_300
    b .L_4a4
    b .L_4a4
    b .L_4a4
    b .L_4a4
    b .L_3d4
.L_2e0:
    ldr r0, _LIT7
    cmp r1, r0
    bne .L_4a4
    ldrh r0, [r2, #0x4]
    cmp r0, r6
    movgt r6, r0
    movgt r7, #0x1
    b .L_4a4
.L_300:
    ldr r0, [sp, #0x18]
    cmp r1, r0
    beq .L_350
    ldr r0, [sp, #0x1c]
    cmp r1, r0
    ldrne r0, [sp, #0x20]
    cmpne r1, r0
    bne .L_4a4
    cmp r6, #0x0
    bne .L_4a4
    ldr r0, _LIT9
    ldrh r2, [r2, #0x4]
    add r0, r0, r5, lsl #0x3
    ldrh r1, [r0, #0x6]
    mov r0, r2, asr #0x8
    and r7, r0, #0xff
    ldr r0, _LIT9
    add r0, r0, r1, lsl #0x3
    ldrh r5, [r0, #0x6]
    b .L_4a4
.L_350:
    cmp r6, #0x0
    bne .L_4a4
    ldr r1, [sp, #0x14]
    ldr r0, _LIT8
    cmp r1, r0
    bgt .L_398
    bge .L_3c4
    ldr r0, [sp, #0x24]
    cmp r1, r0
    bgt .L_388
    ldr r0, [sp, #0x28]
    cmp r1, r0
    moveq r7, #0x14
    b .L_4a4
.L_388:
    ldr r0, [sp, #0x2c]
    cmp r1, r0
    moveq r7, #0xe
    b .L_4a4
.L_398:
    ldr r0, [sp, #0x30]
    cmp r1, r0
    bgt .L_3b4
    ldr r0, [sp, #0x34]
    cmp r1, r0
    beq .L_3cc
    b .L_4a4
.L_3b4:
    ldr r0, _LIT10
    cmp r1, r0
    beq .L_3cc
    b .L_4a4
.L_3c4:
    mov r7, #0x2
    b .L_4a4
.L_3cc:
    mov r7, #0x7
    b .L_4a4
.L_3d4:
    ldr r2, _LIT0
    ldr r1, _LIT1
    and r3, r8, #0x1
    mla r2, r3, r2, r1
    mov r1, #0x14
    mla r4, r0, r1, r2
    ldr r0, [r4, #0x30]
    mov r0, r0, lsl #0x13
    movs sl, r0, lsr #0x13
    beq .L_4a4
    ldr r1, [r4, #0x40]
    ldrh r0, [r4, #0x38]
    mov r2, r1, lsr #0x6
    and r2, r2, #0x1
    mvn r2, r2
    and r0, r0, r2
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_4a4
    ldrh r0, [r4, #0x34]
    cmp r0, r6
    ble .L_4a4
    cmp r9, r0
    beq .L_4a4
    mov r0, sl
    bl func_0202b824
    cmp r0, #0x17
    bne .L_474
    cmp fp, r8
    movne r0, #0x1
    moveq r0, #0x0
    add r1, r0, #0x1
    ldr r0, [sp, #0xc]
    and r0, r0, r1
    cmp r0, #0x0
    bgt .L_4a4
    b .L_494
.L_474:
    cmp fp, r8
    movne r0, #0x1
    moveq r0, #0x0
    add r1, r0, #0x1
    ldr r0, [sp, #0x10]
    and r0, r0, r1
    cmp r0, #0x0
    bgt .L_4a4
.L_494:
    ldr r0, [sp, #0x38]
    cmp sl, r0
    ldreqh r6, [r4, #0x34]
    moveq r7, #0x1
.L_4a4:
    cmp r5, #0x0
    bne .L_27c
.L_4ac:
    mov r0, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x000019ed
_LIT4: .word 0x0000ffff
_LIT5: .word 0x000012a1
_LIT6: .word data_ov002_022cf0c6
_LIT7: .word 0x000015ae
_LIT8: .word 0x0000172f
_LIT9: .word data_ov002_022d0570
_LIT10: .word 0x00001aca
