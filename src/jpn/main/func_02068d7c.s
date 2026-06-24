; func_02068d7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02068db0
        .global func_02068d7c
        .arm
func_02068d7c:
    stmfd sp!, {lr}
    sub sp, sp, #0x14
    ldr lr, [sp, #0x18]
    ldr ip, [sp, #0x1c]
    str lr, [sp]
    str ip, [sp, #0x4]
    mov lr, #0x80
    ldr ip, [sp, #0x20]
    str lr, [sp, #0x8]
    str ip, [sp, #0xc]
    bl func_02068db0
    add sp, sp, #0x14
    ldmfd sp!, {pc}
