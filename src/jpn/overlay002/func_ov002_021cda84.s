; func_ov002_021cda84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce640
        .extern data_ov002_022ce870
        .extern data_ov002_022cf0a0
        .extern data_ov002_022cf0a8
        .extern data_ov002_022d0170
        .extern func_ov002_021b98d4
        .extern func_ov002_021b9950
        .extern func_ov002_021b99c8
        .extern func_ov002_021c2b74
        .extern func_ov002_021c2c54
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021cda84
        .arm
func_ov002_021cda84:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r6, #0x1
    ldr r1, [r0, #0x810]
    moveq r6, #0x0
    ldrh r4, [r0, #0x2]
    cmp r1, #0x0
    ldrh r5, [r0, #0x4]
    ldrh r7, [r0, #0x6]
    beq .L_48
    cmp r1, #0x1
    beq .L_10c
    cmp r1, #0x2
    beq .L_22c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_48:
    cmp r4, #0xe
    bne .L_a0
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b98d4
    ldr r1, _LIT1
    and r2, r6, #0x1
    mul r3, r2, r1
    ldr r1, _LIT2
    ldr r1, [r1, r3]
    sub r1, r1, #0x1
    cmp r1, r0
    beq .L_a0
    mov r1, r5, lsl #0x10
    mov r0, r6
    mov r1, r1, lsr #0x10
    bl func_ov002_021c2b74
    mov r1, r6
    mov r2, r4
    mov r3, r5
    mov r0, #0x16
    bl func_ov002_0229acd0
.L_a0:
    cmp r4, #0xf
    bne .L_f8
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b9950
    ldr r1, _LIT1
    and r2, r6, #0x1
    mul r3, r2, r1
    ldr r1, _LIT3
    ldr r1, [r1, r3]
    sub r1, r1, #0x1
    cmp r1, r0
    beq .L_f8
    mov r1, r5, lsl #0x10
    mov r0, r6
    mov r1, r1, lsr #0x10
    bl func_ov002_021c2c54
    mov r1, r6
    mov r2, r4
    mov r3, r5
    mov r0, #0x16
    bl func_ov002_0229acd0
.L_f8:
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_10c:
    mov r0, #0x16
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r7, #0x6
    blt .L_1d4
    ldrh r1, [sp]
    mov r0, r6, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp]
    ldrh r1, [sp]
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1e
    mov r0, r0, lsl #0x1c
    orr r0, r1, r0, lsr #0x1b
    strh r0, [sp]
    mov r0, r5, lsl #0x10
    mov r1, r0, lsr #0x10
    ldrh r2, [sp]
    ldr r0, _LIT4
    mov r1, r1, lsl #0x17
    and r0, r2, r0
    orr r0, r0, r1, lsr #0x12
    strh r0, [sp]
    ldrh r3, [sp]
    ldr r1, _LIT5
    ldr r0, _LIT6
    mov r2, r3, lsl #0x12
    mov r2, r2, lsr #0x17
    mov r2, r2, lsl #0x2
    ldrh r1, [r1, r2]
    bic r3, r3, #0xc000
    ldr r2, [r0, #0x494]
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x1e
    mov r1, r1, lsl #0x1e
    orr r1, r3, r1, lsr #0x10
    strh r1, [sp]
    ldrh r3, [sp]
    ldr r1, _LIT7
    mov r2, r2, lsl #0x1
    strh r3, [r1, r2]
    ldr r1, [r0, #0x494]
    add r1, r1, #0x1
    and r1, r1, #0x7f
    str r1, [r0, #0x494]
.L_1d4:
    cmp r4, #0xb
    movne r0, #0x0
    bne .L_1ec
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b99c8
.L_1ec:
    and r1, r4, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0, lsl #0x8
    cmp r4, #0xd
    moveq r3, #0x1
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    movne r3, #0x0
    mov r1, r6
    mov r0, #0x17
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_22c:
    mov r0, #0x17
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0a0
_LIT3: .word data_ov002_022cf0a8
_LIT4: .word 0xffffc01f
_LIT5: .word data_ov002_022d0170
_LIT6: .word data_ov002_022ce1a8
_LIT7: .word data_ov002_022ce640
