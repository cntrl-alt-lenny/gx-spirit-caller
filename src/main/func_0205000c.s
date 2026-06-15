; func_0205000c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .extern func_020673dc
        .global func_0205000c
        .arm
func_0205000c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x14]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x16]
    bl func_020498f0
    ldr r0, [r0, #0x10]
    bl func_020673dc
    add sp, sp, #0x4
    ldmfd sp!, {pc}
