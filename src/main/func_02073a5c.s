; func_02073a5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ef20
        .extern func_02073ac0
        .extern func_020919d8
        .extern func_02091ae0
        .global func_02073a5c
        .arm
func_02073a5c:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    mov ip, #0x0
    str ip, [sp]
    str ip, [sp, #0x4]
    bl func_02073ac0
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    addeq sp, sp, #0xc
    ldmeqfd sp!, {lr}
    bxeq lr
    ldr r0, [r0]
    bl func_02091ae0
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmnefd sp!, {lr}
    bxne lr
    ldr r0, _LIT0
    ldr r0, [r0]
    bl func_020919d8
    add sp, sp, #0xc
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_0219ef20
