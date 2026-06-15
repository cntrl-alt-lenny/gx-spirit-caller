; func_02095e68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02095e68
        .arm
func_02095e68:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r4, [r2]
    ldr r3, [r0, #0x38]
    cmp r4, r3
    bcs .L_1c8
    mov ip, #0x0
.L_1c:
    add r3, r0, r4, lsl #0x2
    ldr r4, [r3, #0x3c]
    strb r4, [r1]
    ldrb r3, [r1]
    cmp r3, #0x10
    bgt .L_60
    cmp r3, #0x10
    bge .L_b8
    cmp r3, #0x5
    addls pc, pc, r3, lsl #0x2
    b .L_1a8
    b .L_1a8
    b .L_6c
    b .L_6c
    b .L_6c
    b .L_6c
    b .L_6c
.L_60:
    cmp r3, #0x11
    beq .L_134
    b .L_1a8
.L_6c:
    mov r3, r4, lsr #0x8
    add r5, r0, r4, lsr #0x8
    ldrh r4, [r0, r3]
    ldrh r3, [r5, #0x2]
    add sp, sp, #0x4
    mov r0, #0x1
    strh r4, [r1, #0x2]
    strh r3, [r1, #0x4]
    ldrh r4, [r5, #0x4]
    ldrh r3, [r5, #0x6]
    strh r4, [r1, #0x6]
    strh r3, [r1, #0x8]
    ldrh r3, [r5, #0x8]
    strh r3, [r1, #0xa]
    ldr r1, [r2]
    add r1, r1, #0x1
    str r1, [r2]
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_b8:
    add r5, r0, r4, lsr #0x8
    b .L_114
.L_c0:
    mov r0, #0xc
    mla ip, lr, r0, r5
    ldrh r4, [ip, #0x2]
    ldrh r3, [ip, #0x4]
    add sp, sp, #0x4
    mov r0, #0x1
    strh r4, [r1]
    strh r3, [r1, #0x2]
    ldrh r4, [ip, #0x6]
    ldrh r3, [ip, #0x8]
    strh r4, [r1, #0x4]
    strh r3, [r1, #0x6]
    ldrh r4, [ip, #0xa]
    ldrh r3, [ip, #0xc]
    strh r4, [r1, #0x8]
    strh r3, [r1, #0xa]
    ldr r1, [r2, #0x4]
    add r1, r1, #0x1
    str r1, [r2, #0x4]
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_114:
    ldrb r4, [r5, #0x1]
    ldrb r3, [r5]
    ldr lr, [r2, #0x4]
    sub r3, r4, r3
    add r3, r3, #0x1
    cmp lr, r3
    bcc .L_c0
    b .L_1a8
.L_134:
    add r4, r0, r4, lsr #0x8
    b .L_19c
.L_13c:
    ldrb lr, [r4, r3]
    cmp lr, #0x0
    beq .L_1a8
    mov r0, #0xc
    mla lr, r3, r0, r4
    ldrh ip, [lr, #0x8]
    ldrh r3, [lr, #0xa]
    add sp, sp, #0x4
    mov r0, #0x1
    strh ip, [r1]
    strh r3, [r1, #0x2]
    ldrh ip, [lr, #0xc]
    ldrh r3, [lr, #0xe]
    strh ip, [r1, #0x4]
    strh r3, [r1, #0x6]
    ldrh ip, [lr, #0x10]
    ldrh r3, [lr, #0x12]
    strh ip, [r1, #0x8]
    strh r3, [r1, #0xa]
    ldr r1, [r2, #0x4]
    add r1, r1, #0x1
    str r1, [r2, #0x4]
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_19c:
    ldr r3, [r2, #0x4]
    cmp r3, #0x8
    bcc .L_13c
.L_1a8:
    ldr r3, [r2]
    add r3, r3, #0x1
    str r3, [r2]
    str ip, [r2, #0x4]
    ldr r4, [r2]
    ldr r3, [r0, #0x38]
    cmp r4, r3
    bcc .L_1c
.L_1c8:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
