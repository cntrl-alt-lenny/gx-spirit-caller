; func_ov002_0229dbfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov002_022ca280
        .extern data_ov002_022ca290
        .extern data_ov002_022cd65c
        .extern func_02006148
        .extern func_02006178
        .extern func_ov002_0229dab8
        .global func_ov002_0229dbfc
        .arm
func_ov002_0229dbfc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    ldr r3, _LIT0
    mov r5, r0
    ldr r0, [r3, #0x4]
    mov r4, r1
    mov r0, r0, lsl #0x1b
    mov r0, r0, lsr #0x1e
    tst r0, #0x2
    ldr r0, _LIT1
    ldr r1, [r5, #0xa0]
    ldr r0, [r0, #0x4]
    addne r2, r2, #0x10
    eor r0, r0, #0x1
    cmp r1, r0
    moveq r1, #0x1
    ldr r0, _LIT2
    movne r1, #0x0
    ldr r0, [r0, r1, lsl #0x2]
    sub r0, r0, #0xd
    subs r0, r2, r0
    bmi .L_2e4
    cmp r0, #0x1a
    bge .L_2e4
    ldr r6, [r5, #0xa8]
    add r0, sp, #0x0
    mov r1, r5
    mov r2, r6
    bl func_ov002_0229dab8
    ldr r0, _LIT1
    ldr r7, [sp]
    ldr r0, [r0, #0x4]
    ldr r1, [sp, #0x4]
    ldr r3, [r5, #0xa0]
    eor r2, r0, #0x1
    str r7, [sp, #0x8]
    str r1, [sp, #0xc]
    cmp r3, r2
    bne .L_100
    add r0, r7, #0xb
    sub r0, r4, r0
    rsbs r0, r0, #0x0
    ldr lr, _LIT3
    mov r7, r0, lsr #0x1f
    smull ip, r1, lr, r0
    add r1, r7, r1, asr #0x2
    bmi .L_160
    ldr r7, [r5, #0xa4]
    cmp r7, #0x8
    movgt r7, #0x8
    cmp r1, r7
    bge .L_160
    ldr r4, _LIT3
    mov r2, r0, lsr #0x1f
    smull r3, r5, r4, r0
    add r5, r2, r5, asr #0x2
    mov r4, #0x16
    smull r2, r3, r4, r5
    sub r5, r0, r2
    cmp r5, #0x2
    sublt r0, r4, #0x17
    add sp, sp, #0x10
    addge r0, r1, r6
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_100:
    sub r0, r7, #0xb
    subs r0, r4, r0
    ldr r7, _LIT3
    mov ip, r0, lsr #0x1f
    smull lr, r1, r7, r0
    add r1, ip, r1, asr #0x2
    bmi .L_160
    ldr r7, [r5, #0xa4]
    cmp r7, #0x8
    movgt r7, #0x8
    cmp r1, r7
    bge .L_160
    ldr r4, _LIT3
    mov r2, r0, lsr #0x1f
    smull r3, r5, r4, r0
    add r5, r2, r5, asr #0x2
    mov r4, #0x16
    smull r2, r3, r4, r5
    sub r5, r0, r2
    cmp r5, #0x2
    sublt r0, r4, #0x17
    add sp, sp, #0x10
    addge r0, r1, r6
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_160:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1b
    mov r0, r0, lsr #0x1e
    tst r0, #0x1
    ldr r0, [r5, #0xa8]
    addne r4, r4, #0x18
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    cmp r0, #0x0
    beq .L_224
    cmp r3, r2
    moveq r1, #0x1
    ldr r0, _LIT4
    movne r1, #0x0
    ldr r1, [r0, r1, lsl #0x2]
    sub r0, r1, #0xc
    cmp r4, r0
    blt .L_224
    add r0, r1, #0xc
    cmp r4, r0
    bge .L_224
    mvn r0, #0x0
    str r0, [r5, #0xb8]
    bl func_02006148
    cmp r0, #0x0
    ldrne r0, [r5, #0xa8]
    addne sp, sp, #0x10
    subne r0, r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_02006178
    cmp r0, #0x0
    beq .L_224
    ldr r1, [r5, #0xac]
    mvn r0, #0x0
    sub r1, r1, #0x1
    cmp r1, r0
    movge r1, r0
    mvn r0, #0xf
    str r1, [r5, #0xac]
    cmp r1, r0
    bge .L_224
    mov r0, #0x0
    str r0, [r5, #0xac]
    ldr r0, [r5, #0xa8]
    add sp, sp, #0x10
    sub r0, r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_224:
    ldr r0, [r5, #0xa4]
    ldr r1, [r5, #0xa8]
    sub r0, r0, #0x8
    cmp r1, r0
    movlt r0, #0x1
    movge r0, #0x0
    cmp r0, #0x0
    beq .L_2e4
    ldr r0, _LIT1
    ldr r1, [r5, #0xa0]
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r1, r0
    moveq r1, #0x1
    movne r1, #0x0
    ldr r0, _LIT4
    eor r1, r1, #0x1
    ldr r1, [r0, r1, lsl #0x2]
    sub r0, r1, #0xc
    cmp r4, r0
    blt .L_2e4
    add r0, r1, #0xc
    cmp r4, r0
    bge .L_2e4
    mov r0, #0x1
    str r0, [r5, #0xb8]
    bl func_02006148
    cmp r0, #0x0
    ldrne r0, [r5, #0xa8]
    addne sp, sp, #0x10
    addne r0, r0, #0x8
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_02006178
    cmp r0, #0x0
    beq .L_2e4
    ldr r0, [r5, #0xac]
    add r0, r0, #0x1
    cmp r0, #0x1
    movlt r0, #0x1
    str r0, [r5, #0xac]
    cmp r0, #0x10
    ble .L_2e4
    mov r0, #0x0
    str r0, [r5, #0xac]
    ldr r0, [r5, #0xa8]
    add sp, sp, #0x10
    add r0, r0, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2e4:
    mvn r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_ov002_022cd65c
_LIT2: .word data_ov002_022ca280
_LIT3: .word 0x2e8ba2e9
_LIT4: .word data_ov002_022ca290
