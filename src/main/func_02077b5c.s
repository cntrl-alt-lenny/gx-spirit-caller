; func_02077b5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209bb60
        .extern func_0209bc20
        .extern func_0209bea0
        .global func_02077b5c
        .arm
func_02077b5c:
    stmfd sp!, {lr}
    sub sp, sp, #0x1c
    add r0, sp, #0x0
    bl func_0209bc20
    add r0, sp, #0x10
    bl func_0209bb60
    add r0, sp, #0x0
    add r1, sp, #0x10
    bl func_0209bea0
    ldr r1, _LIT0
    add r0, r0, r1
    add sp, sp, #0x1c
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word 0x386d4380
