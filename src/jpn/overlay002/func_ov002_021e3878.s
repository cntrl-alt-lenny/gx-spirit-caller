; func_ov002_021e3878 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ca8b8
        .extern data_ov002_022cd664
        .extern data_ov002_022cd888
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_0202b0ac
        .extern func_0202e1e0
        .extern func_ov002_021ae3c0
        .extern func_ov002_021b1378
        .extern func_ov002_021d46ac
        .extern func_ov002_02245e30
        .extern func_ov002_02258080
        .extern func_ov002_022581cc
        .extern func_ov002_022582cc
        .extern func_ov002_022591d0
        .extern func_ov002_0228c220
        .extern func_ov002_0229cc78
        .extern func_ov002_0229cca8
        .extern func_ov002_0229cd4c
        .global func_ov002_021e3878
        .arm
func_ov002_021e3878:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x100
    ldr r2, _LIT0
    mov r5, r0
    ldr r3, [r2, #0x67c]
    mov r4, r1
    cmp r3, #0x15
    bgt .L_74
    bge .L_2f0
    cmp r3, #0xb
    bgt .L_68
    cmp r3, #0x0
    addge pc, pc, r3, lsl #0x2
    b .L_424
    b .L_90
    b .L_98
    b .L_1ec
    b .L_424
    b .L_424
    b .L_98
    b .L_424
    b .L_424
    b .L_424
    b .L_424
    b .L_21c
    b .L_240
.L_68:
    cmp r3, #0x14
    beq .L_2a0
    b .L_424
.L_74:
    cmp r3, #0x1e
    bgt .L_84
    beq .L_334
    b .L_424
.L_84:
    cmp r3, #0x1f
    beq .L_390
    b .L_424
.L_90:
    add r0, r3, #0x1
    str r0, [r2, #0x67c]
.L_98:
    ldr r0, _LIT1
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x1
    bne .L_f8
    mov r0, r5
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_02245e30
    cmp r0, #0x0
    beq .L_ec
    mov r0, r4
    mov r1, r5
    bl func_ov002_0228c220
    cmp r0, #0x0
    beq .L_ec
    ldr r0, _LIT0
    mov r1, #0xb
    str r1, [r0, #0x67c]
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_ec:
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_f8:
    cmp r0, #0x2
    bne .L_110
    ldr r0, _LIT0
    mov r1, #0x14
    str r1, [r0, #0x67c]
    b .L_1e0
.L_110:
    mov r0, r5
    mov r1, r4
    mov r2, #0x0
    bl func_ov002_02245e30
    cmp r0, #0x0
    bne .L_154
    add r0, sp, #0x0
    mov r1, #0xcd
    bl func_ov002_0229cc78
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_ov002_0229cca8
    add r0, sp, #0x0
    mov r1, #0xce
    bl func_ov002_0229cca8
    mov r1, #0x0
    b .L_1bc
.L_154:
    ldrh r0, [r5]
    bl func_0202e1e0
    cmp r0, #0x0
    ldrh r0, [r5]
    beq .L_194
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0x7
    bl func_ov002_0229cd4c
    mov r0, r5
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_02245e30
    add r1, r0, #0x1
    b .L_1bc
.L_194:
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0x8
    bl func_ov002_0229cd4c
    mov r0, r5
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_02245e30
    add r1, r0, #0x1
.L_1bc:
    ldr r0, _LIT0
    ldr r0, [r0, #0x67c]
    cmp r0, #0x5
    moveq r1, #0x3
    add r0, sp, #0x0
    bl func_ov002_021ae3c0
    ldr r0, _LIT0
    mov r1, #0x2
    str r1, [r0, #0x67c]
.L_1e0:
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1ec:
    ldr r1, _LIT3
    ldr r0, [r1, #0xd44]
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, #0xa
    str r0, [r2, #0x67c]
    mov r0, #0x0
    str r0, [r1, #0xd50]
    add sp, sp, #0x100
    ldmia sp!, {r3, r4, r5, pc}
.L_21c:
    mov r0, #0x5
    bl func_ov002_022591d0
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x67c]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x67c]
    ldmia sp!, {r3, r4, r5, pc}
.L_240:
    ldr r0, _LIT3
    ldr r1, [r0, #0xd50]
    cmp r1, #0x0
    bne .L_264
    mov r0, #0x5
    str r0, [r2, #0x67c]
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_264:
    ldr r1, [r0, #0xd64]
    cmp r1, #0x3
    beq .L_28c
    mov r1, #0x1
    str r1, [r0, #0xd54]
    sub r0, r3, #0x1
    str r0, [r2, #0x67c]
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_28c:
    mov r0, #0x1e
    str r0, [r2, #0x67c]
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_2a0:
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0, #0x480]
    mov r3, r2
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0xf
    bl func_ov002_021b1378
    ldr r2, _LIT0
    mov r0, #0x0
    ldr r1, _LIT4
    str r0, [r2, #0x68c]
    ldr r3, [r1, #0x300]
    add sp, sp, #0x100
    bic r3, r3, #0x20
    str r3, [r1, #0x300]
    ldr r1, [r2, #0x67c]
    add r1, r1, #0x1
    str r1, [r2, #0x67c]
    ldmia sp!, {r3, r4, r5, pc}
.L_2f0:
    ldr r0, _LIT4
    ldr r0, [r0, #0x300]
    mov r0, r0, lsl #0x1a
    movs r0, r0, lsr #0x1f
    addeq sp, sp, #0x100
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r2, #0x68c]
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, #0x1e
    str r0, [r2, #0x67c]
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_334:
    ldrh r1, [r5, #0x2]
    cmp r4, #0x0
    movne r2, #0x8000
    mov r0, r1, lsl #0x11
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r0, r0, r1, lsr #0x1f
    moveq r2, #0x0
    cmp r4, r0
    orr r0, r2, #0x62
    movne r1, #0x1
    moveq r1, #0x0
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d46ac
    ldr r0, _LIT0
    ldr r1, [r0, #0x67c]
    add r1, r1, #0x1
    str r1, [r0, #0x67c]
.L_390:
    ldr r0, _LIT3
    ldr r1, [r0, #0xd74]
    sub r1, r1, #0xb
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_3ec
    b .L_3bc
    b .L_3f4
    b .L_3f4
    b .L_3f4
    b .L_3f4
.L_3bc:
    ldr r0, [r0, #0xd5c]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_3d8
    mov r0, r5
    bl func_ov002_022581cc
    b .L_3f4
.L_3d8:
    mov r0, #0x1
    mov r1, r0
    mov r2, r5
    bl func_ov002_022582cc
    b .L_3f4
.L_3ec:
    mov r0, r5
    bl func_ov002_02258080
.L_3f4:
    ldr r0, _LIT3
    ldr r0, [r0, #0xd50]
    cmp r0, #0x0
    addne sp, sp, #0x100
    mov r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    add sp, sp, #0x100
    str r0, [r1, #0x688]
    mov r0, #0x1
    str r0, [r1, #0x68c]
    ldmia sp!, {r3, r4, r5, pc}
.L_424:
    mov r0, #0x1
    add sp, sp, #0x100
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022ca8b8
_LIT3: .word data_ov002_022d008c
_LIT4: .word data_ov002_022cd888
