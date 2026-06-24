; func_02073fa0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101dc0
        .extern data_0219efd8
        .extern data_0219f098
        .extern func_02091734
        .global func_02073fa0
        .arm
func_02073fa0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, _LIT0
    ldr r0, _LIT1
    mov r1, r4
    str r4, [r2]
    bl func_02091734
    ldr r0, _LIT2
    mov r1, r4
    bl func_02091734
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_02101dc0
_LIT1: .word data_0219f098
_LIT2: .word data_0219efd8
