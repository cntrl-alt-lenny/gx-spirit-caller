; func_ov008_021af214 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2660
        .extern data_ov008_021b2cc4
        .extern func_ov008_021aecd8
        .extern func_ov008_021aed30
        .extern func_ov008_021aeeb0
        .extern func_ov008_021aef84
        .global func_ov008_021af214
        .arm
func_ov008_021af214:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r0, _LIT0
    ldrh r2, [r0]
    cmp r2, #0x0
    bne .L_280
    ldr r5, _LIT1
    mov r9, #0x0
    mov r6, #0x1
    mov r4, #0x34
.L_208:
    mov r0, r9
    bl func_ov008_021aecd8
    mov r1, r9
    bl func_ov008_021aeeb0
    mov r0, r9
    bl func_ov008_021aed30
    mov r8, r0
    mov r0, r9
    bl func_ov008_021aecd8
    mov r7, r0
    mov r0, r9
    bl func_ov008_021aed30
    mov r1, r0, asr #0x4
    add r2, r0, r1, lsr #0x1b
    mov r1, r8, lsr #0x1f
    rsb r0, r1, r8, lsl #0x1b
    mla r3, r7, r4, r5
    mov r2, r2, asr #0x5
    add r2, r3, r2, lsl #0x2
    ldr r2, [r2, #0x3c]
    add r0, r1, r0, ror #0x1b
    tst r2, r6, lsl r0
    beq .L_270
    mov r0, r9
    mov r1, r9
    bl func_ov008_021aef84
.L_270:
    add r9, r9, #0x1
    cmp r9, #0x4
    blt .L_208
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_280:
    ldrh r1, [r0, #0xa8]
    sub r0, r2, #0x1
    mov r0, r0, lsl #0x10
    sub r1, r1, r0, lsr #0x10
    cmp r1, #0x5
    movgt r1, #0x5
    mov r7, r0, lsr #0x10
    mov r0, r1, lsl #0x10
    mov r8, r0, lsr #0x10
    mov sl, #0x0
    cmp r8, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr fp, _LIT1
    mov r4, #0x1
.L_2b8:
    ldr r0, _LIT2
    mov r1, r7, lsr #0x1f
    smull r2, r3, r0, r7
    add r3, r1, r3, asr #0x1
    mov r0, #0x5
    smull r1, r2, r0, r3
    sub r3, r7, r1
    mov r1, r3, lsl #0x10
    mov r0, r7
    mov r9, r1, lsr #0x10
    bl func_ov008_021aecd8
    mov r1, r9
    bl func_ov008_021aeeb0
    mov r0, r7
    bl func_ov008_021aed30
    mov r6, r0
    mov r0, r7
    bl func_ov008_021aecd8
    mov r5, r0
    mov r0, r7
    bl func_ov008_021aed30
    mov r1, #0x34
    mov r3, r6, lsr #0x1f
    rsb r2, r3, r6, lsl #0x1b
    add r2, r3, r2, ror #0x1b
    mov r3, r0, asr #0x4
    add r0, r0, r3, lsr #0x1b
    mla r1, r5, r1, fp
    mov r0, r0, asr #0x5
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0x3c]
    tst r0, r4, lsl r2
    beq .L_348
    mov r0, r7
    mov r1, r9
    bl func_ov008_021aef84
.L_348:
    add r0, r7, #0x1
    mov r0, r0, lsl #0x10
    add sl, sl, #0x1
    cmp sl, r8
    mov r7, r0, lsr #0x10
    blt .L_2b8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov008_021b2cc4
_LIT1: .word data_ov008_021b2660
_LIT2: .word 0x66666667
