; func_ov002_0226c278 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern data_ov002_022d0e3c
        .extern func_ov002_021ae320
        .extern func_ov002_021b1120
        .extern func_ov002_021dea94
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_0226c1c8
        .extern func_ov002_022903f0
        .extern func_ov002_0229acd0
        .global func_ov002_0226c278
        .arm
func_ov002_0226c278:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, _LIT0
    mov r4, r2
    ldr r1, [r3, #0xd9c]
    mov r5, r0
    cmp r1, #0x3
    and r4, r4, #0xff
    addls pc, pc, r1, lsl #0x2
    b .L_1f8
    b .L_34
    b .L_80
    b .L_c0
    b .L_1a8
.L_34:
    ldr r1, _LIT1
    mov r2, #0x0
    strh r4, [r1, #0xa6]
    strh r2, [r1, #0xb4]
    ldr r0, _LIT2
    strh r2, [r1, #0xb2]
    bl func_ov002_021b1120
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, #0x12
    bl func_ov002_021ae320
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r3, r4, r5, pc}
.L_80:
    ldr r1, _LIT3
    ldr r1, [r1, r5, lsl #0x2]
    cmp r1, #0x1
    bne .L_a0
    ldr r2, _LIT2
    mov r1, #0x1
    bl func_ov002_022903f0
    b .L_a8
.L_a0:
    ldr r0, _LIT2
    bl func_ov002_02259204
.L_a8:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r3, r4, r5, pc}
.L_c0:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_184
    ldr r3, _LIT0
    ldr lr, _LIT4
    ldr r1, [r3, #0xd70]
    ldr r2, [r3, #0xd74]
    add r0, r1, #0x1
    mov ip, r0, lsl #0x1
    ldr r0, [r3, #0xd78]
    ldrh r5, [lr, ip]
    add r2, r2, r0
    mov r0, #0x1
    orr r5, r5, r0, lsl r2
    strh r5, [lr, ip]
    cmp r4, #0x0
    beq .L_144
    ldr r4, _LIT5
    ldr r0, _LIT6
    and r3, r1, #0x1
    mla r4, r3, r0, r4
    mov r0, #0x14
    mul r0, r2, r0
    add r3, r4, #0x30
    ldr r4, [r3, r0]
    mov r0, #0x28
    mov r3, r4, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, r4, lsr #0x1f
    bl func_ov002_0229acd0
    b .L_16c
.L_144:
    ldr r2, [r3, #0xd74]
    ldr r1, [r3, #0xd78]
    ldr r3, [r3, #0xd70]
    add r1, r2, r1
    and r2, r1, #0xff
    and r3, r3, #0xff
    ldr r1, _LIT1
    orr r2, r3, r2, lsl #0x8
    strh r2, [r1, #0xb0]
    ldmia sp!, {r3, r4, r5, pc}
.L_16c:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r3, r4, r5, pc}
.L_184:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x29
    bl func_ov002_0229acd0
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r1, #0xd9c]
    ldmia sp!, {r3, r4, r5, pc}
.L_1a8:
    ldr r1, _LIT1
    ldrh r2, [r1, #0xa6]
    cmp r2, #0x1
    bls .L_1d0
    sub r0, r2, #0x1
    strh r0, [r1, #0xa6]
    mov r0, #0x1
    str r0, [r3, #0xd9c]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1d0:
    ldrh r2, [r1, #0xb2]
    ldrh r1, [r1, #0xb4]
    orr r1, r2, r1, lsl #0x10
    bl func_ov002_021dea94
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r3, r4, r5, pc}
.L_1f8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022d0d8c
_LIT2: .word func_ov002_0226c1c8
_LIT3: .word data_ov002_022cd664
_LIT4: .word data_ov002_022d0e3c
_LIT5: .word data_ov002_022cf08c
_LIT6: .word 0x00000868
