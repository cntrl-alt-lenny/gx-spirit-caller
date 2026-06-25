; func_02069498 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054c84
        .extern func_0206ab14
        .extern func_0206ad88
        .global func_02069498
        .arm
func_02069498:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r5, r0
    ldr r1, [r5]
    mov r4, r3
    cmp r1, #0x1
    bne .L_34
    mov r1, #0x0
    mov r2, r1
    mov r3, #0x2
    str r1, [sp]
    bl func_0206ab14
.L_34:
    ldr r0, [r5]
    cmp r0, #0x1
    addeq sp, sp, #0x18
    moveq r0, #0x3
    ldmeqia sp!, {r4, r5, r6, lr}
    addeq sp, sp, #0x10
    bxeq lr
    ldr r0, [sp, #0x38]
    add r1, sp, #0x4
    add r0, r0, #0x9
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    mov r0, r0, lsl #0x8
    and r2, r2, #0xff
    and r0, r0, #0xff00
    orr r0, r2, r0
    strh r0, [sp, #0x4]
    ldrb r3, [r1]
    ldrb r2, [r1, #0x1]
    add r1, sp, #0x6
    mov r0, #0x2
    strb r3, [r1]
    strb r2, [r1, #0x1]
    add lr, sp, #0x2c
    strb r0, [sp, #0x8]
    ldrb r3, [lr]
    ldrb r0, [lr, #0x1]
    add r6, sp, #0x9
    add r2, sp, #0x30
    strb r3, [r6]
    strb r0, [r6, #0x1]
    ldrb ip, [lr, #0x2]
    ldrb r3, [lr, #0x3]
    add lr, sp, #0xd
    mov r0, r5
    strb ip, [r6, #0x2]
    strb r3, [r6, #0x3]
    ldrb ip, [r2]
    ldrb r3, [r2, #0x1]
    mov r2, #0x9
    strb ip, [lr]
    strb r3, [lr, #0x1]
    bl func_0206ad88
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, lr}
    addne sp, sp, #0x10
    bxne lr
    ldr r0, [r5, #0x4b0]
    ldr r2, [sp, #0x38]
    mov r1, r4
    mov r3, #0x0
    bl func_02054c84
    cmp r0, #0x0
    movlt r0, #0x3
    movge r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, lr}
    add sp, sp, #0x10
    bx lr
