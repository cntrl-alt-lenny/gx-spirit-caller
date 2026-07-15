; func_020489c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff920
        .extern data_0219dc80
        .extern func_02048880
        .extern func_02055a84
        .global func_020489c4
        .arm
func_020489c4:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r1, r0
    ldr r0, [r2]
    ldr r2, _LIT1
    ldr r0, [r0, #0x4]
    bl func_02055a84
    mov r4, r0
    bl func_02048880
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219dc80
_LIT1: .word data_020ff920+0x4
