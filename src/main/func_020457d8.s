; func_020457d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dad0
        .extern func_02045678
        .global func_020457d8
        .arm
func_020457d8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {pc}
    ldr r0, [r1]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {pc}
    mov r0, #0x3
    strh r0, [r1, #0x4]
    bl func_02045678
    mov r0, #0x1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219dad0
