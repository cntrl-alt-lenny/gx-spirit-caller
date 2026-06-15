; func_0209703c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0209703c
        .arm
func_0209703c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r2, [r0, #0x2c]
    ldr r3, [r0, #0x38]
    ldr lr, [r0, #0x8]
    ldr r1, [r0, #0x30]
    add ip, r2, r3
    str ip, [r0, #0x2c]
    ldr ip, [lr, #0x48]
    mov r0, lr
    blx ip
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
