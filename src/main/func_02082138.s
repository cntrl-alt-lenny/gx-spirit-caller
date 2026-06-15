; func_02082138 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a18b8
        .extern data_021a1904
        .extern data_021a1974
        .extern data_021a19e8
        .extern data_021a1a18
        .extern func_0208b32c
        .extern func_0208b54c
        .extern func_0208b8e0
        .global func_02082138
        .arm
func_02082138:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, _LIT2
    bl func_0208b32c
    ldr r3, _LIT3
    ldr r0, _LIT2
    ldr r2, [r3, #0xf4]
    mov r1, r0
    str r2, [sp]
    ldr r2, [r3, #0xec]
    ldr r3, [r3, #0xf0]
    bl func_0208b8e0
    ldr r0, _LIT2
    ldr r1, _LIT4
    bl func_0208b54c
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_021a1974
_LIT1: .word data_021a1904
_LIT2: .word data_021a19e8
_LIT3: .word data_021a18b8
_LIT4: .word data_021a1a18
