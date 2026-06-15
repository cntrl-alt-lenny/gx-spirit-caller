; func_02046a1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219daec
        .extern func_02046658
        .extern func_02046a5c
        .global func_02046a1c
        .arm
func_02046a1c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {pc}
    add r0, sp, #0x0
    bl func_02046a5c
    mov r1, r0
    ldr r0, [sp]
    bl func_02046658
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219daec
