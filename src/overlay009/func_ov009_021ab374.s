; func_ov009_021ab374 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104bac
        .extern data_ov009_021ad82c
        .extern data_ov009_021adc54
        .extern func_02005dac
        .extern func_0201e964
        .extern func_0202d9f8
        .extern func_020944a4
        .global func_ov009_021ab374
        .arm
func_ov009_021ab374:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x48
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldrh r1, [r1, #0x52]
    mov r4, r0
    mov r0, #0x0
    ldr fp, [r2, #0x18]
    ldr r7, [r2, #0x1c]
    ldr r5, _LIT2
    str r1, [sp, #0x20]
    add r3, sp, #0x38
    str r0, [sp, #0x24]
    mov r2, #0x8
.L_38:
    ldrb r1, [r5]
    ldrb r0, [r5, #0x1]
    add r5, r5, #0x2
    strb r1, [r3]
    strb r0, [r3, #0x1]
    add r3, r3, #0x2
    subs r2, r2, #0x1
    bne .L_38
    ldr r0, [r4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_c8
    b .L_c8
    b .L_78
    b .L_9c
    b .L_b8
.L_78:
    ldr r0, [r4, #0x4]
    add r2, r0, #0x1
    mov r0, r2, asr #0x4
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    add r0, r1, r0, ror #0x1d
    str r2, [r4, #0x4]
    rsb r7, r0, #0x7
    b .L_c8
.L_9c:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    bne .L_c8
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    str r0, [r4, #0x4]
    b .L_c8
.L_b8:
    ldr r0, [r4, #0x4]
    cmp r0, #0x180
    addle r0, r0, #0x1
    strle r0, [r4, #0x4]
.L_c8:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_dc
    bl func_0202d9f8
    b .L_144
.L_dc:
    ldr r0, [r4]
    cmp r0, #0x2
    bge .L_144
    ldr r1, _LIT3
    mov r0, #0x18
    mul r2, r7, r0
    ldr r0, [r1, #0x38]
    rsb r2, r2, #0xc7
    mov r1, r0, asr #0x2
    add r0, sp, #0x38
    and r1, r1, #0xf
    ldrb r1, [r0, r1]
    ldr r0, _LIT4
    mov r2, r2, lsl #0x17
    orr r3, r0, r2, lsr #0x7
    mov r1, r1, lsl #0x3
    orr r2, r1, #0x4000
    mov r0, #0x1
    mov r1, #0x0
    str r3, [sp, #0x30]
    strh r2, [sp, #0x34]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x30
    mov r2, #0x6
    bl func_020944a4
.L_144:
    mov r8, #0x0
    mov r9, r8
    mov sl, r8
    add r5, sp, #0x28
    mov r6, r8
.L_158:
    mov r0, fp, lsr r9
    ldr r2, [r4]
    and r0, r0, #0xf
    mov r1, #0x0
    cmp r2, #0x1
    beq .L_180
    cmp r2, #0x2
    cmpne r2, #0x3
    beq .L_19c
    b .L_1ac
.L_180:
    cmp r8, r7
    bne .L_1ac
    ldr r2, [r4, #0x4]
    mov r2, r2, asr #0x2
    tst r2, #0x1
    movne r1, #0x1
    b .L_1ac
.L_19c:
    ldr r2, [r4, #0x4]
    mov r2, r2, asr #0x2
    tst r2, #0x1
    movne r1, #0x1
.L_1ac:
    mov r2, #0x51000
    str r2, [sp, #0x2c]
    rsb r2, sl, #0xc9
    mov r2, r2, lsl #0xc
    cmp r0, #0xf
    str r2, [sp, #0x28]
    bne .L_210
    str r6, [sp]
    str r6, [sp, #0x4]
    str r6, [sp, #0x8]
    mov r0, #0x3
    str r0, [sp, #0xc]
    mov r0, #0xc00
    str r0, [sp, #0x10]
    str r6, [sp, #0x14]
    str r6, [sp, #0x18]
    str r6, [sp, #0x1c]
    ldr r1, [r4, #0x3c]
    mov r0, #0x1
    ldr r1, [r1, #0x2c]
    mov r2, r5
    mov r3, r6
    add r1, r1, #0xb0
    bl func_0201e964
    b .L_2c8
.L_210:
    ldr r2, [r4]
    cmp r2, #0x3
    bne .L_274
    and r0, r1, #0x1
    add r1, r0, #0x14
    mov r0, #0x0
    str r0, [sp]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r0, #0x3
    str r0, [sp, #0xc]
    mov r0, #0xc00
    str r0, [sp, #0x10]
    mov r0, #0x0
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
    ldr r3, [r4, #0x3c]
    mov r0, #0x1
    ldr ip, [r3, #0x2c]
    mov r2, r5
    mov r3, #0x0
    add r1, ip, r1, lsl #0x3
    bl func_0201e964
    b .L_2c8
.L_274:
    and r1, r1, #0x1
    add r1, r1, r0, lsl #0x1
    mov r0, #0x0
    str r0, [sp]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r0, #0x3
    str r0, [sp, #0xc]
    mov r0, #0xc00
    str r0, [sp, #0x10]
    mov r0, #0x0
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
    ldr r3, [r4, #0x3c]
    mov r0, #0x1
    ldr ip, [r3, #0x2c]
    mov r2, r5
    mov r3, #0x0
    add r1, ip, r1, lsl #0x3
    bl func_0201e964
.L_2c8:
    add r9, r9, #0x4
    add sl, sl, #0x18
    add r8, r8, #0x1
    cmp r8, #0x8
    blt .L_158
    mov r1, #0xf000
    mov r0, #0x61000
    str r0, [sp, #0x2c]
    ldr r0, [sp, #0x20]
    str r1, [sp, #0x28]
    mov r3, #0x0
    str r3, [sp]
    tst r0, #0x200
    movne r0, #0x1
    str r3, [sp, #0x4]
    strne r0, [sp, #0x24]
    str r3, [sp, #0x8]
    mov r0, #0x3
    str r0, [sp, #0xc]
    mov r0, #0xc00
    str r0, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x3c]
    ldr r0, [sp, #0x24]
    ldr r1, [r1, #0x2c]
    and r0, r0, #0x1
    add r0, r0, #0x17
    add r1, r1, r0, lsl #0x3
    add r2, sp, #0x28
    mov r0, #0x1
    bl func_0201e964
    mov r1, #0xe3000
    mov r0, #0x61000
    str r0, [sp, #0x2c]
    ldr r0, [sp, #0x20]
    str r1, [sp, #0x28]
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    tst r0, #0x100
    mov r2, #0x0
    str r3, [sp, #0x8]
    mov r0, #0x3
    str r0, [sp, #0xc]
    mov r0, #0xc00
    str r0, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x3c]
    movne r2, #0x1
    and r0, r2, #0x1
    ldr r1, [r1, #0x2c]
    add r0, r0, #0x19
    add r1, r1, r0, lsl #0x3
    add r2, sp, #0x28
    mov r0, #0x1
    bl func_0201e964
    mov r0, #0x1
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104bac
_LIT1: .word data_ov009_021adc54
_LIT2: .word data_ov009_021ad82c
_LIT3: .word data_021040ac
_LIT4: .word 0xc000804d
