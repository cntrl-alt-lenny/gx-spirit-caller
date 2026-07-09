; func_ov002_021d3fc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce870
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0b4
        .extern data_ov002_022d008c
        .extern func_0202e2bc
        .extern func_ov002_021b0a2c
        .extern func_ov002_021b0a74
        .extern func_ov002_021b0afc
        .extern func_ov002_021b0b24
        .extern func_ov002_021b1e40
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021d3fc0
        .arm
func_ov002_021d3fc0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r1, _LIT0
    ldrh r1, [r1]
    tst r1, #0x8000
    movne r4, #0x1
    moveq r4, #0x0
    cmp r0, #0x0
    ldrne r0, _LIT0
    ldrneh r9, [r0, #0x2]
    ldreq r0, _LIT0
    ldreqh r0, [r0, #0x2]
    rsbeq r9, r0, #0x0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    ldrh r7, [r0, #0x4]
    ldrh r8, [r0, #0x6]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    b .L_60
    b .L_348
    b .L_388
    b .L_3c0
    b .L_3f0
.L_60:
    and r0, r7, #0xff
    mov r0, r0, lsl #0x8
    orr r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r1, r4
    mov r2, r9
    mov r3, r0, lsr #0x10
    mov r0, #0xe
    bl func_ov002_0229acd0
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r5, r1, r0
    ldr r6, _LIT2
    ldr r1, [r6, r5]
    cmp r1, #0x0
    ble .L_154
    rsb r0, r9, #0x0
    cmp r1, r0
    bgt .L_154
    ldr r1, _LIT3
    ldr r0, _LIT4
    str r8, [r1, #0xd08]
    cmp r8, r0
    bgt .L_100
    bge .L_12c
    ldr r1, _LIT5
    cmp r8, r1
    bgt .L_d8
    beq .L_12c
    b .L_154
.L_d8:
    add r0, r1, #0x3d
    cmp r8, r0
    bgt .L_154
    add r0, r1, #0x39
    cmp r8, r0
    blt .L_154
    addne r0, r1, #0x3d
    cmpne r8, r0
    beq .L_12c
    b .L_154
.L_100:
    ldr r0, _LIT6
    cmp r8, r0
    bgt .L_120
    bge .L_12c
    sub r0, r0, #0x1a8
    cmp r8, r0
    beq .L_12c
    b .L_154
.L_120:
    add r0, r0, #0x1
    cmp r8, r0
    bne .L_154
.L_12c:
    ldr r0, _LIT7
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_154
    rsb r1, r4, #0x1
    ldr r0, _LIT1
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT8
    str r8, [r0, r2]
.L_154:
    ldr r0, _LIT9
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r4, r0
    bne .L_2ec
    cmp r9, #0x0
    bge .L_2ec
    cmp r7, #0x1
    bne .L_258
    rsb r7, r9, #0x0
    mov r1, r7
    mov r0, #0x3
    bl func_ov002_021b0afc
    mov r1, r7
    mov r0, #0x4
    bl func_ov002_021b0b24
    mov r1, r7
    mov r0, #0xa
    bl func_ov002_021b0b24
    mov r0, #0xa
    bl func_ov002_021b0a2c
    mov r1, r0
    mov r0, #0x9
    bl func_ov002_021b0afc
    ldr r0, _LIT7
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_1ec
    mov r1, r7
    mov r0, #0x7
    bl func_ov002_021b0b24
    mov r0, r8
    bl func_0202e2bc
    cmp r0, #0x0
    beq .L_1ec
    mov r1, r7
    mov r0, #0xb
    bl func_ov002_021b0b24
.L_1ec:
    ldr r0, _LIT9
    ldr r1, _LIT3
    ldr r0, [r0, #0x4]
    ldr r1, [r1, #0xcec]
    eor r0, r0, #0x1
    cmp r1, r0
    bne .L_220
    mov r1, r7
    mov r0, #0x5
    bl func_ov002_021b0afc
    mov r1, r7
    mov r0, #0x6
    bl func_ov002_021b0b24
.L_220:
    ldr r0, [r6, r5]
    cmp r0, #0x0
    ble .L_2d0
    cmp r0, r7
    bgt .L_2d0
    ldr r0, _LIT9
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r4, r0
    bne .L_2d0
    mov r1, r7
    mov r0, #0x8
    bl func_ov002_021b0a74
    b .L_2d0
.L_258:
    cmp r7, #0x0
    bne .L_2d0
    rsb r7, r9, #0x0
    mov r1, r7
    mov r0, #0x1
    bl func_ov002_021b0afc
    mov r1, r7
    mov r0, #0x2
    bl func_ov002_021b0b24
    mov r1, r7
    mov r0, #0xa
    bl func_ov002_021b0b24
    mov r0, #0xa
    bl func_ov002_021b0a2c
    mov r1, r0
    mov r0, #0x9
    bl func_ov002_021b0afc
    ldr r0, [r6, r5]
    cmp r0, #0x0
    ble .L_2d0
    cmp r0, r7
    bgt .L_2d0
    ldr r0, _LIT9
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r4, r0
    bne .L_2d0
    mov r1, r7
    mov r0, #0x8
    bl func_ov002_021b0a74
.L_2d0:
    ldr r0, [r6, r5]
    rsb r1, r9, #0x0
    cmp r1, r0
    moveq r1, #0x1
    movne r1, #0x0
    mov r0, #0x37
    bl func_ov002_021b0a74
.L_2ec:
    ldr r0, _LIT9
    ldr r0, [r0, #0x4]
    cmp r4, r0
    bne .L_310
    cmp r9, #0x0
    bge .L_310
    mov r0, #0x36
    mov r1, #0x1
    bl func_ov002_021b0a74
.L_310:
    ldr r0, _LIT9
    ldr r0, [r0, #0x4]
    cmp r4, r0
    bne .L_334
    cmp r9, #0x0
    ble .L_334
    mov r1, r9
    mov r0, #0x12
    bl func_ov002_021b0b24
.L_334:
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_348:
    mov r0, #0xe
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r1, r4
    mov r2, r9
    mov r3, r7
    mov r0, #0x49
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r2, [r0, #0x810]
    add r2, r2, #0x1
    str r2, [r0, #0x810]
    str r1, [r0, #0x814]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_388:
    mov r0, #0x49
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x814]
    add r1, r1, #0x1
    str r1, [r0, #0x814]
    cmp r1, #0xa
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_3c0:
    and r0, r7, #0xff
    mov r0, r0, lsl #0x18
    mov r3, r0, lsr #0x10
    mov r1, r4
    mov r2, r9
    mov r0, #0xe
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_3f0:
    mov r0, #0xe
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r9, #0x0
    ldr r0, _LIT1
    and r1, r4, #0x1
    bge .L_42c
    mul r2, r1, r0
    ldr r1, _LIT2
    ldr r0, [r1, r2]
    adds r0, r0, r9
    movmi r0, #0x0
    str r0, [r1, r2]
    b .L_444
.L_42c:
    mul r2, r1, r0
    ldr r1, _LIT2
    ldr r0, [r1, r2]
    cmp r0, #0x0
    addne r0, r0, r9
    strne r0, [r1, r2]
.L_444:
    cmp r7, #0x2
    ldreq r0, _LIT3
    ldreq r0, [r0, #0xcec]
    cmpeq r4, r0
    bne .L_474
    rsb r5, r9, #0x0
    mov r0, r4
    mov r1, #0xb
    mov r2, #0x21
    mov r3, #0x14c0
    str r5, [sp]
    bl func_ov002_021b1e40
.L_474:
    ldr r1, _LIT9
    ldr r0, _LIT1
    ldr r2, [r1, #0x4]
    ldr r1, _LIT2
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r1, [r1, r0]
    mov r0, #0x13
    bl func_ov002_021b0afc
    ldr r1, _LIT9
    ldr r0, _LIT1
    ldr r4, [r1, #0x4]
    ldr r3, _LIT2
    eor r1, r4, #0x1
    and r2, r1, #0x1
    and r1, r4, #0x1
    mul r4, r2, r0
    mul r0, r1, r0
    ldr r2, [r3, r4]
    ldr r1, [r3, r0]
    mov r0, #0x14
    sub r1, r2, r1
    bl func_ov002_021b0afc
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x8
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022d008c
_LIT4: .word 0x00001985
_LIT5: .word 0x000016ec
_LIT6: .word 0x00001b2e
_LIT7: .word data_ov002_022cd314
_LIT8: .word data_ov002_022cf0b4
_LIT9: .word data_ov002_022cd65c
