; func_ov002_022acc10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020060f4
        .extern func_02006148
        .extern func_02006160
        .extern func_02006178
        .extern func_0200620c
        .extern func_020371b8
        .extern func_ov002_021afa10
        .extern func_ov002_021afae4
        .extern func_ov002_0229f050
        .extern func_ov002_0229f0d0
        .extern func_ov002_022a0e7c
        .extern func_ov002_022a0fec
        .extern func_ov002_022a15a0
        .extern func_ov002_022a2930
        .extern func_ov002_022ac540
        .extern func_ov002_022ac8b0
        .extern func_ov002_022afbb4
        .global func_ov002_022acc10
        .arm
func_ov002_022acc10:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x20
    mov r6, r0
    add r0, sp, #0x1c
    add r1, sp, #0x18
    bl func_020060f4
    mov r0, r6
    bl func_ov002_022a15a0
    ldr r1, [sp, #0x18]
    sub r1, r1, r0
    add r0, r6, #0x1f8
    str r1, [sp, #0x18]
    bl func_ov002_022afbb4
    cmp r0, #0x0
    beq .L_70
    ldrb r0, [r6, #0x21c]
    cmp r0, #0x0
    ldrne r1, [r6, #0x234]
    ldr r0, [r6, #0x28]
    moveq r1, #0x0
    cmp r0, r1
    addeq sp, sp, #0x20
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r6
    str r1, [r6, #0x28]
    bl func_ov002_022ac540
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_70:
    bl func_ov002_021afae4
    cmp r0, #0x6
    movgt r5, #0x6
    bgt .L_88
    bl func_ov002_021afae4
    mov r5, r0
.L_88:
    ldr r0, [sp, #0x18]
    cmp r0, #0x18
    blt .L_fc
    cmp r0, #0x28
    bge .L_fc
    ldr r0, [sp, #0x1c]
    cmp r0, #0x24
    blt .L_fc
    cmp r0, #0xe4
    bge .L_fc
    ldr r1, _LIT0
    sub r2, r0, #0x24
    smull r0, r4, r1, r2
    mov r0, r2, lsr #0x1f
    add r4, r0, r4, asr #0x2
    bl func_02006148
    cmp r0, #0x0
    beq .L_fc
    mov r0, r6
    mov r1, r4
    bl func_ov002_022ac8b0
    mov r0, #0x3a
    mov r2, #0x0
    sub r1, r0, #0x3b
    mov r3, #0x1
    str r2, [r6, #0x60]
    bl func_020371b8
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_fc:
    add r0, sp, #0x8
    mov r1, r6
    mov r2, #0x0
    bl func_ov002_022a2930
    ldr r2, [sp, #0xc]
    ldr r3, [sp, #0x8]
    ldr r1, [sp, #0x18]
    sub r0, r2, #0x10
    str r3, [sp, #0x10]
    str r2, [sp, #0x14]
    cmp r1, r0
    blt .L_330
    add r0, r2, #0x10
    cmp r1, r0
    bge .L_330
    ldr r4, [sp, #0x1c]
    sub r0, r3, #0x10
    cmp r4, r0
    bge .L_1b0
    ldr r0, [r6, #0x28]
    cmp r0, #0x0
    addle sp, sp, #0x20
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, [r6, #0x50]
    mvn r0, #0xf
    sub r1, r1, #0x1
    cmp r1, r0
    addgt sp, sp, #0x20
    str r1, [r6, #0x50]
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    add r0, r0, #0x8
    str r0, [r6, #0x50]
    ldr r1, [r6, #0x28]
    mov r0, r6
    sub r1, r1, #0x1
    bl func_ov002_022a0fec
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_020371b8
    mov r0, #0x0
    add sp, sp, #0x20
    str r0, [r6, #0x60]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1b0:
    add r0, sp, #0x0
    mov r1, r6
    sub r2, r5, #0x1
    bl func_ov002_022a2930
    ldr r0, [sp]
    add r0, r0, #0x10
    cmp r4, r0
    bge .L_2c4
    ldr r2, [sp, #0x10]
    sub r0, r2, #0x14
    sub r0, r4, r0
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1b
    add r0, r1, r0, ror #0x1b
    cmp r0, #0x8
    movlt r0, #0x1
    strlt r0, [r6, #0x18]
    blt .L_2b4
    sub r0, r2, #0x10
    sub r1, r4, r0
    mov r0, r1, asr #0x4
    ldr r2, [r6, #0x28]
    add r0, r1, r0, lsr #0x1b
    ldr r1, [r6, #0x20]
    add r4, r2, r0, asr #0x5
    cmp r1, r4
    beq .L_248
    mov r0, r6
    mov r1, r4
    bl func_ov002_022a0fec
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_020371b8
    mov r0, #0x0
    str r0, [r6, #0x60]
    b .L_2b0
.L_248:
    bl func_0200620c
    cmp r0, #0x0
    beq .L_2b0
    bl func_ov002_021afa10
    cmp r0, #0x1
    bgt .L_270
    ldr r2, [r6, #0x4]
    mvn r1, #0x47
    cmp r2, r1
    bne .L_2a0
.L_270:
    ldr r0, [r6, #0x1b8]
    cmp r0, #0x0
    beq .L_288
    add r0, r6, #0x1b8
    bl func_ov002_0229f0d0
    b .L_2b0
.L_288:
    ldr r0, [r6, #0x1d8]
    cmp r0, #0x0
    beq .L_2b0
    add r0, r6, #0x1d8
    bl func_ov002_0229f0d0
    b .L_2b0
.L_2a0:
    cmp r0, #0x0
    beq .L_2b0
    add r0, r6, #0x198
    bl func_ov002_0229f0d0
.L_2b0:
    str r4, [r6, #0x20]
.L_2b4:
    mov r0, #0x0
    add sp, sp, #0x20
    str r0, [r6, #0x50]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2c4:
    bl func_ov002_021afae4
    ldr r1, [r6, #0x28]
    add r1, r1, #0x6
    cmp r1, r0
    addge sp, sp, #0x20
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r6, #0x50]
    add r0, r0, #0x1
    cmp r0, #0x10
    addlt sp, sp, #0x20
    str r0, [r6, #0x50]
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, #0x8
    str r0, [r6, #0x50]
    ldr r1, [r6, #0x28]
    mov r0, r6
    add r1, r1, #0x6
    bl func_ov002_022a0fec
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_020371b8
    mov r0, #0x0
    add sp, sp, #0x20
    str r0, [r6, #0x60]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_330:
    mov r5, #0x0
    str r5, [r6, #0x50]
    ldr r0, [r6, #0x194]
    cmp r0, #0x0
    addle sp, sp, #0x20
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    add r7, r6, #0x198
    mov r4, #0x1
.L_350:
    ldr r1, [sp, #0x1c]
    ldr r2, [sp, #0x18]
    mov r0, r7
    bl func_ov002_0229f050
    cmp r0, #0x0
    beq .L_3c8
    str r5, [r6, #0x14]
    str r4, [r6, #0x60]
    ldr r1, [r6, #0x20]
    mov r0, r6
    bl func_ov002_022a0e7c
    cmp r0, #0x0
    beq .L_3c8
    bl func_02006178
    cmp r0, #0x0
    beq .L_3a4
    add r0, r6, r5, lsl #0x5
    mov r1, #0x1
    str r1, [r0, #0x19c]
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_3a4:
    bl func_02006160
    cmp r0, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    add r0, r6, #0x198
    add r0, r0, r5, lsl #0x5
    bl func_ov002_0229f0d0
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_3c8:
    ldr r0, [r6, #0x194]
    add r5, r5, #0x1
    cmp r5, r0
    add r7, r7, #0x20
    blt .L_350
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x2aaaaaab
