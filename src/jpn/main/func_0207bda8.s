; func_0207bda8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207bb38
        .extern func_0207bbf0
        .global func_0207bda8
        .arm
func_0207bda8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    beq .L_87c
    cmp r1, #0x0
    bne .L_88c
.L_87c:
    bl func_0207bb38
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_88c:
    bl func_0207bbf0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
