; func_ov002_02234e20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdc88
        .extern data_ov002_022ce288
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_0202b9b0
        .extern func_0202e234
        .extern func_0203058c
        .extern func_02030808
        .extern func_ov002_021b947c
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bbda8
        .extern func_ov002_021bc618
        .extern func_ov002_021ca2b8
        .extern func_ov002_021d7c1c
        .extern func_ov002_021d873c
        .extern func_ov002_021e16a4
        .extern func_ov002_021e27c0
        .extern func_ov002_021e286c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225368c
        .extern func_ov002_0226b034
        .extern func_ov002_0226b054
        .extern func_ov002_0226b0b0
        .extern func_ov002_0226c708
        .extern func_ov002_0227ac64
        .global func_ov002_02234e20
        .arm
func_ov002_02234e20:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r1, _LIT0
    ldrh r0, [r6, #0x2]
    ldr r2, [r1, #0x5a8]
    ldr r5, [r1, #0x5ac]
    mov r3, r0, lsl #0x1f
    cmp r2, #0x64
    mov r0, r3, lsr #0x1f
    eor r4, r5, r3, lsr #0x1f
    bgt .L_38
    cmp r2, #0x64
    beq .L_43c
    b .L_45c
.L_38:
    sub r2, r2, #0x75
    cmp r2, #0xb
    addls pc, pc, r2, lsl #0x2
    b .L_45c
    b .L_42c
    b .L_418
    b .L_408
    b .L_3bc
    b .L_45c
    b .L_324
    b .L_45c
    b .L_2cc
    b .L_248
    b .L_174
    b .L_138
    b .L_78
.L_78:
    mov r0, #0x0
    strh r0, [r6, #0xc]
    strh r0, [r6, #0xe]
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    beq .L_130
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_130
    ldrh r1, [r6, #0x2]
    mov r4, #0x0
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    str r1, [r0, #0xd94]
    mov r5, r4
.L_dc:
    ldrh r0, [r6, #0x2]
    mov r1, r4
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226c708
    cmp r0, #0x0
    beq .L_124
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b034
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_124:
    add r4, r4, #0x1
    cmp r4, #0x4
    ble .L_dc
.L_130:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_138:
    ldr r0, _LIT2
    ldrh r0, [r0, #0xb0]
    mov r1, r0, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021d873c
    ldr r0, _LIT2
    ldrh r0, [r0, #0xb0]
    mov r1, r0, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021b9ecc
    strh r0, [r6, #0xe]
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_174:
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    beq .L_230
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_230
    mov r1, #0x0
    mov r0, r6
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_230
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r4, r0, #0xff
    and r5, r1, #0xff
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9ecc
    mov r2, #0x14
    ldr r1, _LIT3
    ldr r3, _LIT4
    and ip, r4, #0x1
    mla r1, ip, r1, r3
    smulbb r2, r5, r2
    ldrh r1, [r2, r1]
    mov r7, r0
    cmp r1, #0x0
    beq .L_230
    bl func_0202e234
    cmp r0, #0x0
    beq .L_230
    mov r0, r7
    bl func_02030808
    cmp r0, #0x0
    beq .L_230
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9ecc
    strh r0, [r6, #0xc]
.L_230:
    bl func_ov002_021e2b3c
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_248:
    add r0, r6, r5, lsl #0x1
    ldrh r2, [r0, #0xc]
    cmp r2, #0x0
    strh r2, [r6, #0xa]
    moveq r0, #0x64
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r1, [r6]
    mov r0, r4
    bl func_ov002_0225368c
    ldr r1, _LIT0
    strh r0, [r6, #0x10]
    mov r2, #0x0
    str r2, [r1, #0x5b0]
    ldrh r0, [r6, #0x10]
    cmp r0, #0x0
    bne .L_29c
    ldrh r1, [r6]
    mov r0, r4
    bl func_ov002_0226b0b0
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_29c:
    mov r0, r4
    bl func_ov002_021bc618
    ldrh r1, [r6, #0x10]
    cmp r0, r1
    movge r0, #0x7c
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r1, [r6]
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_0226b0b0
    mov r0, #0x7a
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2cc:
    ldrh r2, [r6, #0x10]
    ldr r3, [r1, #0x5b0]
    cmp r3, r2
    bge .L_31c
    ldr r1, _LIT5
    cmp r4, r0
    add r1, r1, r3, lsl #0x2
    movne r3, #0x2
    mov r5, #0x0
    moveq r3, #0x0
    mov r0, r4
    mov r2, #0x1
    str r5, [sp]
    bl func_ov002_0227ac64
    ldr r1, _LIT0
    mov r0, #0x7c
    ldr r2, [r1, #0x5b0]
    add r2, r2, #0x1
    str r2, [r1, #0x5b0]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_31c:
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_324:
    ldrh r2, [r6, #0x10]
    ldr r3, [r1, #0x5b0]
    cmp r3, r2
    bge .L_398
    ldr r0, _LIT5
    ldr r1, [r0, r3, lsl #0x2]
    add r5, r0, r3, lsl #0x2
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bl func_ov002_021b947c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xb
    bne .L_380
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_021d7c1c
.L_380:
    ldr r1, _LIT0
    mov r0, #0x7a
    ldr r2, [r1, #0x5b0]
    add r2, r2, #0x1
    str r2, [r1, #0x5b0]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_398:
    ldrh r1, [r6, #0xa]
    cmp r4, r0
    movne r3, #0x1
    moveq r3, #0x0
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_021e16a4
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_3bc:
    ldrh r1, [r6, #0xa]
    mov r0, r4
    bl func_ov002_021bbda8
    mov r5, r0
    ldrh r0, [r6, #0xa]
    bl func_0202b9b0
    cmp r5, r0
    movge r0, #0x75
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r6, #0xa]
    bl func_0203058c
    cmp r0, #0x0
    movne r0, #0x75
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_021e27c0
    mov r0, #0x77
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_408:
    rsb r0, r4, #0x1
    bl func_ov002_0226b054
    mov r0, #0x76
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_418:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_021e27c0
    mov r0, #0x75
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_42c:
    mov r0, r4
    bl func_ov002_021e286c
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_43c:
    add r0, r5, #0x1
    str r0, [r1, #0x5ac]
    cmp r0, #0x2
    movlt r0, #0x7d
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_45c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d016c
_LIT2: .word data_ov002_022d0e6c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf1a4
_LIT5: .word data_ov002_022cdc88
