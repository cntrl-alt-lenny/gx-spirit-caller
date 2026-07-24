; func_0204f040 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff980
        .extern data_020ff9a0
        .extern data_020ff9ac
        .extern data_020ff9b8
        .extern data_020ff9ec
        .extern OS_SNPrintf
        .global func_0204f040
        .arm
func_0204f040:
    stmfd sp!, {lr}
    sub sp, sp, #0x24
    mov lr, #0x3
    ldr ip, _LIT0
    str lr, [sp]
    str ip, [sp, #0x4]
    str r1, [sp, #0x8]
    str r2, [sp, #0xc]
    str r2, [sp, #0x10]
    ldr r2, _LIT1
    ldr r1, _LIT2
    str r2, [sp, #0x14]
    str r3, [sp, #0x18]
    str r1, [sp, #0x1c]
    ldr r2, _LIT3
    ldr r3, _LIT4
    mov r1, #0x100
    str ip, [sp, #0x20]
    bl OS_SNPrintf
    add sp, sp, #0x24
    ldmfd sp!, {pc}
_LIT0: .word data_020ff980
_LIT1: .word data_020ff9a0
_LIT2: .word data_020ff9ac
_LIT3: .word data_020ff9ec
_LIT4: .word data_020ff9b8
