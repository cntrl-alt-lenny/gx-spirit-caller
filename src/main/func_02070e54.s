; func_02070e54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a63d0
        .extern func_02070ec4
        .extern func_02074dcc
        .global func_02070e54
        .arm
func_02070e54:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0xa4]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    ldrb r1, [r0, #0x9]
    cmp r1, #0x0
    beq .L_1228
    bl func_02074dcc
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_1228:
    bl func_02070ec4
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a63d0
