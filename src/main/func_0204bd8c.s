; func_0204bd8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .extern func_02062530
        .global func_0204bd8c
        .arm
func_0204bd8c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_020498f0
    mov r1, #0x2
    strb r1, [r0, #0x1a8]
    bl func_020498f0
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_02062530
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1a8]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
