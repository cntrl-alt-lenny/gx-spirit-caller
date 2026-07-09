; func_ov002_0222de5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021aff6c
        .extern func_ov002_021b3d48
        .extern func_ov002_021b97e4
        .extern func_ov002_021bc538
        .extern func_ov002_021e2480
        .extern func_ov002_021e277c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021ff2cc
        .extern func_ov002_022535a4
        .extern func_ov002_0226af64
        .extern func_ov002_0227acc8
        .global func_ov002_0222de5c
        .arm
func_ov002_0222de5c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r6, r1
    ldrh r2, [r5]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0xb
    bl func_ov002_021b3d48
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
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022535a4
    cmp r0, #0x0
    ldrh r0, [r5, #0x2]
    bne .L_4d0
    mov r0, r0, lsl #0x1f
    mov r1, #0xd
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, pc}
.L_4d0:
    mov r0, r0, lsl #0x1f
    mov r1, #0x30
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
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
    bl func_ov002_021af8f0
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_514:
    mov r2, #0x0
    ldr r0, _LIT1
    str r2, [r1, #0x5ac]
    ldr r0, [r0, #0xd44]
    strh r0, [r5, #0x8]
    bl func_ov002_021e2a4c
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
    bl func_ov002_021bc538
    cmp r0, #0x0
    beq .L_590
    ldr r0, _LIT0
    ldr r0, [r0, #0x5ac]
    add r0, r0, #0x1
    bl func_ov002_021aff6c
    ldrh r3, [r5, #0x2]
    ldrh r2, [r5]
    mov r1, r0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227acc8
    b .L_5f8
.L_590:
    ldr r0, _LIT0
    ldr r0, [r0, #0x5ac]
    add r0, r0, #0x1
    bl func_ov002_021aff6c
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5ac]
    add r0, r0, #0x1
    bl func_ov002_021aff6c
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
    bl func_ov002_021b97e4
    ldrh r3, [r5, #0x2]
    mov r1, r0
    mov r2, #0x0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e2480
.L_5f8:
    ldr r1, _LIT0
    mov r0, #0x7d
    ldr r2, [r1, #0x5ac]
    add r2, r2, #0x1
    str r2, [r1, #0x5ac]
    ldmia sp!, {r4, r5, r6, pc}
.L_610:
    bl func_ov002_021e2b6c
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
    bl func_ov002_0226af64
    mov r0, #0x63
    ldmia sp!, {r4, r5, r6, pc}
.L_644:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_65c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
