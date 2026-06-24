; func_020756f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219ee5c
        .extern data_021a0620
        .extern data_021a0628
        .extern data_021a063b
        .extern func_02075684
        .extern func_02078374
        .extern func_02078424
        .extern func_020784e4
        .global func_020756f8
        .arm
func_020756f8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x7c
    ldr r2, _LIT0
    mov sl, r0
    ldrb r0, [r2]
    mov r9, r1
    cmp r0, #0x0
    bne .L_68
    ldr r2, _LIT1
    add r0, sp, #0x4
    ldr r4, [r2, #0x8]
    ldr r3, [r2]
    ldr r1, [r2, #0x4]
    umull r6, r5, r4, r3
    mla r5, r4, r1, r5
    ldr r1, [r2, #0xc]
    ldr r4, [r2, #0x10]
    mla r5, r1, r3, r5
    adds r4, r4, r6
    ldr r3, [r2, #0x14]
    mov r1, #0x4
    adc r3, r3, r5
    str r4, [r2]
    str r3, [r2, #0x4]
    str r3, [sp, #0x4]
    bl func_02075684
.L_68:
    cmp r9, #0x0
    mov r7, #0x0
    addle sp, sp, #0x7c
    mov r1, #0x14
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxle lr
    add r6, sp, #0x1c
    mov fp, r1
    str r7, [sp]
    mov r5, #0x1
    mov r4, #0x13
.L_94:
    cmp r1, #0x14
    bne .L_10c
    mov r0, r6
    bl func_020784e4
    bl OS_DisableIrq
    mov r8, r0
    ldr r1, _LIT2
    mov r0, r6
    mov r2, fp
    bl func_02078424
    mov r0, r6
    add r1, sp, #0x8
    bl func_02078374
    ldr r2, _LIT3
    mov ip, r5
    mov lr, r4
    add r3, sp, #0x1b
.L_d8:
    ldrb r1, [r2]
    ldrb r0, [r3], #-1
    subs lr, lr, #0x1
    add r0, r1, r0
    add r0, ip, r0
    strb r0, [r2]
    mov ip, r0, lsr #0x8
    sub r2, r2, #0x1
    bpl .L_d8
    str r0, [sp, #0x4]
    mov r0, r8
    bl OS_RestoreIrq
    ldr r1, [sp]
.L_10c:
    add r0, sp, #0x8
    ldrb r0, [r0, r1]
    add r1, r1, #0x1
    cmp r0, #0x0
    strneb r0, [sl, r7]
    addne r7, r7, #0x1
    cmp r7, r9
    blt .L_94
    add sp, sp, #0x7c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_021a0620
_LIT1: .word data_0219ee5c
_LIT2: .word data_021a0628
_LIT3: .word data_021a063b
