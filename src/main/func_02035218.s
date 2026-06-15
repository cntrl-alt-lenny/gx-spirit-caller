; func_02035218 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Div
        .extern Sqrt
        .extern data_020bef80
        .extern data_0219b3b4
        .extern func_02037dc0
        .extern func_02037fe4
        .extern func_0208c66c
        .global func_02035218
        .arm
func_02035218:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r5, [sl, #0x58]
    add r1, sl, #0x4c
    ldr r8, _LIT0
    tst r5, #0x8
    ldrne r1, [r1]
    ands r9, r5, #0x40
    orreq r0, r5, #0x40
    streqh r0, [sl, #0x58]
    tst r5, #0x4
    ldmia r1, {r2, r3}
    ldmeqia r8, {r0, r1}
    subeq r2, r2, r0
    subeq r3, r3, r1
    rsb r0, r2, #0x0
    cmp r2, #0x0
    movlt r2, r0
    mov fp, r0, lsl #0xc
    rsb r0, r3, #0x0
    cmp r3, #0x0
    movlt r3, r0
    mov r7, r0, lsl #0xc
    mul r0, r3, r3
    mla r0, r2, r2, r0
    bl Sqrt
    mov r4, r0
    tst r5, #0x1
    bne .L_e4
    cmp r9, #0x0
    beq .L_84
    tst r5, #0x10
    beq .L_e4
.L_84:
    ldrb r2, [r8, #0x1a]
    ldrh r1, [r8, #0x12]
    mov r6, r2
    cmp r4, r1
    bcs .L_c8
    ldrh r0, [r8, #0x10]
    mov r6, #0x7f
    cmp r4, r0
    bls .L_c8
    sub r1, r1, r0
    cmp r1, #0x0
    ble .L_c8
    rsb r2, r2, #0x7f
    sub r0, r4, r0
    mul r0, r2, r0
    bl Div
    sub r6, r6, r0
.L_c8:
    ldrsb r0, [sl, #0x26]
    cmp r0, r6
    beq .L_e4
    mov r0, sl
    mov r1, r6
    mov r2, #0x0
    bl func_02037dc0
.L_e4:
    tst r5, #0x2
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r9, #0x0
    beq .L_fc
    tst r5, #0x20
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fc:
    cmp r4, #0x1
    mov r5, #0x40
    bls .L_18c
    ldrh r0, [r8, #0x10]
    cmp r4, r0
    bcc .L_18c
    mov r0, r7
    mov r1, fp
    bl func_0208c66c
    mov r5, r0
    cmp r5, #0x8000
    rsbge r5, r5, #0x10000
    mov r5, r5, asr #0x8
    cmp r5, #0x7f
    ldrh r2, [r8, #0x12]
    movgt r5, #0x7f
    ldrb r6, [r8, #0x1a]
    cmp r4, r2
    bcs .L_16c
    ldrh r1, [r8, #0x10]
    rsb r0, r6, #0x80
    mov r0, r0, lsl #0x8
    sub r1, r2, r1
    bl Div
    ldrh r1, [r8, #0x12]
    sub r1, r1, r4
    mul r1, r0, r1
    add r6, r6, r1, lsr #0x8
.L_16c:
    mov r0, r6, lsl #0xe
    mov r1, r0, asr #0xb
    ldr r0, _LIT1
    mov r1, r1, lsl #0x2
    ldrsh r0, [r0, r1]
    rsb r1, r5, #0x40
    mul r0, r1, r0
    add r5, r5, r0, asr #0xc
.L_18c:
    ldrsb r0, [sl, #0x24]
    cmp r0, r5
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, sl
    mov r1, r5
    mov r2, #0x0
    bl func_02037fe4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219b3b4
_LIT1: .word data_020bef80
