; func_02091680 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a62e8
        .extern func_02091660
        .extern func_020919a4
        .extern func_0209336c
        .extern func_02093524
        .global func_02091680
        .arm
func_02091680:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x34
    mov r4, r0
    add r0, sp, #0x8
    bl func_02093524
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0]
    str r0, [sp, #0x4]
    bl OS_DisableIrq
    ldr r1, _LIT1
    mov r2, #0x0
    umull r5, r3, r4, r1
    mla r3, r4, r2, r3
    mla r3, r2, r1, r3
    mov r1, r5, lsr #0x6
    mov r4, r0
    ldr r5, [sp, #0x4]
    add r0, sp, #0x8
    add r2, sp, #0x4
    str r0, [r5, #0xb0]
    str r2, [sp]
    mov r2, r3, lsr #0x6
    orr r1, r1, r3, lsl #0x1a
    ldr r3, _LIT2
    bl func_0209336c
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_8c
    mov r5, #0x0
.L_78:
    mov r0, r5
    bl func_020919a4
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_78
.L_8c:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a62e8
_LIT1: .word 0x000082ea
_LIT2: .word func_02091660
