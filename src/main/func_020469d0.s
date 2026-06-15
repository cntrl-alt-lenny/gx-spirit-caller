; func_020469d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219daec
        .extern func_02046718
        .global func_020469d0
        .arm
func_020469d0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldr r2, [r1]
    cmp r2, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {pc}
    mov r1, #0x1
    mov r1, r1, lsl r0
    ldr r2, [r2, #0x644]
    ands r1, r2, r1
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {pc}
    bl func_02046718
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219daec
