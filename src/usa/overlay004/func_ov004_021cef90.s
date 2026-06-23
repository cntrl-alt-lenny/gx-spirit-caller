; func_ov004_021cef90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104e6c
        .extern data_ov004_0220b2a0
        .extern data_ov004_02291388
        .extern func_02012420
        .extern func_02012470
        .extern func_02034838
        .extern func_0203499c
        .extern func_020371b8
        .extern func_ov004_021c9e10
        .extern func_ov004_021cddf0
        .extern func_ov004_021d8be4
        .global func_ov004_021cef90
        .arm
func_ov004_021cef90:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x20c
    add r1, sp, #0xc
    mov r0, #0x3
    ldr r4, _LIT0
    bl func_0203499c
    cmp r0, #0x0
    addeq sp, sp, #0x20c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    ldrh r0, [sp, #0xc]
    cmp r0, #0x16
    addls pc, pc, r0, lsl #0x2
    b .L_318
    b .L_318
    b .L_318
    b .L_94
    b .L_ac
    b .L_ec
    b .L_318
    b .L_12c
    b .L_160
    b .L_1a0
    b .L_1dc
    b .L_318
    b .L_318
    b .L_318
    b .L_318
    b .L_318
    b .L_318
    b .L_318
    b .L_1f4
    b .L_214
    b .L_318
    b .L_250
    b .L_318
    b .L_290
.L_94:
    mov r0, #0x1
    str r0, [r4, #0x220]
    bl func_ov004_021cddf0
    ldr r0, _LIT1
    bl func_ov004_021d8be4
    b .L_318
.L_ac:
    mov r0, r4
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    bne .L_318
    ldrh r2, [sp, #0xe]
    mov r1, #0x0
    mov r0, #0xea
    str r2, [r4, #0x230]
    str r1, [r4, #0x228]
    bl func_ov004_021c9e10
    mov r0, #0x48
    sub r1, r0, #0x49
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_318
.L_ec:
    ldrh r2, [sp, #0xe]
    mov r1, #0x1
    mov r0, r4
    str r2, [r4, #0x230]
    str r1, [r4, #0x228]
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    bne .L_318
    mov r0, #0xeb
    bl func_ov004_021c9e10
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_318
.L_12c:
    add r1, sp, #0xe
    mov r0, #0x0
    bl func_02012420
    mov r2, #0x7
    add r1, sp, #0xe
    mov r0, #0x1
    strh r2, [sp, #0xc]
    bl func_02012470
    ldr r2, _LIT2
    add r1, sp, #0xc
    mov r0, #0x3
    bl func_02034838
    b .L_318
.L_160:
    add r1, sp, #0xe
    mov r0, #0x1
    bl func_02012420
    ldr r1, _LIT3
    mov r2, #0x8
    ldr r0, [r1, #0x38]
    strh r2, [sp, #0xc]
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    str r3, [r1, #0xc38]
    add r1, sp, #0xc
    mov r0, #0x3
    mov r2, #0x4
    strh r3, [sp, #0xe]
    bl func_02034838
    b .L_318
.L_1a0:
    ldrh r2, [sp, #0xe]
    ldr r0, _LIT3
    add r1, sp, #0xc
    str r2, [r0, #0xc38]
    mov r3, #0x9
    mov r0, #0x3
    mov r2, #0x2
    strh r3, [sp, #0xc]
    bl func_02034838
    ldr r0, [r4, #0x54]
    cmp r0, #0xa
    moveq r0, #0x6
    movne r0, #0x5
    str r0, [r4, #0x48]
    b .L_318
.L_1dc:
    ldr r0, [r4, #0x54]
    cmp r0, #0xa
    moveq r0, #0x6
    movne r0, #0x5
    str r0, [r4, #0x48]
    b .L_318
.L_1f4:
    add r1, sp, #0xe
    mov r0, #0x0
    bl func_02012420
    mov r1, #0x8
    mov r0, #0x4
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
    b .L_318
.L_214:
    mov r5, #0x0
    mov r6, #0x4
    mov r3, #0x1
    mov r2, #0x2
    add r1, sp, #0x0
    mov r0, #0x3
    str r6, [r4, #0x54]
    str r5, [r4, #0x230]
    str r5, [r4, #0x22c]
    str r5, [r4, #0x228]
    str r5, [r4, #0x224]
    str r3, [r4, #0x220]
    strh r2, [sp]
    bl func_02034838
    b .L_318
.L_250:
    ldr r0, _LIT4
    mov ip, #0x15
    ldr r6, [r0, #0xa6c]
    ldr r4, [r0, #0xa70]
    mov r5, r6, lsr #0x10
    mov r3, r4, lsr #0x10
    add r1, sp, #0x2
    mov r0, #0x3
    mov r2, #0xa
    strh ip, [sp, #0x2]
    strh r6, [sp, #0x4]
    strh r5, [sp, #0x6]
    strh r4, [sp, #0x8]
    strh r3, [sp, #0xa]
    bl func_02034838
    b .L_318
.L_290:
    ldrh r1, [sp, #0xe]
    mov r0, #0x17
    mov r2, #0x0
    strh r0, [sp, #0xc]
    mov r3, r1, lsl #0x6
    ldr r0, _LIT4
    strh r2, [sp, #0x14]
    strh r2, [sp, #0x12]
    strh r2, [sp, #0x10]
    strh r2, [sp, #0xe]
    add r5, sp, #0xc
    mov ip, #0x1
    mov r1, #0xf
.L_2c4:
    add r4, r3, r3, lsr #0x1f
    add r4, r0, r4, asr #0x1
    ldrb r4, [r4, #0xc74]
    mov r6, r2, lsl #0x1f
    mov r6, r6, lsr #0x1d
    tst r4, r1, lsl r6
    beq .L_2f8
    mov r4, r2, asr #0x4
    add r6, r5, r4, lsl #0x1
    ldrh lr, [r6, #0x2]
    and r4, r2, #0xf
    orr r4, lr, ip, lsl r4
    strh r4, [r6, #0x2]
.L_2f8:
    add r2, r2, #0x1
    cmp r2, #0x40
    add r3, r3, #0x1
    blt .L_2c4
    add r1, sp, #0xc
    mov r0, #0x3
    mov r2, #0xa
    bl func_02034838
.L_318:
    mov r0, #0x1
    add sp, sp, #0x20c
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_ov004_02291388
_LIT2: .word 0x00000126
_LIT3: .word data_02103fcc
_LIT4: .word data_02104e6c
