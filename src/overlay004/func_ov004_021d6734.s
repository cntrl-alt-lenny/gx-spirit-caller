; func_ov004_021d6734 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov004_0220b500
        .extern func_02012454
        .extern func_02034888
        .extern func_020349ec
        .extern func_02037208
        .extern func_02046ac4
        .extern func_ov004_021c9d8c
        .extern func_ov004_021c9d9c
        .extern func_ov004_021c9ef0
        .extern func_ov004_021cded0
        .extern func_ov004_021d62b8
        .extern func_ov004_021d6384
        .extern func_ov004_021d641c
        .extern func_ov004_021d6468
        .extern func_ov004_021d66f4
        .global func_ov004_021d6734
        .arm
func_ov004_021d6734:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x200
    add r1, sp, #0x0
    mov r0, #0x3
    ldr r4, _LIT0
    bl func_020349ec
    cmp r0, #0x0
    addeq sp, sp, #0x200
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [sp]
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_2c4
    b .L_fc
    b .L_17c
    b .L_60
    b .L_6c
    b .L_9c
    b .L_2c4
    b .L_1fc
    b .L_220
    b .L_26c
    b .L_290
.L_60:
    mov r0, #0x1
    str r0, [r4, #0x220]
    b .L_2c4
.L_6c:
    ldrh r2, [sp, #0x2]
    mov r1, #0x0
    mov r0, #0xea
    str r2, [r4, #0x230]
    str r1, [r4, #0x228]
    bl func_ov004_021c9ef0
    mov r0, #0x48
    sub r1, r0, #0x49
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_2c4
.L_9c:
    ldrh r2, [sp, #0x2]
    ldr r0, _LIT1
    cmp r2, r0
    bne .L_d0
    mov r0, #0x1
    str r0, [r4, #0x64]
    bl func_ov004_021c9d8c
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_2c4
.L_d0:
    mov r1, #0x1
    mov r0, #0xeb
    str r2, [r4, #0x230]
    str r1, [r4, #0x228]
    bl func_ov004_021c9ef0
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_2c4
.L_fc:
    add r1, sp, #0x0
    mov r0, #0x1
    bl func_ov004_021d6384
    mov r0, r4
    mov r1, #0x1
    str r1, [r0, #0x74]
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq .L_130
    mov r0, #0x0
    bl func_ov004_021cded0
    mov r0, #0x1
    bl func_ov004_021cded0
.L_130:
    mov r0, #0x54
    sub r1, r0, #0x55
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x1
    bl func_ov004_021d62b8
    add r0, r4, #0xd4
    add r0, r0, #0x3c00
    bl func_ov004_021d641c
    cmp r0, #0x0
    blt .L_2c4
    add r0, r4, #0xd4
    add r1, r4, #0x3000
    mov r2, #0x1
    add r0, r0, #0x3c00
    str r2, [r1, #0xcd0]
    bl func_ov004_021d6468
    b .L_2c4
.L_17c:
    add r1, sp, #0x0
    mov r0, #0x0
    bl func_ov004_021d6384
    mov r0, r4
    mov r1, #0x1
    str r1, [r0, #0x74]
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq .L_1b0
    mov r0, #0x0
    bl func_ov004_021cded0
    mov r0, #0x1
    bl func_ov004_021cded0
.L_1b0:
    mov r0, #0x54
    sub r1, r0, #0x55
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x6
    bl func_ov004_021d66f4
    add r0, r4, #0xd4
    add r0, r0, #0x3c00
    bl func_ov004_021d641c
    cmp r0, #0x0
    blt .L_2c4
    add r0, r4, #0xd4
    add r1, r4, #0x3000
    mov r2, #0x1
    add r0, r0, #0x3c00
    str r2, [r1, #0xcd0]
    bl func_ov004_021d6468
    b .L_2c4
.L_1fc:
    bl func_02046ac4
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add r1, sp, #0x2
    bl func_02012454
    mov r0, #0x7
    bl func_ov004_021d66f4
    b .L_2c4
.L_220:
    bl func_02046ac4
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add r1, sp, #0x2
    bl func_02012454
    ldr r1, _LIT2
    mov r2, #0x8
    ldr r0, [r1, #0x38]
    strh r2, [sp]
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    str r3, [r1, #0xc38]
    add r1, sp, #0x0
    mov r0, #0x3
    mov r2, #0x4
    strh r3, [sp, #0x2]
    bl func_02034888
    b .L_2c4
.L_26c:
    ldrh r2, [sp, #0x2]
    ldr r0, _LIT2
    add r1, sp, #0x0
    str r2, [r0, #0xc38]
    mov r3, #0x9
    mov r0, #0x3
    mov r2, #0x2
    strh r3, [sp]
    bl func_02034888
.L_290:
    ldr r0, [r4, #0x4c]
    cmp r0, #0x1
    beq .L_2a8
    bl func_ov004_021c9d9c
    cmp r0, #0x0
    beq .L_2b4
.L_2a8:
    mov r0, #0x1
    str r0, [r4, #0x78]
    b .L_2c4
.L_2b4:
    mov r1, #0x2
    mov r0, #0x1
    str r1, [r4, #0x48]
    str r0, [r4, #0x220]
.L_2c4:
    mov r0, #0x1
    add sp, sp, #0x200
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word 0x0000ffff
_LIT2: .word data_021040ac
