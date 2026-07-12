; func_ov002_022a2a1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov002_022d008c
        .extern data_ov002_022d0e4c
        .extern data_ov002_022d0eb8
        .extern func_02006178
        .extern func_0207ef74
        .extern func_ov002_0229f244
        .extern func_ov002_0229f6d8
        .extern func_ov002_022a15a0
        .extern func_ov002_022a2930
        .global func_ov002_022a2a1c
        .arm
func_ov002_022a2a1c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x40
    mov r4, r0
    ldr r1, [r4, #0x38]
    cmp r1, #0x8
    addlt sp, sp, #0x40
    ldmltia sp!, {r4, r5, r6, pc}
    ldr r1, [r4, #0x48]
    cmp r1, #0x0
    beq .L_2c
    bl func_ov002_0229f6d8
.L_2c:
    ldr r0, _LIT0
    ldr r0, [r0, #0xd0]
    cmp r0, #0x2
    addne sp, sp, #0x40
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, [r4, #0x4]
    cmp r0, #0x4
    bne .L_198
    mov r0, r4
    bl func_ov002_022a15a0
    ldr r1, _LIT1
    ldr r2, [r4, #0x30]
    ldr r1, [r1, #0xcf8]
    add r2, r0, r2, lsl #0x3
    mov r0, r1, lsl #0x2
    add r1, r0, #0x4
    and r0, r2, #0xff
    ldr r2, _LIT2
    mov r1, r1, lsl #0x1a
    orr r0, r0, #-2147483648
    orr r3, r0, r1, lsr #0x7
    strh r2, [sp, #0x3c]
    ldr r0, _LIT3
    add r1, sp, #0x38
    str r3, [sp, #0x38]
    mov r2, #0x1
    bl func_0207ef74
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    addlt sp, sp, #0x40
    ldmltia sp!, {r4, r5, r6, pc}
    bl func_02006178
    cmp r0, #0x0
    beq .L_cc
    ldr r0, [r4, #0x14]
    add r0, r4, r0, lsl #0x5
    ldr r0, [r0, #0x19c]
    cmp r0, #0x0
    addeq sp, sp, #0x40
    ldmeqia sp!, {r4, r5, r6, pc}
.L_cc:
    ldr r2, [r4, #0x14]
    add r1, r4, #0x198
    ldr r0, [r1, r2, lsl #0x5]
    add r1, r1, r2, lsl #0x5
    cmp r0, #0x0
    ldrne r0, [r1, #0x18]
    cmpne r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    add r0, r4, r2, lsl #0x5
    beq .L_110
    ldr r0, [r0, #0x1b0]
    tst r0, #0x4
    moveq r5, #0x1
    movne r5, #0x0
    b .L_114
.L_110:
    ldr r5, [r0, #0x19c]
.L_114:
    add r0, sp, #0x18
    bl func_ov002_0229f244
    ldr r2, [sp, #0x18]
    ldr r1, [sp, #0x1c]
    mov r0, r4
    str r2, [sp, #0x30]
    str r1, [sp, #0x34]
    bl func_ov002_022a15a0
    add r1, r5, #0x1
    mov r1, r1, lsl #0x9
    ldr r2, [sp, #0x34]
    add r1, r1, #0x3980
    add r0, r2, r0
    ldr r2, [sp, #0x30]
    add r1, r1, #0x8000
    sub r3, r0, #0x10
    mov r0, r1, asr #0x6
    add r0, r1, r0, lsr #0x19
    sub r4, r2, #0x10
    and r2, r3, #0xff
    mov r0, r0, asr #0x7
    orr r3, r0, #0xa000
    orr r0, r2, #-2147483648
    mov r1, r4, lsl #0x17
    orr r4, r0, r1, lsr #0x7
    ldr r0, _LIT3
    add r1, sp, #0x38
    mov r2, #0x1
    str r4, [sp, #0x38]
    strh r3, [sp, #0x3c]
    bl func_0207ef74
    add sp, sp, #0x40
    ldmia sp!, {r4, r5, r6, pc}
.L_198:
    cmp r0, #0xb
    addls pc, pc, r0, lsl #0x2
    b .L_2ec
    b .L_2ec
    b .L_2ec
    b .L_2ec
    b .L_2ec
    b .L_2ec
    b .L_1d4
    b .L_1d4
    b .L_2ec
    b .L_2ec
    b .L_1d4
    b .L_2ec
    b .L_2e4
.L_1d4:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_2ec
    ldr r2, [r4, #0x20]
    add r0, sp, #0x10
    mov r1, r4
    bl func_ov002_022a2930
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x10]
    mov r0, r4
    str r1, [sp, #0x2c]
    str r2, [sp, #0x28]
    bl func_ov002_022a15a0
    ldr r2, [sp, #0x2c]
    ldr r1, [sp, #0x28]
    add r0, r2, r0
    sub r0, r0, #0x10
    sub r1, r1, #0x10
    and r0, r0, #0xff
    ldr r2, _LIT4
    mov r1, r1, lsl #0x17
    orr r0, r0, #-2147483648
    orr r3, r0, r1, lsr #0x7
    strh r2, [sp, #0x3c]
    ldr r0, _LIT3
    add r1, sp, #0x38
    str r3, [sp, #0x38]
    mov r2, #0x1
    bl func_0207ef74
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq .L_2ec
    ldr r3, [r4, #0xc]
    mov r2, #0x0
    mov r1, #0x1
.L_260:
    add r0, r2, #0x1
    tst r3, r1, lsl r0
    bne .L_278
    mov r2, r0
    cmp r0, #0x14
    blt .L_260
.L_278:
    add r0, sp, #0x8
    mov r1, r4
    bl func_ov002_022a2930
    ldr r1, [sp, #0xc]
    ldr r2, [sp, #0x8]
    mov r0, r4
    str r1, [sp, #0x2c]
    str r2, [sp, #0x28]
    bl func_ov002_022a15a0
    ldr r2, [sp, #0x2c]
    ldr r1, [sp, #0x28]
    add r0, r2, r0
    sub r5, r0, #0x10
    sub r3, r1, #0x10
    ldr r2, [sp, #0x38]
    ldr r0, _LIT5
    and r1, r5, #0xff
    and r0, r2, r0
    orr r0, r0, r1
    mov r2, r3, lsl #0x17
    orr r3, r0, r2, lsr #0x7
    ldr r0, _LIT3
    add r1, sp, #0x38
    mov r2, #0x1
    str r3, [sp, #0x38]
    bl func_0207ef74
    b .L_2ec
.L_2e4:
    add sp, sp, #0x40
    ldmia sp!, {r4, r5, r6, pc}
.L_2ec:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bge .L_308
    ldr r0, [r4, #0x60]
    cmp r0, #0x1
    addne sp, sp, #0x40
    ldmneia sp!, {r4, r5, r6, pc}
.L_308:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    addlt sp, sp, #0x40
    ldmltia sp!, {r4, r5, r6, pc}
    bl func_02006178
    cmp r0, #0x0
    beq .L_33c
    ldr r0, [r4, #0x14]
    add r0, r4, r0, lsl #0x5
    ldr r0, [r0, #0x19c]
    cmp r0, #0x0
    addeq sp, sp, #0x40
    ldmeqia sp!, {r4, r5, r6, pc}
.L_33c:
    ldr r0, [r4, #0x4]
    ldr r1, [r4, #0x14]
    cmp r0, #0x7
    moveq r5, #0x30
    add r2, r4, #0x198
    movne r5, #0x20
    cmp r0, #0x7
    cmpne r0, #0x4
    moveq r6, #0x20
    add r0, sp, #0x0
    add r1, r2, r1, lsl #0x5
    movne r6, #0x18
    bl func_ov002_0229f244
    ldr r0, _LIT6
    ldr r1, [sp, #0x4]
    ldr r0, [r0, #0x38]
    ldr r2, [sp]
    tst r0, #0x10
    moveq r0, #0x1
    movne r0, #0x0
    mov r0, r0, lsl #0xa
    add r0, r0, #0x3980
    str r1, [sp, #0x24]
    add r1, r0, #0x8000
    mov r0, r1, asr #0x6
    add r1, r1, r0, lsr #0x19
    mov r0, r4
    str r2, [sp, #0x20]
    mov r4, r1, asr #0x7
    bl func_ov002_022a15a0
    ldr r2, [sp, #0x24]
    orr r3, r4, #0xa000
    add r0, r2, r0
    add r1, r6, r6, lsr #0x1f
    sub r0, r0, r1, asr #0x1
    sub r0, r0, #0x1
    and r0, r0, #0xff
    orr r1, r0, #0x4000
    ldr r2, [sp, #0x20]
    add r0, r5, r5, lsr #0x1f
    sub r0, r2, r0, asr #0x1
    sub r0, r0, #0x1
    mov r0, r0, lsl #0x17
    orr r1, r1, #-1073741824
    orr r4, r1, r0, lsr #0x7
    ldr r0, _LIT3
    add r1, sp, #0x38
    mov r2, #0x1
    str r4, [sp, #0x38]
    strh r3, [sp, #0x3c]
    bl func_0207ef74
    add sp, sp, #0x40
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022d0e4c
_LIT1: .word data_ov002_022d008c
_LIT2: .word 0x0000a173
_LIT3: .word data_ov002_022d0eb8
_LIT4: .word 0x0000a193
_LIT5: .word 0xfe00ff00
_LIT6: .word data_02103fcc
