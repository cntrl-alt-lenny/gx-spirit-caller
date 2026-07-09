; func_ov002_021fae54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021dea94
        .extern func_ov002_021e7494
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .extern func_ov002_0229acd0
        .global func_ov002_021fae54
        .arm
func_ov002_021fae54:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r4, #0x2
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x23
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r1, [r5]
    ldr r0, _LIT0
    cmp r1, r0
    ldr r0, _LIT1
    moveq r4, #0x3
    ldr r0, [r0, #0x5b4]
    cmp r0, #0x0
    beq .L_58
    cmp r0, #0x1
    beq .L_94
    cmp r0, #0x2
    beq .L_c4
    b .L_1b0
.L_58:
    mov r0, #0x0
    strh r0, [r5, #0xa]
    strh r0, [r5, #0x8]
    strh r0, [r5, #0xc]
    ldrh r0, [r5, #0x2]
    mov r1, #0x12
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_94:
    ldrh r0, [r5, #0x2]
    ldr r2, _LIT2
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_c4:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_18c
    ldr r0, _LIT3
    ldr r3, _LIT4
    ldr r1, [r0, #0xd70]
    ldr r7, [r0, #0xd74]
    ldr r6, [r0, #0xd78]
    ldr r0, _LIT5
    and r2, r1, #0x1
    mla r3, r2, r0, r3
    add r2, r7, r6
    mov r0, #0x14
    add r7, r5, #0x8
    mov r6, r1, lsl #0x1
    mul r0, r2, r0
    ldrh lr, [r7, r6]
    mov ip, #0x1
    add r3, r3, #0x30
    orr ip, lr, ip, lsl r2
    strh ip, [r7, r6]
    ldr ip, [r3, r0]
    mov r0, #0x28
    mov r3, ip, lsl #0x2
    mov r3, r3, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, ip, lsr #0x1f
    bl func_ov002_0229acd0
    ldrh r0, [r5, #0xc]
    add r0, r0, #0x1
    strh r0, [r5, #0xc]
    ldrh r0, [r5, #0xc]
    cmp r0, r4
    bge .L_168
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_168:
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5, #0x8]
    ldrh r1, [r5, #0xa]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    orr r1, r2, r1, lsl #0x10
    bl func_ov002_021dea94
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_18c:
    mov r1, #0x0
    ldr r4, _LIT1
    mov r2, r1
    mov r3, r1
    mov r0, #0x29
    str r1, [r4, #0x5b4]
    bl func_ov002_0229acd0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1b0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x0000195c
_LIT1: .word data_ov002_022ce1a8
_LIT2: .word func_ov002_021e7494
_LIT3: .word data_ov002_022d008c
_LIT4: .word data_ov002_022cf08c
_LIT5: .word 0x00000868
