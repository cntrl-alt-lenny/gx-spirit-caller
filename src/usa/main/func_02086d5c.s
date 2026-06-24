; func_02086d5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02086d5c
        .arm
func_02086d5c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov r2, #0x1000
    str r2, [r0]
    str r2, [r0, #0x14]
    mov lr, #0x0
    str lr, [r0, #0x4]
    ldr r2, [r1, #0x24]
    ldrh r3, [r1, #0x2c]
    rsb r2, r2, #0x0
    ldr ip, [r1, #0x28]
    mul r2, r3, r2
    mov r2, r2, lsl #0x4
    str r2, [r0, #0x30]
    ldrh r1, [r1, #0x2e]
    rsb r2, ip, #0x0
    rsb r1, r1, #0x0
    mul r2, r1, r2
    mov r1, r2, lsl #0x4
    str r1, [r0, #0x34]
    str lr, [r0, #0x10]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
