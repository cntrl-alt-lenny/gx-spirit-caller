; func_02070c4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a62f0
        .extern func_02070ca8
        .extern func_02074b8c
        .global func_02070c4c
        .arm
func_02070c4c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0xa4]
    cmp r0, #0x0
    beq .L_48
    ldrb r1, [r0, #0x9]
    cmp r1, #0x0
    beq .L_38
    bl func_02074b8c
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_38:
    bl func_02070ca8
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_48:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a62f0
