; func_02054c04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054e34
        .extern func_02094500
        .global func_02054c04
        .arm
func_02054c04:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, [sp, #0x8]
    mov r0, r3
    ldr r2, [r1]
    mov r1, #0x0
    bl func_02094500
    mov r0, #0x0
    mvn r1, #0x0
    bl func_02054e34
    add sp, sp, #0x4
    ldmfd sp!, {pc}
