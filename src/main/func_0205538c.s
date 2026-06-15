; func_0205538c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffc10
        .extern data_020ffc64
        .extern func_02056b38
        .extern func_0205ffc0
        .global func_0205538c
        .arm
func_0205538c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov r3, r2
    cmp r0, #0x0
    beq .L_7c
    ldr ip, [r0]
    cmp ip, #0x0
    bne .L_88
.L_7c:
    add sp, sp, #0x4
    mov r0, #0x2
    ldmfd sp!, {pc}
.L_88:
    ldr r2, [ip, #0x108]
    cmp r2, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmnefd sp!, {pc}
    ldr r2, [ip, #0x1d8]
    cmp r2, #0x4
    bne .L_bc
    ldr r1, _LIT0
    bl func_0205ffc0
    add sp, sp, #0x4
    mov r0, #0x2
    ldmfd sp!, {pc}
.L_bc:
    cmp r3, #0x0
    bne .L_d8
    ldr r1, _LIT1
    bl func_0205ffc0
    add sp, sp, #0x4
    mov r0, #0x2
    ldmfd sp!, {pc}
.L_d8:
    mov r2, #0x1
    bl func_02056b38
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_020ffc10
_LIT1: .word data_020ffc64
