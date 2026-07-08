; func_ov002_0226b808 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021afff0
        .extern func_ov002_021d46ac
        .extern func_ov002_021d7a54
        .extern func_ov002_021d86b4
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .global func_ov002_0226b808
        .arm
func_ov002_0226b808:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldr r0, _LIT0
    cmp r2, #0x0
    moveq r6, #0x1
    ldr r0, [r0, #0xd9c]
    movne r6, #0x0
    mov r7, r1
    cmp r0, #0x0
    beq .L_3c
    cmp r0, #0x1
    beq .L_8c
    cmp r0, #0x2
    beq .L_1a8
    b .L_1bc
.L_3c:
    ldr r0, _LIT1
    and r1, r8, #0x1
    mul r3, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r3]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT3
    add r1, r2, r6
    strh r1, [r0, #0xb2]
    cmp r6, #0x0
    bne .L_74
    bl func_ov002_021e2a4c
.L_74:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_8c:
    ldr r0, _LIT3
    ldrh r0, [r0, #0xb2]
    cmp r0, #0x0
    beq .L_190
    ldr r0, _LIT1
    and r1, r8, #0x1
    mul r5, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r5]
    cmp r0, #0x0
    beq .L_190
    bl func_ov002_021afff0
    mov r1, #0x0
    mov r4, r0
    cmp r8, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x53
    mov r0, r0, lsl #0x10
    mov r2, r1
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d46ac
    ldr r1, _LIT4
    mov r0, r8
    add r1, r1, r5
    add r5, r1, #0x120
    ldr r3, [r5, r4, lsl #0x2]
    mov r1, #0xb
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    add r5, r5, r4, lsl #0x2
    bl func_ov002_021d86b4
    cmp r6, #0x0
    beq .L_144
    ldr r0, _LIT3
    ldr r1, _LIT0
    strh r4, [r0, #0xb0]
    ldr r2, [r1, #0xd9c]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_144:
    cmp r7, #0x0
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r8
    mov r1, r5
    bl func_ov002_021d7a54
    ldr r2, [r5]
    ldr r1, _LIT3
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    strh r0, [r1, #0xb0]
    ldrh r2, [r1, #0xb2]
    mov r0, #0x0
    sub r2, r2, #0x1
    strh r2, [r1, #0xb2]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_190:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1a8:
    cmp r6, #0x0
    bne .L_1b4
    bl func_ov002_021e2b6c
.L_1b4:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1bc:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022d0d8c
_LIT4: .word data_ov002_022cf08c
