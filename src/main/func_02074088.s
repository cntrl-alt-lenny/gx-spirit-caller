; func_02074088 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101ea0
        .extern data_0219f0b8
        .extern data_0219f178
        .extern func_0209181c
        .global func_02074088
        .arm
func_02074088:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, _LIT0
    ldr r0, _LIT1
    mov r1, r4
    str r4, [r2]
    bl func_0209181c
    ldr r0, _LIT2
    mov r1, r4
    bl func_0209181c
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_02101ea0
_LIT1: .word data_0219f178
_LIT2: .word data_0219f0b8
