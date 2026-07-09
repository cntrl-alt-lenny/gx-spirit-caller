; func_ov002_021f74a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021dea94
        .extern func_ov002_021e7494
        .extern func_ov002_022576f4
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .extern func_ov002_0229acd0
        .global func_ov002_021f74a8
        .arm
func_ov002_021f74a8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    bl func_ov002_022576f4
    ldrh r2, [r7, #0x2]
    mov r6, r0
    ldr r1, _LIT0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r2, r0, #0x1
    and r2, r2, #0x1
    mul r3, r2, r1
    ldr r1, _LIT1
    ldr r1, [r1, r3]
    cmp r6, r1
    movcs r6, r1
    ldr r1, _LIT2
    ldr r1, [r1, #0x5b4]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_1e0
    b .L_60
    b .L_a4
    b .L_c8
    b .L_1c8
.L_60:
    mov r0, #0x0
    strh r0, [r7, #0xa]
    strh r0, [r7, #0x8]
    strh r0, [r7, #0xc]
    cmp r6, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r7, #0x2]
    mov r1, #0x74
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldr r1, _LIT2
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_a4:
    ldrh r1, [r7]
    ldr r2, _LIT3
    bl func_ov002_02259274
    ldr r1, _LIT2
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_c8:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_180
    ldr r0, _LIT4
    ldr r2, _LIT5
    ldr r4, [r0, #0xd70]
    ldr r5, [r0, #0xd74]
    ldr r3, [r0, #0xd78]
    ldr r0, _LIT0
    and r1, r4, #0x1
    mla r2, r1, r0, r2
    add r5, r5, r3
    mov r0, #0x14
    mul r0, r5, r0
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r1, r4
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r3, r0, r3, lsr #0x1f
    mov r2, r5
    mov r0, #0x28
    bl func_ov002_0229acd0
    add r3, r7, #0x8
    mov r2, r4, lsl #0x1
    ldrh r1, [r3, r2]
    mov r0, #0x1
    orr r0, r1, r0, lsl r5
    strh r0, [r3, r2]
    ldrh r0, [r7, #0xc]
    add r0, r0, #0x1
    strh r0, [r7, #0xc]
    ldrh r0, [r7, #0xc]
    cmp r0, r6
    ldrlt r0, _LIT2
    ldrlt r1, [r0, #0x5b4]
    sublt r1, r1, #0x1
    blt .L_174
    ldr r0, _LIT2
    ldr r1, [r0, #0x5b4]
    add r1, r1, #0x1
.L_174:
    str r1, [r0, #0x5b4]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_180:
    ldrh r0, [r7, #0xc]
    cmp r0, #0x0
    bne .L_1b0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x29
    bl func_ov002_0229acd0
    ldr r1, _LIT2
    mov r0, #0x0
    str r0, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1b0:
    ldr r1, _LIT2
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1c8:
    ldrh r2, [r7, #0x8]
    ldrh r1, [r7, #0xa]
    orr r1, r2, r1, lsl #0x10
    bl func_ov002_021dea94
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1e0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022ce1a8
_LIT3: .word func_ov002_021e7494
_LIT4: .word data_ov002_022d008c
_LIT5: .word data_ov002_022cf08c
