; func_02010820 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0200fafc
        .extern func_0200fd00
        .extern func_0200fde0
        .extern func_020103ec
        .global func_02010820
        .arm
func_02010820:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    movs sl, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r5, [sl, #0x18]
    cmp r5, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sl, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_4ec
    mov r6, r4
    mov r7, r4
    mov r8, #0x1
.L_470:
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    beq .L_4d8
    ldr r0, [sl, #0x26c]
    tst r0, r8, lsl r4
    bne .L_4d8
    mov r0, r5
    bl func_0200fafc
    movs r1, r0
    mov r0, r5
    beq .L_4bc
    mov r2, r7
    mov r3, r7
    str r7, [sp]
    bl func_0200fde0
    cmp r0, #0x0
    bne .L_4d8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4bc:
    mov r1, sl
    mov r2, r6
    mov r3, r6
    bl func_020103ec
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4d8:
    ldr r0, [sl, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x20
    blt .L_470
.L_4ec:
    ldr r8, [sl, #0x1c]
    cmp r8, #0x0
    beq .L_598
    ldr r0, [sl, #0x28]
    mov r9, #0x0
    cmp r0, #0x0
    ble .L_598
    mov r4, #0x1
    mov fp, r9
    mov r6, r9
    mov r5, r4
    mov r7, r4
.L_51c:
    ldr r0, [r8]
    cmp r0, #0x0
    beq .L_584
    ldr r0, [sl, #0x270]
    tst r0, r7, lsl r9
    bne .L_584
    mov r0, r8
    bl func_0200fd00
    movs r1, r0
    mov r0, r8
    beq .L_568
    mov r2, r5
    mov r3, r6
    str r6, [sp]
    bl func_0200fde0
    cmp r0, #0x0
    bne .L_584
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_568:
    mov r1, sl
    mov r2, r4
    mov r3, fp
    bl func_020103ec
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_584:
    ldr r0, [sl, #0x28]
    add r9, r9, #0x1
    cmp r9, r0
    add r8, r8, #0xc
    blt .L_51c
.L_598:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
