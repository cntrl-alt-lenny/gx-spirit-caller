; func_ov002_0229a38c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov002_022cd65c
        .extern data_ov002_022d008c
        .extern data_ov002_022d0e4c
        .extern data_ov002_022d10dc
        .extern data_ov002_022d1330
        .extern data_ov002_022d1a18
        .extern func_020371b8
        .extern func_ov002_021b00a4
        .extern func_ov002_021b0114
        .extern func_ov002_021ca618
        .extern func_ov002_0225974c
        .extern func_ov002_0229f678
        .extern func_ov002_022a1760
        .extern func_ov002_022a8188
        .global func_ov002_0229a38c
        .arm
func_ov002_0229a38c:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0x30]
    ldr r0, [r0, #0xbb0]
    add r4, r1, #0x1
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT1
    ldr r0, [r0, #0x3c]
    cmp r0, #0x0
    movlt r0, #0x1
    movge r0, #0x0
    cmp r0, #0x0
    beq .L_94
    ldr r0, _LIT2
    bl func_ov002_022a1760
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT3
    ldr r1, [r0, #0xdc]
    cmp r1, #0x0
    ldmleia sp!, {r4, pc}
    sub r1, r1, r4
    str r1, [r0, #0xdc]
    cmp r1, #0x0
    ldmgtia sp!, {r4, pc}
    ldr r0, _LIT2
    bl func_ov002_0229f678
    ldr r0, _LIT3
    mov r1, #0x0
    ldr r2, [r0, #0xd4]
    ldr r0, _LIT3
    cmp r2, #0x1
    movlt r2, #0x1
    str r2, [r0, #0xd4]
    str r1, [r0, #0xdc]
    ldmia sp!, {r4, pc}
.L_94:
    ldr r0, _LIT4
    ldr r0, [r0, #0x4]
    bl func_ov002_021ca618
    cmp r0, #0x0
    beq .L_184
    ldr r0, _LIT3
    ldr r1, [r0, #0xdc]
    cmp r1, #0x0
    ble .L_184
    sub r1, r1, r4
    str r1, [r0, #0xdc]
    cmp r1, #0x0
    bgt .L_12c
    ldr r0, _LIT5
    ldr r0, [r0, #0xd48]
    cmp r0, #0x0
    beq .L_dc
    bl func_ov002_0225974c
.L_dc:
    ldr r0, _LIT2
    bl func_ov002_022a1760
    cmp r0, #0x0
    beq .L_f4
    ldr r0, _LIT2
    bl func_ov002_0229f678
.L_f4:
    ldr r0, _LIT6
    bl func_ov002_022a8188
    ldr r0, _LIT3
    ldr r1, _LIT3
    ldr r2, [r0, #0xd4]
    ldr r0, _LIT4
    cmp r2, #0x1
    movlt r2, #0x1
    str r2, [r1, #0xd4]
    ldr r0, [r0, #0x4]
    bl func_ov002_021b0114
    ldr r0, _LIT3
    mov r1, #0x0
    str r1, [r0, #0xdc]
.L_12c:
    ldr r1, _LIT3
    ldr r0, _LIT7
    ldr lr, [r1, #0xdc]
    cmp lr, r0
    bge .L_184
    ldr r1, _LIT8
    add r2, lr, r4
    smull r0, ip, r1, lr
    smull r0, r3, r1, r2
    add ip, lr, ip
    mov r0, lr, lsr #0x1f
    add r3, r2, r3
    mov r1, r2, lsr #0x1f
    add ip, r0, ip, asr #0x5
    add r3, r1, r3, asr #0x5
    cmp ip, r3
    beq .L_184
    mov r0, #0x8e
    sub r1, r0, #0x8f
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_184:
    ldr r1, _LIT0
    ldr r0, [r1, #0xbb4]
    cmp r0, #0x1
    ldmleia sp!, {r4, pc}
    sub r0, r0, r4
    str r0, [r1, #0xbb4]
    cmp r0, #0x1
    ldmgtia sp!, {r4, pc}
    mov r2, #0x1
    ldr r0, _LIT3
    str r2, [r1, #0xbb4]
    ldr r0, [r0, #0xd4]
    cmp r0, #0x1
    movge r2, r0
    ldr r0, _LIT3
    str r2, [r0, #0xd4]
    bl func_ov002_021b00a4
    ldmia sp!, {r4, pc}
_LIT0: .word data_02103fcc
_LIT1: .word data_ov002_022d1a18
_LIT2: .word data_ov002_022d10dc
_LIT3: .word data_ov002_022d0e4c
_LIT4: .word data_ov002_022cd65c
_LIT5: .word data_ov002_022d008c
_LIT6: .word data_ov002_022d1330
_LIT7: .word 0x000004ec
_LIT8: .word 0x88888889
