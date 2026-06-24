; func_0203caf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c838
        .extern func_0203c84c
        .extern func_0203c918
        .extern func_0203dbc0
        .global func_0203caf0
        .arm
func_0203caf0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0203c838
    strb r0, [sp]
    ldrb r0, [sp]
    cmp r0, #0x0
    beq .L_24
    cmp r0, #0x12
    bne .L_34
.L_24:
    bl func_0203c918
    add sp, sp, #0x4
    mov r0, #0x1
    ldmfd sp!, {pc}
.L_34:
    add r0, sp, #0x0
    bl func_0203dbc0
    ldrb r0, [sp]
    bl func_0203c84c
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {pc}
