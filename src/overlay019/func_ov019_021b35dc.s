; func_ov019_021b35dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov000_021b1d4c
        .extern data_ov019_021b5ba0
        .extern data_ov019_021b5baa
        .extern func_02037208
        .extern func_020b3870
        .extern func_ov005_021aa4d0
        .extern func_ov019_021b27a0
        .extern func_ov019_021b3cf0
        .extern func_ov019_021b40d4
        .extern func_ov019_021b4258
        .extern func_ov019_021b4324
        .global func_ov019_021b35dc
        .arm
func_ov019_021b35dc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r1, #0x4000000
    ldr r3, [r1]
    ldr r2, [r1]
    and r3, r3, #0x1f00
    mov r4, r3, lsr #0x8
    bic r3, r2, #0x1f00
    orr r2, r4, #0x6
    orr r3, r3, r2, lsl #0x8
    ldr r2, _LIT0
    str r3, [r1]
    ldrh r2, [r2, #0x52]
    mov r4, r0
    ldr r5, _LIT1
    cmp r2, #0x0
    beq .L_9b8
    tst r2, #0x300
    beq .L_5dc
    ldr r2, [r1]
    ldr r0, [r1]
    and r2, r2, #0x1f00
    mov r3, r2, lsr #0x8
    bic r2, r0, #0x1f00
    bic r0, r3, #0x6
    orr r0, r2, r0, lsl #0x8
    str r0, [r1]
.L_5dc:
    ldr r2, [r4, #0x434]
    cmp r2, #0x0
    ble .L_6a4
    ldr r0, _LIT0
    ldrh r1, [r0, #0x54]
    tst r1, #0x1
    beq .L_608
    mov r0, r4
    rsb r1, r2, #0x2
    bl func_ov019_021b3cf0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_608:
    tst r1, #0x2
    beq .L_62c
    mov r0, #0x42
    mov r2, #0x0
    sub r1, r0, #0x43
    mov r3, #0x1
    str r2, [r4, #0x434]
    bl func_02037208
    b .L_c70
.L_62c:
    tst r1, #0x30
    beq .L_658
    sub r1, r2, #0x1
    mov r0, #0x38
    rsb r5, r1, #0x2
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r5, [r4, #0x434]
    bl func_02037208
    b .L_c70
.L_658:
    ldrh r0, [r0, #0x56]
    tst r0, #0x80
    beq .L_680
    mov r0, #0x42
    mov r2, #0x0
    sub r1, r0, #0x43
    mov r3, #0x1
    str r2, [r4, #0x434]
    bl func_02037208
    b .L_c70
.L_680:
    tst r0, #0x40
    beq .L_c70
    mov r0, #0x42
    mov r2, #0x0
    sub r1, r0, #0x43
    mov r3, #0x1
    str r2, [r4, #0x434]
    bl func_02037208
    b .L_c70
.L_6a4:
    ldr r0, _LIT0
    ldrh r1, [r0, #0x54]
    tst r1, #0x1
    beq .L_6d0
    mov r0, #0x3a
    mov r3, #0x1
    sub r1, r0, #0x3b
    mov r2, #0x0
    str r3, [r4, #0x434]
    bl func_02037208
    b .L_c70
.L_6d0:
    tst r1, #0x2
    beq .L_6e8
    mov r0, r4
    mov r1, #0x0
    bl func_ov019_021b3cf0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_6e8:
    ldrh r0, [r0, #0x56]
    tst r0, #0x80
    beq .L_7b8
    ldr r2, [r4, #0x8]
    ldr r1, [r4, #0x10]
    cmp r2, #0x6
    movgt r0, #0x6
    movle r0, r2
    sub r0, r0, #0x1
    cmp r1, r0
    bge .L_744
    add r5, r1, #0x1
    mov r0, #0x38
    str r5, [r4, #0x10]
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r5, [r4, #0x43c]
    bl func_02037208
    mov r0, r4
    mov r1, #0x2
    bl func_ov019_021b3cf0
    b .L_c70
.L_744:
    ldr r0, [r4, #0xc]
    add r1, r0, #0x6
    cmp r1, r2
    bge .L_c70
    add r0, r0, #0x1
    str r0, [r4, #0xc]
    add r5, r0, #0x6
    ldr r1, [r4, #0x8]
    mov r0, r5
    bl func_020b3870
    mov r0, #0xc
    mla r0, r1, r0, r4
    mov r3, r5, lsr #0x1f
    ldrh r1, [r0, #0x14]
    rsb r2, r3, r5, lsl #0x1d
    mov r0, r4
    add r2, r3, r2, ror #0x1d
    bl func_ov019_021b40d4
    mov r0, r4
    bl func_ov019_021b4258
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, r4
    mov r1, #0x2
    bl func_ov019_021b3cf0
    b .L_c70
.L_7b8:
    tst r0, #0x40
    beq .L_870
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    ble .L_7fc
    sub r5, r0, #0x1
    mov r0, #0x38
    str r5, [r4, #0x10]
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r5, [r4, #0x43c]
    bl func_02037208
    mov r0, r4
    mov r1, #0x2
    bl func_ov019_021b3cf0
    b .L_c70
.L_7fc:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    ble .L_c70
    sub r6, r0, #0x1
    str r6, [r4, #0xc]
    subs r0, r6, #0x1
    bmi .L_844
    ldr r1, [r4, #0x8]
    bl func_020b3870
    mov r0, #0xc
    mla r5, r1, r0, r4
    add r0, r6, #0x7
    mov r3, r0, lsr #0x1f
    rsb r2, r3, r0, lsl #0x1d
    ldrh r1, [r5, #0x14]
    mov r0, r4
    add r2, r3, r2, ror #0x1d
    bl func_ov019_021b40d4
.L_844:
    mov r0, r4
    bl func_ov019_021b4258
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, r4
    mov r1, #0x2
    bl func_ov019_021b3cf0
    b .L_c70
.L_870:
    tst r0, #0x10
    beq .L_918
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x8]
    add r2, r1, #0x6
    cmp r2, r0
    bge .L_c70
    str r2, [r4, #0xc]
    ldr r1, [r4, #0x8]
    add r0, r2, #0x6
    cmp r0, r1
    subge r0, r1, #0x6
    strge r0, [r4, #0xc]
    mov r5, #0x0
    mov r6, #0xc
.L_8ac:
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    add r0, r0, r5
    add r7, r0, #0x1
    mov r0, r7
    bl func_020b3870
    mla r0, r1, r6, r4
    mov r3, r7, lsr #0x1f
    rsb r2, r3, r7, lsl #0x1d
    ldrh r1, [r0, #0x14]
    mov r0, r4
    add r2, r3, r2, ror #0x1d
    bl func_ov019_021b40d4
    add r5, r5, #0x1
    cmp r5, #0x6
    blt .L_8ac
    mov r0, r4
    bl func_ov019_021b4258
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, r4
    mov r1, #0x2
    bl func_ov019_021b3cf0
    b .L_c70
.L_918:
    tst r0, #0x20
    beq .L_c70
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    ble .L_c70
    subs r0, r0, #0x6
    str r0, [r4, #0xc]
    movmi r0, #0x0
    strmi r0, [r4, #0xc]
    mov r5, #0x0
    mov r6, #0xc
.L_944:
    ldr r7, [r4, #0xc]
    sub r0, r7, #0x1
    adds r0, r0, r5
    bmi .L_980
    ldr r1, [r4, #0x8]
    bl func_020b3870
    mla ip, r1, r6, r4
    add r0, r7, r5
    add r0, r0, #0x7
    mov r3, r0, lsr #0x1f
    rsb r2, r3, r0, lsl #0x1d
    ldrh r1, [ip, #0x14]
    mov r0, r4
    add r2, r3, r2, ror #0x1d
    bl func_ov019_021b40d4
.L_980:
    add r5, r5, #0x1
    cmp r5, #0x6
    blt .L_944
    mov r0, r4
    bl func_ov019_021b4258
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, r4
    mov r1, #0x2
    bl func_ov019_021b3cf0
    b .L_c70
.L_9b8:
    ldr r0, _LIT2
    bl func_ov019_021b27a0
    cmp r0, #0x0
    beq .L_9d8
    mov r0, r4
    mov r1, #0x0
    bl func_ov019_021b3cf0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_9d8:
    ldr r0, _LIT3
    bl func_ov019_021b27a0
    cmp r0, #0x0
    beq .L_9f8
    mov r0, r4
    mov r1, #0x1
    bl func_ov019_021b3cf0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_9f8:
    ldr r0, [r4, #0x8]
    cmp r0, #0x6
    ble .L_c2c
    mov r0, r5
    ldr r6, [r4, #0xc]
    bl func_ov005_021aa4d0
    ldr r0, [r5, #0x4]
    str r0, [r4, #0xc]
    ldr r0, [r5, #0x18]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_c2c
    b .L_a40
    b .L_bc0
    b .L_a7c
    b .L_ac4
    b .L_b08
    b .L_b68
.L_a40:
    ldr r0, [r4, #0x438]
    cmp r0, #0x0
    beq .L_c2c
    mov r2, #0x0
    mov r0, #0x38
    str r2, [r4, #0x438]
    sub r1, r0, #0x39
    mov r3, #0x1
    str r2, [r4, #0x434]
    bl func_02037208
    mov r0, r4
    mov r1, #0x2
    bl func_ov019_021b3cf0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_a7c:
    ldr r6, [r4, #0xc]
    subs r0, r6, #0x1
    bmi .L_ab4
    ldr r1, [r4, #0x8]
    bl func_020b3870
    mov r0, #0xc
    mla r5, r1, r0, r4
    add r0, r6, #0x7
    mov r3, r0, lsr #0x1f
    rsb r2, r3, r0, lsl #0x1d
    ldrh r1, [r5, #0x14]
    mov r0, r4
    add r2, r3, r2, ror #0x1d
    bl func_ov019_021b40d4
.L_ab4:
    mov r0, #0x2
    str r0, [r4, #0x438]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_ac4:
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    add r5, r0, #0x6
    mov r0, r5
    bl func_020b3870
    mov r0, #0xc
    mla r0, r1, r0, r4
    mov r3, r5, lsr #0x1f
    ldrh r1, [r0, #0x14]
    rsb r2, r3, r5, lsl #0x1d
    mov r0, r4
    add r2, r3, r2, ror #0x1d
    bl func_ov019_021b40d4
    mov r0, #0x3
    str r0, [r4, #0x438]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_b08:
    mov r5, #0x0
    mov r6, #0xc
.L_b10:
    ldr r7, [r4, #0xc]
    sub r0, r7, #0x1
    adds r0, r0, r5
    bmi .L_b4c
    ldr r1, [r4, #0x8]
    bl func_020b3870
    mla ip, r1, r6, r4
    add r0, r7, r5
    add r0, r0, #0x7
    mov r3, r0, lsr #0x1f
    rsb r2, r3, r0, lsl #0x1d
    ldrh r1, [ip, #0x14]
    mov r0, r4
    add r2, r3, r2, ror #0x1d
    bl func_ov019_021b40d4
.L_b4c:
    add r5, r5, #0x1
    cmp r5, #0x6
    blt .L_b10
    mov r0, #0x4
    str r0, [r4, #0x438]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_b68:
    mov r5, #0x0
    mov r6, #0xc
.L_b70:
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    add r0, r0, r5
    add r7, r0, #0x1
    mov r0, r7
    bl func_020b3870
    mla r0, r1, r6, r4
    mov r3, r7, lsr #0x1f
    rsb r2, r3, r7, lsl #0x1d
    ldrh r1, [r0, #0x14]
    mov r0, r4
    add r2, r3, r2, ror #0x1d
    bl func_ov019_021b40d4
    add r5, r5, #0x1
    cmp r5, #0x6
    blt .L_b70
    mov r0, #0x5
    str r0, [r4, #0x438]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_bc0:
    ldr r0, [r4, #0xc]
    cmp r6, r0
    beq .L_c1c
    mov r5, #0x0
    mov r6, #0xc
.L_bd4:
    ldr r7, [r4, #0xc]
    sub r0, r7, #0x1
    adds r0, r0, r5
    bmi .L_c10
    ldr r1, [r4, #0x8]
    bl func_020b3870
    mla ip, r1, r6, r4
    add r0, r7, r5
    add r0, r0, #0x7
    mov r3, r0, lsr #0x1f
    rsb r2, r3, r0, lsl #0x1d
    ldrh r1, [ip, #0x14]
    mov r0, r4
    add r2, r3, r2, ror #0x1d
    bl func_ov019_021b40d4
.L_c10:
    add r5, r5, #0x1
    cmp r5, #0x8
    blt .L_bd4
.L_c1c:
    mov r0, #0x1
    str r0, [r4, #0x438]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_c2c:
    mov r0, r4
    bl func_ov019_021b4324
    cmp r0, #0x0
    blt .L_c70
    ldr r1, [r4, #0x10]
    cmp r0, r1
    beq .L_c70
    str r0, [r4, #0x10]
    mov r0, #0x38
    mov r2, #0x0
    sub r1, r0, #0x39
    mov r3, #0x1
    str r2, [r4, #0x434]
    bl func_02037208
    mov r0, r4
    mov r1, #0x2
    bl func_ov019_021b3cf0
.L_c70:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02104bac
_LIT1: .word data_ov000_021b1d4c
_LIT2: .word data_ov019_021b5ba0
_LIT3: .word data_ov019_021b5baa
