; func_ov002_0222df4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021b004c
        .extern func_ov002_021b3e28
        .extern func_ov002_021b98c4
        .extern func_ov002_021bc618
        .extern func_ov002_021e2570
        .extern func_ov002_021e286c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021ff3bc
        .extern func_ov002_0225368c
        .extern func_ov002_0226b054
        .extern func_ov002_0227adb8
        .global func_ov002_0222df4c
        .arm
func_ov002_0222df4c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r6, r1
    ldrh r2, [r5]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0xb
    bl func_ov002_021b3e28
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7d
    bgt .L_458
    bge .L_534
    cmp r0, #0x64
    bgt .L_65c
    cmp r0, #0x63
    blt .L_65c
    beq .L_644
    cmp r0, #0x64
    beq .L_628
    b .L_65c
.L_458:
    cmp r0, #0x80
    bgt .L_65c
    cmp r0, #0x7e
    blt .L_65c
    beq .L_514
    cmp r0, #0x7f
    beq .L_4e8
    cmp r0, #0x80
    bne .L_65c
    mov r0, r5
    mov r1, r6
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    cmp r0, #0x0
    ldrh r0, [r5, #0x2]
    bne .L_4d0
    mov r0, r0, lsl #0x1f
    mov r1, #0xd
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, pc}
.L_4d0:
    mov r0, r0, lsl #0x1f
    mov r1, #0x30
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_4e8:
    ldrh r0, [r5, #0x2]
    cmp r4, #0x20
    ldrh r2, [r5]
    movge r4, #0x20
    mov r0, r0, lsl #0x1f
    add r1, r4, #0x6
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_514:
    mov r2, #0x0
    ldr r0, _LIT1
    str r2, [r1, #0x5ac]
    ldr r0, [r0, #0xd44]
    strh r0, [r5, #0x8]
    bl func_ov002_021e2b3c
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, pc}
.L_534:
    ldrh r0, [r5, #0x8]
    ldr r1, [r1, #0x5ac]
    cmp r1, r0
    bge .L_610
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_590
    ldr r0, _LIT0
    ldr r0, [r0, #0x5ac]
    add r0, r0, #0x1
    bl func_ov002_021b004c
    ldrh r3, [r5, #0x2]
    ldrh r2, [r5]
    mov r1, r0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227adb8
    b .L_5f8
.L_590:
    ldr r0, _LIT0
    ldr r0, [r0, #0x5ac]
    add r0, r0, #0x1
    bl func_ov002_021b004c
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5ac]
    add r0, r0, #0x1
    bl func_ov002_021b004c
    ldr r0, [r0]
    ldrh r2, [r5, #0x2]
    mov r0, r0, lsl #0x2
    ldr r1, [r4]
    mov r3, r2, lsl #0x1f
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    mov r0, r3, lsr #0x1f
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021b98c4
    ldrh r3, [r5, #0x2]
    mov r1, r0
    mov r2, #0x0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e2570
.L_5f8:
    ldr r1, _LIT0
    mov r0, #0x7d
    ldr r2, [r1, #0x5ac]
    add r2, r2, #0x1
    str r2, [r1, #0x5ac]
    ldmia sp!, {r4, r5, r6, pc}
.L_610:
    bl func_ov002_021e2c5c
    ldrh r0, [r5, #0x8]
    cmp r0, r4
    movlt r0, #0x64
    movge r0, #0x63
    ldmia sp!, {r4, r5, r6, pc}
.L_628:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b054
    mov r0, #0x63
    ldmia sp!, {r4, r5, r6, pc}
.L_644:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_65c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d016c
