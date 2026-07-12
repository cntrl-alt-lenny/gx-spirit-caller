; func_ov002_0225e244 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd340
        .extern data_ov002_022cd3b0
        .extern data_ov002_022d008c
        .extern func_ov002_021b4040
        .extern func_ov002_021bacd0
        .extern func_ov002_021d5a90
        .extern func_ov002_021de390
        .extern func_ov002_021deda4
        .extern func_ov002_021df848
        .extern func_ov002_021df990
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021e2fc4
        .extern func_ov002_02244efc
        .global func_ov002_0225e244
        .arm
func_ov002_0225e244:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x34
    mov sl, r0
    ldr r1, _LIT0
    ldr r6, _LIT1
    mov r0, #0x38
    rsb r5, sl, #0x1
    ldr r3, [r1, #0xd30]
    ldr r2, _LIT2
    mla r4, sl, r0, r6
    mla r7, r5, r0, r6
    cmp r3, #0x0
    ldr r6, [r2, #0x4]
    beq .L_21a0
    cmp r3, #0x1
    beq .L_2264
    cmp r3, #0x2
    beq .L_2278
    b .L_2654
.L_21a0:
    ldr r0, [r2, #0x14]
    cmp r0, #0x0
    bne .L_2248
    bl func_ov002_021e2a4c
    ldr r6, _LIT2
    ldr r8, [sp]
    ldr r4, _LIT3
    mov r5, #0x0
    mov r7, #0xe
.L_21c4:
    ldr r0, [r6, #0x9c]
    cmp r0, #0x0
    beq .L_2234
    cmp r0, r4
    movhi r0, r4
    ldr r3, [r6, #0xa0]
    ldr r2, [r6, #0xa4]
    and r1, r8, r4, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r8, r1, r0, lsr #0x10
    ldr r1, [r6, #0xa8]
    ldr r0, [r6, #0xac]
    bic r8, r8, #0x10000
    mov r3, r3, lsl #0x1f
    orr r3, r8, r3, lsr #0xf
    bic r3, r3, #0x1e0000
    mov r2, r2, lsl #0x1c
    orr r2, r3, r2, lsr #0xb
    bic r2, r2, #0x200000
    mov r1, r1, lsl #0x1f
    orr r1, r2, r1, lsr #0xa
    bic r1, r1, #0x3c00000
    mov r0, r0, lsl #0x1c
    orr r8, r1, r0, lsr #0x6
    mov r0, r7
    mov r1, r8
    str r8, [sp]
    bl func_ov002_02244efc
.L_2234:
    add r5, r5, #0x1
    cmp r5, #0x2
    add r6, r6, #0x14
    blt .L_21c4
    bl func_ov002_021e2b6c
.L_2248:
    ldr r1, _LIT0
    add sp, sp, #0x34
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2264:
    add r0, r3, #0x1
    str r0, [r1, #0xd30]
    add sp, sp, #0x34
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2278:
    bl func_ov002_021e2a4c
    ldr r0, [r4, #0x10]
    ldr r1, _LIT4
    cmp r0, r1
    beq .L_229c
    ldr r1, _LIT5
    cmp r0, r1
    beq .L_22c8
    b .L_2330
.L_229c:
    mov r0, r4
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_2330
    ldr r0, _LIT2
    ldr r2, _LIT4
    ldr r1, [r0, #0x1c]
    mov r0, sl
    mov r3, #0x1
    bl func_ov002_021d5a90
    b .L_2330
.L_22c8:
    ldr r2, _LIT2
    ldr r1, [r2, #0x8]
    cmp r1, #0x0
    ldreq r1, _LIT0
    ldreq r3, [r1, #0xcec]
    cmpeq r3, sl
    ldreq r1, [r1, #0xcf8]
    cmpeq r1, #0x3
    ldreq r1, [r7, #0x2c]
    cmpeq r1, #0x0
    bne .L_2330
    mov r3, sl, lsl #0x1f
    ldr r1, [r2, #0x1c]
    and r2, r3, #-2147483648
    orr r3, r2, #0xe200000
    mov r2, r1, lsl #0x10
    ldr r1, [r4, #0xc]
    orr r3, r3, #0x10000000
    and r2, r2, #0x1f0000
    mov r1, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r2, r3, r2
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e2fc4
.L_2330:
    ldr r0, [r7, #0x2c]
    cmp r0, #0x0
    cmpne sl, r6
    beq .L_2418
    ldr r0, _LIT2
    ldr r0, [r0, #0xd8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_2418
    ldr r0, [r4, #0x10]
    ldr r3, _LIT6
    cmp r0, r3
    bgt .L_2398
    bge .L_23d8
    ldr r1, _LIT7
    cmp r0, r1
    bgt .L_2388
    bge .L_23d8
    ldr r1, _LIT8
    cmp r0, r1
    beq .L_23d8
    b .L_2418
.L_2388:
    add r1, r1, #0x118
    cmp r0, r1
    beq .L_23d8
    b .L_2418
.L_2398:
    ldr r2, _LIT9
    cmp r0, r2
    bgt .L_23cc
    sub r1, r2, #0x1
    cmp r0, r1
    blt .L_23bc
    cmpne r0, r2
    beq .L_23d8
    b .L_2418
.L_23bc:
    add r1, r3, #0x3b
    cmp r0, r1
    beq .L_23d8
    b .L_2418
.L_23cc:
    add r1, r2, #0xbf
    cmp r0, r1
    bne .L_2418
.L_23d8:
    ldr r1, _LIT2
    mov r2, sl, lsl #0x1f
    ldr r1, [r1, #0x1c]
    and r2, r2, #-2147483648
    orr r3, r2, #0xe200000
    mov r2, r1, lsl #0x10
    ldr r1, [r4, #0xc]
    orr r3, r3, #0x10000000
    and r2, r2, #0x1f0000
    mov r1, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r2, r3, r2
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e2fc4
.L_2418:
    ldr r0, [r4, #0x2c]
    cmp r0, #0x0
    cmpne sl, r6
    beq .L_2488
    ldr r2, _LIT2
    ldr r0, [r2, #0xc4]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_2488
    ldr r0, [r7, #0x10]
    ldr r1, _LIT8
    cmp r0, r1
    bne .L_2488
    mov r3, r6, lsl #0x1f
    ldr r1, [r2, #0x20]
    and r2, r3, #-2147483648
    orr r3, r2, #0xe200000
    mov r2, r1, lsl #0x10
    ldr r1, [r7, #0xc]
    orr r3, r3, #0x10000000
    and r2, r2, #0x1f0000
    mov r1, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r2, r3, r2
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e2fc4
.L_2488:
    ldr r4, _LIT10
    mov r5, #0x0
.L_2490:
    mov r0, r4
    bl func_ov002_021df990
    add r5, r5, #0x1
    cmp r5, #0x2
    add r4, r4, #0x14
    blt .L_2490
    ldr r5, _LIT11
    ldr r4, _LIT0
    mov r9, #0x0
    mov fp, #0xb
.L_24b8:
    ldr r0, [r4, #0xcec]
    mov r1, fp
    eor r8, r0, r9
    mov r0, r8
    mov r2, r5
    bl func_ov002_021b4040
    mov r1, r0
    cmp r1, #0x0
    ble .L_24ec
    mov r2, #0x1
    mov r3, r5
    rsb r0, r8, #0x1
    bl func_ov002_021df848
.L_24ec:
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_24b8
    ldr r0, _LIT2
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_2634
    mov r0, r7
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_2634
    ldr r2, [r7, #0x10]
    ldr r0, _LIT12
    cmp r2, r0
    beq .L_25b0
    ldr r0, _LIT13
    cmp r2, r0
    bne .L_2634
    ldr r0, [r7, #0x8]
    cmp r0, #0x0
    beq .L_2634
    ldr r0, [r7, #0x2c]
    cmp r0, #0x0
    beq .L_2594
    add r0, sp, #0x1c
    mov r3, #0x0
    str r3, [r0]
    ldrh r2, [sp, #0x1e]
    mov r1, r6, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0x1
    and r1, r1, #0x1
    orr r2, r2, r1
    mov r1, #0x1
    str r3, [r0, #0x4]
    str r3, [r0, #0x8]
    str r3, [r0, #0xc]
    str r3, [r0, #0x10]
    str r3, [r0, #0x14]
    strh r2, [sp, #0x1e]
    bl func_ov002_021deda4
    b .L_2634
.L_2594:
    ldr r0, _LIT2
    mov r2, #0x0
    ldr r1, [r0, #0x20]
    mov r0, r6
    mov r3, r2
    bl func_ov002_021de390
    b .L_2634
.L_25b0:
    ldr r0, [r7, #0x8]
    cmp r0, #0x0
    bne .L_2634
    cmp sl, r6
    beq .L_2634
    ldr r0, [r7, #0x2c]
    cmp r0, #0x0
    beq .L_261c
    add r0, sp, #0x4
    mov r4, #0x0
    str r4, [r0]
    ldrh r3, [sp, #0x6]
    mov r1, r6, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r3, r3, #0x1
    and r1, r1, #0x1
    orr r3, r3, r1
    mov r1, #0x1
    str r4, [r0, #0x4]
    str r4, [r0, #0x8]
    str r4, [r0, #0xc]
    str r4, [r0, #0x10]
    str r4, [r0, #0x14]
    strh r2, [sp, #0x4]
    strh r3, [sp, #0x6]
    bl func_ov002_021deda4
    b .L_2634
.L_261c:
    ldr r0, _LIT2
    mov r2, #0x0
    ldr r1, [r0, #0x20]
    mov r0, r6
    mov r3, r2
    bl func_ov002_021de390
.L_2634:
    bl func_ov002_021e2b6c
    ldr r1, _LIT0
    add sp, sp, #0x34
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2654:
    mov r0, #0x1
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd340
_LIT2: .word data_ov002_022cd314
_LIT3: .word 0x0000ffff
_LIT4: .word 0x000012ac
_LIT5: .word 0x000013cb
_LIT6: .word 0x00001826
_LIT7: .word 0x000016cb
_LIT8: .word 0x000013b1
_LIT9: .word 0x000019d4
_LIT10: .word data_ov002_022cd3b0
_LIT11: .word 0x00001589
_LIT12: .word 0x0000129a
_LIT13: .word 0x000016bf
