; func_02091a8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a63c8
        .extern func_02091f88
        .extern OSi_InsertLinkToQueue
        .global func_02091a8c
        .arm
func_02091a8c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1]
    cmp r6, #0x0
    ldr r4, [r0]
    beq .L_b4
    mov r0, r6
    mov r1, r4
    str r6, [r4, #0x78]
    bl OSi_InsertLinkToQueue
.L_b4:
    mov r0, #0x0
    str r0, [r4, #0x64]
    bl func_02091f88
    mov r0, r5
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a63c8
