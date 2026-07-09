; func_ov002_02226d9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae320
        .extern func_ov002_021ae5c4
        .extern func_ov002_021de3c0
        .extern func_ov002_021e9d68
        .extern func_ov002_02257790
        .extern func_ov002_02257844
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .extern func_ov002_0226b184
        .global func_ov002_02226d9c
        .arm
func_ov002_02226d9c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x5a8]
    sub r0, r0, #0x7d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_1c4
    b .L_190
    b .L_120
    b .L_54
    b .L_30
.L_30:
    ldrh r0, [r5, #0x2]
    mov r2, #0x2
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b184
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_54:
    ldr r0, _LIT1
    ldrh r2, [r0, #0xb2]
    ldrh r4, [r0, #0xb0]
    cmp r4, r2
    beq .L_108
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_f0
    cmp r4, r2
    movls r4, r2
    strh r4, [r5, #0xc]
    ldrh r1, [r5, #0x2]
    ldr r2, _LIT3
    mov r0, r5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_02257844
    cmp r0, #0x0
    beq .L_c8
    mov r0, #0x1
    mov r1, r0, lsl r4
    ldr r0, _LIT4
    str r1, [r0, #0xd44]
    b .L_118
.L_c8:
    ldr r0, _LIT1
    ldrh r1, [r0, #0xb2]
    ldrh r2, [r0, #0xb0]
    mov r0, #0x1
    cmp r2, r1
    movcs r2, r1
    mov r1, r0, lsl r2
    ldr r0, _LIT4
    str r1, [r0, #0xd44]
    b .L_118
.L_f0:
    mov r1, #0x1
    mov r0, r1, lsl r2
    add r2, r0, r1, lsl r4
    mov r0, #0x140
    bl func_ov002_021ae5c4
    b .L_118
.L_108:
    mov r0, #0x1
    mov r1, r0, lsl r4
    ldr r0, _LIT4
    str r1, [r0, #0xd44]
.L_118:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_120:
    mov r3, #0x1
    ldr r0, _LIT4
    mov r1, r3
.L_12c:
    ldr r2, [r0, #0xd44]
    tst r2, r1, lsl r3
    strneh r3, [r5, #0xc]
    add r3, r3, #0x1
    cmp r3, #0x6
    ble .L_12c
    ldr r1, _LIT3
    mov r0, r5
    bl func_ov002_02257790
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    mov r1, #0x6d
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, pc}
.L_190:
    bl func_ov002_0225930c
    cmp r0, #0x0
    moveq r0, #0x7e
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT4
    mov r0, r5
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_021de3c0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1c4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d0d8c
_LIT2: .word data_ov002_022cd664
_LIT3: .word func_ov002_021e9d68
_LIT4: .word data_ov002_022d008c
