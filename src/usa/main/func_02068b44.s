; func_02068b44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ebe8
        .extern func_020545a0
        .extern func_02054610
        .global func_02068b44
        .arm
func_02068b44:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_020545a0
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    ldr r0, _LIT0
    ldr r0, [r0]
    bl func_02054610
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219ebe8
