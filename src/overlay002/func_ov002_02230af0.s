; func_ov002_02230af0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021d5a08
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_02257704
        .extern func_ov002_0226b11c
        .global func_ov002_02230af0
        .arm
func_ov002_02230af0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r6, _LIT0
    ldr r1, [r6, #0x5a8]
    cmp r1, #0x7f
    beq .L_58
    cmp r1, #0x80
    bne .L_114
    bl func_ov002_02257704
    mov r1, r6
    cmp r0, #0x0
    str r0, [r1, #0x5ac]
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_ov002_021e2b3c
    mov r0, r6
    mov r1, #0x0
    str r1, [r0, #0x5b0]
    add sp, sp, #0x8
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_58:
    ldr r2, [r6, #0x5b0]
    cmp r2, #0xa
    bge .L_104
    ldr lr, _LIT1
    mov r1, #0x1
    mov ip, #0x5
.L_70:
    mov r4, r2, lsr #0x1f
    smull r3, r5, lr, r2
    add r5, r4, r5, asr #0x1
    smull r5, r3, ip, r5
    ldrh r8, [r0, #0x2]
    smull r3, r7, lr, r2
    mov r3, r8, lsl #0x1f
    add r7, r4, r7, asr #0x1
    eor r4, r7, r3, lsr #0x1f
    sub r5, r2, r5
    ldr r3, [r6, #0x5ac]
    add r2, r5, r4, lsl #0x4
    tst r3, r1, lsl r2
    beq .L_f0
    mov r1, #0x5
    str r1, [sp]
    mov r1, #0x0
    str r1, [sp, #0x4]
    ldrh r3, [r0]
    mov r1, r4
    mov r2, r5
    bl func_ov002_021d5a08
    mov r0, r4
    mov r1, r5
    bl func_ov002_0226b11c
    ldr r1, _LIT0
    add sp, sp, #0x8
    ldr r2, [r1, #0x5b0]
    mov r0, #0x7f
    add r2, r2, #0x1
    str r2, [r1, #0x5b0]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_f0:
    ldr r2, [r6, #0x5b0]
    add r2, r2, #0x1
    str r2, [r6, #0x5b0]
    cmp r2, #0xa
    blt .L_70
.L_104:
    bl func_ov002_021e2c5c
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_114:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x66666667
