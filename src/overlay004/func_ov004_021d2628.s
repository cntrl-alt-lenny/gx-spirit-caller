; func_ov004_021d2628 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef80
        .extern data_02104f4c
        .extern data_021a18b8
        .extern data_021a1974
        .extern data_ov004_02200df4
        .extern data_ov004_02200e00
        .extern data_ov004_0220b500
        .extern data_ov004_02211490
        .extern data_ov004_02211548
        .extern func_02005dac
        .extern func_0201d014
        .extern func_02021c28
        .extern func_0202c9b0
        .extern func_0202cdf8
        .extern func_02037208
        .extern func_020822a0
        .extern func_020822c8
        .extern func_020822f0
        .extern func_02084aec
        .extern MTX_Identity33_
        .extern func_0208e014
        .extern func_0208e1cc
        .extern func_020944a4
        .extern MI_Copy36B
        .extern func_ov004_021ca0a4
        .extern func_ov004_021d03ec
        .extern func_ov004_021d2550
        .global func_ov004_021d2628
        .arm
func_ov004_021d2628:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x58
    bl func_ov004_021d2550
    mov r1, #0x2
    ldr r5, _LIT0
    mov fp, r0
    mov r0, r5
    str r1, [sp]
    mov r4, #0xd
    mov r2, #0x8
    mov r3, #0x9
    str r4, [sp, #0x4]
    bl func_ov004_021ca0a4
    mov r1, #0x2
    mov r2, #0xa
    mov r0, r5
    mov r3, r2
    str r1, [sp]
    mov r4, #0xe
    str r4, [sp, #0x4]
    bl func_ov004_021ca0a4
    ldr r1, _LIT1
    ldr r0, _LIT2
    ldr sl, [r1, #0xa60]
    mov r1, #0x2
    cmp sl, r0
    movgt sl, r0
    ldr r0, _LIT3
    str r1, [sp]
    add r0, r0, #0xf90
    mov r4, #0x19
    add r0, r0, #0x5000
    mov r2, #0x71
    mov r3, #0x9
    mov r9, #0x71
    str r4, [sp, #0x4]
    bl func_ov004_021ca0a4
    ldr r0, _LIT3
    ldr r5, _LIT4
    sub r9, r9, #0xe
    add r6, r0, #0xf90
    mov r8, #0x2
    mov r7, #0x9
    mov r4, #0xa
.L_b0:
    mov r0, sl, lsr #0x1f
    smull r1, r3, r5, sl
    add r3, r0, r3, asr #0x2
    smull r0, r1, r4, r3
    sub r3, sl, r0
    mov r1, r8
    mov r2, r9
    add r0, r3, #0xf
    str r8, [sp]
    str r0, [sp, #0x4]
    mov r3, r7
    add r0, r6, #0x5000
    bl func_ov004_021ca0a4
    mov r1, sl
    smull r0, sl, r5, r1
    mov r0, r1, lsr #0x1f
    add sl, r0, sl, asr #0x2
    cmp sl, #0x0
    sub r9, r9, #0xb
    bgt .L_b0
    ldr r0, _LIT3
    add r0, r0, #0x3000
    ldr r4, [r0, #0xc78]
    ldr r0, [r0, #0xc74]
    cmp r0, r4
    movle r4, r0
    cmp r4, #0x80
    bne .L_134
    mov r0, #0x5f
    sub r1, r0, #0x60
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_134:
    cmp r4, #0x80
    movge r4, #0x80
    cmp r4, #0x1
    ble .L_1b0
    mov r0, #0x5a
    mul r2, r4, r0
    ldr r0, _LIT3
    mov r1, r2, asr #0x6
    add r0, r0, #0x3000
    ldr r0, [r0, #0xc68]
    add r1, r2, r1, lsr #0x19
    add r0, r0, #0xa
    mov r0, r0, lsl #0xa
    add r3, r0, #0x10000
    mov r0, r3, asr #0x6
    add r0, r3, r0, lsr #0x19
    mov r0, r0, asr #0x7
    orr r2, r0, #0x2c00
    mov r1, r1, asr #0x7
    ldr r0, _LIT5
    and r1, r1, #0xff
    orr r3, r1, r0
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp, #0x14]
    strh r2, [sp, #0x18]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x14
    mov r2, #0x6
    bl func_020944a4
.L_1b0:
    ldr r0, _LIT3
    mov r1, #0x1
    add r0, r0, #0xf90
    str r1, [sp]
    add r0, r0, #0x5000
    mov r1, #0x2
    mov r2, #0xe0
    mov r3, #0xa4
    str fp, [sp, #0x4]
    bl func_ov004_021ca0a4
    bl func_0202c9b0
    cmp r0, #0x0
    beq .L_2e8
    ldr r0, _LIT3
    ldr r1, [r0, #0x54]
    mov r0, #0x1000
    cmp r1, #0xf
    bne .L_234
    ldr r0, _LIT3
    add r0, r0, #0x3000
    ldr r1, [r0, #0xc78]
    ldr r0, [r0, #0xc74]
    cmp r0, r1
    movle r1, r0
    subs r0, r1, #0x40
    rsbmi r0, r0, #0x0
    cmp r0, #0x20
    movgt r0, #0x20
    mov r0, r0, lsl #0x9
    mov r1, r0, asr #0x4
    ldr r0, _LIT6
    mov r1, r1, lsl #0x2
    ldrsh r0, [r0, r1]
.L_234:
    bl func_ov004_021d03ec
    ldr r0, _LIT7
    add r3, sp, #0x4c
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r4, _LIT8
    add r3, sp, #0x40
    ldmia r4, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    add r0, sp, #0x1c
    bl MTX_Identity33_
    ldr r1, _LIT9
    add r0, sp, #0x1c
    bl MI_Copy36B
    ldr r1, _LIT10
    add r0, sp, #0x4c
    ldr r2, [r1, #0xfc]
    bic r2, r2, #0xa4
    str r2, [r1, #0xfc]
    bl func_020822a0
    add r0, sp, #0x40
    bl func_020822c8
    bl func_020822f0
    ldr r0, _LIT11
    bl func_02084aec
    bl func_0202cdf8
    cmp r0, #0x0
    beq .L_31c
    ldr r0, _LIT3
    mov r3, #0x0
    add r0, r0, #0x3000
    ldr r0, [r0, #0xc8c]
    mov r2, #0xe3
    cmp r0, #0x1
    ldr r0, _LIT3
    moveq r1, #0x1
    movne r1, #0x0
    add r0, r0, #0xf90
    add r4, r1, #0x2
    str r3, [sp]
    add r0, r0, #0x5000
    mov r1, #0x2
    str r4, [sp, #0x4]
    bl func_ov004_021ca0a4
    b .L_31c
.L_2e8:
    bl func_0208e1cc
    mov r4, r0
    bl func_0201d014
    mov r0, r0, lsl #0x2
    add r0, r0, #0x1
    orr r1, r0, #0x5000
    strh r1, [r4, #0x3c]
    add r0, r1, #0x1
    strh r0, [r4, #0x3e]
    add r0, r1, #0x2
    strh r0, [r4, #0x7c]
    add r0, r1, #0x3
    strh r0, [r4, #0x7e]
.L_31c:
    ldr r0, _LIT3
    mov r7, #0x0
    ldr r1, [r0]
    ldr r2, _LIT4
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x3
    ldr r2, _LIT12
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x1
    mov r2, #0xc
    smull r0, r1, r2, r4
    sub r4, r3, r0
    mov fp, r7
    cmp r4, #0x3
    blt .L_368
    cmp r4, #0x6
    sublt r7, r4, #0x2
.L_368:
    cmp r4, #0x9
    blt .L_378
    cmp r4, #0xc
    sublt fp, r4, #0x8
.L_378:
    sub r0, r7, #0x1
    mov r0, r0, lsl #0x2
    mov r9, #0x0
    sub r1, fp, #0x1
    str r0, [sp, #0xc]
    mov r0, r1, lsl #0x2
    str r9, [sp, #0x10]
    str r0, [sp, #0x8]
.L_398:
    ldr r1, _LIT3
    ldr r0, [sp, #0xc]
    mov sl, #0x0
    add r2, r1, r0, lsl #0x1
    ldr r0, [sp, #0x8]
    add r6, r2, r9, lsl #0x1
    add r1, r1, r0, lsl #0x1
    ldr r0, _LIT3
    add r4, r1, r9, lsl #0x1
    add r5, r0, r9, lsl #0x1
.L_3c0:
    cmp r7, #0x0
    addeq r0, r5, sl, lsl #0x1
    addeq r0, r0, #0x5500
    ldreqh r8, [r0, #0xae]
    beq .L_3e0
    add r0, r6, sl, lsl #0x1
    add r0, r0, #0x5200
    ldrh r8, [r0, #0x58]
.L_3e0:
    bl func_0208e014
    add r0, r0, r9, lsl #0x1
    add r0, r0, sl, lsl #0x1
    strh r8, [r0, #0xd6]
    cmp fp, #0x0
    addeq r0, r5, sl, lsl #0x1
    addeq r0, r0, #0x5500
    ldreqh r8, [r0, #0xba]
    beq .L_410
    add r0, r4, sl, lsl #0x1
    add r0, r0, #0x5300
    ldrh r8, [r0, #0x58]
.L_410:
    bl func_0208e014
    add r0, r0, r9, lsl #0x1
    add r0, r0, sl, lsl #0x1
    add sl, sl, #0x1
    strh r8, [r0, #0xe2]
    cmp sl, #0x4
    blt .L_3c0
    ldr r0, [sp, #0x10]
    add r9, r9, #0x20
    add r0, r0, #0x1
    str r0, [sp, #0x10]
    cmp r0, #0x4
    blt .L_398
    bl func_02021c28
    add sp, sp, #0x58
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov004_02211490
_LIT1: .word data_02104f4c
_LIT2: .word 0x0098967f
_LIT3: .word data_ov004_0220b500
_LIT4: .word 0x66666667
_LIT5: .word 0x80702000
_LIT6: .word data_020bef80
_LIT7: .word data_ov004_02200e00
_LIT8: .word data_ov004_02200df4
_LIT9: .word data_021a1974
_LIT10: .word data_021a18b8
_LIT11: .word data_ov004_02211548
_LIT12: .word 0x2aaaaaab
