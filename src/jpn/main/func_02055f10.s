; func_02055f10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffc5c
        .extern func_0205ff4c
        .global func_02055f10
        .arm
func_02055f10:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    beq .L_1c
    ldr ip, [r0]
    cmp ip, #0x0
    bne .L_28
.L_1c:
    add sp, sp, #0x4
    mov r0, #0x2
    ldmfd sp!, {pc}
.L_28:
    cmp r1, #0x0
    blt .L_38
    cmp r1, #0x6
    blt .L_4c
.L_38:
    ldr r1, _LIT0
    bl func_0205ff4c
    add sp, sp, #0x4
    mov r0, #0x2
    ldmfd sp!, {pc}
.L_4c:
    add r0, ip, r1, lsl #0x3
    str r2, [r0, #0x1a4]
    str r3, [r0, #0x1a8]
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_020ffc5c+0x4
