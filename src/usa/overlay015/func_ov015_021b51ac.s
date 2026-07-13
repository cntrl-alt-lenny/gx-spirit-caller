; func_ov015_021b51ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov015_021b5d08
        .extern data_ov015_021b5d24
        .extern data_ov015_021b5d34
        .extern func_02006178
        .extern func_0200a2d8
        .extern func_020371b8
        .extern func_0207eb80
        .extern func_0207ecac
        .extern func_0207ef74
        .extern func_0207fc40
        .extern func_ov005_021ac8c8
        .extern func_ov015_021b228c
        .extern func_ov015_021b22f4
        .extern func_ov015_021b2350
        .extern func_ov015_021b2824
        .extern func_ov015_021b35c4
        .extern func_ov015_021b36e4
        .extern func_ov015_021b3cfc
        .extern func_ov015_021b3f44
        .extern func_ov015_021b4184
        .extern func_ov015_021b4290
        .extern func_ov015_021b432c
        .extern func_ov015_021b445c
        .extern func_ov015_021b45b0
        .extern func_ov015_021b4628
        .global func_ov015_021b51ac
        .arm
func_ov015_021b51ac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    mov sl, #0x0
    add r1, sp, #0x0
    ldr r6, [r0, #0x1c]
    ldr r5, _LIT1
    ldr r7, _LIT2
    mov r4, sl
    str sl, [r1]
    str sl, [r1, #0x4]
.L_b24:
    mov r0, r7
    bl func_0207ecac
    mov r0, r7
    bl func_0207eb80
    add r0, r7, #0x1c
    add r4, r4, #0x1
    cmp r4, #0x2
    add r7, r0, #0x400
    blt .L_b24
    add r0, r5, #0x48
    ldr r1, [r5]
    add r0, r0, #0x400
    str r0, [sp, #0x8]
    cmp r1, #0x6
    add r0, r5, #0x2c
    addls pc, pc, r1, lsl #0x2
    b .L_da0
    b .L_da0
    b .L_d5c
    b .L_b84
    b .L_ba0
    b .L_c58
    b .L_ca4
    b .L_cc0
.L_b84:
    add r1, sp, #0x8
    add r0, r0, #0x400
    bl func_ov015_021b3f44
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
    b .L_da0
.L_ba0:
    mov r0, #0x1000
    bl func_ov015_021b45b0
    cmp r0, #0x1
    bne .L_c38
    ldr r0, [r5, #0x878]
    ldr r1, [r5, #0x8dc]
    bl func_ov005_021ac8c8
    mov r7, r0
    sub r0, r7, #0x1
    bl func_0200a2d8
    mov r4, r0
    ldr r0, [r5, #0x848]
    bl func_ov015_021b228c
    str r0, [r5, #0x84c]
    ldrh r0, [r4, #0x4]
    add r1, r5, #0x238
    ldr r3, _LIT3
    orr r2, r0, #0x2
    orr r2, r2, #0x4
    strh r2, [r4, #0x4]
    ldr r2, [r3]
    mov r0, r7
    bic r2, r2, #0x1f00
    orr r2, r2, #0x1e00
    add r1, r1, #0x800
    str r2, [r3]
    bl func_ov015_021b36e4
    add r0, r5, #0x2c
    add r1, sp, #0x8
    add r0, r0, #0x400
    bl func_ov015_021b432c
    ldr r2, [sp, #0x4]
    ldr r1, [r5, #0xa84]
    add r2, r2, r0
    orr r0, r1, #0x8
    str r2, [sp, #0x4]
    str r0, [r5, #0xa84]
    b .L_da0
.L_c38:
    add r0, r5, #0x2c
    add r1, sp, #0x8
    add r0, r0, #0x400
    bl func_ov015_021b4290
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
    b .L_da0
.L_c58:
    ldr r3, _LIT3
    add r1, sp, #0x8
    ldr r2, [r3]
    add r0, r0, #0x400
    bic r2, r2, #0x1f00
    orr r2, r2, #0x1f00
    str r2, [r3]
    bl func_ov015_021b432c
    ldr r1, [sp, #0x4]
    add r1, r1, r0
    mov r0, #0x1000
    str r1, [sp, #0x4]
    bl func_ov015_021b4628
    cmp r0, #0x1
    bne .L_da0
    ldr r0, [r5, #0xa84]
    orr r0, r0, #0x8
    str r0, [r5, #0xa84]
    b .L_da0
.L_ca4:
    add r1, sp, #0x8
    add r0, r0, #0x400
    bl func_ov015_021b432c
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
    b .L_da0
.L_cc0:
    mov r0, #0x1000
    bl func_ov015_021b45b0
    cmp r0, #0x1
    bne .L_d3c
    bl func_ov015_021b35c4
    mov r2, r0
    ldr r0, [r5, #0x848]
    mov r1, #0x0
    bl func_ov015_021b2350
    ldr r0, [r5, #0x848]
    ldr r1, [r5, #0x84c]
    bl func_ov015_021b22f4
    ldr r2, _LIT3
    add r0, r5, #0x238
    ldr r1, [r2]
    add r0, r0, #0x800
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1e00
    str r1, [r2]
    bl func_ov015_021b3cfc
    add r0, r5, #0x2c
    add r1, sp, #0x8
    add r0, r0, #0x400
    bl func_ov015_021b3f44
    ldr r2, [sp, #0x4]
    ldr r1, [r5, #0xa84]
    add r0, r2, r0
    str r0, [sp, #0x4]
    orr r0, r1, #0x8
    str r0, [r5, #0xa84]
    b .L_da0
.L_d3c:
    add r0, r5, #0x2c
    add r1, sp, #0x8
    add r0, r0, #0x400
    bl func_ov015_021b432c
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
    b .L_da0
.L_d5c:
    ldr r3, _LIT3
    add r1, sp, #0x8
    ldr r2, [r3]
    add r0, r0, #0x400
    bic r2, r2, #0x1f00
    orr r2, r2, #0x1f00
    str r2, [r3]
    bl func_ov015_021b3f44
    ldr r1, [sp, #0x4]
    add r1, r1, r0
    mov r0, #0x1000
    str r1, [sp, #0x4]
    bl func_ov015_021b4628
    cmp r0, #0x1
    ldreq r0, [r5, #0xa84]
    orreq r0, r0, #0x8
    streq r0, [r5, #0xa84]
.L_da0:
    add r1, r5, #0x2c
    add r2, sp, #0x8
    add r0, r5, #0x850
    add r1, r1, #0x400
    bl func_ov015_021b2824
    ldr r1, [sp, #0x4]
    add r7, r5, #0x2c
    add r0, r1, r0
    str r0, [sp, #0x4]
    add r8, r5, #0x10
    mov r9, #0x0
    add r4, sp, #0x0
.L_dd0:
    ldr r0, [r4, r9, lsl #0x2]
    cmp r0, #0x0
    ble .L_df0
    mov r2, r0, lsl #0x10
    mov r0, r8
    mov r1, r7
    mov r2, r2, lsr #0x10
    bl func_0207ef74
.L_df0:
    add r0, r7, #0x1c
    add r1, r8, #0x1c
    add r9, r9, #0x1
    cmp r9, #0x2
    add r7, r0, #0x400
    add r8, r1, #0x400
    blt .L_dd0
    bl func_02006178
    cmp r0, #0x0
    bne .L_e3c
    ldr r0, [r5]
    cmp r0, #0x2
    beq .L_e30
    cmp r0, #0x5
    beq .L_e38
    b .L_e3c
.L_e30:
    bl func_ov015_021b4184
    b .L_e3c
.L_e38:
    bl func_ov015_021b445c
.L_e3c:
    ldr r1, [r5, #0xa84]
    mov r0, r1, lsl #0x1d
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_ee4
    ldr r0, [r5]
    bic r1, r1, #0x4
    str r1, [r5, #0xa84]
    cmp r0, #0x2
    beq .L_e70
    cmp r0, #0x5
    beq .L_ec4
    b .L_ee4
.L_e70:
    mov r0, #0x42
    mov r4, #0x3
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r5]
    bl func_020371b8
    ldr r0, _LIT0
    mov r1, #0x14000
    str r1, [r0, #0x24]
    str r1, [r0, #0x28]
    ldr r1, [r5, #0x848]
    mov sl, #0x1
    ldr r0, [r1, #0x70]
    orr r0, r0, #0x2
    str r0, [r1, #0x70]
    ldr r0, [r5, #0x8f4]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r5, #0x8f4]
    b .L_ee4
.L_ec4:
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r5, #0xa84]
    orr r0, r0, #0x8
    str r0, [r5, #0xa84]
.L_ee4:
    ldr r1, [r5, #0xa84]
    mov r0, r1, lsl #0x1c
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_1008
    ldr r0, [r5]
    bic r1, r1, #0x8
    str r1, [r5, #0xa84]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_1008
    b .L_1008
    b .L_fe8
    b .L_f2c
    b .L_f78
    b .L_f90
    b .L_fa8
    b .L_fd0
.L_f2c:
    ldr r3, [r5, #0x848]
    mov r0, #0x3a
    ldr r2, [r3, #0x70]
    sub r1, r0, #0x3b
    orr r2, r2, #0x2
    str r2, [r3, #0x70]
    ldr r3, [r5, #0x8f4]
    mov r2, #0x0
    bic r3, r3, #0x1
    orr r4, r3, #0x1
    mov r3, #0x1
    str r4, [r5, #0x8f4]
    bl func_020371b8
    ldr r0, _LIT0
    mov r1, #0x10000
    str r1, [r0, #0x24]
    str r1, [r0, #0x28]
    mov r6, #0x3
    b .L_1008
.L_f78:
    ldr r0, _LIT0
    mov r1, #0x10000
    str r1, [r0, #0x24]
    str r1, [r0, #0x28]
    mov r6, #0x4
    b .L_1008
.L_f90:
    ldr r1, [r5, #0x848]
    mov r6, #0x5
    ldr r0, [r1, #0x70]
    bic r0, r0, #0x2
    str r0, [r1, #0x70]
    b .L_1008
.L_fa8:
    ldr r3, [r5, #0x848]
    ldr r0, _LIT0
    ldr r2, [r3, #0x70]
    mov r1, #0x10000
    orr r2, r2, #0x2
    str r2, [r3, #0x70]
    str r1, [r0, #0x24]
    str r1, [r0, #0x28]
    mov r6, #0x6
    b .L_1008
.L_fd0:
    ldr r0, _LIT0
    mov r1, #0x10000
    str r1, [r0, #0x24]
    str r1, [r0, #0x28]
    mov r6, #0x1
    b .L_1008
.L_fe8:
    ldr r1, [r5, #0x848]
    mov r6, #0x2
    ldr r0, [r1, #0x70]
    bic r0, r0, #0x2
    str r0, [r1, #0x70]
    ldr r0, [r5, #0x8f4]
    bic r0, r0, #0x1
    str r0, [r5, #0x8f4]
.L_1008:
    ldr r0, [r5, #0x87c]
    cmp r0, #0x0
    beq .L_102c
    add r0, r5, #0x198
    add r0, r0, #0x800
    mov r1, #0x1000
    bl func_0207fc40
    ldr r0, [r5, #0x9c4]
    str r0, [r5, #0x98c]
.L_102c:
    mov r0, sl
    str r6, [r5]
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov015_021b5d08
_LIT1: .word data_ov015_021b5d24
_LIT2: .word data_ov015_021b5d34
_LIT3: .word 0x04001000
