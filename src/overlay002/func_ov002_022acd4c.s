; func_ov002_022acd4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02006110
        .extern func_02006164
        .extern func_0200617c
        .extern func_02006194
        .extern func_02006228
        .extern func_02037208
        .extern func_ov002_021afaf0
        .extern func_ov002_021afbc4
        .extern func_ov002_0229f160
        .extern func_ov002_0229f1e0
        .extern func_ov002_022a0f8c
        .extern func_ov002_022a10fc
        .extern func_ov002_022a16b0
        .extern func_ov002_022a2a40
        .extern func_ov002_022ac67c
        .extern func_ov002_022ac9ec
        .extern func_ov002_022afcf0
        .global func_ov002_022acd4c
        .arm
func_ov002_022acd4c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x20
    mov r6, r0
    add r0, sp, #0x1c
    add r1, sp, #0x18
    bl func_02006110
    mov r0, r6
    bl func_ov002_022a16b0
    ldr r1, [sp, #0x18]
    sub r1, r1, r0
    add r0, r6, #0x1f8
    str r1, [sp, #0x18]
    bl func_ov002_022afcf0
    cmp r0, #0x0
    beq .L_4cc
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
    bl func_ov002_022ac67c
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_4cc:
    bl func_ov002_021afbc4
    cmp r0, #0x6
    movgt r5, #0x6
    bgt .L_4e4
    bl func_ov002_021afbc4
    mov r5, r0
.L_4e4:
    ldr r0, [sp, #0x18]
    cmp r0, #0x18
    blt .L_558
    cmp r0, #0x28
    bge .L_558
    ldr r0, [sp, #0x1c]
    cmp r0, #0x24
    blt .L_558
    cmp r0, #0xe4
    bge .L_558
    ldr r1, _LIT0
    sub r2, r0, #0x24
    smull r0, r4, r1, r2
    mov r0, r2, lsr #0x1f
    add r4, r0, r4, asr #0x2
    bl func_02006164
    cmp r0, #0x0
    beq .L_558
    mov r0, r6
    mov r1, r4
    bl func_ov002_022ac9ec
    mov r0, #0x3a
    mov r2, #0x0
    sub r1, r0, #0x3b
    mov r3, #0x1
    str r2, [r6, #0x60]
    bl func_02037208
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_558:
    add r0, sp, #0x8
    mov r1, r6
    mov r2, #0x0
    bl func_ov002_022a2a40
    ldr r2, [sp, #0xc]
    ldr r3, [sp, #0x8]
    ldr r1, [sp, #0x18]
    sub r0, r2, #0x10
    str r3, [sp, #0x10]
    str r2, [sp, #0x14]
    cmp r1, r0
    blt .L_78c
    add r0, r2, #0x10
    cmp r1, r0
    bge .L_78c
    ldr r4, [sp, #0x1c]
    sub r0, r3, #0x10
    cmp r4, r0
    bge .L_60c
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
    bl func_ov002_022a10fc
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_02037208
    mov r0, #0x0
    add sp, sp, #0x20
    str r0, [r6, #0x60]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_60c:
    add r0, sp, #0x0
    mov r1, r6
    sub r2, r5, #0x1
    bl func_ov002_022a2a40
    ldr r0, [sp]
    add r0, r0, #0x10
    cmp r4, r0
    bge .L_720
    ldr r2, [sp, #0x10]
    sub r0, r2, #0x14
    sub r0, r4, r0
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1b
    add r0, r1, r0, ror #0x1b
    cmp r0, #0x8
    movlt r0, #0x1
    strlt r0, [r6, #0x18]
    blt .L_710
    sub r0, r2, #0x10
    sub r1, r4, r0
    mov r0, r1, asr #0x4
    ldr r2, [r6, #0x28]
    add r0, r1, r0, lsr #0x1b
    ldr r1, [r6, #0x20]
    add r4, r2, r0, asr #0x5
    cmp r1, r4
    beq .L_6a4
    mov r0, r6
    mov r1, r4
    bl func_ov002_022a10fc
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_02037208
    mov r0, #0x0
    str r0, [r6, #0x60]
    b .L_70c
.L_6a4:
    bl func_02006228
    cmp r0, #0x0
    beq .L_70c
    bl func_ov002_021afaf0
    cmp r0, #0x1
    bgt .L_6cc
    ldr r2, [r6, #0x4]
    mvn r1, #0x47
    cmp r2, r1
    bne .L_6fc
.L_6cc:
    ldr r0, [r6, #0x1b8]
    cmp r0, #0x0
    beq .L_6e4
    add r0, r6, #0x1b8
    bl func_ov002_0229f1e0
    b .L_70c
.L_6e4:
    ldr r0, [r6, #0x1d8]
    cmp r0, #0x0
    beq .L_70c
    add r0, r6, #0x1d8
    bl func_ov002_0229f1e0
    b .L_70c
.L_6fc:
    cmp r0, #0x0
    beq .L_70c
    add r0, r6, #0x198
    bl func_ov002_0229f1e0
.L_70c:
    str r4, [r6, #0x20]
.L_710:
    mov r0, #0x0
    add sp, sp, #0x20
    str r0, [r6, #0x50]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_720:
    bl func_ov002_021afbc4
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
    bl func_ov002_022a10fc
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_02037208
    mov r0, #0x0
    add sp, sp, #0x20
    str r0, [r6, #0x60]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_78c:
    mov r5, #0x0
    str r5, [r6, #0x50]
    ldr r0, [r6, #0x194]
    cmp r0, #0x0
    addle sp, sp, #0x20
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    add r7, r6, #0x198
    mov r4, #0x1
.L_7ac:
    ldr r1, [sp, #0x1c]
    ldr r2, [sp, #0x18]
    mov r0, r7
    bl func_ov002_0229f160
    cmp r0, #0x0
    beq .L_824
    str r5, [r6, #0x14]
    str r4, [r6, #0x60]
    ldr r1, [r6, #0x20]
    mov r0, r6
    bl func_ov002_022a0f8c
    cmp r0, #0x0
    beq .L_824
    bl func_02006194
    cmp r0, #0x0
    beq .L_800
    add r0, r6, r5, lsl #0x5
    mov r1, #0x1
    str r1, [r0, #0x19c]
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_800:
    bl func_0200617c
    cmp r0, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    add r0, r6, #0x198
    add r0, r0, r5, lsl #0x5
    bl func_ov002_0229f1e0
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_824:
    ldr r0, [r6, #0x194]
    add r5, r5, #0x1
    cmp r5, r0
    add r7, r7, #0x20
    blt .L_7ac
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x2aaaaaab
