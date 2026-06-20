; func_ov002_022bb4b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d1410
        .extern data_ov002_022d28fc
        .extern func_02037208
        .extern func_ov002_022a6324
        .extern func_ov002_022b867c
        .extern func_ov002_022bdb88
        .global func_ov002_022bb4b8
        .arm
func_ov002_022bb4b8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x8
    mov r9, r0
    ldr r0, [r9, #0xc60]
    cmp r0, #0x0
    beq .L_470
    cmp r0, #0x1
    beq .L_594
    cmp r0, #0x2
    beq .L_644
    b .L_668
.L_470:
    add r0, r9, #0xc00
    ldrh r5, [r0, #0x68]
    ldr r0, _LIT0
    ldr r4, _LIT1
    mov r3, r5, lsl #0x12
    mov r2, r5, lsl #0x1a
    mov r1, r5, lsl #0x1f
    mov r6, r3, lsr #0x18
    mov r7, r2, lsr #0x1b
    mov r8, r1, lsr #0x1f
    mov r1, r8
    mov r2, r7
    mov r3, r6
    strh r5, [sp, #0x4]
    bl func_ov002_022a6324
    ldr r1, [r9, #0xc64]
    mov r5, r0
    cmp r1, #0xf
    blt .L_668
    add ip, r9, #0xc80
    mov r0, r9
    mov r1, r8
    mov r2, r7
    mov r3, r6
    str ip, [sp]
    bl func_ov002_022b867c
    ldr r1, [r9, #0xc58]
    cmp r1, #0x0
    bne .L_51c
    ldrsb r0, [r5]
    cmp r0, #0x0
    moveq r0, #0x4
    beq .L_508
    ldrh r0, [r5, #0xa]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    movne r0, #0x2
    moveq r0, #0x0
.L_508:
    cmp r7, #0xb
    moveq r2, #0x1
    movne r2, #0x0
    orr r2, r2, r0
    b .L_528
.L_51c:
    cmp r7, #0xb
    moveq r2, #0x1
    movne r2, #0x0
.L_528:
    cmp r1, #0x0
    moveq r1, #0x3a
    mov r3, #0x0
    str r3, [sp]
    movne r1, #0x36
    mov r0, r4
    add r3, r9, #0xc80
    bl func_ov002_022bdb88
    ldrsb r0, [r5]
    cmp r0, #0x0
    ldrne r1, [r5, #0xc]
    ldr r0, [r9, #0xcc4]
    moveq r1, #0xfe0
    add r0, r9, r0, lsl #0x2
    str r1, [r0, #0xcb0]
    ldr r0, [r9, #0xcc4]
    mov r1, #0x0
    add r0, r0, #0x1
    str r0, [r9, #0xcc4]
    cmp r0, #0x5
    movge r0, #0x0
    strge r0, [r9, #0xcc4]
    str r1, [r9, #0xd34]
    mov r0, #0x1
    str r0, [r9, #0xc60]
    str r1, [r9, #0xc64]
    b .L_668
.L_594:
    ldr r0, [r9, #0xc64]
    ldr r4, _LIT1
    cmp r0, #0x3
    bne .L_5bc
    mov r0, #0x3f
    sub r1, r0, #0x40
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_5e4
.L_5bc:
    ldr r1, [r9, #0xc58]
    cmp r1, #0x0
    cmpeq r0, #0x2d
    beq .L_5dc
    cmp r1, #0x0
    beq .L_5e4
    cmp r0, #0x19
    bne .L_5e4
.L_5dc:
    mov r0, #0x1
    str r0, [r9, #0xd34]
.L_5e4:
    ldr r0, [r9, #0xc58]
    mov r1, #0x0
    cmp r0, #0x0
    moveq r2, #0x3a
    movne r2, #0x36
.L_5f8:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_614
    ldr r0, [r4, #0x4]
    cmp r0, r2
    moveq r0, #0x1
    beq .L_628
.L_614:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r4, r4, #0x8
    blt .L_5f8
    mov r0, #0x0
.L_628:
    cmp r0, #0x0
    bne .L_668
    mov r0, #0x2
    str r0, [r9, #0xc60]
    mov r0, #0x0
    str r0, [r9, #0xc64]
    b .L_668
.L_644:
    mov r0, #0x0
    str r0, [r9, #0xd34]
    mov r1, #0xc
    str r1, [r9, #0xcc8]
    mov r1, #0x3
    str r1, [r9, #0xcd0]
    add sp, sp, #0x8
    str r0, [r9, #0xc54]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_668:
    ldr r1, [r9, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r9, #0xc64]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022d1410
_LIT1: .word data_ov002_022d28fc
