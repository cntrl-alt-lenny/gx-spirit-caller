; func_0203acf4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3104
        .extern data_0219cf88
        .extern data_0219d2a8
        .extern func_020385a8
        .extern func_02088144
        .extern func_02088180
        .global func_0203acf4
        .arm
func_0203acf4:
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
.L_34:
    ldrh r0, [r9, #0xb0]
    tst r0, #0x8000
    beq .L_180
    tst r0, #0x1
    bne .L_180
    tst r0, #0x2000
    bne .L_180
    tst r0, #0x4000
    beq .L_180
    mov sl, r7
    add r0, r9, #0x88
    bl func_020385a8
    cmp r0, #0x0
    beq .L_90
    ldrh r1, [r9, #0xb0]
    tst r1, #0x1000
    beq .L_8c
    ldr r0, [r9, #0x88]
    cmp r0, #0x0
    orreq r0, r1, r5
    streqh r0, [r9, #0xb0]
    beq .L_180
.L_8c:
    mov sl, fp
.L_90:
    add r0, r9, #0x94
    bl func_020385a8
    cmp r0, #0x0
    movne sl, #0x1
    cmp sl, #0x0
    beq .L_fc
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
    bl func_02088180
.L_fc:
    add r0, r9, #0xa0
    bl func_020385a8
    cmp r0, #0x0
    beq .L_180
    ldr r0, [r9, #0x74]
    ldr r1, [r9, #0xa0]
    ldrb r0, [r0, #0x1a]
    mov sl, r1, asr #0x8
    mov r1, #0x0
    cmp r0, #0x2
    bne .L_174
    cmp sl, #0x40
    blt .L_154
    sub r0, sl, #0x40
    mov r2, r0, lsl #0x1
    add r0, r9, #0x4
    bl func_02088144
    add r0, r9, #0x4
    mov r1, #0x1
    mov r2, #0x7f
    bl func_02088144
    b .L_180
.L_154:
    add r0, r9, #0x4
    mov r2, r1
    bl func_02088144
    mov r2, sl, lsl #0x1
    add r0, r9, #0x4
    mov r1, #0x1
    bl func_02088144
    b .L_180
.L_174:
    mov r2, sl
    add r0, r9, #0x4
    bl func_02088144
.L_180:
    add r8, r8, #0x1
    cmp r8, #0x8
    add r9, r9, #0xc4
    blt .L_34
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219cf88
_LIT1: .word data_0219d2a8
_LIT2: .word data_020c3104
_LIT3: .word 0x000040a0
_LIT4: .word 0x00000801
