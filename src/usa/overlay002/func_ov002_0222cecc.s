; func_ov002_0222cecc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern func_ov002_021b98d4
        .extern func_ov002_021bc538
        .extern func_ov002_021c3304
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021ff2cc
        .extern func_ov002_0223de04
        .extern func_ov002_0227acc8
        .global func_ov002_0222cecc
        .arm
func_ov002_0222cecc:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r6, r0
    ldr r3, [r2, #0x5a8]
    cmp r3, #0x7e
    beq .L_1c0
    cmp r3, #0x7f
    beq .L_f0
    cmp r3, #0x80
    bne .L_1cc
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r1, [r6]
    ldr r0, _LIT1
    cmp r1, r0
    bne .L_d8
    ldrh r0, [r6, #0x6]
    mov r5, #0x0
    mov r4, r5
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_bc
.L_64:
    mov r0, r6
    mov r1, r4
    bl func_ov002_0223de04
    ldrh r2, [r6, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b98d4
    movs r2, r0
    bmi .L_a8
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    bl func_ov002_021c3304
    cmp r0, #0x0
    addne r5, r5, #0x1
.L_a8:
    ldrh r0, [r6, #0x6]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x10
    cmp r4, r0, lsr #0x18
    blt .L_64
.L_bc:
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, r5
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
.L_d8:
    bl func_ov002_021e2a4c
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_f0:
    ldrh r0, [r6, #0x6]
    ldr r1, [r2, #0x5ac]
    mov r0, r0, lsl #0x10
    cmp r1, r0, lsr #0x18
    bge .L_1b8
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    beq .L_1b8
    ldr r1, _LIT0
    mov r0, r6
    ldr r1, [r1, #0x5ac]
    bl func_ov002_0223de04
    ldrh r2, [r6, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b98d4
    movs r4, r0
    bmi .L_1a0
    ldrh r0, [r6, #0x2]
    mov r2, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    bl func_ov002_021c3304
    cmp r0, #0x0
    beq .L_1a0
    ldrh r0, [r6, #0x2]
    ldrh r2, [r6]
    ldr r5, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT3
    and r3, r0, #0x1
    mla r1, r3, r1, r5
    add r1, r1, #0x18
    add r1, r1, #0x400
    add r1, r1, r4, lsl #0x2
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227acc8
.L_1a0:
    ldr r1, _LIT0
    mov r0, #0x7f
    ldr r2, [r1, #0x5ac]
    add r2, r2, #0x1
    str r2, [r1, #0x5ac]
    ldmia sp!, {r4, r5, r6, pc}
.L_1b8:
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_1c0:
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_1cc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00001951
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
