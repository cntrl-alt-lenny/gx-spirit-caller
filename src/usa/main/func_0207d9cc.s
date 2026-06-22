; func_0207d9cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207daa4
        .extern func_0207db10
        .global func_0207d9cc
        .arm
func_0207d9cc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r1, #0x0
    moveq r1, #0x1
    add r1, r1, #0x3
    add r0, r0, #0x24
    cmp r2, #0x0
    bic r1, r1, #0x3
    blt .L_30
    bl func_0207db10
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_30:
    rsb r2, r2, #0x0
    bl func_0207daa4
    add sp, sp, #0x4
    ldmfd sp!, {pc}
