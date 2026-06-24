; func_02055f78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02056034
        .global func_02055f78
        .arm
func_02055f78:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    beq .L_1a8
    ldr r1, [r0]
    cmp r1, #0x0
    bne .L_1b4
.L_1a8:
    add sp, sp, #0x4
    mov r0, #0x2
    ldmfd sp!, {pc}
.L_1b4:
    ldr r1, [r1, #0x108]
    cmp r1, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmnefd sp!, {pc}
    mov r1, #0x0
    bl func_02056034
    add sp, sp, #0x4
    ldmfd sp!, {pc}
