; func_0202c01c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6a14
        .extern data_020c6a28
        .extern data_0219a85c
        .extern func_02006bf0
        .extern func_0202c158
        .global func_0202c01c
        .arm
func_0202c01c:
    stmdb sp!, {r3, lr}
    bl func_0202c158
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldr r2, _LIT1
    mov r1, #0x4
    ldr r3, [r2]
    mov r2, #0x0
    str r0, [r3, #0x18]
    ldr r0, _LIT2
    bl func_02006bf0
    ldr r1, _LIT1
    ldr r1, [r1]
    str r0, [r1, #0x1c]
    ldmia sp!, {r3, pc}
_LIT0: .word data_020c6a14
_LIT1: .word data_0219a85c
_LIT2: .word data_020c6a28
