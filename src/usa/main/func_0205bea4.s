; func_0205bea4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021009f4
        .extern data_021009f8
        .extern data_02100a28
        .extern data_02100a38
        .extern data_02100a4c
        .extern data_02100a60
        .extern func_02045398
        .extern func_020584b4
        .extern func_0205ff4c
        .extern func_020a6c60
        .extern func_020a72e0
        .global func_0205bea4
        .arm
func_0205bea4:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    movs r7, r0
    mov r6, r1
    ldr r5, [r7]
    bne .L_2c
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x22
    bl func_020a6c60
.L_2c:
    ldr r0, [r7]
    cmp r0, #0x0
    bne .L_4c
    ldr r0, _LIT2
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x23
    bl func_020a6c60
.L_4c:
    cmp r6, #0x0
    bne .L_68
    ldr r0, _LIT3
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x24
    bl func_020a6c60
.L_68:
    ldr r1, [r6, #0xc]
    ldr r0, [r6, #0x10]
    cmp r1, #0x0
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    beq .L_318
    ldr r0, [r6]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_304
    b .L_a4
    b .L_12c
    b .L_1a8
    b .L_214
    b .L_298
.L_a4:
    mov r0, #0x20
    bl func_02045398
    movs r4, r0
    bne .L_cc
    ldr r1, _LIT4
    mov r0, r7
    bl func_0205ff4c
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_cc:
    mov r1, #0x0
    mov r2, #0x20
    bl func_020a72e0
    ldr r1, [r6, #0x1c]
    ldr r0, _LIT5
    str r1, [r4]
    ldr r1, [r5, #0x418]
    mov r3, r4
    cmp r1, r0
    ldreq r1, [r5, #0x1a0]
    moveq r0, #0x0
    streq r1, [r4, #0x4]
    streq r0, [r5, #0x1a0]
    str r6, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    add r1, sp, #0x8
    mov r0, r7
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    beq .L_318
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_12c:
    mov r0, #0x8
    bl func_02045398
    movs r3, r0
    bne .L_154
    ldr r1, _LIT4
    mov r0, r7
    bl func_0205ff4c
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_154:
    mov r2, #0x0
    strb r2, [r3]
    strb r2, [r3, #0x1]
    strb r2, [r3, #0x2]
    strb r2, [r3, #0x3]
    strb r2, [r3, #0x4]
    strb r2, [r3, #0x5]
    strb r2, [r3, #0x6]
    strb r2, [r3, #0x7]
    ldr r0, [r6, #0x1c]
    add r1, sp, #0x8
    str r0, [r3]
    str r6, [sp]
    str r2, [sp, #0x4]
    mov r0, r7
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    beq .L_318
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_1a8:
    mov r0, #0x204
    bl func_02045398
    movs r4, r0
    bne .L_1d0
    ldr r1, _LIT4
    mov r0, r7
    bl func_0205ff4c
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_1d0:
    mov r1, #0x0
    mov r2, #0x204
    bl func_020a72e0
    ldr r1, [r6, #0x1c]
    mov r0, #0x0
    str r1, [r4]
    str r6, [sp]
    str r0, [sp, #0x4]
    add r1, sp, #0x8
    mov r0, r7
    mov r3, r4
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    beq .L_318
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_214:
    mov r0, #0x10
    bl func_02045398
    movs r3, r0
    bne .L_23c
    ldr r1, _LIT4
    mov r0, r7
    bl func_0205ff4c
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_23c:
    mov r2, r3
    mov r1, #0x4
    mov r0, #0x0
.L_248:
    strb r0, [r2], #0x1
    strb r0, [r2], #0x1
    strb r0, [r2], #0x1
    strb r0, [r2], #0x1
    subs r1, r1, #0x1
    bne .L_248
    ldr r1, [r6, #0x1c]
    mov r0, #0x0
    str r1, [r3]
    str r0, [r3, #0xc]
    str r6, [sp]
    str r0, [sp, #0x4]
    add r1, sp, #0x8
    mov r0, r7
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    beq .L_318
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_298:
    mov r0, #0x4
    bl func_02045398
    movs r3, r0
    bne .L_2c0
    ldr r1, _LIT4
    mov r0, r7
    bl func_0205ff4c
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_2c0:
    mov r2, #0x0
    strb r2, [r3]
    strb r2, [r3, #0x1]
    strb r2, [r3, #0x2]
    strb r2, [r3, #0x3]
    ldr r0, [r6, #0x1c]
    add r1, sp, #0x8
    str r0, [r3]
    str r6, [sp]
    str r2, [sp, #0x4]
    mov r0, r7
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    beq .L_318
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_304:
    ldr r0, _LIT6
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x6b
    bl func_020a6c60
.L_318:
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02100a38
_LIT1: .word data_021009f8
_LIT2: .word data_02100a4c
_LIT3: .word data_02100a60
_LIT4: .word data_02100a28
_LIT5: .word 0x00000201
_LIT6: .word data_021009f4
