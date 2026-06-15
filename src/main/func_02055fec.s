; func_02055fec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020560a8
        .global func_02055fec
        .arm
func_02055fec:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    beq .L_cd8
    ldr r1, [r0]
    cmp r1, #0x0
    bne .L_ce4
.L_cd8:
    add sp, sp, #0x4
    mov r0, #0x2
    ldmfd sp!, {pc}
.L_ce4:
    ldr r1, [r1, #0x108]
    cmp r1, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmnefd sp!, {pc}
    mov r1, #0x0
    bl func_020560a8
    add sp, sp, #0x4
    ldmfd sp!, {pc}
