; func_ov002_021f9888 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021ae3a4
        .extern func_ov002_021dea94
        .extern func_ov002_021e7494
        .extern func_ov002_021f495c
        .extern func_ov002_022576f4
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .extern func_ov002_0229acd0
        .global func_ov002_021f9888
        .arm
func_ov002_021f9888:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r3, [r2, #0x5b4]
    mov r4, r1
    cmp r3, #0x7
    addls pc, pc, r3, lsl #0x2
    b .L_238
    b .L_40
    b .L_60
    b .L_98
    b .L_e8
    b .L_198
    b .L_98
    b .L_e8
    b .L_208
.L_40:
    mov r0, #0x0
    strh r0, [r5, #0xa]
    strh r0, [r5, #0x8]
    strh r0, [r5, #0xc]
    ldr r1, [r2, #0x5b4]
    add r1, r1, #0x1
    str r1, [r2, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_60:
    ldrh r0, [r5, #0x2]
    mov r1, #0x12
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldr r0, _LIT1
    mov r2, #0x1
    str r2, [r0, #0xd44]
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_98:
    ldr r0, _LIT1
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    bne .L_b8
    mov r0, #0x7
    str r0, [r2, #0x5b4]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_b8:
    ldrh r0, [r5, #0x2]
    ldr r2, _LIT2
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_e8:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_180
    ldr r0, _LIT1
    ldr r3, _LIT3
    ldr r1, [r0, #0xd70]
    ldr r6, [r0, #0xd74]
    ldr r4, [r0, #0xd78]
    ldr r0, _LIT4
    and r2, r1, #0x1
    mla r3, r2, r0, r3
    add r2, r6, r4
    mov r0, #0x14
    add r6, r5, #0x8
    mov lr, r1, lsl #0x1
    mul r0, r2, r0
    ldrh ip, [r6, lr]
    mov r4, #0x1
    add r3, r3, #0x30
    orr r4, ip, r4, lsl r2
    strh r4, [r6, lr]
    ldr r4, [r3, r0]
    mov r0, #0x28
    mov r3, r4, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, r4, lsr #0x1f
    bl func_ov002_0229acd0
    ldrh r2, [r5, #0xc]
    ldr r1, _LIT0
    mov r0, #0x0
    add r2, r2, #0x1
    strh r2, [r5, #0xc]
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_180:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x2
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_198:
    bl func_ov002_022576f4
    ldrh r1, [r5, #0xc]
    cmp r1, r0
    blt .L_1bc
    ldr r0, _LIT0
    mov r1, #0x7
    str r1, [r0, #0x5b4]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_1bc:
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_1e8
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_1f0
.L_1e8:
    mov r0, #0x138
    bl func_ov002_021ae3a4
.L_1f0:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_208:
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5, #0x8]
    ldrh r1, [r5, #0xa]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    orr r1, r2, r1, lsl #0x10
    bl func_ov002_021dea94
    mov r0, r5
    mov r1, r4
    bl func_ov002_021f495c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_238:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word func_ov002_021e7494
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cd664
