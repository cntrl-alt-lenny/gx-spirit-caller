; func_ov005_021af1d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov005_021b1b8c
        .extern func_020aace8
        .extern func_ov005_021aee6c
        .global func_ov005_021af1d4
        .arm
func_ov005_021af1d4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r4, r0
    ldrsb r0, [r4, #0x48]
    mov fp, #0x0
    cmp r0, #0x0
    moveq r0, fp
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_5bc
    ldr r3, _LIT1
    ldr r2, [r4, #0x8]
    mov r6, #0x1
    ldrb r8, [r3]
    ldrb r5, [r3, #0x1]
    mov r3, r6, lsl r2
    and r7, r3, #0x19
    add r9, r5, r8, lsl #0x8
    mov r0, fp
    mov r1, fp
    add sl, r4, #0x48
    mov r3, #0xc
    mov r5, #0xa
    mov ip, fp
    b .L_408
.L_3d4:
    add r8, r4, r1
    ldrsb r8, [r8, #0x48]
    cmp r8, #0x0
    beq .L_400
    add lr, sl, r1
    ldrb r8, [sl, r1]
    ldrb lr, [lr, #0x1]
    add r8, lr, r8, lsl #0x8
    cmp r9, r8
    movne fp, #0x1
    bne .L_430
.L_400:
    add r1, r1, #0x2
    add r0, r0, #0x1
.L_408:
    mov r8, ip
    cmp r2, #0x4
    bhi .L_41c
    cmp r7, #0x0
    movne r8, r6
.L_41c:
    cmp r8, #0x0
    movne r8, r5
    moveq r8, r3
    cmp r0, r8
    blt .L_3d4
.L_430:
    cmp r2, #0x4
    bhi .L_44c
    mov r1, #0x1
    mov r1, r1, lsl r2
    tst r1, #0x19
    movne r1, #0xa
    bne .L_450
.L_44c:
    mov r1, #0xc
.L_450:
    subs r2, r1, #0x1
    bmi .L_4a8
    ldr r3, _LIT1
    mov r1, r2, lsl #0x1
    ldrb r5, [r3]
    ldrb r3, [r3, #0x1]
    add r7, r4, #0x48
    add r6, r3, r5, lsl #0x8
.L_470:
    add r3, r4, r1
    ldrsb r3, [r3, #0x48]
    cmp r3, #0x0
    beq .L_49c
    add r3, r7, r1
    ldrb r5, [r7, r1]
    ldrb r3, [r3, #0x1]
    add r3, r3, r5, lsl #0x8
    cmp r6, r3
    movne fp, #0x1
    bne .L_4a8
.L_49c:
    sub r1, r1, #0x2
    subs r2, r2, #0x1
    bpl .L_470
.L_4a8:
    cmp r0, r2
    bgt .L_540
    mov sl, #0x0
    add r1, r2, #0x1
    sub r9, r1, r0
    mov r8, sl
    mov r3, #0x1
    mov r1, #0xc
    mov r2, #0xa
    mov lr, sl
    mov ip, sl
    b .L_510
.L_4d8:
    cmp sl, r9
    addge r5, r4, r8
    strgeb lr, [r5, #0x48]
    strgeb lr, [r5, #0x49]
    bge .L_508
    add r5, sl, r0
    add r7, r4, r5, lsl #0x1
    ldrsb r5, [r7, #0x48]
    add r6, r4, r8
    strb r5, [r6, #0x48]
    ldrsb r5, [r7, #0x49]
    strb r5, [r6, #0x49]
.L_508:
    add r8, r8, #0x2
    add sl, sl, #0x1
.L_510:
    ldr r6, [r4, #0x8]
    mov r5, ip
    cmp r6, #0x4
    bhi .L_52c
    mov r6, r3, lsl r6
    tst r6, #0x19
    movne r5, r3
.L_52c:
    cmp r5, #0x0
    movne r5, r2
    moveq r5, r1
    cmp sl, r5
    blt .L_4d8
.L_540:
    add r0, r4, #0x48
    bl func_020aace8
    ldrh r1, [r4, #0x28]
    mov r2, r0, lsr #0x1
    cmp r1, r0, lsr #0x1
    strgth r2, [r4, #0x28]
    ldr r3, [r4, #0x8]
    mov r2, #0x0
    cmp r3, #0x4
    bhi .L_578
    mov r0, #0x1
    mov r1, r0, lsl r3
    tst r1, #0x19
    movne r2, r0
.L_578:
    ldrh r0, [r4, #0x28]
    cmp r2, #0x0
    movne r1, #0xa
    moveq r1, #0xc
    cmp r0, r1
    blt .L_778
    cmp r3, #0x4
    bhi .L_5ac
    mov r0, #0x1
    mov r0, r0, lsl r3
    tst r0, #0x19
    movne r0, #0xa
    bne .L_5b0
.L_5ac:
    mov r0, #0xc
.L_5b0:
    sub r0, r0, #0x1
    strh r0, [r4, #0x28]
    b .L_778
.L_5bc:
    ldr r0, [r4, #0x8]
    mov r5, #0x1
    mov r2, r5, lsl r0
    and r6, r2, #0x19
    mov r1, fp
    mov r2, #0xc
    mov r3, #0xa
    mov r7, fp
    b .L_5fc
.L_5e0:
    add r8, r4, r1
    ldrsb r8, [r8, #0x48]
    cmp r8, #0x0
    cmpne r8, #0x20
    movne fp, #0x1
    bne .L_624
    add r1, r1, #0x1
.L_5fc:
    mov r8, r7
    cmp r0, #0x4
    bhi .L_610
    cmp r6, #0x0
    movne r8, r5
.L_610:
    cmp r8, #0x0
    movne r8, r3
    moveq r8, r2
    cmp r1, r8, lsl #0x1
    blt .L_5e0
.L_624:
    cmp r0, #0x4
    bhi .L_640
    mov r2, #0x1
    mov r0, r2, lsl r0
    tst r0, #0x19
    movne r0, #0xa
    bne .L_644
.L_640:
    mov r0, #0xc
.L_644:
    mov r0, r0, lsl #0x1
    subs r2, r0, #0x1
    bmi .L_670
.L_650:
    add r0, r4, r2
    ldrsb r0, [r0, #0x48]
    cmp r0, #0x0
    cmpne r0, #0x20
    movne fp, #0x1
    bne .L_670
    subs r2, r2, #0x1
    bpl .L_650
.L_670:
    cmp r1, r2
    bgt .L_700
    add r2, r2, #0x1
    add r0, r4, r1
    sub r1, r2, r1
    mov r2, #0x0
    mov r6, #0x1
    mov r3, #0xc
    mov r5, #0xa
    mov r9, r2
    mov r8, r2
    b .L_6d0
.L_6a0:
    cmp r2, r1
    addge r7, r4, r2
    strgeb r9, [r7, #0x48]
    strgeb r9, [r7, #0x68]
    bge .L_6c8
    ldrsb r7, [r0, #0x48]
    add sl, r4, r2
    strb r7, [sl, #0x48]
    ldrb r7, [r0, #0x68]
    strb r7, [sl, #0x68]
.L_6c8:
    add r0, r0, #0x1
    add r2, r2, #0x1
.L_6d0:
    ldr r7, [r4, #0x8]
    mov sl, r8
    cmp r7, #0x4
    bhi .L_6ec
    mov r7, r6, lsl r7
    tst r7, #0x19
    movne sl, r6
.L_6ec:
    cmp sl, #0x0
    movne r7, r5
    moveq r7, r3
    cmp r2, r7, lsl #0x1
    blt .L_6a0
.L_700:
    add r0, r4, #0x48
    bl func_020aace8
    ldrh r1, [r4, #0x28]
    mov r2, #0x0
    cmp r1, r0
    strgth r0, [r4, #0x28]
    ldr r3, [r4, #0x8]
    cmp r3, #0x4
    bhi .L_734
    mov r0, #0x1
    mov r1, r0, lsl r3
    tst r1, #0x19
    movne r2, r0
.L_734:
    ldrh r0, [r4, #0x28]
    cmp r2, #0x0
    movne r1, #0xa
    moveq r1, #0xc
    cmp r0, r1, lsl #0x1
    blt .L_778
    cmp r3, #0x4
    bhi .L_768
    mov r0, #0x1
    mov r0, r0, lsl r3
    tst r0, #0x19
    movne r0, #0xa
    bne .L_76c
.L_768:
    mov r0, #0xc
.L_76c:
    mov r0, r0, lsl #0x1
    sub r0, r0, #0x1
    strh r0, [r4, #0x28]
.L_778:
    mov r0, r4
    bl func_ov005_021aee6c
    mov r0, fp
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_ov005_021b1b8c
