; func_ov002_021bc920 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern func_0202b83c
        .extern func_ov002_021b9dec
        .global func_ov002_021bc920
        .arm
func_ov002_021bc920:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r2
    ldr r6, _LIT0
    and ip, r5, #0x1
    mov r4, r3
    mov r2, #0x14
    mul lr, ip, r6
    ldr r3, _LIT1
    mul ip, r4, r2
    add r2, r3, lr
    ldr r2, [ip, r2]
    mov r6, r1
    mov r1, r2, lsr #0x6
    tst r1, #0x1
    bne .L_3cc
    cmp r5, r0
    beq .L_32c
    ldr r0, _LIT2
    add r0, r0, lr
    ldrh r0, [ip, r0]
    cmp r0, #0x0
    beq .L_3cc
.L_32c:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9dec
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_380
    sub r1, r2, #0x1
    cmp r0, r1
    blt .L_35c
    cmpne r0, r2
    beq .L_3a0
    b .L_3cc
.L_35c:
    sub r1, r2, #0x2c8
    cmp r0, r1
    bgt .L_370
    beq .L_3a0
    b .L_3cc
.L_370:
    sub r1, r2, #0x51
    cmp r0, r1
    beq .L_3a0
    b .L_3cc
.L_380:
    add r1, r2, #0x8a
    cmp r0, r1
    bgt .L_394
    beq .L_3a0
    b .L_3cc
.L_394:
    add r1, r2, #0x8b
    cmp r0, r1
    bne .L_3cc
.L_3a0:
    mov r0, r6
    bl func_0202b83c
    mov r6, r0
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9dec
    bl func_0202b83c
    cmp r6, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_3cc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0cc
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x000017e9
