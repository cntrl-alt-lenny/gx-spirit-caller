; func_02044888 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204431c
        .extern func_02044334
        .extern func_02044460
        .extern func_02044494
        .extern func_020446d4
        .extern func_02044708
        .extern func_02044788
        .extern func_02094398
        .extern func_02094500
        .extern func_02094688
        .extern func_020a662c
        .extern func_020a6764
        .global func_02044888
        .arm
func_02044888:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov sl, r0
    mov r1, #0x0
    mov r2, #0x700
    bl func_02094500
    mov r0, sl
    bl func_02044494
    cmp r0, #0x0
    addeq sp, sp, #0x14
    ldreq r0, _LIT0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT1
    add r0, sl, #0x500
    bl func_020a6764
    mov r0, sl
    bl func_02044460
    cmp r0, #0x0
    addeq sp, sp, #0x14
    ldreq r0, _LIT0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x10
    bl func_02094500
    mov r8, sl
    mov r7, sl
    mov r9, #0x0
    add fp, sp, #0x0
    add r6, sl, #0x500
    mov r4, #0x1
    mov r5, #0xfe
.L_80:
    mov r0, r6
    mov r1, r8
    mov r2, r5
    bl func_020a662c
    add r1, sl, r9, lsl #0x8
    ldrh r1, [r1, #0xfe]
    cmp r0, r1
    bne .L_b0
    mov r0, r7
    bl func_02044788
    cmp r0, #0x0
    strne r4, [fp, r9, lsl #0x2]
.L_b0:
    add r9, r9, #0x1
    cmp r9, #0x3
    add r8, r8, #0x100
    add r7, r7, #0x100
    blt .L_80
    add r0, sl, #0x500
    add r1, sl, #0x300
    mov r2, #0xfe
    bl func_020a662c
    add r1, sl, #0x300
    ldrh r1, [r1, #0xfe]
    cmp r0, r1
    moveq r0, #0x1
    ldr r1, [sp]
    streq r0, [sp, #0xc]
    cmp r1, #0x0
    beq .L_12c
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_12c
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_12c
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_12c
    add r0, sl, #0xf0
    bl func_0204431c
    add sp, sp, #0x14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12c:
    cmp r1, #0x0
    bne .L_17c
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_17c
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_17c
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    bne .L_17c
    mov r0, sl
    bl func_02044708
    mov r0, sl
    bl func_02044334
    cmp r0, #0x0
    movne r0, #0x0
    add sp, sp, #0x14
    ldreq r0, _LIT2
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_17c:
    cmp r1, #0x0
    beq .L_190
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_1cc
.L_190:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_1a8
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    bne .L_1cc
.L_1a8:
    mov r0, sl
    bl func_02044708
    mov r0, sl
    bl func_02044334
    cmp r0, #0x0
    movne r0, #0x0
    add sp, sp, #0x14
    ldreq r0, _LIT2
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1cc:
    cmp r1, #0x0
    bne .L_204
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_204
    mov r0, sl
    bl func_02044708
    mov r0, sl
    bl func_02044334
    cmp r0, #0x0
    ldrne r0, _LIT3
    add sp, sp, #0x14
    ldreq r0, _LIT2
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_204:
    cmp r1, #0x0
    bne .L_234
    mov r0, sl
    mov r1, #0x0
    bl func_020446d4
    add r0, sl, #0x1f0
    add r1, sl, #0xf0
    mov r2, #0xe
    bl func_02094688
    ldrb r0, [sl, #0x1ef]
    strb r0, [sl, #0xef]
    b .L_264
.L_234:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_264
    mov r0, sl
    mov r1, #0x1
    bl func_020446d4
    add r0, sl, #0xf0
    add r1, sl, #0x1f0
    mov r2, #0xe
    bl func_02094688
    ldrb r0, [sl, #0xef]
    strb r0, [sl, #0x1ef]
.L_264:
    add r0, sl, #0xf0
    bl func_0204431c
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_284
    mov r0, sl
    mov r1, #0x2
    bl func_020446d4
.L_284:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    bne .L_2a0
    add r1, sl, #0x300
    mov r0, #0x0
    mov r2, #0x100
    bl func_02094398
.L_2a0:
    mov r4, #0x0
    mov r1, r4
    add r0, sp, #0x0
    add r5, sl, #0xef
    mov r6, #0x1
.L_2b4:
    ldr r2, [r0, r1, lsl #0x2]
    cmp r2, #0x0
    bne .L_2ec
    ldrb r2, [sl, #0xef]
    mov r7, r6, lsl r1
    ands r2, r2, r7
    beq .L_2ec
    ldrb r3, [r5]
    mvn r2, r7
    mov r4, r6
    and r2, r3, r2
    strb r2, [r5]
    ldrb r2, [sl, #0xef]
    strb r2, [sl, #0x1ef]
.L_2ec:
    add r1, r1, #0x1
    cmp r1, #0x3
    blt .L_2b4
    mov r0, sl
    bl func_02044334
    cmp r0, #0x0
    addeq sp, sp, #0x14
    ldreq r0, _LIT2
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r4, #0x0
    ldrne r0, _LIT4
    moveq r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0xffffd8ef
_LIT1: .word 0x0000a001
_LIT2: .word 0xffffd8f0
_LIT3: .word 0xffffd8ed
_LIT4: .word 0xffffd8ee
