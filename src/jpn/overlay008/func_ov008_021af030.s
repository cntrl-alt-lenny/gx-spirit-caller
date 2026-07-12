; func_ov008_021af030 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2660
        .extern data_ov008_021b2cc4
        .extern func_ov008_021aecd8
        .extern func_ov008_021aed30
        .extern func_ov008_021aeeb0
        .extern func_ov008_021aef84
        .global func_ov008_021af030
        .arm
func_ov008_021af030:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    cmp r1, #0x0
    beq .L_e8
    subs r9, sl, #0x1
    ldmmiia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr fp, _LIT0
    ldr r4, _LIT1
    mov r5, #0x1
.L_24:
    ldrh r0, [r4]
    ldr r1, _LIT2
    rsb sl, r9, #0x3
    smull r3, r6, r1, r0
    mov r2, r0, lsr #0x1f
    add r6, r2, r6, asr #0x1
    mov r1, #0x5
    smull r2, r3, r1, r6
    sub r6, r0, r2
    add r8, r6, sl
    cmp r8, #0x5
    ldrh r1, [r4, #0xa8]
    add r0, r0, sl
    subge r8, r8, #0x5
    cmp r0, r1
    bge .L_dc
    bl func_ov008_021aecd8
    mov r1, r8
    bl func_ov008_021aeeb0
    ldrh r0, [r4]
    add r0, r0, sl
    bl func_ov008_021aed30
    ldrh r1, [r4]
    mov r7, r0
    add r0, r1, sl
    bl func_ov008_021aecd8
    mov r6, r0
    ldrh r0, [r4]
    add r0, r0, sl
    bl func_ov008_021aed30
    mov r1, #0x34
    mov r3, r7, lsr #0x1f
    rsb r2, r3, r7, lsl #0x1b
    add r2, r3, r2, ror #0x1b
    mov r3, r0, asr #0x4
    add r0, r0, r3, lsr #0x1b
    mla r1, r6, r1, fp
    mov r0, r0, asr #0x5
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0x3c]
    tst r0, r5, lsl r2
    beq .L_dc
    ldrh r0, [r4]
    mov r1, r8
    add r0, r0, sl
    bl func_ov008_021aef84
.L_dc:
    subs r9, r9, #0x1
    bpl .L_24
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e8:
    mov r8, #0x0
    cmp sl, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr fp, _LIT0
    ldr r4, _LIT1
    mov r5, #0x1
.L_100:
    ldrh r0, [r4]
    ldr r1, _LIT2
    smull r3, r6, r1, r0
    mov r2, r0, lsr #0x1f
    add r6, r2, r6, asr #0x1
    mov r1, #0x5
    smull r2, r3, r1, r6
    sub r6, r0, r2
    sub r1, r6, #0x1
    adds r9, r1, r8
    addmi r9, r9, #0x5
    cmp r9, #0x5
    sub r0, r0, #0x1
    subge r9, r9, #0x5
    adds r0, r0, r8
    bmi .L_1c8
    bl func_ov008_021aecd8
    mov r1, r9
    bl func_ov008_021aeeb0
    ldrh r0, [r4]
    sub r0, r0, #0x1
    add r0, r0, r8
    bl func_ov008_021aed30
    ldrh r1, [r4]
    mov r7, r0
    sub r0, r1, #0x1
    add r0, r0, r8
    bl func_ov008_021aecd8
    mov r6, r0
    ldrh r0, [r4]
    sub r0, r0, #0x1
    add r0, r0, r8
    bl func_ov008_021aed30
    mov r1, #0x34
    mov r3, r7, lsr #0x1f
    rsb r2, r3, r7, lsl #0x1b
    add r2, r3, r2, ror #0x1b
    mov r3, r0, asr #0x4
    add r0, r0, r3, lsr #0x1b
    mla r1, r6, r1, fp
    mov r0, r0, asr #0x5
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0x3c]
    tst r0, r5, lsl r2
    beq .L_1c8
    ldrh r0, [r4]
    mov r1, r9
    sub r0, r0, #0x1
    add r0, r0, r8
    bl func_ov008_021aef84
.L_1c8:
    add r8, r8, #0x1
    cmp r8, sl
    blt .L_100
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov008_021b2660
_LIT1: .word data_ov008_021b2cc4
_LIT2: .word 0x66666667
