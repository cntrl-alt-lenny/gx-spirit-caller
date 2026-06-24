; func_02046670 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204520c
        .extern func_020454c8
        .extern func_02045570
        .extern func_0204569c
        .global func_02046670
        .arm
func_02046670:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0204569c
    bl func_020454c8
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {pc}
    mov r0, #0x8
    mov r1, #0x0
    bl func_0204520c
    bl func_02045570
    mov r0, #0x1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
