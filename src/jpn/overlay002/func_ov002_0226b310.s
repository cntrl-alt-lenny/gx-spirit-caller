; func_ov002_0226b310 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae690
        .extern func_ov002_021d7880
        .extern func_ov002_021d78e0
        .extern func_ov002_021d792c
        .extern func_ov002_021d7b2c
        .extern func_ov002_021d7b50
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0225923c
        .extern func_ov002_0225930c
        .extern func_ov002_0226b1c8
        .extern func_ov002_022903f0
        .extern func_ov002_0229acd0
        .global func_ov002_0226b310
        .arm
func_ov002_0226b310:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov r9, r0
    ldr r0, _LIT0
    and r3, r9, #0x1
    mul r8, r3, r0
    ldr r0, _LIT1
    mov r6, #0x0
    ldr r0, [r0, r8]
    str r1, [sp]
    cmp r0, #0x0
    and r0, r2, #0x1
    str r0, [sp, #0x10]
    and r0, r2, #0x2
    str r0, [sp, #0xc]
    and r0, r2, #0x8
    str r0, [sp, #0x8]
    and r0, r2, #0x20
    mov r5, r6
    and r4, r2, #0x10
    str r0, [sp, #0x4]
    and fp, r2, #0x80
    bls .L_94
    ldr r0, _LIT2
    mov sl, #0xb
    add r7, r0, r8
.L_68:
    mov r0, r9
    mov r1, sl
    mov r2, r5
    bl func_ov002_0226b1c8
    cmp r0, #0x0
    movne r6, #0x1
    bne .L_94
    add r5, r5, #0x1
    ldr r0, [r7, #0xc]
    cmp r5, r0
    bcc .L_68
.L_94:
    ldr r1, _LIT3
    ldr r0, [r1, #0xd9c]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_314
    b .L_bc
    b .L_ec
    b .L_168
    b .L_210
    b .L_25c
.L_bc:
    cmp r6, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_ov002_021e2a4c
    ldr r2, _LIT4
    ldr r0, [sp]
    ldr r1, _LIT3
    strh r0, [r2, #0xb2]
    ldr r0, [r1, #0xd9c]
    add r0, r0, #0x1
    str r0, [r1, #0xd9c]
.L_ec:
    ldr r0, _LIT5
    ldr r0, [r0, r9, lsl #0x2]
    cmp r0, #0x0
    bne .L_14c
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_114
    mov r0, #0x3d
    bl func_ov002_021ae690
    b .L_14c
.L_114:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_12c
    mov r0, #0x14
    bl func_ov002_021ae690
    b .L_14c
.L_12c:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_144
    mov r0, #0x29
    bl func_ov002_021ae690
    b .L_14c
.L_144:
    mov r0, #0xeb
    bl func_ov002_021ae690
.L_14c:
    ldr r1, _LIT3
    add sp, sp, #0x14
    ldr r2, [r1, #0xd9c]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_168:
    ldr r0, _LIT4
    ldrh r0, [r0, #0xb2]
    cmp r0, #0x0
    cmpne r6, #0x0
    bne .L_18c
    bl func_ov002_021e2b6c
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18c:
    ldr r0, _LIT5
    ldr r0, [r0, r9, lsl #0x2]
    cmp r0, #0x1
    bne .L_1c0
    cmp r4, #0x0
    cmpeq fp, #0x0
    moveq r1, #0x1
    movne r1, #0x0
    ldr r2, _LIT6
    mov r0, r9
    add r1, r1, #0x2
    bl func_ov002_022903f0
    b .L_1f4
.L_1c0:
    ldr r0, _LIT1
    ldr r2, [r0, r8]
    ldr r0, [r1, #0xd78]
    sub r3, r2, #0x1
    sub r0, r0, #0x1
    cmp r3, r0
    movcs r3, r0
    mov r1, r9
    mov r0, #0x7
    mov r2, #0xb
    bl func_ov002_0229acd0
    ldr r0, _LIT6
    bl func_ov002_0225923c
.L_1f4:
    ldr r1, _LIT3
    add sp, sp, #0x14
    ldr r2, [r1, #0xd9c]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_210:
    bl func_ov002_0225930c
    cmp r0, #0x0
    mov r0, #0x0
    beq .L_244
    ldr r2, _LIT3
    ldr r1, _LIT4
    ldr r3, [r2, #0xd78]
    add sp, sp, #0x14
    strh r3, [r1, #0xb4]
    ldr r1, [r2, #0xd9c]
    add r1, r1, #0x1
    str r1, [r2, #0xd9c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_244:
    ldr r1, _LIT3
    add sp, sp, #0x14
    ldr r2, [r1, #0xd9c]
    sub r2, r2, #0x2
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_25c:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_2b0
    ldr r0, _LIT4
    cmp r4, #0x0
    ldrh r1, [r0, #0xb4]
    beq .L_284
    mov r0, r9
    bl func_ov002_021d7b50
    b .L_2e8
.L_284:
    ldr r3, _LIT2
    ldr r0, [sp, #0xc]
    add r3, r3, r8
    cmp r0, #0x0
    movne r2, #0x1
    add r3, r3, #0x120
    moveq r2, #0x0
    mov r0, r9
    add r1, r3, r1, lsl #0x2
    bl func_ov002_021d7b2c
    b .L_2e8
.L_2b0:
    ldr r0, _LIT4
    cmp fp, #0x0
    ldrh r1, [r0, #0xb4]
    beq .L_2cc
    mov r0, r9
    bl func_ov002_021d78e0
    b .L_2e8
.L_2cc:
    cmp r4, #0x0
    mov r0, r9
    beq .L_2e0
    bl func_ov002_021d792c
    b .L_2e8
.L_2e0:
    ldr r2, [sp, #0xc]
    bl func_ov002_021d7880
.L_2e8:
    ldr r2, _LIT4
    ldr r1, _LIT3
    ldrh r3, [r2, #0xb2]
    add sp, sp, #0x14
    mov r0, #0x0
    sub r3, r3, #0x1
    strh r3, [r2, #0xb2]
    ldr r2, [r1, #0xd9c]
    sub r2, r2, #0x2
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_314:
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022d008c
_LIT4: .word data_ov002_022d0d8c
_LIT5: .word data_ov002_022cd664
_LIT6: .word func_ov002_0226b1c8
