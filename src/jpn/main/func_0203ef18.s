; func_0203ef18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c80c
        .extern func_0203c8b0
        .extern func_02043380
        .global func_0203ef18
        .arm
func_0203ef18:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov r0, #0x8
    bl func_0203c8b0
    bl func_02043380
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0xe
    ldmeqfd sp!, {pc}
    mov r0, #0x3
    bl func_0203c80c
    mov r0, #0x11
    add sp, sp, #0x4
    ldmfd sp!, {pc}
