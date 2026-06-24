; func_02070844 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a62f0
        .extern func_02070898
        .extern func_02074a50
        .global func_02070844
        .arm
func_02070844:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldr r1, [r1, #0x4]
    ldr r1, [r1, #0xa4]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    ldrb r2, [r1, #0x9]
    cmp r2, #0x0
    beq .L_5d0
    bl func_02074a50
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_5d0:
    bl func_02070898
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a62f0
