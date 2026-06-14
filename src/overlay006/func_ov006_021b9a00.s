; func_ov006_021b9a00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cb310
        .extern data_ov006_021cb32c
        .extern data_ov006_0224f3e0
        .extern data_ov006_0224f400
        .extern data_ov006_0224f402
        .extern data_ov006_0224f404
        .extern data_ov006_0224f406
        .extern data_ov006_0224f408
        .extern data_ov006_0224f40a
        .extern data_ov006_0224f40c
        .extern func_0202b878
        .extern func_0202b890
        .extern func_0202b8a8
        .extern func_0202b8c0
        .extern func_0202bbdc
        .extern func_0202de9c
        .extern func_ov006_021b8d9c
        .global func_ov006_021b9a00
        .arm
func_ov006_021b9a00:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldrh r0, [r2, #0x2]
    mov r4, r1
    tst r0, #0x1
    beq .L_a30
    mov r0, r4
    bl func_0202bbdc
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
    bl func_0202de9c
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
    bl func_0202b8a8
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
    bl func_0202b890
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
    bl func_0202b878
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
    bl func_0202de9c
    mov r6, r0
    mov r0, r4
    bl func_0202b8c0
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
    bl func_ov006_021b8d9c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_c48:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov006_0224f3e0
_LIT1: .word data_ov006_0224f400
_LIT2: .word data_ov006_0224f402
_LIT3: .word data_ov006_0224f404
_LIT4: .word data_ov006_0224f406
_LIT5: .word data_ov006_0224f408
_LIT6: .word data_ov006_0224f40a
_LIT7: .word data_ov006_021cb310
_LIT8: .word data_ov006_021cb32c
_LIT9: .word data_ov006_0224f40c
