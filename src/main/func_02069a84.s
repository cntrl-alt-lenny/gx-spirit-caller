; func_02069a84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206b44c
        .extern func_0206b644
        .extern func_0206b6fc
        .global func_02069a84
        .arm
func_02069a84:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x54
    mov r8, r2
    cmp r8, #0xb
    mov sl, r0
    mov r9, r1
    addlt sp, sp, #0x54
    movlt r0, #0x4
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrb r3, [r9]
    ldrb r2, [r9, #0x1]
    add r5, sp, #0x10
    add r1, r9, #0x4
    strb r3, [r5]
    strb r2, [r5, #0x1]
    ldrb r4, [r9, #0x2]
    ldrb r2, [r9, #0x3]
    add r3, sp, #0x8
    strb r4, [r5, #0x2]
    strb r2, [r5, #0x3]
    ldrb r2, [r9, #0x4]
    ldrb r1, [r1, #0x1]
    strb r2, [r3]
    strb r1, [r3, #0x1]
    ldrh r2, [sp, #0x8]
    ldr r1, [sp, #0x10]
    bl func_0206b6fc
    mov r1, r0
    mvn r0, #0x0
    cmp r1, r0
    addeq sp, sp, #0x54
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, sl
    bl func_0206b644
    add r3, r9, #0x6
    ldrb r2, [r9, #0x6]
    ldrb r1, [r3, #0x1]
    add r4, sp, #0xc
    mov fp, r0
    strb r2, [r4]
    strb r1, [r4, #0x1]
    ldrb r1, [r3, #0x2]
    ldrb r0, [r3, #0x3]
    sub r8, r8, #0xb
    mov r6, #0x0
    strb r1, [r4, #0x2]
    strb r0, [r4, #0x3]
    ldr r0, [sp, #0xc]
    add r5, sp, #0x14
    mov r2, r0, lsr #0x18
    mov r1, r0, lsr #0x8
    mov r3, r0, lsl #0x8
    and r2, r2, #0xff
    and r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r1, r2, r1
    and r3, r3, #0xff0000
    and r2, r0, #-16777216
    orr r0, r3, r1
    orr r0, r2, r0
    str r0, [sp, #0xc]
    ldrb r7, [r9, #0xa]
    add r9, r9, #0xb
    mvn r4, #0x0
    b .L_c48
.L_c14:
    cmp r8, #0x1
    blt .L_c58
    mov r0, r9
    mov r1, r8
    bl func_0206b44c
    cmp r0, r4
    addeq sp, sp, #0x54
    moveq r0, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    str r9, [r5, r6, lsl #0x2]
    add r9, r9, r0
    sub r8, r8, r0
    add r6, r6, #0x1
.L_c48:
    cmp r6, r7
    bge .L_c58
    cmp r6, #0x10
    blt .L_c14
.L_c58:
    ldr r4, [sl, #0x48c]
    cmp r4, #0x0
    addeq sp, sp, #0x54
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r1, sp, #0x14
    str r1, [sp]
    ldr r2, [sl, #0x494]
    mov r0, sl
    str r2, [sp, #0x4]
    ldr r2, [sp, #0xc]
    mov r1, fp
    mov r3, r6
    blx r4
    mov r0, #0x0
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
