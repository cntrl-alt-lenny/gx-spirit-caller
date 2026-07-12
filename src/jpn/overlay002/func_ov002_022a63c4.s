; func_ov002_022a63c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202e2a4
        .extern func_020371b8
        .extern func_ov002_0229d974
        .extern func_ov002_0229da34
        .extern func_ov002_0229ec20
        .extern func_ov002_0229edcc
        .extern func_ov002_022a5fb8
        .extern func_ov002_022a61e8
        .global func_ov002_022a63c4
        .arm
func_ov002_022a63c4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r2
    ldrh r4, [r7]
    mov r8, r1
    mov r6, r3
    mov r1, r4, lsl #0x1f
    mov r2, r4, lsl #0x1a
    mov r3, r4, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    mov r9, r0
    bl func_ov002_022a61e8
    movs r5, r0
    ldrnesb r0, [r5]
    cmpne r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    str r8, [r5, #0xc]
    ldrh r1, [r6]
    mov r0, #0x8
    mov r4, #0x0
    strh r1, [r5, #0xa]
    strh r0, [r5, #0x4]
    ldrh r0, [r6]
    mov r0, r0, lsl #0x1a
    mov r1, r0, lsr #0x1b
    sub r0, r1, #0xb
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_15c
    b .L_114
    b .L_90
    b .L_90
    b .L_90
    b .L_90
    b .L_268
.L_90:
    mov r0, r8
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_268
    ldrh r1, [r6]
    mov r2, r4
    mov r0, r1, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xd
    bne .L_c4
    mov r1, r1, lsl #0x12
    movs r1, r1, lsr #0x18
    movne r2, #0x1
.L_c4:
    ldrh r3, [r6]
    cmp r2, #0x0
    moveq r2, #0x1
    mov r3, r3, lsl #0x1f
    add r8, r9, #0x280
    mov r1, #0xb0
    mov r3, r3, lsr #0x1f
    mla r8, r3, r1, r8
    sub r1, r0, #0xc
    mov r0, #0x2c
    mla r0, r1, r0, r8
    movne r2, #0x0
    mov r1, r5
    bl func_ov002_0229ec20
    mov r0, #0x33
    sub r1, r0, #0x34
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_268
.L_114:
    mov r0, r8
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_268
    ldrh r1, [r6]
    add r2, r9, #0x3e0
    mov r0, #0xcc
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mla r0, r1, r0, r2
    mov r1, r5
    bl func_ov002_0229d974
    mov r0, #0x33
    sub r1, r0, #0x34
    mov r2, r4
    mov r3, #0x1
    bl func_020371b8
    b .L_268
.L_15c:
    ldrh r2, [r6]
    mov r4, #0x1
    mov r0, r2, lsl #0x12
    add r0, r1, r0, lsr #0x18
    cmp r0, #0xa
    bgt .L_1f8
    mov r1, r2, lsl #0x1f
    mov r2, #0x14
    mov r3, r1, lsr #0x1f
    mov r1, #0xdc
    mla r1, r3, r1, r9
    mul r3, r0, r2
    ldrsb r2, [r5]
    add r8, r1, r3
    mov r0, #0x33
    strb r2, [r1, r3]
    ldrsb r2, [r5, #0x1]
    mov r3, r4
    sub r1, r0, #0x34
    strb r2, [r8, #0x1]
    ldrsb ip, [r5, #0x2]
    mov r2, #0x0
    strb ip, [r8, #0x2]
    ldrsb ip, [r5, #0x3]
    strb ip, [r8, #0x3]
    ldrsh ip, [r5, #0x4]
    strh ip, [r8, #0x4]
    ldrsh ip, [r5, #0x6]
    strh ip, [r8, #0x6]
    ldrsh ip, [r5, #0x8]
    strh ip, [r8, #0x8]
    ldrh ip, [r5, #0xa]
    strh ip, [r8, #0xa]
    ldr ip, [r5, #0xc]
    str ip, [r8, #0xc]
    ldr ip, [r5, #0x10]
    str ip, [r8, #0x10]
    bl func_020371b8
    b .L_268
.L_1f8:
    mov r0, r2, lsl #0x1f
    mov r2, #0x14
    add r8, r9, #0x1b8
    mov r3, r0, lsr #0x1f
    mov r0, #0x64
    mla r8, r3, r0, r8
    mul r2, r1, r2
    ldrsb r1, [r5]
    add r0, r8, r2
    strb r1, [r8, r2]
    ldrsb r1, [r5, #0x1]
    strb r1, [r0, #0x1]
    ldrsb r1, [r5, #0x2]
    strb r1, [r0, #0x2]
    ldrsb r1, [r5, #0x3]
    strb r1, [r0, #0x3]
    ldrsh r1, [r5, #0x4]
    strh r1, [r0, #0x4]
    ldrsh r1, [r5, #0x6]
    strh r1, [r0, #0x6]
    ldrsh r1, [r5, #0x8]
    strh r1, [r0, #0x8]
    ldrh r1, [r5, #0xa]
    strh r1, [r0, #0xa]
    ldr r1, [r5, #0xc]
    str r1, [r0, #0xc]
    ldr r1, [r5, #0x10]
    str r1, [r0, #0x10]
.L_268:
    ldrh r1, [r7]
    mov r0, r1, lsl #0x1a
    mov r0, r0, lsr #0x1b
    sub r2, r0, #0xb
    cmp r2, #0x4
    addls pc, pc, r2, lsl #0x2
    b .L_328
    b .L_2c0
    b .L_298
    b .L_298
    b .L_298
    b .L_298
.L_298:
    mov r1, r1, lsl #0x1f
    add r3, r9, #0x280
    mov r2, r1, lsr #0x1f
    mov r1, #0xb0
    mla r3, r2, r1, r3
    sub r1, r0, #0xc
    mov r0, #0x2c
    mla r0, r1, r0, r3
    bl func_ov002_0229edcc
    b .L_330
.L_2c0:
    mov r0, r1, lsl #0x1f
    add r3, r9, #0x3e0
    mov r2, r0, lsr #0x1f
    mov r0, #0xcc
    mla r0, r2, r0, r3
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x18
    bl func_ov002_0229da34
    cmp r4, #0x0
    bne .L_330
    ldrh r0, [r7]
    mov r1, r0, lsl #0x12
    movs r2, r1, lsr #0x18
    beq .L_330
    mov r0, r0, lsl #0x1f
    mov r1, r0, lsr #0x1f
    mov r0, #0xcc
    mla r0, r1, r0, r9
    ldr r0, [r0, #0x484]
    cmp r2, r0
    blt .L_330
    mov r0, r9
    sub r3, r2, #0x1
    mov r2, #0xb
    bl func_ov002_022a5fb8
    b .L_330
.L_328:
    mov r0, #0x0
    strb r0, [r5]
.L_330:
    cmp r4, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r1, [r6]
    mov r0, r9
    mov r4, r1, lsl #0x1f
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x12
    mov r1, r4, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    bl func_ov002_022a5fb8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
