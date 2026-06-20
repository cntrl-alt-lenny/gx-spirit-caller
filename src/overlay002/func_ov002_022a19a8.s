; func_ov002_022a19a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ca3d0
        .extern func_02006110
        .extern func_02006164
        .extern func_0200617c
        .extern func_02006194
        .extern func_02037208
        .extern func_ov002_0229f160
        .extern func_ov002_0229f1e0
        .extern func_ov002_022a0f8c
        .extern func_ov002_022a10fc
        .extern func_ov002_022a16b0
        .extern func_ov002_022acd4c
        .global func_ov002_022a19a8
        .arm
func_ov002_022a19a8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    bge .L_24
    bl func_ov002_022acd4c
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_24:
    add r0, sp, #0xc
    add r1, sp, #0x8
    ldr r5, [r4, #0x20]
    ldr r6, [r4, #0x14]
    bl func_02006110
    mov r0, r4
    bl func_ov002_022a16b0
    ldr r1, [sp, #0x8]
    sub r1, r1, r0
    str r1, [sp, #0x8]
    ldr r0, [r4, #0x4]
    cmp r0, #0xb
    addls pc, pc, r0, lsl #0x2
    b .L_3b0
    b .L_3b0
    b .L_3b0
    b .L_3b0
    b .L_8c
    b .L_3b0
    b .L_188
    b .L_22c
    b .L_3b0
    b .L_3b0
    b .L_22c
    b .L_3b0
    b .L_2b8
.L_8c:
    bl func_02006164
    cmp r0, #0x0
    beq .L_3b0
    ldr r0, [r4, #0x30]
    ldr r1, [sp, #0x8]
    mov r2, r0, lsl #0x3
    cmp r1, r0, lsl #0x3
    blt .L_3b0
    add r0, r2, #0x10
    cmp r1, r0
    bge .L_3b0
    ldr r0, [r4, #0x24]
    ldr r2, [r4, #0x20]
    cmp r0, #0x4
    movlt r8, #0x40
    movge r8, #0x2a
    mul r1, r8, r2
    ldr r3, [sp, #0xc]
    add r1, r1, #0x20
    cmp r3, r1
    blt .L_ec
    add r1, r1, #0x40
    cmp r3, r1
    blt .L_3b0
.L_ec:
    add r7, r2, #0x1
    cmp r7, r0
    bge .L_138
    mul r2, r7, r8
.L_fc:
    add r1, r2, #0x20
    cmp r3, r1
    blt .L_128
    add r1, r1, #0x40
    cmp r3, r1
    bge .L_128
    mov r0, r4
    mov r1, r7
    bl func_ov002_022a10fc
    str r7, [r4, #0x20]
    b .L_138
.L_128:
    add r7, r7, #0x1
    cmp r7, r0
    add r2, r2, r8
    blt .L_fc
.L_138:
    ldr r0, [r4, #0x20]
    subs r7, r0, #0x1
    bmi .L_3b0
    mul r1, r7, r8
    ldr r2, [sp, #0xc]
.L_14c:
    add r0, r1, #0x20
    cmp r2, r0
    blt .L_178
    add r0, r0, #0x40
    cmp r2, r0
    bge .L_178
    mov r0, r4
    mov r1, r7
    bl func_ov002_022a10fc
    str r7, [r4, #0x20]
    b .L_3b0
.L_178:
    sub r1, r1, r8
    subs r7, r7, #0x1
    bpl .L_14c
    b .L_3b0
.L_188:
    ldr r0, [r4, #0x30]
    cmp r1, r0, lsl #0x3
    mov r7, r0, lsl #0x3
    blt .L_3b0
    add r0, r7, #0x20
    cmp r1, r0
    bge .L_3b0
    ldr r0, [sp, #0xc]
    cmp r0, #0x30
    blt .L_220
    cmp r0, #0xd0
    bge .L_220
    sub r0, r0, #0x30
    mov r3, r0, lsr #0x1f
    rsb r2, r3, r0, lsl #0x1c
    adds r2, r3, r2, ror #0x1c
    beq .L_220
    sub r3, r1, r7
    mov r2, r3, lsr #0x1f
    rsb r1, r2, r3, lsl #0x1c
    adds r1, r2, r1, ror #0x1c
    beq .L_220
    mov r1, r3, asr #0x3
    add r1, r3, r1, lsr #0x1c
    mov r2, r1, asr #0x4
    mov r1, #0xa
    mul r3, r2, r1
    mov r1, r0, asr #0x3
    add r0, r0, r1, lsr #0x1c
    ldr r1, [r4, #0x20]
    add r7, r3, r0, asr #0x4
    cmp r1, r7
    beq .L_218
    mov r0, r4
    mov r1, r7
    bl func_ov002_022a10fc
.L_218:
    str r7, [r4, #0x20]
    b .L_3b0
.L_220:
    mov r0, #0x1
    str r0, [r4, #0x18]
    b .L_3b0
.L_22c:
    ldr r0, [r4, #0x30]
    cmp r1, r0, lsl #0x3
    mov r0, r0, lsl #0x3
    blt .L_3b0
    add r0, r0, #0x10
    cmp r1, r0
    bge .L_3b0
    ldr r0, [sp, #0xc]
    cmp r0, #0x34
    blt .L_2ac
    cmp r0, #0xc4
    bge .L_2ac
    sub r7, r0, #0x34
    ldr r8, _LIT0
    mov r3, r7, lsr #0x1f
    smull r0, r1, r8, r7
    add r1, r3, r1, asr #0x2
    mov r2, #0x18
    smull r0, r1, r2, r1
    sub r1, r7, r0
    cmp r1, #0x14
    bge .L_2ac
    smull r0, r7, r8, r7
    ldr r0, [r4, #0x20]
    add r7, r3, r7, asr #0x2
    cmp r0, r7
    beq .L_2a4
    mov r0, r4
    mov r1, r7
    bl func_ov002_022a10fc
.L_2a4:
    str r7, [r4, #0x20]
    b .L_3b0
.L_2ac:
    mov r0, #0x1
    str r0, [r4, #0x18]
    b .L_3b0
.L_2b8:
    ldr r0, _LIT1
    add r2, sp, #0x0
    ldr r1, [r0]
    ldr r0, [r0, #0x4]
    str r1, [sp]
    str r0, [sp, #0x4]
    mov r3, #0x0
.L_2d4:
    ldr r0, [r2, r3, lsl #0x2]
    ldr r1, [sp, #0x8]
    cmp r1, r0
    blt .L_2f4
    add r0, r0, #0x10
    cmp r1, r0
    addlt r5, r3, #0x1
    strlt r5, [r4, #0x20]
.L_2f4:
    add r3, r3, #0x1
    cmp r3, #0x2
    blt .L_2d4
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    beq .L_3b0
    ldr r0, [sp, #0xc]
    cmp r0, #0xe0
    blt .L_3b0
    cmp r0, #0xf0
    bge .L_3b0
    ldr r0, [sp, #0x8]
    cmp r0, #0x20
    blt .L_3b0
    cmp r0, #0x69
    bge .L_3b0
    mov r5, #0x3
    str r5, [r4, #0x20]
    ldr r1, [sp, #0x8]
    cmp r1, #0x28
    movlt r0, #0x0
    strlt r0, [r4, #0x28]
    blt .L_394
    cmp r1, #0x62
    ldr r0, [r4, #0x24]
    ble .L_36c
    mov r0, r0, lsl #0x4
    sub r0, r0, #0x68
    str r0, [r4, #0x28]
    b .L_394
.L_36c:
    mov r0, r0, lsl #0x4
    sub r1, r1, #0x28
    sub r0, r0, #0x68
    mul r3, r1, r0
    ldr r2, _LIT2
    mov r0, r3, lsr #0x1f
    smull r1, r7, r2, r3
    add r7, r3, r7
    add r7, r0, r7, asr #0x5
    str r7, [r4, #0x28]
.L_394:
    ldr r1, [r4, #0x24]
    ldr r0, [r4, #0x28]
    mov r1, r1, lsl #0x4
    sub r1, r1, #0x68
    cmp r0, r1
    movle r1, r0
    str r1, [r4, #0x28]
.L_3b0:
    ldr r0, [r4, #0x194]
    mov r7, #0x0
    cmp r0, #0x0
    ble .L_458
    add r8, r4, #0x198
.L_3c4:
    ldr r1, [sp, #0xc]
    ldr r2, [sp, #0x8]
    mov r0, r8
    bl func_ov002_0229f160
    cmp r0, #0x0
    beq .L_444
    ldr r0, [r4, #0x40]
    cmp r0, #0x0
    streq r7, [r4, #0x14]
    beq .L_40c
    ldr r0, [r4, #0x14]
    cmp r7, r0
    bne .L_40c
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022a0f8c
    cmp r0, #0x0
    beq .L_444
.L_40c:
    bl func_02006194
    cmp r0, #0x0
    beq .L_428
    add r0, r4, r7, lsl #0x5
    mov r1, #0x1
    str r1, [r0, #0x19c]
    b .L_458
.L_428:
    bl func_0200617c
    cmp r0, #0x0
    beq .L_458
    add r0, r4, #0x198
    add r0, r0, r7, lsl #0x5
    bl func_ov002_0229f1e0
    b .L_458
.L_444:
    ldr r0, [r4, #0x194]
    add r7, r7, #0x1
    cmp r7, r0
    add r8, r8, #0x20
    blt .L_3c4
.L_458:
    ldr r0, [r4, #0x20]
    cmp r5, r0
    ldreq r0, [r4, #0x14]
    cmpeq r6, r0
    addeq sp, sp, #0x10
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r4, #0x4]
    mov r2, #0x0
    cmp r0, #0x3
    mov r3, #0x3
    bne .L_498
    mov r0, #0x48
    sub r1, r0, #0x49
    bl func_02037208
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_498:
    mov r0, #0x38
    sub r1, r0, #0x39
    bl func_02037208
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x2aaaaaab
_LIT1: .word data_ov002_022ca3d0
_LIT2: .word 0x8fb823ef
