; func_02069c14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206b44c
        .global func_02069c14
        .arm
func_02069c14:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x24
    mov r7, r2
    cmp r7, #0x2
    mov r9, r0
    mov r8, r1
    addlt sp, sp, #0x24
    movlt r0, #0x4
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrb r0, [r8, #0x1]
    sub r7, r7, #0x2
    mov r6, #0x0
    str r0, [sp, #0x10]
    ldrb r0, [r8]
    add r8, r8, #0x2
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    ble .L_e2c
    add r5, sp, #0x18
    add r4, sp, #0x1c
.L_cf0:
    mov r0, r8
    mov r1, r7
    mov fp, r8
    bl func_0206b44c
    mvn r1, #0x0
    cmp r0, r1
    addeq sp, sp, #0x24
    moveq r0, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    sub r2, r7, r0
    cmp r2, #0xb
    add lr, r8, r0
    addlt sp, sp, #0x24
    movlt r0, #0x4
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrb r1, [lr]
    ldrb r0, [lr, #0x1]
    sub r7, r2, #0xa
    add r3, lr, #0x6
    strb r1, [r5]
    strb r0, [r5, #0x1]
    ldrb r2, [lr, #0x2]
    ldrb r1, [lr, #0x3]
    add r0, lr, #0x4
    add r8, lr, #0xa
    strb r2, [r5, #0x2]
    strb r1, [r5, #0x3]
    ldrb sl, [r0, #0x1]
    ldrb ip, [lr, #0x4]
    add r2, sp, #0x14
    mov r0, r8
    strb ip, [r2]
    strb sl, [r2, #0x1]
    ldrb sl, [lr, #0x6]
    ldrb r2, [r3, #0x1]
    mov r1, r7
    strb sl, [r4]
    strb r2, [r4, #0x1]
    ldrb sl, [r3, #0x2]
    ldrb r2, [r3, #0x3]
    strb sl, [r4, #0x2]
    strb r2, [r4, #0x3]
    ldr ip, [sp, #0x1c]
    mov r3, ip, lsl #0x18
    mov r2, ip, lsr #0x18
    and sl, r3, #-16777216
    mov r3, ip, lsl #0x8
    mov ip, ip, lsr #0x8
    and r2, r2, #0xff
    and ip, ip, #0xff00
    and r3, r3, #0xff0000
    orr r2, r2, ip
    orr r2, r3, r2
    orr r2, sl, r2
    str r2, [sp, #0x1c]
    bl func_0206b44c
    mov sl, r0
    mvn r0, #0x0
    cmp sl, r0
    addeq sp, sp, #0x24
    moveq r0, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [sp, #0x1c]
    mov r0, r9
    str r1, [sp]
    str r8, [sp, #0x4]
    ldr r2, [r9, #0x494]
    mov r1, fp
    str r2, [sp, #0x8]
    ldrh r3, [sp, #0x14]
    ldr r2, [sp, #0x18]
    ldr fp, [r9, #0x490]
    blx fp
    ldr r0, [sp, #0x10]
    add r6, r6, #0x1
    cmp r6, r0
    add r8, r8, sl
    sub r7, r7, sl
    blt .L_cf0
.L_e2c:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_e60
    mov r1, #0x0
    str r1, [sp]
    str r1, [sp, #0x4]
    ldr r2, [r9, #0x494]
    mov r0, r9
    str r2, [sp, #0x8]
    ldr r4, [r9, #0x490]
    mov r2, r1
    mov r3, r1
    blx r4
.L_e60:
    mov r0, #0x0
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
