; func_ov006_021b9900 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cb204
        .extern data_ov006_021cb220
        .extern data_ov006_0224f2c0
        .extern data_ov006_0224f2e0
        .extern data_ov006_0224f2e2
        .extern data_ov006_0224f2e4
        .extern data_ov006_0224f2e6
        .extern data_ov006_0224f2e8
        .extern data_ov006_0224f2ea
        .extern data_ov006_0224f2ec
        .extern func_0202b824
        .extern func_0202b83c
        .extern func_0202b854
        .extern func_0202b86c
        .extern func_0202bb88
        .extern func_0202de48
        .extern func_ov006_021b8c9c
        .global func_ov006_021b9900
        .arm
func_ov006_021b9900:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldrh r0, [r2, #0x2]
    mov r4, r1
    tst r0, #0x1
    beq .L_a30
    mov r0, r4
    bl func_0202bb88
    mov r1, #0xe
    mul r2, r5, r1
    ldr r1, _LIT1
    ldrsh r1, [r1, r2]
    cmp r0, r1
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_a30:
    ldr r0, _LIT0
    ldrh r0, [r0, #0x2]
    tst r0, #0x2
    beq .L_aa0
    mov r0, r4
    bl func_0202de48
    mov r1, #0xe
    mul r2, r5, r1
    ldr r1, _LIT2
    ldrsh r1, [r1, r2]
    cmp r1, #0xf0
    beq .L_a6c
    cmp r1, #0xf1
    beq .L_a80
    b .L_a94
.L_a6c:
    cmp r0, #0x0
    cmpne r0, #0x1
    beq .L_aa0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_a80:
    cmp r0, #0x7
    cmpne r0, #0x8
    beq .L_aa0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_a94:
    cmp r0, r1
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_aa0:
    ldr r0, _LIT0
    ldrh r0, [r0, #0x2]
    tst r0, #0x4
    beq .L_b20
    mov r0, r4
    bl func_0202b854
    mov r1, #0xe
    mul r2, r5, r1
    ldr r1, _LIT3
    ldrsh r1, [r1, r2]
    cmp r1, #0x0
    beq .L_ae4
    cmp r1, #0x1
    beq .L_afc
    cmp r1, #0x2
    beq .L_b14
    b .L_b20
.L_ae4:
    cmp r0, #0x1
    blt .L_af4
    cmp r0, #0x4
    ble .L_b20
.L_af4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_afc:
    cmp r0, #0x5
    blt .L_b0c
    cmp r0, #0x6
    ble .L_b20
.L_b0c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_b14:
    cmp r0, #0x7
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
.L_b20:
    ldr r0, _LIT0
    ldrh r0, [r0, #0x2]
    tst r0, #0x8
    beq .L_b54
    mov r0, r4
    bl func_0202b83c
    mov r1, #0xe
    mul r2, r5, r1
    ldr r1, _LIT4
    ldrsh r1, [r1, r2]
    cmp r0, r1
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_b54:
    ldr r0, _LIT0
    ldrh r0, [r0, #0x2]
    tst r0, #0x10
    beq .L_b88
    mov r0, r4
    bl func_0202b824
    mov r1, #0xe
    mul r2, r5, r1
    ldr r1, _LIT5
    ldrsh r1, [r1, r2]
    cmp r0, r1
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_b88:
    ldr r0, _LIT0
    ldrh r0, [r0, #0x2]
    tst r0, #0x20
    beq .L_c14
    mov r0, r4
    bl func_0202de48
    mov r6, r0
    mov r0, r4
    bl func_0202b86c
    cmp r6, #0x7
    bne .L_bdc
    mov r1, #0xe
    mul r2, r5, r1
    ldr r1, _LIT6
    ldr r3, _LIT7
    ldrsh r1, [r1, r2]
    ldr r0, [r3, r0, lsl #0x2]
    cmp r0, r1
    beq .L_c14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_bdc:
    cmp r6, #0x8
    bne .L_c0c
    mov r1, #0xe
    mul r2, r5, r1
    ldr r1, _LIT6
    ldr r3, _LIT8
    ldrsh r1, [r1, r2]
    ldr r0, [r3, r0, lsl #0x2]
    cmp r0, r1
    beq .L_c14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_c0c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_c14:
    ldr r0, _LIT0
    ldrh r0, [r0, #0x2]
    tst r0, #0x40
    beq .L_c48
    mov r0, #0xe
    mul r2, r5, r0
    ldr r1, _LIT9
    mov r0, r4
    ldrsh r1, [r1, r2]
    bl func_ov006_021b8c9c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_c48:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov006_0224f2c0
_LIT1: .word data_ov006_0224f2e0
_LIT2: .word data_ov006_0224f2e2
_LIT3: .word data_ov006_0224f2e4
_LIT4: .word data_ov006_0224f2e6
_LIT5: .word data_ov006_0224f2e8
_LIT6: .word data_ov006_0224f2ea
_LIT7: .word data_ov006_021cb204
_LIT8: .word data_ov006_021cb220
_LIT9: .word data_ov006_0224f2ec
