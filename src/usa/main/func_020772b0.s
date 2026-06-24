; func_020772b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101e20
        .extern func_020772b0
        .extern func_020777dc
        .extern func_0207786c
        .extern func_020778f0
        .extern func_02094688
        .extern func_020a734c
        .extern func_020aace8
        .global func_020772b0
        .arm
func_020772b0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    str r1, [sp, #0x4]
    ldr r1, [r1]
    mov r9, r0
    str r1, [sp, #0x8]
    add r0, r1, #0x1
    str r0, [sp, #0x8]
    add r0, sp, #0x8
    mov r5, r2
    mov r4, r3
    ldr r8, [sp, #0x30]
    ldrb r6, [r1]
    bl func_020778f0
    movs r7, r0
    bmi .L_48
    cmp r7, #0x7d0
    ble .L_58
.L_48:
    add sp, sp, #0xc
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_58:
    and r1, r6, #0x1f
    cmp r1, #0x18
    addls pc, pc, r1, lsl #0x2
    b .L_498
    b .L_498
    b .L_498
    b .L_cc
    b .L_1c4
    b .L_498
    b .L_498
    b .L_244
    b .L_498
    b .L_498
    b .L_498
    b .L_498
    b .L_498
    b .L_2dc
    b .L_498
    b .L_498
    b .L_498
    b .L_3b0
    b .L_440
    b .L_498
    b .L_2dc
    b .L_2dc
    b .L_498
    b .L_2dc
    b .L_35c
    b .L_35c
.L_cc:
    ldrb r0, [r9, #0x5ad]
    cmp r0, #0x0
    beq .L_1b4
    cmp r4, #0x0
    bne .L_148
    ldr r0, [sp, #0x8]
    ldrb r1, [r0]
    cmp r1, #0x0
    bne .L_10c
.L_f0:
    ldr r1, [sp, #0x8]
    sub r7, r7, #0x1
    add r0, r1, #0x1
    str r0, [sp, #0x8]
    ldrb r1, [r1, #0x1]
    cmp r1, #0x0
    beq .L_f0
.L_10c:
    cmp r8, #0x0
    beq .L_128
    cmp r8, #0x2
    streq r7, [r9, #0x484]
    ldreq r0, [sp, #0x8]
    streq r0, [r9, #0x488]
    b .L_1b4
.L_128:
    cmp r7, #0x100
    bgt .L_1b4
    ldr r1, _LIT0
    mov r2, r7
    add r1, r9, r1
    bl func_02094688
    str r7, [r9, #0x594]
    b .L_1b4
.L_148:
    cmp r4, #0x1
    bne .L_1b4
    ldr r0, [sp, #0x8]
    ldrb r1, [r0]
    cmp r1, #0x0
    bne .L_17c
.L_160:
    ldr r1, [sp, #0x8]
    sub r7, r7, #0x1
    add r0, r1, #0x1
    str r0, [sp, #0x8]
    ldrb r1, [r1, #0x1]
    cmp r1, #0x0
    beq .L_160
.L_17c:
    cmp r8, #0x0
    beq .L_198
    cmp r8, #0x2
    streq r7, [r9, #0x48c]
    ldreq r0, [sp, #0x8]
    streq r0, [r9, #0x490]
    b .L_1b4
.L_198:
    cmp r7, #0x8
    bgt .L_1b4
    ldr r1, _LIT1
    mov r2, r7
    add r1, r9, r1
    bl func_02094688
    str r7, [r9, #0x5a0]
.L_1b4:
    ldr r0, [sp, #0x8]
    add r0, r0, r7
    str r0, [sp, #0x8]
    b .L_504
.L_1c4:
    cmp r5, #0x1
    bne .L_1e4
    cmp r8, #0x2
    ldrne r1, [sp, #0x8]
    subne r0, r7, #0x1
    addne r1, r1, #0x1
    strne r1, [r9, #0x5a4]
    strne r0, [r9, #0x5a8]
.L_1e4:
    ldrb r0, [r9, #0x5ad]
    cmp r0, #0x0
    beq .L_234
    ldr r0, [sp, #0x8]
    add r1, sp, #0x8
    add r0, r0, #0x1
    str r0, [sp, #0x8]
    mov r0, r9
    mov r2, r5
    mov r3, #0x0
    str r8, [sp]
    bl func_020772b0
    cmp r0, #0x0
    addne sp, sp, #0xc
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxne lr
    mov r0, #0x0
    strb r0, [r9, #0x5ad]
    b .L_504
.L_234:
    ldr r0, [sp, #0x8]
    add r0, r0, r7
    str r0, [sp, #0x8]
    b .L_504
.L_244:
    ldr r5, [sp, #0x8]
    mov r6, #0x0
    ldr sl, _LIT2
.L_250:
    ldr r4, [sl, r6, lsl #0x2]
    mov r0, r4
    bl func_020aace8
    mov r2, r0
    mov r0, r5
    mov r1, r4
    bl func_020a734c
    cmp r0, #0x0
    bne .L_2c0
    cmp r6, #0x5
    addls pc, pc, r6, lsl #0x2
    b .L_2cc
    b .L_2cc
    b .L_298
    b .L_298
    b .L_2a8
    b .L_2a8
    b .L_2b4
.L_298:
    cmp r8, #0x0
    streq r6, [r9, #0x45c]
    strb r6, [r9, #0x5ad]
    b .L_2cc
.L_2a8:
    cmp r8, #0x2
    strne r6, [r9, #0x458]
    b .L_2cc
.L_2b4:
    cmp r8, #0x2
    strneb r6, [r9, #0x5ae]
    b .L_2cc
.L_2c0:
    add r6, r6, #0x1
    cmp r6, #0x6
    blt .L_250
.L_2cc:
    ldr r0, [sp, #0x8]
    add r0, r0, r7
    str r0, [sp, #0x8]
    b .L_504
.L_2dc:
    cmp r8, #0x2
    beq .L_344
    ldrb r0, [r9, #0x5ac]
    cmp r0, #0x0
    beq .L_334
    ldr r1, [sp, #0x8]
    mov r2, r7
    add r0, r9, #0x6b0
    bl func_0207786c
    ldrb r0, [r9, #0x5ae]
    cmp r0, #0x5
    bne .L_344
    cmp r7, #0x4f
    bgt .L_344
    ldr r0, [sp, #0x8]
    mov r2, r7
    add r1, r9, #0x7b0
    bl func_02094688
    add r0, r9, r7
    mov r1, #0x0
    strb r1, [r0, #0x7b0]
    b .L_344
.L_334:
    ldr r1, [sp, #0x8]
    mov r2, r7
    add r0, r9, #0x5b0
    bl func_0207786c
.L_344:
    mov r0, #0x0
    strb r0, [r9, #0x5ae]
    ldr r0, [sp, #0x8]
    add r0, r0, r7
    str r0, [sp, #0x8]
    b .L_504
.L_35c:
    cmp r8, #0x2
    beq .L_398
    ldr r0, [sp, #0x8]
    bl func_020777dc
    cmp r4, #0x0
    bne .L_388
    ldr r1, [r9, #0x80c]
    cmp r1, r0
    movcs r0, #0x1
    strcsb r0, [r9, #0x5af]
    b .L_398
.L_388:
    ldr r1, [r9, #0x80c]
    cmp r1, r0
    movhi r0, #0x0
    strhib r0, [r9, #0x5af]
.L_398:
    ldr r1, [sp, #0x8]
    mov r0, #0x1
    add r1, r1, r7
    str r1, [sp, #0x8]
    strb r0, [r9, #0x5ac]
    b .L_504
.L_3b0:
    cmp r5, #0x0
    bne .L_3cc
    cmp r4, #0x0
    bne .L_3cc
    cmp r8, #0x2
    ldrne r0, [sp, #0x8]
    strne r0, [r9, #0x460]
.L_3cc:
    ldr r0, [sp, #0x8]
    mov sl, #0x0
    add r7, r0, r7
    cmp r0, r7
    bcs .L_424
    add fp, sp, #0x8
    add r6, r5, #0x1
.L_3e8:
    mov r0, r9
    mov r1, fp
    mov r2, r6
    mov r3, sl
    str r8, [sp]
    bl func_020772b0
    cmp r0, #0x0
    add sl, sl, #0x1
    addne sp, sp, #0xc
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxne lr
    ldr r0, [sp, #0x8]
    cmp r0, r7
    bcc .L_3e8
.L_424:
    cmp r5, #0x1
    bne .L_504
    cmp r4, #0x0
    bne .L_504
    cmp r8, #0x2
    strne r0, [r9, #0x464]
    b .L_504
.L_440:
    ldr r0, [sp, #0x8]
    add r6, r0, r7
    cmp r0, r6
    bcs .L_504
    add r7, r5, #0x1
    add r4, sp, #0x8
    mov r5, #0x0
.L_45c:
    mov r0, r9
    mov r1, r4
    mov r2, r7
    mov r3, r5
    str r8, [sp]
    bl func_020772b0
    cmp r0, #0x0
    addne sp, sp, #0xc
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxne lr
    ldr r0, [sp, #0x8]
    cmp r0, r6
    bcc .L_45c
    b .L_504
.L_498:
    cmp r6, #0xa0
    bne .L_4f8
    ldr r0, [sp, #0x8]
    add r6, r0, r7
    cmp r0, r6
    bcs .L_504
    add r7, r5, #0x1
    add r4, sp, #0x8
    mov r5, #0x0
.L_4bc:
    mov r0, r9
    mov r1, r4
    mov r2, r7
    mov r3, r5
    str r8, [sp]
    bl func_020772b0
    cmp r0, #0x0
    addne sp, sp, #0xc
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxne lr
    ldr r0, [sp, #0x8]
    cmp r0, r6
    bcc .L_4bc
    b .L_504
.L_4f8:
    ldr r0, [sp, #0x8]
    add r0, r0, r7
    str r0, [sp, #0x8]
.L_504:
    ldr r2, [sp, #0x8]
    ldr r1, [sp, #0x4]
    mov r0, #0x0
    str r2, [r1]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word 0x00000494
_LIT1: .word 0x00000598
_LIT2: .word data_02101e20
