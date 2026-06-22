; func_0205d52c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0205d52c
        .arm
func_0205d52c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov ip, r0
    ldr r0, [r1]
    ldr r2, [r1, #0x8]
    ldr r3, [r1, #0x4]
    mov r1, ip
    blx r3
    add sp, sp, #0x4
    ldmfd sp!, {pc}
