; func_ov013_021ca1d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov013_021cba3c
        .extern data_ov013_021cbb5c
        .extern data_ov013_021cbce0
        .extern func_0201aaec
        .extern func_0202c06c
        .extern func_020a68dc
        .extern func_ov000_021ae288
        .global func_ov013_021ca1d8
        .arm
func_ov013_021ca1d8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    str r0, [sp]
    ldr fp, _LIT0
    ldr r5, _LIT1
    bl func_0201aaec
    mov r7, #0x0
    ldr r1, [sp]
    mov r8, r7
    add r9, r1, r1, lsl #0x1
    mov sl, r9
    strb r7, [fp]
    mov r6, r0, asr r9
    mvn r4, #0x0
    b .L_a4
.L_3c:
    tst r6, #0x1
    beq .L_98
    cmp r7, #0x3
    bne .L_64
    bics r0, r6, #0x1
    beq .L_64
    add r1, r5, r7
    ldr r0, _LIT2
    strb r4, [r1, #0x16c]
    b .L_78
.L_64:
    add r0, r8, #0x30c
    add r1, r0, #0x400
    add r0, r5, r7
    strb r9, [r0, #0x16c]
    add r0, r1, sl
.L_78:
    bl func_0202c06c
    mov r1, r0
    mov r0, fp
    bl func_020a68dc
    ldr r1, _LIT3
    mov r0, fp
    bl func_020a68dc
    add r7, r7, #0x1
.L_98:
    mov r6, r6, asr #0x1
    add r9, r9, #0x1
    add r8, r8, #0x1
.L_a4:
    cmp r6, #0x0
    beq .L_b4
    cmp r7, #0x4
    blt .L_3c
.L_b4:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_f8
    cmp r7, #0x4
    bge .L_f8
    ldr r0, _LIT2
    bl func_0202c06c
    mov r1, r0
    mov r0, fp
    bl func_020a68dc
    ldr r1, _LIT3
    mov r0, fp
    bl func_020a68dc
    add r0, r5, r7
    mvn r1, #0x0
    strb r1, [r0, #0x16c]
    add r7, r7, #0x1
.L_f8:
    cmp r7, #0x2
    beq .L_118
    cmp r7, #0x3
    beq .L_124
    cmp r7, #0x4
    moveq r0, #0x2
    streq r0, [sp, #0x4]
    b .L_12c
.L_118:
    mov r0, #0x0
    str r0, [sp, #0x4]
    b .L_12c
.L_124:
    mov r0, #0x1
    str r0, [sp, #0x4]
.L_12c:
    ldr r0, _LIT4
    bl func_0202c06c
    .word 0xebff9e90
    mov r4, r0
    mov r0, fp
    .word 0xebff9e8d
    mov r2, r0
    ldr r0, [sp, #0x4]
    mov r1, r4
    mov r3, #0x1
    bl func_ov000_021ae288
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov013_021cbce0
_LIT1: .word data_ov013_021cbb5c
_LIT2: .word 0x0000070b
_LIT3: .word data_ov013_021cba3c
_LIT4: .word 0x0000070a
