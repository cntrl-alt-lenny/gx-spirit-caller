; func_02079ddc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02079e20
        .global func_02079ddc
        .arm
func_02079ddc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    sub r2, r1, #0x1
    mov r2, r2, lsl #0x1
    ldrh r2, [r0, r2]
    ands r2, r2, #0x8000
    addne sp, sp, #0x4
    mvnne r0, #0x0
    ldmnefd sp!, {lr}
    bxne lr
    bl func_02079e20
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
