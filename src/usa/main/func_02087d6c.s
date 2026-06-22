; func_02087d6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208afbc
        .global func_02087d6c
        .arm
func_02087d6c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r3, [r0]
    cmp r3, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldrb r0, [r3, #0x2c]
    cmp r0, #0x2
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    add r0, r3, #0x1c
    mov r1, r1, lsl #0x8
    bl func_0208afbc
    add sp, sp, #0x4
    ldmfd sp!, {pc}
