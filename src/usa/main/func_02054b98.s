; func_02054b98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206e6ac
        .global func_02054b98
        .arm
func_02054b98:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    add r1, sp, #0x0
    bl func_0206e6ac
    cmp r0, #0x0
    mvneq r0, #0x0
    ldrne r0, [sp]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
