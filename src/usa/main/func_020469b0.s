; func_020469b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da0c
        .extern func_020465b0
        .extern func_020469f0
        .global func_020469b0
        .arm
func_020469b0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {pc}
    add r0, sp, #0x0
    bl func_020469f0
    mov r1, r0
    ldr r0, [sp]
    bl func_020465b0
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219da0c
