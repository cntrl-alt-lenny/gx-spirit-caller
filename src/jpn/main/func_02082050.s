; func_02082050 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a17d8
        .extern data_021a1824
        .extern data_021a1894
        .extern data_021a1908
        .extern data_021a1938
        .extern func_0208b244
        .extern func_0208b464
        .extern func_0208b7f8
        .global func_02082050
        .arm
func_02082050:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, _LIT2
    bl func_0208b244
    ldr r3, _LIT3
    ldr r0, _LIT2
    ldr r2, [r3, #0xf4]
    mov r1, r0
    str r2, [sp]
    ldr r2, [r3, #0xec]
    ldr r3, [r3, #0xf0]
    bl func_0208b7f8
    ldr r0, _LIT2
    ldr r1, _LIT4
    bl func_0208b464
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_021a1894
_LIT1: .word data_021a1824
_LIT2: .word data_021a1908
_LIT3: .word data_021a17d8
_LIT4: .word data_021a1938
