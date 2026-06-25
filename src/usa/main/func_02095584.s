; func_02095584 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a6674
        .extern data_021a6678
        .extern data_021a6684
        .extern data_021a6688
        .extern data_021a668c
        .extern data_021a6690
        .extern data_021a6940
        .extern func_0209281c
        .extern func_02093720
        .extern func_020952f0
        .extern func_02095828
        .extern func_02096264
        .global func_02095584
        .arm
func_02095584:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    cmp r1, #0x0
    bne .L_38
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_38:
    ldr r1, _LIT1
    ldr r1, [r1]
    cmp r1, #0x8
    blt .L_7c
    ands r1, r5, #0x1
    bne .L_64
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_64:
    mov r0, #0x1
    bl func_02095828
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x8
    bge .L_64
.L_7c:
    ldr r0, _LIT2
    mov r1, #0x1800
    bl func_0209281c
    ldr r1, _LIT0
    mov r0, #0x7
    ldr r1, [r1]
    mov r2, #0x0
    bl func_02096264
    cmp r0, #0x0
    bge .L_120
    ands r0, r5, #0x1
    bne .L_c4
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_c4:
    ldr r1, _LIT0
    mov r0, #0x7
    ldr r1, [r1]
    mov r2, #0x0
    bl func_02096264
    cmp r0, #0x0
    bge .L_120
    ldr r6, _LIT0
    mov r9, #0x64
    mov r8, #0x7
    mov r7, #0x0
.L_f0:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, r9
    bl func_02093720
    bl OS_DisableIrq
    mov r4, r0
    mov r0, r8
    ldr r1, [r6]
    mov r2, r7
    bl func_02096264
    cmp r0, #0x0
    blt .L_f0
.L_120:
    ands r0, r5, #0x2
    beq .L_12c
    bl func_020952f0
.L_12c:
    ldr r0, _LIT3
    ldr r1, _LIT0
    ldr r3, [r0]
    ldr r5, [r1]
    add r1, r3, #0x1
    ldr r2, _LIT4
    str r1, [r0]
    str r5, [r2, r3, lsl #0x2]
    cmp r1, #0x8
    movgt r1, #0x0
    ldr r2, _LIT1
    strgt r1, [r0]
    ldr r1, _LIT5
    ldr r3, [r2]
    ldr r0, [r1]
    add ip, r3, #0x1
    add r6, r0, #0x1
    ldr r5, _LIT0
    mov lr, #0x0
    ldr r3, _LIT6
    mov r0, r4
    str lr, [r5]
    str lr, [r3]
    str ip, [r2]
    str r6, [r1]
    bl OS_RestoreIrq
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
_LIT0: .word data_021a6674
_LIT1: .word data_021a6688
_LIT2: .word data_021a6940
_LIT3: .word data_021a6684
_LIT4: .word data_021a6690
_LIT5: .word data_021a668c
_LIT6: .word data_021a6678
