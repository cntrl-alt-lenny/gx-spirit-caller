; func_02047fdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219db98
        .extern func_0204032c
        .extern func_02040384
        .extern func_0204543c
        .global func_02047fdc
        .arm
func_02047fdc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    beq .L_4c
    bl func_02040384
    bl func_0204032c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r1, [r1]
    mov r2, r0
    ldr r1, [r1, #0x24]
    bl func_0204543c
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x24]
.L_4c:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219db98
