; func_02064d14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b3988
        .global func_02064d14
        .arm
func_02064d14:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r2, [r0]
    ldrh r0, [r2, #0x4]
    ldr r2, [r2]
    mul r0, r2, r0
    bl func_020b3988
    mov r0, r1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
