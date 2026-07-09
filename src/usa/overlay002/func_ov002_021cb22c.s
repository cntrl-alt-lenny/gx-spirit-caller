; func_ov002_021cb22c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd374
        .extern data_ov002_022cd3d8
        .extern data_ov002_022ce870
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern data_ov002_022d008c
        .extern func_ov002_021b1da0
        .extern func_ov002_0229acd0
        .extern func_ov002_0229cc4c
        .extern func_ov002_0229cc60
        .global func_ov002_021cb22c
        .arm
func_ov002_021cb22c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r5, #0x1
    ldr r1, [r0, #0x810]
    moveq r5, #0x0
    ldrh r4, [r0, #0x2]
    cmp r1, #0x0
    ldrh sl, [r0, #0x4]
    beq .L_44
    cmp r1, #0x1
    beq .L_1a0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_44:
    ldrh r1, [sp, #0x2]
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r1, r1, r0
    strh r1, [sp, #0x2]
    ldrh r1, [sp, #0x2]
    mov r3, #0x14
    ldr r2, _LIT1
    and r7, r5, #0x1
    mul r2, r7, r2
    bic r1, r1, #0x3e
    strh r1, [sp, #0x2]
    mov r1, r4, lsl #0x10
    ldrh r6, [sp, #0x2]
    mov r5, r1, lsr #0x10
    ldrh r1, [sp]
    bic r8, r6, #0x3fc0
    mov r6, r5, lsl #0x18
    bic r1, r1, #0x1
    orr r0, r1, r0
    ldr r1, _LIT2
    orr r6, r8, r6, lsr #0x12
    strh r6, [sp, #0x2]
    strh r0, [sp]
    mul r3, r4, r3
    ldr r7, _LIT3
    add r1, r1, r2
    add r4, r7, r2
    ldrh r7, [r3, r4]
    ldr r4, _LIT4
    ldrh r1, [r3, r1]
    add r2, r4, r2
    add r2, r2, #0x30
    ldr r4, [r2, r3]
    ldrh r6, [sp, #0x2]
    ldrh r0, [sp]
    mov r2, r7, lsl #0x1f
    bic r3, r6, #0x8000
    orr r2, r3, r2, lsr #0x10
    strh r2, [sp, #0x2]
    mov r2, r4, lsl #0x2
    mov r3, r2, lsr #0x18
    bic r2, r0, #0x3e
    mov r0, r5, lsl #0x1b
    orr r0, r2, r0, lsr #0x1a
    ldrh r6, [sp, #0x2]
    strh r0, [sp]
    ldrh r0, [sp]
    bic r2, r6, #0x4000
    mov r1, r1, lsl #0x1f
    orr r1, r2, r1, lsr #0x11
    strh r1, [sp, #0x2]
    bic r0, r0, #0x3fc0
    orr r0, r0, #0x3fc0
    strh r0, [sp]
    ldrh r2, [sp, #0x2]
    ldrh r5, [sp]
    mov r0, r2, lsl #0x10
    mov r1, r0, lsr #0x1f
    mov r0, r2, lsl #0x11
    mov r0, r0, lsr #0x1f
    bic r5, r5, #0x8000
    mov r1, r1, lsl #0x1f
    orr r1, r5, r1, lsr #0x10
    strh r1, [sp]
    ldrh r5, [sp]
    mov r1, r4, lsl #0x12
    mov r0, r0, lsl #0x1f
    bic r4, r5, #0x4000
    orr r4, r4, r0, lsr #0x11
    mov r0, r3, lsl #0x1
    strh r4, [sp]
    add r0, r0, r1, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    orr r1, r0, #0x60000
    ldrh r3, [sp]
    mov r0, #0x18
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    add sp, sp, #0x4
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_1a0:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b1da0
    mov r2, #0x14
    ldr r3, _LIT4
    ldr r0, _LIT1
    and r1, r5, #0x1
    mla r0, r1, r0, r3
    mul r8, r4, r2
    add r9, r0, #0x30
    mul r6, sl, r2
    ldr r7, _LIT5
    add r1, r9, r8
    add r0, r7, r6
    bl func_ov002_0229cc60
    ldr r1, _LIT6
    mov r0, #0x38
    ldr r2, [r1]
    ldr r1, _LIT7
    eor r2, r2, sl
    mul r0, r2, r0
    ldr r0, [r1, r0]
    ldr r1, [r7, r6]
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    mov r0, r0, lsl #0x1f
    bic r1, r1, #0x200000
    orr r2, r1, r0, lsr #0xa
    add r0, r9, r8
    mov r1, #0x14
    str r2, [r7, r6]
    bl func_ov002_0229cc4c
    ldr r1, _LIT8
    add r0, r4, r5, lsl #0x4
    mov r2, #0x1
    mvn r2, r2, lsl r0
    ldr r3, [r1, #0xd4]
    ldr r0, _LIT0
    and r2, r3, r2
    str r2, [r1, #0xd4]
    mov r1, #0x0
    str r1, [r0, #0x80c]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022cf0c2
_LIT4: .word data_ov002_022cf08c
_LIT5: .word data_ov002_022cd3d8
_LIT6: .word data_ov002_022cd314
_LIT7: .word data_ov002_022cd374
_LIT8: .word data_ov002_022d008c
