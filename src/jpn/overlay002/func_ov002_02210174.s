; func_ov002_02210174 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_ov002_021b3dec
        .extern func_ov002_021bbdcc
        .extern func_ov002_021c2e44
        .global func_ov002_02210174
        .arm
func_ov002_02210174:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldrh r2, [r5]
    ldr r1, _LIT0
    mov r4, #0x0
    cmp r2, r1
    bgt .L_1c4
    bge .L_364
    ldr r0, _LIT1
    cmp r2, r0
    bgt .L_fc
    sub r3, r0, #0x4
    cmp r2, r3
    blt .L_48
    beq .L_354
    cmp r2, r0
    beq .L_36c
    b .L_4bc
.L_48:
    sub r3, r0, #0x214
    cmp r2, r3
    bgt .L_a4
    sub r0, r0, #0x214
    cmp r2, r0
    bge .L_35c
    ldr r1, _LIT2
    cmp r2, r1
    bgt .L_80
    bge .L_35c
    sub r0, r1, #0xf3
    cmp r2, r0
    beq .L_354
    b .L_4bc
.L_80:
    add r0, r1, #0x4d
    cmp r2, r0
    bgt .L_94
    beq .L_354
    b .L_4bc
.L_94:
    ldr r0, _LIT3
    cmp r2, r0
    beq .L_35c
    b .L_4bc
.L_a4:
    ldr r3, _LIT4
    cmp r2, r3
    bgt .L_d8
    bge .L_354
    sub r0, r3, #0xbb
    cmp r2, r0
    bgt .L_c8
    beq .L_354
    b .L_4bc
.L_c8:
    sub r0, r3, #0x57
    cmp r2, r0
    beq .L_354
    b .L_4bc
.L_d8:
    add r0, r3, #0xa7
    cmp r2, r0
    bgt .L_ec
    beq .L_394
    b .L_4bc
.L_ec:
    add r0, r3, #0xd9
    cmp r2, r0
    beq .L_354
    b .L_4bc
.L_fc:
    sub r3, r1, #0x87
    cmp r2, r3
    bgt .L_160
    sub r1, r1, #0x87
    cmp r2, r1
    bge .L_354
    add r1, r0, #0xb3
    cmp r2, r1
    bgt .L_134
    bge .L_354
    add r0, r0, #0x75
    cmp r2, r0
    beq .L_354
    b .L_4bc
.L_134:
    add r1, r0, #0xfb
    cmp r2, r1
    bgt .L_150
    add r0, r0, #0xfb
    cmp r2, r0
    beq .L_35c
    b .L_4bc
.L_150:
    add r0, r0, #0x154
    cmp r2, r0
    beq .L_354
    b .L_4bc
.L_160:
    add r3, r0, #0x190
    cmp r2, r3
    bgt .L_19c
    add r0, r0, #0x190
    cmp r2, r0
    bge .L_354
    sub r0, r1, #0x7b
    cmp r2, r0
    bgt .L_18c
    beq .L_354
    b .L_4bc
.L_18c:
    sub r0, r1, #0x76
    cmp r2, r0
    beq .L_35c
    b .L_4bc
.L_19c:
    add r1, r0, #0x194
    cmp r2, r1
    bgt .L_1b8
    add r0, r0, #0x194
    cmp r2, r0
    beq .L_354
    b .L_4bc
.L_1b8:
    cmp r2, #0x1740
    beq .L_354
    b .L_4bc
.L_1c4:
    ldr r0, _LIT5
    cmp r2, r0
    bgt .L_298
    bge .L_354
    add r3, r1, #0x140
    cmp r2, r3
    bgt .L_230
    mov r0, r3
    cmp r2, r0
    bge .L_3ec
    add r0, r1, #0x48
    cmp r2, r0
    bgt .L_20c
    bge .L_364
    add r0, r1, #0x2e
    cmp r2, r0
    beq .L_3bc
    b .L_4bc
.L_20c:
    add r0, r1, #0x8d
    cmp r2, r0
    bgt .L_220
    beq .L_354
    b .L_4bc
.L_220:
    add r0, r1, #0x8e
    cmp r2, r0
    beq .L_3d0
    b .L_4bc
.L_230:
    sub r3, r0, #0xed
    cmp r2, r3
    bgt .L_26c
    bge .L_354
    rsb r3, r0, #0x3300
    cmp r2, r3
    bgt .L_25c
    rsb r0, r0, #0x3300
    cmp r2, r0
    beq .L_408
    b .L_4bc
.L_25c:
    sub r0, r0, #0xf6
    cmp r2, r0
    beq .L_354
    b .L_4bc
.L_26c:
    sub r1, r0, #0xa1
    cmp r2, r1
    bgt .L_288
    sub r0, r0, #0xa1
    cmp r2, r0
    beq .L_488
    b .L_4bc
.L_288:
    sub r0, r0, #0x40
    cmp r2, r0
    beq .L_4b8
    b .L_4bc
.L_298:
    add r1, r0, #0x5c
    cmp r2, r1
    bgt .L_2f4
    bge .L_4b8
    add r1, r0, #0x18
    cmp r2, r1
    bgt .L_2c8
    bge .L_354
    add r0, r0, #0x4
    cmp r2, r0
    beq .L_354
    b .L_4bc
.L_2c8:
    add r1, r0, #0x1b
    cmp r2, r1
    bgt .L_2e4
    add r0, r0, #0x1b
    cmp r2, r0
    beq .L_354
    b .L_4bc
.L_2e4:
    add r0, r0, #0x54
    cmp r2, r0
    beq .L_35c
    b .L_4bc
.L_2f4:
    add r1, r0, #0xfd
    cmp r2, r1
    bgt .L_330
    bge .L_35c
    add r1, r0, #0x89
    cmp r2, r1
    bgt .L_320
    add r0, r0, #0x89
    cmp r2, r0
    beq .L_354
    b .L_4bc
.L_320:
    add r0, r0, #0xe2
    cmp r2, r0
    beq .L_354
    b .L_4bc
.L_330:
    ldr r0, _LIT6
    cmp r2, r0
    bgt .L_344
    beq .L_354
    b .L_4bc
.L_344:
    add r0, r0, #0xc
    cmp r2, r0
    beq .L_35c
    b .L_4bc
.L_354:
    mov r4, #0x1
    b .L_4bc
.L_35c:
    mov r4, #0x2
    b .L_4bc
.L_364:
    mov r4, #0x3
    b .L_4bc
.L_36c:
    ldrh r2, [r5, #0x2]
    sub r0, r1, #0xee0
    ldr r1, _LIT7
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    rsb r4, r0, #0x2
    b .L_4bc
.L_394:
    ldrh r2, [r5, #0x2]
    sub r0, r1, #0xee0
    ldr r1, _LIT7
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    rsb r4, r0, #0x5
    b .L_4bc
.L_3bc:
    ldrh r0, [r5, #0xc]
    cmp r0, #0x1
    moveq r4, #0x1
    movne r4, #0x2
    b .L_4bc
.L_3d0:
    ldrh r0, [r5, #0x2]
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b3dec
    add r4, r0, #0x1
    b .L_4bc
.L_3ec:
    ldrh r0, [r5, #0x2]
    mov r1, r2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2e44
    add r4, r0, #0x1
    b .L_4bc
.L_408:
    ldrh r6, [r5, #0x2]
    sub r1, r1, #0xee0
    ldr r2, _LIT7
    mov r0, r6, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r7, r3, r1
    ldr r1, [r2, r7]
    cmp r1, #0x0
    bne .L_4bc
    mov r1, r6, lsl #0x1a
    mov r2, r1, lsr #0x1b
    mov r1, #0x14
    mul r6, r2, r1
    ldr r1, _LIT8
    add r1, r1, r7
    add r7, r1, #0x30
    bl func_ov002_021bbdcc
    ldr r2, [r7, r6]
    ldrh r3, [r5, #0x4]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    mov r3, r3, lsl #0x11
    add r1, r1, r2, lsr #0x1f
    cmp r1, r3, lsr #0x17
    moveq r1, #0x1
    movne r1, r4
    cmp r0, r1
    moveq r4, #0x2
    b .L_4bc
.L_488:
    ldrh r1, [r5, #0x2]
    ldr r0, [r5, #0x14]
    mov r1, r1, lsl #0x1f
    mov r2, r1, lsr #0x1f
    mov r1, r0, lsl #0x14
    cmp r2, r1, lsr #0x1f
    beq .L_4b0
    mov r0, r0, lsl #0x16
    cmp r2, r0, lsr #0x1f
    moveq r4, #0x1
.L_4b0:
    add r4, r4, #0x1
    b .L_4bc
.L_4b8:
    mov r4, #0x1
.L_4bc:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00001748
_LIT1: .word 0x00001567
_LIT2: .word 0x00001175
_LIT3: .word 0x000012ec
_LIT4: .word 0x0000145a
_LIT5: .word 0x00001a07
_LIT6: .word 0x00001b1a
_LIT7: .word data_ov002_022cf098
_LIT8: .word data_ov002_022cf08c
