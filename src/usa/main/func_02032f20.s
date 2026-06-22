; func_02032f20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .global func_02032f20
        .arm
func_02032f20:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl OS_DisableIrq
    str r4, [r5, #0xebc]
    bl OS_RestoreIrq
    ldmia sp!, {r3, r4, r5, pc}
