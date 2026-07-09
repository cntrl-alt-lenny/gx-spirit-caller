; func_ov002_021ffb50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202b824
        .extern func_ov002_021fd578
        .extern func_ov002_0223dda4
        .global func_ov002_021ffb50
        .arm
func_ov002_021ffb50:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    movs r5, r1
    mov r6, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r1, [r5, #0x2]
    ldrh r2, [r6, #0x2]
    mov r0, r1, lsl #0x11
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, r2, lsl #0x1f
    eor r0, r0, r1, lsr #0x1f
    cmp r0, r2, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r0, [r5]
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_c4
    sub r1, r2, #0x6
    cmp r0, r1
    blt .L_6c
    subne r1, r2, #0x5
    cmpne r0, r1
    cmpne r0, r2
    beq .L_2d4
    b .L_344
.L_6c:
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_a0
    bge .L_244
    ldr r1, _LIT2
    cmp r0, r1
    bgt .L_90
    beq .L_124
    b .L_344
.L_90:
    add r1, r1, #0x8c
    cmp r0, r1
    beq .L_124
    b .L_344
.L_a0:
    add r1, r2, #0x56
    cmp r0, r1
    bgt .L_b4
    beq .L_2d4
    b .L_344
.L_b4:
    add r1, r2, #0xf6
    cmp r0, r1
    beq .L_124
    b .L_344
.L_c4:
    add r1, r2, #0x2c
    cmp r0, r1
    bgt .L_f8
    bge .L_124
    add r1, r2, #0xc
    cmp r0, r1
    bgt .L_e8
    beq .L_124
    b .L_344
.L_e8:
    add r1, r2, #0x2b
    cmp r0, r1
    beq .L_124
    b .L_344
.L_f8:
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_118
    bge .L_1a8
    add r1, r2, #0x43
    cmp r0, r1
    beq .L_124
    b .L_344
.L_118:
    ldr r1, _LIT4
    cmp r0, r1
    bne .L_344
.L_124:
    mov r0, r5
    mov r1, #0x0
    bl func_ov002_0223dda4
    and r2, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r5, r0, asr #0x8
    ldr r0, _LIT5
    ldr r1, _LIT6
    and r4, r2, #0x1
    mla r3, r4, r0, r1
    and r1, r5, #0xff
    mov r0, #0x14
    mla r0, r1, r0, r3
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r3, [r6, #0x2]
    mov r4, r3, lsl #0x1f
    cmp r2, r4, lsr #0x1f
    moveq r2, r3, lsl #0x1a
    cmpeq r1, r2, lsr #0x1b
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    bl func_0202b824
    cmp r0, #0x17
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1a8:
    mov r0, r5
    mov r1, #0x0
    bl func_ov002_0223dda4
    and r4, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r3, r0, asr #0x8
    ldr r0, _LIT5
    ldr r1, _LIT6
    and r2, r4, #0x1
    mla r1, r2, r0, r1
    and r5, r3, #0xff
    mov r0, #0x14
    mla r0, r5, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r0, r0, lsl #0x10
    movs r7, r0, lsr #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r0, [r6, #0x2]
    mov r1, r0, lsl #0x1f
    cmp r4, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    cmpeq r5, r0, lsr #0x1b
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r7
    bl func_0202b824
    cmp r0, #0x17
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r4
    mov r1, r5
    mov r2, r7
    bl func_ov002_021fd578
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_244:
    ldr r9, _LIT6
    ldr r7, _LIT5
    mov r4, #0x0
    mov r8, #0x14
.L_254:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0223dda4
    and r2, r0, #0xff
    and r1, r2, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r3, r0, asr #0x8
    mla r0, r1, r7, r9
    and r1, r3, #0xff
    mla r0, r1, r8, r0
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_2c0
    ldrh r3, [r6, #0x2]
    mov ip, r3, lsl #0x1f
    cmp r2, ip, lsr #0x1f
    moveq r2, r3, lsl #0x1a
    cmpeq r1, r2, lsr #0x1b
    beq .L_2c0
    bl func_0202b824
    cmp r0, #0x17
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2c0:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_254
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2d4:
    ldr r4, _LIT6
    ldr r8, _LIT5
    mov r7, #0x5
    mov r5, #0x64
.L_2e4:
    ldrh r1, [r6, #0x2]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r0, r2, r8, r4
    add r0, r0, r5
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    movne r1, r1, lsl #0x1a
    cmpne r7, r1, lsr #0x1b
    beq .L_32c
    bl func_0202b824
    cmp r0, #0x17
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_32c:
    add r7, r7, #0x1
    cmp r7, #0xa
    add r5, r5, #0x14
    blt .L_2e4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_344:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00001321
_LIT1: .word 0x000011f0
_LIT2: .word 0x00000ffa
_LIT3: .word 0x0000149b
_LIT4: .word 0x000016b8
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022cf08c
