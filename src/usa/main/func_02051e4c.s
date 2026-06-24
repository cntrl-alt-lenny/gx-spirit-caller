; func_02051e4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045230
        .extern func_0204987c
        .extern func_020515a4
        .global func_02051e4c
        .arm
func_02051e4c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0204987c
    cmp r0, #0x0
    beq .L_30
    bl func_0204987c
    ldr r0, [r0, #0x1f8]
    cmp r0, #0x0
    beq .L_30
    bl func_02045230
    cmp r0, #0x0
    beq .L_3c
.L_30:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_3c:
    bl func_0204987c
    ldr r0, [r0, #0x1f8]
    bl func_020515a4
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {pc}
