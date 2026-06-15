; func_02055a18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffc10
        .extern func_02056a58
        .extern func_0205ffc0
        .global func_02055a18
        .arm
func_02055a18:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    beq .L_704
    ldr r3, [r0]
    cmp r3, #0x0
    bne .L_710
.L_704:
    add sp, sp, #0x4
    mov r0, #0x2
    ldmfd sp!, {pc}
.L_710:
    ldr r2, [r3, #0x108]
    cmp r2, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmnefd sp!, {pc}
    ldr r2, [r3, #0x1d8]
    cmp r2, #0x4
    bne .L_744
    ldr r1, _LIT0
    bl func_0205ffc0
    add sp, sp, #0x4
    mov r0, #0x2
    ldmfd sp!, {pc}
.L_744:
    bl func_02056a58
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_020ffc10
