; func_0207b038 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a088c
        .extern func_0207afa0
        .extern func_020933bc
        .extern func_02093454
        .global func_0207b038
        .arm
func_0207b038:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    add r0, r1, #0x2000
    ldr r0, [r0, #0x260]
    cmp r0, #0x9
    bne .L_bc
    cmp r5, #0x9
    beq .L_bc
    ldr r0, _LIT1
    add r0, r1, r0
    bl func_020933bc
.L_bc:
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x2000
    ldr r1, [r0, #0x260]
    cmp r1, #0xb
    strne r5, [r0, #0x260]
    cmp r5, #0x9
    bne .L_100
    mov r2, #0x0
    ldr r0, _LIT0
    str r2, [sp]
    ldr r5, [r0]
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r3, _LIT3
    add r0, r5, r0
    bl func_02093454
.L_100:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a088c
_LIT1: .word 0x000022cc
_LIT2: .word 0x022f5341
_LIT3: .word func_0207afa0
