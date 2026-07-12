; func_ov008_021adb20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2660
        .extern data_ov008_021b267c
        .extern data_ov008_021b2b60
        .extern data_ov008_021b2ca0
        .extern data_ov008_021b2ca8
        .extern data_ov008_021b2cb4
        .extern func_020060f4
        .extern func_02006148
        .extern func_020371b8
        .extern func_020b377c
        .extern func_ov008_021aa498
        .extern func_ov008_021ad96c
        .extern func_ov008_021ada98
        .extern func_ov008_021b1dbc
        .global func_ov008_021adb20
        .arm
func_ov008_021adb20:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_020060f4
    mov r0, #0x2
    mov r1, #0xa4
    mov r2, #0x2c
    mov r3, #0xbe
    bl func_ov008_021aa498
    cmp r0, #0x0
    beq .L_58
    bl func_02006148
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0x1
    strne r1, [r0, #0x560]
    ldr r0, _LIT0
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x2
    str r1, [r0, #0x634]
    b .L_64
.L_58:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x560]
.L_64:
    mov r0, #0xe3
    mov r1, #0xa4
    mov r2, #0xfd
    mov r3, #0xbe
    bl func_ov008_021aa498
    cmp r0, #0x0
    beq .L_a8
    bl func_02006148
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0x1
    strne r1, [r0, #0x55c]
    ldr r0, _LIT0
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x1
    str r1, [r0, #0x634]
    b .L_b4
.L_a8:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x55c]
.L_b4:
    ldr r0, _LIT1
    ldrh r0, [r0, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x2
    bls .L_340
    mov r0, #0xdc
    mov r1, #0x19
    mov r2, #0xf4
    mov r3, #0x2e
    bl func_ov008_021aa498
    cmp r0, #0x0
    beq .L_15c
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r3, [r0, #0x634]
    ldr r1, _LIT2
    orr r3, r3, #0x40
    str r3, [r0, #0x634]
    str r3, [r2, #0x14]
    ldrh r0, [r1, #0x58]
    cmp r0, #0x0
    bne .L_154
    ldrh r3, [r2, #0x4]
    mov r0, r3, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_15c
    add r0, r0, #0xff
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r3, r3, #0xff
    and r0, r0, #0xff
    orr r3, r3, r0
    ldr r0, _LIT3
    strh r3, [r2, #0x4]
    strh r0, [r2, #0x8]
    mov r0, #0x8
    strh r0, [r1, #0x58]
    b .L_15c
.L_154:
    sub r0, r0, #0x1
    strh r0, [r1, #0x58]
.L_15c:
    mov r0, #0xc
    mov r1, r0
    mov r2, #0xd4
    mov r3, #0x14
    bl func_ov008_021aa498
    cmp r0, #0x0
    beq .L_1d8
    ldr r2, _LIT2
    ldrh r0, [r2, #0x58]
    cmp r0, #0x0
    bne .L_1d0
    ldr r1, _LIT1
    ldrh r3, [r1, #0x4]
    mov r0, r3, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_1d8
    add r0, r0, #0xff
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r3, r3, #0xff
    and r0, r0, #0xff
    orr r3, r3, r0
    ldr r0, _LIT3
    strh r3, [r1, #0x4]
    strh r0, [r1, #0x8]
    mov r0, #0x8
    strh r0, [r2, #0x58]
    b .L_1d8
.L_1d0:
    sub r0, r0, #0x1
    strh r0, [r2, #0x58]
.L_1d8:
    mov r0, #0xdc
    mov r1, #0x85
    mov r2, #0xf4
    mov r3, #0x9a
    bl func_ov008_021aa498
    cmp r0, #0x0
    beq .L_278
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r3, [r0, #0x634]
    ldr r1, _LIT2
    orr r3, r3, #0x80
    str r3, [r0, #0x634]
    str r3, [r2, #0x14]
    ldrh r0, [r1, #0x58]
    cmp r0, #0x0
    bne .L_270
    ldrh r0, [r2, #0x6]
    ldrh r3, [r2, #0x4]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    mov r4, r3, lsl #0x18
    sub r0, r0, #0x2
    cmp r0, r4, lsr #0x18
    mov r0, r4, lsr #0x18
    ble .L_278
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
    b .L_278
.L_270:
    sub r0, r0, #0x1
    strh r0, [r1, #0x58]
.L_278:
    mov r0, #0xc
    mov r1, #0x9c
    mov r2, #0xd4
    mov r3, #0xa4
    bl func_ov008_021aa498
    cmp r0, #0x0
    beq .L_304
    ldr r2, _LIT2
    ldrh r0, [r2, #0x58]
    cmp r0, #0x0
    bne .L_2fc
    ldr r1, _LIT1
    ldrh r0, [r1, #0x6]
    ldrh r3, [r1, #0x4]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    mov r4, r3, lsl #0x18
    sub r0, r0, #0x2
    cmp r0, r4, lsr #0x18
    mov r0, r4, lsr #0x18
    ble .L_304
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
    b .L_304
.L_2fc:
    sub r0, r0, #0x1
    strh r0, [r2, #0x58]
.L_304:
    mov r0, #0xdc
    mov r1, #0x2e
    mov r2, #0xf4
    mov r3, #0x85
    bl func_ov008_021aa498
    cmp r0, #0x0
    beq .L_340
    ldr r0, [sp]
    bl func_ov008_021ada98
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1, #0x634]
    orr r2, r2, #0x100
    str r2, [r1, #0x634]
    str r2, [r0, #0x14]
.L_340:
    ldr r1, _LIT4
    mov r0, #0x34
    ldrh r2, [r1, #0x6]
    ldr r1, _LIT5
    mov r2, r2, lsl #0x18
    mov r2, r2, lsr #0x18
    mul r0, r2, r0
    ldrh r1, [r1, r0]
    ldr r0, _LIT1
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
    bls .L_3b4
    cmp r8, #0x5
    movgt r0, #0x5
    movle r0, r8
    mov r1, r0, lsl #0x1
    mov r0, #0xc8
    bl func_020b377c
    b .L_3cc
.L_3b4:
    cmp r8, #0x5
    movgt r0, #0x5
    movle r0, r8
    mov r1, r0, lsl #0x1
    mov r0, #0xe8
    bl func_020b377c
.L_3cc:
    mov sl, r0
    cmp r8, #0x0
    mov r7, #0x0
    ble .L_568
    ldr r5, _LIT6
    mov r4, #0x5
    mov r6, #0x46
.L_3e8:
    mov r2, r7, lsr #0x1f
    smull r0, r1, r5, r7
    add r1, r2, r1, asr #0x1
    smull r0, r1, r4, r1
    sub r1, r7, r0
    mov r0, r1, lsl #0x1
    add r0, r0, #0x1
    mul ip, sl, r0
    smull r0, r3, r5, r7
    add r3, r2, r3, asr #0x1
    mla r1, r3, r6, r9
    sub r0, ip, #0x4
    add r2, r0, #0x20
    add r3, r1, #0x40
    bl func_ov008_021aa498
    cmp r0, #0x0
    beq .L_55c
    ldr r1, _LIT1
    mov r0, r7, lsl #0x10
    ldrh r3, [r1, #0x4]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x18
    bic r2, r3, #0xff00
    mov r3, r3, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    strh r0, [r1, #0x4]
    mov r4, r3, lsr #0x18
    bl func_02006148
    cmp r0, #0x0
    beq .L_530
    ldr r1, _LIT1
    ldr r3, _LIT7
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
    beq .L_4f4
    mvn r0, r4, lsl r1
    mov r1, r2
    and r0, r1, r0
    str r0, [r3, r5, lsl #0x2]
    bl func_ov008_021ad96c
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, r4
    bl func_020371b8
    b .L_568
.L_4f4:
    mov r0, r2
    orr r0, r0, r4, lsl r1
    str r0, [r3, r5, lsl #0x2]
    bl func_ov008_021ad96c
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0, #0x638]
    mov r3, #0x1
    cmp r1, #0x0
    addeq r1, r1, #0x1
    streq r1, [r0, #0x638]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
    b .L_568
.L_530:
    ldr r0, _LIT1
    ldrh r0, [r0, #0x4]
    mov r0, r0, lsl #0x10
    cmp r4, r0, lsr #0x18
    beq .L_568
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_568
.L_55c:
    add r7, r7, #0x1
    cmp r7, r8
    blt .L_3e8
.L_568:
    mov r0, #0x2e
    mov r1, #0xa4
    mov r2, #0x48
    mov r3, #0xbe
    bl func_ov008_021aa498
    cmp r0, #0x0
    beq .L_634
    ldr r0, _LIT0
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x4
    str r1, [r0, #0x634]
    bl func_02006148
    cmp r0, #0x0
    beq .L_634
    ldr r0, _LIT4
    mov r1, #0x34
    ldrh r3, [r0, #0x6]
    ldr r2, _LIT5
    mov r0, #0x0
    mov r3, r3, lsl #0x18
    mov r3, r3, lsr #0x18
    mul r1, r3, r1
    ldrh r7, [r2, r1]
    cmp r7, #0x0
    ble .L_608
    ldr r5, _LIT8
    mov r3, #0x1
.L_5d4:
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
    blt .L_5d4
.L_608:
    bl func_ov008_021ad96c
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0, #0x638]
    mov r3, #0x1
    cmp r1, #0x0
    addeq r1, r1, #0x1
    streq r1, [r0, #0x638]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
.L_634:
    mov r0, #0x4a
    mov r1, #0xa4
    mov r2, #0x64
    mov r3, #0xbe
    bl func_ov008_021aa498
    cmp r0, #0x0
    beq .L_6f0
    ldr r0, _LIT0
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x8
    str r1, [r0, #0x634]
    bl func_02006148
    cmp r0, #0x0
    beq .L_6f0
    ldr r1, _LIT4
    mov r0, #0x34
    ldrh r3, [r1, #0x6]
    ldr r2, _LIT5
    mov r1, #0x0
    mov r3, r3, lsl #0x18
    mov r3, r3, lsr #0x18
    mul r0, r3, r0
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    ble .L_6d8
    ldr r6, _LIT8
    mov r5, #0x1
.L_6a0:
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
    blt .L_6a0
.L_6d8:
    bl func_ov008_021ad96c
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_6f0:
    bl func_ov008_021b1dbc
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, #0xe3
    mov r1, #0x0
    mov r2, #0x100
    mov r3, #0x14
    bl func_ov008_021aa498
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x400
    str r1, [r0, #0x634]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov008_021b2660
_LIT1: .word data_ov008_021b2ca8
_LIT2: .word data_ov008_021b2b60
_LIT3: .word 0x0000fffc
_LIT4: .word data_ov008_021b2ca0
_LIT5: .word data_ov008_021b267c
_LIT6: .word 0x66666667
_LIT7: .word data_ov008_021b2cb4
_LIT8: .word data_ov008_021b2ca8
