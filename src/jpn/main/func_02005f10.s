; func_02005f10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103c94
        .extern func_02099b5c
        .extern func_0209a0c4
        .extern func_0209a11c
        .global func_02005f10
        .arm
func_02005f10:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    ldr r4, _LIT0
    add r5, sp, #0x8
.L_10:
    bl func_0209a11c
    mov r0, r5
    bl func_0209a0c4
    cmp r0, #0x0
    bne .L_10
    add r0, sp, #0x0
    add r1, sp, #0x8
    bl func_02099b5c
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
    beq .L_108
    ldrh r0, [sp, #0x6]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_108
    b .L_8c
    b .L_100
    b .L_100
    b .L_100
.L_8c:
    ldrh r3, [sp]
    ldr r2, [r4, #0x8]
    sub r1, r2, r3
    cmp r1, #0x2
    bgt .L_b4
    mvn r0, #0x1
    cmp r1, r0
    blt .L_b4
    cmp r2, r3
    bne .L_c4
.L_b4:
    ldrh r0, [sp]
    ldr r1, [r4]
    str r1, [r4, #0x8]
    str r0, [r4]
.L_c4:
    ldrh r3, [sp, #0x2]
    ldr r2, [r4, #0xc]
    sub r1, r2, r3
    cmp r1, #0x2
    bgt .L_ec
    mvn r0, #0x1
    cmp r1, r0
    blt .L_ec
    cmp r2, r3
    bne .L_108
.L_ec:
    ldrh r0, [sp, #0x2]
    ldr r1, [r4, #0x4]
    str r1, [r4, #0xc]
    str r0, [r4, #0x4]
    b .L_108
.L_100:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_108:
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
    bne .L_150
    ldr r0, [r4, #0x28]
    mov r1, r0, lsl #0x1c
    movs r1, r1, lsr #0x1f
    beq .L_1d0
.L_150:
    cmp r2, #0x0
    beq .L_164
    cmp r2, #0x1
    beq .L_184
    b .L_1ac
.L_164:
    ldr r2, [r4, #0x28]
    ldr r1, [r4]
    ldr r0, [r4, #0x4]
    orr r2, r2, #0x4
    str r2, [r4, #0x28]
    str r1, [r4, #0x18]
    str r0, [r4, #0x1c]
    b .L_1ac
.L_184:
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
.L_1ac:
    ldrh r0, [sp, #0x4]
    ldr r1, [r4, #0x28]
    add sp, sp, #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    bic r0, r0, #0x8
    str r0, [r4, #0x28]
    ldmia sp!, {r3, r4, r5, pc}
.L_1d0:
    orr r0, r0, #0x8
    str r0, [r4, #0x28]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02103c94
