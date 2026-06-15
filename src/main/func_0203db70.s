; func_0203db70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c85c
        .extern func_0207b5f8
        .extern func_0207b62c
        .extern func_0207b888
        .extern func_0207bc20
        .extern func_0207bec8
        .extern func_0207c20c
        .global func_0203db70
        .arm
func_0203db70:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0207b5f8
    cmp r0, #0xc
    addls pc, pc, r0, lsl #0x2
    b .L_524
    b .L_4dc
    b .L_4e8
    b .L_524
    b .L_4f0
    b .L_524
    b .L_524
    b .L_4f8
    b .L_524
    b .L_524
    b .L_500
    b .L_524
    b .L_510
    b .L_508
.L_4dc:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmfd sp!, {pc}
.L_4e8:
    bl func_0207c20c
    b .L_524
.L_4f0:
    bl func_0207bec8
    b .L_524
.L_4f8:
    bl func_0207bc20
    b .L_524
.L_500:
    bl func_0207b888
    b .L_524
.L_508:
    bl func_0207b62c
    b .L_524
.L_510:
    mov r0, #0x0
    bl func_0203c85c
    add sp, sp, #0x4
    mvn r0, #0x0
    ldmfd sp!, {pc}
.L_524:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {pc}
