; func_0203cb40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c888
        .extern func_0203c89c
        .extern func_0203c968
        .extern func_0203dc10
        .global func_0203cb40
        .arm
func_0203cb40:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0203c888
    strb r0, [sp]
    ldrb r0, [sp]
    cmp r0, #0x0
    beq .L_58
    cmp r0, #0x12
    bne .L_68
.L_58:
    bl func_0203c968
    add sp, sp, #0x4
    mov r0, #0x1
    ldmfd sp!, {pc}
.L_68:
    add r0, sp, #0x0
    bl func_0203dc10
    ldrb r0, [sp]
    bl func_0203c89c
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {pc}
