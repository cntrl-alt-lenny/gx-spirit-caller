; func_02073974 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee40
        .extern func_020739d8
        .extern func_020918f0
        .extern func_020919f8
        .global func_02073974
        .arm
func_02073974:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    mov ip, #0x0
    str ip, [sp]
    str ip, [sp, #0x4]
    bl func_020739d8
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    addeq sp, sp, #0xc
    ldmeqfd sp!, {lr}
    bxeq lr
    ldr r0, [r0]
    bl func_020919f8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmnefd sp!, {lr}
    bxne lr
    ldr r0, _LIT0
    ldr r0, [r0]
    bl func_020918f0
    add sp, sp, #0xc
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_0219ee40
