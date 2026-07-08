; func_ov002_022a6cc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov002_022ca358
        .extern data_ov002_022ca360
        .extern data_ov002_022cd65c
        .extern func_ov002_0229dab8
        .extern func_ov002_0229e930
        .extern func_ov002_0229eaf4
        .global func_ov002_022a6cc8
        .arm
func_ov002_022a6cc8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    ldr r4, _LIT0
    ldr r4, [r4, #0x4]
    eor r6, r4, #0x1
    cmp r2, r6
    moveq r4, #0x1
    movne r4, #0x0
    mov r5, r4, lsl #0x1
    sub r4, r3, #0xa
    cmp r4, #0x5
    rsb ip, r5, #0x1
    addls pc, pc, r4, lsl #0x2
    b .L_b0
    b .L_50
    b .L_94
    b .L_64
    b .L_64
    b .L_64
    b .L_64
.L_50:
    mov r1, r2
    mov r2, r3
    bl func_ov002_0229e930
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_64:
    cmp r3, #0xc
    movlt r1, #0x0
    blt .L_88
    add r4, r1, #0x280
    mov r1, #0xb0
    mla r4, r2, r1, r4
    sub r2, r3, #0xc
    mov r1, #0x2c
    mla r1, r2, r1, r4
.L_88:
    bl func_ov002_0229eaf4
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_94:
    add r3, r1, #0x3e0
    mov r1, #0xcc
    mla r1, r2, r1, r3
    ldr r2, [sp, #0x28]
    bl func_ov002_0229dab8
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_b0:
    ldr r1, [sp, #0x28]
    add r1, r3, r1
    cmp r1, #0xa
    bge .L_124
    cmp r2, r6
    ldr r2, _LIT1
    moveq r9, #0x1
    smull sl, r5, r2, r1
    smull r3, r7, r2, r1
    mov lr, r1, lsr #0x1f
    mov r3, #0x1c
    add r7, lr, r7, asr #0x1
    mov r2, #0x5
    smull r7, sl, r2, r7
    mov r4, #0x1d
    mul r3, ip, r3
    mul r2, ip, r4
    ldr r8, _LIT2
    movne r9, #0x0
    ldr r6, _LIT3
    sub r7, r1, r7
    ldr r4, [r8, r9, lsl #0x2]
    ldr r1, [r6, r9, lsl #0x2]
    add r5, lr, r5, asr #0x1
    mla r3, r7, r3, r4
    mla r1, r5, r2, r1
    str r3, [sp]
    str r1, [sp, #0x4]
    b .L_18c
.L_124:
    cmp r3, #0x4
    bgt .L_17c
    ldr r5, _LIT1
    cmp r2, r6
    smull r1, r8, r5, r3
    mov r4, r3, lsr #0x1f
    moveq r2, #0x1
    add r8, r4, r8, asr #0x1
    mov r6, #0x5
    smull r4, r5, r6, r8
    mov r7, #0x1c
    mul r6, ip, r7
    ldr r1, _LIT2
    movne r2, #0x0
    ldr r5, _LIT3
    ldr r1, [r1, r2, lsl #0x2]
    sub r8, r3, r4
    mla r1, r8, r6, r1
    ldr r5, [r5, r2, lsl #0x2]
    str r1, [sp]
    str r5, [sp, #0x4]
    b .L_18c
.L_17c:
    mov r2, #0x8c
    mov r1, #0x68
    str r2, [sp]
    str r1, [sp, #0x4]
.L_18c:
    ldr r1, _LIT4
    ldr r1, [r1, #0x4]
    mov r1, r1, lsl #0x1b
    mov r2, r1, lsr #0x1e
    tst r2, #0x1
    ldrne r1, [sp]
    subne r1, r1, #0x18
    strne r1, [sp]
    tst r2, #0x2
    ldrne r1, [sp, #0x4]
    ldr r2, [sp]
    subne r1, r1, #0x10
    strne r1, [sp, #0x4]
    ldr r1, [sp, #0x4]
    str r2, [r0]
    str r1, [r0, #0x4]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cd65c
_LIT1: .word 0x66666667
_LIT2: .word data_ov002_022ca358
_LIT3: .word data_ov002_022ca360
_LIT4: .word data_02104e6c
