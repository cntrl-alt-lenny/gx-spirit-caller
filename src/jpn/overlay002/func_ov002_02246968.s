; func_ov002_02246968 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cabbc
        .extern data_ov002_022cd65c
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce4a8
        .extern data_ov002_022d008c
        .extern func_0202b0ac
        .extern func_0202e1e0
        .extern func_ov002_021ae3c0
        .extern func_ov002_021b1378
        .extern func_ov002_02245cec
        .extern func_ov002_02245e30
        .extern func_ov002_022460f0
        .extern func_ov002_022591d0
        .extern func_ov002_0228c0c0
        .extern func_ov002_0228c220
        .extern func_ov002_0229cc78
        .extern func_ov002_0229cca8
        .extern func_ov002_0229cd4c
        .global func_ov002_02246968
        .arm
func_ov002_02246968:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x100
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r1, [r0, #0x698]
    ldr r5, [r2, #0x4]
    cmp r1, #0x0
    mov r4, #0x0
    beq .L_b70
    ldr r0, [r0, #0x484]
    ldr r3, _LIT2
    sub r2, r0, #0x1
    mov r0, #0x18
    mla r4, r2, r0, r3
.L_b70:
    ldr r2, _LIT0
    ldr r0, [r2, #0x694]
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b .L_f20
    b .L_bb0
    b .L_c74
    b .L_db8
    b .L_e0c
    b .L_e44
    b .L_c74
    b .L_f20
    b .L_f20
    b .L_f20
    b .L_f20
    b .L_ea8
.L_bb0:
    ldr r3, _LIT3
    ldr r3, [r3, r5, lsl #0x2]
    cmp r3, #0x1
    bne .L_c6c
    cmp r1, #0x0
    beq .L_c0c
    mov r0, r4
    mov r1, r5
    mov r2, #0x1
    bl func_ov002_02245e30
    cmp r0, #0x0
    beq .L_c4c
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228c220
    cmp r0, #0x0
    beq .L_c4c
    ldr r0, _LIT0
    mov r1, #0x4
    str r1, [r0, #0x694]
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_c0c:
    mov r0, r5
    mov r1, #0x1
    bl func_ov002_02245cec
    cmp r0, #0x0
    beq .L_c4c
    mov r0, r5
    mov r1, #0x0
    bl func_ov002_0228c0c0
    cmp r0, #0x0
    beq .L_c4c
    ldr r0, _LIT0
    mov r1, #0x4
    str r1, [r0, #0x694]
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_c4c:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x10
    bl func_ov002_021b1378
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_c6c:
    add r0, r0, #0x1
    str r0, [r2, #0x694]
.L_c74:
    ldr r0, _LIT0
    ldr r0, [r0, #0x698]
    cmp r0, #0x0
    beq .L_d34
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_02245e30
    cmp r0, #0x0
    bne .L_cc8
    add r0, sp, #0x0
    mov r1, #0xcd
    bl func_ov002_0229cc78
    ldr r1, _LIT4
    add r0, sp, #0x0
    bl func_ov002_0229cca8
    add r0, sp, #0x0
    mov r1, #0xce
    bl func_ov002_0229cca8
    mov r1, #0x0
    b .L_d88
.L_cc8:
    ldrh r0, [r4]
    bl func_0202e1e0
    cmp r0, #0x0
    ldrh r0, [r4]
    beq .L_d08
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0x7
    bl func_ov002_0229cd4c
    mov r0, r4
    mov r1, r5
    mov r2, #0x1
    bl func_ov002_02245e30
    add r1, r0, #0x1
    b .L_d88
.L_d08:
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0x8
    bl func_ov002_0229cd4c
    mov r0, r4
    mov r1, r5
    mov r2, #0x1
    bl func_ov002_02245e30
    add r1, r0, #0x1
    b .L_d88
.L_d34:
    mov r0, r5
    mov r1, #0x0
    bl func_ov002_02245cec
    cmp r0, #0x0
    add r0, sp, #0x0
    bne .L_d74
    mov r1, #0xcc
    bl func_ov002_0229cc78
    ldr r1, _LIT4
    add r0, sp, #0x0
    bl func_ov002_0229cca8
    add r0, sp, #0x0
    mov r1, #0xce
    bl func_ov002_0229cca8
    mov r1, #0x0
    b .L_d88
.L_d74:
    bl func_ov002_022460f0
    mov r0, r5
    mov r1, #0x1
    bl func_ov002_02245cec
    add r1, r0, #0x1
.L_d88:
    ldr r0, _LIT0
    ldr r0, [r0, #0x694]
    cmp r0, #0x5
    moveq r1, #0x3
    add r0, sp, #0x0
    bl func_ov002_021ae3c0
    ldr r0, _LIT0
    mov r1, #0x2
    str r1, [r0, #0x694]
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_db8:
    ldr r1, _LIT5
    ldr r3, [r1, #0xd44]
    cmp r3, #0x0
    bne .L_df4
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x10
    bl func_ov002_021b1378
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x5d4]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_df4:
    add r0, r0, #0x1
    str r0, [r2, #0x694]
    mov r0, #0x0
    str r0, [r1, #0xd50]
    add sp, sp, #0x100
    ldmia sp!, {r3, r4, r5, pc}
.L_e0c:
    cmp r1, #0x0
    beq .L_e20
    mov r0, #0x5
    bl func_ov002_022591d0
    b .L_e28
.L_e20:
    mov r0, #0x4
    bl func_ov002_022591d0
.L_e28:
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x694]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x694]
    ldmia sp!, {r3, r4, r5, pc}
.L_e44:
    ldr r1, _LIT5
    ldr r3, [r1, #0xd50]
    cmp r3, #0x0
    bne .L_e68
    mov r0, #0x5
    str r0, [r2, #0x694]
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_e68:
    ldr r3, [r1, #0xd64]
    cmp r3, #0x3
    beq .L_e90
    mov r3, #0x1
    str r3, [r1, #0xd54]
    sub r0, r0, #0x1
    str r0, [r2, #0x694]
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_e90:
    mov r0, #0x0
    str r0, [r1, #0xd50]
    mov r1, #0xa
    str r1, [r2, #0x694]
    add sp, sp, #0x100
    ldmia sp!, {r3, r4, r5, pc}
.L_ea8:
    cmp r1, #0x0
    beq .L_ee4
    ldr r1, _LIT5
    mov r0, #0x11
    ldr r4, [r1, #0xd70]
    ldr r2, [r1, #0xd74]
    ldr r3, [r1, #0xd78]
    mov r1, r4, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021b1378
    b .L_f14
.L_ee4:
    ldr r1, _LIT5
    mov r0, #0xe
    ldr r4, [r1, #0xd70]
    ldr r2, [r1, #0xd74]
    ldr r3, [r1, #0xd78]
    mov r1, r4, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021b1378
.L_f14:
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_f20:
    mov r0, #0x1
    add sp, sp, #0x100
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd65c
_LIT2: .word data_ov002_022ce4a8
_LIT3: .word data_ov002_022cd664
_LIT4: .word data_ov002_022cabbc
_LIT5: .word data_ov002_022d008c
