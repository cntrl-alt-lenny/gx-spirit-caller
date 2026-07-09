; func_ov002_021fb624 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021ae3dc
        .extern func_ov002_021df53c
        .extern func_ov002_021e267c
        .extern func_ov002_021e269c
        .extern func_ov002_021ff37c
        .extern func_ov002_022106c4
        .extern func_ov002_02253600
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_0227dd08
        .extern func_ov002_022903f0
        .global func_ov002_021fb624
        .arm
func_ov002_021fb624:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r2, _LIT0
    mov r8, r0
    ldr r2, [r2, #0x5b4]
    cmp r2, #0x4
    addls pc, pc, r2, lsl #0x2
    b .L_2cc
    b .L_30
    b .L_9c
    b .L_1b4
    b .L_214
    b .L_28c
.L_30:
    bl func_ov002_021ff37c
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r1, [r8, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_70
    mov r0, r8
    bl func_ov002_0227dd08
    ldr r1, _LIT2
    str r0, [r1, #0xd44]
    b .L_84
.L_70:
    ldrh r1, [r8, #0x4]
    mov r0, #0xfa
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021ae3dc
.L_84:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_9c:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r1, [r8, #0x2]
    ldrh r0, [r8, #0x4]
    mov r3, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r2, r0, lsl #0x11
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021df53c
    ldrh r0, [r8, #0x2]
    ldr r9, _LIT3
    mov r7, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mul r2, r1, r9
    ldr r1, _LIT4
    mov r5, r7
    ldr r1, [r1, r2]
    cmp r1, #0x0
    bls .L_144
    ldr r4, _LIT5
.L_108:
    ldrh r1, [r8]
    mov r2, r5
    bl func_ov002_02253600
    cmp r0, #0x0
    ldrh r0, [r8, #0x2]
    movne r6, r5
    add r5, r5, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r9, r4
    ldr r1, [r1, #0xc]
    addne r7, r7, #0x1
    cmp r5, r1
    bcc .L_108
.L_144:
    cmp r7, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r7, #0x1
    bne .L_19c
    and r2, r0, #0x1
    ldr r3, _LIT5
    ldr r0, _LIT3
    ldr r1, _LIT0
    mla r0, r2, r0, r3
    add r0, r0, #0x120
    ldr r3, [r0, r6, lsl #0x2]
    mov r0, #0x4
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    strh r2, [r8, #0x8]
    str r0, [r1, #0x5b4]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_19c:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1b4:
    ldrh r0, [r8, #0x2]
    ldr r1, _LIT6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldrh r0, [r8, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_1f4
    ldrh r1, [r8]
    ldr r2, _LIT7
    bl func_ov002_022903f0
    b .L_1fc
.L_1f4:
    ldr r0, _LIT7
    bl func_ov002_02259204
.L_1fc:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_214:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_274
    ldr r1, _LIT2
    ldr r3, _LIT5
    ldr r2, [r1, #0xd70]
    ldr r0, _LIT3
    and r2, r2, #0x1
    mla r3, r2, r0, r3
    ldr r0, [r1, #0xd78]
    add r1, r3, #0x120
    ldr r2, [r1, r0, lsl #0x2]
    ldr r1, _LIT0
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    strh r0, [r8, #0x8]
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_274:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_28c:
    ldrh r0, [r8, #0x2]
    ldrh r1, [r8, #0x8]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e269c
    ldrh r2, [r8, #0x2]
    ldrh r0, [r8, #0x4]
    ldrh r1, [r8]
    mov r3, r2, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r0, r3, lsr #0x1f
    mov r3, r2, lsr #0x17
    mov r2, #0x5
    bl func_ov002_021e267c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2cc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d008c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf098
_LIT5: .word data_ov002_022cf08c
_LIT6: .word 0x0000011e
_LIT7: .word func_ov002_022106c4
