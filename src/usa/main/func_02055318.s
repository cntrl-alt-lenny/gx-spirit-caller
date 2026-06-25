; func_02055318 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb30
        .extern data_020ffb84
        .extern func_02056ac4
        .extern func_0205ff4c
        .global func_02055318
        .arm
func_02055318:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov r3, r2
    cmp r0, #0x0
    beq .L_20
    ldr ip, [r0]
    cmp ip, #0x0
    bne .L_2c
.L_20:
    add sp, sp, #0x4
    mov r0, #0x2
    ldmfd sp!, {pc}
.L_2c:
    ldr r2, [ip, #0x108]
    cmp r2, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmnefd sp!, {pc}
    ldr r2, [ip, #0x1d8]
    cmp r2, #0x4
    bne .L_60
    ldr r1, _LIT0
    bl func_0205ff4c
    add sp, sp, #0x4
    mov r0, #0x2
    ldmfd sp!, {pc}
.L_60:
    cmp r3, #0x0
    bne .L_7c
    ldr r1, _LIT1
    bl func_0205ff4c
    add sp, sp, #0x4
    mov r0, #0x2
    ldmfd sp!, {pc}
.L_7c:
    mov r2, #0x1
    bl func_02056ac4
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_020ffb30
_LIT1: .word data_020ffb84
