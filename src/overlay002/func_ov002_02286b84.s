; func_ov002_02286b84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022ce884
        .extern func_0202b8a8
        .extern func_ov002_021b947c
        .extern func_ov002_021c93f0
        .global func_ov002_02286b84
        .arm
func_ov002_02286b84:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r8, _LIT0
    mov sl, r0
    ldr r0, [r8, #0x5d4]
    mov r6, #0x0
    cmp r0, #0x0
    bls .L_100
    ldr r9, _LIT1
    ldr fp, _LIT2
    ldr r4, _LIT3
    mov r5, r8
.L_2c:
    ldrb r0, [r8, #0x5dc]
    cmp r0, #0x16
    bne .L_e8
    ldr r0, [r9]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x17
    bl func_ov002_021b947c
    cmp r0, #0x1000
    beq .L_e8
    mov r1, r0, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r1, r0, lsr #0x10
    mov r3, r2, asr #0x8
    mov r2, r1, lsl #0x10
    and r0, r0, #0xff
    and r1, r3, #0xff
    mov r2, r2, lsr #0x10
    bl func_ov002_021c93f0
    ldr r2, [r9]
    ldrh r1, [sl, #0x2]
    mov r2, r2, lsl #0x16
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsl #0x1f
    mov r7, r0
    cmp r2, r1, lsr #0x1f
    bne .L_b0
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8a8
    cmp r0, #0x4
    movgt r0, #0x1
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b0:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    cmp r0, r4
    cmpne r0, fp
    bne .L_e8
    ldr r1, [r7]
    ldrh r0, [sl, #0x2]
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e8:
    ldr r0, [r5, #0x5d4]
    add r6, r6, #0x1
    cmp r6, r0
    add r8, r8, #0x1
    add r9, r9, #0x4
    bcc .L_2c
.L_100:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022ce884
_LIT2: .word 0x000011e4
_LIT3: .word 0x00000fd6
