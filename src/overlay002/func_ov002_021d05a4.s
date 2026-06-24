; func_ov002_021d05a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022cf168
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf18c
        .extern data_ov002_022d016c
        .extern func_ov002_021b91c4
        .extern func_ov002_021ba4ec
        .extern func_ov002_021c988c
        .extern func_ov002_021c9b2c
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d05a4
        .arm
func_ov002_021d05a4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r1, _LIT0
    ldrh r0, [r0]
    ldr ip, [r1, #0x810]
    ldrh r3, [r1, #0x2]
    tst r0, #0x8000
    movne r5, #0x1
    moveq r5, #0x0
    cmp ip, #0x0
    beq .L_404
    cmp ip, #0x1
    beq .L_480
    cmp ip, #0x2
    beq .L_60c
    ldmia sp!, {r3, r4, r5, pc}
.L_404:
    ldrh r0, [r1, #0x4]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r1, #0x80c]
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    and r2, r5, #0x1
    mul r4, r2, r0
    ldr r0, _LIT2
    ldr r0, [r0, r4]
    cmp r0, #0x0
    bne .L_44c
    ldr r0, _LIT3
    mov r2, #0x1
    str r2, [r0, r4]
    mov r0, #0x0
    str r0, [r1, #0x80c]
    ldmia sp!, {r3, r4, r5, pc}
.L_44c:
    add r2, ip, #0x1
    ldr r0, _LIT4
    str r2, [r1, #0x810]
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x7
    cmpeq r3, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    mov r1, r5
    ldrh r2, [r0, #0x4]
    mov r0, #0x3f
    bl func_ov002_0229ade0
    ldmia sp!, {r3, r4, r5, pc}
.L_480:
    mov r0, #0x3f
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    and r1, r5, #0x1
    mul r4, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r4]
    cmp r0, #0x0
    bne .L_4c8
    ldr r1, _LIT3
    mov r2, #0x1
    str r2, [r1, r4]
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, pc}
.L_4c8:
    ldr r1, _LIT5
    ldr r0, _LIT6
    add r1, r1, r4
    add r1, r1, #0x260
    bl func_ov002_021b91c4
    mov r0, r5
    bl func_ov002_021ba4ec
    ldrh r1, [sp]
    mov r0, r5, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, _LIT7
    ldrh r3, [sp, #0x2]
    ldr r0, [r0, r4]
    and r2, r2, #0x1
    bic r1, r1, #0x1
    orr r1, r1, r2
    strh r1, [sp]
    bic r1, r3, #0x1
    orr r2, r1, r2
    ldrh r1, [sp]
    strh r2, [sp, #0x2]
    sub r0, r0, #0x1
    bic r1, r1, #0x3e
    orr r1, r1, #0x16
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldrh r2, [sp, #0x2]
    strh r1, [sp]
    mov r0, r0, lsl #0x18
    bic r1, r2, #0x3e
    orr r2, r1, #0x1a
    ldrh r1, [sp]
    strh r2, [sp, #0x2]
    ldrh r2, [sp, #0x2]
    bic r1, r1, #0x3fc0
    orr r0, r1, r0, lsr #0x12
    strh r0, [sp]
    bic r0, r2, #0x3fc0
    strh r0, [sp, #0x2]
    ldrh r0, [sp]
    ldrh r1, [sp, #0x2]
    bic r0, r0, #0x8000
    bic r1, r1, #0x8000
    strh r0, [sp]
    ldrh r0, [sp]
    strh r1, [sp, #0x2]
    ldrh r4, [sp, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    bic r4, r4, #0x4000
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    strh r4, [sp, #0x2]
    bl func_ov002_021c988c
    ldr r1, _LIT0
    ldrh r4, [sp]
    ldr r1, [r1, #0x818]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r3, r0, lsl #0x1f
    bic r4, r4, #0x4000
    mov r1, r1, lsr #0x18
    orr r3, r4, r3, lsr #0x11
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    strh r3, [sp]
    mov r1, r1, lsl #0x10
    ldrh r2, [sp, #0x2]
    ldrh r3, [sp]
    mov r0, #0x18
    mov r1, r1, lsr #0x10
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, pc}
.L_60c:
    ldrh r0, [r1, #0x4]
    sub r0, r0, #0x1
    strh r0, [r1, #0x4]
    ldrh r0, [r1, #0x4]
    cmp r0, #0x0
    subne r0, ip, #0x1
    strne r0, [r1, #0x810]
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT4
    ldr r0, [r0, #0xd0]
    mov r0, r0, lsr #0x2
    tst r0, #0x1
    beq .L_650
    mov r0, r5
    mov r1, #0x2
    mov r2, #0x1
    bl func_ov002_021c9b2c
.L_650:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf17c
_LIT3: .word data_ov002_022cf18c
_LIT4: .word data_ov002_022d016c
_LIT5: .word data_ov002_022cf16c
_LIT6: .word data_ov002_022cf168
_LIT7: .word data_ov002_022cf178
