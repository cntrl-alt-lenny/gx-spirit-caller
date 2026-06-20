; func_ov002_022a1e60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104bac
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d1a9c
        .extern func_02037208
        .extern func_020b3870
        .extern func_ov002_021afbc4
        .extern func_ov002_0229f1e0
        .extern func_ov002_022a0f8c
        .extern func_ov002_022a10fc
        .extern func_ov002_022ad134
        .extern func_ov002_022aeb60
        .global func_ov002_022a1e60
        .arm
func_ov002_022a1e60:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr ip, [r6, #0x4]
    cmp ip, #0x0
    bge .L_4d4
    bl func_ov002_022ad134
    ldmia sp!, {r4, r5, r6, pc}
.L_4d4:
    ldr r2, _LIT0
    ldr r5, [r6, #0x20]
    ldrh r3, [r2, #0x54]
    ldr r4, [r6, #0x14]
    tst r3, #0x1
    bne .L_500
    ldr r1, _LIT1
    ldr r1, [r1, #0xe64]
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    beq .L_53c
.L_500:
    cmp r4, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
    ldr r0, [r6, #0x40]
    cmp r0, #0x0
    beq .L_528
    mov r0, r6
    mov r1, r5
    bl func_ov002_022a0f8c
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_528:
    ldr r0, [r6, #0x14]
    add r1, r6, #0x198
    add r0, r1, r0, lsl #0x5
    bl func_ov002_0229f1e0
    ldmia sp!, {r4, r5, r6, pc}
.L_53c:
    tst r3, #0x2
    beq .L_584
    ldr r1, [r6, #0x1c]
    cmp r1, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
    ldr r1, [r6, #0x40]
    cmp r1, #0x0
    beq .L_56c
    mov r1, r5
    bl func_ov002_022a0f8c
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_56c:
    ldr r1, [r6, #0x1c]
    add r0, r6, #0x198
    add r0, r0, r1, lsl #0x5
    str r1, [r6, #0x14]
    bl func_ov002_0229f1e0
    ldmia sp!, {r4, r5, r6, pc}
.L_584:
    tst r3, #0x400
    beq .L_5a4
    ldr r0, _LIT2
    bl func_ov002_022aeb60
    ldr r0, _LIT3
    mov r1, #0x2
    str r1, [r0, #0xd0]
    ldmia sp!, {r4, r5, r6, pc}
.L_5a4:
    ldrh r1, [r2, #0x56]
    tst r1, #0x20
    beq .L_64c
    cmp ip, #0x0
    bge .L_5f8
    ldr r1, [r6, #0x60]
    cmp r1, #0x0
    beq .L_5d0
    cmp r1, #0x1
    beq .L_5e8
    b .L_75c
.L_5d0:
    cmp r5, #0x0
    beq .L_75c
    sub r1, r5, #0x1
    str r1, [r6, #0x20]
    bl func_ov002_022a10fc
    b .L_75c
.L_5e8:
    cmp r4, #0x0
    subne r0, r4, #0x1
    strne r0, [r6, #0x14]
    b .L_75c
.L_5f8:
    ldr r0, [r6, #0x40]
    cmp r0, #0x0
    beq .L_610
    add r0, r6, #0x198
    bl func_ov002_0229f1e0
    ldmia sp!, {r4, r5, r6, pc}
.L_610:
    cmp r4, #0x0
    bge .L_634
    ldr r0, [r6, #0x194]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    str r0, [r6, #0x14]
    b .L_75c
.L_634:
    ldr r1, [r6, #0x194]
    add r0, r4, r1
    sub r0, r0, #0x1
    bl func_020b3870
    str r1, [r6, #0x14]
    b .L_75c
.L_64c:
    tst r1, #0x10
    beq .L_700
    cmp ip, #0x0
    bge .L_6b0
    ldr r0, [r6, #0x60]
    cmp r0, #0x0
    beq .L_674
    cmp r0, #0x1
    beq .L_69c
    b .L_75c
.L_674:
    bl func_ov002_021afbc4
    ldr r1, [r6, #0x20]
    sub r0, r0, #0x1
    cmp r1, r0
    bge .L_75c
    add r1, r1, #0x1
    mov r0, r6
    str r1, [r6, #0x20]
    bl func_ov002_022a10fc
    b .L_75c
.L_69c:
    ldr r0, [r6, #0x194]
    cmp r4, r0
    addlt r0, r4, #0x1
    strlt r0, [r6, #0x14]
    b .L_75c
.L_6b0:
    ldr r0, [r6, #0x40]
    cmp r0, #0x0
    beq .L_6c8
    add r0, r6, #0x1d8
    bl func_ov002_0229f1e0
    ldmia sp!, {r4, r5, r6, pc}
.L_6c8:
    cmp r4, #0x0
    bge .L_6ec
    ldr r0, [r6, #0x194]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x0
    str r0, [r6, #0x14]
    b .L_75c
.L_6ec:
    ldr r1, [r6, #0x194]
    add r0, r4, #0x1
    bl func_020b3870
    str r1, [r6, #0x14]
    b .L_75c
.L_700:
    cmp ip, #0x5
    bne .L_730
    tst r1, #0xc0
    beq .L_75c
    ldr r1, [r6, #0x24]
    add r0, r1, r1, lsr #0x1f
    add r0, r5, r0, asr #0x1
    bl func_020b3870
    mov r0, r6
    str r1, [r6, #0x20]
    bl func_ov002_022a10fc
    b .L_75c
.L_730:
    cmp ip, #0xb
    bne .L_75c
    ldrh r0, [r2, #0x52]
    tst r0, #0x40
    movne r5, #0x1
    ldr r0, _LIT0
    strne r5, [r6, #0x20]
    ldrh r0, [r0, #0x52]
    tst r0, #0x80
    movne r5, #0x2
    strne r5, [r6, #0x20]
.L_75c:
    ldr r0, [r6, #0x20]
    cmp r5, r0
    ldreq r0, [r6, #0x14]
    cmpeq r4, r0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r6, #0x4]
    mov r2, #0x0
    cmp r0, #0x3
    mov r3, #0x3
    bne .L_794
    mov r0, #0x48
    sub r1, r0, #0x49
    bl func_02037208
    ldmia sp!, {r4, r5, r6, pc}
.L_794:
    mov r0, #0x38
    sub r1, r0, #0x39
    bl func_02037208
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02104bac
_LIT1: .word data_021040ac
_LIT2: .word data_ov002_022d1a9c
_LIT3: .word data_ov002_022d0f2c
