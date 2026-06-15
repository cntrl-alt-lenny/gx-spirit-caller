; func_0203ad44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c31f8
        .extern data_0219d068
        .extern data_0219d388
        .extern func_020385f8
        .extern func_0208822c
        .extern func_02088268
        .global func_0203ad44
        .arm
func_0203ad44:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r0, _LIT0
    mov r8, #0x0
    ldr r1, [r0]
    ldr r9, _LIT1
    cmp r1, #0x0
    movne r1, #0x0
    ldr r6, _LIT2
    ldr r4, _LIT3
    ldr r5, _LIT4
    strne r1, [r0]
    mov fp, #0x1
    mov r7, r8
.L_1dc:
    ldrh r0, [r9, #0xb0]
    tst r0, #0x8000
    beq .L_328
    tst r0, #0x1
    bne .L_328
    tst r0, #0x2000
    bne .L_328
    tst r0, #0x4000
    beq .L_328
    mov sl, r7
    add r0, r9, #0x88
    bl func_020385f8
    cmp r0, #0x0
    beq .L_238
    ldrh r1, [r9, #0xb0]
    tst r1, #0x1000
    beq .L_234
    ldr r0, [r9, #0x88]
    cmp r0, #0x0
    orreq r0, r1, r5
    streqh r0, [r9, #0xb0]
    beq .L_328
.L_234:
    mov sl, fp
.L_238:
    add r0, r9, #0x94
    bl func_020385f8
    cmp r0, #0x0
    movne sl, #0x1
    cmp sl, #0x0
    beq .L_2a4
    ldrb r2, [r9, #0xbd]
    ldr r1, [r9, #0x94]
    ldr r0, [r9, #0x88]
    mul r3, r2, r4
    mov r1, r1, asr #0x8
    mul r2, r1, r4
    mov r3, r3, asr #0xe
    mov r1, r2, asr #0xe
    mul r1, r3, r1
    mov r0, r0, asr #0x8
    mov r2, r1, asr #0x7
    mul r1, r0, r4
    mov r0, r1, asr #0xe
    mul r0, r2, r0
    mov r0, r0, asr #0x7
    cmp r0, #0x7f
    movgt r0, #0x7f
    mov r0, r0, lsl #0x1
    ldrsh r1, [r6, r0]
    add r0, r9, #0x4
    bl func_02088268
.L_2a4:
    add r0, r9, #0xa0
    bl func_020385f8
    cmp r0, #0x0
    beq .L_328
    ldr r0, [r9, #0x74]
    ldr r1, [r9, #0xa0]
    ldrb r0, [r0, #0x1a]
    mov sl, r1, asr #0x8
    mov r1, #0x0
    cmp r0, #0x2
    bne .L_31c
    cmp sl, #0x40
    blt .L_2fc
    sub r0, sl, #0x40
    mov r2, r0, lsl #0x1
    add r0, r9, #0x4
    bl func_0208822c
    add r0, r9, #0x4
    mov r1, #0x1
    mov r2, #0x7f
    bl func_0208822c
    b .L_328
.L_2fc:
    add r0, r9, #0x4
    mov r2, r1
    bl func_0208822c
    mov r2, sl, lsl #0x1
    add r0, r9, #0x4
    mov r1, #0x1
    bl func_0208822c
    b .L_328
.L_31c:
    mov r2, sl
    add r0, r9, #0x4
    bl func_0208822c
.L_328:
    add r8, r8, #0x1
    cmp r8, #0x8
    add r9, r9, #0xc4
    blt .L_1dc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219d068
_LIT1: .word data_0219d388
_LIT2: .word data_020c31f8
_LIT3: .word 0x000040a0
_LIT4: .word 0x00000801
