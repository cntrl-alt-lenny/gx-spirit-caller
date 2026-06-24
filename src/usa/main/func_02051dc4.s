; func_02051dc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045230
        .extern func_02046948
        .extern func_0204987c
        .global func_02051dc4
        .arm
func_02051dc4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_02045230
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmnefd sp!, {pc}
    bl func_0204987c
    cmp r0, #0x0
    beq .L_3cc
    bl func_02046948
    cmp r0, #0x5
    bne .L_3cc
    bl func_0204987c
    ldrb r0, [r0, #0x1a1]
    cmp r0, #0x0
    beq .L_3d8
.L_3cc:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_3d8:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
