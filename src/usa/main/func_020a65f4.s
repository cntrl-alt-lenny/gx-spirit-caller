; func_020a65f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a6694
        .global func_020a65f4
        .arm
func_020a65f4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov lr, r1
    mvn ip, #0x0
    mov r3, r2
    add r1, sp, #0x0
    mov r2, lr
    str ip, [sp]
    bl func_020a6694
    ldr r0, [sp]
    mvn r0, r0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
