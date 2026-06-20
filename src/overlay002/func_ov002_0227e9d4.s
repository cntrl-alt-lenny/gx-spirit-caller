; func_ov002_0227e9d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdc78
        .extern data_ov002_022cdc88
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_020315e8
        .extern func_ov002_021b9ecc
        .extern func_ov002_0227e76c
        .extern func_ov002_0227e784
        .extern func_ov002_0227e914
        .global func_ov002_0227e9d4
        .arm
func_ov002_0227e9d4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x48
    mov r4, #0x0
    mov r6, r0
    mov r2, r4
    mov r5, r4
    add r1, sp, #0x0
    add r0, sp, #0x24
.L_20:
    str r5, [r1, r2, lsl #0x2]
    str r5, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0x9
    bcc .L_20
    mov r8, #0x1
    add r7, sp, #0x24
.L_3c:
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b9ecc
    mov r9, r0
    bl func_020315e8
    orr r4, r4, r0
    mov r0, r9
    bl func_ov002_0227e914
    add r5, r5, #0x1
    str r8, [r7, r0, lsl #0x2]
    cmp r5, #0x4
    ble .L_3c
    ldr r0, _LIT0
    and r2, r6, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r7, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_d4
    ldr r0, _LIT2
    mov r9, #0x1
    add r6, r0, r1
    add r5, r6, #0x120
    add r8, sp, #0x24
.L_a0:
    ldr r0, [r5], #0x4
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    mov r0, sl
    bl func_020315e8
    add r4, r4, r0
    mov r0, sl
    bl func_ov002_0227e914
    ldr r1, [r6, #0xc]
    add r7, r7, #0x1
    str r9, [r8, r0, lsl #0x2]
    cmp r7, r1
    bcc .L_a0
.L_d4:
    ldr r7, _LIT3
    mov r6, #0x0
    ldr r0, [r7, #0xc]
    cmp r0, #0x0
    bls .L_12c
    ldr r5, _LIT4
    mov r9, #0x1
    add r8, sp, #0x0
.L_f4:
    mov r0, r6
    bl func_ov002_0227e76c
    cmp r0, #0x0
    bne .L_118
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_0227e914
    str r9, [r8, r0, lsl #0x2]
.L_118:
    ldr r0, [r7, #0xc]
    add r6, r6, #0x1
    cmp r6, r0
    add r5, r5, #0x4
    bcc .L_f4
.L_12c:
    cmp r4, #0x0
    ldrne r0, [sp, #0x10]
    cmpne r0, #0x0
    beq .L_14c
    ldr r0, _LIT5
    bl func_ov002_0227e784
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_14c:
    ldr r0, [sp, #0x40]
    adds r0, r4, r0
    ldrne r0, [sp, #0x18]
    cmpne r0, #0x0
    beq .L_170
    ldr r0, _LIT6
    bl func_ov002_0227e784
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_170:
    ldr r0, [sp, #0x3c]
    adds r0, r4, r0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_194
    ldr r0, _LIT7
    bl func_ov002_0227e784
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_194:
    ldr r0, [sp, #0x28]
    ldr r1, [sp, #0x38]
    add r2, r4, r0
    add r0, r1, r2
    cmp r0, #0x2
    blt .L_1c8
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_1c8
    ldr r0, _LIT5
    bl func_ov002_0227e784
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1c8:
    ldr r3, [sp, #0x34]
    add r0, r4, r3
    add r1, r1, r0
    cmp r1, #0x2
    blt .L_1f8
    ldr r1, [sp, #0x4]
    cmp r1, #0x0
    beq .L_1f8
    ldr r0, _LIT8
    bl func_ov002_0227e784
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1f8:
    add r1, r3, r2
    cmp r1, #0x2
    blt .L_220
    ldr r1, [sp, #0x14]
    cmp r1, #0x0
    beq .L_220
    ldr r0, _LIT9
    bl func_ov002_0227e784
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_220:
    ldr r1, [sp, #0x2c]
    adds r1, r4, r1
    ldrne r1, [sp, #0x4]
    cmpne r1, #0x0
    beq .L_244
    ldr r0, _LIT8
    bl func_ov002_0227e784
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_244:
    cmp r2, #0x0
    ldrne r1, [sp, #0x8]
    cmpne r1, #0x0
    beq .L_264
    ldr r0, _LIT10
    bl func_ov002_0227e784
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_264:
    ldr r1, [sp, #0x30]
    adds r1, r4, r1
    ldrne r1, [sp, #0x10]
    cmpne r1, #0x0
    beq .L_288
    ldr r0, _LIT5
    bl func_ov002_0227e784
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_288:
    cmp r0, #0x0
    ldrne r0, [sp, #0xc]
    cmpne r0, #0x0
    addeq sp, sp, #0x48
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT11
    bl func_ov002_0227e784
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cdc78
_LIT4: .word data_ov002_022cdc88
_LIT5: .word 0x000018a9
_LIT6: .word 0x0000194d
_LIT7: .word 0x0000194e
_LIT8: .word 0x000018a6
_LIT9: .word 0x000018f9
_LIT10: .word 0x000018a7
_LIT11: .word 0x000018a8
