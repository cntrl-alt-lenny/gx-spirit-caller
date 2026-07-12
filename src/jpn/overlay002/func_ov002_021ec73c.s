; func_ov002_021ec73c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_0202e2a4
        .extern func_0202ed3c
        .extern func_ov002_021b8fc8
        .extern func_ov002_021b9dec
        .extern func_ov002_021c1d64
        .extern func_ov002_021c8400
        .extern func_ov002_021c8860
        .extern func_ov002_021c92ec
        .global func_ov002_021ec73c
        .arm
func_ov002_021ec73c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldrh r3, [r8, #0x2]
    mov r7, r1
    mov r6, r2
    mov r3, r3, lsl #0x1f
    cmp r7, r3, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r6, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r3, _LIT0
    and r4, r7, #0x1
    mul r3, r4, r3
    mov r4, #0x14
    mul r5, r6, r4
    ldr ip, _LIT1
    add r4, ip, r3
    add r4, r4, #0x30
    ldr ip, [r4, r5]
    mov ip, ip, lsl #0x13
    movs ip, ip, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr ip, _LIT2
    add r3, ip, r3
    ldrh r3, [r5, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_ov002_021c1d64
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r8]
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_104
    bge .L_1d8
    sub r1, r2, #0x264
    cmp r0, r1
    bgt .L_d4
    bge .L_1d8
    sub r1, r2, #0x3d4
    cmp r0, r1
    bgt .L_c4
    beq .L_180
    b .L_370
.L_c4:
    ldr r1, _LIT4
    cmp r0, r1
    beq .L_188
    b .L_370
.L_d4:
    ldr r1, _LIT5
    cmp r0, r1
    bgt .L_f4
    bge .L_180
    sub r1, r1, #0x5e
    cmp r0, r1
    beq .L_1a4
    b .L_370
.L_f4:
    add r1, r1, #0x71
    cmp r0, r1
    beq .L_180
    b .L_370
.L_104:
    ldr r2, _LIT6
    cmp r0, r2
    bgt .L_150
    bge .L_2f0
    sub r1, r2, #0xd6
    cmp r0, r1
    bgt .L_140
    sub r1, r2, #0xd7
    cmp r0, r1
    blt .L_370
    beq .L_244
    sub r1, r2, #0xd6
    cmp r0, r1
    beq .L_290
    b .L_370
.L_140:
    sub r1, r2, #0x89
    cmp r0, r1
    beq .L_2dc
    b .L_370
.L_150:
    add r1, r2, #0x54
    cmp r0, r1
    bgt .L_170
    bge .L_33c
    add r1, r2, #0x4b
    cmp r0, r1
    beq .L_30c
    b .L_370
.L_170:
    ldr r1, _LIT7
    cmp r0, r1
    beq .L_35c
    b .L_370
.L_180:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_188:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c8860
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1a4:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c8860
    cmp r0, #0x1
    bne .L_1d0
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c8400
    cmp r0, #0x5
    movge r0, #0x1
    ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
.L_1d0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1d8:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b9dec
    ldr r2, _LIT8
    cmp r0, r2
    bgt .L_204
    bge .L_23c
    sub r1, r2, #0xec
    cmp r0, r1
    beq .L_23c
    b .L_370
.L_204:
    add r1, r2, #0x38
    cmp r0, r1
    bgt .L_218
    beq .L_23c
    b .L_370
.L_218:
    add r1, r2, #0x68
    cmp r0, r1
    bgt .L_370
    add r1, r2, #0x67
    cmp r0, r1
    blt .L_370
    addne r1, r2, #0x68
    cmpne r0, r1
    bne .L_370
.L_23c:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_244:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b8fc8
    cmp r0, #0x0
    beq .L_288
    ldr r0, [r4, r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_288
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c8400
    cmp r0, #0x2
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_288:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_290:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b8fc8
    cmp r0, #0x0
    beq .L_2d4
    ldr r0, [r4, r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_2d4
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c8400
    cmp r0, #0x1
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_2d4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2dc:
    mov r0, r7
    mov r1, r6
    mov r2, #0x3
    bl func_ov002_021c92ec
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2f0:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c8860
    cmp r0, #0xb
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_30c:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b9dec
    ldr r2, _LIT9
    cmp r0, r2
    addne r1, r2, #0x5e
    cmpne r0, r1
    addne r1, r2, #0x5f
    cmpne r0, r1
    bne .L_370
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_33c:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b9dec
    ldr r1, _LIT10
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_35c:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b9dec
    bl func_0202ed3c
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_370:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x000016a3
_LIT4: .word 0x00001409
_LIT5: .word 0x0000153d
_LIT6: .word 0x00001882
_LIT7: .word 0x00001a60
_LIT8: .word 0x0000161e
_LIT9: .word 0x0000185a
_LIT10: .word 0x000018b7
