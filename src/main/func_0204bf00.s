; func_0204bf00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .extern func_0204bd8c
        .extern func_0204bf44
        .global func_0204bf00
        .arm
func_0204bf00:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_0204bd8c
    mov r0, #0x1
    bl func_0204bf44
    add sp, sp, #0x4
    ldmfd sp!, {pc}
