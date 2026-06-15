; func_02051ec0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045280
        .extern func_020498f0
        .extern func_02051618
        .global func_02051ec0
        .arm
func_02051ec0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_020498f0
    cmp r0, #0x0
    beq .L_30
    bl func_020498f0
    ldr r0, [r0, #0x200]
    cmp r0, #0x0
    beq .L_30
    bl func_02045280
    cmp r0, #0x0
    beq .L_3c
.L_30:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_3c:
    bl func_020498f0
    ldr r0, [r0, #0x200]
    bl func_02051618
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {pc}
