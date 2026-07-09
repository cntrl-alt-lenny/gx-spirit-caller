; func_ov002_021ec430 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_0202b83c
        .extern func_ov002_021ba024
        .extern func_ov002_021bc1a8
        .extern func_ov002_021bc538
        .extern func_ov002_021bc7e8
        .extern func_ov002_021c8400
        .extern func_ov002_021c8860
        .extern func_ov002_021c92ec
        .extern func_ov002_02253600
        .global func_ov002_021ec430
        .arm
func_ov002_021ec430:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    ldr r4, _LIT0
    and r8, r7, #0x1
    mul r5, r8, r4
    mov r8, r0
    mov r6, r2
    mov r3, #0x14
    mul r4, r6, r3
    ldr ip, _LIT1
    ldrh r0, [r8, #0x2]
    add r3, ip, r5
    add r3, r3, r4
    ldr ip, [r3, #0x30]
    mov r3, r0, lsl #0x14
    mov r3, r3, lsr #0x1a
    cmp r3, #0x23
    mov ip, ip, lsl #0x13
    mov r3, ip, lsr #0x13
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc7e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    beq .L_a4
    ldr r1, _LIT2
    add r1, r1, r5
    ldrh r1, [r4, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_a4:
    bl func_ov002_021bc538
    cmp r0, #0x0
    bne .L_e0
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r7
    mov r1, r6
    bl func_ov002_021bc1a8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_e0:
    ldrh r0, [r8]
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_150
    bge .L_250
    ldr r2, _LIT4
    cmp r0, r2
    bgt .L_114
    bge .L_1e4
    sub r1, r2, #0xf
    cmp r0, r1
    beq .L_1c8
    b .L_2dc
.L_114:
    add r1, r2, #0x198
    cmp r0, r1
    bgt .L_128
    beq .L_1e4
    b .L_2dc
.L_128:
    ldr r2, _LIT5
    cmp r0, r2
    bgt .L_2dc
    sub r1, r2, #0x2
    cmp r0, r1
    blt .L_2dc
    beq .L_220
    cmp r0, r2
    beq .L_234
    b .L_2dc
.L_150:
    ldr r2, _LIT6
    cmp r0, r2
    bgt .L_184
    bge .L_278
    sub r1, r2, #0x8e
    cmp r0, r1
    bgt .L_174
    beq .L_264
    b .L_2dc
.L_174:
    sub r1, r2, #0x4
    cmp r0, r1
    beq .L_278
    b .L_2dc
.L_184:
    add r1, r2, #0x76
    cmp r0, r1
    bgt .L_198
    beq .L_28c
    b .L_2dc
.L_198:
    add r1, r2, #0x79
    cmp r0, r1
    bgt .L_2dc
    add r1, r2, #0x77
    cmp r0, r1
    blt .L_2dc
    addne r1, r2, #0x78
    cmpne r0, r1
    addne r1, r2, #0x79
    cmpne r0, r1
    beq .L_28c
    b .L_2dc
.L_1c8:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c8860
    cmp r0, #0xa
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1e4:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c8400
    movs r2, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r8, #0x2]
    ldrh r1, [r8]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02253600
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_220:
    ldr r2, _LIT7
    mov r0, r7
    mov r1, r6
    bl func_ov002_021ba024
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_234:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c8860
    cmp r0, #0x14
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_250:
    ldr r2, _LIT8
    mov r0, r7
    mov r1, r6
    bl func_ov002_021ba024
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_264:
    mov r0, r7
    mov r1, r6
    mov r2, #0x5
    bl func_ov002_021c92ec
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_278:
    ldr r2, _LIT9
    mov r0, r7
    mov r1, r6
    bl func_ov002_021ba024
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_28c:
    ldr r2, _LIT1
    ldrh r1, [r8, #0x4]
    add r2, r2, r5
    add r2, r2, #0x30
    ldr r2, [r2, r4]
    mov r3, r1, lsl #0x11
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    cmp r1, r3, lsr #0x17
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_0202b83c
    mov r2, r0
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c92ec
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2dc:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x0000187e
_LIT4: .word 0x0000140b
_LIT5: .word 0x00001715
_LIT6: .word 0x000019b5
_LIT7: .word 0x00000fc9
_LIT8: .word 0x000013c3
_LIT9: .word 0x000018f6
