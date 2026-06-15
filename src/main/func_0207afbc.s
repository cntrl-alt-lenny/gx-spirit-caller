; func_0207afbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a088c
        .extern func_0207afa0
        .extern func_020933bc
        .extern func_02093454
        .global func_0207afbc
        .arm
func_0207afbc:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    bl OS_DisableIrq
    ldr r2, _LIT0
    ldr r1, _LIT1
    ldr r2, [r2]
    mov r4, r0
    add r0, r2, r1
    bl func_020933bc
    ldr r0, _LIT0
    ldr ip, [r0]
    add r0, ip, #0x2000
    ldr r0, [r0, #0x260]
    cmp r0, #0x9
    bne .L_58
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, #0x0
    ldr r3, _LIT3
    add r0, ip, r0
    str r2, [sp]
    bl func_02093454
.L_58:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a088c
_LIT1: .word 0x000022cc
_LIT2: .word 0x022f5341
_LIT3: .word func_0207afa0
