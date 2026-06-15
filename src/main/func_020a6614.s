; func_020a6614 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a9b08
        .extern data_021a9b0c
        .extern data_021a9f30
        .extern func_020919d8
        .extern func_02091d24
        .extern func_020a6514
        .extern func_020a6600
        .global func_020a6614
        .arm
func_020a6614:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1]
    cmp r0, #0x0
    bne .L_6c
    add r0, r5, #0xc4
    str r5, [r1]
    bl func_020a6600
    ldr r0, _LIT1
    bl func_020a6600
    mov r0, #0x0
    str r0, [r5, #0xc0]
    mov r2, #0x400
    ldr r1, _LIT2
    ldr r3, _LIT3
    mov r0, r5
    str r2, [sp]
    mov r2, #0x14
    str r2, [sp, #0x4]
    mov r2, r5
    bl func_02091d24
    mov r0, r5
    bl func_020919d8
.L_6c:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a9b08
_LIT1: .word data_021a9b0c
_LIT2: .word func_020a6514
_LIT3: .word data_021a9f30
