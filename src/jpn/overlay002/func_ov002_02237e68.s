; func_ov002_02237e68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021ae434
        .extern func_ov002_021bc5e4
        .extern func_ov002_021ca310
        .extern func_ov002_021d58dc
        .extern func_ov002_021d5918
        .extern func_ov002_021de3c0
        .extern func_ov002_021ea1c4
        .extern func_ov002_021f4170
        .extern func_ov002_021ff2cc
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .extern func_ov002_02257790
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .extern func_ov002_0226afe0
        .extern func_ov002_0227acc8
        .global func_ov002_02237e68
        .arm
func_ov002_02237e68:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r6, r1
    mov r1, #0x0
    mov r7, r0
    bl func_ov002_0223dda4
    ldr r2, _LIT0
    mov r1, r0, lsl #0x10
    mov r3, r1, lsr #0x10
    ldr r1, [r2, #0x5a8]
    mov r3, r3, asr #0x8
    cmp r1, #0x7f
    and r4, r0, #0xff
    and r5, r3, #0xff
    beq .L_17c
    cmp r1, #0x80
    bne .L_1b4
    mov r1, #0x0
    mov r0, r7
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r4
    mov r2, r5
    bl func_ov002_02257564
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r1, _LIT1
    mov r0, r7
    mov r4, #0x1
    bl func_ov002_02257790
    cmp r0, #0x0
    mov r0, r7
    mov r1, r6
    orrne r4, r4, #0x2
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    beq .L_cc
    ldrh r0, [r7, #0x2]
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca310
    cmp r0, #0x0
    orrne r4, r4, #0x4
.L_cc:
    ldrh r1, [r7, #0x2]
    ldr r0, _LIT3
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_128
    tst r4, #0x4
    beq .L_100
    ldr r0, _LIT4
    mov r1, #0x2
    str r1, [r0, #0xd44]
    b .L_170
.L_100:
    tst r4, #0x2
    beq .L_118
    ldr r0, _LIT4
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_170
.L_118:
    ldr r0, _LIT4
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_170
.L_128:
    ldrh r0, [r7]
    mov r1, #0x0
    bl func_ov002_021f4170
    mov r6, r0
    ldrh r0, [r7]
    mov r1, #0x1
    bl func_ov002_021f4170
    mov r5, r0
    ldrh r0, [r7]
    mov r1, #0x2
    bl func_ov002_021f4170
    mov r3, r0
    mov r0, #0x0
    stmia sp, {r0, r4}
    ldr r0, _LIT5
    mov r1, r6
    mov r2, r5
    bl func_ov002_021ae434
.L_170:
    add sp, sp, #0xc
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_17c:
    ldr r0, _LIT4
    ldr r1, [r0, #0xd44]
    add r1, r1, #0x1
    strh r1, [r7, #0xc]
    ldrh r3, [r7, #0x2]
    ldr r2, [r0, #0xd44]
    ldrh r1, [r7]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226afe0
    add sp, sp, #0xc
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_1b4:
    ldrh r0, [r7, #0xc]
    cmp r0, #0x1
    beq .L_1d4
    cmp r0, #0x2
    beq .L_204
    cmp r0, #0x3
    beq .L_294
    b .L_370
.L_1d4:
    mov r0, #0x3
    str r0, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldrh r3, [r7]
    mov r0, r7
    mov r1, r4
    mov r2, r5
    bl func_ov002_021d5918
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_204:
    cmp r1, #0x7d
    beq .L_24c
    cmp r1, #0x7e
    bne .L_288
    ldrh r0, [r7, #0x2]
    mov r1, #0x8e
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldrh r0, [r7, #0x2]
    ldrh r1, [r7]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    add sp, sp, #0xc
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_24c:
    bl func_ov002_0225930c
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x7e
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r1, _LIT4
    mov r0, r7
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_021de3c0
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_288:
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_294:
    cmp r1, #0x7d
    beq .L_328
    cmp r1, #0x7e
    bne .L_364
    mov r2, #0x0
    sub r0, r2, #0x2000
    and r0, r0, #0x0
    add r3, sp, #0x8
    orr r1, r0, #0xed
    orr r1, r1, #0x1900
    str r2, [r3]
    str r1, [sp, #0x8]
    ldrh r0, [r7, #0x2]
    bic r1, r1, #0x2000
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x12
    str r0, [sp, #0x8]
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc5e4
    ldr r2, _LIT0
    add r1, sp, #0x8
    str r0, [r2, #0x5ac]
    ldrh r3, [r7, #0x2]
    ldrh r0, [r7]
    mov r2, #0x1
    mov r4, r3, lsl #0x1f
    mov r3, r0, lsl #0x10
    mov r0, r4, lsr #0x1f
    orr r3, r3, #0x1
    bl func_ov002_0227acc8
    add sp, sp, #0xc
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_328:
    mov r0, #0x0
    str r0, [sp]
    ldrh r3, [r7, #0x2]
    ldr r1, [r2, #0x5ac]
    mov r0, r4
    mov r2, r3, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r2, r1, lsl #0x10
    mov r1, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x6
    bl func_ov002_021d58dc
.L_364:
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_370:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word func_ov002_021ea1c4
_LIT2: .word 0x000019ed
_LIT3: .word data_ov002_022cd664
_LIT4: .word data_ov002_022d008c
_LIT5: .word 0x00000103
