; func_ov004_021d7c84 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov004_0220b500
        .extern data_ov004_022915e8
        .extern func_02006110
        .extern func_0200617c
        .extern func_02006194
        .extern func_02037208
        .global func_ov004_021d7c84
        .arm
func_ov004_021d7c84:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    ldr r4, _LIT0
    ldr r0, [r4, #0x88]
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x90]
    cmp r0, #0x0
    movlt r0, #0x0
    strlt r0, [r4, #0x90]
    mov r0, #0x0
    str r0, [r4, #0x60]
    bl func_02006194
    cmp r0, #0x0
    bne .L_6c
    bl func_0200617c
    cmp r0, #0x0
    beq .L_198
.L_6c:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
    ldr r1, [sp, #0x4]
    mov r0, #0x1
    str r0, [r4, #0x60]
    cmp r1, #0x14
    blt .L_120
    cmp r1, #0xec
    bge .L_120
    ldr r1, [sp]
    cmp r1, #0x7
    blt .L_120
    cmp r1, #0xa3
    bge .L_120
    sub r5, r1, #0x7
    ldr lr, _LIT2
    mov ip, r5, lsr #0x1f
    smull r1, r2, lr, r5
    add r2, ip, r2, asr #0x4
    mov r3, #0x34
    smull r1, r2, r3, r2
    sub r2, r5, r1
    cmp r2, #0x2d
    bge .L_120
    smull r1, r2, lr, r5
    add r2, ip, r2, asr #0x4
    mov r1, #0x0
    str r1, [r4, #0x60]
    str r2, [r4, #0x90]
    str r0, [r4, #0x9c]
    bl func_0200617c
    cmp r0, #0x0
    beq .L_120
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r0, [r4, #0x90]
    cmp r0, #0x0
    moveq r0, #0x5
    streq r0, [r4, #0x54]
    addne r0, r0, #0x1
    strne r0, [r4, #0x88]
.L_120:
    ldr r0, [sp, #0x4]
    cmp r0, #0xe0
    addlt sp, sp, #0x8
    ldmltia sp!, {r3, r4, r5, pc}
    cmp r0, #0xfa
    addge sp, sp, #0x8
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr r0, [sp]
    cmp r0, #0xa4
    addlt sp, sp, #0x8
    ldmltia sp!, {r3, r4, r5, pc}
    cmp r0, #0xbe
    addge sp, sp, #0x8
    ldmgeia sp!, {r3, r4, r5, pc}
    mov r0, #0x1
    str r0, [r4, #0xa0]
    bl func_0200617c
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mvn r0, #0x0
    add sp, sp, #0x8
    str r0, [r4, #0x90]
    str r0, [r4, #0x88]
    ldmia sp!, {r3, r4, r5, pc}
.L_198:
    ldr r1, [r4, #0x90]
    cmp r1, #0x0
    beq .L_1d8
    ldr r0, _LIT3
    ldrh r0, [r0, #0x54]
    tst r0, #0x40
    beq .L_1d8
    mov r0, #0x38
    sub ip, r1, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str ip, [r4, #0x90]
    bl func_02037208
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_1d8:
    cmp r1, #0x2
    bge .L_218
    ldr r0, _LIT3
    ldrh r0, [r0, #0x54]
    tst r0, #0x80
    beq .L_218
    ldr r1, [r4, #0x90]
    mov r0, #0x38
    add ip, r1, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str ip, [r4, #0x90]
    bl func_02037208
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_218:
    ldr r0, _LIT3
    ldrh r0, [r0, #0x54]
    tst r0, #0x1
    beq .L_25c
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r0, [r4, #0x90]
    add sp, sp, #0x8
    cmp r0, #0x0
    moveq r0, #0x5
    streq r0, [r4, #0x54]
    addne r0, r0, #0x1
    strne r0, [r4, #0x88]
    ldmia sp!, {r3, r4, r5, pc}
.L_25c:
    tst r0, #0x2
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mvn r1, #0x0
    mov r0, #0x1
    str r1, [r4, #0x90]
    str r0, [r4, #0xa0]
    str r1, [r4, #0x88]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_ov004_022915e8
_LIT2: .word 0x4ec4ec4f
_LIT3: .word data_02104bac
