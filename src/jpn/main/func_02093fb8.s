; func_02093fb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_01ff8664
        .global func_02093fb8
        .arm
func_02093fb8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r4, r3
    mov r8, r0
    mov r7, r1
    mov r6, r2
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    mov r0, #0x3
    mul r1, r8, r0
    ldr r0, _LIT0
    add r1, r1, #0x2
    add r5, r0, r1, lsl #0x2
.L_30:
    ldr r0, [r5]
    ands r0, r0, #-2147483648
    bne .L_30
    bl OS_DisableIrq
    ldr r1, _LIT1
    mov r2, r8, lsl #0x2
    mov r3, r4, lsr #0x2
    mov r4, r0
    add ip, r2, #0x4000000
    mov r0, r8
    mov r2, r7
    add r1, r1, r8, lsl #0x2
    orr r3, r3, #-2063597568
    str r6, [ip, #0xe0]
    bl func_01ff8664
    mov r0, r4
    bl OS_RestoreIrq
.L_74:
    ldr r0, [r5]
    ands r0, r0, #-2147483648
    bne .L_74
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word 0x040000b0
_LIT1: .word 0x040000e0
