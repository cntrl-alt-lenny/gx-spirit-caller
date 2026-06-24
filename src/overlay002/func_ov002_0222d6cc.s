; func_ov002_0222d6cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern func_0202b8a8
        .extern func_0202de9c
        .extern func_ov002_021bc618
        .extern func_ov002_021c988c
        .extern func_ov002_021ca2b8
        .extern func_ov002_021d479c
        .extern func_ov002_021d87dc
        .extern func_ov002_021e13f4
        .extern func_ov002_021e2818
        .extern func_ov002_021e286c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0227adb8
        .global func_ov002_0222d6cc
        .arm
func_ov002_0222d6cc:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x64
    bgt .L_20
    beq .L_2a8
    b .L_2c4
.L_20:
    cmp r0, #0x80
    bgt .L_2c4
    cmp r0, #0x7e
    blt .L_2c4
    beq .L_144
    cmp r0, #0x7f
    beq .L_d4
    cmp r0, #0x80
    bne .L_2c4
    mov r1, #0x0
    ldr r0, _LIT1
    ldr r3, _LIT2
    mov r2, r1
.L_54:
    ldrh r5, [r4, #0x2]
    mov r5, r5, lsl #0x1f
    mov r5, r5, lsr #0x1f
    and r5, r5, #0x1
    mla ip, r5, r3, r0
    ldr r5, [ip, #0x10]
    cmp r1, r5
    bcs .L_a8
    add r5, ip, #0x260
    ldr r5, [r5, r2]
    add ip, r4, r1, lsl #0x1
    mov lr, r5, lsl #0x2
    mov lr, lr, lsr #0x18
    mov r5, r5, lsl #0x12
    mov lr, lr, lsl #0x1
    add r5, lr, r5, lsr #0x1f
    add r1, r1, #0x1
    strh r5, [ip, #0x8]
    cmp r1, #0x4
    add r2, r2, #0x4
    blt .L_54
.L_a8:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    strh r0, [r4, #0x10]
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r1, #0x5ac]
    bl func_ov002_021e2b3c
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_d4:
    ldr r5, [r1, #0x5ac]
    cmp r5, #0x4
    moveq r0, #0x64
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT2
    ldr r1, _LIT3
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    and r2, r3, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x64
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r3, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    add r1, r4, r5, lsl #0x1
    orr r0, r0, #0x57
    ldrh r2, [r1, #0x8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, #0xd
    mov r3, #0x0
    bl func_ov002_021d479c
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_144:
    ldrh r0, [r4, #0x2]
    mov r1, #0xd
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c988c
    cmp r0, #0x0
    bne .L_174
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e2818
.L_174:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d87dc
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT2
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mla r0, r2, r0, r1
    ldr r0, [r0, #0x260]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202de9c
    cmp r0, #0x0
    bne .L_260
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT2
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mla r0, r2, r0, r1
    ldr r0, [r0, #0x260]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8a8
    cmp r0, #0x3
    bgt .L_260
    ldrh r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_244
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_244
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    ldr r4, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT2
    and r3, r0, #0x1
    mla r1, r3, r1, r4
    add r1, r1, #0x260
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227adb8
    b .L_290
.L_244:
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e13f4
    b .L_290
.L_260:
    ldrh r0, [r4, #0x2]
    mov r1, #0xd
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c988c
    cmp r0, #0x0
    bne .L_290
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e2818
.L_290:
    ldr r1, _LIT0
    mov r0, #0x7f
    ldr r2, [r1, #0x5ac]
    add r2, r2, #0x1
    str r2, [r1, #0x5ac]
    ldmia sp!, {r3, r4, r5, pc}
.L_2a8:
    bl func_ov002_021e2c5c
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_2c4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf17c
