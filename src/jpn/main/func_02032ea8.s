; func_02032ea8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02094688
        .global func_02032ea8
        .arm
func_02032ea8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r6, r1
    mov r5, r2
    bl OS_DisableIrq
    ldr r1, [r4, #0xe74]
    mov r2, #0xc
    mov r4, r0
    mla r1, r6, r2, r1
    mov r0, r5
    bl func_02094688
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
