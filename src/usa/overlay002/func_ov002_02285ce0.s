; func_ov002_02285ce0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd63c
        .extern func_ov002_0228376c
        .extern func_ov002_022847d0
        .global func_ov002_02285ce0
        .arm
func_ov002_02285ce0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_ov002_0228376c
    ldr r3, _LIT0
    mov r0, r7
    mov r1, r6
    mov r2, r5
    str r4, [sp]
    bl func_ov002_022847d0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cd63c
