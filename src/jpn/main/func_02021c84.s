; func_02021c84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02021458
        .extern func_02021598
        .extern func_020221e0
        .extern func_0202220c
        .extern func_0202224c
        .extern func_020223dc
        .extern func_0202246c
        .global func_02021c84
        .arm
func_02021c84:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r4, r0
    mov r5, #0x0
    mov r6, r5
    ldr r7, [r4]
    b .L_538
.L_18:
    ldr r0, [r4]
    ldr r9, [r0]
    mov r1, r9, lsr #0x18
    cmp r1, #0xf0
    bhi .L_58
    bcs .L_b4
    cmp r1, #0x12
    bhi .L_524
    cmp r1, #0x10
    bcc .L_524
    beq .L_bc
    cmp r1, #0x11
    beq .L_f8
    cmp r1, #0x12
    beq .L_a4
    b .L_524
.L_58:
    cmp r1, #0xf2
    bhi .L_68
    beq .L_12c
    b .L_524
.L_68:
    sub r1, r1, #0xf5
    cmp r1, #0xa
    addls pc, pc, r1, lsl #0x2
    b .L_524
    b .L_164
    b .L_1b4
    b .L_218
    b .L_260
    b .L_26c
    b .L_354
    b .L_3a8
    b .L_428
    b .L_468
    b .L_494
    b .L_4b8
.L_a4:
    ldr r0, [r4]
    add r0, r0, #0x4
    str r0, [r4]
    b .L_528
.L_b4:
    mov r5, #0x1
    b .L_528
.L_bc:
    mov r2, #0x0
.L_c0:
    add r1, r4, r2, lsl #0x2
    ldr r1, [r1, #0x58]
    cmp r1, #0x0
    beq .L_dc
    add r2, r2, #0x1
    cmp r2, #0x4
    blt .L_c0
.L_dc:
    add r1, r0, #0x8
    add r0, r4, r2, lsl #0x2
    str r1, [r0, #0x58]
    ldr r0, [r4]
    ldr r0, [r0, #0x4]
    str r0, [r4]
    b .L_528
.L_f8:
    mov r1, #0x3
.L_fc:
    add r0, r4, r1, lsl #0x2
    ldr r0, [r0, #0x58]
    cmp r0, #0x0
    bne .L_114
    subs r1, r1, #0x1
    bpl .L_fc
.L_114:
    add r2, r4, r1, lsl #0x2
    ldr r1, [r2, #0x58]
    mov r0, #0x0
    str r1, [r4]
    str r0, [r2, #0x58]
    b .L_528
.L_12c:
    mov r1, r9, lsr #0x10
    mov r2, r9, lsl #0x10
    mov r0, r4
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r1, [r4, #0x4]
    cmp r1, r0
    movlt r5, #0x1
    blt .L_528
    ldr r0, [r4]
    add r0, r0, #0x4
    str r0, [r4]
    b .L_528
.L_164:
    mov r0, r9, lsr #0x10
    and r3, r0, #0xff
    cmp r3, #0x20
    blt .L_18c
    mov r2, r9, lsl #0x10
    mov r0, r4
    sub r1, r3, #0x20
    mov r2, r2, lsr #0x10
    bl func_0202220c
    b .L_1a4
.L_18c:
    cmp r3, #0x1c
    bge .L_1a4
    mov r1, r9, lsl #0x10
    mov r0, r3
    mov r1, r1, lsr #0x10
    bl func_020221e0
.L_1a4:
    ldr r0, [r4]
    add r0, r0, #0x4
    str r0, [r4]
    b .L_528
.L_1b4:
    mov r0, r9, lsr #0x10
    and r8, r0, #0xff
    cmp r8, #0x20
    and r2, r9, #0xff
    blt .L_1e8
    mov r0, r4
    mov r1, #0x1
    bl func_0202246c
    mov r2, r0
    mov r0, r4
    sub r1, r8, #0x20
    bl func_0202220c
    b .L_208
.L_1e8:
    cmp r8, #0x1c
    bge .L_208
    mov r0, r4
    mov r1, #0x1
    bl func_0202246c
    mov r1, r0
    mov r0, r8
    bl func_020221e0
.L_208:
    ldr r0, [r4]
    add r0, r0, #0x4
    str r0, [r4]
    b .L_528
.L_218:
    ldr r0, [r0, #0x4]
    mov r1, r9, lsr #0x10
    mov r2, r0, lsl #0x10
    mov r0, r4
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r1, r0, lsl #0x10
    mov r2, r9, lsr #0x8
    mov r0, r4
    mov r3, r1, asr #0x10
    and r1, r2, #0xff
    and r2, r9, #0xff
    bl func_0202224c
    ldr r0, [r4]
    add r0, r0, #0x8
    str r0, [r4]
    b .L_528
.L_260:
    ldr r0, [r0, #0x4]
    str r0, [r4]
    b .L_528
.L_26c:
    mov r1, r9, lsr #0x8
    mov r3, r9, lsr #0x10
    and r2, r1, #0xff
    mov r0, r4
    mov r1, #0x1
    and r8, r3, #0xff
    and r9, r9, #0xff
    bl func_0202246c
    mov r0, r0, lsl #0x10
    movs r1, r0, asr #0x10
    movmi r5, #0x1
    bmi .L_528
    cmp r1, r9
    blt .L_2b8
    ldr r1, [r4]
    add r0, r9, #0x1
    add r0, r1, r0, lsl #0x2
    str r0, [r4]
    b .L_528
.L_2b8:
    cmp r8, #0x0
    beq .L_2d4
    cmp r8, #0x1
    beq .L_2e8
    cmp r8, #0x2
    beq .L_330
    b .L_528
.L_2d4:
    ldr r0, [r4]
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0x4]
    str r0, [r4]
    b .L_528
.L_2e8:
    mov r3, #0x0
.L_2ec:
    add r0, r4, r3, lsl #0x2
    ldr r0, [r0, #0x58]
    cmp r0, #0x0
    beq .L_308
    add r3, r3, #0x1
    cmp r3, #0x4
    blt .L_2ec
.L_308:
    ldr r2, [r4]
    add r0, r4, r3, lsl #0x2
    add r2, r2, r9, lsl #0x2
    add r2, r2, #0x4
    str r2, [r0, #0x58]
    ldr r0, [r4]
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0x4]
    str r0, [r4]
    b .L_528
.L_330:
    ldr r2, [r4]
    mov r0, #0x0
    add r1, r2, r1, lsl #0x2
    ldr r1, [r1, #0x4]
    bl func_02021458
    mov r0, #0x8
    bl func_02021598
    mov r5, #0x1
    b .L_528
.L_354:
    ldr r0, [r0, #0x4]
    mov r1, r9, lsr #0x10
    mov r2, r0, lsl #0x10
    mov r0, r4
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r1, r0, lsl #0x10
    mov r2, r9, lsr #0x8
    mov r3, r1, asr #0x10
    and r1, r2, #0xff
    mov r0, r4
    and r2, r9, #0xff
    bl func_020223dc
    cmp r0, #0x0
    moveq r5, #0x1
    beq .L_528
    ldr r0, [r4]
    add r0, r0, #0x8
    str r0, [r4]
    b .L_528
.L_3a8:
    ldr r0, [r0, #0x4]
    mov r1, r9, lsr #0x10
    mov r2, r0, lsl #0x10
    mov r0, r4
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r1, r0, lsl #0x10
    ldr r0, [r4]
    mov r2, r9, lsr #0x8
    ldr r3, [r0, #0x4]
    mov r0, r4
    mov r8, r3, lsr #0x10
    mov r3, r1, asr #0x10
    and r1, r2, #0xff
    and r2, r9, #0xff
    mov r8, r8, lsl #0x10
    bl func_020223dc
    cmp r0, #0x0
    beq .L_408
    ldr r0, [r4]
    ldr r0, [r0, #0x8]
    str r0, [r4]
    b .L_528
.L_408:
    ldr r0, [r4, #0x4]
    cmp r0, r8, lsr #0x10
    movlt r5, #0x1
    blt .L_528
    ldr r0, [r4]
    add r0, r0, #0xc
    str r0, [r4]
    b .L_528
.L_428:
    mov r2, #0x0
.L_42c:
    add r1, r4, r2, lsl #0x2
    ldr r1, [r1, #0x48]
    cmp r0, r1
    cmpne r1, #0x0
    beq .L_44c
    add r2, r2, #0x1
    cmp r2, #0x4
    blt .L_42c
.L_44c:
    cmp r2, #0x4
    addlt r1, r4, r2, lsl #0x2
    strlt r0, [r1, #0x48]
    ldr r0, [r4]
    add r0, r0, #0xc
    str r0, [r4]
    b .L_528
.L_468:
    mov r2, #0x0
    mov r1, r2
.L_470:
    add r0, r4, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0x48]
    cmp r2, #0x4
    blt .L_470
    ldr r0, [r4]
    add r0, r0, #0x4
    str r0, [r4]
    b .L_528
.L_494:
    add r0, r0, #0x4
    str r0, [r4]
    ldr r1, [r0]
    mov r0, #0x0
    bl func_02021458
    mov r0, #0x8
    bl func_02021598
    mov r5, #0x1
    b .L_528
.L_4b8:
    mov r1, r9, lsr #0x10
    mov r2, r9, lsl #0x10
    mov r0, r4
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    cmp r0, #0x0
    beq .L_4ec
    cmp r0, #0x1
    beq .L_4f8
    cmp r0, #0x2
    beq .L_504
    b .L_50c
.L_4ec:
    mov r0, #0x1
    bl func_02021598
    b .L_50c
.L_4f8:
    mov r0, #0x2
    bl func_02021598
    b .L_50c
.L_504:
    mov r0, #0x4
    bl func_02021598
.L_50c:
    ldr r0, [r4]
    mov r5, #0x1
    add r0, r0, #0x4
    mov r6, r5
    str r0, [r4]
    b .L_528
.L_524:
    mov r6, #0x1
.L_528:
    ldr r0, [r4]
    cmp r0, r7
    movne r0, #0x0
    strne r0, [r4, #0x4]
.L_538:
    cmp r5, #0x0
    cmpeq r6, #0x0
    beq .L_18
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
