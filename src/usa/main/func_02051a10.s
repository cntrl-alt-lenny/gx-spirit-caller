; func_02051a10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .global func_02051a10
        .arm
func_02051a10:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0204987c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    mvneq r0, #0x0
    ldmeqfd sp!, {pc}
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
