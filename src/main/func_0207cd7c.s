; func_0207cd7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a0890
        .extern data_021a089c
        .extern func_02092844
        .global func_0207cd7c
        .arm
func_0207cd7c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldrb r0, [r1]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    ldr r0, _LIT1
    mov r2, #0x0
    mov r3, #0x1
    strb r3, [r1]
    str r2, [r1, #0x24]
    str r2, [r1, #0x8]
    str r2, [r1, #0x4]
    bl func_02092844
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a0890
_LIT1: .word data_021a089c
