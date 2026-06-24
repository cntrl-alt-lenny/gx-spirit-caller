; func_02098320 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a8240
        .extern data_021a8254
        .extern func_02097164
        .extern func_020971e0
        .global func_02098320
        .arm
func_02098320:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl OS_DisableIrq
    mov r5, r0
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r4, [r1]
    bl func_020971e0
    ldr r1, _LIT0
    cmp r0, #0x0
    str r6, [r1]
    beq .L_38
    ldr r0, _LIT1
    bl func_02097164
.L_38:
    mov r0, r5
    bl OS_RestoreIrq
    mov r0, r4
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a8240
_LIT1: .word data_021a8254
