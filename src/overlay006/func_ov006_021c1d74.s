; func_ov006_021c1d74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov006_021cdf88
        .extern data_ov006_0225e068
        .extern func_02006110
        .extern func_02006164
        .extern func_0200617c
        .extern func_02006194
        .extern func_02037208
        .extern func_ov006_021c215c
        .extern func_ov006_021c32ac
        .extern func_ov006_021c3384
        .extern func_ov006_021c34c0
        .extern func_ov006_021c40b0
        .extern func_ov006_021c4348
        .extern func_ov006_021c480c
        .extern func_ov006_021c9efc
        .extern func_ov006_021ca3a0
        .global func_ov006_021c1d74
        .arm
func_ov006_021c1d74:
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
    beq .L_110
    bl func_ov006_021c40b0
    cmp r0, #0x0
    beq .L_46c
    mov r0, #0x0
    str r0, [r4, #0x6c]
    str r0, [r4, #0x50]
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_110:
    ldr r0, [r5]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_174
    mov r0, r5
    bl func_ov006_021c9efc
    cmp r0, #0x0
    beq .L_46c
    ldr r0, [r5, #0x48]
    ldr r1, [r5, #0x4c]
    cmp r0, #0x0
    bne .L_168
    cmp r1, #0xe
    beq .L_160
    cmp r1, #0xf
    moveq r0, #0x6
    streq r0, [r4, #0x7c]
    b .L_168
.L_160:
    mov r0, #0x5
    str r0, [r4, #0x7c]
.L_168:
    mov r0, r5
    bl func_ov006_021ca3a0
    b .L_46c
.L_174:
    ldr r0, [r4, #0x68]
    cmp r0, #0x0
    beq .L_46c
    bl func_02006194
    cmp r0, #0x0
    bne .L_198
    bl func_0200617c
    cmp r0, #0x0
    beq .L_2f4
.L_198:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
    ldr r1, [sp, #0x4]
    ldr r2, [sp]
    add r3, sp, #0x8
    mov r0, r4
    bl func_ov006_021c4348
    bl func_02006164
    cmp r0, #0x0
    beq .L_1e0
    ldr r0, [sp, #0x8]
    str r0, [r4, #0x88]
    ldr r1, [sp, #0xc]
    ldr r0, [sp, #0x10]
    str r1, [r4, #0x8c]
    str r0, [r4, #0x90]
    b .L_280
.L_1e0:
    bl func_0200617c
    cmp r0, #0x0
    beq .L_280
    ldr r1, [sp, #0x8]
    cmp r1, #0x1
    bne .L_280
    ldr r0, [r4, #0x88]
    cmp r1, r0
    bne .L_224
    ldr r3, [sp, #0xc]
    ldr r2, [sp, #0x10]
    ldr r0, [r4, #0x90]
    ldr r1, [r4, #0x8c]
    cmp r2, r0
    cmpeq r3, r1
    moveq r0, #0x1
    beq .L_228
.L_224:
    mov r0, #0x0
.L_228:
    cmp r0, #0x0
    beq .L_280
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    bne .L_268
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x0
    str r0, [r4, #0x6c]
    str r0, [r4, #0x50]
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_268:
    mov r0, r4
    bl func_ov006_021c215c
    cmp r0, #0x0
    addne sp, sp, #0x14
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_280:
    ldr r0, [sp, #0x8]
    cmp r0, #0x1
    bne .L_46c
    ldr r2, [sp, #0xc]
    str r2, [r4, #0x98]
    cmp r2, #0x1
    blt .L_2c0
    cmp r2, #0x7
    bgt .L_2c0
    ldr r1, _LIT2
    mov r0, #0x1c
    mla r1, r2, r0, r1
    ldrsh r0, [r1, #0x4]
    str r0, [r4, #0x5c]
    ldrsh r0, [r1, #0x6]
    str r0, [r4, #0x60]
.L_2c0:
    ldr r0, [r4, #0x5c]
    cmp r0, r8
    ldreq r0, [r4, #0x60]
    cmpeq r0, r9
    beq .L_46c
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, r4
    bl func_ov006_021c480c
    b .L_46c
.L_2f4:
    tst r6, #0x1
    beq .L_318
    mov r0, r4
    bl func_ov006_021c215c
    cmp r0, #0x0
    beq .L_46c
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_318:
    tst r6, #0x2
    beq .L_34c
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x0
    str r0, [r4, #0x50]
    str r0, [r4, #0x6c]
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_34c:
    tst r7, #0xf0
    beq .L_46c
    mov r0, #0x0
    mov r1, r0
    tst r7, #0x40
    mov r2, r0
    mov r3, r0
    subne r1, r0, #0x1
    bne .L_3a8
    tst r7, #0x80
    beq .L_394
    ldr r5, [r4, #0x5c]
    mov r1, #0x1
    cmp r5, #0x3
    ldreq r5, [r4, #0x60]
    cmpeq r5, #0x0
    subeq r2, r1, #0x2
    b .L_3a8
.L_394:
    tst r7, #0x20
    subne r0, r0, #0x1
    bne .L_3a8
    tst r7, #0x10
    movne r0, #0x1
.L_3a8:
    mov r5, #0x0
    mov ip, #0x3
    mov r6, #0x1
    mov lr, r5
.L_3b8:
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
    blt .L_3f8
    cmp r7, #0x4
    strge lr, [r4, #0x5c]
.L_3f8:
    ldr r7, [r4, #0x60]
    cmp r7, #0x0
    strlt r6, [r4, #0x60]
    blt .L_410
    cmp r7, #0x2
    strge r5, [r4, #0x60]
.L_410:
    ldr r7, [r4, #0x5c]
    cmp r7, #0x0
    blt .L_3b8
    cmp r7, #0x4
    bge .L_3b8
    ldr sl, [r4, #0x60]
    cmp sl, #0x0
    blt .L_3b8
    cmp sl, #0x2
    bge .L_3b8
    cmp r7, #0x3
    cmpeq sl, #0x1
    beq .L_3b8
    cmp r7, r8
    cmpeq sl, r9
    beq .L_46c
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, r4
    bl func_ov006_021c480c
.L_46c:
    mov r0, r4
    bl func_ov006_021c32ac
    mov r0, r4
    bl func_ov006_021c3384
    mov r0, r4
    bl func_ov006_021c34c0
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_02104bac
_LIT1: .word data_ov006_0225e068
_LIT2: .word data_ov006_021cdf88
