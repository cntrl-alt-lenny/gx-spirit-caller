; func_ov004_021cf070 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_ov004_0220b500
        .extern data_ov004_022915e8
        .extern func_02012454
        .extern func_020124a4
        .extern func_02034888
        .extern func_020349ec
        .extern func_02037208
        .extern func_ov004_021c9ef0
        .extern func_ov004_021cded0
        .extern func_ov004_021d8cd0
        .global func_ov004_021cf070
        .arm
func_ov004_021cf070:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x20c
    add r1, sp, #0xc
    mov r0, #0x3
    ldr r4, _LIT0
    bl func_020349ec
    cmp r0, #0x0
    addeq sp, sp, #0x20c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    ldrh r0, [sp, #0xc]
    cmp r0, #0x16
    addls pc, pc, r0, lsl #0x2
    b .L_610
    b .L_610
    b .L_610
    b .L_38c
    b .L_3a4
    b .L_3e4
    b .L_610
    b .L_424
    b .L_458
    b .L_498
    b .L_4d4
    b .L_610
    b .L_610
    b .L_610
    b .L_610
    b .L_610
    b .L_610
    b .L_610
    b .L_4ec
    b .L_50c
    b .L_610
    b .L_548
    b .L_610
    b .L_588
.L_38c:
    mov r0, #0x1
    str r0, [r4, #0x220]
    bl func_ov004_021cded0
    ldr r0, _LIT1
    bl func_ov004_021d8cd0
    b .L_610
.L_3a4:
    mov r0, r4
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    bne .L_610
    ldrh r2, [sp, #0xe]
    mov r1, #0x0
    mov r0, #0xea
    str r2, [r4, #0x230]
    str r1, [r4, #0x228]
    bl func_ov004_021c9ef0
    mov r0, #0x48
    sub r1, r0, #0x49
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_610
.L_3e4:
    ldrh r2, [sp, #0xe]
    mov r1, #0x1
    mov r0, r4
    str r2, [r4, #0x230]
    str r1, [r4, #0x228]
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    bne .L_610
    mov r0, #0xeb
    bl func_ov004_021c9ef0
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_610
.L_424:
    add r1, sp, #0xe
    mov r0, #0x0
    bl func_02012454
    mov r2, #0x7
    add r1, sp, #0xe
    mov r0, #0x1
    strh r2, [sp, #0xc]
    bl func_020124a4
    ldr r2, _LIT2
    add r1, sp, #0xc
    mov r0, #0x3
    bl func_02034888
    b .L_610
.L_458:
    add r1, sp, #0xe
    mov r0, #0x1
    bl func_02012454
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
    bl func_02034888
    b .L_610
.L_498:
    ldrh r2, [sp, #0xe]
    ldr r0, _LIT3
    add r1, sp, #0xc
    str r2, [r0, #0xc38]
    mov r3, #0x9
    mov r0, #0x3
    mov r2, #0x2
    strh r3, [sp, #0xc]
    bl func_02034888
    ldr r0, [r4, #0x54]
    cmp r0, #0xa
    moveq r0, #0x6
    movne r0, #0x5
    str r0, [r4, #0x48]
    b .L_610
.L_4d4:
    ldr r0, [r4, #0x54]
    cmp r0, #0xa
    moveq r0, #0x6
    movne r0, #0x5
    str r0, [r4, #0x48]
    b .L_610
.L_4ec:
    add r1, sp, #0xe
    mov r0, #0x0
    bl func_02012454
    mov r1, #0x8
    mov r0, #0x4
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
    b .L_610
.L_50c:
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
    bl func_02034888
    b .L_610
.L_548:
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
    bl func_02034888
    b .L_610
.L_588:
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
.L_5bc:
    add r4, r3, r3, lsr #0x1f
    add r4, r0, r4, asr #0x1
    ldrb r4, [r4, #0xc74]
    mov r6, r2, lsl #0x1f
    mov r6, r6, lsr #0x1d
    tst r4, r1, lsl r6
    beq .L_5f0
    mov r4, r2, asr #0x4
    add r6, r5, r4, lsl #0x1
    ldrh lr, [r6, #0x2]
    and r4, r2, #0xf
    orr r4, lr, ip, lsl r4
    strh r4, [r6, #0x2]
.L_5f0:
    add r2, r2, #0x1
    cmp r2, #0x40
    add r3, r3, #0x1
    blt .L_5bc
    add r1, sp, #0xc
    mov r0, #0x3
    mov r2, #0xa
    bl func_02034888
.L_610:
    mov r0, #0x1
    add sp, sp, #0x20c
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_ov004_022915e8
_LIT2: .word 0x00000126
_LIT3: .word data_021040ac
_LIT4: .word data_02104f4c
