; func_02087df4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c31f8
        .extern func_020951a8
        .global func_02087df4
        .arm
func_02087df4:
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
    bl func_020951a8
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_020c31f8
