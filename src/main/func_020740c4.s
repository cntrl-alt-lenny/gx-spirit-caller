; func_020740c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ef20
        .extern data_0219ef24
        .extern data_0219ef28
        .extern data_0219f0b8
        .extern data_0219f178
        .extern func_02074134
        .extern func_02074498
        .extern func_02091af4
        .extern func_02091b5c
        .global func_020740c4
        .arm
func_020740c4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_02074134
    ldr r0, _LIT0
    bl func_02091af4
    ldr r0, _LIT1
    bl func_02091b5c
    ldr r1, _LIT2
    mov r0, #0x0
    str r0, [r1]
    bl func_02074498
    ldr r1, _LIT3
    mov r2, #0x0
    ldr r0, _LIT4
    str r2, [r1]
    str r2, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_0219f0b8
_LIT1: .word data_0219f178
_LIT2: .word data_0219ef20
_LIT3: .word data_0219ef24
_LIT4: .word data_0219ef28
