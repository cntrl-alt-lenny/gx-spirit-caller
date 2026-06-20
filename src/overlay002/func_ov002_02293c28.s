; func_ov002_02293c28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c4c9c
        .extern func_ov002_021c8470
        .extern func_ov002_022575c8
        .extern func_ov002_02259f74
        .global func_ov002_02293c28
        .arm
func_ov002_02293c28:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x2c
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r4, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259f74
    cmp r0, #0x0
    addeq sp, sp, #0x2c
    moveq r0, r4
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    mov r7, r4
    ldr r6, _LIT0
    ldr r9, _LIT1
    mov r8, r7
.L_40:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mla r2, r1, r9, r6
    add r2, r2, r8
    ldr r1, [r2, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    beq .L_9c
    ldrh r1, [r2, #0x36]
    cmp r1, #0x0
    bne .L_9c
    mov r1, r7
    bl func_ov002_021c8470
    cmp r4, r0
    bgt .L_9c
    ldrh r0, [r5, #0x2]
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c8470
    mov r4, r0
.L_9c:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r8, r8, #0x14
    blt .L_40
    mov r9, #0x0
    ldr r6, _LIT0
    ldr sl, _LIT1
    mov r8, r9
    add r7, sp, #0x0
.L_c0:
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r2, r9
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_022575c8
    cmp r0, #0x0
    beq .L_16c
    ldrh r0, [r5, #0x2]
    mov r1, r9
    mov r2, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021c4c9c
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r1, r0, #0x1
    mla r0, r1, sl, r6
    add r0, r8, r0
    ldrh r0, [r0, #0x36]
    cmp r0, #0x0
    bne .L_14c
    ldr r0, [sp, #0x14]
    cmp r0, r4
    blt .L_16c
    ldr r0, [sp, #0x18]
    cmp r0, r4
    bge .L_16c
    add sp, sp, #0x2c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_14c:
    ldr r0, [sp, #0x18]
    cmp r0, r4
    blt .L_16c
    ldr r0, [sp, #0x14]
    cmp r0, r4
    addlt sp, sp, #0x2c
    movlt r0, #0x1
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_16c:
    add r9, r9, #0x1
    cmp r9, #0x5
    add r8, r8, #0x14
    blt .L_c0
    mov r0, #0x0
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
