; func_ov002_021d88ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0c8
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern func_02031084
        .extern func_0203124c
        .extern func_ov002_021b9dec
        .extern func_ov002_021d5a38
        .extern func_ov002_021d5a90
        .extern func_ov002_021d5b60
        .extern func_ov002_021d628c
        .extern func_ov002_021d8fd0
        .extern func_ov002_021d90f0
        .extern func_ov002_021d92f0
        .extern func_ov002_021de390
        .extern func_ov002_021e2ca4
        .extern func_ov002_02254e14
        .global func_ov002_021d88ac
        .arm
func_ov002_021d88ac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    ldr r4, _LIT0
    and r5, r9, #0x1
    mul r6, r5, r4
    mov r8, r1
    mov r3, #0x14
    mul r5, r8, r3
    ldr r4, _LIT1
    mov r7, r2
    add r3, r4, r6
    ldr r3, [r5, r3]
    mov r2, r3, lsr #0x6
    and r2, r2, #0x1
    cmp r7, r2
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    bl func_ov002_021b9dec
    mov r4, r0
    mov r0, r9
    mov r1, r8
    mov r3, r7
    mov r2, #0x6
    bl func_ov002_021e2ca4
    ldr r0, _LIT2
    add r0, r0, r6
    ldrh r0, [r5, r0]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r8, #0x4
    bgt .L_5a8
    cmp r7, #0x0
    beq .L_66c
    ldr r1, _LIT3
    cmp r4, r1
    bgt .L_290
    bge .L_51c
    ldr r0, _LIT4
    cmp r4, r0
    bgt .L_194
    bge .L_4c0
    ldr r0, _LIT5
    cmp r4, r0
    bgt .L_128
    sub r1, r0, #0x3
    cmp r4, r1
    blt .L_c4
    cmpne r4, r0
    beq .L_558
    b .L_66c
.L_c4:
    ldr r1, _LIT6
    cmp r4, r1
    bgt .L_f8
    bge .L_4c0
    sub r0, r1, #0xbd
    cmp r4, r0
    bgt .L_e8
    beq .L_4f0
    b .L_66c
.L_e8:
    sub r0, r1, #0x1a
    cmp r4, r0
    beq .L_4c0
    b .L_66c
.L_f8:
    add r0, r1, #0xbe
    cmp r4, r0
    bgt .L_118
    bge .L_4c0
    add r0, r1, #0x8d
    cmp r4, r0
    beq .L_4c0
    b .L_66c
.L_118:
    add r0, r1, #0x148
    cmp r4, r0
    beq .L_51c
    b .L_66c
.L_128:
    add r1, r0, #0x28
    cmp r4, r1
    bgt .L_164
    bge .L_4c0
    add r1, r0, #0x12
    cmp r4, r1
    bgt .L_154
    add r0, r0, #0x12
    cmp r4, r0
    beq .L_48c
    b .L_66c
.L_154:
    add r0, r0, #0x22
    cmp r4, r0
    beq .L_56c
    b .L_66c
.L_164:
    add r1, r0, #0xb3
    cmp r4, r1
    bgt .L_184
    bge .L_4c0
    add r0, r0, #0x37
    cmp r4, r0
    beq .L_51c
    b .L_66c
.L_184:
    add r0, r0, #0x104
    cmp r4, r0
    beq .L_51c
    b .L_66c
.L_194:
    add r2, r0, #0x190
    cmp r4, r2
    bgt .L_220
    bge .L_4c0
    add r2, r0, #0xe3
    cmp r4, r2
    bgt .L_1e8
    mov r1, r2
    cmp r4, r1
    bge .L_4c0
    add r1, r0, #0x16
    cmp r4, r1
    bgt .L_1d8
    add r0, r0, #0x16
    cmp r4, r0
    beq .L_540
    b .L_66c
.L_1d8:
    add r0, r0, #0x1b
    cmp r4, r0
    beq .L_4d8
    b .L_66c
.L_1e8:
    add r2, r0, #0xeb
    cmp r4, r2
    bgt .L_210
    mov r1, r2
    cmp r4, r1
    bge .L_4c0
    add r0, r0, #0xe6
    cmp r4, r0
    beq .L_4c0
    b .L_66c
.L_210:
    sub r0, r1, #0x18c
    cmp r4, r0
    beq .L_530
    b .L_66c
.L_220:
    sub r0, r1, #0x44
    cmp r4, r0
    bgt .L_260
    bge .L_4c0
    ldr r0, _LIT7
    cmp r4, r0
    bgt .L_250
    bge .L_4c0
    sub r0, r0, #0x1
    cmp r4, r0
    beq .L_4c0
    b .L_66c
.L_250:
    add r0, r0, #0x8d
    cmp r4, r0
    beq .L_48c
    b .L_66c
.L_260:
    sub r0, r1, #0x3b
    cmp r4, r0
    bgt .L_280
    bge .L_4c0
    sub r0, r1, #0x43
    cmp r4, r0
    beq .L_4c0
    b .L_66c
.L_280:
    sub r0, r1, #0x34
    cmp r4, r0
    beq .L_51c
    b .L_66c
.L_290:
    add r0, r1, #0x22c
    cmp r4, r0
    bgt .L_3a8
    bge .L_51c
    ldr r0, _LIT8
    cmp r4, r0
    bgt .L_338
    sub r1, r0, #0x6
    cmp r4, r1
    blt .L_2cc
    subne r1, r0, #0x4
    cmpne r4, r1
    cmpne r4, r0
    beq .L_48c
    b .L_66c
.L_2cc:
    sub r1, r0, #0xe3
    cmp r4, r1
    bgt .L_308
    bge .L_4c0
    sub r1, r0, #0xef
    cmp r4, r1
    bgt .L_2f8
    sub r0, r0, #0xef
    cmp r4, r0
    beq .L_4c0
    b .L_66c
.L_2f8:
    sub r0, r0, #0xec
    cmp r4, r0
    beq .L_48c
    b .L_66c
.L_308:
    sub r1, r0, #0x2d
    cmp r4, r1
    bgt .L_328
    bge .L_4c0
    sub r0, r0, #0x51
    cmp r4, r0
    beq .L_4c0
    b .L_66c
.L_328:
    sub r0, r0, #0x8
    cmp r4, r0
    beq .L_48c
    b .L_66c
.L_338:
    add r1, r0, #0x21
    cmp r4, r1
    bgt .L_378
    bge .L_4c0
    add r1, r0, #0x1b
    cmp r4, r1
    bgt .L_368
    bge .L_4c0
    add r0, r0, #0x13
    cmp r4, r0
    beq .L_4c0
    b .L_66c
.L_368:
    add r0, r0, #0x1e
    cmp r4, r0
    beq .L_51c
    b .L_66c
.L_378:
    add r1, r0, #0x75
    cmp r4, r1
    bgt .L_398
    bge .L_4c0
    add r0, r0, #0x4a
    cmp r4, r0
    beq .L_51c
    b .L_66c
.L_398:
    add r0, r0, #0x94
    cmp r4, r0
    beq .L_4c0
    b .L_66c
.L_3a8:
    add r0, r1, #0x370
    cmp r4, r0
    bgt .L_41c
    bge .L_4c0
    ldr r1, _LIT9
    cmp r4, r1
    bgt .L_3ec
    bge .L_530
    sub r0, r1, #0x5c
    cmp r4, r0
    bgt .L_3dc
    beq .L_51c
    b .L_66c
.L_3dc:
    sub r0, r1, #0x2
    cmp r4, r0
    beq .L_48c
    b .L_66c
.L_3ec:
    add r0, r1, #0x4e
    cmp r4, r0
    bgt .L_40c
    bge .L_4c0
    add r0, r1, #0x3f
    cmp r4, r0
    beq .L_4c0
    b .L_66c
.L_40c:
    add r0, r1, #0xa0
    cmp r4, r0
    beq .L_4c0
    b .L_66c
.L_41c:
    ldr r1, _LIT10
    cmp r4, r1
    bgt .L_45c
    bge .L_558
    sub r0, r1, #0x60
    cmp r4, r0
    bgt .L_44c
    bge .L_51c
    sub r0, r1, #0x91
    cmp r4, r0
    beq .L_580
    b .L_66c
.L_44c:
    sub r0, r1, #0x35
    cmp r4, r0
    beq .L_51c
    b .L_66c
.L_45c:
    add r0, r1, #0x2
    cmp r4, r0
    bgt .L_47c
    bge .L_558
    add r0, r1, #0x1
    cmp r4, r0
    beq .L_558
    b .L_66c
.L_47c:
    add r0, r1, #0x3
    cmp r4, r0
    beq .L_558
    b .L_66c
.L_48c:
    ldr ip, _LIT11
    ldr r0, [ip, #0xd40]
    add r0, r0, #0x1
    str r0, [ip, #0xd40]
    cmp r0, #0xa
    bcc .L_66c
    mov r2, #0x0
    mov r0, r9
    mov r1, r8
    mov r3, r2
    str r2, [ip, #0xd40]
    bl func_ov002_021de390
    b .L_66c
.L_4c0:
    mov r0, r9
    mov r1, r8
    mov r2, r4
    mov r3, #0x1
    bl func_ov002_021d5a90
    b .L_66c
.L_4d8:
    mov r0, r9
    mov r1, r8
    mov r2, r4
    mov r3, #0x1
    bl func_ov002_021d5b60
    b .L_66c
.L_4f0:
    mov r0, r9
    mov r1, r8
    mov r2, #0x5
    mov r3, #0x0
    bl func_ov002_021e2ca4
    mov r0, r9
    mov r1, r8
    mov r2, r4
    mov r3, #0x1
    bl func_ov002_021d5a90
    b .L_66c
.L_51c:
    mov r0, r9
    mov r1, r8
    mov r2, #0x0
    bl func_ov002_021d8fd0
    b .L_66c
.L_530:
    mov r0, r9
    mov r1, r8
    bl func_ov002_021d5a38
    b .L_66c
.L_540:
    mov r0, r9
    mov r1, r8
    mov r2, #0x5
    mov r3, #0x0
    bl func_ov002_021e2ca4
    b .L_66c
.L_558:
    mov r0, r9
    mov r1, r8
    mov r2, #0xd
    bl func_ov002_021d628c
    b .L_66c
.L_56c:
    mov r0, r9
    mov r1, r8
    mov r2, #0xc
    bl func_ov002_021d628c
    b .L_66c
.L_580:
    mov r0, r9
    mov r1, r8
    mov r2, r4
    mov r3, #0x1
    bl func_ov002_021d5a90
    mov r0, r9
    mov r1, r8
    mov r2, #0x0
    bl func_ov002_021d8fd0
    b .L_66c
.L_5a8:
    ldr r1, _LIT12
    cmp r4, r1
    bgt .L_5dc
    bge .L_640
    sub r0, r1, #0x66
    cmp r4, r0
    bgt .L_5cc
    beq .L_60c
    b .L_66c
.L_5cc:
    sub r0, r1, #0x8
    cmp r4, r0
    beq .L_60c
    b .L_66c
.L_5dc:
    ldr r0, _LIT13
    cmp r4, r0
    bgt .L_5fc
    bge .L_658
    ldr r0, _LIT14
    cmp r4, r0
    beq .L_60c
    b .L_66c
.L_5fc:
    add r0, r0, #0x4b
    cmp r4, r0
    beq .L_658
    b .L_66c
.L_60c:
    ldr ip, _LIT11
    ldr r0, [ip, #0xd40]
    add r0, r0, #0x1
    str r0, [ip, #0xd40]
    cmp r0, #0xa
    bcc .L_66c
    mov r2, #0x0
    mov r0, r9
    mov r1, r8
    mov r3, r2
    str r2, [ip, #0xd40]
    bl func_ov002_021de390
    b .L_66c
.L_640:
    cmp r7, #0x0
    bne .L_66c
    mov r0, r9
    mov r1, r8
    bl func_ov002_02254e14
    b .L_66c
.L_658:
    cmp r7, #0x0
    beq .L_66c
    mov r0, r9
    mov r1, r8
    bl func_ov002_021d5a38
.L_66c:
    cmp r7, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r4
    bl func_02031084
    cmp r0, #0x0
    beq .L_6ac
    ldr r0, _LIT15
    add r0, r0, r6
    ldr r2, [r5, r0]
    cmp r2, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r9
    mov r1, r8
    rsb r2, r2, #0x0
    bl func_ov002_021d90f0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_6ac:
    mov r0, r4
    bl func_0203124c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT15
    add r0, r0, r6
    ldr r2, [r5, r0]
    cmp r2, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r9
    mov r1, r8
    rsb r2, r2, #0x0
    bl func_ov002_021d92f0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0cc
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x00001688
_LIT4: .word 0x00001397
_LIT5: .word 0x00001284
_LIT6: .word 0x000010c6
_LIT7: .word 0x0000154d
_LIT8: .word 0x0000181a
_LIT9: .word 0x00001957
_LIT10: .word 0x00001aae
_LIT11: .word data_ov002_022d008c
_LIT12: .word 0x00001368
_LIT13: .word 0x000017ff
_LIT14: .word 0x00001495
_LIT15: .word data_ov002_022cf0c8
