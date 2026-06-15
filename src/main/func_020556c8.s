; func_020556c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205d6bc
        .global func_020556c8
        .arm
func_020556c8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    beq .L_3b4
    ldr r2, [r0]
    cmp r2, #0x0
    bne .L_3c0
.L_3b4:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_3c0:
    ldr r2, [r2, #0x108]
    cmp r2, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmnefd sp!, {pc}
    add r2, sp, #0x0
    bl func_0205d6bc
    cmp r0, #0x0
    beq .L_3fc
    ldr r0, [sp]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmnefd sp!, {pc}
.L_3fc:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {pc}
