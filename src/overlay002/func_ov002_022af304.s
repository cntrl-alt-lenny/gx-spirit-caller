; func_ov002_022af304 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d0f98
        .extern data_ov002_022d1410
        .extern data_ov002_022d1910
        .extern func_02006194
        .extern func_0202cdf8
        .extern func_0207ef90
        .extern func_0207f05c
        .extern func_0208b0f0
        .extern func_020b3870
        .extern func_ov002_022a6e04
        .extern func_ov002_022ae284
        .extern func_ov002_022ae374
        .extern func_ov002_022af1f0
        .global func_ov002_022af304
        .arm
func_ov002_022af304:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x3c
    mov sl, r0
    mov r2, #0x0
.L_10:
    add r1, sl, r2, lsl #0x2
    ldr r0, [r1, #0x10]
    add r2, r2, #0x1
    add r0, r0, #0x1
    str r0, [r1, #0x10]
    cmp r2, #0x3
    blt .L_10
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1b
    mov r2, r0, lsr #0x1e
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    movne r0, #0xe7
    strne r0, [sp, #0x4]
    moveq r0, #0x0
    streq r0, [sp, #0x4]
    ldrh r0, [sl]
    cmp r0, #0x0
    beq .L_75c
    ldr r1, _LIT1
    add r0, sp, #0x14
    ldrh r5, [r1, #0x90]
    ldr r1, _LIT2
    mov r4, r5, lsl #0x12
    mov r2, r5, lsl #0x1f
    mov r3, r5, lsl #0x1a
    mov r4, r4, lsr #0x18
    mov r2, r2, lsr #0x1f
    mov r3, r3, lsr #0x1b
    strh r5, [sp, #0x10]
    str r4, [sp]
    bl func_ov002_022a6e04
    mov r2, #0x40000000
    mov r1, #0x6000
    ldr r6, [sp, #0x14]
    ldr r3, [sp, #0x18]
    ldr r0, _LIT3
    str r2, [sp, #0x24]
    strh r1, [sp, #0x28]
    ldr r0, [r0, #0xd0]
    str r6, [sp, #0x1c]
    str r3, [sp, #0x20]
    cmp r0, #0x1
    beq .L_16c
    ldr r1, [sl, #0x3c]
    mov r7, #0x0
    cmp r1, #0x0
    ble .L_540
    sub r0, r3, #0x1a
    mov r5, #0x400
    ldr r4, _LIT4
    mov r8, r7
    and r9, r0, #0xff
    rsb r5, r5, #0x0
    mov fp, #0xc
.L_f4:
    mul r0, r1, fp
    add r0, r0, r0, lsr #0x1f
    sub r0, r6, r0, asr #0x1
    ldr r1, [sp, #0x24]
    add r0, r0, r8
    mov r2, r0, lsl #0x17
    and r1, r1, r4
    orr r1, r1, r9
    orr r1, r1, r2, lsr #0x7
    ldrh r0, [sp, #0x28]
    str r1, [sp, #0x24]
    and r1, r0, r5
    add r0, sl, r7, lsl #0x2
    ldr r2, [r0, #0x1c]
    ldr r0, _LIT5
    mov r2, r2, lsl #0x7
    add r3, r2, #0x3b00
    mov r2, r3, asr #0x6
    add r2, r3, r2, lsr #0x19
    orr r1, r1, r2, asr #0x7
    strh r1, [sp, #0x28]
    add r1, sp, #0x24
    mov r2, #0x1
    bl func_0207f05c
    ldr r1, [sl, #0x3c]
    add r7, r7, #0x1
    add r8, r8, #0xc
    cmp r7, r1
    blt .L_f4
    b .L_540
.L_16c:
    ldr r1, [sl, #0x28]
    mov r0, #0x9000
    rsb r1, r1, #0x9
    bl func_020b3870
    mov r4, r0
    add r0, sp, #0x2c
    mov r1, r4
    mov r2, r4
    bl func_0208b0f0
    ldr r0, _LIT5
    add r1, sp, #0x2c
    bl func_0207ef90
    str r0, [sp, #0x8]
    mov r1, r4
    mov r0, #0x19000
    bl func_020b3870
    mov r5, r0
    ldr r0, [sp, #0x20]
    rsb r3, r5, #0x21
    sub r2, r0, #0xe
    rsb r0, r5, #0x20
    add r1, r0, r0, lsr #0x1f
    rsb r0, r3, #0x0
    add r0, r0, r0, lsr #0x1f
    str r0, [sp, #0xc]
    sub r0, r2, r5
    sub fp, r0, r1, asr #0x1
    ldr r0, [sl, #0x30]
    cmp r0, #0x1
    bne .L_1ec
    mov r0, sl
    bl func_ov002_022af1f0
.L_1ec:
    ldr r1, [sp, #0x24]
    ldr r0, _LIT6
    and r0, r1, r0
    orr r0, r0, #-2147483648
    str r0, [sp, #0x24]
    bl func_02006194
    cmp r0, #0x0
    beq .L_218
    ldr r0, [sl, #0x40]
    cmp r0, #0x0
    beq .L_3e8
.L_218:
    ldr r4, [sl, #0x2c]
    cmp r4, #0x0
    blt .L_3e8
    ldr r0, [sl, #0x28]
    cmp r0, #0x0
    bne .L_3e8
    ldr r0, [sl, #0x3c]
    mov r1, #0x19
    mul r2, r0, r1
    ldr r3, [sp, #0x1c]
    add r0, r2, r2, lsr #0x1f
    sub r0, r3, r0, asr #0x1
    mla r2, r4, r1, r0
    ldr r0, [sp, #0xc]
    ldr r1, _LIT7
    add r4, r2, r0, asr #0x1
    ldr r1, [r1, #0x38]
    ldr r3, [sp, #0x24]
    ldr r0, _LIT4
    and r2, fp, #0xff
    and r0, r3, r0
    mov r3, r4, lsl #0x17
    orr r0, r0, r2
    orr r0, r0, r3, lsr #0x7
    str r0, [sp, #0x24]
    tst r1, #0x10
    moveq r0, #0x1
    movne r0, #0x0
    mov r0, r0, lsl #0x9
    add r0, r0, #0x1880
    add r2, r0, #0x4000
    mov r0, #0x400
    mov r1, r2, asr #0x6
    add r1, r2, r1, lsr #0x19
    ldr r2, [sp, #0x24]
    ldrh r3, [sp, #0x28]
    bic r4, r2, #0xc00
    rsb r0, r0, #0x0
    and r0, r3, r0
    orr r0, r0, r1, asr #0x7
    strh r0, [sp, #0x28]
    ldrh r1, [sp, #0x28]
    ldr r0, _LIT5
    mov r2, #0x1
    bic r1, r1, #0xf000
    orr r3, r1, #0x1000
    add r1, sp, #0x24
    str r4, [sp, #0x24]
    strh r3, [sp, #0x28]
    bl func_0207f05c
    subs r0, fp, #0xc
    bmi .L_3e8
    ldr r0, [sl, #0x30]
    cmp r0, #0x0
    bne .L_3e8
    ldr r0, [sl, #0x3c]
    mov r1, #0x19
    mul r2, r0, r1
    add r0, r2, r2, lsr #0x1f
    ldr r3, [sp, #0x1c]
    ldr r2, [sl, #0x2c]
    sub r0, r3, r0, asr #0x1
    mla r1, r2, r1, r0
    ldr r0, [sl, #0x34]
    add r4, r1, #0xc
    add r0, r0, r0, lsr #0x1f
    mov r1, r0, asr #0x1
    subs r0, r4, r0, asr #0x1
    movmi r4, r1
    add r0, r4, r1
    cmp r0, #0x100
    rsbge r4, r1, #0x100
    mov r9, #0x0
    ldr r2, [sp, #0x24]
    ldr r0, _LIT6
    ldrh r1, [sp, #0x28]
    and r0, r2, r0
    orr r0, r0, #0x4000
    orr r0, r0, #-2147483648
    bic r2, r0, #0x2000
    bic r0, r1, #0xf000
    orr r1, r0, #0x7000
    bic r2, r2, #0xc00
    sub r0, fp, #0xc
    ldr r7, _LIT8
    str r2, [sp, #0x24]
    mov r6, r9
    strh r1, [sp, #0x28]
    and r8, r0, #0xff
.L_37c:
    ldr r0, [sl, #0x34]
    ldr r1, [sp, #0x24]
    add r0, r0, r0, lsr #0x1f
    sub r0, r4, r0, asr #0x1
    add r0, r0, r6
    mov r2, r0, lsl #0x17
    ldr r0, _LIT4
    and r0, r1, r0
    orr r0, r0, r8
    orr r0, r0, r2, lsr #0x7
    str r0, [sp, #0x24]
    mov r0, r7, asr #0x6
    add r1, r7, r0, lsr #0x19
    ldrh r2, [sp, #0x28]
    ldr r0, _LIT9
    and r0, r2, r0, asr #0x15
    orr r0, r0, r1, asr #0x7
    strh r0, [sp, #0x28]
    ldr r0, _LIT5
    add r1, sp, #0x24
    mov r2, #0x1
    bl func_0207f05c
    add r9, r9, #0x1
    add r6, r6, #0x20
    add r7, r7, #0x100
    cmp r9, #0x3
    blt .L_37c
.L_3e8:
    ldr r2, [sp, #0x24]
    ldr r0, _LIT6
    ldrh r1, [sp, #0x28]
    and r0, r2, r0
    orr r0, r0, #-2147483648
    orr r2, r0, #0x2000
    ldr r0, _LIT10
    bic r2, r2, #0xc00
    and r0, r2, r0
    bic r2, r1, #0xf000
    orr r1, r0, #0x100
    ldr r0, [sp, #0x8]
    orr r2, r2, #0x2000
    orr r0, r1, r0, lsl #0x19
    strh r2, [sp, #0x28]
    str r0, [sp, #0x24]
    ldr r0, [sl, #0x3c]
    mov r9, #0x0
    cmp r0, #0x0
    ble .L_510
    and r8, fp, #0xff
    mov r4, #0x400
    ldr fp, [sp, #0x1c]
    mov r7, r9
    rsb r4, r4, #0x0
.L_44c:
    ldr r1, [sl, #0x2c]
    mov r6, #0x0
    cmp r1, r9
    bne .L_48c
    ldr r1, [sl, #0x40]
    cmp r1, #0x0
    ldreq r1, [sl, #0x44]
    cmpeq r1, #0x0
    beq .L_48c
    ldr r1, [sl, #0x44]
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1f
    add r1, r2, r1, ror #0x1f
    rsb r6, r1, #0x1
.L_48c:
    mul r0, r5, r0
    add r0, r0, r0, lsr #0x1f
    sub r0, fp, r0, asr #0x1
    add r1, r0, r7
    ldr r0, [sp, #0xc]
    ldr r3, [sp, #0x24]
    ldr r2, _LIT4
    add r0, r1, r0, asr #0x1
    and r2, r3, r2
    mov r1, r0, lsl #0x17
    orr r2, r2, r8
    orr r1, r2, r1, lsr #0x7
    str r1, [sp, #0x24]
    add r1, sl, r9, lsl #0x2
    ldr r1, [r1, #0x1c]
    mov r0, sl
    bl func_ov002_022ae374
    ldrh r3, [sp, #0x28]
    add r1, r0, r6, lsl #0xa
    mov r0, r1, asr #0x6
    add r2, r1, r0, lsr #0x19
    and r3, r3, r4
    orr r2, r3, r2, asr #0x7
    strh r2, [sp, #0x28]
    ldr r0, _LIT5
    add r1, sp, #0x24
    mov r2, #0x1
    bl func_0207f05c
    ldr r0, [sl, #0x3c]
    add r9, r9, #0x1
    add r7, r7, r5
    cmp r9, r0
    blt .L_44c
.L_510:
    ldr r1, [sp, #0x24]
    ldr r0, _LIT10
    and r0, r1, r0
    str r0, [sp, #0x24]
    ldr r0, [sl, #0x28]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strne r0, [sl, #0x28]
    ldr r0, [sl, #0x30]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strne r0, [sl, #0x30]
.L_540:
    ldr r0, _LIT0
    ldrh r2, [sp, #0x28]
    ldr r0, [r0, #0x4]
    ldr r3, [sp, #0x24]
    mov r1, r0, lsl #0x1b
    ldr r0, _LIT6
    bic r2, r2, #0xf000
    orr r2, r2, #0x2000
    mov r1, r1, lsr #0x1e
    and r3, r3, r0
    add r0, r1, r1, lsr #0x1f
    mov r0, r0, asr #0x1
    mov r0, r0, lsl #0x4
    rsb r5, r0, #0xab
    strh r2, [sp, #0x28]
    orr r1, r3, #-2147483648
    orr r2, r1, #0x2000
    ldrh r1, [sp, #0x28]
    ldr r0, _LIT4
    bic r2, r2, #0xc00
    bic r1, r1, #0xc00
    orr r3, r1, #0x400
    and r2, r2, r0
    ldr r0, [sp, #0x4]
    and r1, r5, #0xff
    mov r4, r0, lsl #0x17
    orr r0, r2, r1
    orr r0, r0, r4, lsr #0x7
    strh r3, [sp, #0x28]
    str r0, [sp, #0x24]
    ldr r0, [sl, #0x38]
    cmp r0, #0x0
    bne .L_5d4
    ldr r0, [sl, #0x40]
    cmp r0, #0x0
    movne r2, #0x1
    bne .L_5d8
.L_5d4:
    mov r2, #0x0
.L_5d8:
    ldr r1, _LIT3
    mov r0, #0x400
    ldr r1, [r1, #0xc8]
    ldrh r3, [sp, #0x28]
    orr r1, r2, r1
    mov r1, r1, lsl #0xa
    add r1, r1, #0x1f80
    add r2, r1, #0x4000
    rsb r0, r0, #0x0
    mov r1, r2, asr #0x6
    and r3, r3, r0
    add r0, r2, r1, lsr #0x19
    orr r3, r3, r0, asr #0x7
    ldr r0, _LIT5
    add r1, sp, #0x24
    mov r2, #0x1
    strh r3, [sp, #0x28]
    bl func_0207f05c
    mov r0, #0x0
    bl func_ov002_022ae284
    cmp r0, #0x0
    beq .L_6ac
    ldr r2, [sp, #0x24]
    ldr r0, _LIT4
    sub r1, r5, #0x15
    and r2, r2, r0
    and r0, r1, #0xff
    orr r0, r2, r0
    orr r0, r0, r4, lsr #0x7
    str r0, [sp, #0x24]
    ldr r0, [sl, #0x38]
    cmp r0, #0x4
    bne .L_66c
    ldr r0, [sl, #0x40]
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_670
.L_66c:
    mov r0, #0x0
.L_670:
    mov r0, r0, lsl #0xa
    add r0, r0, #0x3f80
    add r2, r0, #0x4000
    mov r0, #0x400
    mov r1, r2, asr #0x6
    add r1, r2, r1, lsr #0x19
    ldrh r3, [sp, #0x28]
    rsb r0, r0, #0x0
    mov r2, #0x1
    and r0, r3, r0
    orr r3, r0, r1, asr #0x7
    ldr r0, _LIT5
    add r1, sp, #0x24
    strh r3, [sp, #0x28]
    bl func_0207f05c
.L_6ac:
    bl func_0202cdf8
    cmp r0, #0x0
    addeq sp, sp, #0x3c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    ldr r2, [sp, #0x24]
    ldr r1, [r0, #0x4]
    ldr r0, _LIT4
    mov r1, r1, lsl #0x1b
    mov r1, r1, lsr #0x1e
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    mov r1, r1, lsl #0x4
    rsb r1, r1, #0x10
    and r2, r2, r0
    and r0, r1, #0xff
    orr r0, r2, r0
    orr r0, r0, #0xe70000
    str r0, [sp, #0x24]
    ldr r0, [sl, #0x38]
    cmp r0, #0x1
    bne .L_714
    ldr r0, [sl, #0x40]
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_718
.L_714:
    mov r0, #0x0
.L_718:
    mov r0, r0, lsl #0xa
    add r0, r0, #0x2780
    add r2, r0, #0x4000
    mov r0, #0x400
    mov r1, r2, asr #0x6
    add r1, r2, r1, lsr #0x19
    ldrh r3, [sp, #0x28]
    rsb r0, r0, #0x0
    mov r2, #0x1
    and r0, r3, r0
    orr r3, r0, r1, asr #0x7
    ldr r0, _LIT5
    add r1, sp, #0x24
    strh r3, [sp, #0x28]
    bl func_0207f05c
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_75c:
    add r0, r2, r2, lsr #0x1f
    mov r0, r0, asr #0x1
    mov r0, r0, lsl #0x4
    rsb r5, r0, #0xab
    ldr r1, _LIT11
    ldr r0, _LIT4
    mov r3, #0x2400
    and r2, r1, r0
    ldr r0, [sp, #0x4]
    strh r3, [sp, #0x28]
    and r1, r5, #0xff
    mov r4, r0, lsl #0x17
    orr r0, r2, r1
    orr r0, r0, r4, lsr #0x7
    str r0, [sp, #0x24]
    ldr r0, [sl, #0x38]
    ldrh r3, [sp, #0x28]
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    mov r0, r0, lsl #0xa
    add r0, r0, #0x2f80
    add r2, r0, #0x4000
    mov r0, #0x400
    mov r1, r2, asr #0x6
    rsb r0, r0, #0x0
    add r1, r2, r1, lsr #0x19
    and r0, r3, r0
    orr r3, r0, r1, asr #0x7
    ldr r0, _LIT5
    add r1, sp, #0x24
    mov r2, #0x1
    strh r3, [sp, #0x28]
    bl func_0207f05c
    sub r1, r5, #0x15
    ldr r2, [sp, #0x24]
    ldr r0, _LIT4
    and r1, r1, #0xff
    and r0, r2, r0
    orr r0, r0, r1
    orr r0, r0, r4, lsr #0x7
    str r0, [sp, #0x24]
    ldr r0, [sl, #0x38]
    ldrh r3, [sp, #0x28]
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    mov r0, r0, lsl #0xa
    add r0, r0, #0x3780
    add r2, r0, #0x4000
    mov r0, #0x400
    mov r1, r2, asr #0x6
    rsb r0, r0, #0x0
    add r1, r2, r1, lsr #0x19
    and r0, r3, r0
    orr r3, r0, r1, asr #0x7
    ldr r0, _LIT5
    add r1, sp, #0x24
    mov r2, #0x1
    strh r3, [sp, #0x28]
    bl func_0207f05c
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_ov002_022d1910
_LIT2: .word data_ov002_022d1410
_LIT3: .word data_ov002_022d0f2c
_LIT4: .word 0xfe00ff00
_LIT5: .word data_ov002_022d0f98
_LIT6: .word 0x3fff3fff
_LIT7: .word data_021040ac
_LIT8: .word 0x00005c80
_LIT9: .word 0x80004000
_LIT10: .word 0xc1fffcff
_LIT11: .word 0x80002000
