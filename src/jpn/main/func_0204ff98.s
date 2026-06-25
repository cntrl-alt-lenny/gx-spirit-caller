; func_0204ff98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .extern func_02067368
        .global func_0204ff98
        .arm
func_0204ff98:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x14]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x16]
    bl func_0204987c
    ldr r0, [r0, #0x10]
    bl func_02067368
    add sp, sp, #0x4
    ldmfd sp!, {pc}
