; func_ov006_021c3608 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021b1c4c
        .extern data_ov006_021cdd0c
        .extern data_ov006_021cdd88
        .extern func_0202160c
        .extern func_0202165c
        .extern func_020b377c
        .global func_ov006_021c3608
        .arm
func_ov006_021c3608:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov sl, r0
    ldr r0, [sl, #0x64]
    add r4, sl, #0x9c
    add r4, r4, r0, lsl #0x4
    ldr r0, _LIT0
    ldr r9, _LIT1
    str r1, [sp]
    str r2, [sp, #0x4]
    str r3, [sp, #0x8]
    mov r7, #0x0
    orr fp, r0, #0x2
.L_34:
    cmp r7, #0x0
    blt .L_54
    cmp r7, #0x1
    bgt .L_54
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_2b8
    b .L_90
.L_54:
    cmp r7, #0x2
    blt .L_74
    cmp r7, #0x3
    bgt .L_74
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_2b8
    b .L_90
.L_74:
    cmp r7, #0x4
    blt .L_90
    cmp r7, #0x7
    bgt .L_90
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_2b8
.L_90:
    ldr r0, [sl, #0x4]
    mov r1, #0x5
    mov r2, r7
    bl func_0202160c
    mov r5, r0
    cmp r7, #0x4
    mov r6, #0x0
    beq .L_180
    ldr r0, [r4, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_d8
    cmp r7, #0x4
    blt .L_d8
    cmp r7, #0x7
    bgt .L_d8
    cmp r7, #0x4
    bne .L_180
.L_d8:
    cmp r7, #0x2
    ldr r6, _LIT0
    bne .L_130
    ldr r0, [sl, #0x58]
    mov r1, r0, lsl #0x2
    ldr r0, _LIT2
    ldrsh r0, [r0, r1]
    cmp r0, #0x0
    beq .L_110
    cmp r0, #0x1
    beq .L_118
    cmp r0, #0x2
    beq .L_120
    b .L_180
.L_110:
    mov r6, fp
    b .L_180
.L_118:
    mov r6, #0x0
    b .L_180
.L_120:
    ldr r0, [sl, #0x64]
    cmp r0, #0x0
    moveq r6, fp
    b .L_180
.L_130:
    cmp r7, #0x3
    bne .L_180
    ldr r0, [sl, #0x58]
    mov r1, r0, lsl #0x2
    ldr r0, _LIT2
    ldrsh r0, [r0, r1]
    cmp r0, #0x0
    beq .L_164
    cmp r0, #0x1
    beq .L_16c
    cmp r0, #0x2
    beq .L_174
    b .L_180
.L_164:
    mov r6, #0x0
    b .L_180
.L_16c:
    mov r6, fp
    b .L_180
.L_174:
    ldr r0, [sl, #0x64]
    cmp r0, #0x1
    moveq r6, fp
.L_180:
    ldr r0, [sl, #0x98]
    cmp r7, r0
    ldreq r0, [r9, #0x18]
    streq r0, [sp, #0x10]
    beq .L_1f0
    ldr r0, [r4, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_1e8
    ldr r0, _LIT3
    ldr r0, [r0, #0x18]
    cmp r0, #0x1
    cmpeq r7, #0x7
    beq .L_1d0
    cmp r0, #0x2
    cmpeq r7, #0x5
    beq .L_1d0
    cmp r0, #0x3
    cmpeq r7, #0x6
    bne .L_1dc
.L_1d0:
    ldr r0, [r9, #0x18]
    str r0, [sp, #0x10]
    b .L_1f0
.L_1dc:
    ldr r0, [r9, #0x10]
    str r0, [sp, #0x10]
    b .L_1f0
.L_1e8:
    ldr r0, [r9, #0x10]
    str r0, [sp, #0x10]
.L_1f0:
    ldrsh r0, [r9]
    ldrsh r8, [r9, #0x2]
    str r0, [sp, #0xc]
    ldr r0, [r4, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_230
    cmp r7, #0x7
    bne .L_230
    ldr r2, [r4, #0x4]
    mov r0, #0x35
    mul r0, r2, r0
    ldr r1, [r4, #0x8]
    sub r1, r1, #0x6
    bl func_020b377c
    add r8, r8, r0
.L_230:
    mov r0, r5
    tst r6, #0x2
    mov r1, #0x2
    mov r2, r7
    subne r8, r8, #0x1
    bl func_0202165c
    ldr r2, [sp, #0xc]
    mov r0, r5
    mov r1, #0x3
    bl func_0202165c
    mov r2, r8
    mov r0, r5
    mov r1, #0x4
    bl func_0202165c
    ldrsh r2, [r9, #0x8]
    mov r0, r5
    mov r1, #0x11
    bl func_0202165c
    ldrsh r2, [r9, #0xa]
    mov r0, r5
    mov r1, #0x12
    bl func_0202165c
    ldr r2, [r9, #0xc]
    mov r0, r5
    mov r1, #0xc
    bl func_0202165c
    ldr r2, [sp, #0x10]
    mov r0, r5
    mov r1, #0xd
    bl func_0202165c
    mov r0, r5
    mov r2, r6
    mov r1, #0x0
    bl func_0202165c
.L_2b8:
    add r9, r9, #0x1c
    add r7, r7, #0x1
    cmp r7, #0x8
    blt .L_34
    mov r0, #0x1
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000001c1
_LIT1: .word data_ov006_021cdd88
_LIT2: .word data_ov006_021cdd0c
_LIT3: .word data_ov000_021b1c4c
