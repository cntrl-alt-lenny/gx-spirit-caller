; func_020a1cac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a981c
        .extern func_02094688
        .extern func_020a08a8
        .global func_020a1cac
        .arm
func_020a1cac:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1]
    cmp r0, #0x0
    beq .L_7c
    mov r0, r5
    bl func_020a08a8
    cmp r0, #0x0
    beq .L_7c
    ldr r0, _LIT0
    sub r3, r5, #0x1
    ldr ip, [r0]
    ldr r1, _LIT1
    add r0, ip, #0x1340
    mov r2, #0x16
    mla r0, r3, r2, r0
    add r1, ip, r1
    bl func_02094688
    mov r0, r4
    bl OS_RestoreIrq
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r1, [r1]
    add sp, sp, #0x4
    add r0, r1, r0
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_7c:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a981c
_LIT1: .word 0x00001772
