; func_ov005_021acf58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov005_021b1d6c
        .extern func_02005488
        .extern func_02094410
        .extern func_020aace8
        .extern func_020aad04
        .extern func_ov005_021ade34
        .extern func_ov005_021af1d4
        .extern func_ov005_021af9c0
        .global func_ov005_021acf58
        .arm
func_ov005_021acf58:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, r0
    ldr r4, [r6, #0x44]
    ldr r5, [r6, #0x8]
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0x3d4
    bl func_02094410
    str r4, [r6, #0x44]
    str r5, [r6, #0x8]
    ldr r1, [r6, #0x44]
    add r0, r6, #0x48
    bl func_020aad04
    mov r0, r6
    bl func_ov005_021af1d4
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    add r0, r6, #0x48
    bne .L_c4
    bl func_020aace8
    mov r0, r0, lsr #0x1
    strh r0, [r6, #0x28]
    ldr r3, [r6, #0x8]
    mov r2, #0x0
    cmp r3, #0x4
    bhi .L_80
    mov r0, #0x1
    mov r1, r0, lsl r3
    tst r1, #0x19
    movne r2, r0
.L_80:
    ldrh r0, [r6, #0x28]
    cmp r2, #0x0
    movne r1, #0xa
    moveq r1, #0xc
    cmp r0, r1
    blt .L_180
    cmp r3, #0x4
    bhi .L_b4
    mov r0, #0x1
    mov r0, r0, lsl r3
    tst r0, #0x19
    movne r0, #0xa
    bne .L_b8
.L_b4:
    mov r0, #0xc
.L_b8:
    sub r0, r0, #0x1
    strh r0, [r6, #0x28]
    b .L_180
.L_c4:
    bl func_020aace8
    strh r0, [r6, #0x28]
    ldrh r5, [r6, #0x28]
    mov r4, #0x0
    cmp r5, #0x0
    ble .L_120
    mov r7, #0x6
    add r9, sp, #0x0
    mov r8, #0xc
.L_e8:
    add r5, r6, r4
    ldrb r2, [r5, #0x48]
    mov r0, r9
    mov r1, r8
    str r2, [sp]
    bl func_02005488
    strb r0, [r5, #0x68]
    ldrsb r0, [r5, #0x48]
    add r4, r4, #0x1
    cmp r0, #0x20
    streqb r7, [r5, #0x68]
    ldrh r5, [r6, #0x28]
    cmp r4, r5
    blt .L_e8
.L_120:
    ldr r3, [r6, #0x8]
    mov r2, #0x0
    cmp r3, #0x4
    bhi .L_140
    mov r0, #0x1
    mov r1, r0, lsl r3
    tst r1, #0x19
    movne r2, r0
.L_140:
    cmp r2, #0x0
    movne r0, #0xa
    moveq r0, #0xc
    cmp r5, r0, lsl #0x1
    blt .L_180
    cmp r3, #0x4
    bhi .L_170
    mov r0, #0x1
    mov r0, r0, lsl r3
    tst r0, #0x19
    movne r0, #0xa
    bne .L_174
.L_170:
    mov r0, #0xc
.L_174:
    mov r0, r0, lsl #0x1
    sub r0, r0, #0x1
    strh r0, [r6, #0x28]
.L_180:
    mov r0, r6
    bl func_ov005_021ade34
    ldr r0, [r6, #0x20]
    cmp r0, #0x6
    ble .L_19c
    mov r0, r6
    bl func_ov005_021af9c0
.L_19c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov005_021b1d6c
_LIT1: .word data_02104e6c
