; func_ov002_022725c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd238
        .extern data_ov002_022cd664
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_0202b0ac
        .extern func_0202effc
        .extern func_ov002_021ae320
        .extern func_ov002_021ae3dc
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b96f4
        .extern func_ov002_021bc538
        .extern func_ov002_021dea38
        .extern func_ov002_021df53c
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_0226ea6c
        .extern func_ov002_02271620
        .extern func_ov002_022719c4
        .extern func_ov002_022903f0
        .extern func_ov002_0229cd4c
        .global func_ov002_022725c4
        .arm
func_ov002_022725c4:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x100
    ldr r1, _LIT0
    ldr r0, [r1, #0x18]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_340
    b .L_34
    b .L_144
    b .L_280
    b .L_324
.L_34:
    ldr r0, [r1]
    mov r2, #0x2
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1e
    ldr r0, _LIT0
    movne r4, #0x40
    ldrh r1, [r0, #0x16]
    ldr r5, [r0]
    moveq r4, #0x10
    mov r3, r1, lsl #0x1a
    mov r0, r5, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r5, lsr #0x17
    mov r3, r3, lsr #0x1e
    bl func_ov002_0226ea6c
    and r0, r4, r0
    cmp r0, #0x0
    ble .L_108
    ldr r0, _LIT0
    mov r2, #0x0
    ldrh r1, [r0, #0x16]
    ldr r5, [r0]
    mov r0, r5, lsl #0x1f
    mov r3, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r5, lsr #0x17
    mov r3, r3, lsr #0x1e
    bl func_ov002_0226ea6c
    and r0, r4, r0
    cmp r0, #0x0
    ble .L_f8
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_e0
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_114
.L_e0:
    ldr r1, _LIT3
    bl func_ov002_021b96f4
    mov r1, r0
    mov r0, #0xfa
    bl func_ov002_021ae3dc
    b .L_114
.L_f8:
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_114
.L_108:
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0, #0xd44]
.L_114:
    ldr r3, _LIT4
    add sp, sp, #0x100
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_144:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    bne .L_1e8
    ldr r0, [r1]
    mov r1, r0, lsl #0x18
    movs r1, r1, lsr #0x1e
    bne .L_1d4
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202effc
    cmp r0, #0x0
    beq .L_1d4
    ldr r0, _LIT0
    ldr r2, _LIT5
    ldr r3, [r0]
    mov r1, #0xb
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, r3, lsr #0x17
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    beq .L_1d4
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    beq .L_1d4
    ldr r0, _LIT0
    mov r1, #0x0
    strb r1, [r0, #0x8]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1d4:
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    bic r1, r1, #0xff
    str r1, [r0, #0x18]
    b .L_340
.L_1e8:
    ldr r0, _LIT3
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0x13
    bl func_ov002_0229cd4c
    ldr r0, _LIT0
    add r1, sp, #0x0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_248
    ldr r2, _LIT6
    mov r1, #0x1
    bl func_ov002_022903f0
    b .L_250
.L_248:
    ldr r0, _LIT6
    bl func_ov002_02259204
.L_250:
    ldr r3, _LIT4
    add sp, sp, #0x100
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_280:
    bl func_ov002_0225930c
    cmp r0, #0x0
    addeq sp, sp, #0x100
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT2
    ldr r2, _LIT7
    ldr r4, [r0, #0xd70]
    ldr r5, [r0, #0xd74]
    ldr r3, [r0, #0xd78]
    ldr r0, _LIT8
    and r1, r4, #0x1
    mla r2, r1, r0, r2
    add r5, r5, r3
    mov r0, #0x14
    mul r0, r5, r0
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r0, r4
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r5
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    mov r0, r4
    mov r1, r5
    bl func_ov002_021dea38
    ldr r3, _LIT4
    add sp, sp, #0x100
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_324:
    mov r2, #0x0
    ldr r0, _LIT3
    strb r2, [r1, #0x8]
    strh r0, [r1, #0x6]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_340:
    bl func_ov002_022719c4
    add sp, sp, #0x100
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d008c
_LIT3: .word 0x000019b2
_LIT4: .word data_ov002_022cd238
_LIT5: .word 0x000019ad
_LIT6: .word func_ov002_02271620
_LIT7: .word data_ov002_022cf08c
_LIT8: .word 0x00000868
