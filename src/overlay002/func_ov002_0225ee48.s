; func_ov002_0225ee48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd420
        .extern data_ov002_022cd4b8
        .extern data_ov002_022cd4cc
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1a6
        .extern data_ov002_022d016c
        .extern data_ov002_022d0650
        .extern func_0202e234
        .extern func_0202e2f8
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b3f0c
        .extern func_ov002_021b3fd8
        .extern func_ov002_021b9bd4
        .extern func_ov002_021badb0
        .extern func_ov002_021bb068
        .extern func_ov002_021bb90c
        .extern func_ov002_021bd85c
        .extern func_ov002_021ca5bc
        .extern func_ov002_021d59cc
        .extern func_ov002_021d9144
        .extern func_ov002_021de480
        .extern func_ov002_021ded8c
        .extern func_ov002_021dee94
        .extern func_ov002_021df62c
        .extern func_ov002_021df6d4
        .extern func_ov002_021e276c
        .extern func_ov002_021e286c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021e30b4
        .extern func_ov002_022550b8
        .global func_ov002_0225ee48
        .arm
func_ov002_0225ee48:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xa0
    ldr r5, _LIT0
    mov r4, r0
    mov r2, #0x38
    rsb r0, r4, #0x1
    str r0, [sp, #0x14]
    mla r6, r4, r2, r5
    ldr r1, [sp, #0x14]
    ldr r0, [r6, #0x2c]
    mla r7, r1, r2, r5
    ldr r3, _LIT1
    cmp r0, #0x0
    ldr r5, [r3, #0x4]
    ldrne sl, _LIT2
    bne .L_b7c
    ldr r8, _LIT3
    and r3, r4, #0x1
    add r1, r2, #0x830
    mla r1, r3, r1, r8
    ldr r2, [r6, #0x4]
    add r3, r1, #0x30
    mov r1, #0x14
    mla sl, r2, r1, r3
.L_b7c:
    ldr r1, [r7, #0x2c]
    cmp r1, #0x0
    ldrne r2, _LIT4
    strne r2, [sp, #0x4]
    bne .L_bb4
    ldr r8, _LIT3
    ldr r2, _LIT5
    and r3, r5, #0x1
    mla r2, r3, r2, r8
    add r8, r2, #0x30
    ldr r3, [r7, #0x4]
    mov r2, #0x14
    mla r2, r3, r2, r8
    str r2, [sp, #0x4]
.L_bb4:
    ldr r2, [r6, #0x30]
    mov r8, #0x0
    cmp r2, #0x0
    bne .L_be0
    cmp r0, #0x0
    beq .L_be0
    ldr r0, _LIT1
    ldr r0, [r0, #0xc4]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    movne r8, #0x1
.L_be0:
    ldr r2, [r7, #0x30]
    mov r0, #0x0
    str r0, [sp, #0x24]
    cmp r2, #0x0
    bne .L_c14
    cmp r1, #0x0
    beq .L_c14
    ldr r0, _LIT1
    ldr r0, [r0, #0xd8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    movne r0, #0x1
    strne r0, [sp, #0x24]
.L_c14:
    ldr r0, _LIT5
    and r1, r4, #0x1
    mul r0, r1, r0
    ldr r2, _LIT3
    ldr r3, [r6, #0x4]
    mov r1, #0x14
    str r0, [sp, #0x18]
    add r2, r2, r0
    mul r0, r3, r1
    add r1, r2, #0x30
    ldr r3, [r1, r0]
    ldr r1, [r6, #0xc]
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp r1, r2
    mov r2, #0x0
    str r2, [sp, #0x20]
    bne .L_c84
    ldr r3, _LIT6
    ldr r2, [sp, #0x18]
    add r2, r3, r2
    ldrh r0, [r0, r2]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x20]
.L_c84:
    ldr r0, _LIT5
    and r2, r5, #0x1
    mul r9, r2, r0
    mov r0, #0x0
    ldr r2, _LIT3
    str r0, [sp, #0x1c]
    add r0, r2, r9
    add r2, r0, #0x30
    ldr fp, [r7, #0x4]
    mov r0, #0x14
    mul r3, fp, r0
    ldr fp, [r2, r3]
    ldr r2, [r7, #0xc]
    mov r0, fp, lsl #0x12
    mov fp, fp, lsl #0x2
    mov fp, fp, lsr #0x18
    mov fp, fp, lsl #0x1
    add r0, fp, r0, lsr #0x1f
    cmp r2, r0
    bne .L_cec
    ldr r0, _LIT6
    add r0, r0, r9
    ldrh r0, [r3, r0]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x1c]
.L_cec:
    ldr r0, _LIT1
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    addne sp, sp, #0xa0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT7
    ldr r0, [r0, #0xd30]
    cmp r0, #0x0
    beq .L_d28
    cmp r0, #0x1
    beq .L_e04
    cmp r0, #0x2
    beq .L_1520
    b .L_297c
.L_d28:
    mov r0, r6
    bl func_ov002_021badb0
    cmp r0, #0x0
    beq .L_d88
    ldr r2, [r6, #0x10]
    ldr r1, _LIT8
    cmp r2, r1
    beq .L_d58
    add r0, r1, #0xd6
    cmp r2, r0
    beq .L_d70
    b .L_d88
.L_d58:
    mov r0, r4
    bl func_ov002_022550b8
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r6, #0x30]
    b .L_d88
.L_d70:
    mov r0, r4
    add r1, r1, #0xcb
    bl func_ov002_021bb90c
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [r6, #0x30]
.L_d88:
    mov r0, r7
    bl func_ov002_021badb0
    cmp r0, #0x0
    beq .L_de8
    ldr r2, [r7, #0x10]
    ldr r1, _LIT8
    cmp r2, r1
    beq .L_db8
    add r0, r1, #0xd6
    cmp r2, r0
    beq .L_dd0
    b .L_de8
.L_db8:
    mov r0, r5
    bl func_ov002_022550b8
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r7, #0x30]
    b .L_de8
.L_dd0:
    mov r0, r5
    add r1, r1, #0xcb
    bl func_ov002_021bb90c
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [r7, #0x30]
.L_de8:
    ldr r1, _LIT7
    add sp, sp, #0xa0
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e04:
    cmp r8, #0x0
    beq .L_e6c
    ldr r0, [r6, #0x10]
    bl func_ov002_021bd85c
    cmp r0, #0x0
    bne .L_e6c
    ldr r0, _LIT7
    ldr r3, [r6, #0xc]
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT9
    mov r1, #0xb
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    bne .L_e6c
    ldr r1, [r6, #0x10]
    ldr r0, _LIT10
    cmp r1, r0
    bne .L_e6c
    ldr r0, [r6, #0xc]
    mov r1, r1, lsl #0x10
    mov r2, r0, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e276c
.L_e6c:
    cmp r8, #0x0
    beq .L_1174
    ldr r0, [r7, #0x10]
    ldr r2, _LIT11
    cmp r0, r2
    bgt .L_eb8
    bge .L_ff0
    ldr r1, _LIT12
    cmp r0, r1
    bgt .L_ea8
    bge .L_f60
    sub r1, r1, #0x6
    cmp r0, r1
    beq .L_f2c
    b .L_1174
.L_ea8:
    sub r1, r2, #0x68
    cmp r0, r1
    beq .L_fac
    b .L_1174
.L_eb8:
    ldr r2, _LIT13
    cmp r0, r2
    bgt .L_f08
    sub r1, r2, #0x8
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_ef8
    b .L_1090
    b .L_1090
    b .L_1174
    b .L_1174
    b .L_1174
    b .L_1090
    b .L_1090
    b .L_1174
    b .L_1090
.L_ef8:
    ldr r1, _LIT14
    cmp r0, r1
    beq .L_104c
    b .L_1174
.L_f08:
    ldr r1, _LIT15
    cmp r0, r1
    bgt .L_f1c
    beq .L_10c0
    b .L_1174
.L_f1c:
    add r1, r1, #0x1
    cmp r0, r1
    beq .L_1118
    b .L_1174
.L_f2c:
    ldr r1, [sp, #0x1c]
    cmp r1, #0x0
    beq .L_1174
    mov r2, #0x0
    ldr r1, _LIT1
    str r2, [sp]
    mov r2, r0, lsl #0x10
    ldr r1, [r1, #0x20]
    mov r0, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x1
    bl func_ov002_021d59cc
    b .L_1174
.L_f60:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_1174
    ldr r0, [r6, #0x10]
    bl func_0202e234
    cmp r0, #0x0
    beq .L_1174
    ldr r0, [r6, #0xc]
    ldr r1, _LIT1
    add r0, r5, r0, lsl #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldr r1, [r1, #0x20]
    ldr r2, _LIT12
    mov r0, r5
    mov r3, #0x2
    bl func_ov002_021d59cc
    b .L_1174
.L_fac:
    mov r0, r7
    bl func_ov002_021badb0
    cmp r0, #0x0
    beq .L_1174
    ldr r2, [sl]
    ldr r1, _LIT16
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    mov r2, r0, lsl #0x10
    mov r0, r5
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e276c
    b .L_1174
.L_ff0:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_1174
    mov r0, r7
    bl func_ov002_021badb0
    cmp r0, #0x0
    beq .L_1174
    ldr r0, _LIT1
    ldr r2, [r7, #0xc]
    ldr r1, [r0, #0x20]
    mov r0, r5
    bl func_ov002_021df62c
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r7, #0x10]
    ldr r0, _LIT1
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x20]
    mov r0, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x3
    bl func_ov002_021d59cc
    b .L_1174
.L_104c:
    ldr r1, _LIT1
    mov r0, r5
    ldr r1, [r1, #0x20]
    bl func_ov002_021b9bd4
    cmp r0, #0x2
    bge .L_1174
    ldr r0, _LIT1
    ldr r2, [r7, #0xc]
    ldr r1, [r0, #0x20]
    mov r0, r5
    bl func_ov002_021df62c
    ldr r1, _LIT1
    mov r0, r5
    ldr r1, [r1, #0x20]
    mov r2, #0x1
    bl func_ov002_021d9144
    b .L_1174
.L_1090:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_1174
    mov r1, #0x0
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, #0x20]
    mov r0, r5
    sub r2, r2, #0x8
    mov r3, #0x2
    bl func_ov002_021d59cc
    b .L_1174
.L_10c0:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_1174
    ldr r0, _LIT7
    mov r1, #0x0
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT17
    cmp r0, r5
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x1
    and r0, r0, #0xff
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x2
    mov r3, r0, lsl #0x10
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, #0x20]
    mov r0, r5
    mov r3, r3, lsr #0x10
    bl func_ov002_021d59cc
    b .L_1174
.L_1118:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    ldrne r0, [r6, #0x34]
    cmpne r0, #0x0
    beq .L_1174
    ldr r0, _LIT7
    mov r1, #0x0
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT17
    cmp r0, r5
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x1
    and r0, r0, #0xff
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x2
    mov r3, r0, lsl #0x10
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, #0x20]
    mov r0, r5
    mov r3, r3, lsr #0x10
    bl func_ov002_021d59cc
.L_1174:
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    beq .L_11f4
    ldr r0, [r7, #0x10]
    ldr r1, [r7, #0xc]
    bl func_ov002_021bd85c
    cmp r0, #0x0
    bne .L_11f4
    ldr r0, _LIT7
    ldr r3, [r7, #0xc]
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT9
    mov r1, #0xb
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    bne .L_11f4
    ldr r1, [r7, #0x10]
    ldr r0, _LIT10
    cmp r1, r0
    bne .L_11f4
    ldr r0, _LIT1
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    bne .L_11f4
    ldr r0, [r7, #0xc]
    mov r1, r1, lsl #0x10
    mov r2, r0, lsl #0x10
    mov r0, r5
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e276c
.L_11f4:
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    beq .L_1504
    ldr r0, [r6, #0x10]
    ldr r2, _LIT11
    cmp r0, r2
    bgt .L_1244
    bge .L_1380
    ldr r1, _LIT12
    cmp r0, r1
    bgt .L_1234
    bge .L_12ec
    sub r1, r1, #0x6
    cmp r0, r1
    beq .L_12b8
    b .L_1504
.L_1234:
    sub r1, r2, #0x68
    cmp r0, r1
    beq .L_1338
    b .L_1504
.L_1244:
    ldr r2, _LIT13
    cmp r0, r2
    bgt .L_1294
    sub r1, r2, #0x8
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_1284
    b .L_1420
    b .L_1420
    b .L_1504
    b .L_1504
    b .L_1504
    b .L_1420
    b .L_1420
    b .L_1504
    b .L_1420
.L_1284:
    ldr r1, _LIT14
    cmp r0, r1
    beq .L_13dc
    b .L_1504
.L_1294:
    ldr r1, _LIT15
    cmp r0, r1
    bgt .L_12a8
    beq .L_1450
    b .L_1504
.L_12a8:
    add r1, r1, #0x1
    cmp r0, r1
    beq .L_14a8
    b .L_1504
.L_12b8:
    ldr r1, [sp, #0x20]
    cmp r1, #0x0
    beq .L_1504
    mov r2, #0x0
    ldr r1, _LIT1
    str r2, [sp]
    mov r2, r0, lsl #0x10
    ldr r1, [r1, #0x1c]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x1
    bl func_ov002_021d59cc
    b .L_1504
.L_12ec:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_1504
    ldr r0, [r7, #0x10]
    bl func_0202e234
    cmp r0, #0x0
    beq .L_1504
    ldr r0, [r7, #0xc]
    ldr r1, _LIT1
    add r0, r4, r0, lsl #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldr r1, [r1, #0x1c]
    ldr r2, _LIT12
    mov r0, r4
    mov r3, #0x2
    bl func_ov002_021d59cc
    b .L_1504
.L_1338:
    mov r0, r6
    bl func_ov002_021badb0
    cmp r0, #0x0
    beq .L_1504
    ldr r0, [sp, #0x4]
    ldr r1, _LIT16
    ldr r2, [r0]
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    mov r2, r0, lsl #0x10
    mov r3, r2, lsr #0x10
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_021e276c
    b .L_1504
.L_1380:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_1504
    mov r0, r6
    bl func_ov002_021badb0
    cmp r0, #0x0
    beq .L_1504
    ldr r0, _LIT1
    ldr r2, [r6, #0xc]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021df62c
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r6, #0x10]
    ldr r0, _LIT1
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x3
    bl func_ov002_021d59cc
    b .L_1504
.L_13dc:
    ldr r1, _LIT1
    mov r0, r4
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b9bd4
    cmp r0, #0x2
    bge .L_1504
    ldr r0, _LIT1
    ldr r2, [r6, #0xc]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021df62c
    ldr r1, _LIT1
    mov r0, r4
    ldr r1, [r1, #0x1c]
    mov r2, #0x1
    bl func_ov002_021d9144
    b .L_1504
.L_1420:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_1504
    mov r1, #0x0
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    sub r2, r2, #0x8
    mov r3, #0x2
    bl func_ov002_021d59cc
    b .L_1504
.L_1450:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_1504
    ldr r0, _LIT7
    mov r1, #0x0
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT17
    cmp r0, r4
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x1
    and r0, r0, #0xff
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x2
    mov r3, r0, lsl #0x10
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r3, r3, lsr #0x10
    bl func_ov002_021d59cc
    b .L_1504
.L_14a8:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    ldrne r0, [r7, #0x34]
    cmpne r0, #0x0
    beq .L_1504
    ldr r0, _LIT7
    mov r1, #0x0
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT17
    cmp r0, r4
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x1
    and r0, r0, #0xff
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x2
    mov r3, r0, lsl #0x10
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r3, r3, lsr #0x10
    bl func_ov002_021d59cc
.L_1504:
    ldr r1, _LIT7
    add sp, sp, #0xa0
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1520:
    bl func_ov002_021e2b3c
    ldr r1, [r6, #0x30]
    mov r0, #0x0
    str r0, [sp, #0x2c]
    cmp r1, #0x0
    beq .L_15a8
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    beq .L_1590
    ldr r1, [sp, #0x2c]
    add r0, sp, #0x88
    str r1, [r0]
    ldrh r3, [sp, #0x8a]
    mov r2, r4, lsl #0x10
    mov r1, r2, lsr #0x10
    and r1, r1, #0x1
    bic r2, r3, #0x1
    orr r2, r2, r1
    ldr r1, [sp, #0x2c]
    strh r2, [sp, #0x8a]
    mov r2, r1
    str r2, [r0, #0x4]
    str r2, [r0, #0x8]
    str r2, [r0, #0xc]
    str r2, [r0, #0x10]
    str r2, [r0, #0x14]
    bl func_ov002_021dee94
    b .L_1dc0
.L_1590:
    ldr r2, [sp, #0x2c]
    ldr r1, [r6, #0x4]
    mov r0, r4
    mov r3, r2
    bl func_ov002_021de480
    b .L_1dc0
.L_15a8:
    cmp r8, #0x0
    beq .L_1dc0
    add r3, sp, #0x6c
    sub r1, r0, #0x200
    str r0, [r3]
    and r3, r0, r1
    ldr r2, [r6, #0xc]
    ldr r0, _LIT18
    mov r1, r5, lsl #0x1f
    and r0, r2, r0
    orr r0, r3, r0
    bic r0, r0, #0x40000
    orr r0, r0, r1, lsr #0xd
    bic r1, r0, #0x200
    mov r0, r4, lsl #0x1f
    orr r0, r1, r0, lsr #0x16
    ldr r1, [r6, #0x4]
    bic r2, r0, #0x3c00
    mov r1, r1, lsl #0x1c
    ldr r0, [r6, #0x8]
    orr r1, r2, r1, lsr #0x12
    orr r1, r1, #0x20000
    bic r1, r1, #0x4000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x11
    orr r0, r0, #0x18000
    bic r0, r0, #0x780000
    orr r0, r0, #0x700000
    str r0, [sp, #0x6c]
    ldr r0, [r6, #0x10]
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_165c
    ldr r1, [r6, #0x10]
    ldr r0, _LIT19
    cmp r1, r0
    bne .L_164c
    mov r0, r6
    bl func_ov002_021badb0
    cmp r0, #0x0
    bne .L_165c
.L_164c:
    ldr r0, [r6, #0xc]
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    bne .L_166c
.L_165c:
    ldr r0, [sp, #0x6c]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x6c]
.L_166c:
    mov r0, r7
    bl func_ov002_021badb0
    cmp r0, #0x0
    beq .L_1778
    ldr r2, [r7, #0x10]
    ldr r0, _LIT20
    cmp r2, r0
    bgt .L_16b4
    bge .L_1718
    ldr r0, _LIT21
    cmp r2, r0
    bgt .L_16a4
    beq .L_16f8
    b .L_1778
.L_16a4:
    add r0, r0, #0x3d
    cmp r2, r0
    beq .L_16f8
    b .L_1778
.L_16b4:
    ldr r0, _LIT22
    cmp r2, r0
    bgt .L_16d4
    bge .L_1718
    ldr r0, _LIT19
    cmp r2, r0
    beq .L_16e4
    b .L_1778
.L_16d4:
    add r0, r0, #0x1f8
    cmp r2, r0
    beq .L_1744
    b .L_1778
.L_16e4:
    ldr r0, [sp, #0x6c]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x6c]
    b .L_1778
.L_16f8:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_1778
    ldr r0, [sp, #0x6c]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x6c]
    b .L_1778
.L_1718:
    mov r0, r5
    mov r1, #0xb
    ldr r3, [r7, #0xc]
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    beq .L_1778
    ldr r0, [sp, #0x6c]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x6c]
    b .L_1778
.L_1744:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_1778
    mov r0, r5
    ldr r1, _LIT1
    ldr r1, [r1, #0x20]
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_1778
    ldr r0, [sp, #0x6c]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x6c]
.L_1778:
    ldr r0, [r6, #0x10]
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_17c4
    ldr r0, _LIT23
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_17c4
    ldr r0, [sp, #0x6c]
    mov r2, #0x1
    bic r0, r0, #0x780000
    orr r0, r0, #0x680000
    str r0, [sp, #0x6c]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x17
    and r1, r0, #0x1
    ldr r0, [sp, #0x2c]
    orr r0, r0, r2, lsl r1
    str r0, [sp, #0x2c]
.L_17c4:
    ldr r1, [sp, #0x6c]
    mov r0, sl
    bl func_ov002_021ded8c
    ldr r1, [r7, #0x10]
    ldr r0, _LIT24
    mov r8, #0x0
    cmp r1, r0
    bgt .L_1900
    bge .L_1a14
    sub r2, r0, #0xc3
    cmp r1, r2
    bgt .L_1890
    sub r0, r0, #0xc3
    cmp r1, r0
    bge .L_1a0c
    ldr r0, _LIT25
    cmp r1, r0
    bgt .L_1860
    bge .L_1a14
    sub r2, r0, #0xbc
    cmp r1, r2
    bgt .L_1838
    sub r0, r0, #0xbc
    cmp r1, r0
    bge .L_1a0c
    ldr r0, _LIT21
    cmp r1, r0
    beq .L_1a0c
    b .L_1b08
.L_1838:
    sub r2, r0, #0x4a
    cmp r1, r2
    bgt .L_1b08
    sub r2, r0, #0x4d
    cmp r1, r2
    blt .L_1b08
    subne r0, r0, #0x4a
    cmpne r1, r0
    beq .L_1a0c
    b .L_1b08
.L_1860:
    add r2, r0, #0xe9
    cmp r1, r2
    bgt .L_1880
    bge .L_1a0c
    add r0, r0, #0x71
    cmp r1, r0
    beq .L_1a0c
    b .L_1b08
.L_1880:
    add r0, r0, #0xea
    cmp r1, r0
    beq .L_1a14
    b .L_1b08
.L_1890:
    sub r2, r0, #0x7d
    cmp r1, r2
    bgt .L_18d0
    bge .L_1a0c
    sub r2, r0, #0x9d
    cmp r1, r2
    bgt .L_18c0
    bge .L_1a0c
    sub r0, r0, #0xbc
    cmp r1, r0
    beq .L_1a0c
    b .L_1b08
.L_18c0:
    sub r0, r0, #0x9c
    cmp r1, r0
    beq .L_1a0c
    b .L_1b08
.L_18d0:
    sub r2, r0, #0x36
    cmp r1, r2
    bgt .L_18f0
    bge .L_1a0c
    sub r0, r0, #0x7c
    cmp r1, r0
    beq .L_1a0c
    b .L_1b08
.L_18f0:
    sub r0, r0, #0x35
    cmp r1, r0
    beq .L_1a0c
    b .L_1b08
.L_1900:
    ldr r0, _LIT26
    cmp r1, r0
    bgt .L_1980
    bge .L_1a0c
    sub r2, r0, #0x69
    cmp r1, r2
    bgt .L_1950
    bge .L_1a0c
    sub r2, r0, #0xf6
    cmp r1, r2
    bgt .L_1940
    bge .L_1a0c
    sub r0, r0, #0x1dc
    cmp r1, r0
    beq .L_1a14
    b .L_1b08
.L_1940:
    sub r0, r0, #0xdc
    cmp r1, r0
    beq .L_1a0c
    b .L_1b08
.L_1950:
    sub r2, r0, #0x55
    cmp r1, r2
    bgt .L_1970
    bge .L_1a0c
    sub r0, r0, #0x61
    cmp r1, r0
    beq .L_1a0c
    b .L_1b08
.L_1970:
    sub r0, r0, #0x1d
    cmp r1, r0
    beq .L_1a0c
    b .L_1b08
.L_1980:
    add r2, r0, #0xf1
    cmp r1, r2
    bgt .L_19c0
    bge .L_1a94
    add r2, r0, #0x78
    cmp r1, r2
    bgt .L_19b0
    bge .L_1a14
    add r0, r0, #0x2f
    cmp r1, r0
    beq .L_1a0c
    b .L_1b08
.L_19b0:
    add r0, r0, #0x7f
    cmp r1, r0
    beq .L_1a0c
    b .L_1b08
.L_19c0:
    add r2, r0, #0x10c
    cmp r1, r2
    bgt .L_19e8
    add r0, r0, #0x10c
    cmp r1, r0
    bge .L_1a14
    ldr r0, _LIT27
    cmp r1, r0
    beq .L_1a14
    b .L_1b08
.L_19e8:
    ldr r0, _LIT28
    cmp r1, r0
    bgt .L_19fc
    beq .L_1a14
    b .L_1b08
.L_19fc:
    add r0, r0, #0x52
    cmp r1, r0
    beq .L_1a14
    b .L_1b08
.L_1a0c:
    ldr r8, [sp, #0x1c]
    b .L_1b08
.L_1a14:
    mov r8, #0x1
    b .L_1b08
_LIT0: .word data_ov002_022cd420
_LIT1: .word data_ov002_022cd3f4
_LIT2: .word data_ov002_022cd4b8
_LIT3: .word data_ov002_022cf16c
_LIT4: .word data_ov002_022cd4cc
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022cf1a4
_LIT7: .word data_ov002_022d016c
_LIT8: .word 0x000013a4
_LIT9: .word 0x000015ff
_LIT10: .word 0x00001836
_LIT11: .word 0x0000147d
_LIT12: .word 0x000012a6
_LIT13: .word 0x000017da
_LIT14: .word 0x00001529
_LIT15: .word 0x00001adc
_LIT16: .word 0x00001415
_LIT17: .word 0x000017d2
_LIT18: .word 0x000001ff
_LIT19: .word 0x000016f8
_LIT20: .word 0x000015d9
_LIT21: .word 0x0000147a
_LIT22: .word 0x000018e6
_LIT23: .word 0x00001797
_LIT24: .word 0x000017c7
_LIT25: .word 0x000015dc
_LIT26: .word 0x000019a4
_LIT27: .word 0x00001aad
_LIT28: .word 0x00001b2d
_LIT29: .word 0x00001a90
.L_1a94:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_1b08
    ldr r0, [sp, #0x6c]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    bne .L_1b08
    mov r0, r7
    bl func_ov002_021badb0
    cmp r0, #0x0
    beq .L_1b08
    ldr r1, [r6, #0x4]
    mov r0, r4
    ldr r2, _LIT29
    bl func_ov002_021b3f0c
    cmp r0, #0x0
    beq .L_1b08
    ldr r1, [r6, #0xc]
    mov r0, r5
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [sp]
    ldr r1, [r7, #0x4]
    ldr r2, [r7, #0x10]
    mov r3, #0x2
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d59cc
.L_1b08:
    cmp r8, #0x0
    beq .L_1b54
    ldr r1, [r7]
    ldr r0, [r7, #0x4]
    mov r1, r1, lsl #0x1f
    and r1, r1, #-2147483648
    orr r1, r1, #0xc200000
    mov r0, r0, lsl #0x10
    and r0, r0, #0x1f0000
    ldr r2, [r7, #0x10]
    orr r1, r1, #0x20000000
    orr r1, r1, r0
    mov r0, r2, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    ldr r1, [r7, #0xc]
    ldr r2, [sp, #0x6c]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_1b54:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_1dc0
    ldr r0, _LIT1
    ldr r1, _LIT30
    ldr r2, [r0, #0x20]
    add r1, r1, r9
    mov r0, #0x14
    mul r0, r2, r0
    ldrh r8, [r0, r1]
    cmp r8, #0x0
    beq .L_1dc0
    ldr r0, _LIT31
    add r0, r0, #0x1e
    str r0, [sp, #0x38]
    ldr r0, _LIT31
    add r0, r0, #0x22
    str r0, [sp, #0x3c]
    ldr r0, _LIT32
    sub r0, r0, #0xed
    str r0, [sp, #0x40]
    ldr r0, _LIT32
    sub r0, r0, #0xed
    str r0, [sp, #0x44]
    ldr r0, _LIT31
    add r0, r0, #0x1e
    str r0, [sp, #0x34]
    ldr r0, _LIT31
    add r0, r0, #0x22
    str r0, [sp, #0x30]
.L_1bcc:
    ldr r0, _LIT33
    add r1, r0, r8, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r8, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r3, r0, lsr #0x1c
    cmp r3, #0xa
    cmpne r3, #0xb
    bne .L_1db8
    ldrh r0, [r1]
    ldr r1, _LIT5
    and r9, r0, #0xff
    mov r0, r0, asr #0x8
    and sl, r0, #0xff
    mov r0, #0x14
    smulbb fp, sl, r0
    ldr r0, _LIT3
    and r2, r9, #0x1
    mla r0, r2, r1, r0
    add ip, r0, fp
    str r0, [sp, #0x10]
    ldr r0, [ip, #0x30]
    ldr r1, [ip, #0x40]
    mov r0, r0, lsl #0x13
    mov r2, r0, lsr #0x13
    ldrh r0, [ip, #0x38]
    mov ip, r1, lsr #0x6
    and ip, ip, #0x1
    mvn ip, ip
    and r0, r0, ip
    mov ip, r1, lsr #0x2
    orr r1, ip, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_1db8
    ldr r0, _LIT34
    cmp r2, r0
    mov r0, #0x0
    bgt .L_1cac
    ldr r1, _LIT34
    cmp r2, r1
    bge .L_1d30
    ldr r1, [sp, #0x30]
    cmp r2, r1
    bgt .L_1d54
    ldr r1, [sp, #0x34]
    cmp r2, r1
    blt .L_1d54
    ldr r1, [sp, #0x38]
    cmp r2, r1
    beq .L_1cd8
    ldr r1, [sp, #0x3c]
    cmp r2, r1
    beq .L_1d04
    b .L_1d54
.L_1cac:
    ldr r1, [sp, #0x40]
    cmp r2, r1
    bgt .L_1cc8
    ldr r1, [sp, #0x44]
    cmp r2, r1
    moveq r0, #0x1
    b .L_1d54
.L_1cc8:
    ldr r1, _LIT32
    cmp r2, r1
    beq .L_1d30
    b .L_1d54
.L_1cd8:
    cmp r4, r9
    beq .L_1cfc
    ldr r2, _LIT31
    mov r0, r9
    mov r1, sl
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_1d54
.L_1cfc:
    mov r0, #0x0
    b .L_1d54
.L_1d04:
    cmp r3, #0xb
    bne .L_1d28
    ldr r2, _LIT31
    mov r0, r9
    mov r1, sl
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_1d54
.L_1d28:
    mov r0, #0x0
    b .L_1d54
.L_1d30:
    cmp r4, r9
    beq .L_1d50
    ldr r0, [sp, #0x6c]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    moveq r0, #0x1
    beq .L_1d54
.L_1d50:
    mov r0, #0x0
.L_1d54:
    cmp r0, #0x0
    beq .L_1db8
    ldr r0, [sp, #0x10]
    add r0, r0, #0x30
    ldr r1, [r0, fp]
    mov r0, r9, lsl #0x1f
    and r2, r0, #-2147483648
    orr r2, r2, #0xc200000
    mov r0, sl, lsl #0x10
    orr r2, r2, #0x20000000
    and r0, r0, #0x1f0000
    orr r2, r2, r0
    mov r0, r1, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r0, r0, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    ldr r2, [sp, #0x6c]
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_1db8:
    cmp r8, #0x0
    bne .L_1bcc
.L_1dc0:
    ldr r0, [r7, #0x30]
    cmp r0, #0x0
    beq .L_1e38
    ldr r0, [r7, #0x2c]
    cmp r0, #0x0
    beq .L_1e20
    add r0, sp, #0x70
    mov r3, #0x0
    str r3, [r0]
    ldrh r2, [sp, #0x72]
    mov r1, r5, lsl #0x10
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
    strh r2, [sp, #0x72]
    bl func_ov002_021dee94
    b .L_267c
.L_1e20:
    mov r2, #0x0
    ldr r1, [r7, #0x4]
    mov r0, r5
    mov r3, r2
    bl func_ov002_021de480
    b .L_267c
.L_1e38:
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    beq .L_267c
    mov r0, #0x0
    sub r1, r0, #0x200
    ldr r3, [r7, #0xc]
    ldr r2, _LIT18
    and r8, r1, #0x0
    and r1, r3, r2
    orr r1, r8, r1
    bic r3, r1, #0x40000
    mov r1, r4, lsl #0x1f
    orr r3, r3, r1, lsr #0xd
    ldr r2, [r7, #0x4]
    bic r8, r3, #0x200
    add r9, sp, #0x68
    ldr r1, [r7, #0x8]
    mov r3, r5, lsl #0x1f
    str r0, [r9]
    orr r0, r8, r3, lsr #0x16
    mov r2, r2, lsl #0x1c
    bic r0, r0, #0x3c00
    orr r0, r0, r2, lsr #0x12
    orr r0, r0, #0x20000
    mov r1, r1, lsl #0x1f
    bic r0, r0, #0x4000
    orr r0, r0, r1, lsr #0x11
    orr r0, r0, #0x18000
    bic r0, r0, #0x780000
    orr r1, r0, #0x700000
    ldr r0, [r7, #0x10]
    str r1, [sp, #0x68]
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_1ef4
    ldr r1, [r7, #0x10]
    ldr r0, _LIT19
    cmp r1, r0
    bne .L_1ee4
    mov r0, r7
    bl func_ov002_021badb0
    cmp r0, #0x0
    bne .L_1ef4
.L_1ee4:
    ldr r0, [r7, #0xc]
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    bne .L_1f04
.L_1ef4:
    ldr r0, [sp, #0x68]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x68]
.L_1f04:
    mov r0, r6
    bl func_ov002_021badb0
    cmp r0, #0x0
    beq .L_2010
    ldr r2, [r6, #0x10]
    ldr r0, _LIT20
    cmp r2, r0
    bgt .L_1f4c
    bge .L_1fb0
    ldr r0, _LIT21
    cmp r2, r0
    bgt .L_1f3c
    beq .L_1f90
    b .L_2010
.L_1f3c:
    add r0, r0, #0x3d
    cmp r2, r0
    beq .L_1f90
    b .L_2010
.L_1f4c:
    ldr r0, _LIT22
    cmp r2, r0
    bgt .L_1f6c
    bge .L_1fb0
    ldr r0, _LIT19
    cmp r2, r0
    beq .L_1f7c
    b .L_2010
.L_1f6c:
    add r0, r0, #0x1f8
    cmp r2, r0
    beq .L_1fdc
    b .L_2010
.L_1f7c:
    ldr r0, [sp, #0x68]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x68]
    b .L_2010
.L_1f90:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_2010
    ldr r0, [sp, #0x68]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x68]
    b .L_2010
.L_1fb0:
    ldr r3, [r6, #0xc]
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    beq .L_2010
    ldr r0, [sp, #0x68]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x68]
    b .L_2010
.L_1fdc:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_2010
    ldr r1, _LIT1
    mov r0, r4
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_2010
    ldr r0, [sp, #0x68]
    bic r0, r0, #0x780000
    orr r0, r0, #0x780000
    str r0, [sp, #0x68]
.L_2010:
    ldr r0, [r7, #0x10]
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_205c
    ldr r0, _LIT23
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_205c
    ldr r0, [sp, #0x68]
    mov r2, #0x1
    bic r0, r0, #0x780000
    orr r3, r0, #0x680000
    mov r0, r3, lsl #0x17
    mov r0, r0, lsr #0x17
    and r1, r0, #0x1
    ldr r0, [sp, #0x2c]
    str r3, [sp, #0x68]
    orr r0, r0, r2, lsl r1
    str r0, [sp, #0x2c]
.L_205c:
    ldr r1, [r6, #0x10]
    ldr r0, _LIT24
    mov r8, #0x0
    cmp r1, r0
    bgt .L_21b8
    bge .L_22cc
    ldr r0, _LIT35
    cmp r1, r0
    bgt .L_2114
    bge .L_22cc
    sub r2, r0, #0xea
    cmp r1, r2
    bgt .L_20e4
    sub r0, r0, #0xea
    cmp r1, r0
    bge .L_22cc
    ldr r2, _LIT36
    cmp r1, r2
    bgt .L_20bc
    bge .L_22c4
    sub r0, r2, #0xa6
    cmp r1, r0
    beq .L_22c4
    b .L_2348
.L_20bc:
    add r0, r2, #0x72
    cmp r1, r0
    bgt .L_2348
    add r0, r2, #0x6f
    cmp r1, r0
    blt .L_2348
    addne r0, r2, #0x72
    cmpne r1, r0
    beq .L_22c4
    b .L_2348
.L_20e4:
    sub r2, r0, #0x79
    cmp r1, r2
    bgt .L_2104
    bge .L_22c4
    sub r0, r0, #0x85
    cmp r1, r0
    beq .L_22c4
    b .L_2348
.L_2104:
    sub r0, r0, #0x1
    cmp r1, r0
    beq .L_22c4
    b .L_2348
.L_2114:
    add r2, r0, #0x65
    cmp r1, r2
    bgt .L_2154
    bge .L_22c4
    add r2, r0, #0x45
    cmp r1, r2
    bgt .L_2144
    bge .L_22c4
    add r0, r0, #0x3e
    cmp r1, r0
    beq .L_22c4
    b .L_2348
.L_2144:
    add r0, r0, #0x64
    cmp r1, r0
    beq .L_22c4
    b .L_2348
.L_2154:
    add r2, r0, #0x85
    cmp r1, r2
    bgt .L_2174
    bge .L_22c4
    add r0, r0, #0x84
    cmp r1, r0
    beq .L_22c4
    b .L_2348
.L_2174:
    add r2, r0, #0xc7
    cmp r1, r2
    bgt .L_2190
    add r0, r0, #0xc7
    cmp r1, r0
    beq .L_22c4
    b .L_2348
.L_2190:
    add r2, r0, #0xcc
    cmp r1, r2
    bgt .L_2348
    add r2, r0, #0xcb
    cmp r1, r2
    blt .L_2348
    addne r0, r0, #0xcc
    cmpne r1, r0
    beq .L_22c4
    b .L_2348
.L_21b8:
    ldr r0, _LIT26
    cmp r1, r0
    bgt .L_2238
    bge .L_22c4
    sub r2, r0, #0x69
    cmp r1, r2
    bgt .L_2208
    bge .L_22c4
    sub r2, r0, #0xf6
    cmp r1, r2
    bgt .L_21f8
    bge .L_22c4
    sub r0, r0, #0x1dc
    cmp r1, r0
    beq .L_22cc
    b .L_2348
.L_21f8:
    sub r0, r0, #0xdc
    cmp r1, r0
    beq .L_22c4
    b .L_2348
.L_2208:
    sub r2, r0, #0x55
    cmp r1, r2
    bgt .L_2228
    bge .L_22c4
    sub r0, r0, #0x61
    cmp r1, r0
    beq .L_22c4
    b .L_2348
.L_2228:
    sub r0, r0, #0x1d
    cmp r1, r0
    beq .L_22c4
    b .L_2348
.L_2238:
    add r2, r0, #0xf1
    cmp r1, r2
    bgt .L_2278
    bge .L_22d4
    add r2, r0, #0x78
    cmp r1, r2
    bgt .L_2268
    bge .L_22cc
    add r0, r0, #0x2f
    cmp r1, r0
    beq .L_22c4
    b .L_2348
.L_2268:
    add r0, r0, #0x7f
    cmp r1, r0
    beq .L_22c4
    b .L_2348
.L_2278:
    add r2, r0, #0x10c
    cmp r1, r2
    bgt .L_22a0
    add r0, r0, #0x10c
    cmp r1, r0
    bge .L_22cc
    ldr r0, _LIT27
    cmp r1, r0
    beq .L_22cc
    b .L_2348
.L_22a0:
    ldr r0, _LIT28
    cmp r1, r0
    bgt .L_22b4
    beq .L_22cc
    b .L_2348
.L_22b4:
    add r0, r0, #0x52
    cmp r1, r0
    beq .L_22cc
    b .L_2348
.L_22c4:
    ldr r8, [sp, #0x20]
    b .L_2348
.L_22cc:
    mov r8, #0x1
    b .L_2348
.L_22d4:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_2348
    ldr r0, [sp, #0x68]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    bne .L_2348
    mov r0, r6
    bl func_ov002_021badb0
    cmp r0, #0x0
    beq .L_2348
    ldr r1, [r7, #0x4]
    ldr r2, _LIT29
    mov r0, r5
    bl func_ov002_021b3f0c
    cmp r0, #0x0
    beq .L_2348
    ldr r1, [r7, #0xc]
    mov r0, r4
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [sp]
    ldr r2, [r6, #0x10]
    ldr r1, [r6, #0x4]
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x2
    bl func_ov002_021d59cc
.L_2348:
    cmp r8, #0x0
    beq .L_2394
    ldr r1, [r6]
    ldr r0, [r6, #0x4]
    mov r1, r1, lsl #0x1f
    and r1, r1, #-2147483648
    orr r3, r1, #0xc200000
    mov r2, r0, lsl #0x10
    ldr r0, [r6, #0x10]
    ldr r1, [r6, #0xc]
    mov r0, r0, lsl #0x10
    and r2, r2, #0x1f0000
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    orr r3, r3, #0x20000000
    orr r2, r3, r2
    orr r0, r2, r0, lsr #0x10
    ldr r2, [sp, #0x68]
    bl func_ov002_021e30b4
.L_2394:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_2670
    ldr r0, _LIT1
    ldr r3, _LIT30
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r2, r1, r0
    ldr r0, [sp, #0x18]
    add r0, r3, r0
    ldrh fp, [r2, r0]
    cmp fp, #0x0
    beq .L_2670
    ldr r0, _LIT31
    add r0, r0, #0x1e
    str r0, [sp, #0x58]
    ldr r0, _LIT31
    add r0, r0, #0x22
    str r0, [sp, #0x5c]
    ldr r0, _LIT31
    add r0, r0, #0x22
    str r0, [sp, #0x50]
    ldr r0, _LIT34
    add r0, r0, #0xac
    str r0, [sp, #0x4c]
    ldr r0, _LIT34
    add r0, r0, #0xac
    str r0, [sp, #0x48]
    ldr r0, _LIT34
    add r0, r0, #0x108
    str r0, [sp, #0x60]
    ldr r0, _LIT34
    add r0, r0, #0x108
    str r0, [sp, #0x64]
    ldr r0, _LIT31
    add r0, r0, #0x1e
    str r0, [sp, #0x54]
.L_2428:
    ldr r0, _LIT33
    add r1, r0, fp, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh fp, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r3, r0, lsr #0x1c
    cmp r3, #0xa
    cmpne r3, #0xb
    bne .L_2668
    ldrh r0, [r1]
    ldr r1, _LIT5
    and r8, r0, #0xff
    mov r0, r0, asr #0x8
    and r9, r0, #0xff
    mov r0, #0x14
    smulbb r0, r9, r0
    str r0, [sp, #0xc]
    ldr r0, _LIT3
    and r2, r8, #0x1
    mla r1, r2, r1, r0
    ldr r0, [sp, #0xc]
    str r1, [sp, #0x8]
    add sl, r1, r0
    ldr r0, [sl, #0x30]
    ldr r1, [sl, #0x40]
    mov r0, r0, lsl #0x13
    mov r2, r0, lsr #0x13
    ldrh r0, [sl, #0x38]
    mov sl, r1, lsr #0x6
    and sl, sl, #0x1
    mvn sl, sl
    and r0, r0, sl
    mov sl, r1, lsr #0x2
    orr r1, sl, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_2668
    ldr r0, [sp, #0x48]
    mov sl, #0x0
    cmp r2, r0
    bgt .L_2520
    ldr r0, [sp, #0x4c]
    cmp r2, r0
    bge .L_25cc
    ldr r0, [sp, #0x50]
    cmp r2, r0
    bgt .L_2510
    ldr r0, [sp, #0x54]
    cmp r2, r0
    blt .L_2600
    ldr r0, [sp, #0x58]
    cmp r2, r0
    beq .L_254c
    ldr r0, [sp, #0x5c]
    cmp r2, r0
    beq .L_2578
    b .L_2600
.L_2510:
    ldr r0, _LIT34
    cmp r2, r0
    beq .L_25a4
    b .L_2600
.L_2520:
    ldr r0, [sp, #0x60]
    cmp r2, r0
    bgt .L_253c
    ldr r0, [sp, #0x64]
    cmp r2, r0
    beq .L_25d4
    b .L_2600
.L_253c:
    ldr r0, _LIT32
    cmp r2, r0
    beq .L_25a4
    b .L_2600
.L_254c:
    cmp r5, r8
    beq .L_2570
    ldr r2, _LIT31
    mov r0, r8
    mov r1, r9
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    moveq sl, #0x1
    beq .L_2600
.L_2570:
    mov sl, #0x0
    b .L_2600
.L_2578:
    cmp r3, #0xb
    bne .L_259c
    ldr r2, _LIT31
    mov r0, r8
    mov r1, r9
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    moveq sl, #0x1
    beq .L_2600
.L_259c:
    mov sl, #0x0
    b .L_2600
.L_25a4:
    cmp r5, r8
    beq .L_25c4
    ldr r0, [sp, #0x68]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    moveq sl, #0x1
    beq .L_2600
.L_25c4:
    mov sl, #0x0
    b .L_2600
.L_25cc:
    mov sl, #0x1
    b .L_2600
.L_25d4:
    ldr r0, [r7, #0x28]
    cmp r0, #0x5
    blt .L_2600
    mov r0, r2, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, sl
    str r0, [sp]
    mov r0, r8
    mov r1, r9
    mov r3, #0x1
    bl func_ov002_021d59cc
.L_2600:
    cmp sl, #0x0
    beq .L_2668
    ldr r0, [sp, #0x8]
    add r1, r0, #0x30
    ldr r0, [sp, #0xc]
    ldr r1, [r1, r0]
    mov r0, r8, lsl #0x1f
    and r2, r0, #-2147483648
    orr r2, r2, #0xc200000
    mov r0, r9, lsl #0x10
    orr r2, r2, #0x20000000
    and r0, r0, #0x1f0000
    orr r2, r2, r0
    mov r0, r1, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r0, r0, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    ldr r2, [sp, #0x68]
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_2668:
    cmp fp, #0x0
    bne .L_2428
.L_2670:
    ldr r1, [sp, #0x68]
    ldr r0, [sp, #0x4]
    bl func_ov002_021ded8c
.L_267c:
    mov r0, #0x0
    ldr fp, _LIT31
    str r0, [sp, #0x28]
.L_2688:
    ldr r0, _LIT7
    mov r9, #0x5
    ldr r1, [r0, #0xcec]
    ldr r0, [sp, #0x28]
    eor r8, r1, r0
    ldr r1, _LIT5
    ldr r0, _LIT3
    and r2, r8, #0x1
    mla r0, r2, r1, r0
    add sl, r0, #0x94
.L_26b0:
    ldr r0, [sl]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_26f4
    mov r0, r8
    mov r1, r9
    mov r2, fp
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_26f4
    ldr r3, [sl]
    mov r0, r8
    mov r3, r3, lsl #0x13
    mov r1, r9
    mov r2, #0x0
    mov r3, r3, lsr #0x13
    bl func_ov002_021de480
.L_26f4:
    add sl, sl, #0x14
    add r9, r9, #0x1
    cmp r9, #0xa
    blt .L_26b0
    ldr r0, [sp, #0x28]
    add r0, r0, #0x1
    str r0, [sp, #0x28]
    cmp r0, #0x2
    blt .L_2688
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_27f0
    ldr r1, [r6, #0x1c]
    ldr r0, [r7, #0x20]
    cmp r1, r0
    bge .L_27f0
    ldr r0, [r7, #0x8]
    cmp r0, #0x0
    beq .L_27f0
    mov r0, r7
    bl func_ov002_021badb0
    cmp r0, #0x0
    beq .L_27f0
    ldr r2, [r7, #0x10]
    ldr r1, _LIT37
    mov r3, #0x0
    cmp r2, r1
    bgt .L_2778
    bge .L_27b0
    sub r0, r1, #0x12c
    cmp r2, r0
    beq .L_279c
    b .L_27bc
.L_2778:
    add r0, r1, #0x5f
    cmp r2, r0
    bgt .L_278c
    moveq r3, #0x1
    b .L_27bc
.L_278c:
    add r0, r1, #0xf9
    cmp r2, r0
    beq .L_27b0
    b .L_27bc
.L_279c:
    ldr r0, _LIT1
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    movgt r3, #0x1
    b .L_27bc
.L_27b0:
    cmp r4, r5
    movne r3, #0x1
    moveq r3, #0x0
.L_27bc:
    cmp r3, #0x0
    beq .L_27f0
    ldr r0, _LIT1
    ldr r2, [r7, #0xc]
    ldr r1, [r0, #0x20]
    mov r0, r5
    bl func_ov002_021df62c
    ldr r0, _LIT1
    ldr r3, [r7, #0x10]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_021de480
.L_27f0:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_283c
    ldr r0, _LIT1
    ldr r2, _LIT38
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_283c
    ldr r1, _LIT38
    ldr r0, [sp, #0x14]
    bl func_ov002_021df6d4
    ldr r0, _LIT1
    ldr r3, _LIT38
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_021de480
.L_283c:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_2888
    ldr r0, _LIT1
    ldr r2, _LIT39
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_2888
    ldr r1, _LIT39
    ldr r0, [sp, #0x14]
    bl func_ov002_021df6d4
    ldr r0, _LIT1
    ldr r3, _LIT39
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_021de480
.L_2888:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_28d4
    ldr r0, _LIT1
    ldr r2, _LIT40
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_28d4
    ldr r1, _LIT40
    ldr r0, [sp, #0x14]
    bl func_ov002_021df6d4
    ldr r0, _LIT1
    ldr r3, _LIT40
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_021de480
.L_28d4:
    ldr r1, _LIT1
    mov r0, r5
    ldr r1, [r1, #0x20]
    mov r2, #0x1140
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_2924
    ldr r0, _LIT1
    ldr r2, [r6, #0xc]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021df62c
    ldr r0, _LIT1
    ldr r3, [r6, #0x10]
    ldr r1, [r0, #0x20]
    mov r0, r5
    mov r2, #0x1
    bl func_ov002_021de480
.L_2924:
    ldr r0, [sp, #0x2c]
    cmp r0, #0x0
    beq .L_295c
    mov r1, #0x1
    tst r0, r1, lsl r4
    beq .L_2944
    mov r0, r4
    bl func_ov002_021e286c
.L_2944:
    ldr r0, [sp, #0x2c]
    mov r1, #0x1
    tst r0, r1, lsl r5
    beq .L_295c
    mov r0, r5
    bl func_ov002_021e286c
.L_295c:
    bl func_ov002_021e2c5c
    ldr r1, _LIT7
    add sp, sp, #0xa0
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_297c:
    mov r0, #0x1
    add sp, sp, #0xa0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT30: .word data_ov002_022cf1a6
_LIT31: .word 0x000015b3
_LIT32: .word 0x00001a69
_LIT33: .word data_ov002_022d0650
_LIT34: .word 0x000018d0
_LIT35: .word 0x000016c6
_LIT36: .word 0x00001520
_LIT37: .word 0x00001658
_LIT38: .word 0x00001493
_LIT39: .word 0x0000162e
_LIT40: .word 0x00001883
