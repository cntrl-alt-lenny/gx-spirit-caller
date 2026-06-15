; func_02070d34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a63d0
        .extern func_02070d90
        .extern func_02074c74
        .global func_02070d34
        .arm
func_02070d34:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0xa4]
    cmp r0, #0x0
    beq .L_1110
    ldrb r1, [r0, #0x9]
    cmp r1, #0x0
    beq .L_1100
    bl func_02074c74
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_1100:
    bl func_02070d90
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_1110:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a63d0
