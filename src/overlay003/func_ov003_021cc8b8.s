; func_ov003_021cc8b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104bac
        .extern data_02104cec
        .extern data_ov003_021cf1b8
        .extern data_ov003_021cf6c0
        .extern func_020061ac
        .extern func_02034784
        .extern func_02034844
        .extern func_02037208
        .extern func_ov003_021cefec
        .extern func_ov003_021cf064
        .global func_ov003_021cc8b8
        .arm
func_ov003_021cc8b8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldr r1, [r1, #0xc3c]
    mov r5, r0
    ldr r0, [r2, r1, lsl #0x2]
    ldr r4, _LIT2
    cmp r0, #0x1
    bne .L_2640
    bl func_02034844
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r4, #0x44]
    str r0, [r5, #0x10]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2640:
    bl func_02034784
    cmp r0, #0x2
    bne .L_2670
    ldr r0, [r5, #0xc]
    add r0, r0, #0x1
    str r0, [r5, #0xc]
    cmp r0, #0x258
    blt .L_2670
    ldr r1, [r5, #0x10]
    mov r0, #0x1
    str r1, [r4, #0x44]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2670:
    ldr r0, _LIT3
    ldrh r1, [r0, #0x52]
    cmp r1, #0x0
    beq .L_270c
    ldrh r1, [r0, #0x56]
    tst r1, #0x10
    beq .L_26bc
    ldr r0, [r5, #0x10]
    mov r2, #0x0
    add r0, r0, #0x1
    str r0, [r5, #0x10]
    cmp r0, #0x2
    movgt r0, #0x0
    strgt r0, [r5, #0x10]
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r3, #0x1
    bl func_02037208
    b .L_27b0
.L_26bc:
    tst r1, #0x20
    beq .L_26f0
    ldr r0, [r5, #0x10]
    mov r2, #0x0
    subs r0, r0, #0x1
    str r0, [r5, #0x10]
    movmi r0, #0x2
    strmi r0, [r5, #0x10]
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r3, #0x1
    bl func_02037208
    b .L_27b0
.L_26f0:
    ldrh r0, [r0, #0x54]
    tst r0, #0x1
    beq .L_27b0
    ldr r1, [r5, #0x10]
    mov r0, #0x1
    str r1, [r4, #0x44]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_270c:
    bl func_020061ac
    cmp r0, #0x0
    beq .L_2774
    ldr r6, _LIT4
    mov r4, #0x0
.L_2720:
    mov r0, r5
    mov r1, r6
    bl func_ov003_021cefec
    cmp r0, #0x0
    ldrne r0, [r5, #0x10]
    cmpne r0, r4
    beq .L_275c
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r5, #0x10]
    bl func_02037208
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_275c:
    add r4, r4, #0x1
    cmp r4, #0x3
    add r6, r6, #0x6
    blt .L_2720
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2774:
    ldr r7, _LIT4
    mov r6, #0x0
.L_277c:
    mov r0, r5
    mov r1, r7
    bl func_ov003_021cf064
    cmp r0, #0x0
    beq .L_27a0
    ldr r1, [r5, #0x10]
    mov r0, #0x1
    str r1, [r4, #0x44]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_27a0:
    add r6, r6, #0x1
    cmp r6, #0x3
    add r7, r7, #0x6
    blt .L_277c
.L_27b0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_02104cec
_LIT2: .word data_ov003_021cf6c0
_LIT3: .word data_02104bac
_LIT4: .word data_ov003_021cf1b8
