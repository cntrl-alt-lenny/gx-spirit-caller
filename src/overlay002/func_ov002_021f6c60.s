; func_ov002_021f6c60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021ae484
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021afffc
        .extern func_ov002_021b3ecc
        .extern func_ov002_021bbf50
        .extern func_ov002_021c325c
        .extern func_ov002_021c84e0
        .extern func_ov002_021d8128
        .extern func_ov002_021de64c
        .extern func_ov002_021f6940
        .extern func_ov002_02203b8c
        .extern func_ov002_022577dc
        .extern func_ov002_02257ab8
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .extern func_ov002_02280714
        .global func_ov002_021f6c60
        .arm
func_ov002_021f6c60:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r3, [r2, #0x5b4]
    cmp r3, #0x0
    beq .L_24
    cmp r3, #0x1
    beq .L_b0
    b .L_e0
.L_24:
    ldrh r2, [r4, #0x2]
    mov r2, r2, lsl #0x12
    mov r2, r2, lsr #0x1e
    cmp r2, #0x3
    bne .L_48
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_98
.L_48:
    bl func_ov002_02203b8c
    cmp r0, #0x2
    bne .L_8c
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_80
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_98
.L_80:
    ldr r0, _LIT3
    bl func_ov002_021ae484
    b .L_98
.L_8c:
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0xd44]
.L_98:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b0:
    ldr r0, _LIT1
    ldr r1, [r0, #0xd44]
    strh r1, [r4, #0x8]
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [r2, #0x5b4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r2, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e0:
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT4
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_30c
    ldr r1, _LIT0
    ldr r0, [r1, #0x5b4]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_518
    b .L_518
    b .L_518
    b .L_12c
    b .L_23c
    b .L_270
    b .L_2bc
.L_12c:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_21c
    bl func_ov002_021c325c
    cmp r0, #0xc
    movgt r6, #0xc
    bgt .L_16c
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c325c
    mov r6, r0
.L_16c:
    mov r5, r6
    cmp r6, #0x0
    ble .L_1a8
.L_178:
    strh r5, [r4, #0xa]
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_02257ab8
    cmp r0, #0x0
    bne .L_1a8
    sub r5, r5, #0x1
    cmp r5, #0x0
    bgt .L_178
.L_1a8:
    cmp r5, #0x0
    bne .L_1e8
    cmp r6, #0x1
    mov r5, #0x1
    blt .L_1e8
.L_1bc:
    strh r5, [r4, #0xa]
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_02257ab8
    cmp r0, #0x0
    bne .L_1e8
    add r5, r5, #0x1
    cmp r5, r6
    ble .L_1bc
.L_1e8:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r3, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, #0x0
    bl func_ov002_02280714
    ldr r1, _LIT0
    mov r0, #0x5
    str r0, [r1, #0x5b4]
    mov r0, #0x0
    str r0, [r1, #0x5bc]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_21c:
    mov r1, #0xa4
    bl func_ov002_021ae400
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_23c:
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, #0x33
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_270:
    ldr r1, _LIT1
    mov r0, r4
    ldr r1, [r1, #0xd44]
    strh r1, [r4, #0xa]
    bl func_ov002_022577dc
    cmp r0, #0x0
    mov r0, #0x0
    bne .L_2a4
    ldr r1, _LIT0
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2a4:
    ldr r1, _LIT0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    str r0, [r1, #0x5bc]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2bc:
    ldr r0, _LIT1
    ldr r1, [r1, #0x5bc]
    ldr r0, [r0, #0xd44]
    cmp r1, r0
    bcs .L_518
    add r0, r1, #0x1
    bl func_ov002_021afffc
    bl func_ov002_021afb74
    ldrh r3, [r4, #0x2]
    mov r1, r0
    mov r2, #0x0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8128
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5bc]
    add r2, r2, #0x1
    str r2, [r1, #0x5bc]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_30c:
    ldr r1, _LIT0
    ldr r0, [r1, #0x5b4]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_518
    b .L_518
    b .L_518
    b .L_338
    b .L_368
    b .L_46c
    b .L_4fc
.L_338:
    ldrh r0, [r4, #0x2]
    mov r1, #0xa4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    str r0, [r1, #0x5bc]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_368:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbf50
    cmp r0, #0x0
    bne .L_394
    ldr r0, _LIT0
    mov r1, #0x5
    str r1, [r0, #0x5b4]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_394:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r5, [r1, #0x5bc]
    bl func_ov002_021bbf50
    mov fp, #0x0
    mov r7, fp
    add r6, r5, r0
.L_3b8:
    ldr r1, _LIT5
    ldr r0, _LIT6
    and r2, r7, #0x1
    mla r0, r2, r1, r0
    mov r8, #0x0
    add sl, r0, #0x30
.L_3d0:
    ldr r1, [sl]
    mov r0, r7
    mov r2, r1, lsl #0x13
    mov r1, r8
    mov r9, r2, lsr #0x13
    bl func_ov002_021c84e0
    cmp r9, #0x0
    beq .L_404
    cmp r0, r5
    ble .L_404
    cmp r0, r6
    movle fp, #0x1
    ble .L_414
.L_404:
    add r8, r8, #0x1
    cmp r8, #0x5
    add sl, sl, #0x14
    blt .L_3d0
.L_414:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_3b8
    cmp fp, #0x0
    bne .L_43c
    ldr r0, _LIT0
    mov r1, #0x5
    str r1, [r0, #0x5b4]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_43c:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_46c:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_4b8
    ldr r1, _LIT1
    mov r0, r4
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    mov r3, #0x0
    bl func_ov002_021de64c
    ldr r0, _LIT0
    ldr r1, [r0, #0x5bc]
    add r1, r1, #0x1
    str r1, [r0, #0x5bc]
    ldr r1, [r0, #0x5b4]
    sub r1, r1, #0x1
    str r1, [r0, #0x5b4]
    b .L_4f4
.L_4b8:
    ldr r0, _LIT0
    ldr r1, [r0, #0x5bc]
    cmp r1, #0x0
    moveq r1, #0x0
    streq r1, [r0, #0x5b4]
    beq .L_4f4
    mov r0, r4
    strh r1, [r4, #0xa]
    bl func_ov002_022577dc
    cmp r0, #0x0
    beq .L_4f4
    ldr r0, _LIT0
    ldr r1, [r0, #0x5b4]
    add r1, r1, #0x1
    str r1, [r0, #0x5b4]
.L_4f4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4fc:
    ldr r2, [r1, #0x5bc]
    mov r0, #0x0
    strh r2, [r4, #0xa]
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_518:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d016c
_LIT2: .word data_ov002_022cd744
_LIT3: .word 0x0000010e
_LIT4: .word 0x000014a0
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022cf16c
_LIT7: .word func_ov002_021f6940
