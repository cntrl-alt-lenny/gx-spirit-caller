; func_0206da24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02070b58
        .global func_0206da24
        .arm
func_0206da24:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldrsb r0, [r0, #0x73]
    cmp r0, #0x0
    beq .L_2fc
    cmp r0, #0x4
    movne r1, #0x0
.L_2fc:
    cmp r1, #0x0
    beq .L_308
    bl func_02070b58
.L_308:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
