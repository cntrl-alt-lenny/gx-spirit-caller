; func_0206ae2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a9828
        .global func_0206ae2c
        .arm
func_0206ae2c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov sl, r0
    bl func_020a9828
    ldr r1, _LIT0
    mov r8, #0x0
    smull r3, r4, r1, r0
    mov r2, r0, lsr #0x1f
    mov r4, r4, asr #0x4
    ldr r1, _LIT1
    add r4, r2, r4
    smull r2, r3, r1, r4
    sub r4, r0, r2
    add r0, r4, #0x21
    mov r9, #0x1
    strb r0, [sl, #0x74]
    mov r5, r8
    mov r6, r9
    mov fp, r8
    mov r4, r9
.L_50:
    sub r0, r9, #0x1
    add r0, sl, r0
    ldrsb r2, [r0, #0x74]
    ldrsb r3, [sl, #0x74]
    add r7, sl, r9
    cmp r2, r3
    eor r2, r9, r2
    movlt r0, r6
    and r2, r2, #0x1
    movge r0, r5
    cmp r3, #0x4f
    movlt r1, r4
    and r3, r3, #0x1
    eor r2, r8, r2
    movge r1, fp
    eor r2, r3, r2
    eor r1, r2, r1
    eor r8, r1, r0
    bl func_020a9828
    ldr r2, _LIT0
    cmp r8, #0x0
    smull r3, r1, r2, r0
    mov r1, r1, asr #0x4
    mov r2, r0, lsr #0x1f
    add r1, r2, r1
    ldr r2, _LIT1
    smull r1, r3, r2, r1
    sub r1, r0, r1
    add r0, r1, #0x21
    strb r0, [r7, #0x74]
    beq .L_d8
    ldrsb r0, [r7, #0x74]
    ands r0, r0, #0x1
    beq .L_f0
.L_d8:
    cmp r8, #0x0
    bne .L_fc
    ldrsb r0, [r7, #0x74]
    and r0, r0, #0x1
    cmp r0, #0x1
    bne .L_fc
.L_f0:
    ldrsb r0, [r7, #0x74]
    add r0, r0, #0x1
    strb r0, [r7, #0x74]
.L_fc:
    add r9, r9, #0x1
    cmp r9, #0x8
    blt .L_50
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x2c0b02c1
_LIT1: .word 0x0000005d
