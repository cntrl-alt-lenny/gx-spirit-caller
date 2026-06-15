; func_02037dc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2e0
        .extern data_0219b760
        .extern func_02037b58
        .extern func_02037d28
        .global func_02037dc0
        .arm
func_02037dc0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub r3, r0, #0x8f00000
    ldr r4, _LIT0
    mov r7, r1
    mov r6, r2
    cmp r3, #0x5
    addls pc, pc, r3, lsl #0x2
    b .L_318
    b .L_158
    b .L_19c
    b .L_1e8
    b .L_234
    b .L_278
    b .L_2b0
.L_158:
    mov r5, #0x0
.L_15c:
    ldrsb r0, [r4, #0x6a]
    cmp r0, #0x0
    blt .L_184
    ldr r0, [r4, #0x34]
    tst r0, #0x1000000
    bne .L_184
    mov r0, r4
    mov r1, r7
    mov r2, r6
    bl func_02037d28
.L_184:
    add r5, r5, #0x1
    cmp r5, #0x1c
    add r4, r4, #0x78
    blt .L_15c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_19c:
    mov r5, #0x0
.L_1a0:
    ldrsb r0, [r4, #0x6a]
    cmp r0, #0x0
    blt .L_1d0
    ldr r0, [r4, #0x34]
    tst r0, #0x1000000
    beq .L_1d0
    tst r0, #0x2000000
    bne .L_1d0
    mov r0, r4
    mov r1, r7
    mov r2, r6
    bl func_02037d28
.L_1d0:
    add r5, r5, #0x1
    cmp r5, #0x1c
    add r4, r4, #0x78
    blt .L_1a0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1e8:
    mov r5, #0x0
.L_1ec:
    ldrsb r0, [r4, #0x6a]
    cmp r0, #0x0
    blt .L_21c
    ldr r0, [r4, #0x34]
    tst r0, #0x1000000
    beq .L_21c
    tst r0, #0x2000000
    beq .L_21c
    mov r0, r4
    mov r1, r7
    mov r2, r6
    bl func_02037d28
.L_21c:
    add r5, r5, #0x1
    cmp r5, #0x1c
    add r4, r4, #0x78
    blt .L_1ec
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_234:
    mov r5, #0x0
.L_238:
    ldrsb r0, [r4, #0x6a]
    cmp r0, #0x0
    blt .L_260
    ldr r0, [r4, #0x34]
    tst r0, #0x1000000
    beq .L_260
    mov r0, r4
    mov r1, r7
    mov r2, r6
    bl func_02037d28
.L_260:
    add r5, r5, #0x1
    cmp r5, #0x1c
    add r4, r4, #0x78
    blt .L_238
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_278:
    mov r5, #0x0
.L_27c:
    ldrsb r0, [r4, #0x6a]
    cmp r0, #0x0
    blt .L_298
    mov r0, r4
    mov r1, r7
    mov r2, r6
    bl func_02037d28
.L_298:
    add r5, r5, #0x1
    cmp r5, #0x1c
    add r4, r4, #0x78
    blt .L_27c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2b0:
    ldr r9, _LIT1
    mov r5, #0x0
    mov r8, #0xc
.L_2bc:
    ldrsb r0, [r4, #0x6a]
    cmp r0, #0x0
    blt .L_300
    ldr r0, [r4, #0x34]
    tst r0, #0x1000000
    beq .L_300
    mov r0, r0, lsl #0x10
    ldr r2, [r9, #0x34]
    mov r1, r0, lsr #0x10
    mla r0, r1, r8, r2
    ldrb r0, [r0, #0x7]
    tst r0, #0x80
    beq .L_300
    mov r0, r4
    mov r1, r7
    mov r2, r6
    bl func_02037d28
.L_300:
    add r5, r5, #0x1
    cmp r5, #0x1c
    add r4, r4, #0x78
    blt .L_2bc
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_318:
    bl func_02037b58
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r1, r7
    mov r2, r6
    bl func_02037d28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_0219b760
_LIT1: .word data_0219b2e0
