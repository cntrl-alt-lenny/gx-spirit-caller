; func_ov006_021c52b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov000_021b1c4c
        .extern data_ov006_0225dd94
        .extern func_020060f4
        .extern func_02006148
        .extern func_02006160
        .extern func_02006178
        .extern func_020371b8
        .extern func_ov005_021aa3f0
        .extern func_ov006_021c5950
        .extern func_ov006_021c5ce4
        .extern func_ov006_021c5e38
        .extern func_ov006_021c5ff8
        .extern func_ov006_021c62c0
        .extern func_ov006_021c6424
        .extern func_ov006_021c6734
        .extern func_ov006_021c6d34
        .extern func_ov006_021c6e34
        .extern func_ov006_021c6e70
        .extern func_ov006_021c6e7c
        .extern func_ov006_021c6e88
        .global func_ov006_021c52b0
        .arm
func_ov006_021c52b0:
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
    beq .L_5cc
    bl func_02006178
    cmp r0, #0x0
    bne .L_4c
    bl func_02006160
    cmp r0, #0x0
    beq .L_2b8
.L_4c:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_020060f4
    ldr r0, [r4, #0x4c]
    add r1, r4, #0x6c
    add r5, r1, r0, lsl #0x4
    ldr r0, [r5, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_a8
    mov r0, r7
    ldr r6, [r5, #0x4]
    bl func_ov005_021aa3f0
    ldr r0, [r7, #0x4]
    str r0, [r5, #0x4]
    ldr r0, [r7, #0x10]
    str r0, [r5]
    ldr r0, [r5, #0x4]
    cmp r0, r6
    ldr r0, [r7, #0x18]
    movne r8, #0x1
    cmp r0, #0x0
    bne .L_5cc
.L_a8:
    ldr r1, [sp, #0x4]
    ldr r2, [sp]
    add r3, sp, #0x18
    mov r0, r4
    bl func_ov006_021c6424
    bl func_02006148
    cmp r0, #0x0
    beq .L_fc
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
    b .L_264
.L_fc:
    bl func_02006160
    cmp r0, #0x0
    beq .L_264
    ldr r9, [sp, #0x18]
    ldr r0, [r4, #0x58]
    mov r6, #0x0
    cmp r9, r0
    bne .L_138
    ldr r3, [sp, #0x1c]
    ldr r2, [sp, #0x20]
    ldr r0, [r4, #0x60]
    ldr r1, [r4, #0x5c]
    cmp r2, r0
    cmpeq r3, r1
    moveq r6, #0x1
.L_138:
    cmp r6, #0x0
    beq .L_264
    cmp r9, #0x1
    bne .L_224
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_168
    cmp r0, #0x1
    beq .L_190
    cmp r0, #0x2
    beq .L_204
    b .L_264
.L_168:
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x0
    str r0, [r4, #0x44]
    add sp, sp, #0x24
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_190:
    ldr r1, [r4, #0x4c]
    ldr r0, [r4, #0x22c]
    add r1, r4, r1, lsl #0x4
    ldr r2, [r1, #0x70]
    ldr r1, [r1, #0x6c]
    mov r3, #0x1
    add r1, r2, r1
    cmp r1, r0
    mov r2, #0x0
    bge .L_1f4
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
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
.L_1f4:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_020371b8
    b .L_264
.L_204:
    mov r0, #0x35
    sub r1, r0, #0x36
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, _LIT2
    bl func_ov006_021c6e34
    b .L_264
.L_224:
    cmp r9, #0x2
    bne .L_264
    ldr r0, [r4, #0x4c]
    ldr r2, [r4, #0x64]
    add r0, r4, r0, lsl #0x4
    ldr r1, [r0, #0x70]
    ldr r0, [r0, #0x6c]
    add r0, r1, r0
    cmp r2, r0
    bne .L_264
    mov r0, r4
    bl func_ov006_021c5950
    cmp r0, #0x0
    addne sp, sp, #0x24
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_264:
    ldr r0, [sp, #0x18]
    cmp r0, #0x1
    beq .L_27c
    cmp r0, #0x2
    beq .L_288
    b .L_5cc
.L_27c:
    ldr r0, [sp, #0x1c]
    str r0, [r4, #0x68]
    b .L_5cc
.L_288:
    ldr r1, [sp, #0x1c]
    ldr r0, [r5]
    cmp r1, r0
    beq .L_2ac
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_2ac:
    ldr r0, [sp, #0x1c]
    str r0, [r5]
    b .L_5cc
.L_2b8:
    tst r5, #0x2
    beq .L_2e8
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, r8
    mov r3, #0x1
    bl func_020371b8
    mov r0, r8
    str r0, [r4, #0x44]
    add sp, sp, #0x24
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_2e8:
    ldr r0, _LIT3
    tst r5, r0
    beq .L_36c
    ldr r1, [r4, #0x4c]
    ldr r0, [r4, #0x22c]
    add r1, r4, r1, lsl #0x4
    ldr r2, [r1, #0x70]
    ldr r1, [r1, #0x6c]
    mov r3, #0x1
    add r1, r2, r1
    cmp r1, r0
    bge .L_358
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, r8
    bl func_020371b8
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
.L_358:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, r8
    bl func_020371b8
    b .L_5cc
.L_36c:
    tst r6, #0xf0
    beq .L_5cc
    ldr r0, [r4, #0x4c]
    add r1, r4, #0x6c
    add r9, r1, r0, lsl #0x4
    add r8, sp, #0x8
    ldmia r9, {r0, r1, r2, r3}
    stmia r8, {r0, r1, r2, r3}
    mov r0, r4
    bl func_ov006_021c62c0
    mov r8, r0
    tst r6, #0x40
    beq .L_440
    ldr r0, [r9, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_418
    ldr r0, [r9, #0x4]
    cmp r0, #0x0
    ldreq r0, [r9]
    cmpeq r0, #0x0
    bne .L_3cc
    tst r5, #0x40
    beq .L_59c
.L_3cc:
    ldr r0, [r9]
    subs r0, r0, #0x1
    str r0, [r9]
    bpl .L_59c
    ldr r0, [r9, #0x4]
    cmp r0, #0x0
    bne .L_3fc
    ldr r1, [r9, #0x8]
    mov r0, #0x5
    sub r1, r1, #0x6
    stmia r9, {r0, r1}
    b .L_410
.L_3fc:
    sub r0, r0, #0x1
    str r0, [r9, #0x4]
    ldr r0, [r9]
    add r0, r0, #0x1
    str r0, [r9]
.L_410:
    mov r8, #0x1
    b .L_59c
.L_418:
    ldr r0, [r9]
    subs r0, r0, #0x1
    str r0, [r9]
    bpl .L_59c
    ldr r0, [r9, #0x8]
    cmp r0, #0x0
    moveq r0, #0x0
    subne r0, r0, #0x1
    str r0, [r9]
    b .L_59c
.L_440:
    tst r6, #0x80
    beq .L_4ec
    ldr r0, [r9, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_4cc
    ldr r0, [r9, #0x8]
    ldr r1, [r9, #0x4]
    sub r0, r0, #0x6
    cmp r1, r0
    blt .L_480
    ldr r0, [r9]
    cmp r0, #0x5
    bne .L_480
    tst r5, #0x80
    beq .L_59c
.L_480:
    ldr r0, [r9]
    add r0, r0, #0x1
    str r0, [r9]
    cmp r0, #0x6
    blt .L_59c
    ldr r0, [r9, #0x8]
    ldr r1, [r9, #0x4]
    sub r0, r0, #0x6
    cmp r1, r0
    movge r0, #0x0
    strge r0, [r9, #0x4]
    bge .L_4c0
    add r0, r1, #0x1
    str r0, [r9, #0x4]
    ldr r0, [r9]
    sub r0, r0, #0x1
.L_4c0:
    str r0, [r9]
    mov r8, #0x1
    b .L_59c
.L_4cc:
    ldr r0, [r9]
    add r1, r0, #0x1
    str r1, [r9]
    ldr r0, [r9, #0x8]
    cmp r1, r0
    movge r0, #0x0
    strge r0, [r9]
    b .L_59c
.L_4ec:
    tst r6, #0x20
    beq .L_538
    ldr r0, [r9, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    moveq r0, #0x0
    streq r0, [r9]
    beq .L_59c
    ldr r0, [r9, #0x4]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r9]
    beq .L_59c
    subs r0, r0, #0x6
    str r0, [r9, #0x4]
    movmi r0, #0x0
    strmi r0, [r9, #0x4]
    mov r8, #0x1
    b .L_59c
.L_538:
    tst r6, #0x10
    beq .L_59c
    ldr r0, [r9, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldr r0, [r9, #0x8]
    bne .L_568
    cmp r0, #0x0
    moveq r0, #0x0
    subne r0, r0, #0x1
    str r0, [r9]
    b .L_59c
.L_568:
    ldr r1, [r9, #0x4]
    sub r0, r0, #0x6
    cmp r1, r0
    movge r0, #0x5
    strge r0, [r9]
    bge .L_59c
    add r1, r1, #0x6
    str r1, [r9, #0x4]
    ldr r0, [r9, #0x8]
    mov r8, #0x1
    sub r0, r0, #0x6
    cmp r1, r0
    strge r0, [r9, #0x4]
.L_59c:
    ldr r1, [r9]
    ldr r0, [sp, #0x8]
    cmp r1, r0
    ldreq r1, [r9, #0x4]
    ldreq r0, [sp, #0xc]
    cmpeq r1, r0
    beq .L_5cc
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_5cc:
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
    bl func_ov006_021c6e70
    ldr r1, [r9, #0x8]
    ldr r0, _LIT2
    bl func_ov006_021c6e7c
    ldr r0, [r6, r5, lsl #0x4]
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, _LIT2
    movne r1, #0x0
    bl func_ov006_021c6e88
    ldr r1, [r9]
    ldr r0, _LIT2
    mov r2, #0x0
    bl func_ov006_021c6d34
    ldr r0, [sl, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_65c
    ldr r0, [sl, #0x4]
    str r0, [r7, #0x4]
    ldr r0, [sl, #0x8]
    sub r0, r0, #0x6
    str r0, [r7, #0x8]
    ldr r0, [sl]
    str r0, [r7, #0x10]
.L_65c:
    mov r0, r4
    bl func_ov006_021c5ce4
    mov r0, r4
    bl func_ov006_021c5e38
    mov r0, r4
    bl func_ov006_021c5ff8
    cmp r8, #0x0
    beq .L_684
    mov r0, r4
    bl func_ov006_021c6734
.L_684:
    mov r0, #0x0
    add sp, sp, #0x24
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_02104acc
_LIT1: .word data_ov000_021b1c4c
_LIT2: .word data_ov006_0225dd94
_LIT3: .word 0x00000401
