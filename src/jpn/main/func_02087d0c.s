; func_02087d0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3104
        .extern func_020950b4
        .global func_02087d0c
        .arm
func_02087d0c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldr r3, _LIT0
    mov r2, r2, lsl #0x1
    ldrb r0, [r0, #0x3c]
    ldrsh r2, [r3, r2]
    bl func_020950b4
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_020c3104
