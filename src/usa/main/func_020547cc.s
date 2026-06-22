; func_020547cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205468c
        .global func_020547cc
        .arm
func_020547cc:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    ldr ip, [sp, #0x10]
    str r3, [sp]
    mov r3, r2
    mov r2, #0x4
    str ip, [sp, #0x4]
    bl func_0205468c
    add sp, sp, #0xc
    ldmfd sp!, {pc}
