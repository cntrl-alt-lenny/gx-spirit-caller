; func_ov005_021b0550 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov005_021b1b8c
        .extern func_02005488
        .extern func_020371b8
        .extern func_020aace8
        .extern func_ov005_021aee6c
        .extern func_ov005_021af648
        .extern func_ov005_021af76c
        .extern func_ov005_021af7e4
        .extern func_ov005_021af9c0
        .global func_ov005_021b0550
        .arm
func_ov005_021b0550:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    mov r5, r1
    ldr r2, [r2, #0x4]
    mov r6, r0
    mov r1, r2, lsl #0x1d
    movs r1, r1, lsr #0x1d
    ldr r1, [r6, #0x3cc]
    bne .L_d10
    bl func_ov005_021af76c
    mov r1, r5, lsl #0x1
    ldrsb r1, [r0, r1]
    add r0, r0, r5, lsl #0x1
    cmp r1, #0x0
    beq .L_b10
    ldrb r1, [r0]
    ldrb r0, [r0, #0x1]
    add r0, r0, r1, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
    b .L_b38
.L_b10:
    ldr r0, [r6, #0x3cc]
    cmp r0, #0x3
    moveq r4, #0x0
    beq .L_b38
    ldr r0, _LIT1
    ldrb r1, [r0]
    ldrb r0, [r0, #0x1]
    add r0, r0, r1, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
.L_b38:
    ldr r0, [r6, #0x3cc]
    cmp r0, #0x0
    bne .L_be8
    ldr r0, _LIT1
    ldrb r1, [r0]
    ldrb r0, [r0, #0x1]
    add r0, r0, r1, lsl #0x8
    cmp r4, r0
    beq .L_be8
    cmp r5, #0x32
    bge .L_be8
    ldr r2, [r6, #0x10]
    ldr r1, [r6, #0x24]
    ldr r0, [r6, #0x14]
    add r2, r2, r2, lsl #0x2
    add r1, r1, r0
    mov r0, r6
    add r1, r2, r1
    bl func_ov005_021af648
    mov r0, r6
    mov r1, #0x3
    bl func_ov005_021af7e4
    ldr r2, [r6, #0x10]
    ldr r1, [r6, #0x24]
    ldr r0, [r6, #0x14]
    add r2, r2, r2, lsl #0x2
    add r0, r1, r0
    add r1, r2, r0
    add r0, r6, #0x300
    strh r1, [r0, #0xd0]
    mov r1, #0x0
    str r1, [r6, #0x24]
    str r1, [r6, #0x10]
    mov r0, r6
    str r1, [r6, #0x14]
    mov r1, #0x3
    str r1, [r6, #0x3cc]
    bl func_ov005_021af9c0
    mov r0, #0x56
    sub r1, r0, #0x57
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_e58
.L_be8:
    cmp r4, #0x0
    beq .L_c84
    ldrh r1, [r6, #0x28]
    mov r2, r4, asr #0x8
    mov r0, r6
    add r1, r6, r1, lsl #0x1
    strb r2, [r1, #0x48]
    ldrh r1, [r6, #0x28]
    mov r1, r1, lsl #0x1
    add r1, r1, #0x1
    add r1, r6, r1
    strb r4, [r1, #0x48]
    bl func_ov005_021aee6c
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r1, [r6, #0x8]
    mov r2, #0x0
    cmp r1, #0x4
    bhi .L_c50
    mov r0, #0x1
    mov r1, r0, lsl r1
    tst r1, #0x19
    movne r2, r0
.L_c50:
    cmp r2, #0x0
    movne r0, #0xa
    moveq r0, #0xc
    ldrh r1, [r6, #0x28]
    sub r0, r0, #0x1
    cmp r1, r0
    addlt r0, r1, #0x1
    strlth r0, [r6, #0x28]
    blt .L_c84
    mov r0, #0x1
    str r0, [r6, #0x18]
    mov r0, #0x3
    str r0, [r6, #0x1c]
.L_c84:
    ldr r0, [r6, #0x3cc]
    cmp r0, #0x3
    bne .L_e58
    mov r0, r6
    mov r1, #0x0
    bl func_ov005_021af7e4
    mov r1, #0x0
    str r1, [r6, #0x3cc]
    str r1, [r6, #0x24]
    add lr, r6, #0x300
    ldrh r2, [lr, #0xd0]
    ldr ip, _LIT2
    mov r5, #0x5
    mov r0, r2, lsr #0x1f
    smull r2, r3, ip, r2
    add r3, r0, r3, asr #0x1
    str r3, [r6, #0x10]
    ldrh r7, [lr, #0xd0]
    mov r0, r6
    mov r2, r7, lsr #0x1f
    smull r3, r8, ip, r7
    add r8, r2, r8, asr #0x1
    smull r2, r3, r5, r8
    sub r8, r7, r2
    str r8, [r6, #0x14]
    strh r1, [lr, #0xd0]
    bl func_ov005_021af9c0
    cmp r4, #0x0
    bne .L_e58
    mov r0, #0x56
    sub r1, r0, #0x57
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_e58
.L_d10:
    bl func_ov005_021af76c
    mov r4, r0
    bl func_020aace8
    cmp r0, r5
    ldrgtsb r5, [r4, r5]
    ldrh r0, [r6, #0x28]
    add r1, r6, #0x48
    movle r5, #0x20
    ldrsb r4, [r1, r0]
    mov r2, #0x0
    strb r5, [r1, r0]
    ldr r1, [r6, #0x8]
    cmp r1, #0x4
    bhi .L_d58
    mov r0, #0x1
    mov r1, r0, lsl r1
    tst r1, #0x19
    movne r2, r0
.L_d58:
    cmp r2, #0x0
    movne r7, #0xa
    add r0, r6, #0x48
    mov r1, #0xc
    moveq r7, #0xc
    bl func_02005488
    mov r1, #0xc
    mul r2, r7, r1
    cmp r0, r2
    ble .L_dac
    ldrh r2, [r6, #0x28]
    mov r0, #0x43
    sub r1, r0, #0x44
    add r5, r6, r2
    mov r2, #0x0
    mov r3, #0x1
    strb r4, [r5, #0x48]
    bl func_020371b8
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_dac:
    cmp r5, #0x20
    beq .L_dd4
    and r2, r5, #0xff
    add r0, sp, #0x0
    str r2, [sp]
    bl func_02005488
    ldrh r1, [r6, #0x28]
    add r1, r6, r1
    strb r0, [r1, #0x68]
    b .L_de4
.L_dd4:
    ldrh r0, [r6, #0x28]
    mov r1, #0x6
    add r0, r6, r0
    strb r1, [r0, #0x68]
.L_de4:
    mov r0, r6
    bl func_ov005_021aee6c
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r1, [r6, #0x8]
    mov r2, #0x0
    cmp r1, #0x4
    bhi .L_e20
    mov r0, #0x1
    mov r1, r0, lsl r1
    tst r1, #0x19
    movne r2, r0
.L_e20:
    cmp r2, #0x0
    movne r0, #0xa
    moveq r0, #0xc
    mov r0, r0, lsl #0x1
    ldrh r1, [r6, #0x28]
    sub r0, r0, #0x1
    cmp r1, r0
    addlt r0, r1, #0x1
    strlth r0, [r6, #0x28]
    blt .L_e58
    mov r0, #0x1
    str r0, [r6, #0x18]
    mov r0, #0x3
    str r0, [r6, #0x1c]
.L_e58:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_ov005_021b1b8c
_LIT2: .word 0x66666667
