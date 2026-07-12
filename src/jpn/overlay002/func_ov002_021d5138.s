; func_ov002_021d5138 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d0570
        .extern func_0202b824
        .extern func_ov002_021b3694
        .extern func_ov002_021b3784
        .extern func_ov002_021b9dec
        .extern func_ov002_021bad9c
        .extern func_ov002_021c4bbc
        .extern func_ov002_021d58dc
        .extern func_ov002_021d59c4
        .extern func_ov002_021d6168
        .extern func_ov002_021d8814
        .extern func_ov002_021de390
        .extern func_ov002_021e2ca4
        .extern func_ov002_021e788c
        .global func_ov002_021d5138
        .arm
func_ov002_021d5138:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8c
    mov r9, r0
    ldr r3, _LIT0
    and r5, r9, #0x1
    mov r8, r1
    mov r2, #0x14
    mul r4, r5, r3
    ldr r3, _LIT1
    mul r5, r8, r2
    add r2, r3, r4
    ldrh r2, [r5, r2]
    cmp r2, #0x0
    bne .L_40
    bl func_ov002_021d6168
    b .L_760
.L_40:
    ldr r2, _LIT2
    mov r3, #0x1
    bl func_ov002_021b3694
    str r0, [sp, #0x14]
    ldr r1, _LIT3
    mov r0, r9
    mvn r2, #0x0
    bl func_ov002_021bad9c
    str r0, [sp, #0x10]
    ldr r2, _LIT4
    mov r0, r9
    mov r1, r8
    mov r3, #0x0
    bl func_ov002_021b3784
    str r0, [sp, #0xc]
    mov r0, r9
    mov r1, r8
    add r2, sp, #0x60
    bl func_ov002_021c4bbc
    ldr r0, _LIT5
    add r0, r0, r4
    ldrh fp, [r5, r0]
    cmp fp, #0x0
    beq .L_760
    ldr r0, _LIT6
    add r0, r0, r4
    add r0, r0, r5
    str r0, [sp, #0x4]
    ldr r0, _LIT7
    sub r0, r0, #0x3
    str r0, [sp, #0x28]
    ldr r0, _LIT7
    add r0, r0, #0xe
    str r0, [sp, #0x20]
    ldr r0, _LIT7
    add r0, r0, #0xe
    str r0, [sp, #0x1c]
    ldr r0, _LIT7
    add r0, r0, #0x13
    str r0, [sp, #0x2c]
    ldr r0, _LIT7
    rsb r0, r0, #0x2f80
    str r0, [sp, #0x34]
    ldr r0, _LIT7
    add r0, r0, #0x13
    str r0, [sp, #0x30]
    ldr r0, _LIT7
    sub r0, r0, #0x3
    str r0, [sp, #0x24]
    ldr r0, _LIT7
    add r0, r0, #0x35
    str r0, [sp, #0x38]
    ldr r0, _LIT7
    add r0, r0, #0x384
    str r0, [sp, #0x44]
    ldr r0, _LIT8
    add r0, r0, #0x87
    str r0, [sp, #0x40]
    ldr r0, _LIT8
    add r0, r0, #0x87
    str r0, [sp, #0x3c]
.L_134:
    ldr r0, _LIT9
    mov r1, fp, lsl #0x3
    ldrh r0, [r0, r1]
    str r0, [sp, #0x8]
    ldr r0, _LIT9
    add r5, r0, fp, lsl #0x3
    ldr r0, [sp, #0x8]
    ldrh fp, [r5, #0x6]
    and sl, r0, #0xff
    mov r0, r0, asr #0x8
    and r6, r0, #0xff
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0x6
    bcc .L_758
    cmp r1, #0xa
    mov r1, #0x14
    mul r4, r6, r1
    ldr r2, _LIT0
    ldr r1, _LIT6
    and r3, sl, #0x1
    mla r1, r3, r2, r1
    add r1, r1, #0x30
    str r1, [sp, #0x18]
    ldr r1, [r1, r4]
    mov r1, r1, lsl #0x13
    mov r7, r1, lsr #0x13
    bcs .L_1b4
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1c
    beq .L_360
.L_1b4:
    cmp r6, #0x5
    blt .L_360
    mov r0, r7
    bl func_0202b824
    cmp r0, #0x17
    beq .L_360
    ldr r1, [sp, #0x14]
    ldr r0, _LIT10
    cmp r1, r0
    ldrne r0, [sp, #0x8]
    cmpne r1, r0
    beq .L_250
    ldr r0, [sp, #0x18]
    ldr r2, [r0, r4]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r6
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021d8814
    mov r0, sl
    mov r1, r6
    mov r2, #0x7
    mov r3, #0x1
    bl func_ov002_021e2ca4
    ldr r0, [sp, #0x14]
    ldr r3, _LIT2
    and r0, r0, #0xff
    cmp r0, sl
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, sl
    mov r1, r6
    bl func_ov002_021de390
    add sp, sp, #0x8c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_250:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_2cc
    ldr r0, [sp, #0x64]
    cmp r0, #0xf
    bne .L_2cc
    ldr r0, [sp, #0x18]
    ldr r2, [r0, r4]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r6
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021d8814
    mov r0, sl
    mov r1, r6
    mov r2, #0x7
    mov r3, #0x1
    bl func_ov002_021e2ca4
    cmp r9, sl
    movne r2, #0x1
    ldr r3, _LIT3
    moveq r2, #0x0
    mov r0, sl
    mov r1, r6
    bl func_ov002_021de390
    add sp, sp, #0x8c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2cc:
    ldr r1, [sp, #0xc]
    ldr r0, _LIT10
    cmp r1, r0
    beq .L_360
    ldr r0, [sp, #0x64]
    cmp r0, #0x7
    bne .L_360
    ldr r0, [sp, #0x18]
    ldr r2, [r0, r4]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r6
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021d8814
    mov r4, #0x0
    ldr r2, _LIT11
    mov r0, sl
    mov r1, r6
    mov r3, #0x5
    str r4, [sp]
    bl func_ov002_021d58dc
    ldr r0, [sp, #0xc]
    mov r2, #0x5
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    ldr r0, [sp, #0xc]
    and r1, r1, #0xff
    and r0, r0, #0xff
    mov r3, #0x1
    bl func_ov002_021e2ca4
    add sp, sp, #0x8c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_360:
    ldr r0, [sp, #0x4]
    ldr r1, [r0, #0x40]
    ldrh r0, [r0, #0x38]
    mov r2, r1, lsr #0x6
    and r2, r2, #0x1
    mvn r2, r2
    and r0, r0, r2
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_55c
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b9dec
    ldr r1, [sp, #0x1c]
    cmp r0, r1
    bgt .L_3e8
    ldr r1, [sp, #0x20]
    cmp r0, r1
    bge .L_4c0
    ldr r1, _LIT7
    cmp r0, r1
    bgt .L_55c
    ldr r1, [sp, #0x24]
    cmp r0, r1
    blt .L_55c
    ldr r1, [sp, #0x28]
    cmp r0, r1
    ldrne r1, _LIT7
    cmpne r0, r1
    beq .L_414
    b .L_55c
.L_3e8:
    ldr r1, [sp, #0x2c]
    cmp r0, r1
    bgt .L_404
    ldr r1, [sp, #0x30]
    cmp r0, r1
    beq .L_4c0
    b .L_55c
.L_404:
    ldr r1, [sp, #0x34]
    cmp r0, r1
    beq .L_4c0
    b .L_55c
.L_414:
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0xa
    bcs .L_434
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1c
    beq .L_55c
.L_434:
    cmp r6, #0x5
    blt .L_55c
    mov r0, r7
    bl func_0202b824
    cmp r0, #0x17
    beq .L_55c
    ldr r0, [sp, #0x18]
    ldr r2, [r0, r4]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r6
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021d8814
    mov r0, sl
    mov r1, r6
    mov r2, #0x7
    mov r3, #0x1
    bl func_ov002_021e2ca4
    cmp r9, sl
    movne r4, #0x1
    moveq r4, #0x0
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b9dec
    mov r3, r0
    mov r0, sl
    mov r1, r6
    mov r2, r4
    bl func_ov002_021de390
    add sp, sp, #0x8c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4c0:
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0xa
    bcs .L_4e0
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1c
    beq .L_55c
.L_4e0:
    cmp r6, #0x5
    blt .L_55c
    mov r0, r7
    bl func_0202b824
    cmp r0, #0x17
    bne .L_55c
    ldr r0, [sp, #0x18]
    ldr r2, [r0, r4]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r6
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021d8814
    mov r0, sl
    mov r1, r6
    mov r2, #0x7
    mov r3, #0x1
    bl func_ov002_021e2ca4
    cmp r9, sl
    movne r2, #0x1
    ldr r3, _LIT12
    moveq r2, #0x0
    mov r0, sl
    mov r1, r6
    bl func_ov002_021de390
    add sp, sp, #0x8c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_55c:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0xd
    addls pc, pc, r0, lsl #0x2
    b .L_758
    b .L_758
    b .L_758
    b .L_758
    b .L_758
    b .L_758
    b .L_758
    b .L_68c
    b .L_720
    b .L_758
    b .L_758
    b .L_5ac
    b .L_5ac
    b .L_758
    b .L_6e8
.L_5ac:
    mov r2, #0x0
    add r1, sp, #0x48
    str r2, [r1]
    str r2, [r1, #0x4]
    str r2, [r1, #0x8]
    str r2, [r1, #0xc]
    str r2, [r1, #0x10]
    str r2, [r1, #0x14]
    ldrh r2, [sp, #0x4a]
    mov r1, sl, lsl #0x10
    mov r1, r1, lsr #0x10
    ldr r0, [sp, #0x18]
    bic r2, r2, #0x1
    and r1, r1, #0x1
    orr r1, r2, r1
    strh r1, [sp, #0x4a]
    ldrh r2, [sp, #0x4a]
    mov r1, r6, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0x3e
    mov r1, r1, lsl #0x1b
    orr r1, r2, r1, lsr #0x1a
    ldr r0, [r0, r4]
    strh r1, [sp, #0x4a]
    ldrh r1, [sp, #0x4a]
    mov r2, r0, lsl #0x12
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    bic r1, r1, #0x3000
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    orr r1, r1, #0x1000
    strh r1, [sp, #0x4a]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldrh r3, [sp, #0x4c]
    ldr r1, _LIT13
    mov r0, r0, lsl #0x17
    and r1, r3, r1
    orr r0, r1, r0, lsr #0x11
    strh r0, [sp, #0x4c]
    add r0, sp, #0x48
    mov r1, r9
    mov r2, r8
    strh r7, [sp, #0x48]
    bl func_ov002_021e788c
    cmp r0, #0x0
    bne .L_758
    mov r2, #0x0
    mov r0, sl
    mov r1, r6
    mov r3, r2
    bl func_ov002_021de390
    add sp, sp, #0x8c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_68c:
    ldr r0, [sp, #0x18]
    ldr r0, [r0, r4]
    mov r0, r0, lsl #0x13
    mov r1, r0, lsr #0x13
    ldr r0, [sp, #0x38]
    cmp r1, r0
    ldrne r0, _LIT8
    cmpne r1, r0
    bne .L_758
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b9dec
    ldr r1, [sp, #0x3c]
    cmp r0, r1
    bne .L_758
    mov r2, #0x0
    mov r0, sl
    mov r1, r6
    mov r3, r2
    bl func_ov002_021de390
    add sp, sp, #0x8c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6e8:
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b9dec
    ldr r1, [sp, #0x40]
    cmp r0, r1
    bne .L_758
    mov r2, #0x0
    mov r0, sl
    mov r1, r6
    mov r3, r2
    bl func_ov002_021de390
    add sp, sp, #0x8c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_720:
    ldr r0, [sp, #0x44]
    cmp r7, r0
    bne .L_758
    ldr r0, [sp, #0x64]
    cmp r0, #0x7
    beq .L_758
    ldr r2, [sp, #0x8]
    mov r0, r9
    mov r1, r8
    mov r3, #0x1
    bl func_ov002_021d59c4
    add sp, sp, #0x8c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_758:
    cmp fp, #0x0
    bne .L_134
.L_760:
    mov r0, #0x0
    add sp, sp, #0x8c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4
_LIT2: .word 0x00001660
_LIT3: .word 0x000014ca
_LIT4: .word 0x0000184b
_LIT5: .word data_ov002_022cf0c6
_LIT6: .word data_ov002_022cf08c
_LIT7: .word 0x000014c7
_LIT8: .word 0x000019ed
_LIT9: .word data_ov002_022d0570
_LIT10: .word 0x0000ffff
_LIT11: .word 0x000017c2
_LIT12: .word 0x000014da
_LIT13: .word 0xffff803f
