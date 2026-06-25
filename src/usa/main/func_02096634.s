; func_02096634 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02091924
        .global func_02096634
        .arm
func_02096634:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl OS_DisableIrq
    ldr r1, [r6]
    mov r4, r0
    ldr r0, [r6, #0x4]
    cmp r1, #0x0
    strne r0, [r1, #0x4]
    cmp r0, #0x0
    strne r1, [r0]
    mov r0, #0x0
    str r0, [r6]
    ldr r1, [r6]
    add r0, r6, #0x18
    str r1, [r6, #0x4]
    ldr r1, [r6, #0xc]
    bic r1, r1, #0x4f
    str r1, [r6, #0xc]
    str r5, [r6, #0x14]
    bl func_02091924
    mov r0, r4
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
