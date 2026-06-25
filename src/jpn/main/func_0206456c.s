; func_0206456c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054b88
        .extern func_02054c34
        .extern func_02054f5c
        .extern func_020615fc
        .extern func_02063114
        .extern func_02064450
        .extern func_02064c9c
        .extern func_02064d3c
        .global func_0206456c
        .arm
func_0206456c:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r6, r0
    mov r5, r1
    add r0, sp, #0x34
    add r1, sp, #0x38
    mov r4, r2
    bl func_02064d3c
    ldr r0, [r6]
    bl func_02054f5c
    cmp r0, #0x0
    addeq sp, sp, #0x18
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, lr}
    addeq sp, sp, #0x10
    bxeq lr
    mov r1, r4, asr #0x8
    mov r0, r4, lsl #0x8
    add ip, sp, #0x10
    mov r3, #0x0
    str r3, [ip]
    str r3, [ip, #0x4]
    mov r2, #0x2
    and r1, r1, #0xff
    and r0, r0, #0xff00
    orr r0, r1, r0
    strh r0, [sp, #0x12]
    strb r2, [sp, #0x11]
    str r5, [sp, #0x14]
    str ip, [sp]
    mov r0, #0x8
    str r0, [sp, #0x4]
    ldr r0, [r6]
    ldr r1, [sp, #0x34]
    ldr r2, [sp, #0x38]
    bl func_02054c34
    mvn r1, #0x0
    cmp r0, r1
    bne .L_134
    ldr r0, [r6]
    bl func_02054b88
    mvn r1, #0xe
    cmp r0, r1
    bne .L_e0
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02063114
    cmp r0, #0x0
    bne .L_19c
    add sp, sp, #0x18
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    add sp, sp, #0x10
    bx lr
.L_e0:
    mvn r1, #0x29
    cmp r0, r1
    beq .L_f8
    mvn r1, #0x5
    cmp r0, r1
    bne .L_10c
.L_f8:
    add sp, sp, #0x18
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, lr}
    add sp, sp, #0x10
    bx lr
.L_10c:
    mvn r1, #0x22
    cmp r0, r1
    beq .L_19c
    mov r0, r6
    bl func_02064450
    add sp, sp, #0x18
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    add sp, sp, #0x10
    bx lr
.L_134:
    ldr r0, [r6, #0x28]
    cmp r0, #0x0
    beq .L_19c
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02064c9c
    mov r1, #0x0
    str r1, [sp]
    ldr r2, [sp, #0x34]
    mov r1, r0
    str r2, [sp, #0x4]
    ldr ip, [sp, #0x38]
    mov r3, r4
    mov r0, r6
    mov r2, r5
    str ip, [sp, #0x8]
    mov r4, #0x1
    str r4, [sp, #0xc]
    bl func_020615fc
    cmp r0, #0x0
    addeq sp, sp, #0x18
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    addeq sp, sp, #0x10
    bxeq lr
.L_19c:
    mov r0, #0x1
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, lr}
    add sp, sp, #0x10
    bx lr
