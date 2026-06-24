; func_0204925c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba0
        .extern func_0204844c
        .extern func_02055bfc
        .global func_0204925c
        .arm
func_0204925c:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    ldr r2, _LIT0
    ldr r2, [r2]
    ldr r2, [r2, #0x18]
    cmp r2, #0x0
    addeq sp, sp, #0xc
    ldmeqfd sp!, {pc}
    ldr r3, _LIT1
    mov r2, #0x0
    str r3, [sp]
    str r2, [sp, #0x4]
    ldr r1, [r1]
    mov r3, r2
    bl func_02055bfc
    add sp, sp, #0xc
    ldmfd sp!, {pc}
_LIT0: .word data_0219dba0
_LIT1: .word func_0204844c
