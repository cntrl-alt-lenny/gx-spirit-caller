; func_ov002_022b26fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_0210599e
        .extern data_021059a0
        .extern data_021059a4
        .extern data_021059a8
        .extern data_021059cc
        .extern data_021059d0
        .extern data_ov002_022cc822
        .extern data_ov002_022d0f98
        .extern func_020117ac
        .extern func_02034784
        .extern func_0207f05c
        .extern func_020b3870
        .extern func_ov002_022b2660
        .global func_ov002_022b26fc
        .arm
func_ov002_022b26fc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov sl, r0
    ldr r0, [sl, #0x38]
    cmp r0, #0x8
    addlt sp, sp, #0x14
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r1, #0x40000000
    mov r0, #0x8000
    str r1, [sp, #0xc]
    strh r0, [sp, #0x10]
    bl func_02034784
    cmp r0, #0x2
    bne .L_4c
    ldr r0, _LIT0
    ldr r0, [r0, #0xbac]
    cmp r0, #0x0
    ldrlt fp, _LIT1
    blt .L_50
.L_4c:
    ldr fp, _LIT2
.L_50:
    bl func_02034784
    cmp r0, #0x2
    bne .L_74
    ldr r0, _LIT0
    ldr r0, [r0, #0xbac]
    cmp r0, #0x0
    ldrlt r0, _LIT3
    strlt r0, [sp]
    blt .L_7c
.L_74:
    ldr r0, _LIT4
    str r0, [sp]
.L_7c:
    ldrh r9, [fp]
    mov r5, #0x400
    ldr r4, _LIT5
    cmp r9, #0x63
    ldr r7, _LIT6
    movhi r9, #0x63
    mov r8, #0x66
    rsb r5, r5, #0x0
    mov r6, #0xa
.L_a0:
    smull r1, r2, r7, r9
    ldr r3, [sp, #0xc]
    mov r0, r9, lsr #0x1f
    and r3, r3, r4
    add r2, r0, r2, asr #0x2
    ldrh r1, [sp, #0x10]
    mov r0, r8, lsl #0x17
    orr r3, r3, #0x7b
    orr r0, r3, r0, lsr #0x7
    str r0, [sp, #0xc]
    and r0, r1, r5
    smull r1, r2, r6, r2
    sub r2, r9, r1
    mov r1, r2, lsl #0x7
    add r1, r1, #0x900
    add r2, r1, #0x10000
    mov r1, r2, asr #0x6
    add r1, r2, r1, lsr #0x19
    orr r0, r0, r1, asr #0x7
    strh r0, [sp, #0x10]
    ldr r0, _LIT7
    add r1, sp, #0xc
    mov r2, #0x1
    bl func_0207f05c
    mov r1, r9
    smull r0, r9, r7, r1
    mov r0, r1, lsr #0x1f
    sub r8, r8, #0xa
    adds r9, r0, r9, asr #0x2
    bne .L_a0
    ldrh r0, [fp]
    bl func_020117ac
    ldr r1, [sp]
    mov r5, #0x400
    ldr r1, [r1]
    ldr fp, _LIT7
    subs r9, r0, r1
    ldr r4, _LIT5
    ldr r7, _LIT6
    movmi r9, #0x0
    mov r8, #0xc0
    rsb r5, r5, #0x0
    mov r6, #0xa
.L_14c:
    smull r1, r2, r7, r9
    mov r0, r9, lsr #0x1f
    add r2, r0, r2, asr #0x2
    smull r0, r1, r6, r2
    sub r2, r9, r0
    mov r0, r2, lsl #0x7
    add r0, r0, #0x900
    ldr r2, [sp, #0xc]
    add r1, r0, #0x10000
    and r0, r2, r4
    orr r0, r0, #0x7b
    mov r2, r8, lsl #0x17
    orr r0, r0, r2, lsr #0x7
    str r0, [sp, #0xc]
    mov r0, r1, asr #0x6
    ldrh r2, [sp, #0x10]
    add r0, r1, r0, lsr #0x19
    and r1, r2, r5
    orr r1, r1, r0, asr #0x7
    strh r1, [sp, #0x10]
    mov r0, fp
    add r1, sp, #0xc
    mov r2, #0x1
    bl func_0207f05c
    mov r1, r9
    smull r0, r9, r7, r1
    mov r0, r1, lsr #0x1f
    adds r9, r0, r9, asr #0x2
    sub r8, r8, #0xa
    bne .L_14c
    ldr r0, _LIT8
    ldr r0, [r0, #0xa64]
    and r0, r0, #0x1f00000
    movs r0, r0, lsr #0x14
    beq .L_35c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x4]
    sub r0, r0, #0x1
    mov r0, r0, lsl #0x3
    ldr r1, _LIT9
    str r0, [sp, #0x8]
    ldrh r0, [r1, r0]
    mov r5, #0x400
    ldr fp, _LIT7
    cmp r0, #0x2
    movhi r0, #0x2
    ldr r4, _LIT5
    ldr r7, _LIT6
    add r8, r0, #0x1
    mov r9, #0x66
    rsb r5, r5, #0x0
    mov r6, #0xa
.L_220:
    ldr r1, [sp, #0xc]
    ldrh r0, [sp, #0x10]
    and r1, r1, r4
    mov r2, r9, lsl #0x17
    orr r1, r1, #0x8b
    orr r1, r1, r2, lsr #0x7
    str r1, [sp, #0xc]
    smull r1, r2, r7, r8
    mov r1, r8, lsr #0x1f
    add r2, r1, r2, asr #0x2
    smull r1, r2, r6, r2
    sub r2, r8, r1
    mov r1, r2, lsl #0x7
    add r1, r1, #0x900
    add r2, r1, #0x10000
    mov r1, r2, asr #0x6
    add r1, r2, r1, lsr #0x19
    and r0, r0, r5
    orr r0, r0, r1, asr #0x7
    strh r0, [sp, #0x10]
    mov r0, fp
    add r1, sp, #0xc
    mov r2, #0x1
    bl func_0207f05c
    mov r1, r8
    smull r0, r8, r7, r1
    mov r0, r1, lsr #0x1f
    sub r9, r9, #0xa
    adds r8, r0, r8, asr #0x2
    bne .L_220
    ldr r1, _LIT9
    ldr r0, [sp, #0x8]
    mov r5, #0x400
    ldrh r2, [r1, r0]
    ldr r1, _LIT10
    ldr r3, _LIT11
    ldr r1, [r1, r0]
    ldr r0, [sp, #0x4]
    mov r2, r2, lsl #0x1
    add r0, r3, r0, lsl #0x3
    ldrh r0, [r2, r0]
    ldr fp, _LIT7
    ldr r4, _LIT5
    subs r9, r0, r1
    ldr r7, _LIT6
    movmi r9, #0x0
    mov r8, #0xc0
    rsb r5, r5, #0x0
    mov r6, #0xa
.L_2e4:
    smull r1, r2, r7, r9
    mov r0, r9, lsr #0x1f
    add r2, r0, r2, asr #0x2
    smull r0, r1, r6, r2
    sub r2, r9, r0
    mov r0, r2, lsl #0x7
    add r0, r0, #0x900
    ldr r2, [sp, #0xc]
    add r1, r0, #0x10000
    and r0, r2, r4
    orr r0, r0, #0x8b
    mov r2, r8, lsl #0x17
    orr r0, r0, r2, lsr #0x7
    str r0, [sp, #0xc]
    mov r0, r1, asr #0x6
    ldrh r2, [sp, #0x10]
    add r0, r1, r0, lsr #0x19
    and r1, r2, r5
    orr r1, r1, r0, asr #0x7
    strh r1, [sp, #0x10]
    mov r0, fp
    add r1, sp, #0xc
    mov r2, #0x1
    bl func_0207f05c
    mov r1, r9
    smull r0, r9, r7, r1
    mov r0, r1, lsr #0x1f
    adds r9, r0, r9, asr #0x2
    sub r8, r8, #0xa
    bne .L_2e4
.L_35c:
    ldrh r1, [sp, #0x10]
    ldr r2, [sp, #0xc]
    ldr r0, _LIT8
    bic r1, r1, #0xf000
    bic r2, r2, #0xc00
    orr r1, r1, #0x9000
    mov r5, #0x400
    ldr r8, [r0, #0xa60]
    ldr fp, _LIT7
    ldr r4, _LIT5
    ldr r7, _LIT6
    str r2, [sp, #0xc]
    strh r1, [sp, #0x10]
    mov r9, #0xc0
    rsb r5, r5, #0x0
    mov r6, #0xa
.L_39c:
    smull r1, r2, r7, r8
    mov r0, r8, lsr #0x1f
    add r2, r0, r2, asr #0x2
    smull r0, r1, r6, r2
    sub r2, r8, r0
    mov r0, r2, lsl #0x7
    add r0, r0, #0x900
    ldr r2, [sp, #0xc]
    add r1, r0, #0x10000
    and r0, r2, r4
    orr r0, r0, #0x9b
    mov r2, r9, lsl #0x17
    orr r0, r0, r2, lsr #0x7
    str r0, [sp, #0xc]
    mov r0, r1, asr #0x6
    ldrh r2, [sp, #0x10]
    add r0, r1, r0, lsr #0x19
    and r1, r2, r5
    orr r1, r1, r0, asr #0x7
    strh r1, [sp, #0x10]
    mov r0, fp
    add r1, sp, #0xc
    mov r2, #0x1
    bl func_0207f05c
    mov r1, r8
    smull r0, r8, r7, r1
    mov r0, r1, lsr #0x1f
    adds r8, r0, r8, asr #0x2
    sub r9, r9, #0xa
    bne .L_39c
    ldrh r0, [sp, #0x10]
    ldr r1, [sp, #0xc]
    bic r0, r0, #0xf000
    bic r1, r1, #0xc00
    orr r0, r0, #0xb000
    str r1, [sp, #0xc]
    strh r0, [sp, #0x10]
    ldr r0, [sl, #0x28]
    cmp r0, #0x0
    bgt .L_448
    ldr r0, [sl, #0x3c]
    cmp r0, #0x0
    beq .L_4ac
.L_448:
    ldr r1, [sp, #0xc]
    ldr r0, _LIT5
    ldrh r3, [sp, #0x10]
    and r0, r1, r0
    orr r0, r0, #0x10
    orr r0, r0, #0xe00000
    str r0, [sp, #0xc]
    ldr r0, [sl, #0x20]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    mov r0, r0, lsl #0x7
    add r0, r0, #0x300
    add r2, r0, #0x10000
    mov r0, #0x400
    mov r1, r2, asr #0x6
    rsb r0, r0, #0x0
    add r1, r2, r1, lsr #0x19
    and r0, r3, r0
    orr r3, r0, r1, asr #0x7
    ldr r0, _LIT7
    add r1, sp, #0xc
    mov r2, #0x1
    strh r3, [sp, #0x10]
    bl func_0207f05c
.L_4ac:
    ldr r1, [sl, #0x28]
    ldr r0, [sl, #0x24]
    add r1, r1, #0x68
    cmp r1, r0, lsl #0x4
    blt .L_4cc
    ldr r0, [sl, #0x3c]
    cmp r0, #0x0
    beq .L_544
.L_4cc:
    ldr r1, [sp, #0xc]
    ldr r0, _LIT5
    ldrh r5, [sp, #0x10]
    and r0, r1, r0
    orr r0, r0, #0x69
    orr r0, r0, #0xe00000
    str r0, [sp, #0xc]
    ldr r0, [sl, #0x20]
    ldr r3, [sp, #0xc]
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    mov r0, r0, lsl #0x7
    add r0, r0, #0x300
    add r4, r0, #0x10000
    mov r0, #0x400
    rsb r0, r0, #0x0
    mov r1, r4, asr #0x6
    and r5, r5, r0
    add r0, r4, r1, lsr #0x19
    orr r4, r5, r0, asr #0x7
    ldr r2, _LIT12
    ldr r0, _LIT7
    and r1, r3, r2
    orr r3, r1, #0x20000000
    add r1, sp, #0xc
    mov r2, #0x1
    strh r4, [sp, #0x10]
    str r3, [sp, #0xc]
    bl func_0207f05c
.L_544:
    ldr r0, [sl, #0x3c]
    cmp r0, #0x0
    beq .L_5dc
    ldr r1, [sl, #0x28]
    mov r0, #0x39
    mul r0, r1, r0
    ldr r1, [sl, #0x24]
    mov r1, r1, lsl #0x4
    sub r1, r1, #0x68
    bl func_020b3870
    add r1, r0, #0x20
    ldr r2, [sp, #0xc]
    ldr r0, _LIT5
    and r1, r1, #0xff
    and r0, r2, r0
    orr r0, r0, r1
    orr r0, r0, #0xe00000
    str r0, [sp, #0xc]
    ldr r0, [sl, #0x20]
    ldrh r3, [sp, #0x10]
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x2
    mov r0, r0, lsl #0x7
    add r0, r0, #0x300
    add r2, r0, #0x10000
    mov r0, #0x400
    mov r1, r2, asr #0x6
    rsb r0, r0, #0x0
    add r1, r2, r1, lsr #0x19
    and r0, r3, r0
    orr r3, r0, r1, asr #0x7
    ldr r0, _LIT7
    add r1, sp, #0xc
    mov r2, #0x1
    strh r3, [sp, #0x10]
    bl func_0207f05c
.L_5dc:
    mov r4, #0x0
    ldr r0, _LIT8
    str r4, [sl, #0x20]
    ldr r0, [r0, #0x4]
    mov r1, #0xa000
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    cmp r0, #0x1
    strh r1, [sp, #0x10]
    ldr r2, _LIT13
    mov r0, #0x400
    str r2, [sp, #0xc]
    movhi r4, #0x1
    ldrh r1, [sp, #0x10]
    rsb r0, r0, #0x0
    ldr r5, [sp, #0xc]
    and r0, r1, r0
    orr r2, r0, #0xf3
    ldr r0, _LIT5
    add r3, r4, #0x78
    orr r2, r2, #0x100
    strh r2, [sp, #0x10]
    and r1, r3, #0xff
    and r0, r5, r0
    orr r0, r0, r1
    orr r3, r0, #0x7a0000
    ldr r0, _LIT7
    add r1, sp, #0xc
    mov r2, #0x1
    str r3, [sp, #0xc]
    bl func_0207f05c
    mov r1, #0x400
    ldrh r2, [sp, #0x10]
    rsb r1, r1, #0x0
    ldr r5, [sp, #0xc]
    and r1, r2, r1
    orr r2, r1, #0x1f4
    ldr r0, _LIT5
    strh r2, [sp, #0x10]
    add r3, r4, #0x80
    and r1, r5, r0
    and r0, r3, #0xff
    orr r0, r1, r0
    orr r3, r0, #0x7a0000
    ldr r0, _LIT7
    add r1, sp, #0xc
    mov r2, #0x1
    str r3, [sp, #0xc]
    bl func_0207f05c
    mov r0, #0x400
    ldrh r1, [sp, #0x10]
    rsb r0, r0, #0x0
    ldr r2, [sp, #0xc]
    and r0, r1, r0
    orr r1, r0, #0xf5
    ldr r0, _LIT5
    orr r1, r1, #0x100
    and r0, r2, r0
    orr r0, r0, #0x80
    orr r0, r0, #0xcc0000
    str r0, [sp, #0xc]
    strh r1, [sp, #0x10]
    ldr r0, _LIT7
    add r1, sp, #0xc
    mov r2, #0x1
    bl func_0207f05c
    ldr r0, _LIT8
    ldr r0, [r0, #0xa64]
    and r0, r0, #0x1f00000
    movs r0, r0, lsr #0x14
    beq .L_7d0
    ldrh r1, [sp, #0x10]
    mov r0, #0x400
    rsb r0, r0, #0x0
    and r0, r1, r0
    orr r2, r0, #0xf3
    add r3, r4, #0x88
    ldr r5, [sp, #0xc]
    ldr r0, _LIT5
    orr r2, r2, #0x100
    strh r2, [sp, #0x10]
    and r1, r3, #0xff
    and r0, r5, r0
    orr r0, r0, r1
    orr r3, r0, #0x7a0000
    ldr r0, _LIT7
    add r1, sp, #0xc
    mov r2, #0x1
    str r3, [sp, #0xc]
    bl func_0207f05c
    mov r1, #0x400
    add r3, r4, #0x90
    ldrh r2, [sp, #0x10]
    rsb r1, r1, #0x0
    ldr r4, [sp, #0xc]
    and r1, r2, r1
    orr r2, r1, #0x1f4
    ldr r0, _LIT5
    strh r2, [sp, #0x10]
    and r1, r4, r0
    and r0, r3, #0xff
    orr r0, r1, r0
    orr r3, r0, #0x7a0000
    ldr r0, _LIT7
    add r1, sp, #0xc
    mov r2, #0x1
    str r3, [sp, #0xc]
    bl func_0207f05c
    mov r0, #0x400
    ldrh r1, [sp, #0x10]
    rsb r0, r0, #0x0
    ldr r2, [sp, #0xc]
    and r1, r1, r0
    ldr r0, _LIT5
    orr r1, r1, #0xf5
    and r0, r2, r0
    orr r0, r0, #0x90
    orr r0, r0, #0xcc0000
    str r0, [sp, #0xc]
    orr r1, r1, #0x100
    strh r1, [sp, #0x10]
    ldr r0, _LIT7
    add r1, sp, #0xc
    mov r2, #0x1
    bl func_0207f05c
.L_7d0:
    ldr r0, [sl, #0x5c]
    ldr r2, _LIT14
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r0, r0, #0x80
    mov r1, #0x0
    mov r3, #0x7
    bl func_ov002_022b2660
    ldr r0, _LIT8
    ldr r2, _LIT15
    ldr r0, [r0, #0x4]
    mov r3, #0x8
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    movne r0, #0x1
    moveq r0, #0x0
    add r1, r0, #0x7c
    mov r0, #0x1e
    bl func_ov002_022b2660
    ldr r2, _LIT16
    mov r0, #0x1e
    mov r1, #0x9b
    mov r3, #0x9
    bl func_ov002_022b2660
    ldr r0, _LIT8
    ldr r1, [r0, #0xa64]
    and r1, r1, #0x1f00000
    movs r1, r1, lsr #0x14
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r0, #0x4]
    ldr r2, _LIT17
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    movne r0, #0x1
    moveq r0, #0x0
    add r1, r0, #0x8c
    mov r0, #0x1e
    mov r3, #0x8
    bl func_ov002_022b2660
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_021059a4
_LIT2: .word data_0210599e
_LIT3: .word data_021059a8
_LIT4: .word data_021059a0
_LIT5: .word 0xfe00ff00
_LIT6: .word 0x66666667
_LIT7: .word data_ov002_022d0f98
_LIT8: .word data_02104f4c
_LIT9: .word data_021059cc
_LIT10: .word data_021059d0
_LIT11: .word data_ov002_022cc822
_LIT12: .word 0xc1fffcff
_LIT13: .word 0x40004000
_LIT14: .word 0x00010500
_LIT15: .word 0x00010e00
_LIT16: .word 0x00011200
_LIT17: .word 0x00011600
