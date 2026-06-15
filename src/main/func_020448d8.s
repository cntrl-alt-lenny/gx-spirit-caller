; func_020448d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204436c
        .extern func_02044384
        .extern func_020444b0
        .extern func_020444e4
        .extern func_02044724
        .extern func_02044758
        .extern func_020447d8
        .extern func_0209448c
        .extern func_020945f4
        .extern func_02094688
        .extern func_020a6720
        .extern func_020a6858
        .global func_020448d8
        .arm
func_020448d8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov sl, r0
    mov r1, #0x0
    mov r2, #0x700
    bl func_020945f4
    mov r0, sl
    bl func_020444e4
    cmp r0, #0x0
    addeq sp, sp, #0x14
    ldreq r0, _LIT0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT1
    add r0, sl, #0x500
    bl func_020a6858
    mov r0, sl
    bl func_020444b0
    cmp r0, #0x0
    addeq sp, sp, #0x14
    ldreq r0, _LIT0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x10
    bl func_020945f4
    mov r8, sl
    mov r7, sl
    mov r9, #0x0
    add fp, sp, #0x0
    add r6, sl, #0x500
    mov r4, #0x1
    mov r5, #0xfe
.L_234:
    mov r0, r6
    mov r1, r8
    mov r2, r5
    bl func_020a6720
    add r1, sl, r9, lsl #0x8
    ldrh r1, [r1, #0xfe]
    cmp r0, r1
    bne .L_264
    mov r0, r7
    bl func_020447d8
    cmp r0, #0x0
    strne r4, [fp, r9, lsl #0x2]
.L_264:
    add r9, r9, #0x1
    cmp r9, #0x3
    add r8, r8, #0x100
    add r7, r7, #0x100
    blt .L_234
    add r0, sl, #0x500
    add r1, sl, #0x300
    mov r2, #0xfe
    bl func_020a6720
    add r1, sl, #0x300
    ldrh r1, [r1, #0xfe]
    cmp r0, r1
    moveq r0, #0x1
    ldr r1, [sp]
    streq r0, [sp, #0xc]
    cmp r1, #0x0
    beq .L_2e0
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_2e0
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_2e0
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_2e0
    add r0, sl, #0xf0
    bl func_0204436c
    add sp, sp, #0x14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2e0:
    cmp r1, #0x0
    bne .L_330
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_330
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_330
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    bne .L_330
    mov r0, sl
    bl func_02044758
    mov r0, sl
    bl func_02044384
    cmp r0, #0x0
    movne r0, #0x0
    add sp, sp, #0x14
    ldreq r0, _LIT2
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_330:
    cmp r1, #0x0
    beq .L_344
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_380
.L_344:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_35c
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    bne .L_380
.L_35c:
    mov r0, sl
    bl func_02044758
    mov r0, sl
    bl func_02044384
    cmp r0, #0x0
    movne r0, #0x0
    add sp, sp, #0x14
    ldreq r0, _LIT2
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_380:
    cmp r1, #0x0
    bne .L_3b8
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_3b8
    mov r0, sl
    bl func_02044758
    mov r0, sl
    bl func_02044384
    cmp r0, #0x0
    ldrne r0, _LIT3
    add sp, sp, #0x14
    ldreq r0, _LIT2
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3b8:
    cmp r1, #0x0
    bne .L_3e8
    mov r0, sl
    mov r1, #0x0
    bl func_02044724
    add r0, sl, #0x1f0
    add r1, sl, #0xf0
    mov r2, #0xe
    bl func_02094688
    ldrb r0, [sl, #0x1ef]
    strb r0, [sl, #0xef]
    b .L_418
.L_3e8:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_418
    mov r0, sl
    mov r1, #0x1
    bl func_02044724
    add r0, sl, #0xf0
    add r1, sl, #0x1f0
    mov r2, #0xe
    bl func_02094688
    ldrb r0, [sl, #0xef]
    strb r0, [sl, #0x1ef]
.L_418:
    add r0, sl, #0xf0
    bl func_0204436c
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_438
    mov r0, sl
    mov r1, #0x2
    bl func_02044724
.L_438:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    bne .L_454
    add r1, sl, #0x300
    mov r0, #0x0
    mov r2, #0x100
    bl func_0209448c
.L_454:
    mov r4, #0x0
    mov r1, r4
    add r0, sp, #0x0
    add r5, sl, #0xef
    mov r6, #0x1
.L_468:
    ldr r2, [r0, r1, lsl #0x2]
    cmp r2, #0x0
    bne .L_4a0
    ldrb r2, [sl, #0xef]
    mov r7, r6, lsl r1
    ands r2, r2, r7
    beq .L_4a0
    ldrb r3, [r5]
    mvn r2, r7
    mov r4, r6
    and r2, r3, r2
    strb r2, [r5]
    ldrb r2, [sl, #0xef]
    strb r2, [sl, #0x1ef]
.L_4a0:
    add r1, r1, #0x1
    cmp r1, #0x3
    blt .L_468
    mov r0, sl
    bl func_02044384
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
