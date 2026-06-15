; func_0207d4dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207d914
        .global func_0207d4dc
        .arm
func_0207d4dc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    add r1, r1, r0
    add r0, r0, #0x3
    bic r1, r1, #0x3
    bic r0, r0, #0x3
    cmp r0, r1
    bhi .L_2c
    sub r3, r1, r0
    cmp r3, #0x4c
    bcs .L_38
.L_2c:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_38:
    bl func_0207d914
    add sp, sp, #0x4
    ldmfd sp!, {pc}
