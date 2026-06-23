; func_ov006_021c1c68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov006_021cde68
        .extern data_ov006_0225df48
        .extern func_020060f4
        .extern func_02006148
        .extern func_02006160
        .extern func_02006178
        .extern func_020371b8
        .extern func_ov006_021c2050
        .extern func_ov006_021c31a0
        .extern func_ov006_021c3278
        .extern func_ov006_021c33b4
        .extern func_ov006_021c3fa4
        .extern func_ov006_021c423c
        .extern func_ov006_021c4700
        .extern func_ov006_021c9df0
        .extern func_ov006_021ca294
        .global func_ov006_021c1c68
        .arm
func_ov006_021c1c68:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x14
    ldr r1, _LIT0
    mov r4, r0
    ldrh r6, [r1, #0x54]
    ldrh r7, [r1, #0x56]
    mvn r1, #0x0
    ldr r5, _LIT1
    str r1, [r4, #0x98]
    ldr r1, [r4, #0x7c]
    ldr r8, [r4, #0x5c]
    cmp r1, #0x0
    ldr r9, [r4, #0x60]
    beq .L_5c
    bl func_ov006_021c3fa4
    cmp r0, #0x0
    beq .L_3b8
    mov r0, #0x0
    str r0, [r4, #0x6c]
    str r0, [r4, #0x50]
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_5c:
    ldr r0, [r5]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_c0
    mov r0, r5
    bl func_ov006_021c9df0
    cmp r0, #0x0
    beq .L_3b8
    ldr r0, [r5, #0x48]
    ldr r1, [r5, #0x4c]
    cmp r0, #0x0
    bne .L_b4
    cmp r1, #0xe
    beq .L_ac
    cmp r1, #0xf
    moveq r0, #0x6
    streq r0, [r4, #0x7c]
    b .L_b4
.L_ac:
    mov r0, #0x5
    str r0, [r4, #0x7c]
.L_b4:
    mov r0, r5
    bl func_ov006_021ca294
    b .L_3b8
.L_c0:
    ldr r0, [r4, #0x68]
    cmp r0, #0x0
    beq .L_3b8
    bl func_02006178
    cmp r0, #0x0
    bne .L_e4
    bl func_02006160
    cmp r0, #0x0
    beq .L_240
.L_e4:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_020060f4
    ldr r1, [sp, #0x4]
    ldr r2, [sp]
    add r3, sp, #0x8
    mov r0, r4
    bl func_ov006_021c423c
    bl func_02006148
    cmp r0, #0x0
    beq .L_12c
    ldr r0, [sp, #0x8]
    str r0, [r4, #0x88]
    ldr r1, [sp, #0xc]
    ldr r0, [sp, #0x10]
    str r1, [r4, #0x8c]
    str r0, [r4, #0x90]
    b .L_1cc
.L_12c:
    bl func_02006160
    cmp r0, #0x0
    beq .L_1cc
    ldr r1, [sp, #0x8]
    cmp r1, #0x1
    bne .L_1cc
    ldr r0, [r4, #0x88]
    cmp r1, r0
    bne .L_170
    ldr r3, [sp, #0xc]
    ldr r2, [sp, #0x10]
    ldr r0, [r4, #0x90]
    ldr r1, [r4, #0x8c]
    cmp r2, r0
    cmpeq r3, r1
    moveq r0, #0x1
    beq .L_174
.L_170:
    mov r0, #0x0
.L_174:
    cmp r0, #0x0
    beq .L_1cc
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    bne .L_1b4
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x0
    str r0, [r4, #0x6c]
    str r0, [r4, #0x50]
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_1b4:
    mov r0, r4
    bl func_ov006_021c2050
    cmp r0, #0x0
    addne sp, sp, #0x14
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_1cc:
    ldr r0, [sp, #0x8]
    cmp r0, #0x1
    bne .L_3b8
    ldr r2, [sp, #0xc]
    str r2, [r4, #0x98]
    cmp r2, #0x1
    blt .L_20c
    cmp r2, #0x7
    bgt .L_20c
    ldr r1, _LIT2
    mov r0, #0x1c
    mla r1, r2, r0, r1
    ldrsh r0, [r1, #0x4]
    str r0, [r4, #0x5c]
    ldrsh r0, [r1, #0x6]
    str r0, [r4, #0x60]
.L_20c:
    ldr r0, [r4, #0x5c]
    cmp r0, r8
    ldreq r0, [r4, #0x60]
    cmpeq r0, r9
    beq .L_3b8
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, r4
    bl func_ov006_021c4700
    b .L_3b8
.L_240:
    tst r6, #0x1
    beq .L_264
    mov r0, r4
    bl func_ov006_021c2050
    cmp r0, #0x0
    beq .L_3b8
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_264:
    tst r6, #0x2
    beq .L_298
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x0
    str r0, [r4, #0x50]
    str r0, [r4, #0x6c]
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_298:
    tst r7, #0xf0
    beq .L_3b8
    mov r0, #0x0
    mov r1, r0
    tst r7, #0x40
    mov r2, r0
    mov r3, r0
    subne r1, r0, #0x1
    bne .L_2f4
    tst r7, #0x80
    beq .L_2e0
    ldr r5, [r4, #0x5c]
    mov r1, #0x1
    cmp r5, #0x3
    ldreq r5, [r4, #0x60]
    cmpeq r5, #0x0
    subeq r2, r1, #0x2
    b .L_2f4
.L_2e0:
    tst r7, #0x20
    subne r0, r0, #0x1
    bne .L_2f4
    tst r7, #0x10
    movne r0, #0x1
.L_2f4:
    mov r5, #0x0
    mov ip, #0x3
    mov r6, #0x1
    mov lr, r5
.L_304:
    ldr r7, [r4, #0x5c]
    add r2, r0, r2
    add r2, r7, r2
    str r2, [r4, #0x5c]
    ldr r7, [r4, #0x60]
    add r2, r1, r3
    add r2, r7, r2
    str r2, [r4, #0x60]
    ldr r7, [r4, #0x5c]
    mov r2, lr
    cmp r7, #0x0
    mov r3, lr
    strlt ip, [r4, #0x5c]
    blt .L_344
    cmp r7, #0x4
    strge lr, [r4, #0x5c]
.L_344:
    ldr r7, [r4, #0x60]
    cmp r7, #0x0
    strlt r6, [r4, #0x60]
    blt .L_35c
    cmp r7, #0x2
    strge r5, [r4, #0x60]
.L_35c:
    ldr r7, [r4, #0x5c]
    cmp r7, #0x0
    blt .L_304
    cmp r7, #0x4
    bge .L_304
    ldr sl, [r4, #0x60]
    cmp sl, #0x0
    blt .L_304
    cmp sl, #0x2
    bge .L_304
    cmp r7, #0x3
    cmpeq sl, #0x1
    beq .L_304
    cmp r7, r8
    cmpeq sl, r9
    beq .L_3b8
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, r4
    bl func_ov006_021c4700
.L_3b8:
    mov r0, r4
    bl func_ov006_021c31a0
    mov r0, r4
    bl func_ov006_021c3278
    mov r0, r4
    bl func_ov006_021c33b4
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_02104acc
_LIT1: .word data_ov006_0225df48
_LIT2: .word data_ov006_021cde68
