; func_02049068 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba0
        .extern func_02092fc8
        .global func_02049068
        .arm
func_02049068:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    mov r0, #0x0
    str r0, [r1, #0x8]
    bl func_02092fc8
    ldr r2, _LIT0
    ldr r2, [r2]
    str r0, [r2, #0xc]
    str r1, [r2, #0x10]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219dba0
