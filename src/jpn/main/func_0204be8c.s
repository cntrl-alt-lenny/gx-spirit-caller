; func_0204be8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .extern func_0204bd18
        .extern func_0204bed0
        .global func_0204be8c
        .arm
func_0204be8c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_0204bd18
    mov r0, #0x1
    bl func_0204bed0
    add sp, sp, #0x4
    ldmfd sp!, {pc}
