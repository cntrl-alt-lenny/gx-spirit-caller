; func_ov002_0227343c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022c84f4
        .extern data_ov002_022cd220
        .extern data_ov002_022cd22a
        .extern data_ov002_022cd238
        .extern data_ov002_022cd664
        .extern data_ov002_022d008c
        .extern func_0202b0ac
        .extern func_ov002_021ae320
        .extern func_ov002_021b939c
        .extern func_ov002_021d7974
        .extern func_ov002_021dea94
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_02270edc
        .extern func_ov002_022903f0
        .extern func_ov002_0229acd0
        .extern func_ov002_0229cd4c
        .global func_ov002_0227343c
        .arm
func_ov002_0227343c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x100
    ldr r6, _LIT0
    ldr r0, [r6, #0x18]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_288
    b .L_34
    b .L_d4
    b .L_1b4
    b .L_274
.L_34:
    ldr r2, [r6]
    ldr r1, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_64
    mov r1, r2, lsl #0x9
    ldr r2, _LIT2
    mov r1, r1, lsr #0x11
    bl func_ov002_022903f0
    b .L_a4
.L_64:
    ldrb r1, [r6, #0x8]
    ldr r0, _LIT3
    ldr r0, [r0, r1, lsl #0x2]
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0xd3
    bl func_ov002_0229cd4c
    mov r0, r6
    ldr r0, [r0]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldr r0, _LIT2
    bl func_ov002_02259204
.L_a4:
    ldr r3, _LIT4
    add sp, sp, #0x100
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_d4:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_184
    mov r0, r6
    ldrb r1, [r0, #0x8]
    ldr r2, _LIT5
    ldr r0, _LIT6
    ldr r3, [r2, #0xd60]
    mov r1, r1, lsl #0x1
    strh r3, [r0, r1]
    ldr r1, [r2, #0xd70]
    ldr r2, [r2, #0xd74]
    mov r0, #0x28
    bl func_ov002_0229acd0
    mov r0, r6
    ldrb r1, [r0, #0x8]
    add r2, r1, #0x1
    and r1, r2, #0xff
    strb r2, [r0, #0x8]
    cmp r1, #0x3
    mov r0, #0x0
    bcs .L_158
    ldr r3, _LIT4
    add sp, sp, #0x100
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    sub r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_158:
    ldr r3, _LIT4
    add sp, sp, #0x100
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_184:
    ldr r3, _LIT4
    add sp, sp, #0x100
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    sub r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1b4:
    ldrb r0, [r6, #0x8]
    mov r8, #0x0
    mov r7, r8
    cmp r0, #0x0
    ble .L_22c
    mov r4, r8
    mov r5, #0x1
.L_1d0:
    add r0, r6, r7, lsl #0x1
    ldrh r0, [r0, #0xa]
    bl func_ov002_021b939c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0xa
    bhi .L_204
    and r0, r0, #0xff
    add r0, r1, r0, lsl #0x4
    orr r8, r8, r5, lsl r0
    b .L_21c
.L_204:
    mov r1, r0, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r2, r4
    and r0, r0, #0xff
    mov r1, r1, lsr #0x10
    bl func_ov002_021d7974
.L_21c:
    ldrb r0, [r6, #0x8]
    add r7, r7, #0x1
    cmp r7, r0
    blt .L_1d0
.L_22c:
    ldr r0, _LIT0
    mov r1, r8
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021dea94
    ldr r3, _LIT4
    add sp, sp, #0x100
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_274:
    mov r0, #0x0
    strb r0, [r6, #0x8]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_288:
    mov r0, #0x0
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word data_ov002_022cd664
_LIT2: .word func_ov002_02270edc
_LIT3: .word data_ov002_022c84f4
_LIT4: .word data_ov002_022cd238
_LIT5: .word data_ov002_022d008c
_LIT6: .word data_ov002_022cd22a
