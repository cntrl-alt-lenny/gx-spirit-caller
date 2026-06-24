; func_0203998c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Fill32
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219c3a0
        .extern func_02038fd0
        .extern func_0203a7fc
        .extern func_02088f3c
        .extern func_02089178
        .extern func_020891dc
        .extern func_02095cec
        .extern func_02095d34
        .extern func_02095d6c
        .extern func_02095d74
        .extern func_02095f4c
        .extern func_02096058
        .global func_0203998c
        .arm
func_0203998c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    ldr r2, _LIT0
    mov sl, r0
    ldrh r0, [r2, #0x4]
    mov r9, r1
    cmp r0, #0x0
    addne sp, sp, #0x18
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r4, [sl, #0x10]
    and r0, r9, #0x8000
    str r0, [sp]
    cmp r4, #0x0
    addeq sp, sp, #0x18
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [r4, #0x2e]
    add r5, r4, #0x34
    bl func_0203a7fc
    cmp r0, #0x0
    addeq sp, sp, #0x18
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrsb r1, [r0, #0x1d]
    cmp r1, #0x1
    addne sp, sp, #0x18
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrb r1, [sl, #0x57]
    add r7, r0, #0x20
    mov r6, #0x0
    tst r1, #0x70
    bne .L_b8
    ldrh r0, [r4, #0x2a]
    bl func_0203a7fc
    cmp r0, #0x0
    addeq sp, sp, #0x18
    moveq r0, r6
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrsb r1, [r0, #0x1d]
    cmp r1, #0x1
    addne sp, sp, #0x18
    movne r0, r6
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r6, r0, #0x20
.L_b8:
    ldrb r0, [sl, #0x57]
    tst r0, #0x80
    bne .L_120
    mov r0, r7
    bl func_02095d6c
    mov r8, r0, lsl #0x1
    add r1, r7, r8, lsl #0x2
    ldr r1, [r1, #0x3c]
    mov fp, r0, lsl #0x2
    cmp r1, #0x0
    bne .L_114
    ldr r1, [r7, #0x38]
    add r0, r7, #0x3c
    mov r2, fp
    add r1, r0, r1, lsl #0x2
    bl Copy32
    mov r2, fp
    add r1, r7, #0x3c
    mov r0, #0x0
    bl Fill32
    add r0, r7, r8, lsl #0x2
    mov r1, #0x1
    str r1, [r0, #0x3c]
.L_114:
    ldrb r0, [sl, #0x57]
    orr r0, r0, #0x80
    strb r0, [sl, #0x57]
.L_120:
    ldrb r0, [sl, #0x57]
    tst r0, #0x40
    bne .L_204
    add r0, sp, #0x4
    mov r1, r6
    ldrh fp, [r4, #0x2c]
    bl func_02095f4c
    add r1, sp, #0xc
    add r2, sp, #0x4
    mov r0, r6
    bl func_02095d74
    cmp r0, #0x0
    beq .L_1e4
.L_154:
    ldrb r0, [sp, #0xc]
    cmp r0, #0x1
    ldreqh r0, [sp, #0x10]
    cmpeq r0, #0x0
    bne .L_1cc
    ldrh r8, [sp, #0xe]
    ldrsh r0, [r4, #0x30]
    cmp r8, r0
    addcs sp, sp, #0x18
    mvncs r0, #0x0
    ldmcsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r5, r8, lsl #0x2]
    cmp r0, #0x0
    bne .L_1cc
    mov r0, r7
    mov r1, fp
    mov r2, r8
    mov r3, r9
    bl func_02038fd0
    cmp r0, #0x0
    addeq sp, sp, #0x18
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    str r0, [r5, r8, lsl #0x2]
    ldr r0, [r0, #0xc]
    ldr r1, [r4, #0x24]
    add r0, r0, #0x3f
    bic r0, r0, #0x1f
    sub r0, r1, r0
    str r0, [r4, #0x24]
.L_1cc:
    mov r0, r6
    add r1, sp, #0xc
    add r2, sp, #0x4
    bl func_02095d74
    cmp r0, #0x0
    bne .L_154
.L_1e4:
    ldrb r1, [sl, #0x57]
    ldr r0, [sp]
    cmp r0, #0x0
    orr r0, r1, #0x40
    strb r0, [sl, #0x57]
    addeq sp, sp, #0x18
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_204:
    ldrb r0, [sl, #0x57]
    tst r0, #0x20
    bne .L_338
    bl OS_DisableIrq
    ldrsh r1, [r4, #0x30]
    mov r6, r0
    mov r8, #0x0
    cmp r1, #0x0
    ble .L_288
.L_228:
    ldr r9, [r5, r8, lsl #0x2]
    cmp r9, #0x0
    beq .L_278
    ldrsb r0, [r9, #0x1d]
    cmp r0, #0x1
    beq .L_254
    mov r0, r6
    bl OS_RestoreIrq
    add sp, sp, #0x18
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_254:
    mov r0, r7
    mov r1, r8
    bl func_02095cec
    cmp r0, #0x0
    bne .L_278
    mov r0, r7
    mov r1, r8
    add r2, r9, #0x20
    bl func_02095d34
.L_278:
    ldrsh r0, [r4, #0x30]
    add r8, r8, #0x1
    cmp r8, r0
    blt .L_228
.L_288:
    ldrh r0, [r4, #0x28]
    bl func_020891dc
    movs r7, r0
    moveq r0, #0x0
    beq .L_30c
    ldr r0, [r7]
    bl func_02088f3c
    movs r5, r0
    moveq r0, #0x0
    beq .L_30c
    ldr r8, _LIT1
    mov r4, #0x0
.L_2b8:
    add r0, r7, r4, lsl #0x1
    ldrh r0, [r0, #0x4]
    cmp r0, r8
    beq .L_2fc
    bl func_02089178
    cmp r0, #0x0
    beq .L_2fc
    ldr r0, [r0]
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x8
    bl func_02088f3c
    movs r2, r0
    moveq r0, #0x0
    beq .L_30c
    mov r0, r5
    mov r1, r4
    bl func_02096058
.L_2fc:
    add r4, r4, #0x1
    cmp r4, #0x4
    bcc .L_2b8
    mov r0, #0x1
.L_30c:
    cmp r0, #0x0
    mov r0, r6
    bne .L_328
    bl OS_RestoreIrq
    add sp, sp, #0x18
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_328:
    bl OS_RestoreIrq
    ldrb r0, [sl, #0x57]
    orr r0, r0, #0x30
    strb r0, [sl, #0x57]
.L_338:
    mov r0, #0x1
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219c3a0
_LIT1: .word 0x0000ffff
