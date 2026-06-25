; func_020a6d58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a6ca0
        .extern func_020a6cd0
        .extern func_020a7274
        .extern func_020a7320
        .extern func_020acd20
        .extern func_020b3988
        .global func_020a6d58
        .arm
func_020a6d58:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r9, r3
    mov sl, r0
    str r1, [sp]
    mov r0, r9
    mov r1, #0x0
    mov r4, r2
    bl func_020acd20
    cmp r0, #0x0
    bne .L_38
    mov r0, r9
    mvn r1, #0x0
    bl func_020acd20
.L_38:
    ldr r0, [sp]
    muls r5, r0, r4
    beq .L_60
    ldrb r0, [r9, #0xd]
    cmp r0, #0x0
    bne .L_60
    ldr r1, [r9, #0x4]
    mov r0, r1, lsl #0x16
    movs r0, r0, lsr #0x1d
    bne .L_6c
.L_60:
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6c:
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
    bne .L_c4
    ldr r0, [r9, #0x4]
    mov r0, r0, lsl #0x1b
    mov r0, r0, lsr #0x1d
    tst r0, #0x2
    beq .L_c4
    bic r0, r1, #0x7
    orr r1, r0, #0x1
    mov r0, r9
    str r1, [r9, #0x8]
    bl func_020a6ca0
.L_c4:
    ldr r0, [r9, #0x8]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    cmp r0, #0x1
    beq .L_f0
    mov r0, #0x1
    strb r0, [r9, #0xd]
    mov r0, #0x0
    add sp, sp, #0x8
    str r0, [r9, #0x28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f0:
    cmp r5, #0x0
    mov r6, #0x0
    beq .L_218
    ldr r0, [r9, #0x1c]
    ldr r2, [r9, #0x24]
    cmp r2, r0
    cmpeq r8, #0x0
    beq .L_218
    ldr r1, [r9, #0x20]
    sub r0, r2, r0
    sub r0, r1, r0
    str r0, [r9, #0x28]
    mov fp, #0xa
    mov r4, #0x0
.L_128:
    ldr r0, [r9, #0x28]
    mov r7, r4
    str r0, [sp, #0x4]
    cmp r0, r5
    strhi r5, [sp, #0x4]
    ldr r0, [r9, #0x4]
    mov r0, r0, lsl #0x19
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne .L_178
    ldr r2, [sp, #0x4]
    cmp r2, #0x0
    beq .L_178
    mov r0, sl
    mov r1, fp
    bl func_020a7320
    movs r7, r0
    addne r0, r7, #0x1
    subne r0, r0, sl
    strne r0, [sp, #0x4]
.L_178:
    ldr r2, [sp, #0x4]
    cmp r2, #0x0
    beq .L_1b8
    ldr r0, [r9, #0x24]
    mov r1, sl
    bl func_020a7274
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
.L_1b8:
    ldr r0, [r9, #0x28]
    cmp r0, #0x0
    beq .L_1dc
    cmp r7, #0x0
    bne .L_1dc
    ldr r0, [r9, #0x4]
    mov r0, r0, lsl #0x19
    movs r0, r0, lsr #0x1e
    bne .L_204
.L_1dc:
    mov r0, r9
    mov r1, #0x0
    bl func_020a6cd0
    cmp r0, #0x0
    beq .L_204
    mov r0, #0x1
    strb r0, [r9, #0xd]
    mov r5, #0x0
    str r5, [r9, #0x28]
    b .L_218
.L_204:
    ldr r0, [sp, #0x4]
    cmp r5, #0x0
    add r6, r6, r0
    cmpne r8, #0x0
    bne .L_128
.L_218:
    cmp r5, #0x0
    beq .L_284
    cmp r8, #0x0
    bne .L_284
    ldr r4, [r9, #0x1c]
    ldr r7, [r9, #0x20]
    add r2, sl, r5
    str sl, [r9, #0x1c]
    str r5, [r9, #0x20]
    add r1, sp, #0x4
    mov r0, r9
    str r2, [r9, #0x24]
    bl func_020a6cd0
    cmp r0, #0x0
    ldreq r0, [sp, #0x4]
    addeq r6, r6, r0
    beq .L_26c
    mov r0, #0x1
    strb r0, [r9, #0xd]
    mov r0, #0x0
    str r0, [r9, #0x28]
.L_26c:
    str r4, [r9, #0x1c]
    mov r0, r9
    str r7, [r9, #0x20]
    bl func_020a6ca0
    mov r0, #0x0
    str r0, [r9, #0x28]
.L_284:
    ldr r0, [r9, #0x4]
    ldr r1, [sp]
    mov r0, r0, lsl #0x19
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    movne r0, #0x0
    strne r0, [r9, #0x28]
    mov r0, r6
    bl func_020b3988
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
