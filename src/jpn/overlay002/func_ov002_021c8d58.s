; func_ov002_021c8d58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d0570
        .extern func_0202b824
        .extern func_0202b83c
        .extern func_ov002_021b3538
        .extern func_ov002_021c19f0
        .extern func_ov002_021c1c6c
        .extern func_ov002_021c8d58
        .global func_ov002_021c8d58
        .arm
func_ov002_021c8d58:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x38
    mov sl, r0
    ldr r3, _LIT0
    and r5, sl, #0x1
    mul r3, r5, r3
    mov r7, r1
    mov r4, #0x14
    str r3, [sp, #0x8]
    mul r3, r7, r4
    str r3, [sp, #0x4]
    ldr r5, _LIT1
    ldr r3, [sp, #0x8]
    str r2, [sp]
    add r4, r5, r3
    ldr r3, [sp, #0x4]
    add r3, r4, r3
    ldr r3, [r3, #0x30]
    mov r4, #0x0
    mov r2, r3, lsl #0x13
    mov r6, r2, lsr #0x13
    bl func_ov002_021c19f0
    str r0, [sp, #0x14]
    mov r0, sl
    mov r1, r7
    bl func_ov002_021c1c6c
    str r0, [sp, #0x10]
    ldr r0, [sp]
    cmp r0, #0x0
    movne r1, r4
    strne r1, [r0]
    cmp r6, #0x0
    addeq sp, sp, #0x38
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r6
    bl func_0202b83c
    cmp r7, #0x5
    mov r5, r0
    addge sp, sp, #0x38
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT2
    ldr r1, [sp, #0x8]
    add r2, r2, r1
    ldr r1, [sp, #0x4]
    ldrh r1, [r1, r2]
    cmp r1, #0x0
    addeq sp, sp, #0x38
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT3
    cmp r6, r0
    bne .L_5f4
    mov r0, sl
    mov r1, r7
    bl func_ov002_021b3538
    ldr r1, _LIT4
    cmp r0, r1
    beq .L_5f4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    mov r2, #0x0
    bl func_ov002_021c8d58
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5f4:
    mov r3, #0x0
.L_5f8:
    ldr r2, _LIT1
    ldr r0, _LIT0
    and r1, r3, #0x1
    mla r0, r1, r0, r2
    cmp sl, r3
    add r7, r0, #0x94
    add r8, r0, #0x64
    movne r0, #0x1
    moveq r0, #0x0
    add r1, r0, #0x1
    ldr r0, [sp, #0x10]
    ldr fp, _LIT5
    mov r2, #0x5
    and r9, r0, r1
.L_630:
    cmp r9, #0x0
    bgt .L_694
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    cmp fp, r0, lsr #0x13
    bne .L_694
    ldr r1, [r8, #0x40]
    ldrh r0, [r8, #0x38]
    mov ip, r1, lsr #0x6
    and ip, ip, #0x1
    mvn ip, ip
    and r0, r0, ip
    mov ip, r1, lsr #0x2
    orr r1, ip, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_694
    ldrh r1, [r8, #0x34]
    cmp r1, r4
    ble .L_694
    ldr r0, [r8, #0x3c]
    cmp r0, #0x0
    movne r4, r1
    movne r5, r0
.L_694:
    add r7, r7, #0x14
    add r8, r8, #0x14
    add r2, r2, #0x1
    cmp r2, #0xa
    blt .L_630
    add r3, r3, #0x1
    cmp r3, #0x2
    blt .L_5f8
    ldr r1, _LIT6
    ldr r0, [sp, #0x8]
    add r1, r1, r0
    ldr r0, [sp, #0x4]
    ldrh r9, [r0, r1]
    cmp r9, #0x0
    beq .L_954
    ldr r1, _LIT1
    ldr r0, [sp, #0x8]
    add r1, r1, r0
    ldr r0, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0xc]
    ldr r0, _LIT7
    sub r0, r0, #0x6
    str r0, [sp, #0x18]
    ldr r0, _LIT8
    sub r0, r0, #0x32
    str r0, [sp, #0x28]
    ldr r0, _LIT8
    sub r0, r0, #0x32
    str r0, [sp, #0x2c]
    ldr r0, _LIT9
    rsb r0, r0, #0x3100
    str r0, [sp, #0x24]
    ldr r0, _LIT8
    sub r0, r0, #0x10c
    str r0, [sp, #0x1c]
    ldr r0, _LIT8
    sub r0, r0, #0x10c
    str r0, [sp, #0x20]
    ldr r0, _LIT10
    sub r0, r0, #0x17
    str r0, [sp, #0x34]
    ldr r0, _LIT7
    sub r0, r0, #0xda0
    str r0, [sp, #0x30]
.L_748:
    ldr r0, _LIT11
    mov r1, r9, lsl #0x3
    add r2, r0, r9, lsl #0x3
    ldrh r3, [r2, #0x2]
    ldrh r1, [r0, r1]
    ldrh r9, [r2, #0x6]
    mov r3, r3, lsl #0x1c
    mov r0, r1, asr #0x8
    mov r3, r3, lsr #0x1c
    and r7, r1, #0xff
    and r0, r0, #0xff
    cmp r3, #0x3
    beq .L_790
    cmp r3, #0x5
    beq .L_7b0
    cmp r3, #0xa
    beq .L_878
    b .L_94c
.L_790:
    ldr r0, _LIT8
    cmp r1, r0
    bne .L_94c
    ldrh r0, [r2, #0x4]
    cmp r0, r4
    ldrge r0, [sp, #0xc]
    ldrge r5, [r0, #0x3c]
    b .L_94c
.L_7b0:
    ldr r0, _LIT10
    cmp r1, r0
    beq .L_7fc
    ldr r0, [sp, #0x18]
    cmp r1, r0
    ldrne r0, _LIT7
    cmpne r1, r0
    bne .L_94c
    cmp r4, #0x0
    bne .L_94c
    ldr r0, _LIT11
    ldrh r2, [r2, #0x4]
    add r0, r0, r9, lsl #0x3
    ldrh r1, [r0, #0x6]
    ldr r0, _LIT11
    and r5, r2, #0xf
    add r0, r0, r1, lsl #0x3
    ldrh r9, [r0, #0x6]
    b .L_94c
.L_7fc:
    cmp r4, #0x0
    bne .L_94c
    ldr r0, [sp, #0x1c]
    cmp r6, r0
    bgt .L_840
    ldr r0, [sp, #0x20]
    cmp r6, r0
    bge .L_870
    ldr r0, _LIT10
    cmp r6, r0
    bgt .L_830
    beq .L_868
    b .L_94c
.L_830:
    ldr r0, [sp, #0x24]
    cmp r6, r0
    moveq r5, #0x3
    b .L_94c
.L_840:
    ldr r0, [sp, #0x28]
    cmp r6, r0
    bgt .L_85c
    ldr r0, [sp, #0x2c]
    cmp r6, r0
    beq .L_868
    b .L_94c
.L_85c:
    ldr r0, _LIT9
    cmp r6, r0
    bne .L_94c
.L_868:
    mov r5, #0x5
    b .L_94c
.L_870:
    mov r5, #0x2
    b .L_94c
.L_878:
    ldr r2, [sp, #0x30]
    ldr r1, _LIT1
    and r3, r7, #0x1
    mla r2, r3, r2, r1
    mov r1, #0x14
    mla r8, r0, r1, r2
    ldr r0, [r8, #0x30]
    mov r0, r0, lsl #0x13
    movs fp, r0, lsr #0x13
    beq .L_94c
    ldr r1, [r8, #0x40]
    ldrh r2, [r8, #0x38]
    mov r0, r1, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r0, r2, r0
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_94c
    ldrh r0, [r8, #0x34]
    cmp r0, r4
    ble .L_94c
    mov r0, fp
    bl func_0202b824
    cmp r0, #0x17
    bne .L_910
    cmp sl, r7
    movne r0, #0x1
    moveq r0, #0x0
    add r1, r0, #0x1
    ldr r0, [sp, #0x10]
    and r0, r0, r1
    cmp r0, #0x0
    bgt .L_94c
    b .L_930
.L_910:
    cmp sl, r7
    movne r0, #0x1
    moveq r0, #0x0
    add r1, r0, #0x1
    ldr r0, [sp, #0x14]
    and r0, r0, r1
    cmp r0, #0x0
    bgt .L_94c
.L_930:
    ldr r0, [sp, #0x34]
    cmp fp, r0
    bne .L_94c
    ldr r0, [r8, #0x3c]
    cmp r0, #0x0
    ldrneh r4, [r8, #0x34]
    movne r5, r0
.L_94c:
    cmp r9, #0x0
    bne .L_748
.L_954:
    ldr r0, [sp]
    cmp r0, #0x0
    strne r4, [r0]
    mov r0, r5
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x000019ed
_LIT4: .word 0x0000ffff
_LIT5: .word 0x0000171f
_LIT6: .word data_ov002_022cf0c6
_LIT7: .word 0x00001608
_LIT8: .word 0x0000183b
_LIT9: .word 0x00001aca
_LIT10: .word 0x00001472
_LIT11: .word data_ov002_022d0570
