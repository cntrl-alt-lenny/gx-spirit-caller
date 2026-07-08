; func_ov002_021ec0b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_0202e2ec
        .extern func_ov002_021c8400
        .extern func_ov002_021c8860
        .extern func_ov002_021e7778
        .global func_ov002_021ec0b4
        .arm
func_ov002_021ec0b4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r7, r1
    mov r6, r2
    bl func_ov002_021e7778
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT0
    and r2, r7, #0x1
    mov r0, #0x14
    mul r5, r2, r1
    mul r4, r6, r0
    ldr r1, _LIT1
    add r0, r1, r5
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c8860
    ldrh r1, [r8]
    ldr r3, _LIT2
    cmp r1, r3
    bgt .L_b4
    bge .L_150
    ldr r3, _LIT3
    cmp r1, r3
    bgt .L_a4
    sub r2, r3, #0x1
    cmp r1, r2
    blt .L_94
    beq .L_110
    cmp r1, r3
    beq .L_120
    b .L_1c4
.L_94:
    ldr r2, _LIT4
    cmp r1, r2
    beq .L_100
    b .L_1c4
.L_a4:
    ldr r0, _LIT5
    cmp r1, r0
    beq .L_130
    b .L_1c4
.L_b4:
    add r2, r3, #0x6b
    cmp r1, r2
    bgt .L_d4
    bge .L_188
    add r0, r3, #0x1
    cmp r1, r0
    beq .L_16c
    b .L_1c4
.L_d4:
    add r2, r3, #0x6d
    cmp r1, r2
    bgt .L_1c4
    add r2, r3, #0x6c
    cmp r1, r2
    blt .L_1c4
    beq .L_19c
    add r2, r3, #0x6d
    cmp r1, r2
    beq .L_1b0
    b .L_1c4
.L_100:
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_110:
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_120:
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_130:
    ldr r0, _LIT6
    add r0, r0, r5
    add r0, r0, r4
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2ec
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_150:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c8400
    cmp r0, #0x3
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_16c:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c8400
    cmp r0, #0x5
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_188:
    cmp r0, #0x7
    cmpne r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_19c:
    cmp r0, #0xf
    cmpne r0, #0x12
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1b0:
    cmp r0, #0x3
    cmpne r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1c4:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4
_LIT2: .word 0x00001ad6
_LIT3: .word 0x000014ce
_LIT4: .word 0x000013b0
_LIT5: .word 0x000015d8
_LIT6: .word data_ov002_022cf08c
