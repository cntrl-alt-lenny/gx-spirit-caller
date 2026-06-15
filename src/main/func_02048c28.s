; func_02048c28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc80
        .global func_02048c28
        .arm
func_02048c28:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r3, [r1]
    ldrb r1, [r3, #0x1d]
    ldr r2, [r3, #0x30]
    ldr r3, [r3, #0x2c]
    blx r3
    ldr r0, _LIT0
    mov r1, #0x2
    ldr r0, [r0]
    str r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219dc80
