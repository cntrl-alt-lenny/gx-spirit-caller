; func_0207ce50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207ce90
        .global func_0207ce50
        .arm
func_0207ce50:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0207ce90
    mov r1, #0x0
    cmp r0, #0x1c
    movcs r1, #0x3
    bcs .L_2a0
    cmp r0, #0x16
    movcs r1, #0x2
    bcs .L_2a0
    cmp r0, #0x10
    movcs r1, #0x1
.L_2a0:
    mov r0, r1
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
