; func_ov014_021b3568 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov014_021b4d48
        .extern data_ov014_0223515c
        .extern func_02037208
        .extern func_ov014_021b34f0
        .extern func_ov014_021b379c
        .extern func_ov014_021b4810
        .extern func_ov014_021b484c
        .extern func_ov014_021b4ac4
        .global func_ov014_021b3568
        .arm
func_ov014_021b3568:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq .L_28
    cmp r1, #0x1
    beq .L_1d4
    cmp r1, #0x2
    beq .L_1f4
    b .L_220
.L_28:
    ldr r1, _LIT0
    ldrh r2, [r1, #0x52]
    cmp r2, #0x0
    beq .L_198
    ldrh r1, [r1, #0x54]
    tst r1, #0x1
    beq .L_4c
    bl func_ov014_021b379c
    ldmia sp!, {r4, r5, r6, pc}
.L_4c:
    tst r1, #0x40
    beq .L_b0
    ldr r0, [r4, #0x34]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_98
    b .L_74
    b .L_90
    b .L_90
    b .L_90
.L_74:
    ldrsb r0, [r4, #0xc]
    cmp r0, #0x0
    moveq r0, #0x2
    streq r0, [r4, #0x34]
    movne r0, #0x3
    strne r0, [r4, #0x34]
    b .L_98
.L_90:
    sub r0, r0, #0x1
    str r0, [r4, #0x34]
.L_98:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_220
.L_b0:
    tst r1, #0x80
    beq .L_120
    ldr r0, [r4, #0x34]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_108
    b .L_d8
    b .L_d8
    b .L_e4
    b .L_100
.L_d8:
    add r0, r0, #0x1
    str r0, [r4, #0x34]
    b .L_108
.L_e4:
    ldrsb r0, [r4, #0xc]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r4, #0x34]
    movne r0, #0x3
    strne r0, [r4, #0x34]
    b .L_108
.L_100:
    mov r0, #0x0
    str r0, [r4, #0x34]
.L_108:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_220
.L_120:
    tst r1, #0x30
    beq .L_15c
    ldr r0, [r4, #0x34]
    cmp r0, #0x1
    cmpne r0, #0x2
    bne .L_220
    ldr r1, [r4, #0x30]
    mov r0, #0x38
    rsb ip, r1, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str ip, [r4, #0x30]
    bl func_02037208
    b .L_220
.L_15c:
    tst r1, #0x8
    ldrnesb r0, [r4, #0xc]
    cmpne r0, #0x0
    beq .L_220
    ldr r0, [r4, #0x34]
    cmp r0, #0x3
    bge .L_220
    mov r0, #0x38
    mov ip, #0x3
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str ip, [r4, #0x34]
    bl func_02037208
    b .L_220
.L_198:
    ldr r6, _LIT1
    mov r5, #0x0
.L_1a0:
    mov r0, r4
    mov r1, r6
    bl func_ov014_021b34f0
    cmp r0, #0x0
    beq .L_1c0
    mov r0, r4
    bl func_ov014_021b379c
    ldmia sp!, {r4, r5, r6, pc}
.L_1c0:
    add r5, r5, #0x1
    cmp r5, #0x6
    add r6, r6, #0xc
    blt .L_1a0
    b .L_220
.L_1d4:
    ldr r0, _LIT2
    bl func_ov014_021b484c
    cmp r0, #0x0
    movne r0, #0x2
    strne r0, [r4, #0x4]
    ldr r0, _LIT2
    bl func_ov014_021b4ac4
    b .L_220
.L_1f4:
    ldr r0, _LIT2
    bl func_ov014_021b4810
    cmp r0, #0x0
    beq .L_220
    ldr r0, _LIT2
    ldr r0, [r0, #0x8]
    rsbs r0, r0, #0x1
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, #0x0
    str r0, [r4, #0x4]
.L_220:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02104bac
_LIT1: .word data_ov014_021b4d48
_LIT2: .word data_ov014_0223515c
