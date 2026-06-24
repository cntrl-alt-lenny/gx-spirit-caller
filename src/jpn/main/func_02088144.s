; func_02088144 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094df4
        .global func_02088144
        .arm
func_02088144:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r3, [r0, #0x48]
    sub r3, r3, #0x1
    cmp r1, r3
    addgt sp, sp, #0x4
    ldmgtfd sp!, {pc}
    add r0, r0, r1
    ldrb r0, [r0, #0x4c]
    mov r3, #0x1
    mov r1, r2
    mov r0, r3, lsl r0
    bl func_02094df4
    add sp, sp, #0x4
    ldmfd sp!, {pc}
