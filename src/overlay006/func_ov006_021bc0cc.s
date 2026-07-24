; func_ov006_021bc0cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cdd14
        .extern data_ov006_0224f448
        .extern func_02021660
        .extern func_020216b0
        .extern func_0202bb20
        .extern OS_SPrintf
        .extern func_020b3870
        .extern func_ov006_021b6d1c
        .extern func_ov006_021b6f50
        .extern func_ov006_021be5b8
        .global func_ov006_021bc0cc
        .arm
func_ov006_021bc0cc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    mov sl, r0
    ldr r2, [sl, #0x50]
    add r3, sl, #0xa0
    mov r1, #0x24
    mla r5, r2, r1, r3
    bl func_ov006_021be5b8
    ldr r0, [sl]
    mov r1, #0x5
    mov r2, #0x2
    bl func_02021660
    mov r1, #0x0
    mov r2, #0x1
    bl func_020216b0
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r9, #0xa
    ldr r0, [sl, #0x50]
    moveq r9, #0x1
    cmp r0, #0x4
    moveq r0, #0x3
    streq r0, [sp]
    movne r0, #0x4
    strne r0, [sp]
    ldr r0, [sp]
    cmp r0, #0x0
    mov r0, #0x0
    str r0, [sp, #0x18]
    ble .L_2168
    str r0, [sp, #0x10]
    mov r0, #0x56
    str r0, [sp, #0xc]
    mov r0, #0x36
    str r0, [sp, #0x8]
.L_1f64:
    cmp r9, #0x0
    mov r7, #0x0
    ble .L_212c
    mov r0, #0xe
    str r0, [sp, #0x4]
    add r0, sl, #0x174
    str r0, [sp, #0x28]
    mov r0, r7
    orr r0, r0, #0x1
    str r0, [sp, #0x20]
    mov r0, r7
    orr r0, r0, #0xc1
    str r0, [sp, #0x24]
.L_1f98:
    ldr r0, [sp, #0x10]
    ldr r2, [r5, #0x8]
    add fp, r7, r0
    ldr r0, [sp, #0x18]
    ldr r1, [sp]
    add r0, r2, r0
    mla r6, r9, r0, r7
    bl func_020b3870
    ldr r3, [r5, #0x20]
    mla r8, r9, r1, r7
    mov r3, r3, lsl #0x1f
    ldr r0, _LIT0
    ldr r1, [sl, #0x50]
    mov r2, r6
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6d1c
    str r0, [sp, #0x1c]
    ldr r0, _LIT0
    ldr r1, [sl, #0x50]
    ldr r2, [sp, #0x1c]
    bl func_ov006_021b6f50
    ldr r1, [r5, #0xc]
    mov r4, #0x0
    cmp r6, r1
    bge .L_2030
    ldr r1, [sl, #0x80]
    ldr r4, [sp, #0x20]
    cmp r1, #0x0
    bne .L_2030
    ldr r3, [sl, #0x70]
    ldr r4, [sp, #0x24]
    cmp r3, #0x0
    beq .L_202c
    ldr r1, [sp, #0x18]
    mov r2, #0x1
    tst r3, r2, lsl r1
    beq .L_2030
.L_202c:
    orr r4, r4, #0x200
.L_2030:
    cmp r0, #0x0
    ldr r0, [sl]
    add r2, r8, #0x3
    mov r1, #0x5
    orreq r4, r4, #0x4
    bl func_02021660
    mov r8, r0
    ldr r0, [sl, #0x50]
    mov r1, #0x2
    cmp r0, #0x4
    ldreq r0, [sp, #0xc]
    add r2, fp, #0x1
    streq r0, [sp, #0x14]
    ldrne r0, [sp, #0x8]
    strne r0, [sp, #0x14]
    mov r0, r8
    bl func_020216b0
    ldr r2, [sp, #0x4]
    mov r0, r8
    mov r1, #0x3
    bl func_020216b0
    ldr r2, [sp, #0x14]
    mov r0, r8
    mov r1, #0x4
    bl func_020216b0
    mov r0, r8
    mov r1, #0x11
    mov r2, #0x3
    bl func_020216b0
    mov r0, r8
    mov r1, #0x12
    mov r2, #0x1
    bl func_020216b0
    mov r0, r8
    mov r2, r4
    mov r1, #0x0
    bl func_020216b0
    ldr r0, [sl, #0x40]
    cmp r0, #0x6
    bne .L_20e4
    ldr r0, [sp, #0x1c]
    bl func_0202bb20
    cmp r0, #0x0
    moveq r2, #0x0
    beq .L_2104
.L_20e4:
    ldr r3, [r5, #0x20]
    ldr r0, _LIT0
    mov r3, r3, lsl #0x1f
    ldr r1, [sl, #0x50]
    mov r2, r6
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6d1c
    mov r2, r0
.L_2104:
    ldr r0, [sp, #0x28]
    ldr r1, _LIT1
    add r0, r0, fp, lsl #0x5
    bl OS_SPrintf
    ldr r0, [sp, #0x4]
    add r7, r7, #0x1
    add r0, r0, #0x17
    str r0, [sp, #0x4]
    cmp r7, r9
    blt .L_1f98
.L_212c:
    ldr r0, [sp, #0x18]
    add r1, r0, #0x1
    ldr r0, [sp]
    str r1, [sp, #0x18]
    cmp r1, r0
    ldr r0, [sp, #0x10]
    add r0, r0, r9
    str r0, [sp, #0x10]
    ldr r0, [sp, #0xc]
    add r0, r0, #0x20
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x8]
    add r0, r0, #0x20
    str r0, [sp, #0x8]
    blt .L_1f64
.L_2168:
    ldr r0, [sl, #0x50]
    cmp r0, #0x4
    bne .L_2204
    ldr r0, [sp]
    mov r1, #0x5
    mul fp, r9, r0
    ldr r0, [sl]
    add r2, fp, #0x3
    ldr r5, [sl, #0x60]
    bl func_02021660
    mov r4, r0
    add r2, fp, #0x1
    mov r1, #0x2
    bl func_020216b0
    mov r0, r4
    mov r1, #0x3
    mov r2, #0xe
    bl func_020216b0
    mov r0, r4
    mov r1, #0x4
    mov r2, #0x36
    bl func_020216b0
    mov r0, r4
    mov r1, #0x11
    mov r2, #0x3
    bl func_020216b0
    mov r0, r4
    mov r1, #0x12
    mov r2, #0x1
    bl func_020216b0
    ldr r2, _LIT2
    mov r0, r4
    mov r1, #0x0
    bl func_020216b0
    add r0, sl, #0x174
    ldr r1, _LIT1
    mov r2, r5
    add r0, r0, fp, lsl #0x5
    bl OS_SPrintf
.L_2204:
    add r6, fp, #0x1
    cmp r6, #0x28
    bge .L_2240
    mov r5, #0x5
    mov r4, #0x0
.L_2218:
    ldr r0, [sl]
    mov r1, r5
    add r2, r6, #0x3
    bl func_02021660
    mov r1, r4
    mov r2, r4
    bl func_020216b0
    add r6, r6, #0x1
    cmp r6, #0x28
    blt .L_2218
.L_2240:
    mov r0, #0x0
    str r0, [sl, #0x70]
    str r0, [sl, #0x80]
    mov r0, #0x1
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f448
_LIT1: .word data_ov006_021cdd14
_LIT2: .word 0x000002c1
