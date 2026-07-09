; func_ov002_0224027c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021ae434
        .extern func_ov002_021c1e10
        .extern func_ov002_0223dbd0
        .extern func_ov002_022574e0
        .extern func_ov002_022576f4
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .extern func_ov002_02280ce4
        .global func_ov002_0224027c
        .arm
func_ov002_0224027c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r7, r0
    ldr r1, [r1, #0x5b8]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_5e8
    b .L_358
    b .L_4ac
    b .L_50c
    b .L_598
.L_358:
    bl func_ov002_022576f4
    cmp r0, #0x0
    ldrh r0, [r7, #0x2]
    movgt r6, #0x1
    movle r6, #0x0
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    add r0, r0, #0xee
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r4, #0x0
    cmp r0, #0x1
    bhi .L_408
    ldr r1, _LIT1
    ldr r0, _LIT2
    ldr r5, [r1]
    ldr r2, [r1, #0x1c]
    and r3, r5, #0x1
    mov r1, #0x14
    mul r0, r3, r0
    ldr r3, _LIT3
    mul r1, r2, r1
    add r3, r3, r0
    add r3, r3, r1
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    beq .L_408
    ldr r3, _LIT4
    add r0, r3, r0
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    bne .L_408
    mov r0, r7
    mov r1, r5
    bl func_ov002_021c1e10
    cmp r0, #0x0
    beq .L_408
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r5
    movne r4, #0x1
.L_408:
    cmp r6, #0x0
    cmpne r4, #0x0
    beq .L_468
    ldrh r1, [r7, #0x2]
    ldr r0, _LIT5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_440
    ldr r0, _LIT6
    mov r1, #0x2
    str r1, [r0, #0xd44]
    b .L_490
.L_440:
    mov r1, #0x1a0
    mov r0, #0x0
    mov r4, #0xf
    str r0, [sp]
    add r0, r4, #0xf4
    add r2, r1, #0x1
    add r3, r1, #0x2
    str r4, [sp, #0x4]
    bl func_ov002_021ae434
    b .L_490
.L_468:
    cmp r4, #0x0
    beq .L_480
    ldr r0, _LIT6
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_490
.L_480:
    cmp r6, #0x0
    ldrne r0, _LIT6
    movne r1, #0x1
    strne r1, [r0, #0xd44]
.L_490:
    ldr r1, _LIT0
    add sp, sp, #0x8
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_4ac:
    ldr r1, _LIT6
    ldr r2, [r1, #0xd44]
    add r2, r2, #0x1
    strh r2, [r7, #0xc]
    ldr r1, [r1, #0xd44]
    cmp r1, #0x1
    beq .L_4d8
    ldr r2, _LIT1
    ldr r1, [r2]
    ldr r2, [r2, #0x1c]
    bl func_ov002_0223dbd0
.L_4d8:
    ldr r0, _LIT6
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT0
    add sp, sp, #0x8
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_50c:
    ldrh r1, [r7, #0x2]
    ldr r2, _LIT5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r2, [r2, r1, lsl #0x2]
    cmp r2, #0x1
    bne .L_558
    mvn r2, #0x0
    mov r3, #0x1
    bl func_ov002_02280ce4
    ldrh r1, [r7, #0x2]
    mov r2, r0
    mov r0, r7
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dbd0
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_558:
    mov r0, r1
    mov r1, #0x79
    bl func_ov002_021ae320
    ldrh r0, [r7, #0x2]
    ldrh r1, [r7]
    ldr r2, _LIT7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    ldr r1, _LIT0
    add sp, sp, #0x8
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_598:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_5cc
    ldr r1, _LIT6
    mov r0, r7
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dbd0
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_5cc:
    ldr r1, _LIT0
    add sp, sp, #0x8
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    sub r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_5e8:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd314
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf08c
_LIT4: .word data_ov002_022cf0c2
_LIT5: .word data_ov002_022cd664
_LIT6: .word data_ov002_022d008c
_LIT7: .word func_ov002_022574e0
