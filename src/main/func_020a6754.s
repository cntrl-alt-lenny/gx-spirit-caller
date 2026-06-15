; func_020a6754 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a68a0
        .global func_020a6754
        .arm
func_020a6754:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov lr, r1
    mov ip, #0x0
    mov r3, r2
    add r1, sp, #0x0
    mov r2, lr
    strb ip, [sp]
    bl func_020a68a0
    ldrb r0, [sp]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
