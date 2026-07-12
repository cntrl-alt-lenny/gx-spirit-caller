; func_ov002_0221a314 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern func_0202b86c
        .extern func_ov002_021b939c
        .extern func_ov002_021b9a84
        .extern func_ov002_021c3304
        .extern func_ov002_021c3528
        .extern func_ov002_021d58dc
        .extern func_ov002_021d5c58
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021ff2cc
        .extern func_ov002_0223de04
        .extern func_ov002_0227ab74
        .global func_ov002_0221a314
        .arm
func_ov002_0221a314:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r6, r0
    ldrh r5, [r6, #0x2]
    ldr ip, _LIT0
    ldrh r2, [r6, #0x4]
    mov r3, r5, lsl #0x1f
    mov r4, r3, lsr #0x1f
    mov lr, r5, lsl #0x1a
    ldr r3, _LIT1
    and r5, r4, #0x1
    mla ip, r5, r3, ip
    mov r3, lr, lsr #0x1b
    mov r5, #0x14
    mul r5, r3, r5
    add ip, ip, #0x30
    ldr ip, [ip, r5]
    mov lr, r2, lsl #0x11
    mov r5, ip, lsl #0x2
    mov r5, r5, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r5, r5, lsl #0x1
    mov lr, lr, lsr #0x17
    add r5, r5, ip, lsr #0x1f
    cmp lr, r5
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
    ldr r5, _LIT2
    ldr r5, [r5, #0x5a8]
    cmp r5, #0x64
    beq .L_350
    cmp r5, #0x7f
    beq .L_224
    cmp r5, #0x80
    bne .L_360
    mov r2, r2, lsl #0x1d
    movs r2, r2, lsr #0x1f
    bne .L_200
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    beq .L_200
    ldrh r0, [r6, #0x6]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_200
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223de04
    mov r4, r0
    bl func_ov002_021b939c
    mov r1, r0, lsr #0x10
    mov r2, r1, lsl #0x10
    and r1, r0, #0xff
    mov r0, r0, lsl #0x10
    ldrh r5, [r6]
    ldr r3, _LIT3
    mov r2, r2, lsr #0x10
    cmp r5, r3
    mov r0, r0, lsr #0x10
    beq .L_12c
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xe
    bne .L_124
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3304
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_15c
.L_124:
    mov r0, #0x0
    b .L_15c
.L_12c:
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xf
    bne .L_158
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3528
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_15c
.L_158:
    mov r0, #0x0
.L_15c:
    cmp r0, #0x0
    beq .L_200
    mov r5, #0x2
    bl func_ov002_021e2a4c
    ldrh r2, [r6]
    ldr r1, _LIT4
    cmp r2, r1
    bgt .L_1a4
    bge .L_1c4
    sub r0, r1, #0x280
    cmp r2, r0
    bgt .L_194
    beq .L_1c4
    b .L_1c8
.L_194:
    ldr r0, _LIT5
    cmp r2, r0
    beq .L_1c4
    b .L_1c8
.L_1a4:
    ldr r0, _LIT6
    cmp r2, r0
    bgt .L_1b8
    moveq r5, #0x1
    b .L_1c8
.L_1b8:
    ldr r0, _LIT7
    cmp r2, r0
    bne .L_1c8
.L_1c4:
    mov r5, #0x0
.L_1c8:
    mov r0, r4
    bl func_ov002_021b9a84
    mov r1, #0x0
    str r1, [sp]
    ldrh r2, [r6, #0x2]
    mov r1, r0
    mov r3, r5
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, #0x1
    bl func_ov002_0227ab74
    add sp, sp, #0x4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_200:
    ldrh r0, [r6]
    bl func_0202b86c
    cmp r0, #0x3
    ldreqh r0, [r6, #0x4]
    add sp, sp, #0x4
    orreq r0, r0, #0x8
    streqh r0, [r6, #0x4]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_224:
    ldrh r5, [r6]
    ldr r2, _LIT8
    cmp r5, r2
    bgt .L_28c
    cmp r5, #0x1880
    blt .L_248
    cmpne r5, r2
    beq .L_308
    b .L_344
.L_248:
    ldr r0, _LIT5
    cmp r5, r0
    bgt .L_268
    bge .L_2cc
    sub r0, r0, #0x17
    cmp r5, r0
    beq .L_308
    b .L_344
.L_268:
    ldr r0, _LIT4
    cmp r5, r0
    bgt .L_27c
    beq .L_308
    b .L_344
.L_27c:
    sub r0, r2, #0xca
    cmp r5, r0
    beq .L_2cc
    b .L_344
.L_28c:
    ldr r1, _LIT3
    cmp r5, r1
    bgt .L_2ac
    bge .L_2cc
    sub r0, r1, #0x5f
    cmp r5, r0
    beq .L_308
    b .L_344
.L_2ac:
    add r0, r1, #0x65
    cmp r5, r0
    bgt .L_2c0
    beq .L_2cc
    b .L_344
.L_2c0:
    add r0, r2, #0x2e4
    cmp r5, r0
    bne .L_344
.L_2cc:
    mov r1, #0x0
    ldr r0, _LIT9
    str r1, [sp]
    ldr r2, [r0]
    and r1, r4, #0xff
    and r0, r3, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r1, r2, lsl #0x1b
    mov r2, r0, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x1c
    mov r2, r2, lsr #0x10
    mov r3, #0x17
    bl func_ov002_021d58dc
    b .L_344
.L_308:
    ldr r0, _LIT9
    and r2, r4, #0xff
    ldr r0, [r0]
    and r1, r3, #0xff
    mov r0, r0, lsl #0x1b
    mov r0, r0, lsr #0x1c
    and r0, r0, #0xff
    orr r1, r2, r1, lsl #0x8
    orr r0, r2, r0, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r2, r0, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d5c58
.L_344:
    add sp, sp, #0x4
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_350:
    bl func_ov002_021e2b6c
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_360:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022ce1a8
_LIT3: .word 0x00001a36
_LIT4: .word 0x000015e6
_LIT5: .word 0x0000137d
_LIT6: .word 0x000017b7
_LIT7: .word 0x00001b65
_LIT8: .word 0x00001881
_LIT9: .word data_ov002_022cd220
