; func_020492d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc80
        .extern func_020484c0
        .extern func_02055c70
        .global func_020492d0
        .arm
func_020492d0:
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
    bl func_02055c70
    add sp, sp, #0xc
    ldmfd sp!, {pc}
_LIT0: .word data_0219dc80
_LIT1: .word func_020484c0
