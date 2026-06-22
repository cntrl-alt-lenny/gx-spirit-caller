; func_02032e38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02094688
        .global func_02032e38
        .arm
func_02032e38:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    bl OS_DisableIrq
    add r1, r4, #0x234
    mov r4, r0
    mov r0, r5
    add r1, r1, #0xc00
    mov r2, #0x40
    bl func_02094688
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
