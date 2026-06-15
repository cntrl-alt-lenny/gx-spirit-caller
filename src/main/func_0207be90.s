; func_0207be90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207bc20
        .extern func_0207bcd8
        .global func_0207be90
        .arm
func_0207be90:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    beq .L_87c
    cmp r1, #0x0
    bne .L_88c
.L_87c:
    bl func_0207bc20
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_88c:
    bl func_0207bcd8
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
