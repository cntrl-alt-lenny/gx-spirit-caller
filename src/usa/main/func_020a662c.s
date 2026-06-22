; func_020a662c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a671c
        .global func_020a662c
        .arm
func_020a662c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov lr, r1
    mov ip, #0x0
    mov r3, r2
    add r1, sp, #0x0
    mov r2, lr
    strh ip, [sp]
    bl func_020a671c
    ldrh r0, [sp]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
