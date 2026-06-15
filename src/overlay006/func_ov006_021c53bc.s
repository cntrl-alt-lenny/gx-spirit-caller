; func_ov006_021c53bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov000_021b1d4c
        .extern data_ov006_0225deb4
        .extern func_02006110
        .extern func_02006164
        .extern func_0200617c
        .extern func_02006194
        .extern func_02037208
        .extern func_ov005_021aa4d0
        .extern func_ov006_021c5a5c
        .extern func_ov006_021c5df0
        .extern func_ov006_021c5f44
        .extern func_ov006_021c6104
        .extern func_ov006_021c63cc
        .extern func_ov006_021c6530
        .extern func_ov006_021c6840
        .extern func_ov006_021c6e40
        .extern func_ov006_021c6f40
        .extern func_ov006_021c6f7c
        .extern func_ov006_021c6f88
        .extern func_ov006_021c6f94
        .global func_ov006_021c53bc
        .arm
func_ov006_021c53bc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x24
    ldr r1, _LIT0
    mov r8, #0x0
    ldrh r5, [r1, #0x54]
    ldrh r6, [r1, #0x56]
    mov r4, r0
    sub r0, r8, #0x1
    str r0, [r4, #0x68]
    ldr r0, [r4, #0x50]
    ldr r7, _LIT1
    cmp r0, #0x0
    beq .L_6d0
    bl func_02006194
    cmp r0, #0x0
    bne .L_150
    bl func_0200617c
    cmp r0, #0x0
    beq .L_3bc
.L_150:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
    ldr r0, [r4, #0x4c]
    add r1, r4, #0x6c
    add r5, r1, r0, lsl #0x4
    ldr r0, [r5, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_1ac
    mov r0, r7
    ldr r6, [r5, #0x4]
    bl func_ov005_021aa4d0
    ldr r0, [r7, #0x4]
    str r0, [r5, #0x4]
    ldr r0, [r7, #0x10]
    str r0, [r5]
    ldr r0, [r5, #0x4]
    cmp r0, r6
    ldr r0, [r7, #0x18]
    movne r8, #0x1
    cmp r0, #0x0
    bne .L_6d0
.L_1ac:
    ldr r1, [sp, #0x4]
    ldr r2, [sp]
    add r3, sp, #0x18
    mov r0, r4
    bl func_ov006_021c6530
    bl func_02006164
    cmp r0, #0x0
    beq .L_200
    ldr r0, [sp, #0x18]
    str r0, [r4, #0x58]
    ldr r1, [sp, #0x1c]
    ldr r0, [sp, #0x20]
    str r1, [r4, #0x5c]
    str r0, [r4, #0x60]
    ldr r0, [r4, #0x4c]
    add r0, r4, r0, lsl #0x4
    ldr r1, [r0, #0x70]
    ldr r0, [r0, #0x6c]
    add r0, r1, r0
    str r0, [r4, #0x64]
    b .L_368
.L_200:
    bl func_0200617c
    cmp r0, #0x0
    beq .L_368
    ldr r9, [sp, #0x18]
    ldr r0, [r4, #0x58]
    mov r6, #0x0
    cmp r9, r0
    bne .L_23c
    ldr r3, [sp, #0x1c]
    ldr r2, [sp, #0x20]
    ldr r0, [r4, #0x60]
    ldr r1, [r4, #0x5c]
    cmp r2, r0
    cmpeq r3, r1
    moveq r6, #0x1
.L_23c:
    cmp r6, #0x0
    beq .L_368
    cmp r9, #0x1
    bne .L_328
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_26c
    cmp r0, #0x1
    beq .L_294
    cmp r0, #0x2
    beq .L_308
    b .L_368
.L_26c:
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x0
    str r0, [r4, #0x44]
    add sp, sp, #0x24
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_294:
    ldr r1, [r4, #0x4c]
    ldr r0, [r4, #0x22c]
    add r1, r4, r1, lsl #0x4
    ldr r2, [r1, #0x70]
    ldr r1, [r1, #0x6c]
    mov r3, #0x1
    add r1, r2, r1
    cmp r1, r0
    mov r2, #0x0
    bge .L_2f8
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_02037208
    mov r0, #0x1
    str r0, [r4, #0x44]
    ldr r1, [r4, #0x4c]
    add sp, sp, #0x24
    add r1, r4, r1, lsl #0x4
    ldr r2, [r1, #0x70]
    ldr r1, [r1, #0x6c]
    add r1, r2, r1
    add r1, r4, r1, lsl #0x4
    ldr r1, [r1, #0x7c]
    str r1, [r4, #0x48]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_2f8:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_02037208
    b .L_368
.L_308:
    mov r0, #0x35
    sub r1, r0, #0x36
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r0, _LIT2
    bl func_ov006_021c6f40
    b .L_368
.L_328:
    cmp r9, #0x2
    bne .L_368
    ldr r0, [r4, #0x4c]
    ldr r2, [r4, #0x64]
    add r0, r4, r0, lsl #0x4
    ldr r1, [r0, #0x70]
    ldr r0, [r0, #0x6c]
    add r0, r1, r0
    cmp r2, r0
    bne .L_368
    mov r0, r4
    bl func_ov006_021c5a5c
    cmp r0, #0x0
    addne sp, sp, #0x24
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_368:
    ldr r0, [sp, #0x18]
    cmp r0, #0x1
    beq .L_380
    cmp r0, #0x2
    beq .L_38c
    b .L_6d0
.L_380:
    ldr r0, [sp, #0x1c]
    str r0, [r4, #0x68]
    b .L_6d0
.L_38c:
    ldr r1, [sp, #0x1c]
    ldr r0, [r5]
    cmp r1, r0
    beq .L_3b0
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_3b0:
    ldr r0, [sp, #0x1c]
    str r0, [r5]
    b .L_6d0
.L_3bc:
    tst r5, #0x2
    beq .L_3ec
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, r8
    mov r3, #0x1
    bl func_02037208
    mov r0, r8
    str r0, [r4, #0x44]
    add sp, sp, #0x24
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_3ec:
    ldr r0, _LIT3
    tst r5, r0
    beq .L_470
    ldr r1, [r4, #0x4c]
    ldr r0, [r4, #0x22c]
    add r1, r4, r1, lsl #0x4
    ldr r2, [r1, #0x70]
    ldr r1, [r1, #0x6c]
    mov r3, #0x1
    add r1, r2, r1
    cmp r1, r0
    bge .L_45c
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, r8
    bl func_02037208
    mov r0, #0x1
    str r0, [r4, #0x44]
    ldr r1, [r4, #0x4c]
    add sp, sp, #0x24
    add r1, r4, r1, lsl #0x4
    ldr r2, [r1, #0x70]
    ldr r1, [r1, #0x6c]
    add r1, r2, r1
    add r1, r4, r1, lsl #0x4
    ldr r1, [r1, #0x7c]
    str r1, [r4, #0x48]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_45c:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, r8
    bl func_02037208
    b .L_6d0
.L_470:
    tst r6, #0xf0
    beq .L_6d0
    ldr r0, [r4, #0x4c]
    add r1, r4, #0x6c
    add r9, r1, r0, lsl #0x4
    add r8, sp, #0x8
    ldmia r9, {r0, r1, r2, r3}
    stmia r8, {r0, r1, r2, r3}
    mov r0, r4
    bl func_ov006_021c63cc
    mov r8, r0
    tst r6, #0x40
    beq .L_544
    ldr r0, [r9, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_51c
    ldr r0, [r9, #0x4]
    cmp r0, #0x0
    ldreq r0, [r9]
    cmpeq r0, #0x0
    bne .L_4d0
    tst r5, #0x40
    beq .L_6a0
.L_4d0:
    ldr r0, [r9]
    subs r0, r0, #0x1
    str r0, [r9]
    bpl .L_6a0
    ldr r0, [r9, #0x4]
    cmp r0, #0x0
    bne .L_500
    ldr r1, [r9, #0x8]
    mov r0, #0x5
    sub r1, r1, #0x6
    stmia r9, {r0, r1}
    b .L_514
.L_500:
    sub r0, r0, #0x1
    str r0, [r9, #0x4]
    ldr r0, [r9]
    add r0, r0, #0x1
    str r0, [r9]
.L_514:
    mov r8, #0x1
    b .L_6a0
.L_51c:
    ldr r0, [r9]
    subs r0, r0, #0x1
    str r0, [r9]
    bpl .L_6a0
    ldr r0, [r9, #0x8]
    cmp r0, #0x0
    moveq r0, #0x0
    subne r0, r0, #0x1
    str r0, [r9]
    b .L_6a0
.L_544:
    tst r6, #0x80
    beq .L_5f0
    ldr r0, [r9, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_5d0
    ldr r0, [r9, #0x8]
    ldr r1, [r9, #0x4]
    sub r0, r0, #0x6
    cmp r1, r0
    blt .L_584
    ldr r0, [r9]
    cmp r0, #0x5
    bne .L_584
    tst r5, #0x80
    beq .L_6a0
.L_584:
    ldr r0, [r9]
    add r0, r0, #0x1
    str r0, [r9]
    cmp r0, #0x6
    blt .L_6a0
    ldr r0, [r9, #0x8]
    ldr r1, [r9, #0x4]
    sub r0, r0, #0x6
    cmp r1, r0
    movge r0, #0x0
    strge r0, [r9, #0x4]
    bge .L_5c4
    add r0, r1, #0x1
    str r0, [r9, #0x4]
    ldr r0, [r9]
    sub r0, r0, #0x1
.L_5c4:
    str r0, [r9]
    mov r8, #0x1
    b .L_6a0
.L_5d0:
    ldr r0, [r9]
    add r1, r0, #0x1
    str r1, [r9]
    ldr r0, [r9, #0x8]
    cmp r1, r0
    movge r0, #0x0
    strge r0, [r9]
    b .L_6a0
.L_5f0:
    tst r6, #0x20
    beq .L_63c
    ldr r0, [r9, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    moveq r0, #0x0
    streq r0, [r9]
    beq .L_6a0
    ldr r0, [r9, #0x4]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r9]
    beq .L_6a0
    subs r0, r0, #0x6
    str r0, [r9, #0x4]
    movmi r0, #0x0
    strmi r0, [r9, #0x4]
    mov r8, #0x1
    b .L_6a0
.L_63c:
    tst r6, #0x10
    beq .L_6a0
    ldr r0, [r9, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldr r0, [r9, #0x8]
    bne .L_66c
    cmp r0, #0x0
    moveq r0, #0x0
    subne r0, r0, #0x1
    str r0, [r9]
    b .L_6a0
.L_66c:
    ldr r1, [r9, #0x4]
    sub r0, r0, #0x6
    cmp r1, r0
    movge r0, #0x5
    strge r0, [r9]
    bge .L_6a0
    add r1, r1, #0x6
    str r1, [r9, #0x4]
    ldr r0, [r9, #0x8]
    mov r8, #0x1
    sub r0, r0, #0x6
    cmp r1, r0
    strge r0, [r9, #0x4]
.L_6a0:
    ldr r1, [r9]
    ldr r0, [sp, #0x8]
    cmp r1, r0
    ldreq r1, [r9, #0x4]
    ldreq r0, [sp, #0xc]
    cmpeq r1, r0
    beq .L_6d0
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_6d0:
    ldr r3, [r4, #0x4c]
    add r2, r4, #0x6c
    add r0, r4, r3, lsl #0x4
    ldr r1, [r0, #0x70]
    ldr r0, [r0, #0x6c]
    add r6, r4, #0x7c
    add r5, r1, r0
    add r9, r6, r5, lsl #0x4
    ldr r1, [r9, #0x4]
    ldr r0, _LIT2
    add sl, r2, r3, lsl #0x4
    bl func_ov006_021c6f7c
    ldr r1, [r9, #0x8]
    ldr r0, _LIT2
    bl func_ov006_021c6f88
    ldr r0, [r6, r5, lsl #0x4]
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, _LIT2
    movne r1, #0x0
    bl func_ov006_021c6f94
    ldr r1, [r9]
    ldr r0, _LIT2
    mov r2, #0x0
    bl func_ov006_021c6e40
    ldr r0, [sl, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_760
    ldr r0, [sl, #0x4]
    str r0, [r7, #0x4]
    ldr r0, [sl, #0x8]
    sub r0, r0, #0x6
    str r0, [r7, #0x8]
    ldr r0, [sl]
    str r0, [r7, #0x10]
.L_760:
    mov r0, r4
    bl func_ov006_021c5df0
    mov r0, r4
    bl func_ov006_021c5f44
    mov r0, r4
    bl func_ov006_021c6104
    cmp r8, #0x0
    beq .L_788
    mov r0, r4
    bl func_ov006_021c6840
.L_788:
    mov r0, #0x0
    add sp, sp, #0x24
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_02104bac
_LIT1: .word data_ov000_021b1d4c
_LIT2: .word data_ov006_0225deb4
_LIT3: .word 0x00000401
