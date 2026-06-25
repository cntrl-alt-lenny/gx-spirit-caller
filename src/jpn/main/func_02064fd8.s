; func_02064fd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02065134
        .extern func_02065244
        .extern func_0206532c
        .extern func_02065da0
        .extern func_02065f34
        .global func_02064fd8
        .arm
func_02064fd8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x2c
    mov r6, r0
    mov r7, r1
    mov r5, r2
    bl func_02065da0
    cmp r0, #0x0
    addeq sp, sp, #0x2c
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldrb r4, [r6, #0x7]
    cmp r4, #0x5
    beq .L_38
    cmp r4, #0x7
    bne .L_d4
.L_38:
    cmp r7, #0x14
    addlt sp, sp, #0x2c
    ldmltia sp!, {r4, r5, r6, r7, pc}
    add r3, sp, #0x0
    mov r2, #0xa
.L_4c:
    ldrb r1, [r6], #0x1
    ldrb r0, [r6], #0x1
    subs r2, r2, #0x1
    strb r1, [r3], #0x1
    strb r0, [r3], #0x1
    bne .L_4c
    ldr r3, [sp, #0x8]
    mov r1, r3, lsr #0x18
    mov r0, r3, lsr #0x8
    mov r2, r3, lsl #0x8
    and r1, r1, #0xff
    and r0, r0, #0xff00
    mov r3, r3, lsl #0x18
    orr r0, r1, r0
    and r2, r2, #0xff0000
    and r1, r3, #-16777216
    orr r0, r2, r0
    orr r0, r1, r0
    bl func_02065f34
    cmp r0, #0x0
    addeq sp, sp, #0x2c
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    cmp r4, #0x5
    bne .L_c0
    add r1, sp, #0x0
    mov r2, r5
    bl func_0206532c
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_c0:
    add r1, sp, #0x0
    mov r2, r5
    bl func_02065244
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_d4:
    cmp r7, #0x15
    addlt sp, sp, #0x2c
    ldmltia sp!, {r4, r5, r6, r7, pc}
    add r3, sp, #0x14
    mov r2, #0xa
.L_e8:
    ldrb r1, [r6], #0x1
    ldrb r0, [r6], #0x1
    subs r2, r2, #0x1
    strb r1, [r3], #0x1
    strb r0, [r3], #0x1
    bne .L_e8
    ldrb r0, [r6]
    strb r0, [r3]
    ldr r3, [sp, #0x1c]
    mov r1, r3, lsr #0x18
    mov r0, r3, lsr #0x8
    mov r2, r3, lsl #0x8
    and r1, r1, #0xff
    and r0, r0, #0xff00
    mov r3, r3, lsl #0x18
    orr r0, r1, r0
    and r2, r2, #0xff0000
    and r1, r3, #-16777216
    orr r0, r2, r0
    orr r0, r1, r0
    bl func_02065f34
    cmp r0, #0x0
    addeq sp, sp, #0x2c
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    add r1, sp, #0x14
    mov r2, r5
    bl func_02065134
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, pc}
