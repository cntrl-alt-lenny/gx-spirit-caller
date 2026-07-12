; func_ov002_021cc178 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce870
        .extern data_ov002_022cf088
        .extern data_ov002_022cf0a0
        .extern data_ov002_022cf0a8
        .extern func_ov002_021b0b24
        .extern func_ov002_021b90e4
        .extern func_ov002_021b939c
        .extern func_ov002_021b98d4
        .extern func_ov002_021b9950
        .extern func_ov002_021ba924
        .extern func_ov002_021baa58
        .extern func_ov002_021c2b74
        .extern func_ov002_021c2c54
        .extern func_ov002_021c9310
        .extern func_ov002_021c9718
        .extern func_ov002_021c97ac
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021cc178
        .arm
func_ov002_021cc178:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    ldrh r3, [r0, #0x2]
    mov r0, r3, lsl #0x10
    mov r6, r0, lsr #0x16
    mov r2, r3, lsl #0x1f
    mov r1, r3, lsl #0x1a
    mov r0, r6
    strh r3, [sp, #0xa]
    mov r4, r2, lsr #0x1f
    mov r5, r1, lsr #0x1b
    bl func_ov002_021b939c
    ldr r2, _LIT0
    mov r1, r0, lsr #0x10
    ldrh r0, [r2, #0x4]
    ldrh r9, [r2, #0x6]
    ldr r3, [r2, #0x810]
    mov r1, r1, lsl #0x10
    mov sl, r9, asr #0x8
    mov r7, r0, lsl #0x1f
    mov r8, r0, lsl #0x1a
    strh r0, [sp, #0x8]
    mov r0, r0, lsl #0x10
    cmp r3, #0x0
    mov fp, r1, lsr #0x10
    mov r7, r7, lsr #0x1f
    mov r8, r8, lsr #0x1b
    str r0, [sp]
    and r9, r9, #0xff
    and sl, sl, #0xff
    beq .L_d70
    cmp r3, #0x1
    beq .L_e38
    cmp r3, #0x2
    moveq r0, #0x0
    streq r0, [r2, #0x80c]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d70:
    cmp r5, #0xe
    bne .L_dc8
    mov r0, r4
    mov r1, r6
    bl func_ov002_021b98d4
    ldr r1, _LIT1
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r1, _LIT2
    ldr r1, [r1, r3]
    sub r1, r1, #0x1
    cmp r1, r0
    beq .L_dc8
    mov r1, r6, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021c2b74
    mov r1, r4
    mov r2, r5
    mov r3, r6
    mov r0, #0x16
    bl func_ov002_0229acd0
.L_dc8:
    cmp r5, #0xf
    bne .L_e20
    mov r0, r4
    mov r1, r6
    bl func_ov002_021b9950
    ldr r1, _LIT1
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r1, _LIT3
    ldr r1, [r1, r3]
    sub r1, r1, #0x1
    cmp r1, r0
    beq .L_e20
    mov r1, r6, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021c2c54
    mov r1, r4
    mov r2, r5
    mov r3, r6
    mov r0, #0x16
    bl func_ov002_0229acd0
.L_e20:
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e38:
    mov r0, #0x16
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r4
    mov r1, r5
    mov r2, fp
    bl func_ov002_021c9310
    mov r1, r0
    ldr r2, [r1]
    ldr r0, _LIT4
    bic r2, r2, #0x40000
    bic r2, r2, #0x80000
    bic r2, r2, #0x20000
    bic r2, r2, #0x100000
    bic r2, r2, #0x200000
    str r2, [r1]
    bl func_ov002_021b90e4
    ldrh r3, [sp, #0x6]
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    and r2, r0, #0x1
    bic r3, r3, #0x1
    orr r2, r3, r2
    strh r2, [sp, #0x6]
    ldrh r2, [sp, #0x6]
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, lsl #0x1b
    bic r2, r2, #0x3e
    orr r1, r2, r1, lsr #0x1a
    strh r1, [sp, #0x6]
    ldrh r1, [sp, #0x6]
    mov r0, fp, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x18
    bic r1, r1, #0x3fc0
    orr r0, r1, r0, lsr #0x12
    strh r0, [sp, #0x6]
    ldrh r2, [sp, #0x6]
    mov r0, r2, lsl #0x1f
    mov r1, r2, lsl #0x1a
    mov r2, r2, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c9718
    ldrh r1, [sp, #0x6]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x8000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x10
    strh r0, [sp, #0x6]
    ldrh r2, [sp, #0x6]
    mov r0, r2, lsl #0x1f
    mov r1, r2, lsl #0x1a
    mov r2, r2, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c97ac
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldrh r3, [sp, #0x6]
    ldrh r1, [sp, #0x4]
    mov r2, r0, lsl #0x1f
    mov r0, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r3, r3, #0x4000
    orr r2, r3, r2, lsr #0x11
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r2, [sp, #0x6]
    strh r0, [sp, #0x4]
    ldr r0, [sp]
    ldrh r1, [sp, #0x4]
    add r0, r8, r0, lsr #0x16
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0x4]
    ldrh r1, [sp, #0x4]
    mov r0, sl, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3fc0
    strh r1, [sp, #0x4]
    ldrh r1, [sp, #0x4]
    mov r0, r0, lsl #0x1f
    ldrh r2, [sp, #0x6]
    bic r1, r1, #0x8000
    orr r0, r1, r0, lsr #0x10
    strh r0, [sp, #0x4]
    ldrh r4, [sp, #0x4]
    mov r0, r9, lsl #0x10
    mov r3, r0, lsr #0x10
    mov r0, r2, lsl #0x1f
    mov r1, r2, lsl #0x1a
    mov r2, r2, lsl #0x12
    bic r4, r4, #0x4000
    mov r3, r3, lsl #0x1f
    orr r3, r4, r3, lsr #0x11
    strh r3, [sp, #0x4]
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021ba924
    ldrh r2, [sp, #0x4]
    and r1, r9, #0xff
    and r0, sl, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r1, r2, lsl #0x1a
    mov r4, r2, lsl #0x1f
    mov r2, r0, lsl #0x10
    ldr r3, _LIT4
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x10
    bl func_ov002_021baa58
    ldr r0, _LIT0
    ldrh r2, [sp, #0x6]
    ldr r1, [r0, #0x818]
    ldrh r3, [sp, #0x4]
    mov r4, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r4, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r0, #0x18
    mov r1, r1, lsr #0x10
    bl func_ov002_0229acd0
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    cmp r7, r0
    cmpeq r9, #0x0
    bne .L_1088
    cmp r8, #0x5
    blt .L_1088
    cmp r8, #0xa
    bgt .L_1088
    mov r0, #0x1d
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_1088:
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0a0
_LIT3: .word data_ov002_022cf0a8
_LIT4: .word data_ov002_022cf088
_LIT5: .word data_ov002_022cd65c
