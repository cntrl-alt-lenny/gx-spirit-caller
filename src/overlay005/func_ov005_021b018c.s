; func_ov005_021b018c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov005_021b1c8c
        .extern data_ov005_021b224c
        .extern func_020054a4
        .extern func_0202c0c0
        .extern func_02037208
        .extern func_ov005_021af090
        .extern func_ov005_021af2dc
        .extern func_ov005_021afba0
        .extern func_ov005_021b0b30
        .global func_ov005_021b018c
        .arm
func_ov005_021b018c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x4]
    mov r2, r2, lsl #0x1d
    movs r2, r2, lsr #0x1d
    bne .L_c98
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_ef0
    b .L_a74
    b .L_b04
    b .L_bb4
    b .L_bbc
.L_a74:
    ldrh r5, [r4, #0x28]
    add lr, r4, #0x48
    ldr r1, _LIT1
    add r0, lr, r5, lsl #0x1
    ldrb ip, [r1]
    ldrb r3, [r1, #0x1]
    ldrb r2, [lr, r5, lsl #0x1]
    ldrb r1, [r0, #0x1]
    add r3, r3, ip, lsl #0x8
    mov ip, r5, lsl #0x1
    add r1, r1, r2, lsl #0x8
    cmp r3, r1
    bne .L_adc
    add r1, ip, #0x2
    add r3, lr, r1
    ldrb r2, [lr, r1]
    ldrb r1, [r3, #0x1]
    adds r1, r1, r2, lsl #0x8
    bne .L_adc
    mov r1, #0x0
    strb r1, [r0]
    ldrh r0, [r4, #0x28]
    mov r0, r0, lsl #0x1
    add r0, r0, #0x1
    add r0, r4, r0
    strb r1, [r0, #0x48]
.L_adc:
    ldrh r0, [r4, #0x28]
    mov r2, #0x0
    mov r3, #0x1
    cmp r0, #0x0
    subne r0, r0, #0x1
    strneh r0, [r4, #0x28]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_02037208
    b .L_ef0
.L_b04:
    ldrh r0, [r4, #0x28]
    add ip, r4, #0x48
    mov r3, r0, lsl #0x1
    ldrsb r0, [ip, r3]
    cmp r0, #0x0
    bne .L_b5c
    ldr r1, _LIT1
    ldrb r2, [r1]
    ldrb r0, [r1, #0x1]
    add r0, r0, r2, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    strb r0, [ip, r3]
    ldrh r0, [r4, #0x28]
    ldrb r2, [r1]
    ldrb r1, [r1, #0x1]
    mov r0, r0, lsl #0x1
    add r0, r0, #0x1
    add r1, r1, r2, lsl #0x8
    add r0, r4, r0
    strb r1, [r0, #0x48]
.L_b5c:
    ldr r1, [r4, #0x8]
    mov r2, #0x0
    cmp r1, #0x4
    bhi .L_b7c
    mov r0, #0x1
    mov r1, r0, lsl r1
    tst r1, #0x19
    movne r2, r0
.L_b7c:
    cmp r2, #0x0
    movne r0, #0xa
    moveq r0, #0xc
    ldrh r1, [r4, #0x28]
    sub r0, r0, #0x1
    mov r2, #0x0
    cmp r1, r0
    addlt r0, r1, #0x1
    strlth r0, [r4, #0x28]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r3, #0x1
    bl func_02037208
    b .L_ef0
.L_bb4:
    bl func_ov005_021af090
    b .L_ef0
.L_bbc:
    bl func_ov005_021af2dc
    cmp r0, #0x0
    beq .L_c80
    ldrsb r0, [r4, #0x48]
    cmp r0, #0x0
    bne .L_bec
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_ef0
.L_bec:
    mov r0, r4
    add r1, r4, #0x48
    bl func_ov005_021afba0
    cmp r0, #0x0
    mov r2, #0x0
    mov r3, #0x1
    beq .L_c50
    mov r0, #0x3a
    str r3, [r4, #0x88]
    sub r1, r0, #0x3b
    bl func_02037208
    ldr r0, [r4, #0x8]
    cmp r0, #0x4
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT2
    bl func_0202c0c0
    mov r2, r0
    ldr r0, _LIT3
    mov r1, #0x2
    bl func_ov005_021b0b30
    mov r0, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_c50:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_02037208
    mov r0, #0xfa
    bl func_0202c0c0
    mov r2, r0
    ldr r0, _LIT3
    mov r1, #0x11
    bl func_ov005_021b0b30
    mov r0, #0x1
    str r0, [r4, #0x4]
    b .L_ef0
.L_c80:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_ef0
.L_c98:
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_ef0
    b .L_cb4
    b .L_d18
    b .L_e10
    b .L_e18
.L_cb4:
    ldrh r3, [r4, #0x28]
    add r2, r4, #0x48
    ldrsb r0, [r2, r3]
    cmp r0, #0x20
    bne .L_cf0
    add r0, r3, #0x1
    add r0, r4, r0
    ldrsb r0, [r0, #0x48]
    cmp r0, #0x0
    bne .L_cf0
    mov r1, #0x0
    strb r1, [r2, r3]
    ldrh r0, [r4, #0x28]
    add r0, r4, r0
    strb r1, [r0, #0x68]
.L_cf0:
    ldrh r0, [r4, #0x28]
    mov r2, #0x0
    mov r3, #0x1
    cmp r0, #0x0
    subne r0, r0, #0x1
    strneh r0, [r4, #0x28]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_02037208
    b .L_ef0
.L_d18:
    ldrh r1, [r4, #0x28]
    add r2, r4, #0x48
    ldrsb r0, [r2, r1]
    cmp r0, #0x0
    bne .L_db4
    mov r0, #0x20
    strb r0, [r2, r1]
    ldr r1, [r4, #0x8]
    mov r2, #0x0
    cmp r1, #0x4
    bhi .L_d54
    mov r0, #0x1
    mov r1, r0, lsl r1
    tst r1, #0x19
    movne r2, r0
.L_d54:
    cmp r2, #0x0
    movne r5, #0xa
    add r0, r4, #0x48
    mov r1, #0xc
    moveq r5, #0xc
    bl func_020054a4
    mov r1, #0xc
    mul r1, r5, r1
    cmp r0, r1
    ble .L_da4
    ldrh r2, [r4, #0x28]
    mov r0, #0x43
    sub r1, r0, #0x44
    add r4, r4, r2
    mov r2, #0x0
    mov r3, #0x1
    strb r2, [r4, #0x48]
    bl func_02037208
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_da4:
    ldrh r0, [r4, #0x28]
    mov r1, #0x6
    add r0, r4, r0
    strb r1, [r0, #0x68]
.L_db4:
    ldr r1, [r4, #0x8]
    mov r2, #0x0
    cmp r1, #0x4
    bhi .L_dd4
    mov r0, #0x1
    mov r1, r0, lsl r1
    tst r1, #0x19
    movne r2, r0
.L_dd4:
    cmp r2, #0x0
    movne r0, #0xa
    moveq r0, #0xc
    mov r0, r0, lsl #0x1
    ldrh r1, [r4, #0x28]
    sub r0, r0, #0x1
    mov r2, #0x0
    cmp r1, r0
    addlt r0, r1, #0x1
    strlth r0, [r4, #0x28]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r3, #0x1
    bl func_02037208
    b .L_ef0
.L_e10:
    bl func_ov005_021af090
    b .L_ef0
.L_e18:
    bl func_ov005_021af2dc
    cmp r0, #0x0
    beq .L_edc
    ldrsb r0, [r4, #0x48]
    cmp r0, #0x0
    bne .L_e48
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_ef0
.L_e48:
    mov r0, r4
    add r1, r4, #0x48
    bl func_ov005_021afba0
    cmp r0, #0x0
    mov r2, #0x0
    mov r3, #0x1
    beq .L_eac
    mov r0, #0x3a
    str r3, [r4, #0x88]
    sub r1, r0, #0x3b
    bl func_02037208
    ldr r0, [r4, #0x8]
    cmp r0, #0x4
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT2
    bl func_0202c0c0
    mov r2, r0
    ldr r0, _LIT3
    mov r1, #0x2
    bl func_ov005_021b0b30
    mov r0, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_eac:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_02037208
    mov r0, #0xfa
    bl func_0202c0c0
    mov r2, r0
    ldr r0, _LIT3
    mov r1, #0x11
    bl func_ov005_021b0b30
    mov r0, #0x1
    str r0, [r4, #0x4]
    b .L_ef0
.L_edc:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_ef0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_ov005_021b1c8c
_LIT2: .word 0x000006a8
_LIT3: .word data_ov005_021b224c
