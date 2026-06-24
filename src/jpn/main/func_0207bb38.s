; func_0207bb38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a07ac
        .extern func_0207af50
        .global func_0207bb38
        .arm
func_0207bb38:
    stmdb sp!, {r4, lr}
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    cmp r1, #0x0
    bne .L_620
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, lr}
    bx lr
.L_620:
    add r1, r1, #0x2000
    ldr r1, [r1, #0x260]
    cmp r1, #0x3
    beq .L_674
    cmp r1, #0x6
    beq .L_644
    cmp r1, #0x7
    beq .L_664
    b .L_684
.L_644:
    mov r0, #0x7
    bl func_0207af50
    ldr r0, _LIT0
    mov r1, #0x4
    ldr r0, [r0]
    add r0, r0, #0x2200
    strh r1, [r0, #0x80]
    b .L_694
.L_664:
    bl OS_RestoreIrq
    mov r0, #0x2
    ldmia sp!, {r4, lr}
    bx lr
.L_674:
    bl OS_RestoreIrq
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
.L_684:
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, lr}
    bx lr
.L_694:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x3
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a07ac
