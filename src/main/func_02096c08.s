; func_02096c08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020965ac
        .extern func_02097074
        .extern func_02097154
        .global func_02096c08
        .arm
func_02096c08:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x9c
    mov sl, r0
    ldr r2, [sl, #0x40]
    ldr r9, [sl, #0x3c]
    mov r1, #0x2
    str r2, [sp]
    bl func_020965ac
    ldrb r1, [r9]
    cmp r1, #0x0
    beq .L_63c
    mov r0, #0x2
    add fp, sp, #0x1c
    mov r4, #0x3
    mov r5, #0x1
    mov r6, #0x0
    str r0, [sp, #0x4]
.L_490:
    mov r7, r6
    b .L_49c
.L_498:
    add r7, r7, #0x1
.L_49c:
    ldrb r8, [r9, r7]
    mov r0, r6
    cmp r8, #0x0
    beq .L_4bc
    cmp r8, #0x2f
    beq .L_4bc
    cmp r8, #0x5c
    movne r0, r5
.L_4bc:
    cmp r0, #0x0
    bne .L_498
    cmp r8, #0x0
    bne .L_4d8
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_4dc
.L_4d8:
    mov r8, r5
.L_4dc:
    cmp r7, #0x0
    addeq sp, sp, #0x9c
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    cmp r1, #0x2e
    bne .L_548
    cmp r7, #0x1
    addeq r9, r9, #0x1
    beq .L_620
    ldrb r0, [r9, #0x1]
    cmp r7, #0x2
    moveq r1, r5
    movne r1, r6
    cmp r0, #0x2e
    moveq r0, r5
    movne r0, r6
    ands r0, r1, r0
    beq .L_548
    ldrh r0, [sl, #0x24]
    cmp r0, #0x0
    beq .L_540
    ldr r1, [sl, #0x2c]
    mov r0, sl
    bl func_02097074
.L_540:
    add r9, r9, #0x2
    b .L_620
.L_548:
    cmp r7, #0x7f
    addgt sp, sp, #0x9c
    movgt r0, #0x1
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxgt lr
    add r0, sp, #0x8
    str r0, [sl, #0x30]
    str r6, [sl, #0x34]
.L_568:
    mov r0, sl
    mov r1, r4
    bl func_020965ac
    cmp r0, #0x0
    addne sp, sp, #0x9c
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxne lr
    ldr r0, [sp, #0x14]
    cmp r8, r0
    bne .L_568
    ldr r0, [sp, #0x18]
    cmp r7, r0
    bne .L_568
    mov r0, r9
    mov r1, fp
    mov r2, r7
    bl func_02097154
    cmp r0, #0x0
    bne .L_568
    cmp r8, #0x0
    beq .L_5e4
    add r0, sp, #0x8
    add r3, sl, #0x30
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r1, [sp, #0x4]
    mov r0, sl
    add r9, r9, r7
    bl func_020965ac
    b .L_620
.L_5e4:
    ldr r0, [sp]
    cmp r0, #0x0
    addne sp, sp, #0x9c
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxne lr
    ldr r3, [sl, #0x44]
    ldr r2, [sp, #0x8]
    ldr r1, [sp, #0xc]
    add sp, sp, #0x9c
    str r2, [r3]
    str r1, [r3, #0x4]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_620:
    ldrb r0, [r9]
    cmp r0, #0x0
    movne r0, r5
    moveq r0, r6
    ldrb r1, [r9, r0]!
    cmp r1, #0x0
    bne .L_490
.L_63c:
    ldr r0, [sp]
    cmp r0, #0x0
    moveq r0, #0x1
    addne r0, sl, #0x20
    ldrne r3, [sl, #0x44]
    ldmneia r0, {r0, r1, r2}
    stmneia r3, {r0, r1, r2}
    movne r0, #0x0
    add sp, sp, #0x9c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
