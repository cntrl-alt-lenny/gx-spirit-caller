; func_02055b90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb30
        .extern func_0205a118
        .extern func_0205ff4c
        .global func_02055b90
        .arm
func_02055b90:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    beq .L_2e8
    ldr ip, [r0]
    cmp ip, #0x0
    bne .L_2f4
.L_2e8:
    add sp, sp, #0x4
    mov r0, #0x2
    ldmfd sp!, {pc}
.L_2f4:
    ldr r3, [ip, #0x108]
    cmp r3, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmnefd sp!, {pc}
    ldr r3, [ip, #0x1d8]
    cmp r3, #0x4
    bne .L_328
    ldr r1, _LIT0
    bl func_0205ff4c
    add sp, sp, #0x4
    mov r0, #0x2
    ldmfd sp!, {pc}
.L_328:
    bl func_0205a118
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_020ffb30
