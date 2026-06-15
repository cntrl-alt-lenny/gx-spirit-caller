; func_0208e700 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208e4ec
        .extern func_0208e518
        .global func_0208e700
        .arm
func_0208e700:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    ldr r0, [r1]
    orr r0, r0, #0x8000
    str r0, [r1]
    add r4, sp, #0x0
.L_70:
    mov r0, r4
    bl func_0208e518
    cmp r0, #0x0
    bne .L_70
    add r4, sp, #0x4
.L_84:
    mov r0, r4
    bl func_0208e4ec
    cmp r0, #0x0
    bne .L_84
    ldr r2, _LIT1
    mov r1, #0x3
    str r1, [r2]
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0]
    str r1, [r2]
    ldr r1, [sp, #0x4]
    cmp r1, #0x0
    ldrne r0, _LIT3
    strne r1, [r0]
    ldr r0, _LIT1
    mov r1, #0x2
    str r1, [r0]
    ldr r2, [sp]
    ldr r1, _LIT3
    ldr r0, _LIT2
    str r2, [r1]
    mov r1, #0x0
    str r1, [r0]
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x04000600
_LIT1: .word 0x04000440
_LIT2: .word 0x04000454
_LIT3: .word 0x04000448
