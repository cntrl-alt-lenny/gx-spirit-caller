; func_ov002_021d0780 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce870
        .extern data_ov002_022cf088
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern func_0202e1e0
        .extern func_ov002_021b0b24
        .extern func_ov002_021b90e4
        .extern func_ov002_021ba924
        .extern func_ov002_021baa58
        .extern func_ov002_021c2854
        .extern func_ov002_021c28dc
        .extern func_ov002_021c9310
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021d0780
        .arm
func_ov002_021d0780:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mov r7, #0x0
    ldrh r0, [r0]
    tst r0, #0x8000
    movne r9, #0x1
    moveq r9, #0x0
    ldr r0, _LIT1
    and r1, r9, #0x1
    mul r8, r1, r0
    ldr r1, _LIT0
    ldr r0, _LIT2
    ldrh r4, [r1, #0x4]
    add r0, r0, r8
    ldr r2, [r0, #0x260]
    tst r4, #0x1
    mov r0, r2, lsl #0x2
    movne r7, #0x1
    mov r0, r0, lsr #0x18
    mov r5, r2, lsl #0x13
    mov r3, r2, lsl #0x12
    mov r2, r0, lsl #0x1
    mov r0, r5, lsr #0x13
    add r6, r2, r3, lsr #0x1f
    ldrh sl, [r1, #0x2]
    ldrh r5, [r1, #0x6]
    tst r4, #0x2
    beq .L_80
    bl func_0202e1e0
    cmp r0, #0x0
    movne r7, #0x1
.L_80:
    tst r4, #0x4
    beq .L_90
    tst r6, #0x1
    moveq r7, #0x1
.L_90:
    tst r4, #0x8
    beq .L_a4
    and r0, r6, #0x1
    cmp r0, #0x1
    moveq r7, #0x1
.L_a4:
    ldr r0, _LIT0
    ldr r2, [r0, #0x810]
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_434
    b .L_c8
    b .L_e8
    b .L_154
    b .L_410
.L_c8:
    cmp sl, #0x0
    str sl, [r0, #0x814]
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    addne r1, r2, #0x1
    strne r1, [r0, #0x810]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_e8:
    ldr r1, _LIT3
    ldr r1, [r1, r8]
    cmp r1, #0x0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    addeq sp, sp, #0x4
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r7, #0x0
    beq .L_13c
    ldr r0, _LIT2
    mov r1, r9
    add r0, r0, r8
    ldr r3, [r0, #0x260]
    mov r0, #0x1f
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r3, r2, r3, lsr #0x1f
    mov r2, #0xd
    bl func_ov002_0229acd0
.L_13c:
    ldr r0, _LIT0
    add sp, sp, #0x4
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_154:
    mov r0, #0x1f
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r9
    mov r1, #0xd
    mov r2, #0x0
    bl func_ov002_021c9310
    mov r4, r0
    ldr r1, [r4]
    mov r0, r5, lsl #0x1f
    bic r2, r1, #0x100000
    bic r1, r2, #0x40000
    orr r0, r1, r0, lsr #0xd
    str r0, [r4]
    cmp r7, #0x0
    bne .L_210
    ldr r0, [r4]
    mov r1, #0x1
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x3
    mov r2, r1, lsl r0
    ldr r1, _LIT4
    mov r0, #0x0
    bl func_ov002_021c2854
    ldr r1, [r4]
    mov r0, #0x1
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x3
    mov r2, r0, lsl r1
    ldr r1, _LIT4
    bl func_ov002_021c2854
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_210
    ldr r0, [r4]
    ldr r1, _LIT5
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021c28dc
.L_210:
    cmp r7, #0x0
    beq .L_238
    ldr r1, _LIT6
    mov r0, #0x0
    mov r2, #0x1
    bl func_ov002_021c2854
    mov r0, #0x1
    ldr r1, _LIT6
    mov r2, r0
    bl func_ov002_021c2854
.L_238:
    ldr r0, _LIT7
    mov r1, r4
    bl func_ov002_021b90e4
    ldr r0, _LIT8
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r9, r0
    bne .L_2a8
    cmp r5, #0x0
    beq .L_2a8
    mov r0, #0x29
    mov r1, #0x1
    bl func_ov002_021b0b24
    cmp r7, #0x0
    beq .L_2a8
    mov r0, #0x26
    mov r1, #0x1
    bl func_ov002_021b0b24
    ldr r0, _LIT0
    ldr r0, [r0, #0x818]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_2a8
    mov r0, #0x27
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_2a8:
    ldrh r1, [sp, #0x2]
    mov r0, r9, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0x2]
    ldr r0, _LIT0
    ldrh r1, [sp]
    ldr r0, [r0, #0x818]
    ldrh r2, [sp, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r2, #0x3e
    orr r2, r2, #0x1a
    strh r2, [sp, #0x2]
    ldrh r2, [sp, #0x2]
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp]
    cmp r7, #0x0
    movne r0, #0xf
    moveq r0, #0xe
    ldrh r1, [sp]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r2, #0x3fc0
    strh r2, [sp, #0x2]
    ldrh r2, [sp, #0x2]
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp]
    ldrh r1, [sp]
    bic r2, r2, #0x8000
    strh r2, [sp, #0x2]
    ldrh r2, [sp, #0x2]
    bic r1, r1, #0x3fc0
    orr r1, r1, #0x40
    orr r2, r2, #0x4000
    strh r2, [sp, #0x2]
    strh r1, [sp]
    ldrh r0, [sp, #0x2]
    ldrh r2, [sp]
    mov r1, r0, lsl #0x1a
    bic r2, r2, #0x8000
    strh r2, [sp]
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    ldrh r4, [sp]
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    orr r3, r4, #0x4000
    mov r2, r2, lsr #0x18
    strh r3, [sp]
    bl func_ov002_021ba924
    cmp r7, #0x0
    ldreqh r0, [sp]
    movne r2, #0x0
    ldr r3, _LIT7
    moveq r0, r0, lsl #0x12
    moveq r2, r0, lsr #0x18
    ldrh r0, [sp]
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021baa58
    ldr r0, _LIT0
    ldrh r2, [sp, #0x2]
    ldr r1, [r0, #0x818]
    ldrh r3, [sp]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0x18
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    add sp, sp, #0x4
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_410:
    ldr r1, [r0, #0x814]
    add sp, sp, #0x4
    subs r1, r1, #0x1
    str r1, [r0, #0x814]
    subne r1, r2, #0x1
    strne r1, [r0, #0x810]
    addeq r1, r2, #0x1
    streq r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_434:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf09c
_LIT4: .word 0x00001361
_LIT5: .word 0x00001574
_LIT6: .word 0x000016da
_LIT7: .word data_ov002_022cf088
_LIT8: .word data_ov002_022cd65c
