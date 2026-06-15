; func_02054840 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054700
        .global func_02054840
        .arm
func_02054840:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    ldr ip, [sp, #0x10]
    str r3, [sp]
    mov r3, r2
    mov r2, #0x4
    str ip, [sp, #0x4]
    bl func_02054700
    add sp, sp, #0xc
    ldmfd sp!, {pc}
