; func_020a6e4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a6d94
        .extern func_020a6dc4
        .extern func_020a7368
        .extern func_020a7414
        .extern func_020ace14
        .extern func_020b3a7c
        .global func_020a6e4c
        .arm
func_020a6e4c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r9, r3
    mov sl, r0
    str r1, [sp]
    mov r0, r9
    mov r1, #0x0
    mov r4, r2
    bl func_020ace14
    cmp r0, #0x0
    bne .L_c0
    mov r0, r9
    mvn r1, #0x0
    bl func_020ace14
.L_c0:
    ldr r0, [sp]
    muls r5, r0, r4
    beq .L_e8
    ldrb r0, [r9, #0xd]
    cmp r0, #0x0
    bne .L_e8
    ldr r1, [r9, #0x4]
    mov r0, r1, lsl #0x16
    movs r0, r0, lsr #0x1d
    bne .L_f4
.L_e8:
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f4:
    mov r0, r1, lsl #0x13
    movs r0, r0, lsr #0x1f
    movne r0, r1, lsl #0x19
    movne r0, r0, lsr #0x1e
    cmpne r0, #0x2
    ldr r1, [r9, #0x8]
    cmpne r0, #0x1
    mov r8, #0x1
    mov r0, r1, lsl #0x1d
    movne r8, #0x0
    movs r0, r0, lsr #0x1d
    bne .L_14c
    ldr r0, [r9, #0x4]
    mov r0, r0, lsl #0x1b
    mov r0, r0, lsr #0x1d
    tst r0, #0x2
    beq .L_14c
    bic r0, r1, #0x7
    orr r1, r0, #0x1
    mov r0, r9
    str r1, [r9, #0x8]
    bl func_020a6d94
.L_14c:
    ldr r0, [r9, #0x8]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    cmp r0, #0x1
    beq .L_178
    mov r0, #0x1
    strb r0, [r9, #0xd]
    mov r0, #0x0
    add sp, sp, #0x8
    str r0, [r9, #0x28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_178:
    cmp r5, #0x0
    mov r6, #0x0
    beq .L_2a0
    ldr r0, [r9, #0x1c]
    ldr r2, [r9, #0x24]
    cmp r2, r0
    cmpeq r8, #0x0
    beq .L_2a0
    ldr r1, [r9, #0x20]
    sub r0, r2, r0
    sub r0, r1, r0
    str r0, [r9, #0x28]
    mov fp, #0xa
    mov r4, #0x0
.L_1b0:
    ldr r0, [r9, #0x28]
    mov r7, r4
    str r0, [sp, #0x4]
    cmp r0, r5
    strhi r5, [sp, #0x4]
    ldr r0, [r9, #0x4]
    mov r0, r0, lsl #0x19
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne .L_200
    ldr r2, [sp, #0x4]
    cmp r2, #0x0
    beq .L_200
    mov r0, sl
    mov r1, fp
    bl func_020a7414
    movs r7, r0
    addne r0, r7, #0x1
    subne r0, r0, sl
    strne r0, [sp, #0x4]
.L_200:
    ldr r2, [sp, #0x4]
    cmp r2, #0x0
    beq .L_240
    ldr r0, [r9, #0x24]
    mov r1, sl
    bl func_020a7368
    ldr r2, [sp, #0x4]
    ldr r0, [r9, #0x24]
    add sl, sl, r2
    add r0, r0, r2
    str r0, [r9, #0x24]
    ldr r1, [r9, #0x28]
    ldr r0, [sp, #0x4]
    sub r5, r5, r2
    sub r0, r1, r0
    str r0, [r9, #0x28]
.L_240:
    ldr r0, [r9, #0x28]
    cmp r0, #0x0
    beq .L_264
    cmp r7, #0x0
    bne .L_264
    ldr r0, [r9, #0x4]
    mov r0, r0, lsl #0x19
    movs r0, r0, lsr #0x1e
    bne .L_28c
.L_264:
    mov r0, r9
    mov r1, #0x0
    bl func_020a6dc4
    cmp r0, #0x0
    beq .L_28c
    mov r0, #0x1
    strb r0, [r9, #0xd]
    mov r5, #0x0
    str r5, [r9, #0x28]
    b .L_2a0
.L_28c:
    ldr r0, [sp, #0x4]
    cmp r5, #0x0
    add r6, r6, r0
    cmpne r8, #0x0
    bne .L_1b0
.L_2a0:
    cmp r5, #0x0
    beq .L_30c
    cmp r8, #0x0
    bne .L_30c
    ldr r4, [r9, #0x1c]
    ldr r7, [r9, #0x20]
    add r2, sl, r5
    str sl, [r9, #0x1c]
    str r5, [r9, #0x20]
    add r1, sp, #0x4
    mov r0, r9
    str r2, [r9, #0x24]
    bl func_020a6dc4
    cmp r0, #0x0
    ldreq r0, [sp, #0x4]
    addeq r6, r6, r0
    beq .L_2f4
    mov r0, #0x1
    strb r0, [r9, #0xd]
    mov r0, #0x0
    str r0, [r9, #0x28]
.L_2f4:
    str r4, [r9, #0x1c]
    mov r0, r9
    str r7, [r9, #0x20]
    bl func_020a6d94
    mov r0, #0x0
    str r0, [r9, #0x28]
.L_30c:
    ldr r0, [r9, #0x4]
    ldr r1, [sp]
    mov r0, r0, lsl #0x19
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    movne r0, #0x0
    strne r0, [r9, #0x28]
    mov r0, r6
    bl func_020b3a7c
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
