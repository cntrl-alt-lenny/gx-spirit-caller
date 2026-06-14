; func_ov006_021be0b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0224f448
        .extern func_0202de9c
        .extern func_ov006_021b6d1c
        .extern func_ov006_021b6dac
        .extern func_ov006_021b7010
        .extern func_ov006_021b75f0
        .extern func_ov006_021bd6bc
        .global func_ov006_021be0b0
        .arm
func_ov006_021be0b0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov sl, r0
    mov r9, r1
    ldr r1, [sl, #0x50]
    add r4, sl, #0xa0
    mov r3, #0x24
    mla r4, r1, r3, r4
    mov r8, r2
    mov fp, #0x0
    bl func_ov006_021bd6bc
    movs r2, r0
    addmi sp, sp, #0x8
    movmi r0, fp
    ldmmiia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r4, #0x20]
    ldr r1, [sl, #0x50]
    mov r3, r0, lsl #0x1f
    ldr r0, _LIT0
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6d1c
    mov r4, r0
    bl func_0202de9c
    cmp r9, r8
    addeq sp, sp, #0x8
    moveq r0, fp
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [sl, #0x40]
    cmp r1, #0x2
    beq .L_8b8
    cmp r9, #0x1
    cmpne r9, #0x2
    beq .L_894
    cmp r9, #0x3
    beq .L_8a8
    b .L_8b8
.L_894:
    cmp r0, #0x3
    bne .L_8b8
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8a8:
    cmp r0, #0x3
    addne sp, sp, #0x8
    movne r0, fp
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8b8:
    cmp r1, #0x1
    bne .L_8ec
    cmp r9, #0x1
    beq .L_8dc
    cmp r9, #0x2
    beq .L_8e4
    cmp r9, #0x3
    moveq r5, #0x80
    b .L_928
.L_8dc:
    mov r5, #0x80
    b .L_928
.L_8e4:
    mov r5, #0x80
    b .L_928
.L_8ec:
    cmp r1, #0x2
    bne .L_900
    cmp r9, #0x1
    moveq r5, #0xa
    b .L_928
.L_900:
    cmp r9, #0x1
    beq .L_91c
    cmp r9, #0x2
    beq .L_924
    cmp r9, #0x3
    moveq r5, #0x1e
    b .L_928
.L_91c:
    mov r5, #0x50
    b .L_928
.L_924:
    mov r5, #0xf
.L_928:
    cmp r9, #0x0
    beq .L_9c0
    ldr r0, _LIT0
    add r0, r0, r9, lsl #0x1
    add r0, r0, #0x8100
    ldrh r0, [r0, #0x6a]
    cmp r0, r5
    blt .L_9c0
    cmp r9, #0x1
    beq .L_964
    cmp r9, #0x2
    beq .L_988
    cmp r9, #0x3
    beq .L_9a0
    b .L_9b4
.L_964:
    mov r0, #0x6
    str r0, [sl, #0x88]
    ldr r0, [sl, #0x40]
    cmp r0, #0x2
    moveq r0, #0x16
    movne r0, #0x3
    str r0, [sl, #0x8c]
    str r4, [sl, #0x90]
    b .L_9b4
.L_988:
    mov r0, #0x6
    str r0, [sl, #0x88]
    mov r0, #0x4
    str r0, [sl, #0x8c]
    str r4, [sl, #0x90]
    b .L_9b4
.L_9a0:
    mov r0, #0x6
    str r0, [sl, #0x88]
    mov r0, #0x5
    str r0, [sl, #0x8c]
    str r4, [sl, #0x90]
.L_9b4:
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9c0:
    cmp r8, #0x0
    bne .L_a40
    cmp r1, #0x2
    beq .L_a40
    ldr r0, _LIT0
    mov r2, r4
    mov r1, #0x3
    mov r3, #0x0
    bl func_ov006_021b7010
    mov r5, r0
    ldr r0, _LIT0
    mov r2, r4
    mov r1, #0x1
    mov r3, #0x0
    bl func_ov006_021b7010
    mov r6, r0
    ldr r0, _LIT0
    mov r1, #0x2
    mov r2, r4
    mov r3, #0x0
    bl func_ov006_021b7010
    add r0, r6, r0
    add r0, r5, r0
    cmp r0, #0x3
    blt .L_a40
    mov r0, #0x6
    str r0, [sl, #0x88]
    mov r0, #0x0
    str r0, [sl, #0x8c]
    add sp, sp, #0x8
    str r4, [sl, #0x90]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a40:
    mov r0, sl
    mov r1, r8
    bl func_ov006_021bd6bc
    add r2, sl, #0xa0
    mov r1, #0x24
    mla r6, r8, r1, r2
    mov r7, r0
    ldr r0, [r6, #0x20]
    cmp r8, #0x4
    moveq r2, #0x3
    mov r0, r0, lsl #0x1e
    movne r2, #0x4
    movs r0, r0, lsr #0x1f
    beq .L_a94
    ldr r0, [r6, #0x10]
    ldr r1, [r6, #0x8]
    sub r0, r0, r2
    cmp r1, r0
    movge r0, #0x1
    strge r0, [sp, #0x4]
    bge .L_a9c
.L_a94:
    mov r0, #0x0
    str r0, [sp, #0x4]
.L_a9c:
    ldr r0, [r6, #0x20]
    ldr r1, [sl, #0x50]
    mov r3, r0, lsl #0x1f
    ldr r0, _LIT0
    mov r2, r7
    mov r3, r3, lsr #0x1f
    ldr r5, [r6, #0xc]
    bl func_ov006_021b6dac
    mov r3, r4
    mov r4, r0
    mov r2, #0x1
    str r2, [sp]
    ldr r0, _LIT0
    mov r1, r9
    mov r2, r8
    bl func_ov006_021b75f0
    cmp r4, #0x1
    bne .L_bf4
    cmp r5, #0x1
    ble .L_bf4
    cmp r8, #0x0
    bne .L_b00
    ldr r0, [sl, #0x40]
    cmp r0, #0x3
    bne .L_bf4
.L_b00:
    ldr r0, [r6, #0x20]
    mov r1, r0, lsl #0x1f
    movs r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1e
    beq .L_bb0
    movs r0, r0, lsr #0x1f
    ldrne r0, [sp, #0x4]
    cmpne r0, #0x0
    beq .L_b6c
    ldr r2, _LIT1
    mov r0, r5, lsr #0x1f
    smull r1, r3, r2, r5
    add r3, r0, r3, asr #0x2
    mov r2, #0xa
    smull r0, r1, r2, r3
    sub r3, r5, r0
    cmp r3, #0x1
    bne .L_b6c
    ldr r1, [r6, #0x8]
    sub r0, r5, #0x1
    sub r1, r1, #0x1
    str r1, [r6, #0x8]
    cmp r7, r0
    ldrne r0, [r6, #0x4]
    mov fp, #0x1
    addne r0, r0, #0x1
    strne r0, [r6, #0x4]
.L_b6c:
    sub r0, r5, #0x1
    cmp r7, r0
    bne .L_bf4
    ldr r0, [r6]
    subs r0, r0, #0x1
    str r0, [r6]
    bpl .L_bf4
    mov r0, #0x9
    str r0, [r6]
    cmp fp, #0x0
    bne .L_bf4
    ldr r0, [r6, #0x4]
    subs r0, r0, #0x1
    str r0, [r6, #0x4]
    movmi r0, #0x0
    strmi r0, [r6, #0x4]
    b .L_bf4
.L_bb0:
    movs r0, r0, lsr #0x1f
    ldrne r0, [sp, #0x4]
    cmpne r0, #0x0
    beq .L_bd0
    ldr r0, [r6, #0x8]
    mov fp, #0x1
    sub r0, r0, #0x1
    str r0, [r6, #0x8]
.L_bd0:
    sub r0, r5, #0x1
    cmp r7, r0
    cmpeq fp, #0x0
    bne .L_bf4
    ldr r0, [r6, #0x4]
    subs r0, r0, #0x1
    str r0, [r6, #0x4]
    movmi r0, #0x0
    strmi r0, [r6, #0x4]
.L_bf4:
    ldr r0, [sl, #0x50]
    cmp r0, #0x0
    bne .L_c10
    ldr r0, [sl, #0x40]
    cmp r0, #0x3
    movne r0, #0x1
    strne r0, [sl, #0x80]
.L_c10:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f448
_LIT1: .word 0x66666667
