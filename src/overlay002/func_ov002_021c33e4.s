; func_ov002_021c33e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf288
        .extern func_0202e310
        .extern func_0203058c
        .extern func_02030808
        .extern func_ov002_021b3ecc
        .extern func_ov002_021bb90c
        .extern func_ov002_021bbe8c
        .extern func_ov002_021bce2c
        .extern func_ov002_021ca3f0
        .extern func_ov002_021ca440
        .global func_ov002_021c33e4
        .arm
func_ov002_021c33e4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r4, _LIT0
    ldr r3, _LIT1
    and r1, r1, #0x1
    mla r3, r1, r3, r4
    add r1, r3, #0x18
    mov r7, r2
    add r6, r1, #0x400
    ldr r1, [r6, r7, lsl #0x2]
    mov r5, r0
    mov r0, r1, lsl #0x13
    mov r4, r0, lsr #0x13
    mov r0, r4
    bl func_02030808
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    bl func_0203058c
    cmp r0, #0x0
    beq .L_108
    ldr r0, [r6, r7, lsl #0x2]
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    bl func_0202e310
    cmp r0, #0x0
    beq .L_8c
    mov r0, r5
    bl func_ov002_021bbe8c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_8c:
    ldr r1, _LIT2
    cmp r4, r1
    beq .L_a8
    add r0, r1, #0x7c
    cmp r4, r0
    beq .L_c4
    b .L_120
.L_a8:
    mov r0, r5
    sub r1, r1, #0xe8
    bl func_ov002_021bb90c
    cmp r0, #0x0
    bne .L_120
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_c4:
    ldr r0, _LIT1
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r0, _LIT3
    ldr r0, [r0, r2]
    mov r0, r0, lsr #0x11
    tst r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, _LIT4
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_120
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_108:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ca440
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_120:
    ldr r1, _LIT5
    cmp r4, r1
    bgt .L_18c
    bge .L_1cc
    sub r0, r1, #0x124
    cmp r4, r0
    bgt .L_150
    bge .L_1d4
    sub r0, r1, #0x144
    cmp r4, r0
    beq .L_1cc
    b .L_1ec
.L_150:
    sub r0, r1, #0x88
    cmp r4, r0
    bgt .L_164
    beq .L_1cc
    b .L_1ec
.L_164:
    sub r0, r1, #0x45
    cmp r4, r0
    bgt .L_1ec
    sub r0, r1, #0x48
    cmp r4, r0
    blt .L_1ec
    subne r0, r1, #0x45
    cmpne r4, r0
    beq .L_1cc
    b .L_1ec
.L_18c:
    rsb r0, r1, #0x2dc0
    cmp r4, r0
    bgt .L_1ac
    bge .L_1cc
    add r0, r1, #0x1
    cmp r4, r0
    beq .L_1cc
    b .L_1ec
.L_1ac:
    ldr r0, _LIT6
    cmp r4, r0
    bgt .L_1c0
    beq .L_1cc
    b .L_1ec
.L_1c0:
    add r0, r0, #0x58
    cmp r4, r0
    bne .L_1ec
.L_1cc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1d4:
    mov r0, r5
    mov r1, #0x1
    bl func_ov002_021bce2c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_1ec:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ca3f0
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0x000014fc
_LIT3: .word data_ov002_022cf288
_LIT4: .word 0x000012f3
_LIT5: .word 0x000015f9
_LIT6: .word 0x000017c8
