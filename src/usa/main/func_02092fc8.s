; func_02092fc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a65e8
        .global func_02092fc8
        .arm
func_02092fc8:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    bl OS_DisableIrq
    ldr r1, _LIT0
    ldr r3, _LIT1
    ldrh ip, [r1]
    ldr r2, _LIT2
    mvn r1, #0x0
    strh ip, [sp]
    ldr ip, [r3]
    ldr r3, [r3, #0x4]
    and r1, ip, r1
    and r2, r3, r2
    str r1, [sp, #0x4]
    ldr r1, _LIT3
    str r2, [sp, #0x8]
    ldr r1, [r1]
    ands r1, r1, #0x8
    beq .L_74
    ldrh r1, [sp]
    ands r1, r1, #0x8000
    bne .L_74
    ldr r3, [sp, #0x4]
    mov r1, #0x1
    ldr r2, [sp, #0x8]
    adds r3, r3, r1
    adc r1, r2, #0x0
    str r3, [sp, #0x4]
    str r1, [sp, #0x8]
.L_74:
    bl OS_RestoreIrq
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    ldrh r0, [sp]
    mov r1, r1, lsl #0x10
    orr r1, r1, r2, lsr #0x10
    orr r1, r1, r0, asr #0x1f
    orr r0, r0, r2, lsl #0x10
    add sp, sp, #0xc
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word 0x04000100
_LIT1: .word data_021a65e8
_LIT2: .word 0x0000ffff
_LIT3: .word 0x04000214
