; func_ov004_021cedf8 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov004_0220b500
        .extern func_02006110
        .extern func_02006164
        .extern func_0200617c
        .extern func_02006194
        .extern func_ov004_021ce9b8
        .extern func_ov004_021ce9e4
        .extern func_ov004_021cea48
        .extern func_ov004_021ceb24
        .extern func_ov004_021ced78
        .global func_ov004_021cedf8
        .arm
func_ov004_021cedf8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    ldr r4, _LIT0
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    addne sp, sp, #0x10
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x224]
    mov r1, #0x0
    str r1, [r4, #0x234]
    cmp r0, #0x0
    bne .L_210
    bl func_02006194
    cmp r0, #0x0
    bne .L_c8
    bl func_0200617c
    cmp r0, #0x0
    beq .L_198
.L_c8:
    add r0, sp, #0xc
    add r1, sp, #0x8
    bl func_02006110
    ldr r1, [sp, #0x8]
    cmp r1, #0x3e
    addlt sp, sp, #0x10
    ldmltia sp!, {r3, r4, r5, pc}
    cmp r1, #0xa6
    addge sp, sp, #0x10
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr r0, [sp, #0xc]
    cmp r0, #0x2e
    addlt sp, sp, #0x10
    ldmltia sp!, {r3, r4, r5, pc}
    cmp r0, #0xd2
    addge sp, sp, #0x10
    ldmgeia sp!, {r3, r4, r5, pc}
    sub lr, r1, #0x3e
    ldr r1, _LIT1
    mov r3, lr, lsr #0x1f
    smull r0, ip, r1, lr
    smull r0, r5, r1, lr
    add ip, r3, ip, asr #0x3
    mov r2, #0x1a
    smull r0, r1, r2, ip
    sub ip, lr, r0
    cmp ip, #0x15
    add r5, r3, r5, asr #0x3
    addge sp, sp, #0x10
    ldmgeia sp!, {r3, r4, r5, pc}
    cmp r5, #0x3
    bne .L_150
    bl func_ov004_021ce9b8
    add r5, r5, r0
.L_150:
    bl func_02006164
    cmp r0, #0x0
    beq .L_164
    mov r0, r5
    bl func_ov004_021ce9e4
.L_164:
    ldr r0, [r4, #0x22c]
    cmp r0, r5
    addne sp, sp, #0x10
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x1
    str r0, [r4, #0x234]
    bl func_0200617c
    cmp r0, #0x0
    addeq sp, sp, #0x10
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov004_021cea48
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_198:
    ldr r0, _LIT2
    ldrh r1, [r0, #0x54]
    tst r1, #0x1
    beq .L_1b4
    bl func_ov004_021cea48
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_1b4:
    ldrh r0, [r0, #0x56]
    tst r0, #0xc0
    addeq sp, sp, #0x10
    ldmeqia sp!, {r3, r4, r5, pc}
    tst r0, #0x40
    beq .L_1f0
    ldr r0, [r4, #0x22c]
    cmp r0, #0x4
    moveq r1, #0x1
    movne r1, #0x0
    sub r0, r0, #0x1
    sub r0, r0, r1
    bl func_ov004_021ce9e4
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_1f0:
    tst r0, #0x80
    addeq sp, sp, #0x10
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x22c]
    add r0, r0, #0x1
    bl func_ov004_021ce9e4
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_210:
    bl func_ov004_021ced78
    cmp r0, #0x0
    addne sp, sp, #0x10
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02006194
    cmp r0, #0x0
    bne .L_238
    bl func_0200617c
    cmp r0, #0x0
    beq .L_2cc
.L_238:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
    ldr r2, [sp]
    cmp r2, #0x3e
    addlt sp, sp, #0x10
    ldmltia sp!, {r3, r4, r5, pc}
    cmp r2, #0xa6
    addge sp, sp, #0x10
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr r0, [sp, #0x4]
    cmp r0, #0x2e
    addlt sp, sp, #0x10
    ldmltia sp!, {r3, r4, r5, pc}
    cmp r0, #0xd2
    addge sp, sp, #0x10
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    sub r2, r2, #0x3e
    smull r0, r5, r1, r2
    mov r0, r2, lsr #0x1f
    add r5, r0, r5, asr #0x3
    cmp r5, #0x3
    bne .L_2a0
    bl func_ov004_021ce9b8
    add r5, r5, r0
.L_2a0:
    ldr r0, [r4, #0x22c]
    cmp r0, r5
    addeq sp, sp, #0x10
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_0200617c
    cmp r0, #0x0
    addeq sp, sp, #0x10
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov004_021ceb24
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_2cc:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x54]
    tst r0, #0x2
    addeq sp, sp, #0x10
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov004_021ceb24
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word 0x4ec4ec4f
_LIT2: .word data_02104bac
