; func_020559a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb30
        .extern func_020569e4
        .extern func_0205ff4c
        .global func_020559a4
        .arm
func_020559a4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    beq .L_fc
    ldr r3, [r0]
    cmp r3, #0x0
    bne .L_108
.L_fc:
    add sp, sp, #0x4
    mov r0, #0x2
    ldmfd sp!, {pc}
.L_108:
    ldr r2, [r3, #0x108]
    cmp r2, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmnefd sp!, {pc}
    ldr r2, [r3, #0x1d8]
    cmp r2, #0x4
    bne .L_13c
    ldr r1, _LIT0
    bl func_0205ff4c
    add sp, sp, #0x4
    mov r0, #0x2
    ldmfd sp!, {pc}
.L_13c:
    bl func_020569e4
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_020ffb30
