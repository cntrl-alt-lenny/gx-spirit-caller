; func_0206280c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02062a20
        .extern func_02062df8
        .global func_0206280c
        .arm
func_0206280c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r3, #0x0
    beq .L_1c
    bl func_02062df8
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_1c:
    bl func_02062a20
    add sp, sp, #0x4
    ldmfd sp!, {pc}
