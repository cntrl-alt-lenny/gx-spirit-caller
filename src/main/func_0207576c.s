; func_0207576c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a0700
        .extern data_021a0708
        .extern func_02078498
        .extern func_0207850c
        .extern func_020785cc
        .global func_0207576c
        .arm
func_0207576c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x60
    mov r6, r0
    add r0, sp, #0x0
    mov r5, r1
    bl func_020785cc
    bl OS_DisableIrq
    mov r4, r0
    ldr r1, _LIT0
    add r0, sp, #0x0
    mov r2, #0x14
    bl func_0207850c
    mov r1, r6
    mov r2, r5
    add r0, sp, #0x0
    bl func_0207850c
    ldr r1, _LIT0
    add r0, sp, #0x0
    bl func_02078498
    mov r0, r4
    bl OS_RestoreIrq
    ldr r0, _LIT1
    mov r1, #0x1
    strb r1, [r0]
    add sp, sp, #0x60
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a0708
_LIT1: .word data_021a0700
