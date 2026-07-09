; func_ov002_02238c5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d0d8c
        .extern func_0202b8fc
        .extern func_ov002_021ae320
        .extern func_ov002_021c3afc
        .extern func_ov002_021c8390
        .extern func_ov002_021df728
        .extern func_ov002_021e2460
        .extern func_ov002_021e26d0
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0226aea4
        .global func_ov002_02238c5c
        .arm
func_ov002_02238c5c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r1, _LIT0
    mov r9, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x6e
    bgt .L_28
    bge .L_1e8
    cmp r0, #0x64
    beq .L_204
    b .L_224
.L_28:
    cmp r0, #0x80
    bgt .L_224
    cmp r0, #0x7f
    blt .L_224
    beq .L_bc
    cmp r0, #0x80
    bne .L_224
    ldrh r0, [r9, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_ov002_021c3afc
    cmp r0, #0x0
    ldrh r0, [r9, #0x2]
    bne .L_a0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0x1
    rsb r0, r0, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x6e
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_a0:
    ldrh r1, [r9]
    mov r0, r0, lsl #0x1f
    mov r2, #0x1
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226aea4
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_bc:
    ldrh r2, [r9, #0x2]
    ldr r1, _LIT3
    ldr r0, _LIT1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    rsb r3, r2, #0x1
    ldr r2, _LIT4
    and r3, r3, #0x1
    mla r0, r3, r0, r2
    ldrh r6, [r1, #0xb0]
    add r0, r0, r6, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8fc
    ldr r1, _LIT5
    mov r7, r0
    cmp r7, r1
    beq .L_1c8
    mov r5, #0x0
    ldr r4, _LIT4
    ldr sl, _LIT1
    mov r8, r5
.L_118:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mla r2, r1, sl, r4
    add r2, r2, r8
    ldr r1, [r2, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    ldrneh r1, [r2, #0x38]
    cmpne r1, #0x0
    beq .L_1b8
    mov r1, r5
    bl func_ov002_021c8390
    cmp r0, r7
    blt .L_1b8
    bl func_ov002_021e2a4c
    ldrh r0, [r9, #0x2]
    ldr r3, _LIT4
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r2, r1, #0x120
    mov r1, r6
    add r2, r2, r6, lsl #0x2
    mov r3, #0x1
    bl func_ov002_021e2460
    ldrh r1, [r9, #0x2]
    mov r0, r9
    mov r2, #0x1f4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df728
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1b8:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r8, r8, #0x14
    ble .L_118
.L_1c8:
    ldrh r1, [r9, #0x2]
    mov r0, r9
    mov r2, #0x1f4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021df728
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1e8:
    ldrh r0, [r9, #0x2]
    mov r1, #0x11
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_204:
    ldrh r0, [r9, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_224:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022d0d8c
_LIT4: .word data_ov002_022cf08c
_LIT5: .word 0x0000ffff
