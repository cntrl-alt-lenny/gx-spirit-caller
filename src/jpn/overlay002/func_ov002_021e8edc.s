; func_ov002_021e8edc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern func_0202e21c
        .extern func_0202e3d8
        .extern func_0202ea5c
        .extern func_ov002_021b38e4
        .extern func_ov002_021b9dec
        .extern func_ov002_021ba024
        .extern func_ov002_021bc538
        .extern func_ov002_021c1d64
        .extern func_ov002_021c1e10
        .extern func_ov002_021c4bbc
        .extern func_ov002_021c8390
        .extern func_ov002_021c83ac
        .extern func_ov002_021c83c8
        .extern func_ov002_021c8860
        .extern func_ov002_021c92ec
        .extern func_ov002_02253600
        .global func_ov002_021e8edc
        .arm
func_ov002_021e8edc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x2c
    mov r9, r1
    ldr r4, _LIT0
    and r5, r9, #0x1
    mul r7, r5, r4
    mov r8, r2
    mov r3, #0x14
    mul r6, r8, r3
    ldr r4, _LIT1
    cmp r8, #0x5
    add r3, r4, r7
    add r4, r3, #0x30
    ldr r3, [r4, r6]
    mov sl, r0
    mov r3, r3, lsl #0x13
    mov r5, r3, lsr #0x13
    addge sp, sp, #0x2c
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r5, #0x0
    addeq sp, sp, #0x2c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r3, _LIT2
    add r3, r3, r7
    ldrh r3, [r6, r3]
    cmp r3, #0x0
    addeq sp, sp, #0x2c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_ov002_021c1e10
    cmp r0, #0x0
    addeq sp, sp, #0x2c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, sl
    mov r1, r9
    mov r2, r8
    bl func_ov002_021c1d64
    cmp r0, #0x0
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r9
    mov r1, r8
    bl func_ov002_021c8860
    ldrh r1, [sl]
    ldr r2, _LIT3
    cmp r1, r2
    bgt .L_13c
    bge .L_378
    ldr r2, _LIT4
    cmp r1, r2
    bgt .L_110
    bge .L_258
    ldr r2, _LIT5
    cmp r1, r2
    bgt .L_100
    bge .L_220
    sub r2, r2, #0x1a
    cmp r1, r2
    beq .L_1d0
    b .L_61c
.L_100:
    add r0, r2, #0xd
    cmp r1, r0
    beq .L_238
    b .L_61c
.L_110:
    cmp r1, #0x16c0
    bgt .L_12c
    bge .L_2c0
    add r0, r2, #0xac
    cmp r1, r0
    beq .L_2a8
    b .L_61c
.L_12c:
    add r2, r2, #0xea
    cmp r1, r2
    beq .L_360
    b .L_61c
.L_13c:
    ldr r0, _LIT6
    cmp r1, r0
    bgt .L_184
    bge .L_47c
    sub r3, r0, #0x9b
    cmp r1, r3
    bgt .L_174
    mov r2, r3
    cmp r1, r2
    bge .L_444
    sub r0, r0, #0xe0
    cmp r1, r0
    beq .L_3a4
    b .L_61c
.L_174:
    sub r0, r0, #0x64
    cmp r1, r0
    beq .L_464
    b .L_61c
.L_184:
    add r2, r0, #0xc4
    cmp r1, r2
    bgt .L_1a4
    bge .L_53c
    add r0, r0, #0x48
    cmp r1, r0
    beq .L_524
    b .L_61c
.L_1a4:
    add r2, r0, #0xd3
    cmp r1, r2
    bgt .L_1c0
    add r0, r0, #0xd3
    cmp r1, r0
    beq .L_588
    b .L_61c
.L_1c0:
    ldr r0, _LIT7
    cmp r1, r0
    beq .L_5a4
    b .L_61c
.L_1d0:
    ldr r2, _LIT1
    ldrh r1, [sl, #0x4]
    add r2, r2, r7
    add r2, r2, #0x30
    ldr r2, [r2, r6]
    mov r3, r1, lsl #0x11
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    cmp r1, r3, lsr #0x17
    addeq sp, sp, #0x2c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r0, #0x3
    moveq r0, #0x1
    add sp, sp, #0x2c
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_220:
    cmp r0, #0xf
    cmpne r0, #0x12
    moveq r0, #0x1
    add sp, sp, #0x2c
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_238:
    mov r0, r9
    mov r1, r8
    bl func_ov002_021c83c8
    cmp r0, #0x320
    movle r0, #0x1
    add sp, sp, #0x2c
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_258:
    ldr r0, _LIT8
    mov r4, #0x0
    add r0, r0, r7
    ldr r0, [r6, r0]
    mov r1, r0, lsr #0x16
    mov r0, r0, lsr #0x17
    and r1, r1, #0x1
    and r0, r0, #0x1
    adds r0, r1, r0
    beq .L_29c
    mov r0, r9
    mov r1, r8
    mov r2, r4
    bl func_ov002_021b38e4
    ldr r1, _LIT9
    cmp r0, r1
    movne r4, #0x1
.L_29c:
    add sp, sp, #0x2c
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_2a8:
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b9dec
    bl func_0202e3d8
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_2c0:
    ldrh r3, [sl, #0x2]
    ldrh r2, [sl, #0x4]
    ldr r0, _LIT0
    mov r1, r3, lsl #0x1f
    mov r5, r1, lsr #0x1f
    and r1, r5, #0x1
    mov r4, r3, lsl #0x1a
    mul r0, r1, r0
    ldr r3, _LIT1
    mov r4, r4, lsr #0x1b
    mov r1, #0x14
    add r3, r3, r0
    mul r1, r4, r1
    add r3, r3, #0x30
    ldr r3, [r3, r1]
    mov r6, r2, lsl #0x11
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp r2, r6, lsr #0x17
    bne .L_61c
    ldr r2, _LIT2
    add r0, r2, r0
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_61c
    mov r0, r9
    mov r1, r8
    bl func_ov002_021c8390
    mov r6, r0
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c8390
    cmp r6, r0
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_360:
    cmp r0, #0xb
    cmpne r0, #0xc
    moveq r0, #0x1
    add sp, sp, #0x2c
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_378:
    mov r0, r9
    mov r1, r8
    bl func_ov002_021c8390
    ldrh r2, [sl, #0xc]
    mov r1, #0x2bc
    add sp, sp, #0x2c
    mul r1, r2, r1
    cmp r0, r1
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_3a4:
    ldrh r3, [sl, #0x2]
    ldrh r2, [sl, #0x4]
    ldr r0, _LIT0
    mov r1, r3, lsl #0x1f
    mov r5, r1, lsr #0x1f
    and r1, r5, #0x1
    mov r4, r3, lsl #0x1a
    mul r0, r1, r0
    ldr r3, _LIT1
    mov r4, r4, lsr #0x1b
    mov r1, #0x14
    add r3, r3, r0
    mul r1, r4, r1
    add r3, r3, #0x30
    ldr r3, [r3, r1]
    mov r6, r2, lsl #0x11
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp r2, r6, lsr #0x17
    bne .L_61c
    ldr r2, _LIT2
    add r0, r2, r0
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_61c
    mov r0, r9
    mov r1, r8
    bl func_ov002_021c83ac
    mov r6, r0
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c8390
    cmp r6, r0
    movlt r0, #0x1
    add sp, sp, #0x2c
    movge r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_444:
    mov r0, r9
    mov r1, r8
    bl func_ov002_021c8390
    cmp r0, #0x7d0
    movne r0, #0x1
    add sp, sp, #0x2c
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_464:
    mov r0, r9
    mov r1, r8
    sub r2, r2, #0x7c
    bl func_ov002_021ba024
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_47c:
    ldrh r2, [sl, #0x2]
    ldrh r4, [sl, #0x4]
    ldr r1, _LIT0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mov r6, r2, lsl #0x1a
    mul r2, r3, r1
    ldr r5, _LIT1
    mov r1, r6, lsr #0x1b
    mov r3, #0x14
    add r5, r5, r2
    mul r3, r1, r3
    add r5, r5, #0x30
    ldr r5, [r5, r3]
    mov r6, r4, lsl #0x11
    mov r4, r5, lsl #0x2
    mov r4, r4, lsr #0x18
    mov r5, r5, lsl #0x12
    mov r4, r4, lsl #0x1
    add r4, r4, r5, lsr #0x1f
    cmp r4, r6, lsr #0x17
    bne .L_61c
    ldr r4, _LIT2
    add r2, r4, r2
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    beq .L_61c
    bl func_ov002_021c8390
    mov r4, r0
    add r2, sp, #0x0
    mov r0, r9
    mov r1, r8
    bl func_ov002_021c4bbc
    ldr r0, [sp, #0x14]
    cmp r0, r4
    ldrlt r0, [sp, #0x18]
    add sp, sp, #0x2c
    cmplt r0, r4
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_524:
    mov r0, r9
    mov r1, r8
    mov r2, #0x5
    bl func_ov002_021c92ec
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_53c:
    ldr r1, _LIT1
    ldrh r0, [sl, #0x4]
    add r1, r1, r7
    add r1, r1, #0x30
    ldr r1, [r1, r6]
    mov r2, r0, lsl #0x11
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r0, r2, lsr #0x17
    addeq sp, sp, #0x2c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r5
    bl func_0202e21c
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_588:
    mov r0, r9
    bl func_ov002_021bc538
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x2c
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_5a4:
    mov r0, r5
    bl func_0202ea5c
    cmp r0, #0x0
    addeq sp, sp, #0x2c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [sl, #0x4]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_610
    ldr r0, [r4, r6]
    ldrh r1, [sl, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r4, r1, lsl #0x1f
    mov r3, r0, lsl #0x10
    mov r2, r5, lsl #0x10
    ldrh r1, [sl]
    mov r0, r4, lsr #0x1f
    orr r2, r3, r2, lsr #0x10
    bl func_ov002_02253600
    cmp r0, #0x0
    addeq sp, sp, #0x2c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_610:
    add sp, sp, #0x2c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_61c:
    mov r0, #0x0
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x0000186a
_LIT4: .word 0x000015e4
_LIT5: .word 0x000014d3
_LIT6: .word 0x000019a9
_LIT7: .word 0x00001afb
_LIT8: .word data_ov002_022cf0cc
_LIT9: .word 0x0000ffff
