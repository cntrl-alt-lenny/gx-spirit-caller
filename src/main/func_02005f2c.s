; func_02005f2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103d74
        .extern func_02099c50
        .extern func_0209a1b8
        .extern func_0209a210
        .global func_02005f2c
        .arm
func_02005f2c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    ldr r4, _LIT0
    add r5, sp, #0x8
.L_1e8:
    bl func_0209a210
    mov r0, r5
    bl func_0209a1b8
    cmp r0, #0x0
    bne .L_1e8
    add r0, sp, #0x0
    add r1, sp, #0x8
    bl func_02099c50
    ldrh r0, [sp, #0x4]
    ldr r2, [r4, #0x28]
    ldr r1, [r4, #0x20]
    bic r3, r2, #0x4
    mov r2, r3, lsl #0x1d
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsl #0x1
    bic r3, r3, #0x2
    mov r2, r2, lsl #0x1f
    orr r2, r3, r2, lsr #0x1e
    str r2, [r4, #0x28]
    str r1, [r4, #0x20]
    str r0, [r4, #0x24]
    cmp r0, #0x0
    beq .L_2e0
    ldrh r0, [sp, #0x6]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_2e0
    b .L_264
    b .L_2d8
    b .L_2d8
    b .L_2d8
.L_264:
    ldrh r3, [sp]
    ldr r2, [r4, #0x8]
    sub r1, r2, r3
    cmp r1, #0x2
    bgt .L_28c
    mvn r0, #0x1
    cmp r1, r0
    blt .L_28c
    cmp r2, r3
    bne .L_29c
.L_28c:
    ldrh r0, [sp]
    ldr r1, [r4]
    str r1, [r4, #0x8]
    str r0, [r4]
.L_29c:
    ldrh r3, [sp, #0x2]
    ldr r2, [r4, #0xc]
    sub r1, r2, r3
    cmp r1, #0x2
    bgt .L_2c4
    mvn r0, #0x1
    cmp r1, r0
    blt .L_2c4
    cmp r2, r3
    bne .L_2e0
.L_2c4:
    ldrh r0, [sp, #0x2]
    ldr r1, [r4, #0x4]
    str r1, [r4, #0xc]
    str r0, [r4, #0x4]
    b .L_2e0
.L_2d8:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_2e0:
    ldr r0, [r4, #0x28]
    ldrh r2, [sp, #0x4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r2
    addeq sp, sp, #0x10
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, [r4, #0x18]
    ldr r0, [r4]
    cmp r1, r0
    ldrne r1, [r4, #0x1c]
    ldrne r0, [r4, #0x4]
    cmpne r1, r0
    bne .L_328
    ldr r0, [r4, #0x28]
    mov r1, r0, lsl #0x1c
    movs r1, r1, lsr #0x1f
    beq .L_3a8
.L_328:
    cmp r2, #0x0
    beq .L_33c
    cmp r2, #0x1
    beq .L_35c
    b .L_384
.L_33c:
    ldr r2, [r4, #0x28]
    ldr r1, [r4]
    ldr r0, [r4, #0x4]
    orr r2, r2, #0x4
    str r2, [r4, #0x28]
    str r1, [r4, #0x18]
    str r0, [r4, #0x1c]
    b .L_384
.L_35c:
    ldr r3, [r4, #0x28]
    ldr r2, [r4, #0x20]
    ldr r1, [r4]
    ldr r0, [r4, #0x4]
    orr r3, r3, #0x2
    orr r2, r2, #0x1
    str r3, [r4, #0x28]
    str r2, [r4, #0x20]
    str r1, [r4, #0x10]
    str r0, [r4, #0x14]
.L_384:
    ldrh r0, [sp, #0x4]
    ldr r1, [r4, #0x28]
    add sp, sp, #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    bic r0, r0, #0x8
    str r0, [r4, #0x28]
    ldmia sp!, {r3, r4, r5, pc}
.L_3a8:
    orr r0, r0, #0x8
    str r0, [r4, #0x28]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02103d74
