; func_02052e58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020534ec
        .global func_02052e58
        .arm
func_02052e58:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov r3, r0
    ldr r0, [r3, #0x1c]
    mov r2, #0x0
    mov r1, r2
    cmp r0, #0x0
    beq .L_2c
    ldr r1, [r3, #0x24]
    bl func_020534ec
    mov r2, r0
.L_2c:
    mov r0, r2
    add sp, sp, #0x4
    ldmfd sp!, {pc}
