; func_ov008_021adc44 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov008_021b2780
        .extern data_ov008_021b279c
        .extern data_ov008_021b2c80
        .extern data_ov008_021b2dc0
        .extern data_ov008_021b2dc8
        .extern data_ov008_021b2dd4
        .extern func_02006110
        .extern func_02006164
        .extern func_02037208
        .extern func_020b3870
        .extern func_ov008_021aa578
        .extern func_ov008_021ada90
        .extern func_ov008_021adbbc
        .extern func_ov008_021b1ee0
        .global func_ov008_021adc44
        .arm
func_ov008_021adc44:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x8
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
    mov r0, #0x2
    mov r1, #0xa4
    mov r2, #0x2c
    mov r3, #0xbe
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_021adc9c
    bl func_02006164
    cmp r0, #0x0
    ldrne r0, .L_021ae37c
    movne r1, #0x1
    strne r1, [r0, #0x560]
    ldr r0, .L_021ae37c
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x2
    str r1, [r0, #0x634]
    b .L_021adca8
.L_021adc9c:
    ldr r0, .L_021ae37c
    mov r1, #0x0
    str r1, [r0, #0x560]
.L_021adca8:
    mov r0, #0xe3
    mov r1, #0xa4
    mov r2, #0xfd
    mov r3, #0xbe
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_021adcec
    bl func_02006164
    cmp r0, #0x0
    ldrne r0, .L_021ae37c
    movne r1, #0x1
    strne r1, [r0, #0x55c]
    ldr r0, .L_021ae37c
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x1
    str r1, [r0, #0x634]
    b .L_021adcf8
.L_021adcec:
    ldr r0, .L_021ae37c
    mov r1, #0x0
    str r1, [r0, #0x55c]
.L_021adcf8:
    ldr r0, .L_021ae380
    ldrh r0, [r0, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x2
    bls .L_021adf84
    mov r0, #0xdc
    mov r1, #0x19
    mov r2, #0xf4
    mov r3, #0x2e
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_021adda0
    ldr r0, .L_021ae37c
    ldr r2, .L_021ae380
    ldr r3, [r0, #0x634]
    ldr r1, .L_021ae384
    orr r3, r3, #0x40
    str r3, [r0, #0x634]
    str r3, [r2, #0x14]
    ldrh r0, [r1, #0x58]
    cmp r0, #0x0
    bne .L_021add98
    ldrh r3, [r2, #0x4]
    mov r0, r3, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_021adda0
    add r0, r0, #0xff
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r3, r3, #0xff
    and r0, r0, #0xff
    orr r3, r3, r0
    ldr r0, .L_021ae388
    strh r3, [r2, #0x4]
    strh r0, [r2, #0x8]
    mov r0, #0x8
    strh r0, [r1, #0x58]
    b .L_021adda0
.L_021add98:
    sub r0, r0, #0x1
    strh r0, [r1, #0x58]
.L_021adda0:
    mov r0, #0xc
    mov r1, r0
    mov r2, #0xd4
    mov r3, #0x14
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_021ade1c
    ldr r2, .L_021ae384
    ldrh r0, [r2, #0x58]
    cmp r0, #0x0
    bne .L_021ade14
    ldr r1, .L_021ae380
    ldrh r3, [r1, #0x4]
    mov r0, r3, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_021ade1c
    add r0, r0, #0xff
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r3, r3, #0xff
    and r0, r0, #0xff
    orr r3, r3, r0
    ldr r0, .L_021ae388
    strh r3, [r1, #0x4]
    strh r0, [r1, #0x8]
    mov r0, #0x8
    strh r0, [r2, #0x58]
    b .L_021ade1c
.L_021ade14:
    sub r0, r0, #0x1
    strh r0, [r2, #0x58]
.L_021ade1c:
    mov r0, #0xdc
    mov r1, #0x85
    mov r2, #0xf4
    mov r3, #0x9a
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_021adebc
    ldr r0, .L_021ae37c
    ldr r2, .L_021ae380
    ldr r3, [r0, #0x634]
    ldr r1, .L_021ae384
    orr r3, r3, #0x80
    str r3, [r0, #0x634]
    str r3, [r2, #0x14]
    ldrh r0, [r1, #0x58]
    cmp r0, #0x0
    bne .L_021adeb4
    ldrh r0, [r2, #0x6]
    ldrh r3, [r2, #0x4]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    mov r4, r3, lsl #0x18
    sub r0, r0, #0x2
    cmp r0, r4, lsr #0x18
    mov r0, r4, lsr #0x18
    ble .L_021adebc
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r3, r3, #0xff
    and r0, r0, #0xff
    orr r0, r3, r0
    strh r0, [r2, #0x4]
    mov r0, #0x4
    strh r0, [r2, #0x8]
    mov r0, #0x8
    strh r0, [r1, #0x58]
    b .L_021adebc
.L_021adeb4:
    sub r0, r0, #0x1
    strh r0, [r1, #0x58]
.L_021adebc:
    mov r0, #0xc
    mov r1, #0x9c
    mov r2, #0xd4
    mov r3, #0xa4
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_021adf48
    ldr r2, .L_021ae384
    ldrh r0, [r2, #0x58]
    cmp r0, #0x0
    bne .L_021adf40
    ldr r1, .L_021ae380
    ldrh r0, [r1, #0x6]
    ldrh r3, [r1, #0x4]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    mov r4, r3, lsl #0x18
    sub r0, r0, #0x2
    cmp r0, r4, lsr #0x18
    mov r0, r4, lsr #0x18
    ble .L_021adf48
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r3, r3, #0xff
    and r0, r0, #0xff
    orr r0, r3, r0
    strh r0, [r1, #0x4]
    mov r0, #0x4
    strh r0, [r1, #0x8]
    mov r0, #0x8
    strh r0, [r2, #0x58]
    b .L_021adf48
.L_021adf40:
    sub r0, r0, #0x1
    strh r0, [r2, #0x58]
.L_021adf48:
    mov r0, #0xdc
    mov r1, #0x2e
    mov r2, #0xf4
    mov r3, #0x85
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_021adf84
    ldr r0, [sp, #0x0]
    bl func_ov008_021adbbc
    ldr r1, .L_021ae37c
    ldr r0, .L_021ae380
    ldr r2, [r1, #0x634]
    orr r2, r2, #0x100
    str r2, [r1, #0x634]
    str r2, [r0, #0x14]
.L_021adf84:
    ldr r1, .L_021ae38c
    mov r0, #0x34
    ldrh r2, [r1, #0x6]
    ldr r1, .L_021ae390
    mov r2, r2, lsl #0x18
    mov r2, r2, lsr #0x18
    mul r0, r2, r0
    ldrh r1, [r1, r0]
    ldr r0, .L_021ae380
    ldrh r0, [r0, #0x4]
    cmp r1, #0x5
    movgt r9, #0x16
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    mov r8, r1
    add r0, r0, r0, lsl #0x2
    sub r8, r8, r0
    movle r9, #0x38
    cmp r8, #0xa
    movgt r8, #0xa
    cmp r1, #0xa
    bls .L_021adff8
    cmp r8, #0x5
    movgt r0, #0x5
    movle r0, r8
    mov r1, r0, lsl #0x1
    mov r0, #0xc8
    bl func_020b3870
    b .L_021ae010
.L_021adff8:
    cmp r8, #0x5
    movgt r0, #0x5
    movle r0, r8
    mov r1, r0, lsl #0x1
    mov r0, #0xe8
    bl func_020b3870
.L_021ae010:
    mov r10, r0
    cmp r8, #0x0
    mov r7, #0x0
    ble .L_021ae1ac
    ldr r5, .L_021ae394
    mov r4, #0x5
    mov r6, #0x46
.L_021ae02c:
    mov r2, r7, lsr #0x1f
    smull r0, r1, r5, r7
    add r1, r2, r1, asr #0x1
    smull r0, r1, r4, r1
    sub r1, r7, r0
    mov r0, r1, lsl #0x1
    add r0, r0, #0x1
    mul ip, r10, r0
    smull r0, r3, r5, r7
    add r3, r2, r3, asr #0x1
    mla r1, r3, r6, r9
    sub r0, ip, #0x4
    add r2, r0, #0x20
    add r3, r1, #0x40
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_021ae1a0
    ldr r1, .L_021ae380
    mov r0, r7, lsl #0x10
    ldrh r3, [r1, #0x4]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x18
    bic r2, r3, #0xff00
    mov r3, r3, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    strh r0, [r1, #0x4]
    mov r4, r3, lsr #0x18
    bl func_02006164
    cmp r0, #0x0
    beq .L_021ae174
    ldr r1, .L_021ae380
    ldr r3, .L_021ae398
    ldrh r2, [r1, #0x4]
    ldrh r5, [r1, #0x6]
    mov r4, #0x1
    mov r0, r2, lsl #0x18
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x10
    add r0, r0, r0, lsl #0x2
    add r0, r0, r2, lsr #0x18
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r5, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r2, r0, lsr #0x10
    strh r0, [r1, #0x6]
    ldrh r0, [r1, #0x6]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    mov r5, r0, lsr #0x5
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1b
    ldr r2, [r3, r5, lsl #0x2]
    add r1, r1, r0, ror #0x1b
    tst r2, r4, lsl r1
    beq .L_021ae138
    mvn r0, r4, lsl r1
    mov r1, r2
    and r0, r1, r0
    str r0, [r3, r5, lsl #0x2]
    bl func_ov008_021ada90
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, r4
    bl func_02037208
    b .L_021ae1ac
.L_021ae138:
    mov r0, r2
    orr r0, r0, r4, lsl r1
    str r0, [r3, r5, lsl #0x2]
    bl func_ov008_021ada90
    ldr r0, .L_021ae37c
    mov r2, #0x0
    ldr r1, [r0, #0x638]
    mov r3, #0x1
    cmp r1, #0x0
    addeq r1, r1, #0x1
    streq r1, [r0, #0x638]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_02037208
    b .L_021ae1ac
.L_021ae174:
    ldr r0, .L_021ae380
    ldrh r0, [r0, #0x4]
    mov r0, r0, lsl #0x10
    cmp r4, r0, lsr #0x18
    beq .L_021ae1ac
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_021ae1ac
.L_021ae1a0:
    add r7, r7, #0x1
    cmp r7, r8
    blt .L_021ae02c
.L_021ae1ac:
    mov r0, #0x2e
    mov r1, #0xa4
    mov r2, #0x48
    mov r3, #0xbe
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_021ae278
    ldr r0, .L_021ae37c
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x4
    str r1, [r0, #0x634]
    bl func_02006164
    cmp r0, #0x0
    beq .L_021ae278
    ldr r0, .L_021ae38c
    mov r1, #0x34
    ldrh r3, [r0, #0x6]
    ldr r2, .L_021ae390
    mov r0, #0x0
    mov r3, r3, lsl #0x18
    mov r3, r3, lsr #0x18
    mul r1, r3, r1
    ldrh r7, [r2, r1]
    cmp r7, #0x0
    ble .L_021ae24c
    ldr r5, .L_021ae39c
    mov r3, #0x1
.L_021ae218:
    mov r1, r0, asr #0x4
    add r1, r0, r1, lsr #0x1b
    mov r1, r1, asr #0x5
    add r6, r5, r1, lsl #0x2
    mov r2, r0, lsr #0x1f
    rsb r1, r2, r0, lsl #0x1b
    ldr r4, [r6, #0xc]
    add r1, r2, r1, ror #0x1b
    orr r1, r4, r3, lsl r1
    add r0, r0, #0x1
    str r1, [r6, #0xc]
    cmp r0, r7
    blt .L_021ae218
.L_021ae24c:
    bl func_ov008_021ada90
    ldr r0, .L_021ae37c
    mov r2, #0x0
    ldr r1, [r0, #0x638]
    mov r3, #0x1
    cmp r1, #0x0
    addeq r1, r1, #0x1
    streq r1, [r0, #0x638]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_02037208
.L_021ae278:
    mov r0, #0x4a
    mov r1, #0xa4
    mov r2, #0x64
    mov r3, #0xbe
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_021ae334
    ldr r0, .L_021ae37c
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x8
    str r1, [r0, #0x634]
    bl func_02006164
    cmp r0, #0x0
    beq .L_021ae334
    ldr r1, .L_021ae38c
    mov r0, #0x34
    ldrh r3, [r1, #0x6]
    ldr r2, .L_021ae390
    mov r1, #0x0
    mov r3, r3, lsl #0x18
    mov r3, r3, lsr #0x18
    mul r0, r3, r0
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    ble .L_021ae31c
    ldr r6, .L_021ae39c
    mov r5, #0x1
.L_021ae2e4:
    mov r2, r1, asr #0x4
    add r2, r1, r2, lsr #0x1b
    mov r4, r1, lsr #0x1f
    rsb r3, r4, r1, lsl #0x1b
    mov r2, r2, asr #0x5
    add r7, r6, r2, lsl #0x2
    add r2, r4, r3, ror #0x1b
    add r1, r1, #0x1
    mvn r2, r5, lsl r2
    ldr r3, [r7, #0xc]
    cmp r1, r0
    and r2, r3, r2
    str r2, [r7, #0xc]
    blt .L_021ae2e4
.L_021ae31c:
    bl func_ov008_021ada90
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_021ae334:
    bl func_ov008_021b1ee0
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
    mov r0, #0xe3
    mov r1, #0x0
    mov r2, #0x100
    mov r3, #0x14
    bl func_ov008_021aa578
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
    ldr r0, .L_021ae37c
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x400
    str r1, [r0, #0x634]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_021ae37c:
        .word   data_ov008_021b2780
.L_021ae380:
        .word   data_ov008_021b2dc8
.L_021ae384:
        .word   data_ov008_021b2c80
.L_021ae388:
        .word   0xfffc
.L_021ae38c:
        .word   data_ov008_021b2dc0
.L_021ae390:
        .word   data_ov008_021b279c
.L_021ae394:
        .word   0x66666667
.L_021ae398:
        .word   data_ov008_021b2dd4
.L_021ae39c:
        .word   data_ov008_021b2dc8
