; func_020986c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8320
        .extern func_0209870c
        .extern func_0209cb68
        .global func_020986c0
        .arm
func_020986c0:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    ldr ip, _LIT0
    mov lr, r1
    str ip, [sp]
    str r0, [sp, #0x4]
    mov r1, #0x1
    ldr r0, _LIT1
    str r1, [sp, #0x8]
    mov r1, r2
    ldr r0, [r0]
    mov r2, lr
    bl func_0209cb68
    mov r0, #0x6
    add sp, sp, #0xc
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word func_0209870c
_LIT1: .word data_021a8320
