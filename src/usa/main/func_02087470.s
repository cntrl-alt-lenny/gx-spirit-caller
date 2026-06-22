; func_02087470 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094e20
        .global func_02087470
        .arm
func_02087470:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r2, [r0, #0x8]
    cmp r2, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldr r0, [r0]
    mov r2, #0x1
    mov r0, r2, lsl r0
    mov r2, #0x0
    bl func_02094e20
    add sp, sp, #0x4
    ldmfd sp!, {pc}
