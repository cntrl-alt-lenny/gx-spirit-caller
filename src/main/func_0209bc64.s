; func_0209bc64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a8438
        .extern func_0209bdb8
        .global func_0209bc64
        .arm
func_0209bc64:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl OS_DisableIrq
    ldr r1, _LIT0
    ldr r2, [r1]
    cmp r2, #0x0
    beq .L_73c
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_73c:
    mov r2, #0x1
    str r2, [r1]
    bl OS_RestoreIrq
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x14]
    str r1, [r0, #0x18]
    str r6, [r0, #0x8]
    str r5, [r0, #0x4]
    str r4, [r0, #0x10]
    bl func_0209bdb8
    cmp r0, #0x0
    movne r0, #0x0
    moveq r0, #0x3
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a8438
