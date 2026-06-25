; func_0203cb70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c838
        .extern func_0203dddc
        .global func_0203cb70
        .arm
func_0203cb70:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0203c838
    cmp r0, #0x1
    addls sp, sp, #0x4
    movls r0, #0x0
    ldmlsfd sp!, {pc}
    cmp r0, #0x7
    addcc sp, sp, #0x4
    movcc r0, #0x1
    ldmccfd sp!, {pc}
    cmp r0, #0x9
    addeq sp, sp, #0x4
    moveq r0, #0x4
    ldmeqfd sp!, {pc}
    cmp r0, #0xa
    addcc sp, sp, #0x4
    movcc r0, #0x2
    ldmccfd sp!, {pc}
    cmp r0, #0xb
    addeq sp, sp, #0x4
    moveq r0, #0x4
    ldmeqfd sp!, {pc}
    cmp r0, #0x10
    addcc sp, sp, #0x4
    movcc r0, #0x3
    ldmccfd sp!, {pc}
    cmp r0, #0x10
    addeq sp, sp, #0x4
    moveq r0, #0x5
    ldmeqfd sp!, {pc}
    cmp r0, #0x11
    addeq sp, sp, #0x4
    moveq r0, #0x4
    ldmeqfd sp!, {pc}
    bl func_0203dddc
    add sp, sp, #0x4
    ldmfd sp!, {pc}
