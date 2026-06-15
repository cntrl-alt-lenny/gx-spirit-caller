; func_ov005_021b0658 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov005_021b1c8c
        .extern func_020054a4
        .extern func_02037208
        .extern func_020aaddc
        .extern func_ov005_021aef74
        .extern func_ov005_021af750
        .extern func_ov005_021af874
        .extern func_ov005_021af8ec
        .extern func_ov005_021afac8
        .global func_ov005_021b0658
        .arm
func_ov005_021b0658:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    mov r5, r1
    ldr r2, [r2, #0x4]
    mov r6, r0
    mov r1, r2, lsl #0x1d
    movs r1, r1, lsr #0x1d
    ldr r1, [r6, #0x3cc]
    bne .L_1160
    bl func_ov005_021af874
    mov r1, r5, lsl #0x1
    ldrsb r1, [r0, r1]
    add r0, r0, r5, lsl #0x1
    cmp r1, #0x0
    beq .L_f60
    ldrb r1, [r0]
    ldrb r0, [r0, #0x1]
    add r0, r0, r1, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
    b .L_f88
.L_f60:
    ldr r0, [r6, #0x3cc]
    cmp r0, #0x3
    moveq r4, #0x0
    beq .L_f88
    ldr r0, _LIT1
    ldrb r1, [r0]
    ldrb r0, [r0, #0x1]
    add r0, r0, r1, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
.L_f88:
    ldr r0, [r6, #0x3cc]
    cmp r0, #0x0
    bne .L_1038
    ldr r0, _LIT1
    ldrb r1, [r0]
    ldrb r0, [r0, #0x1]
    add r0, r0, r1, lsl #0x8
    cmp r4, r0
    beq .L_1038
    cmp r5, #0x32
    bge .L_1038
    ldr r2, [r6, #0x10]
    ldr r1, [r6, #0x24]
    ldr r0, [r6, #0x14]
    add r2, r2, r2, lsl #0x2
    add r1, r1, r0
    mov r0, r6
    add r1, r2, r1
    bl func_ov005_021af750
    mov r0, r6
    mov r1, #0x3
    bl func_ov005_021af8ec
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
    bl func_ov005_021afac8
    mov r0, #0x56
    sub r1, r0, #0x57
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_12a8
.L_1038:
    cmp r4, #0x0
    beq .L_10d4
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
    bl func_ov005_021aef74
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r1, [r6, #0x8]
    mov r2, #0x0
    cmp r1, #0x4
    bhi .L_10a0
    mov r0, #0x1
    mov r1, r0, lsl r1
    tst r1, #0x19
    movne r2, r0
.L_10a0:
    cmp r2, #0x0
    movne r0, #0xa
    moveq r0, #0xc
    ldrh r1, [r6, #0x28]
    sub r0, r0, #0x1
    cmp r1, r0
    addlt r0, r1, #0x1
    strlth r0, [r6, #0x28]
    blt .L_10d4
    mov r0, #0x1
    str r0, [r6, #0x18]
    mov r0, #0x3
    str r0, [r6, #0x1c]
.L_10d4:
    ldr r0, [r6, #0x3cc]
    cmp r0, #0x3
    bne .L_12a8
    mov r0, r6
    mov r1, #0x0
    bl func_ov005_021af8ec
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
    bl func_ov005_021afac8
    cmp r4, #0x0
    bne .L_12a8
    mov r0, #0x56
    sub r1, r0, #0x57
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_12a8
.L_1160:
    bl func_ov005_021af874
    mov r4, r0
    bl func_020aaddc
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
    bhi .L_11a8
    mov r0, #0x1
    mov r1, r0, lsl r1
    tst r1, #0x19
    movne r2, r0
.L_11a8:
    cmp r2, #0x0
    movne r7, #0xa
    add r0, r6, #0x48
    mov r1, #0xc
    moveq r7, #0xc
    bl func_020054a4
    mov r1, #0xc
    mul r2, r7, r1
    cmp r0, r2
    ble .L_11fc
    ldrh r2, [r6, #0x28]
    mov r0, #0x43
    sub r1, r0, #0x44
    add r5, r6, r2
    mov r2, #0x0
    mov r3, #0x1
    strb r4, [r5, #0x48]
    bl func_02037208
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_11fc:
    cmp r5, #0x20
    beq .L_1224
    and r2, r5, #0xff
    add r0, sp, #0x0
    str r2, [sp]
    bl func_020054a4
    ldrh r1, [r6, #0x28]
    add r1, r6, r1
    strb r0, [r1, #0x68]
    b .L_1234
.L_1224:
    ldrh r0, [r6, #0x28]
    mov r1, #0x6
    add r0, r6, r0
    strb r1, [r0, #0x68]
.L_1234:
    mov r0, r6
    bl func_ov005_021aef74
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r1, [r6, #0x8]
    mov r2, #0x0
    cmp r1, #0x4
    bhi .L_1270
    mov r0, #0x1
    mov r1, r0, lsl r1
    tst r1, #0x19
    movne r2, r0
.L_1270:
    cmp r2, #0x0
    movne r0, #0xa
    moveq r0, #0xc
    mov r0, r0, lsl #0x1
    ldrh r1, [r6, #0x28]
    sub r0, r0, #0x1
    cmp r1, r0
    addlt r0, r1, #0x1
    strlth r0, [r6, #0x28]
    blt .L_12a8
    mov r0, #0x1
    str r0, [r6, #0x18]
    mov r0, #0x3
    str r0, [r6, #0x1c]
.L_12a8:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_ov005_021b1c8c
_LIT2: .word 0x66666667
