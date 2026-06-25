; func_0203db20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c80c
        .extern func_0207b510
        .extern func_0207b544
        .extern func_0207b7a0
        .extern func_0207bb38
        .extern func_0207bde0
        .extern func_0207c124
        .global func_0203db20
        .arm
func_0203db20:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0207b510
    cmp r0, #0xc
    addls pc, pc, r0, lsl #0x2
    b .L_94
    b .L_4c
    b .L_58
    b .L_94
    b .L_60
    b .L_94
    b .L_94
    b .L_68
    b .L_94
    b .L_94
    b .L_70
    b .L_94
    b .L_80
    b .L_78
.L_4c:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmfd sp!, {pc}
.L_58:
    bl func_0207c124
    b .L_94
.L_60:
    bl func_0207bde0
    b .L_94
.L_68:
    bl func_0207bb38
    b .L_94
.L_70:
    bl func_0207b7a0
    b .L_94
.L_78:
    bl func_0207b544
    b .L_94
.L_80:
    mov r0, #0x0
    bl func_0203c80c
    add sp, sp, #0x4
    mvn r0, #0x0
    ldmfd sp!, {pc}
.L_94:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {pc}
