; func_02039cd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219b2a4
        .extern data_0219c3a0
        .extern data_0219c3b4
        .extern data_0219c408
        .extern func_02038c04
        .extern func_02038cdc
        .extern func_02038e08
        .extern func_0203998c
        .extern func_0203a7fc
        .extern func_0203aa98
        .extern func_0207cef4
        .extern func_02088f20
        .extern func_02092660
        .extern func_020926d0
        .global func_02039cd8
        .arm
func_02039cd8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    mov r7, #0x0
    mov r6, r7
    bl func_020926d0
    ldr r8, _LIT1
    mov r5, r7
.L_20:
    ldr r0, [r8, #0x4]
    cmp r0, #0x0
    ldrneb r0, [r8, #0x58]
    cmpne r0, #0x1
    beq .L_13c
    ldr r0, [r8, #0x8]
    add r7, r7, #0x1
    tst r0, #0x400
    mov r1, #0x0
    beq .L_54
    mov r1, #0x2
    tst r0, #0x200
    movne r1, #0x1
.L_54:
    cmp r1, r6
    movgt r6, r1
    bl func_02038c04
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrb r0, [r8, #0x58]
    cmp r0, #0x4
    beq .L_13c
    cmp r0, #0x3
    bne .L_b4
    ldr r1, [r8, #0x8]
    mov r0, r8
    bl func_0203998c
    cmp r0, #0x0
    beq .L_13c
    movlt r0, #0x4
    strltb r0, [r8, #0x58]
    blt .L_13c
.L_a4:
    mov r0, #0x1
    strb r0, [r8, #0x58]
    sub r7, r7, #0x1
    b .L_13c
.L_b4:
    ldr sl, _LIT2
    mov r9, #0x0
    mov r4, #0x1
.L_c0:
    add r1, r8, r9, lsl #0x2
    ldr r0, [r1, #0x14]
    cmp r0, sl
    bne .L_e8
    ldr r0, [r8, #0x10]
    cmp r0, #0x0
    beq .L_a4
    mov r0, #0x3
    strb r0, [r8, #0x58]
    b .L_13c
.L_e8:
    ldr r2, [r1, #0x34]
    cmp r2, #0x0
    bne .L_108
    ldrh r1, [r8, #0x54]
    tst r1, r4, lsl r9
    bne .L_108
    bl func_0203a7fc
    mov r2, r0
.L_108:
    cmp r2, #0x0
    ldrnesb r1, [r2, #0x1d]
    cmpne r1, #0x1
    beq .L_130
    mvn r0, #0x0
    cmp r1, r0
    bne .L_13c
    mov r0, r8
    bl func_0203aa98
    b .L_13c
.L_130:
    add r9, r9, #0x1
    cmp r9, #0x8
    blt .L_c0
.L_13c:
    add r5, r5, #0x1
    cmp r5, #0x20
    add r8, r8, #0x5c
    blt .L_20
    cmp r7, #0x0
    bgt .L_174
    ldr r1, _LIT3
    mov r2, #0x0
    ldr r0, _LIT0
    strh r2, [r1]
    bl func_02092660
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_174:
    ldr r0, _LIT3
    mov r8, #0x0
    ldrh r0, [r0]
    mov r7, r8
    mov sl, r8
    bic r1, r0, #0x80
    ldr r0, _LIT3
    strh r1, [r0]
    mvn r5, #0x0
    mov fp, r5, lsl #0x9
    sub r4, r5, #0x29
.L_1a0:
    bl func_02038c04
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT3
    ldrh r0, [r0]
    tst r0, #0x80
    bne .L_3b0
    ldr r0, _LIT4
    mov r1, sl
    bl func_0207cef4
    movs sl, r0
    bne .L_1f8
    cmp r7, #0x0
    bne .L_3b0
    cmp r8, #0x0
    bne .L_1f0
    subs r6, r6, #0x1
    bmi .L_3b0
.L_1f0:
    mov r8, #0x0
    b .L_1a0
.L_1f8:
    ldrsb r1, [sl, #0x1d]
    cmp r1, #0x1
    beq .L_1a0
    ldrb r0, [sl, #0x1f]
    cmp r0, r6
    blt .L_1a0
    cmp r1, #0x2
    add r8, r8, #0x1
    beq .L_230
    cmp r1, #0x3
    beq .L_270
    cmp r1, #0x4
    beq .L_240
    b .L_1a0
.L_230:
    ldr r0, [sl, #0xc]
    str r0, [sl, #0x10]
    mov r0, #0x4
    strb r0, [sl, #0x1d]
.L_240:
    mov r0, sl
    bl func_02038cdc
    cmp r0, #0x0
    beq .L_1a0
    str r0, [sl, #0x8]
    str sl, [r0, #0x4]
    ldrb r1, [sl, #0x1f]
    strh r1, [r0, #0xa]
    mov r1, #0x1
    strh r1, [r0, #0x8]
    mov r0, #0x3
    strb r0, [sl, #0x1d]
.L_270:
    ldr r9, [sl, #0x8]
    cmp r9, #0x0
    bne .L_28c
    strb r5, [sl, #0x1d]
    mov r0, #0x0
    str r0, [sl, #0x8]
    b .L_1a0
.L_28c:
    ldrsh r0, [r9, #0x8]
    cmp r0, #0x1
    bne .L_338
    ldr r3, [sl, #0x10]
    ldr r0, [sl, #0xc]
    cmp r3, #0x0
    sub r1, r0, r3
    beq .L_338
    cmp r3, #0x200
    ble .L_2c0
    mov r3, #0x200
    cmp r1, #0x0
    moveq r3, fp
.L_2c0:
    ldr r0, _LIT5
    ldrh r0, [r0]
    rsb r0, r0, #0xb6
    cmp r0, r4
    addle r0, r0, #0x7
    addle r0, r0, #0x100
    cmp r0, #0x0
    bge .L_2fc
    mov r0, #0x4
    strb r0, [sl, #0x1d]
    ldr r1, [sl, #0x8]
    mov r0, #0x0
    str r0, [r1, #0x4]
    str r0, [sl, #0x8]
    b .L_338
.L_2fc:
    str r1, [sp]
    ldr r1, [sl, #0x18]
    mov r0, r9
    str r1, [sp, #0x4]
    ldr r1, [sl, #0x14]
    add r2, sl, #0x20
    bl func_02038e08
    cmp r0, #0x0
    strlth r5, [r9, #0x8]
    blt .L_338
    ldr r1, [sl, #0x10]
    sub r0, r1, r0
    str r0, [sl, #0x10]
    mov r0, #0x0
    strh r0, [r9, #0x8]
.L_338:
    ldrsh r1, [r9, #0x8]
    add r0, r1, #0x1
    cmp r0, #0x1
    bhi .L_1a0
    cmp r1, #0x0
    strneb r5, [sl, #0x1d]
    bne .L_39c
    mov r0, #0x4
    strb r0, [sl, #0x1d]
    ldr r0, [sl, #0x10]
    cmp r0, #0x0
    bne .L_39c
    mov r7, #0x1
    sub r8, r8, #0x1
    bl OS_DisableIrq
    mov r1, r7
    strb r1, [sl, #0x1d]
    mov r9, r0
    ldr r0, [sl, #0x14]
    tst r0, #0x8000000
    bne .L_394
    add r1, sl, #0x20
    bl func_02088f20
.L_394:
    mov r0, r9
    bl OS_RestoreIrq
.L_39c:
    ldr r1, [sl, #0x8]
    mov r0, #0x0
    str r0, [r1, #0x4]
    str r0, [sl, #0x8]
    b .L_1a0
.L_3b0:
    ldr r0, _LIT0
    bl func_02092660
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219b2a4
_LIT1: .word data_0219c408
_LIT2: .word 0x0000ffff
_LIT3: .word data_0219c3a0
_LIT4: .word data_0219c3b4
_LIT5: .word 0x04000006
